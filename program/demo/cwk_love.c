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

<<<<<<< HEAD

// fuction used to calculate the linear speed to set on 
// each wheel depending on the information from the
// front sensors - IR 0 & 7 
int basic_speed_calc(int dist, int gain)
{
	int range = 350;
	float x = 0.1;
	int t = 3;
	int linVal = 0;
	int diffDist = range-dist;
	int basic_speed;

	linVal = linVal + x * diffDist / t;
	basic_speed = (diffDist + linVal) * gain;

	if(basic_speed >= 1000)
	{
		linVal = 999/gain - diffDist;
		if(linVal > 60)	
			linVal = 60.0;
		basic_speed = 999;
	}
	else if(basic_speed <= -1000)
	{
		linVal = -999/gain + diffDist;
		if(linVal < -10)	
			linVal = -10.0;
		basic_speed = -999;
	}
	return basic_speed;
}

// fuction used to calculate the angular speed to set on 
// each wheel depending on the information from the
// 4 front sensors IR 0,1,6 & 7 
int corner_speed_calc(int pos, int gain)
{
	int range = 0;
	int corner_speed = 0;
	int diffDist = range - pos;

	corner_speed = diffDist*gain;

	if(corner_speed >= 1000)
		corner_speed = 999;
	else if(corner_speed <= -1000)
		corner_speed = -999;

	return corner_speed;
}

// calculating the speed to follow the lover
void follow_lover(void)
{    
	// determining if something is near 
	if(e_get_calibrated_prox(0) || e_get_calibrated_prox(7) < 1000)
		e_start_led_blinking(900);	// if nothing near, all LEDs start to blink mimicking a heartbeat effect 
	else
	{
		e_stop_led_blinking();	// heart skips a beat if an obstacle (lover) is detected/near.
		e_set_blinking_cycle(30000);	// restarts motion 
	}

	int basic_speed = basic_speed_calc((e_get_calibrated_prox(7)+e_get_calibrated_prox(0))/2, 6);
	int corner_speed = corner_speed_calc((e_get_calibrated_prox(0)+e_get_calibrated_prox(1)) -
										(e_get_calibrated_prox(7)+e_get_calibrated_prox(6)), 4);

	// setting the wheel speed
	e_set_speed_left(basic_speed - corner_speed);
	e_set_speed_right(basic_speed + corner_speed);
}


// main method for love ehaviour 
=======
>>>>>>> parent of 144346b... Trying something new
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
	
<<<<<<< HEAD
	e_calibrate_ir();
	
	e_activate_agenda(follow_lover, 650); 
	e_start_agendas_processing();
	while(1);
=======
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
>>>>>>> parent of 144346b... Trying something new
}