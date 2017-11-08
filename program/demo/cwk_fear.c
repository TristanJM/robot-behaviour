#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "../../../library/motor_led/e_init_port.h"
#include "../../../library/motor_led/e_motors.h"
#include "../../../library/motor_led/e_led.h"
#include "../../../library/a_d/e_prox.h"

void run_fear(){

	int i;								// Used in loops.
	int leftwheel;						// Speed we'll set our left wheel to.
	int rightwheel;						// Wpeed we'll set our right wheel to.
	int prox[8] = {0,0,0,0,0,0,0,0};	// Holds the values of all the proximity sensors.
	int randomNumber;					// Will hold a random number at one point.

	/* Settings */
	int motor_intensity = 100;	//Increase or decrease this to make the robot move & turn quicker.
	int wait_time = 1000;		//Decrease this to update quicker / move smaller amounts between checks.

	/* Initialise the library stuff */
	e_init_port();
	e_init_motors();
	e_init_prox();


	/* Set up a rng, seed it with the time */
	srand(time(NULL));

	

	while(1)
	{


		/* Update Proximity Sensor value array, also turn on LEDs if detected */
		for(i=0; i<8; i++){
			prox[i] = e_get_prox(i);
			if(prox[i] > 1000){
				e_set_led(i, 1);
			} else {
				e_set_led(i, 0);
			}
		}



		/* Set our wheel speeds to something random and small
		 * This is what our robot does when nothing is about.
		 * Makes sense to move slightly here in case there's
		 * an object *between* the proximity sensors.
		 * Whatever we set here will be overridden by the next
		 * block if there's actually something on the sensors.
		 * tl;dr: default to a random number
		 */
		 randomNumber = (rand() % 20) - 10;	//Get a random number between -10 and 10
		 leftwheel =    randomNumber;		// Set left wheel to whatever we just got
		 rightwheel =  -randomNumber;		//Set right wheel to opposite of whatever left is




		/* For all sensors except tha back two sensors,
		 * if we see something on this sensor, turn away from it.
		 * turn faster if it's a front sensor and slower
		 * essentially we're just trying to get the back sensors to point at the enemy
		 */

		 // Right side of robot
		if(prox[0] > 1000){
			leftwheel =		-3 * motor_intensity;
			rightwheel =	 3 * motor_intensity;
		}
		if(prox[1] > 1000){
			leftwheel =		-2 * motor_intensity;
			rightwheel =	 2 * motor_intensity;
		}
		if(prox[2] > 1000){
			leftwheel =		-1 * motor_intensity;
			rightwheel =	 1 * motor_intensity;
		}

		// Left side of robot
		if(prox[7] > 1000){
			leftwheel =		 3 * motor_intensity;
			rightwheel =	-3 * motor_intensity;
		}
		if(prox[6] > 1000){
			leftwheel =		 2 * motor_intensity;
			rightwheel =	-2 * motor_intensity;
		}
		if(prox[5] > 1000){
			leftwheel =		 1 * motor_intensity;
			rightwheel =	-1 * motor_intensity;
		}


		/* Now for the rear sensors,
		 * if we see something on these sensors, run forward */
		if(prox[4] > 1000){
			leftwheel =		4 * motor_intensity;
			rightwheel =	4 * motor_intensity;
		}

		if(prox[3] > 1000){
			leftwheel =		4 * motor_intensity;
			rightwheel =	4 * motor_intensity;
		}


		/* Now actually set the motor speeds */
		e_set_speed_left(leftwheel);
		e_set_speed_right(rightwheel);
		wait(wait_time);


	}


}

