#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"
#include "uart/e_uart_char.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "motor_led/e_led.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_led.h"	
#include "a_d/advance_ad_scan/e_prox.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "utility.h"
#include "cwk_love.h"

/* 	Love - Once activated will move around with no LEDs 
	lit up. If an obstacle is detected by the front 
	sensors all 8 LEDs will light up and blink in motion 
	to represent a heartbeat.  Once the front IR sensors 
	has detected something it will go towards that direction 
	and will start following it.
*/

// function used to calculate the linear speed to set on 
// each wheel depending on the information from the
// front sensors - IR 0 & 7 
int basic_speed_calc(int dist, int gain)
{
	int range = 100;
	float x = 0.05;
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

// function used to calculate the angular speed to set on 
// each wheel depending on the information from the
// 4 front sensors IR 0,1,6 & 7 
int side_speed_calc(int pos, int gain)
{
	int range = 0;
	int side_speed = 0;
	int diffDist = range - pos;

	side_speed = diffDist*gain;

	if(side_speed >= 1000)
		side_speed = 999;
	else if(side_speed <= -1000)
		side_speed = -999;

	return side_speed;
}


// main method for love behavior 
void run_love(void)
{
	int leftwheel;		// speed to be set on left wheel 
	int rightwheel;		// speed to be set on the right wheel 
	int loopcount = 0;	// used to keep count of loops


	e_init_port();
	e_init_motors();
	e_init_ad_scan(ALL_ADC);
	
	e_calibrate_ir();
	e_start_agendas_processing();
	
	while(1)
	{
		// setting the wheel speeds to 0 to start with
		leftwheel = 0;
		rightwheel = 0;	
		
		// calculating the speed
		int basic_speed = basic_speed_calc((e_get_calibrated_prox(7)+e_get_calibrated_prox(0))/2, 6);
		int side_speed = side_speed_calc((e_get_calibrated_prox(0)+e_get_calibrated_prox(1)) -
										(e_get_calibrated_prox(7)+e_get_calibrated_prox(6)), 4);

		// determining if something is near 
		if((e_get_calibrated_prox(0) || e_get_calibrated_prox(7) > 1000) && (loopcount % 20 == 0))
		{
			e_set_led(8, 1); // turn ON all the LEDs
		}
		else
		{
			e_set_led(8, 0); 	// turn OFF all LEDs
		}
		loopcount++;	// increase loopcount

		// setting the wheel speed
		e_set_speed_left(basic_speed - side_speed);
		e_set_speed_right(basic_speed + side_speed);	
		wait(15000);		
	}
}