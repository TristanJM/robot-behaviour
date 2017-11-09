#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "../../library/motor_led/e_init_port.h"
#include "../../library/motor_led/e_motors.h"
#include "../../library/motor_led/e_led.h"
#include "../../library/a_d/e_prox.h"

#define PI 3.14159265358979

void run_goal_seek(){

	/* Initialise the library stuff */
	e_init_port();
	e_init_motors();
	/* e_init_prox(); */

	while(1) {
		/* get odometry of robot */

		go_to_pos(0.1,0.1,PI/4);
	}

}

void go_to_pos(float x, float y, float theta){

	printf("Going to (%f, %f, %f)\n",x,y,theta);

	
}