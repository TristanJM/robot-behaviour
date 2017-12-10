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

/* 	Love - Once activated all 8 LEDs will start 
	blinking in a motion to represent a heartbeat. 
	Once the front IR sensors has detected something it 
	will go towards that direction and will start following 
	it. As it gets closer and closer to the obstacle (lover) 
	the LEDs will stop blinking to symbolise a skip of a 
	heartbeat :P
*/


// fuction used to calculate the linear speed to set on 
// each wheel depending on the information from the
// front sensors - IR 0 & 7 
int lin_speed_calc(int dist, int gain)
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
int angle_speed_calc(int pos, int gain)
{
	int range = 0;
	int angle_speed = 0;
	int diffDist = range - pos;

	angle_speed = diffDist*gain;

	if(angle_speed >= 1000)
		angle_speed = 999;
	else if(angle_speed <= -1000)
		angle_speed = -999;

	return angle_speed;
}

// calculating the speed to follow the lover
void follow_lover(void)
{
	// skipping a heartbeat when lover is spotted/near 
	if(e_get_calibrated_prox(0) || e_get_calibrated_prox(7) < 1000)
		e_activate_agenda(e_start_led_blinking, 500); // SARTHAK-NOTE: ERROR - e_activate_agenda((func) VOID!) you can only put a function with no arguments in here.
	else 
	{
		// SARTHAK-NOTE: e_stop_led_blinking(void) os fine as it has no arguments.
        e_activate_agenda(e_stop_led_blinking, 250); 
        
        // SARTHAK-NOTE: ERROR - e_activate_agenda((func) VOID!) you can only put a function with no arguments in here.
		e_activate_agenda(e_set_blinking_cycle, 25000);	// restarting the heartbeat effect after the skip
        
        // SARTHAK-NOTE: My suggestion would be to create wrapper functions with no arguments and calling those from above. 
	}
    
	int basic_speed = lin_speed_calc((e_get_calibrated_prox(7)+e_get_calibrated_prox(0))/2, 6);
	int angle_speed = angle_speed_calc((e_get_calibrated_prox(0)+e_get_calibrated_prox(1)) -
										(e_get_calibrated_prox(7)+e_get_calibrated_prox(6)), 4);

	// setting the wheel speed
	e_set_speed_left (basic_speed - angle_speed);
	e_set_speed_right(basic_speed + angle_speed);
}


// main method for love ehaviour 
void run_love(void)
{
	e_init_port();
	e_init_motors();
	e_init_ad_scan(ALL_ADC);
	
	e_calibrate_ir();

	e_activate_agenda(follow_lover, 650);
	e_start_agendas_processing();
	while(1);
}