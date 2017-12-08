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

#include "utility.h"
#include "runwallfollow.h"
#include "runfollowball.h"
#include "cwk_goal_seek.h"

#define LEFT_FOLLOW			0		// behaviors IDs	
#define RIGHT_FOLLOW		1 

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
    int waiting_for_turn = 0;
    int leftwheel;
    int rightwheel;

    e_init_port();
    e_init_motors();
    e_init_uart1();

    // camera set up
    e_poxxxx_init_cam();
    e_poxxxx_config_cam(0, (ARRAY_HEIGHT - 4) / 2, 640, 4, 8, 4, RGB_565_MODE);
    e_poxxxx_write_cam_registers();

    e_start_agendas_processing();

    e_calibrate_ir();

    while (1) {
        e_led_clear();
        
        // Get levels from camera
        update_levels();
        
        // Get dominant colour
        primary_colour = get_dominant_rgb(red_level, green_level, blue_level);
        
        // React to colour
        if (primary_colour == 1) {
            // RED DETECTED
            e_set_led(4, 1);    
            leftwheel = 0;
            rightwheel = 0;
        } else if (primary_colour == 2) {
            // GREEN DETECTED
            leftwheel = BIAS_SPEED;
            rightwheel = BIAS_SPEED;
        } else if (primary_colour == 3) {
            // BLUE DETECTED
            rotate_robot(180);
            waiting_for_turn = 1;
            leftwheel = BIAS_SPEED;
            rightwheel = BIAS_SPEED;
        } else {
            // NO COLOUR (DEBUG ONLY)
        }

        
        // Stay within walls of road
        
        // Read sensor values
        getSensorValues(distances);
        
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
    
}