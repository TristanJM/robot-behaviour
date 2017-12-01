#include "motor_led/e_init_port.h"
#include "motor_led/e_epuck_ports.h"
#include "uart/e_uart_char.h"
#include "camera/fast_2_timer/e_poxxxx.h"

#include "stdio.h"

#include "./imageCapture.h"

//Buffer to contain image with number of pixels multipled by 2 for a RGB_565
char hexbuffer[1*2];

//Take image function
void captureImage(){
	//This part actually captures the image
	e_poxxxx_launch_capture((char *)hexbuffer);
    // this part stops the Epuck from doing anything else till the image is captured
	while(!e_poxxxx_is_img_ready()){};
}

//main function of captures the image and prints it to the console
void imageCapture(void){
	// camera set up to take a 1 pixel image in the centre of the camera
	e_poxxxx_init_cam();
	//This gets a 4x4 image at the center of the camera and samples it to a single pixel
	e_poxxxx_config_cam((ARRAY_WIDTH - 4)/2,(ARRAY_HEIGHT - 4)/2,4,4,4,4,RGB_565_MODE);
	e_poxxxx_set_mirror(1,1);
	e_poxxxx_write_cam_registers(); 
	//Capture image function
	captureImage();
	//Print image to terminal
	e_send_uart1_char(hexbuffer, 2);

	while(1){}
}

