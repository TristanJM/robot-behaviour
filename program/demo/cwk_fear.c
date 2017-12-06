#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "uart/e_uart_char.h"
#include "motor_led/e_init_port.h"
#include "motor_led/e_motors.h"
#include "motor_led/e_led.h"
#include "a_d/e_prox.h"
#include "utility.h"

/* Settings */
#define MOTOR_INTENSITY 100;  //Increase or decrease this to make the robot move & turn quicker.
#define WAIT_TIME 1000;       //Decrease this to update quicker / move smaller amounts between checks.

void run_fear(){

	int i;                              // Used in loops.
	int leftwheel;                      // Speed we'll set our left wheel to.
	int rightwheel;                     // Wpeed we'll set our right wheel to.
	int prox[8] = {0,0,0,0,0,0,0,0};    // Holds the values of all the proximity sensors.
	int randomNumber;                   // Will hold a random number at one point.
	char buffer[80];					// For uart debug

	

	/* Initialise the library stuff */
	e_init_port();
	e_init_uart1();
	e_init_motors();
	//e_calibrate_ir();

	sprintf(buffer, "Starting run_fear\r\n");
	memset(&buffer[0], 0, sizeof(buffer));
	e_send_uart1_char(buffer, strlen(buffer));


    // vvv  For debug only   vvv
	e_set_speed_left(100);
	sprintf(buffer, "Left wheel 100\r\n");
	memset(&buffer[0], 0, sizeof(buffer));
	e_send_uart1_char(buffer, strlen(buffer));
	// ^^^   For debug only   ^^^


	while(1)
	{


		/* Update Proximity Sensor value array, also turn on LEDs if detected */
		for(i=0; i<8; i++){
			prox[i] = e_get_prox(i);
			if(prox[i] > 1000){
				e_set_led(i, 1);
				sprintf(buffer, "Prox $i = $i\r\n", i, prox[i] );
				memset(&buffer[0], 0, sizeof(buffer));
				e_send_uart1_char(buffer, strlen(buffer));
			} else {
				e_set_led(i, 0);
			}
		}



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
		if(prox[0] > 1000){
			leftwheel =		-3 * MOTOR_INTENSITY;
			rightwheel =	 3 * MOTOR_INTENSITY;
		}
		if(prox[1] > 1000){
			leftwheel =		-2 * MOTOR_INTENSITY;
			rightwheel =	 2 * MOTOR_INTENSITY;
		}
		if(prox[2] > 1000){
			leftwheel =		-1 * MOTOR_INTENSITY;
			rightwheel =	 1 * MOTOR_INTENSITY;
		}

		// Left side of robot
		if(prox[7] > 1000){
			leftwheel =		 3 * MOTOR_INTENSITY;
			rightwheel =	-3 * MOTOR_INTENSITY;
		}
		if(prox[6] > 1000){
			leftwheel =		 2 * MOTOR_INTENSITY;
			rightwheel =	-2 * MOTOR_INTENSITY;
		}
		if(prox[5] > 1000){
			leftwheel =		 1 * MOTOR_INTENSITY;
			rightwheel =	-1 * MOTOR_INTENSITY;
		}


		/* Now for the rear sensors,
		 * if we see something on these sensors, run forward */
		if(prox[4] > 1000){
			leftwheel =		4 * MOTOR_INTENSITY;
			rightwheel =	4 * MOTOR_INTENSITY;
		}

		if(prox[3] > 1000){
			leftwheel =		4 * MOTOR_INTENSITY;
			rightwheel =	4 * MOTOR_INTENSITY;
		}


		/* Now actually set the motor speeds */
		e_set_speed_left(leftwheel);
		e_set_speed_right(rightwheel);
		wait(WAIT_TIME);


	}


}

