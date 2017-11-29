#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"
#include "motor_led/advance_one_timer/e_led.h"

#include "stdio.h"
#include "string.h"
#include "stdlib.h"

#include "./findRed.h"

char fbwbuffer[160];
int numbuffer[80];
long isRedVisable;


//custom cam picture load
void getImage(){
	e_poxxxx_launch_capture((char *)fbwbuffer);
    while(!e_poxxxx_is_img_ready()){};
}
// Image processing removes useless information
void Image(){	
	long i;
	int green, red, vis;
	for(i=0; i<80; i++){
		//RGB turned into an integer value for comparison
		red = (fbwbuffer[2*i] & 0xF8);
		green = (((fbwbuffer[2*i] & 0x07) << 5) | ((fbwbuffer[2*i+1] & 0xE0) >> 3));
		//blue = ((fbwbuffer[2*i+1] & 0x1F) << 3); we don't need blue for looking for red.
		if(red > green + 20){ // green will be less then red when red is strong.
			numbuffer[i] = 1;
			vis++;
		}else{
			numbuffer[i] = 0;
		}
		//If red is visable then isRedVisable turns to true
		if(vis>0){
			isRedVisable = 1;
		}else{
			isRedVisable = 0;
		}
	}	
}

//Decide which way to turn.
int turnDirection(){
	int sumL = 0;
	int sumR = 0;
	int i;
	for(i=0;i<40;i++){
		sumL += numbuffer[i];
		sumR += numbuffer[i+40];
	}
	if(sumL<sumR){ 
		return 1;
	}else{
		return 0;
	}
}
//Function to deal with turning.
void turn(void) {
	if(turnDirection()){
		e_set_speed_left (500);
		e_set_speed_right(-500);
	}else{
		e_set_speed_left (-500);
		e_set_speed_right(500);
	}
}
//Main function of follower
void findRed(void){
	//basic set up for camera
	e_poxxxx_init_cam();
	e_poxxxx_config_cam(0,(ARRAY_HEIGHT - 4)/2,640,4,8,4,RGB_565_MODE);
	e_poxxxx_write_cam_registers(); 

	e_start_agendas_processing();
	int centreValue;

	while(1){
		getImage();
		Image();
		e_led_clear();

		//Take a section of the center, this means if there is an error with one it won't effect it as a whole.
		centreValue = numbuffer[38] + numbuffer[39] + numbuffer[40] + numbuffer[41] + numbuffer[42] + numbuffer[43]; // removes stray 
		if(centreValue > 3){ //If red is in the middle then stay still			
			e_destroy_agenda(turn);
			e_set_speed_left (0);
			e_set_speed_right(0);
			e_set_led(0,1);
		}else if(isRedVisable){//If red isn't in the center but is visable then picks a direction to turn to face it
			e_activate_agenda(turn, 650);
			e_set_led(1,1);
		}else{// if red isn't visible and no true values it will turn left
			e_destroy_agenda(turn);
			e_set_speed_left (0);
			e_set_speed_right(0);
			e_set_led(2,1);
		}
	}
}

