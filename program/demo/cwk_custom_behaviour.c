#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "../../library/motor_led/e_epuck_ports.h"
#include "../../library/motor_led/e_init_port.h"
#include "../../library/motor_led/advance_one_timer/e_agenda.h"
#include "../../library/motor_led/advance_one_timer/e_led.h"
#include "../../library/motor_led/advance_one_timer/e_motors.h"
#include "../../library/uart/e_uart_char.h"
#include "../../library/a_d/advance_ad_scan/e_ad_conv.h"
#include "../../library/a_d/advance_ad_scan/e_prox.h"
#include "../../library/camera/fast_2_timer/e_poxxxx.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "a_d/advance_ad_scan/e_prox.h"

#include "utility.h"
#include "runwallfollow.h"
#include "runfollowball.h"
#include "cwk_goal_seek.h"
#include "runlocatesound.h"

#define PI 3.1415

#define LEFT_FOLLOW			0		// behaviors IDs	
#define RIGHT_FOLLOW		1 

// State machine states
#define STOP_MOVING           0     // Just don't move at all
#define POWER_THROUGH         1     // Move forward, ignoring front proximity sensor
#define TURN_NEXT             2     // Move forward, when one prox sensor drops off, transition into FOLLOW_[missing]_WALL
#define FOLLOW_RIGHT_WALL     3     // Hug the right wall, until the left prox sensor comes back
#define FOLLOW_LEFT_WALL      4     // Hug the left wall, until the right prox sensor comes back
#define FOLLOW_BOTH_WALLS     5     // Move forward keeping distance from both walls. If one prox sensor drops off, transition into FOLLOW_[remaining]_WALL
#define TURN_AROUND           6     // Rotate until the sensors equalise and then transition to TURN_NEXT

#define TURN_AGGRESSION       0.1     // Changes how quickly the robot turns to get back on track when wall following

#define LEFT_SENSOR_DROPOFF_THRESHOLD    70    // How low left sensor needs to be before considering dropped off
#define RIGHT_SENSOR_DROPOFF_THRESHOLD   70    // How low right sensor needs to be before considering dropped off
#define LEFT_SENSOR_DROPOFF_TIME    15    // How many cycles the left sensor needs to be dropped off for before turning
#define RIGHT_SENSOR_DROPOFF_TIME    5    // How many cycles the right sensor needs to be dropped off for before turning
#define POWER_THROUGH_TIME         200     // Cycles to power forward and not check sensors/camera

#define BIAS_SPEED      	350		// robot bias speed
#define SENSOR_THRESHOLD	300		// discount sensor noise below threshold
#define MAXSPEED 			800		// maximum robot speed

#define COL_DIFF_AMOUNT     30      // eg. red is detected if this much more than blue and green)

// colour detection
char fbwbufferCustom[160];
int numbufferCustom[80];
int red_level, green_level, blue_level;

int red_gain;
int blue_gain;

int debug[150];

// sensors
int follow_sensorzeroCustom[8];
int follow_weightleftCustom[8] = {-10, -10, -5, 0, 0, 5, 10, 10};
int follow_weightrightCustom[8] = {10, 10, 5, 0, 0, -5, -10, -10};

// Custom behaviour: Santa delivering presents to homes.
// Follows corridor/road straight, ignoring any right angle turnings (using side IR sensors
// to control distance between walls).
// If it sees red ahead, stop and wait.
// If it sees green ahead, power-through.
// If it sees blue ahead, rotate 180 and follow road back, make first 90 degree turning off.
void run_custom() {
    int distances[8]; // Will store the average of all the distances
    int distances_avg0[8]; // n-1 average reading (Latest)
    int distances_avg1[8]; // n-2 average reading
    int distances_avg2[8]; // n-3 average reading
    int distances_avg3[8]; // n-4 average reading
    int distances_avg4[8]; // n-5 average reading (Oldest)
    int i;
    int j;
    int primary_colour;
    int leftwheel;
    int rightwheel;
    int state;
    int sensor_difference;
    int left_sensor_drop_cycles = 0;
    int right_sensor_drop_cycles = 0;
    int power_through_cycles = 0;
    
    // Hold IR sensor distances (non calibrated)
    int left_distance = 0;
    int right_distance = 0;
    int front_l_distance = 0;
    int front_r_distance = 0;
    
    int right_sensor_avg;
    int left_sensor_avg;
    int dropoff_side;
    
    int camera_calibrated = 0;

    e_init_port();
    e_init_uart1();
    e_init_ad_scan(ALL_ADC);
	e_init_motors();
	e_start_agendas_processing();
	e_calibrate_ir();
    
    // Turn off auto white balance
    e_poxxxx_set_awb_ae(0, 1);  // <-- If it crashes, move this after e_poxxx_write_cam_registers, and anywhere between (not sure where it's meant to go)
    
    // camera set up
    e_poxxxx_init_cam();
    e_poxxxx_config_cam(0, (ARRAY_HEIGHT - 4) / 2, 640, 4, 8, 4, RGB_565_MODE);
    e_poxxxx_write_cam_registers();
    
    // Start by following both walls.
    state = FOLLOW_BOTH_WALLS;    
    
    // Calibrate the white balance on the camera...
    // It does this by increasing the red gain from 0..255, then blue from 0..255, until the camera DOESN'T see a key colour.
    while( camera_calibrated == 0 ){
        // Set the gain
        e_poxxxx_set_rgb_gain(red_gain, 0, blue_gain);
        // Grab a frame
        update_levels();
        
        // Check whether we're calibrated yet
        if( get_dominant_rgb(red_level, green_level, blue_level, 1) != 0 ){
            
            if(red_gain == 0 && blue_gain == 0){  
                // If we just started, start by increasing red_gain
                red_gain ++;
                
            } else if(red_gain == 255){ 
                // If red is at the max, set red back to 0 and start increasing blue.
                red_gain = 0;
                blue_gain = 1;
                
            } else if(red_gain > 0){  
                // If we're increasing red right now, keey increasing red
                red_gain ++;
                
            } else if(blue_gain > 0){
                
                // If we're increasing blue rn, keep increasing blye
                blue_gain ++;
                
            } else if(blue_gain == 255){    
                //If blue gain is at its max,
                //Something is super wrong if we get here...
                //So just turn auto wb back on and meh
                e_poxxxx_set_awb_ae(1, 1);
                camera_calibrated = 1;
                
                // Turn all the leds on to signal that we're turning auto whitebalance back on
                e_set_led(0,1);
                e_set_led(1,1);
                e_set_led(2,1);
                e_set_led(3,1);
                e_set_led(4,1);
                e_set_led(5,1);
                e_set_led(6,1);
                e_set_led(7,1);   
            }     
        } else {
            camera_calibrated = 1;
            e_set_led(1,1);
            e_set_led(3,1);
            e_set_led(5,1);
            e_set_led(7,1);
            wait(1000000);
        }    
    } 

    // Main loop of program
    while (1) {
        e_led_clear();
        leftwheel = 0;
        rightwheel = 0;  

        if (state == POWER_THROUGH) {
            left_sensor_drop_cycles = 0;
            right_sensor_drop_cycles = 0;
            e_set_body_led(1);
            if (power_through_cycles <= POWER_THROUGH_TIME) {
                if (power_through_cycles == 0) {
                    sprintf(debug, "Starting Power-Through.\r\n");
                    e_send_uart1_char(debug, strlen(debug));
                }
                power_through_cycles++;
                // Only go forwards if there's nothing directly in front
                int frontR = e_get_prox(0);
                int frontL = e_get_prox(7);
                if (frontR < 400 && frontL < 400) followsetSpeedGS(BIAS_SPEED, BIAS_SPEED);
                else if (frontR > frontL) followsetSpeedGS(0, BIAS_SPEED);   // turn left slightly
                else if (frontL >= frontR) followsetSpeedGS(BIAS_SPEED, 0);  // turn right slightly
                else followsetSpeedGS(0, 0);
                wait(10000);
            } else {
                power_through_cycles = 0;
                state = FOLLOW_BOTH_WALLS;
                sprintf(debug, "Ending Power-Through.\r\n");
                e_send_uart1_char(debug, strlen(debug));
            }
            e_set_body_led(0);
            continue;
        }
        
        // Shuffle averages arrays along
        for(i=0; i<8; i++){
            distances_avg4[i] = distances_avg3[i];
            distances_avg3[i] = distances_avg2[i];
            distances_avg2[i] = distances_avg1[i];
            distances_avg1[i] = distances_avg0[i];
        }
        
        // Read calibrated sensor values
        followGetSensorValuesGS(distances_avg0);
        
        // Update the distances[] array used by wall follow to actually be an average of the last 5 readings (with the most recent readings more weighted)
        for(i=0; i<8; i++){
            distances[i] = (distances_avg4[i] + distances_avg3[i] + distances_avg2[i] + (2 * distances_avg1[i]) + (15 * distances_avg0[i]) ) / 20;
        }

        // Read non-calibrated Left/Right sensors
        right_distance = e_get_prox(2);
        left_distance = e_get_prox(5);
        front_l_distance = e_get_prox(7);
        front_r_distance = e_get_prox(0);
        
        // Get levels from camera
        update_levels();

        // Get dominant colour
        primary_colour = get_dominant_rgb(red_level, green_level, blue_level, 1);

        // React to colour
        if (primary_colour == 1) {
            // RED DETECTED  
            state = STOP_MOVING;
        } else if (primary_colour == 2) {
            // GREEN DETECTED
            state = POWER_THROUGH;
        } else if (primary_colour == 3) {
            // BLUE DETECTED
            e_set_led(1, 1);
            turn_to_direction(PI);
            wait(100000);
            state = TURN_NEXT;   // temp
        } else {
            // NO COLOUR (DEBUG ONLY)
        }

        // Left/Right LEDs if walls detected (5 == left)
        if (distances[5] > 50) e_set_led(6, 1);
        else e_set_led(6, 0);
        if (distances[2] > 50) e_set_led(2, 1);
        else e_set_led(2, 0);

        if (state == STOP_MOVING) e_set_led(4, 1);
        
        if (state == TURN_NEXT) e_set_led(1, 1);
        
        if (state == FOLLOW_BOTH_WALLS || state == TURN_NEXT) {
            leftwheel = BIAS_SPEED;
            rightwheel = BIAS_SPEED;

            // Fix wallfollow headbutting a wall
            if (e_get_calibrated_prox(7) > 250 && e_get_calibrated_prox(0) > 250) {
                // if we are almost facing wall head-on, still favouring direction of travel
                // turn slightly
                if (e_get_calibrated_prox(7) > e_get_calibrated_prox(0)) { leftwheel *= 1.5; rightwheel *= 0.5; }; // Right slightly
                if (e_get_calibrated_prox(0) > e_get_calibrated_prox(7)) { leftwheel *= 0.5; rightwheel *= 1.5; }; // Left slightly
            }
               
            if (state == TURN_NEXT) {
                // Follow the right wall
                follow_weightleftCustom[0] = -10;
                follow_weightleftCustom[7] = -10;
                follow_weightrightCustom[0] = 10;
                follow_weightrightCustom[7] = 10;
                if (distances[2] > 300) {   // right side sensor?
                    distances[1] -= 200;
                    distances[2] -= 600;
                    distances[3] -= 100;
                }
            }
            
            if(state == FOLLOW_BOTH_WALLS){
                // If we're supposed to be following both walls, make sure IR6 and IR1 are similar
                leftwheel = MAXSPEED;
                rightwheel = MAXSPEED;
                
                // - difference means facing too far right, + too far left 
                sensor_difference = e_get_calibrated_prox(6) - e_get_calibrated_prox(1);
                
                // Adjust wheel speeds to correct for difference in sensor value
                rightwheel -= sensor_difference * TURN_AGGRESSION;
                leftwheel  += sensor_difference * TURN_AGGRESSION;
            }

            for (i = 0; i < 8; i++) {
                leftwheel += follow_weightleftCustom[i]*(distances[i] >> 4);
                rightwheel += follow_weightrightCustom[i]*(distances[i] >> 4);
            }

            // Check if the LEFT/RIGHT side sensors are dropped off (indicating a corner)
            left_sensor_avg = ( 2*e_get_calibrated_prox(5) + e_get_calibrated_prox(6) ) / 3;
            right_sensor_avg = ( 2*e_get_calibrated_prox(2) + e_get_calibrated_prox(1) ) / 3;
            sprintf(debug, "LAvg:%i, RAvg:%i.\r\n", left_sensor_avg, right_sensor_avg);
            e_send_uart1_char(debug, strlen(debug));
            
            // LEFT DROP-OFF SIDE
            if (left_sensor_avg < right_sensor_avg && left_sensor_avg <= LEFT_SENSOR_DROPOFF_THRESHOLD) {
                left_sensor_drop_cycles++;
                
                sprintf(debug, "Left drop_cycles = %i.\r\n", left_sensor_drop_cycles);
                e_send_uart1_char(debug, strlen(debug));

                // Drop-off continual detection?
                if (left_sensor_drop_cycles == LEFT_SENSOR_DROPOFF_TIME) {

                    // Don't turn
                    if (state == FOLLOW_BOTH_WALLS) state = POWER_THROUGH;

                    // Turn
                    if (state == TURN_NEXT) {
                        sprintf(debug, "TURNING LEFT (L Avg:%i).\r\n", left_sensor_avg);
                        e_send_uart1_char(debug, strlen(debug));
                        //Power forward a little before turning
                        followsetSpeedGS(MAXSPEED, MAXSPEED);
                        wait(20000);
                        turn_to_direction(3*(PI/2)); // Turn left
                        wait(50000);
                        state = POWER_THROUGH; // Move forward
                    }
                }
            }
            // RIGHT DROP-OFF SIDE
            else if (right_sensor_avg < left_sensor_avg && right_sensor_avg <= RIGHT_SENSOR_DROPOFF_THRESHOLD) {
                right_sensor_drop_cycles++;
                
                sprintf(debug, "Right drop_cycles = %i.\r\n", right_sensor_drop_cycles);
                e_send_uart1_char(debug, strlen(debug));

                // Drop-off continual detection?
                if (right_sensor_drop_cycles == RIGHT_SENSOR_DROPOFF_TIME) {

                    // Don't turn
                    if (state == FOLLOW_BOTH_WALLS) state = POWER_THROUGH;

                    // Turn
                    if (state == TURN_NEXT) {
                        sprintf(debug, "TURNING RIGHT (R Avg:%i).\r\n", right_sensor_avg);
                        e_send_uart1_char(debug, strlen(debug));

                        turn_to_direction(PI/2); // Turn right
                        wait(50000);
                        state = POWER_THROUGH; // Move forward
                    }
                }  
            } else {
                left_sensor_drop_cycles = 0;
                right_sensor_drop_cycles = 0;         
            }    
        }
        
        followsetSpeedGS(leftwheel, rightwheel);    // sets motor speed, within max limits (from cwk_goal_seek.c)

        wait(15000);
    }
}

// Update the red_ green_ and blue_level variables with whatever the camera sees
void update_levels() {
	long i;
	int red, green, blue;
	
	// Holds the dominant colour of this col
	int dominant;

	// Grab frame from camera
	e_poxxxx_launch_capture((char *) fbwbufferCustom);
	while (!e_poxxxx_is_img_ready()) {};

	// Reset red_ green_ and blue_level to 0's
	red_level = 0;
	green_level = 0;
	blue_level = 0;
	
	// Iterate over every column
     for (i = 0; i < 80; i++) {

        // RGB turned into an integer value for comparison
        red = (fbwbufferCustom[2 * i] & 0xF8);
        green = (((fbwbufferCustom[2 * i] & 0x07) << 5) | ((fbwbufferCustom[2 * i + 1] & 0xE0) >> 3));
        blue = ((fbwbufferCustom[2*i+1] & 0x1F) << 3);

        // Get the dominant colour
		dominant = get_dominant_rgb(red, green, blue, 1);

		// Add 1 to whatever is the dominant colour
		if( dominant == 1 ) red_level++;
		if( dominant == 2 ) green_level++;
		if( dominant == 3 ) blue_level++;
    }
}

// Return 1,2,3 depending on whether the screen is predominantly red, green or blue. Or, 0.
int get_dominant_rgb(int r, int g, int b, int bias){
    if (bias == 1) {
    	if(r > g+COL_DIFF_AMOUNT && r > b+COL_DIFF_AMOUNT) return 1;        //Predominantly red
        if(g > r+COL_DIFF_AMOUNT && g > b+COL_DIFF_AMOUNT) return 2;        //Predominantly green
        if(b > r+COL_DIFF_AMOUNT && b > g+COL_DIFF_AMOUNT) return 3;        //Predominantly blue
    } else {
        if(r > g && r > b) return 1;        //Predominantly red
        if(g > r && g > b) return 2;        //Predominantly green
        if(b > r && b > g) return 3;        //Predominantly blue 
    }

	return 0;              	        //Freak situation where they're equal
}

// Read sensor proximities
void getSensorValues(int *sensorTable) {
    unsigned int i;
    for (i = 0; i < 8; i++) {
        sensorTable[i] = e_get_calibrated_prox(i); //e_get_prox(i) - follow_sensorzeroCustom[i];
    }
}