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

#define SENSOR_DROPOFF_THRESHOLD   100     // How low a sensor needs to be before considering dropped off
#define SENSOR_DROPOFF_TIME        10      // How many cycles a sensor needs to be dropped off for before turning
#define POWER_THROUGH_TIME         40      // Cycles to power forward and not check sensors/camera

#define BIAS_SPEED      	250		// robot bias speed
#define SENSOR_THRESHOLD	300		// discount sensor noise below threshold
#define MAXSPEED 			800		// maximum robot speed

#define COL_DIFF_AMOUNT     20      // eg. red is detected if this much more than blue and green)

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
    int power_through_cycles = 0;
    
    // Hold IR sensor distances (non calibrated)
    int left_distance = 0;
    int right_distance = 0;

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
        e_led_clear();
        leftwheel = 0;
        rightwheel = 0;  

        if (state == POWER_THROUGH) {
            e_set_body_led(1);
            if (power_through_cycles <= POWER_THROUGH_TIME) {
                power_through_cycles++;
                followsetSpeedGS(BIAS_SPEED, BIAS_SPEED);
                wait(50000);
            } else {
                power_through_cycles = 0;
                state = FOLLOW_BOTH_WALLS;
            }
            e_set_body_led(0);
            continue;
        }
        
        // Read calibrated sensor values
        followGetSensorValuesGS(distances);

        // Read non-calibrated Left/Right sensors
        right_distance = e_get_prox(2);
        left_distance = e_get_prox(5);

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
            state = TURN_NEXT;   // temp
        } else {
            // NO COLOUR (DEBUG ONLY)
        }  

        // Left/Right LEDs if walls detected
        if (distances[5] > 500) e_set_led(6, 1);
        else e_set_led(6, 0);
        if (distances[2] > 500) e_set_led(2, 1);
        else e_set_led(2, 0);

        if (state == STOP_MOVING) {
            e_set_led(4, 1);
        }
        
        if (state == TURN_NEXT) {
            e_set_led(1, 1);
        }
        
        if (state == FOLLOW_BOTH_WALLS || state == TURN_NEXT) {
            leftwheel = BIAS_SPEED;
            rightwheel = BIAS_SPEED;

            // positive means left wall is closer than right
            // negative means right wall is closer than left
            //sensor_difference = (int) (left_distance - right_distance);

            // Adjust wheel speeds to correct for difference in sensor value
            //rightwheel -= sensor_difference * TURN_AGGRESSION;
            //leftwheel  += sensor_difference * TURN_AGGRESSION;

            // Wallfollow right
            follow_weightleftCustom[0] = -10;
            follow_weightleftCustom[7] = -10;
            follow_weightrightCustom[0] = 10;
            follow_weightrightCustom[7] = 10;
            if (distances[2] > 300) {   // right side sensor?
                distances[1] -= 200;
                distances[2] -= 600;
                distances[3] -= 100;   
            }

            for (i = 0; i < 8; i++) {
                leftwheel += follow_weightleftCustom[i]*(distances[i] >> 4);
                rightwheel += follow_weightrightCustom[i]*(distances[i] >> 4);
            }

            //Check if the LEFT side sensor is dropped off (indicating a corner))
            if (left_distance <= SENSOR_DROPOFF_THRESHOLD) {
                left_sensor_drop_cycles++;

                //Check if this has been the case for a significant amount of time
                if (left_sensor_drop_cycles >= SENSOR_DROPOFF_TIME) {

                    //If we're NOT supposed to be turning
                    if (state == FOLLOW_BOTH_WALLS) {
                        state = POWER_THROUGH; // Move forward
                        left_sensor_drop_cycles = 0;
                    }

                    //If we ARE supposed to be turning
                    if (state == TURN_NEXT) {
                        turn_to_direction(-PI/2); // Turn left
                        state = POWER_THROUGH; // Move forward
                        left_sensor_drop_cycles = 0;
                        state = FOLLOW_BOTH_WALLS; // Now that we've turned, follow both walls again
                    }
                }
            } else {
                // Reset drop count to 0 when the sensor comes back
                left_sensor_drop_cycles = 0;
            }              

            // Check if RIGHT side sensor is dropped off (indicating a corner)
            if (right_distance <= SENSOR_DROPOFF_THRESHOLD) {
                right_sensor_drop_cycles++;

                //Check if this has been the case for a significant amount of time
                if (right_sensor_drop_cycles >= SENSOR_DROPOFF_TIME) {

                    //If we're NOT supposed to be turning
                    if (state == FOLLOW_BOTH_WALLS) {
                        state = POWER_THROUGH; // Move forward
                        right_sensor_drop_cycles = 0;
                    }

                    //If we ARE supposed to be turning
                    if (state == TURN_NEXT) {
                        turn_to_direction(PI/2); // Turn right 90
                        state = POWER_THROUGH; // Move forward
                        right_sensor_drop_cycles = 0;
                        state = FOLLOW_BOTH_WALLS; // Now that we've turned, follow both walls again
                    }
                }
            } else {
                // Reset drop count to 0 when the sensor comes back
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
    // for (i = 0; i < 80; i++) {
    for (i = 20; i < 60; i++) {

        // RGB turned into an integer value for comparison
        red = (fbwbufferCustom[2 * i] & 0xF8);
        green = (((fbwbufferCustom[2 * i] & 0x07) << 5) | ((fbwbufferCustom[2 * i + 1] & 0xE0) >> 3));
        blue = ((fbwbufferCustom[2*i+1] & 0x1F) << 3);

        // Get the dominant colour
		dominant = get_dominant_rgb(red, green, blue, 0);

		// Add 1 to whatever is the dominant colour
		if( dominant == 1 ) red_level++;
		if( dominant == 2 ) green_level++;
		if( dominant == 3 ) blue_level++;
    }
}

// Return 1,2,3 depending on whether the screen is predominantly red, green or blue. Or, 0.
int get_dominant_rgb(int r, int g, int b, int bias){
    if (bias == 1) {
    	if(r > g+COL_DIFF_AMOUNT+20 && r > b+COL_DIFF_AMOUNT+20) return 1;  //Predominantly red
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