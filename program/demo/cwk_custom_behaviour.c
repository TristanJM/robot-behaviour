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

#define TURN_AGGRESSION       1     // Changes how quickly the robot turns to get back on track when wall following

#define SENSOR_DROPOFF_THRESHOLD   0     // How low a sensor needs to be before considering dropped off
#define SENSOR_DROPOFF_TIME        10      // How many cycles a sensor needs to be dropped off for before turning

#define BIAS_SPEED      	350		// robot bias speed
#define SENSOR_THRESHOLD	300		// discount sensor noise below threshold
#define MAXSPEED 			800		// maximum robot speed

// colour detection
char fbwbufferCustom[160];
int numbufferCustom[80];
int red_level, green_level, blue_level;

// sensors
int follow_sensorzeroCustom[8];
int follow_weightleftCustom[8] = {-10, -10, -5, 0, 0, 5, 10, 10};
int follow_weightrightCustom[8] = {10, 10, 5, 0, 0, -5, -10, -10};

// Custom behaviour: Santa delivering presents to homes.
// Follows corridor/road straight, ignoring any right angle turnings (using side IR sensors
// to control distance between walls).
// If it sees red ahead, stop and wait.
// If it sees green ahead, carry on through paper.
// If it sees blue ahead, rotate 180 and follow road back, make first 90 degree turning off.
void run_custom() {
    int distances[8]; // array keeping the distance sensor readings
    int i;
    int primary_colour;
    int leftwheel;
    int rightwheel;
    int state;
    int sensor_difference;
    int left_sensor_drop_cycles = 0;
    int right_sensor_drop_cycles = 0;

    e_init_port();
    e_init_uart1();
    e_init_ad_scan(ALL_ADC);
	e_init_motors();
	e_start_agendas_processing();
	e_calibrate_ir();
    
    // camera set up
    e_poxxxx_init_cam();
    e_poxxxx_config_cam(0, (ARRAY_HEIGHT - 4) / 2, 640, 4, 8, 4, RGB_565_MODE);
    e_poxxxx_write_cam_registers();
    
    // Start by following both walls.
    state = FOLLOW_BOTH_WALLS;

    
    while (1) {
               
        // Clear LEDs
        e_led_clear();
        
        /*
        // Get levels from camera
        update_levels();
        
        // Get dominant colour
        primary_colour = get_dominant_rgb(red_level, green_level, blue_level);
        
        
        // React to colour
        if (primary_colour == 1) {
            // RED DETECTED
            e_set_led(4, 1);    
            state = STOP_MOVING;
        } else if (primary_colour == 2) {
            // GREEN DETECTED
            state = POWER_THROUGH;
        } else if (primary_colour == 3) {
            // BLUE DETECTED
            state = TURN_AROUND;
        } else {
            // NO COLOUR (DEBUG ONLY)
        }
        */
        
        leftwheel = 0;
        rightwheel = 0;    
        
        /* Update Proximity Sensor value array, also turn on LEDs if detected */
		for(i=0; i<8; i++){
			distances[i] = e_get_prox(i);
			if(distances[i] > 250){
				e_set_led(i, 1);
			} else {
				e_set_led(i, 0);
			}
		}
        
        
        if( state == FOLLOW_BOTH_WALLS || state == TURN_NEXT ){
            // If we're supposed to be following both walls, make sure IR6 and IR1 are similar
            leftwheel = BIAS_SPEED;
            rightwheel = BIAS_SPEED;
            
            // - difference means facing too far right, + too far left 
            sensor_difference = distances[6] - distances[1];
            
            // Adjust wheel speeds to correct for difference in sensor value
            rightwheel -= sensor_difference * TURN_AGGRESSION;
            leftwheel  += sensor_difference * TURN_AGGRESSION;
            

            //Check if the left side sensor is dropped off (indicating a corner))
            if(distances[5] <= SENSOR_DROPOFF_THRESHOLD){
                
                // Increase the count for the number of cycles this has been the case
                left_sensor_drop_cycles++;
                
                //Check if this has been the case for a significant amount of time
                if(left_sensor_drop_cycles >= SENSOR_DROPOFF_TIME){
                    
                    //If we're NOT supposed to be turning
                    if(state == FOLLOW_BOTH_WALLS){
                        power_forward(1000000); //Move forward for 1000000us (1s)
                        left_sensor_drop_cycles = 0; //Reset the sensor drop count
                    }
                    
                    //If we ARE supposed to be turning
                    if(state == TURN_NEXT){
                        rotate_robot(-90); //Turn left
                        power_forward(1000000); //Move forward for 1000000us (1s)
                        left_sensor_drop_cycles = 0; //Reset the sensor drop count
                        state = FOLLOW_BOTH_WALLS; //Now that we've turned, follow both walls again
                    }   
                }
            } else {
                // Reset drop count to 0 when the sensor comes back
                left_sensor_drop_cycles = 0;
            }
            
            
            
            // Check if right side sensor is dropped off (indicating a corner)
            if(distances[2] <= SENSOR_DROPOFF_THRESHOLD){
                
                // Increase the count for the number of cycles this has been the case
                right_sensor_drop_cycles++;
                
                //Check if this has been the case for a significant amount of time
                if(right_sensor_drop_cycles >= SENSOR_DROPOFF_TIME){
                    
                    //If we're NOT supposed to be turning
                    if(state == FOLLOW_BOTH_WALLS){
                        power_forward(1000000); //Move forward for 1000000us (1s)
                        right_sensor_drop_cycles = 0; //Reset the sensor drop count
                    }
                    
                    //If we ARE supposed to be turning
                    if(state == TURN_NEXT){
                        rotate_robot(90); //Turn right
                        power_forward(1000000); //Move forward for 1000000us (1s)
                        right_sensor_drop_cycles = 0; //Reset the sensor drop count
                        state = FOLLOW_BOTH_WALLS; //Now that we've turned, follow both walls again
                    }        
                }
            } else {
                // Reset drop count to 0 when the sensor comes back
                right_sensor_drop_cycles = 0;
            }  
        }
        
        
             
        
        
        
        // TODO:
        // Check "distances" for left and right sensor
        
        // Adjust robot pos so they are kept roughly the same
        
        // If there is a turning (ie. no sensor activation on one side for multiple iterations):
        // Then, if waiting_for_turn == 0, go straight
        // Or, if waiting_for_turn == 1, rotate_robot(90 or 270)
        
        /*
        // EXAMPLE: This code stopped the bot if it detected an object in any of the 8 IR sensors

        getSensorValues(distances); // read sensor values
        for (i=0; i<8; i++) {
            if (distances[i] > 50) { break; }
        }
        if (i == 8) { // go straight }
        else { // stop }
        */

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
		dominant = get_dominant_rgb(red, green, blue);

		// Add 1 to whatever is the dominant colour
		if( dominant == 1 ) red_level++;
		if( dominant == 2 ) green_level++;
		if( dominant == 3 ) blue_level++;

    }
}

// Return 1,2,3 depending on whether the screen is predominantly red, green or blue. Or, 0.
int get_dominant_rgb(int r, int g, int b){
	if(r > g && r > b) return 1;    //Predominantly red
	if(g > r && g > b) return 2;    //Predominantly green
	if(b > r && b > g) return 3;    //Predominantly blue
	return 0;              	        //Freak situation where they're equal
}

// Read sensor proximities
void getSensorValues(int *sensorTable) {
    unsigned int i;
    for (i = 0; i < 8; i++) {
        sensorTable[i] = e_get_calibrated_prox(i); //e_get_prox(i) - follow_sensorzeroCustom[i];
    }
}

void rotate_robot(int angle) {
    
    //If the angle is 90, turn right for 330 steps
    if(angle == 90){
        e_set_steps_right(0);
        while(e_get_steps_right() < 330){
            followsetSpeedGS(100, -100);
        }
    }
    
    //If the angle is -90, turn left 330 steps
    if(angle == -90){
        e_set_steps_left(0);
        while(e_get_steps_left() < 330){
            followsetSpeedGS(-100, 100);
        }
    }
    
    //If the angle is 180, turn right for a 660 steps
    if(angle == 180){
        e_set_steps_right(0);
        while(e_get_steps_right() < 660){
            followsetSpeedGS(100, -100);
        }
    }
    
}

void power_forward(int time){
    //Set both wheels to full speed
    followsetSpeedGS(MAXSPEED, MAXSPEED);
    //Hang our program for time uS
    wait(time);
}