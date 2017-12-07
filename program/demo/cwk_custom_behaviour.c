#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "uart/e_uart_char.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "a_d/advance_ad_scan/e_prox.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "utility.h"

#define MOTOR_SPEED 100
#define NUM_SENSORS 8

// Buffer for the camera to read into
char fbwbufferGS[160];
int numbufferGS[80];

// Stores data about the rgb levels
int red_level, green_level, blue_level;
int dominant;

// Main method for this behaviour
// This is what should be called from outside */
void do_goal_seek(){

	// Vars for camera
	int primary_colour;

	// Vars for proximity
	int proximities[NUM_SENSORS];
	int obstacle_ahead;

	// Do some setup
	e_init_port();
	e_init_ad_scan(ALL_ADC);
	e_init_motors();
	e_start_agendas_processing();

	// Initialise camera
	e_poxxxx_init_cam();
    e_poxxxx_config_cam(0, (ARRAY_HEIGHT - 4) / 2, 640, 4, 8, 4, RGB_565_MODE);
    e_poxxxx_write_cam_registers();

	// Initialise prox sensors
	e_calibrate_ir();

	// Main control loop (Do this forever)
	while(1){

		// Update sensor values
		update_proximity(proximities);

		// Check if there's anything ahead
		obstacle_ahead = is_obstacle_ahead(proximities);

		// Get levels from camera
		update_levels();

		// Now we should have red_ green_ and blue_level set by that function
		// Get the dominant colour level
		primary_colour = get_dominant_rgb(red_level, green_level, blue_level);


		// If the camera sees red, stop moving
		if(primary_colour == 1) stop_motors();

		// If the camera sees green, move without any care
		if(primary_colour == 2) start_motors();

		// If the camera sees blue, only move if the path is clear
		// (I guess a secondary behaviour here is that it drives to the paper then stops?)
		if(primary_colour == 3){
		
			if(obstacle_ahead == 1){
				// Stop if there are obstacles
				stop_motors();
			} else {
				// Start if there aren't obstacles
				start_motors();
			}

		}


	}

	
	

}





// Update the red_ green_ and blue_level variables with whatever the camera sees
void update_levels(){

	// Used in loop later
	long i;
	int red, green, blue;
	
	// Holds the dominant colour of this col
	int domimant;

	// Grab frame from camera
	e_poxxxx_launch_capture((char *) fbwbufferGS);

	// Wait for capture to complete
	while (!e_poxxxx_is_img_ready()) {};

	// Reset red_ green_ and blue_level to 0's
	red_level = 0;
	green_level = 0;
	blue_level = 0;
	
	// Iterate over every column
    for (i = 0; i < 80; i++) {

        // RGB turned into an integer value for comparison
        red = (fbwbufferGS[2 * i] & 0xF8);
        green = (((fbwbufferGS[2 * i] & 0x07) << 5) | ((fbwbufferGS[2 * i + 1] & 0xE0) >> 3));
        blue = ((fbwbufferGS[2*i+1] & 0x1F) << 3);

        // Get the dominant colour
		dominant = get_dominant_rgb(red, green, blue);

		// Add 1 to whatever's the dominant colour
		if( dominant == 1 ) red_level++;
		if( dominant == 2 ) green_level++;
		if( dominant == 3 ) blue_level++;

    }

}


void update_proximity(int *arr){
	int i;
	for( i=0; i < NUM_SENSORS; i++ ){
		arr[i] = e_get_calibrated_prox(i);
	}
}



// Return 1 if there's an obstacle ahead of us, otherwise 0
int is_obstacle_ahead(int *arr){
	
	// This is REALLY BASIC
	if( arr[7] > 200  ||  arr[0] > 200 ){
		return 1;
	} else {
		return 0;
	}

	// Literally just checks if the front two sensors are >200 and returns true if so

}


// Return 1,2,3 depending on whether the screen is predominantly red, green or blue. Or, 0.
int get_dominant_rgb(int r, int g, int b){
	if(r > g && r > b) return 1;    //Predominantly red
	if(g > r && g > b) return 2;    //Predominantly green
	if(b > r && b > g) return 3;    //Predominantly blue
	return 0;              	        //Freak situation where they're equal
}


// Start the robot moving forward
void start_motors(){
	e_set_speed_left(MOTOR_SPEED);
	e_set_speed_right(MOTOR_SPEED);
}

// Stop moving the robot
void stop_motors(){
	e_set_speed_left(0);
	e_set_speed_right(0);
}














void do_line_follow(){

	// Vars for camera
	int primary_colour;
	int left_goal_cols = 0;
	int right_goal_cols = 0;

	int red;
int green;
int blue;
int i;
int dominant;

	// Do some setup
	e_init_port();
	e_init_ad_scan(ALL_ADC);
	e_init_motors();
	e_start_agendas_processing();

	// Initialise camera
	e_poxxxx_init_cam();
    e_poxxxx_config_cam(0, (ARRAY_HEIGHT - 4) / 2, 640, 4, 8, 4, RGB_565_MODE);
    e_poxxxx_write_cam_registers();

	
	while(1){

		// Grab frame from camera
		e_poxxxx_launch_capture((char *) fbwbufferGS);
		
		// Wait for capture to complete
		while (!e_poxxxx_is_img_ready()) {};

		left_goal_cols = 0;
		right_goal_cols = 0;

		// Iterate over every column
    	for (i = 0; i < 80; i++) {
			// RGB turned into an integer value for comparison
        	red = (fbwbufferGS[2 * i] & 0xF8);
        	green = (((fbwbufferGS[2 * i] & 0x07) << 5) | ((fbwbufferGS[2 * i + 1] & 0xE0) >> 3));
        	blue = ((fbwbufferGS[2*i+1] & 0x1F) << 3);

			primary_colour = get_dominant_rgb(red, green, blue);

			if(i < 40){
				if(primary_colour == 2){
					left_goal_cols++;
				}
			} else {
				if(primary_colour == 2){
					right_goal_cols++;
				}
			}

		}

		e_set_speed_left(100 * right_goal_cols);
		e_set_speed_right(100 * left_goal_cols);


	}




}