
/*! \file
 * Robotics Coursework - Loughborough University
 * \author Brandon Randle, Tristan Murfitt, Tarun Iyer, Joshua Dando, Tino Aranjani, Sarthak Gupta
 */

#include "p30f6014A.h"
#include "stdio.h"
#include "string.h"

#include "uart/e_uart_char.h"
#include "motor_led/e_init_port.h"

#include "cwk_aggressive.h"
#include "cwk_fear.h"
#include "cwk_goal_seek.h"
#include "cwk_curious.h"
#include "cwk_love.h"
#include "cwk_custom_behaviour.h"

#include "ComModule.h"
#include "runcollaboration.h"
#include "runaccelerometer.h"
#include "runbreitenberg_adv.h"
#include "runlocatesound.h"
#include "runwallfollow.h"
#include "runfollowball.h"
#include "runfftlistener.h"
#include "rungrounddirection.h"
#include "utility.h"

#define PI 3.14159265358979

/*! \brief The main function of the application
 */
int main() {
	char buffer[80];
	int selector;

	//system initialization 
	e_init_port();
	e_init_uart1();

	//Reset if Power on (some problem for few robots)
	if (RCONbits.POR) {
		RCONbits.POR=0;
		__asm__ volatile ("reset");
	}

	// Decide upon program
	selector=getselector();
	sprintf(buffer, "Starting with selector pos %d\r\n", selector);
	e_send_uart1_char(buffer, strlen(buffer));
	
	if (selector==0) {
		run_grounddirection();
	} else if (selector==1) {
		run_accelerometer();
	} else if (selector==2) {
		run_locatesound();
	} else if (selector==3) {
        run_custom();               // custom
	} else if (selector==4) {
		run_curious();              // curious
	} else if (selector==5) {
		run_love();                 // love
	} else if (selector==6) {
        run_fear();                 // fear
	} else if (selector==7) {
        run_aggressive();           // aggressive
	} else if (selector==8) {
        run_goal_seek();            // goal seek
	} else
		run_fft_listener();
	
	while(1);
	return 0;
}

