#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "../../library/motor_led/e_epuck_ports.h"
#include "../../library/motor_led/e_init_port.h"
#include "../../library/motor_led/advance_one_timer/e_motors.h"
#include "../../library/motor_led/advance_one_timer/e_agenda.h"
#include "../../library/a_d/advance_ad_scan/e_prox.h"
#include "../../library/a_d/advance_ad_scan/e_ad_conv.h"
#include "../../library/motor_led/advance_one_timer/e_led.h"

//Constants
#define NUM_SENSORS 8			// number of sensors 
#define WAIT_TIME 30000			// interval time between each iteration of the main loop
#define HEART_BEAT_TIME 800000	// max interval time before a heartbeat

void run_love(void)
{
	long i = 0;							//loop counter
	int leftWheel = 0;					//speed of left wheel
	int rightWheel = 0;					//speed of right wheel
	long heartBeatCntr = 0;				//Counts how many steps since last heartbeat
	int heartBeatLEDs = 0;				//0 for all LEDs off, 1 for all LEDs on
	
	//Initialise setup libraries
	e_init_port();
	e_init_motors();
	e_led_clear();

	//start with body lights on and moving forwards
	e_set_body_led(1);
	e_set_steps_right(1);
	e_set_steps_left(1);
	e_set_speed_right(100);
	e_set_speed_left(100);
	
	while (1) {
		// starting off
		leftWheel = leftWheel * 0.9;
		rightWheel = rightWheel * 0.9;
		leftWheel+=38;
		rightWheel+=38;
		
		//adjusts the speed if something is near it in that specific direction
		for (i=0;i<NUM_SENSORS;i++) {
			//roughly 1000 means its about to touch
			//any less than 500 and it starts having false positives
			if (e_get_prox(i)>=500) {	
				switch (i) {
					//left side sensors
					case 0:leftWheel+=300;rightWheel+=100;break;
					case 1:leftWheel+=100;rightWheel-=100;break;
					case 2:leftWheel+=300;rightWheel-=400;break;
					//back sensors
					case 3:leftWheel+=400;rightWheel-=300;break;
					case 4:leftWheel+=400;rightWheel-=300;break;
					//right side sensors
					case 5:leftWheel-=400;rightWheel+=300;break;
					case 6:leftWheel-=100;rightWheel+=100;break;
					case 7:leftWheel+=300;rightWheel+=100;break;
				}
			}
		}	
		
		//performing heartBeat
		heartBeatCntr++;
		//get mean average of both front sensors
		int frontProx = (e_get_prox(0) + e_get_prox(7)) / 2;
		if (frontProx < 1) frontProx = 1;
		//calculates maximum time for heartbeat
		long heartBeatMax = HEART_BEAT_TIME;

		if (e_get_prox(0)>300 || e_get_prox(7)>300)
			heartBeatMax = HEART_BEAT_TIME/2;
		if (e_get_prox(0)>900 || e_get_prox(7)>900)
			heartBeatMax = HEART_BEAT_TIME/4;
		
		//measure as to when to do a heartbeat
		if (heartBeatCntr*WAIT_TIME > heartBeatMax) {
			//toggle between 0 and 1
			heartBeatLEDs = 1 - heartBeatLEDs;
			//set LEDs
			for (i=0;i<NUM_SENSORS;i++) {
				e_set_led(i,heartBeatLEDs);
			}
			//reset timer
			heartBeatCntr = 0;
		}
		
		//action for front sensors
		if (e_get_prox(0)>1000 || e_get_prox(1)>1000) {
			if (e_get_prox(0)> e_get_prox(7)) {
				leftWheel  = 200;
				rightWheel = -200;
			}
			else if (e_get_prox(7)>1900) {
				leftWheel  = -200;
				rightWheel = 200;
			}
			for(i=0;i<80000;i++) {asm("nop");}
		}
		
	
		//limit max speed (to 800)
		if (leftWheel>800) { leftWheel = 800; }
		if (rightWheel>800) { rightWheel = 800; }
		if (leftWheel<-800) { leftWheel = -800; }
		if (rightWheel<-800) { rightWheel = -800; }
		
		//wait time
		for(i=0;i<WAIT_TIME;i++) {asm("nop");}
		e_set_steps_right(rightWheel);
		e_set_steps_left(leftWheel);
	}
}