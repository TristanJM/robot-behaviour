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

#include "utility.h"
#include "runwallfollow.h"

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


int follow_sensorzero[8];
int follow_weightleft[8] = {-10,-10,-5,0,0,5,10,10};
int follow_weightright[8] = {10,10,5,0,0,-5,-10,-10};


int followgetSelectorValue() {
	return SELECTOR0 + 2*SELECTOR1 + 4*SELECTOR2 + 8*SELECTOR3;
}


/*! \breif Read the sensors proxymities
 * \param sensorTable Where the value must be stocked
 */
void followGetSensorValues(int *sensorTable) {
	unsigned int i;
	for (i=0; i < NB_SENSORS; i++) {
		sensorTable[i] = e_get_calibrated_prox(i); //e_get_prox(i) - follow_sensorzero[i];
	}		
}

/*! \brief Set robot speed */
void followsetSpeed(int LeftSpeed, int RightSpeed) {
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
	selector_change = !(followgetSelectorValue() & 0x0001);

	while (1) {
		followGetSensorValues(distances); // read sensor values

		gostraight=0;
		if ((followgetSelectorValue() & 0x0001) == RIGHT_FOLLOW) {
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
				follow_weightleft[0]=-10;
				follow_weightleft[7]=-10;
				follow_weightright[0]=10;
				follow_weightright[7]=10;
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
				follow_weightleft[0]=10;
				follow_weightleft[7]=10;
				follow_weightright[0]=-10;
				follow_weightright[7]=-10;
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
				leftwheel+=follow_weightleft[i]*(distances[i]>>4);
				rightwheel+=follow_weightright[i]*(distances[i]>>4);
			}
		}

		// set robot speed
		followsetSpeed(leftwheel, rightwheel);

		wait(15000);
	}	
}
