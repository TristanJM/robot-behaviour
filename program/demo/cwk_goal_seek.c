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

/*
 * Goal: Cross green finish line, directly in front of the start point (eg. start y=0, end y=1000).
 * Follow the wall of obstacles in the way, favouring the direction of positive distance (y, towards finish).
 * If obstacle no longer exists, correct back to original straight line trajectory.
 * Movement in x axis does not contribute to distance.
 */

#define LEFT_FOLLOW			0		// behaviors IDs	
#define RIGHT_FOLLOW		1 

#define NUM_SENSORS         8		// number of sensors
#define BIAS_SPEED      	350		// robot bias speed
#define SENSOR_THRESHOLD	300		// discount sensor noise below threshold
#define MAXSPEED 			800		// maximum robot speed

// colour detection
char fbwbufferGS[160];
int numbufferGS[80];
long isRedVisible = 0;

// sensors
int follow_sensorzeroGS[8];
int follow_weightleftGS[8] = {-10, -10, -5, 0, 0, 5, 10, 10};
int follow_weightrightGS[8] = {10, 10, 5, 0, 0, -5, -10, -10};

/*! 
 * \brief Read the sensors proximities
 * \param sensorTable Where the value must be stocked
 */
void followGetSensorValuesGS(int *sensorTable) {
    unsigned int i;
    for (i = 0; i < NUM_SENSORS; i++) {
        sensorTable[i] = e_get_calibrated_prox(i); //e_get_prox(i) - follow_sensorzeroGS[i];
    }
}

// Cap robot's speed
void followsetSpeedGS(int LeftSpeed, int RightSpeed) {
    // Cap lower limits
    if (LeftSpeed < -MAXSPEED) { LeftSpeed = -MAXSPEED; }
    if (RightSpeed < -MAXSPEED) { RightSpeed = -MAXSPEED; }
    
    // Cap upper limits
    if (LeftSpeed > MAXSPEED) { LeftSpeed = MAXSPEED; }
    if (RightSpeed > MAXSPEED) { RightSpeed = MAXSPEED; }

    e_set_speed_left(LeftSpeed);
    e_set_speed_right(RightSpeed);
}

// Detect color of image
void ImageColDetect_Red() {
    long i;
    int vis = 0;
    int green, red;
    for (i = 0; i < 80; i++) {
        //RGB turned into an integer value for comparison
        red = (fbwbufferGS[2 * i] & 0xF8);
        green = (((fbwbufferGS[2 * i] & 0x07) << 5) | ((fbwbufferGS[2 * i + 1] & 0xE0) >> 3));
        //blue = ((fbwbufferGS[2*i+1] & 0x1F) << 3); we don't need blue for looking for red.
        if (red > green + 30) { // green will be less then red when red is strong.
            numbufferGS[i] = 1;
            vis++;
        } else {
            numbufferGS[i] = 0;
        }
    }
    if (vis > 0) {
        isRedVisible = 1;
    } else {
        isRedVisible = 0;
    }
}

void run_goal_seek() {
    int leftwheel, rightwheel; // motor speed left and right
    int distances[NUM_SENSORS]; // array keeping the distance sensor readings
    int i; // FOR-loop counters
    int follow_wall;
    int loopcount;

    e_init_port();
    e_init_ad_scan(ALL_ADC);
    e_init_motors();
    e_start_agendas_processing();
    
    e_poxxxx_init_cam();
    e_poxxxx_config_cam(0, (ARRAY_HEIGHT - 4) / 2, 640, 4, 8, 4, RGB_565_MODE);
    e_poxxxx_write_cam_registers();

    // Right side light pulse
    e_activate_agenda(right_led, 2500);
    e_pause_agenda(right_led);

    e_calibrate_ir();
    loopcount = 0;

    while (1) {        
        followGetSensorValuesGS(distances); // read sensor values
        
        e_led_clear();
        follow_wall = 0;
        
        // capture image
        e_poxxxx_launch_capture((char *) fbwbufferGS);
        while (!e_poxxxx_is_img_ready()) {};
        
        // detect colour in image
        ImageColDetect_Red();
        
        // turned off pulsing lights - affected red detection
        // e_pause_agenda(left_led);
        // e_restart_agenda(right_led);
        
        // check detection from any of the 8 IR sensors
        for (i = 0; i < 8; i++) {
            if (distances[i] > 50) { break; }
        }
        
        // if nothing close
        if (i == 8) {
            e_set_led(1,1);
            e_set_led(7,1);
            leftwheel = BIAS_SPEED;
            rightwheel = BIAS_SPEED;
        }
        // otherwise, objects are detected
        else {
            // If red, stop
            if (isRedVisible) {
                e_set_led(4,1); // back light
                leftwheel = 0;
                rightwheel = 0;
            } 
            else {
                follow_wall = 1;
                follow_weightleftGS[0] = -10;
                follow_weightleftGS[7] = -10;
                follow_weightrightGS[0] = 10;
                follow_weightrightGS[7] = 10;
                if (distances[2] > 300) {   // right side sensor?
                    distances[1] -= 200;
                    distances[2] -= 600;
                    distances[3] -= 100;   
                }
            }
        }
        
        // follow the wall
        if (follow_wall == 1) {
            for (i = 0; i < 8; i++) {
                leftwheel += follow_weightleftGS[i]*(distances[i] >> 4);
                rightwheel += follow_weightrightGS[i]*(distances[i] >> 4);
            }
        }

        e_set_speed_left(leftwheel);
        e_set_speed_right(rightwheel);   
        // followsetSpeedGS(leftwheel, rightwheel);

        loopcount++;    
    }
}

// Goes straight and stops when detecting a red object
// Also has example for detecting objects in IR
void run_goal_seek_basic() {
    //int distances[NB_SENSORS]; // array keeping the distance sensor readings
    //int i; // FOR-loop counters
    int loopcount = 0;

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
        // read in camera to find the "success" colour
        if (loopcount % 15 == 0) {
            e_poxxxx_launch_capture((char *) fbwbufferGS);
            while (!e_poxxxx_is_img_ready()) {
            };
            ImageColDetect_Red();
        }

        e_led_clear();

        if (isRedVisible) { // If red, turn on torch and stop
            e_set_led(2, 1);
            e_set_led(6, 1);
            e_set_speed_left(0);
            e_set_speed_right(0);
        } else { // If red isn't visible, continue straight ahead
            e_set_led(4, 1);
            e_set_speed_left(BIAS_SPEED);
            e_set_speed_right(BIAS_SPEED);
        }

        /*
        // This code stopped the bot if it detected an object in any of the 8 IR sensors

        followGetSensorValuesGS(distances); // read sensor values
        for (i=0; i<8; i++) {
            if (distances[i]>50) { break; }
        }
        if (i == 8) {
            e_set_speed_left(BIAS_SPEED);
            e_set_speed_right(BIAS_SPEED);
        } else {
            e_set_speed_left(0);
            e_set_speed_right(0);
        }*/

        loopcount++;
    }
}