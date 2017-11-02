#include "e_poxxxx.h"
#include "e_po3030k.h"
#include "e_po6030k.h"
#include "../../motor_led/e_epuck_ports.h"
#include "../../I2C/e_I2C_protocol.h"
#include "../../motor_led/e_init_port.h"

static int camera_version;


int e_poxxxx_config_cam(unsigned int sensor_x1,unsigned int sensor_y1,
				unsigned int sensor_width,unsigned int sensor_height,
				unsigned int zoom_fact_width,unsigned int zoom_fact_height,  
				int color_mode) {
	switch(camera_version) {
		case 0x3030:
			return e_po3030k_config_cam(sensor_x1, sensor_y1,
				sensor_width, sensor_height,
				zoom_fact_width, zoom_fact_height,  
				color_mode);
			break;
		case 0x6030:
			return e_po6030k_config_cam(sensor_x1, sensor_y1,
				sensor_width, sensor_height,
				zoom_fact_width, zoom_fact_height,  
				color_mode);
			break;
		default:
			return -1;
	}
}
					

void e_poxxxx_set_mirror(int vertical, int horizontal) {
	switch(camera_version) {
		case 0x3030:
			e_po3030k_set_mirror(vertical, horizontal);
			break;
		case 0x6030:
			e_po6030k_set_mirror(vertical, horizontal);
			break;
	}
}

void e_poxxxx_write_cam_registers(void) {
	switch(camera_version) {
		case 0x3030:
			e_po3030k_write_cam_registers();
			break;
		case 0x6030:
			// Nothing to do
			break;
	}
}

#define DEVICE_ID 0xDC
void e_poxxxx_init_cam(void) {
	int i;
	unsigned char reg0, reg1;
	e_init_port();
	e_i2cp_init();
	CAM_RESET=0;
	for(i=100;i;i--) __asm__ volatile ("nop");
	CAM_RESET=1;
	for(i=100;i;i--) __asm__ volatile ("nop");
	/* enable interrupt nesting */
	INTCON1bits.NSTDIS = 0;
	/* set a higher priority on camera's interrupts */
	IPC5 = (IPC5 & 0xF00F) + 0x0660;

	/* read the camera version */
	reg0 = e_i2cp_read(DEVICE_ID, 0x0);
	reg1 = e_i2cp_read(DEVICE_ID, 0x1);
	camera_version = reg0 << 8 | reg1;
}

