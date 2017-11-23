#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "motor_led/e_epuck_ports.h"
#include "motor_led/e_init_port.h"
#include "uart/e_uart_char.h"
#include "motor_led/advance_one_timer/e_agenda.h"
#include "motor_led/advance_one_timer/e_motors.h"
#include "camera/fast_2_timer/e_poxxxx.h"

#include "search_ball.h"
//globalint prox[8] = {0,0,0,0,0,0,0,0};    // Holds the values of all the proximity sensors.
#define NB_VAL 240
#define NUMSensors 7
unsigned char buffer[NB_VAL];



/*helper functions*/
int searchTarget(int* tarX, int* tarY){
//look at follow ball code

for (int i = 0; i < NUMSensors; i++){
int dist = e.get_prox(i);	//found obstacle	
if (dist < 350){
//check if obj is target
	
}

}
}
	
movetotarget(){
 int linear_speed, angle_speed;
	int distance, gain = 35;
	linear_speed = calc_lin_speed(distance, gain); //functions from search ball
	angle_speed = calc_angle_speed(pos, gain); 
	e_set_speed(linear_speed, angle_speed);
}
*tarX = 1; //will be changed 
 *tarY = 1;


void setRobotSpeed(LeftSpeed, RightSpeed){
//move the robot 
  e_set_speed_left(LeftSpeed); 
  e_set_speed_right(RightSpeed);
}
/**
- Search for target
- turn on red LEDs when target found
- speed towards target
- when target out of range, leds turn off and robot wanders
*/
void run_aggressive(){
 int lMotor, rMotor; 
 int maxSpeed = 800; 
 int initialSpeed = 300;
 int lSpeed, rSpeed;
 int tarX, tarY;

 e_init_port();
 e_init_ad_scan(ALL_ADC);
 e_init_motors();
 e_start_agendas_processing();
 e_poxxxx_init_cam();
 select_cam_mode(RGB_565_MODE);//used to search for green
  
  unsigned char *tab_start = buffer;
  
 while (1){
  //turns on a front red LED 1 = on, 0 = off  e_set_front_led(1);
  e_poxxxx_launch_capture((char *)tab_start);
	while(!e_poxxxx_is_img_ready());  //wait for img
   
  follow_red(tab_start, NB_VAL);
   
  searchTarget(&tarX, &tarY);
  lSpeed = lMotor * maxSpeed;  rSpeed = rMotor * maxSpeed
  setRobotSpeed(lSpeed, rSpeed);
  /**  //code to follow green ball
  e_poxxxx_launch_capture((char *)tab_start);  while(!e_poxxxx_is_img_ready());   follow_green(tab_start, NB_VAL);  execute(tab_start, &epuck);  */
 } 
}
