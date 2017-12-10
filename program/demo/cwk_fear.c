#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "uart/e_uart_char.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "uart/e_uart_char.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "a_d/advance_ad_scan/e_prox.h"
#include "utility.h"


/* Settings */
#define MOTOR_INTENSITY 500  //Increase or decrease this to make the robot move & turn quicker.
#define WAIT_TIME 250000       //Decrease this to update quicker / move smaller amounts between checks.

void run_fear(){

	int i;                              // Used in loops.
	int leftwheel;                      // Speed we'll set our left wheel to.
	int rightwheel;                     // Wpeed we'll set our right wheel to.
	int prox[8] = {0,0,0,0,0,0,0,0};    // Holds the values of all the proximity sensors.
	char buffer[80];

	

	/* Initialise the library stuff */
	e_init_port();
	e_init_ad_scan(ALL_ADC);
	e_init_motors();
	e_start_agendas_processing();
	e_calibrate_ir();


	//e_set_speed_left(100);


	while(1)
	{
	

		/* Update Proximity Sensor value array, also turn on LEDs if detected */
		for(i=0; i<8; i++){
			prox[i] = e_get_prox(i);
			if(prox[i] > 250){
				e_set_led(i, 1);
			} else {
				e_set_led(i, 0);
			}
		}

		;	


		/* Set our wheel speeds to 0 to start with.
		 * If there's anything in the proximity sensors though, this will be overridden
		 */
		leftwheel =   0;       // Set left wheel to whatever we just got
		rightwheel =  0;       //Set right wheel to opposite of whatever left is




		/* For all sensors except tha back two sensors,
		 * if we see something on this sensor, turn away from it.
		 * turn faster if it's a front sensor and slower
		 * essentially we're just trying to get the back sensors to point at the enemy
		 */

		// Right side of robot
		if(prox[2] > 250){
			leftwheel =		-1 * MOTOR_INTENSITY;
			rightwheel =	 1 * MOTOR_INTENSITY;
		}
		if(prox[1] > 250){
			leftwheel =		-3 * MOTOR_INTENSITY;
			rightwheel =	 3 * MOTOR_INTENSITY;
		}		
		if(prox[0] > 250){
			leftwheel =		-3 * MOTOR_INTENSITY;
			rightwheel =	-1 * MOTOR_INTENSITY;
		}
		
		

		// Left side of robot
		if(prox[5] > 250){
			leftwheel =		 1 * MOTOR_INTENSITY;
			rightwheel =	-1 * MOTOR_INTENSITY;
		}
		if(prox[6] > 250){
			leftwheel =		 3 * MOTOR_INTENSITY;
			rightwheel =	-3 * MOTOR_INTENSITY;
		}
		if(prox[7] > 250){
			leftwheel =		-1 * MOTOR_INTENSITY;
			rightwheel =	-3 * MOTOR_INTENSITY;
		}


		/* Now for the rear sensors,
		 * if we see something on these sensors, run forward */
		if(prox[4] > 200){
			leftwheel =		5 * MOTOR_INTENSITY;
			rightwheel =	5 * MOTOR_INTENSITY;
		}

		if(prox[3] > 200){
			leftwheel =		5 * MOTOR_INTENSITY;
			rightwheel =	5 * MOTOR_INTENSITY;
		}


		/* Now actually set the motor speeds */
		e_set_speed_left(leftwheel);
		e_set_speed_right(rightwheel);
		wait(WAIT_TIME);


	}


}
