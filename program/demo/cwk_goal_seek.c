#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "../../../library/motor_led/e_init_port.h"
#include "../../../library/motor_led/e_motors.h"
#include "../../../library/motor_led/e_led.h"
#include "../../../library/a_d/e_prox.h"

void run_goal_seek(){

	/* Initialise the library stuff */
	e_init_port();
	e_init_motors();
	e_init_prox();

}