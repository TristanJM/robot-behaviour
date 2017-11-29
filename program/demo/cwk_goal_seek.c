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

#define NB_SENSORS          8		// number of sensors
#define BIAS_SPEED      	350		// robot bias speed
#define SENSOR_THRESHOLD	300		// discount sensor noise below threshold
#define MAXSPEED 			800		// maximum robot speed

// colour detection
char fbwbufferGS[160];
int numbufferGS[80];
long isRedVisible;

int follow_sensorzeroGS[8];
int follow_weightleftGS[8] = {-10,-10,-5,0,0,5,10,10};
int follow_weightrightGS[8] = {10,10,5,0,0,-5,-10,-10};


int followgetSelectorValueGS() {
	return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}


/*! \breif Read the sensors proxymities
 * \param sensorTable Where the value must be stocked
 */
void followGetSensorValuesGS(int *sensorTable) {
	unsigned int i;
	for (i=0; i < NB_SENSORS; i++) {
		sensorTable[i] = e_get_calibrated_prox(i); //e_get_prox(i) - follow_sensorzeroGS[i];
	}		
}

/*! \brief Set robot speed */
void followsetSpeedGS(int LeftSpeed, int RightSpeed) {
	if (LeftSpeed < -MAXSPEED) {LeftSpeed = -MAXSPEED;}
	if (LeftSpeed >  MAXSPEED) {LeftSpeed =  MAXSPEED;}
	if (RightSpeed < -MAXSPEED) {RightSpeed = -MAXSPEED;}
	if (RightSpeed >  MAXSPEED) {RightSpeed =  MAXSPEED;}
	e_set_speed_left(LeftSpeed);
	e_set_speed_right(RightSpeed); 
}

/*! \brief The "main" function of the program */
void run_goal_seek() {
	int leftwheel, rightwheel;		// motor speed left and right
	int distances[NB_SENSORS];		// array keeping the distance sensor readings
	int i;							// FOR-loop counters
	int gostraight;
	int loopcount;
	unsigned char selector_change;
	 
	e_init_port();
	e_init_ad_scan(ALL_ADC);
	e_init_motors();
	e_start_agendas_processing();

	//follow_sensor_calibrate();	
	
	e_activate_agenda(left_led, 2500);
	e_activate_agenda(right_led, 2500);
	e_pause_agenda(left_led);
	e_pause_agenda(right_led);
	
	e_calibrate_ir();
	loopcount=0;
	selector_change = !(followgetSelectorValueGS() & 0x0001);

	while (1) {
		followGetSensorValuesGS(distances); // read sensor values

		gostraight=0;
		if ((followgetSelectorValueGS() & 0x0001) == RIGHT_FOLLOW) {
			if(selector_change == LEFT_FOLLOW) {
				selector_change = RIGHT_FOLLOW;
				e_led_clear();
				e_pause_agenda(left_led);
				e_restart_agenda(right_led);
			}  
			for (i=0; i<8; i++) {
				if (distances[i]>50) {break;}
			}
			if (i==8) {
				gostraight=1;
			} else {
				follow_weightleftGS[0]=-10;
				follow_weightleftGS[7]=-10;
				follow_weightrightGS[0]=10;
				follow_weightrightGS[7]=10;
				if (distances[2]>300) {
					distances[1]-=200;
					distances[2]-=600;
					distances[3]-=100;
				}
			}
		} else {
			if(selector_change == RIGHT_FOLLOW) {
				selector_change = LEFT_FOLLOW;
				e_led_clear();
				e_pause_agenda(right_led);
				e_restart_agenda(left_led);
			}
			for (i=0; i<8; i++) {
				if (distances[i]>50) {break;}
			}
			if (i==8) {
				gostraight=1;
			} else {
				follow_weightleftGS[0]=10;
				follow_weightleftGS[7]=10;
				follow_weightrightGS[0]=-10;
				follow_weightrightGS[7]=-10;
				if (distances[5]>300) {
					distances[4]-=100;
					distances[5]-=600;
					distances[6]-=200;
				}
			}
		}

		leftwheel=BIAS_SPEED;
		rightwheel=BIAS_SPEED;
		if (gostraight==0) {
			for (i=0; i<8; i++) {
				leftwheel+=follow_weightleftGS[i]*(distances[i]>>4);
				rightwheel+=follow_weightrightGS[i]*(distances[i]>>4);
			}
		}

		// set robot speed
		followsetSpeedGS(leftwheel, rightwheel);

		wait(15000);
	}	
}

// Image processing removes useless information
void ImageGS(){	
	long i;
	int green, red, vis;
	for(i=0; i<80; i++){
		//RGB turned into an integer value for comparison
		red = (fbwbufferGS[2*i] & 0xF8);
		green = (((fbwbufferGS[2*i] & 0x07) << 5) | ((fbwbufferGS[2*i+1] & 0xE0) >> 3));
		//blue = ((fbwbufferGS[2*i+1] & 0x1F) << 3); we don't need blue for looking for red.
		if(red > green + 20){ // green will be less then red when red is strong.
			numbufferGS[i] = 1;
			vis++;
		}else{
			numbufferGS[i] = 0;
		}
	}	
    if(vis > 0) {
        isRedVisible = 1;
    } else {
        isRedVisible = 0;
    }
}

// Should go straight and stop when detecting a red object
void run_goal_seek_basic() {
	int leftwheel, rightwheel;		// motor speed left and right
	int distances[NB_SENSORS];		// array keeping the distance sensor readings
	int i;							// FOR-loop counters
	int gostraight;
	int loopcount;
	unsigned char selector_change;
    
    // col at center of image
    int centreValue;
	 
	e_init_port();
	e_init_ad_scan(ALL_ADC);
	e_init_motors();
    
    // camera set up
	e_poxxxx_init_cam();
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 
    
	e_start_agendas_processing();
	
//	e_calibrate_ir();
//	loopcount=0;
//	selector_change = !(followgetSelectorValueGS() & 0x0001);

	while (1) {
        // front torch
        //e_set_front_led(1);
        
        
        // start camera to find the "success" colour wall
		e_poxxxx_launch_capture((char *)fbwbufferGS);
        while(!e_poxxxx_is_img_ready()){};              // THIS IS CURRENTLY CAUSING ISSUES
        
		ImageGS();
//		e_led_clear();
        
		if (isRedVisible) {         // If red, turn on torch and stop
            // e_activate_agenda(turn, 650);
            e_set_front_led(1);
            gostraight=0;
            leftwheel=0;
            rightwheel=0;
		} else {                    // If red isn't visible, continue straight ahead
            // e_destroy_agenda(turn);
            e_set_front_led(0);
            gostraight=1;
            leftwheel=BIAS_SPEED;
            rightwheel=BIAS_SPEED;
		}
        
		followGetSensorValuesGS(distances); // read sensor values
        /*
        // This code stopped the bot if it detected an object in any of the 8 sensors
		gostraight=0;
        
        for (i=0; i<8; i++) {
            if (distances[i]>50) {break;}
        }
        if (i==8) {
            gostraight=1;
            leftwheel=BIAS_SPEED;
            rightwheel=BIAS_SPEED;
        } else {
            gostraight=0;
            leftwheel=0;
            rightwheel=0;
        }*/

		leftwheel=BIAS_SPEED;
		rightwheel=BIAS_SPEED;

		// set robot speed
		followsetSpeedGS(leftwheel, rightwheel);

		wait(15000);
	}	
}