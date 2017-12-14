#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "motor_led/e_motors.h"
#include "motor_led/e_led.h"
#include "a_d/e_prox.h"
#include "uart/e_uart_char.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_led.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "search_ball.h"
#include "a_d/advance_ad_scan/e_prox.h"
#include "a_d/advance_ad_scan/e_ad_conv.h"
#include "./runbreitenberg_adv.h"

#include "cwk_aggressive.h"
#define NB_VAL 240
#define NUMsensors 8
unsigned char buffer2[NB_VAL];
char uartBuffer[100];

int maxSpeed = 500;
int loops = 0;

void follow_red1(unsigned char *buf, int size);


/*! \brief The filter to follow the red ball
 * \param buf The array containing the image
 * \param size The size of the array
 */
void follow_red1(unsigned char *buf, int size) {
	int i;
	unsigned char green;
	for(i=0; i<size/2; i++) {
		green = (((buf[2*i] & 0x07) << 5) | ((buf[2*i+1] & 0xE0) >> 3));
		//blue = ((buf[2*i+1] & 0x1F) << 3);
		buf[i] = green;
	}
}

void getSensorDistances(int *distances){
	unsigned int i;
	for (i = 0; i < NUMsensors; i++){
		distances[i] = e_get_calibrated_prox(i);
	}
}

// Find an object and move towards it in an angry fashion. Shake violently in front
// of the object and flash lights aggressively.
void aggressive() {
	int distances[NUMsensors];
	getSensorDistances(distances);
    
    int ang_speed;
    int lin_speed;
    lin_speed = lin_speed_calc( (distances[7] + distances[0]) /2, 0);
    ang_speed = angle_speed_calc( (distances[0] + distances[1]) - (distances[7] + distances[6]) , 4); 
    //if the distance on the left side is closer to obj we turn left to face

    //vice versa
    if (ang_speed > 0){
        e_set_led(6, 1);
        e_set_led(1,0);
    } else {
        e_set_led(1, 1);
        e_set_led(6,0);
    }
    
    int lSpeed, rSpeed;
    lSpeed = (lin_speed - ang_speed);
    rSpeed = (lin_speed + ang_speed);
    
    if(lSpeed < -maxSpeed){
        lSpeed = -maxSpeed;
    }
    if (lSpeed > maxSpeed){
        lSpeed = maxSpeed;
    }
    if(rSpeed < -maxSpeed){
        rSpeed = -maxSpeed;
    }
    if(rSpeed > maxSpeed){
        rSpeed = maxSpeed;
    }

    /*
    IF Lspeed < 100 and Rspeed < 100 i.e. robot is nearly still => Lspeed + 100, Rspeed + 100
    to move the robot forward i.e. aggressive
    */
    if(lSpeed < 100 && rSpeed < 100){
        lSpeed = maxSpeed;
        rSpeed = maxSpeed;
    }

    int loopCount = 20;
    if( loops % loopCount == 0){
        sprintf(uartBuffer, "lSpeed = %d, rSpeed = %d \n\r", lSpeed, rSpeed);
        e_send_uart1_char(uartBuffer, strlen(uartBuffer));
    }

    e_set_speed_left(lSpeed);
    e_set_speed_right(rSpeed);

    loops++;
}

// Main handler for aggressive behaviour
void run_aggressive(void) {
	e_init_port();
	
	e_init_motors();
	e_init_ad_scan(ALL_ADC);
	e_poxxxx_init_cam();
	select_cam_mode(RGB_565_MODE);
	e_init_uart1();
	e_calibrate_ir();

	e_activate_agenda(aggressive, 650);
	e_start_agendas_processing();
	while(1);

}	//end run aggressive
