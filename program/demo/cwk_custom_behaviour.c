#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "../../../library/motor_led/e_init_port.h"
#include "../../../library/motor_led/advance_one_timer/e_motors.h"
#include "../../../library/camera/fast_2_timer/e_poxxxx.h"
#include "../../../library/motor_led/advance_one_timer/e_led.h"



void do_goal_seek(){

	// Vars to store colour levels from camera
	int red_level;
	int green_level;
	int blue_level;
	int obstacle_ahead;
	int primary_colour;

	while(1){

		// Check if there's anything ahead
		obstacle_ahead = is_obstacle_ahead();

		// Get levels from camera
		red_level = get_red_level();
		green_level = get_green_level();
		blue_level = get_blue_level();

		// Get the dominant colour level
		primary_colour = get_dominant_rgb(red_level, green_level, blue_level);


		// If the camera sees red, stop moving
		if(primary_colour == 1) stop_motors();

		// If the camera sees green, move without any care
		if(primary_colour == 2) start_motors();

		// If the camera sees blue, only move if the path is clear
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




// Set up anything necessary like prox sensors, leds or camera
void do_setup(){
	
}


// Return the red level of the camera
int get_red_level(){
	
}


// Return the green level of the camera
int get_green_level(){
	
}


// Return the blue level of the camera
int get_blue_level(){
	
}


// Return 1 if there's an obstacle ahead of us, otherwise 0
int is_obstacle_ahead(){
	
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
	
}

// Stop moving the robot
void stop_moving(){

}