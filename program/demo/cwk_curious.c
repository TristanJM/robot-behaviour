#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "../../library/motor_led/e_epuck_ports.h"
#include "../../library/motor_led/e_init_port.h"
#include "../../library/motor_led/advance_one_timer/e_agenda.h"
#include "../../library/motor_led/advance_one_timer/e_led.h"
#include "../../library/motor_led/advance_one_timer/e_motors.h"
#include "../../library/uart/e_uart_char.h"
#include "../../library/a_d/advance_ad_scan/e_ad_conv.h"
#include "../../library/a_d/advance_ad_scan/e_prox.h"
#include "../../library/camera/fast_2_timer/e_poxxxx.h"

#define SENSORS     8
#define LEDS        8

#define MOTOR_BIAS_SPEED    200     // <= 500 [lt/e 500]
#define MOTOR_MAX_SPEED     500     // <= 500 [lt/e 500]

void animate_lights(int flag, int wait_time) {
    switch (flag) {
        case 0:
            e_set_led(8, 1);
            wait(wait_time);
            e_set_led(8, 0);
            break;
        case 1:
            k2000_led();
            wait(wait_time);
            break;
        default:
            break;
    }
}

void epuck_set_speed(int speed) {
    e_set_speed_left(speed);
    e_set_speed_right(speed);
}

void epuck_shake(int speed, int wait_time, int iterations) {
    long i;
    for (i = 0; i < iterations; ++i) {
        e_set_speed(0, -1 * speed);
        wait(wait_time);
        e_set_speed(0, 2 * speed);
        wait(wait_time);
        e_set_speed(0, -1 * speed);
    }
}

void run_curious() {
    /* Initialisations */
    e_init_port();
    e_init_motors();
    e_init_uart1();

    e_start_agendas_processing();
    e_calibrate_ir();

    /* Configurations */
    int conf_curious_mode = 0;      // Uses Prox sensors if set to 1.
    int conf_wait_time = 1000;      // Wait time for all operations
    int conf_turn_wait = 10000;     // Time needed to complete the turn

    while (1) {
        if (conf_curious_mode) {
            // Prox Sensor Enabled Code
        } else {
            // Basic Movement Code
            animate_lights(0, 0);
            // Move Forward
            epuck_set_speed(MOTOR_MAX_SPEED);
            // Shake
            epuck_shake(100, 1000, 2);
            // Flash Lights
            animate_lights(0, 0);
            // Turn Left
            e_set_speed(MOTOR_BIAS_SPEED, -500);
            wait(conf_turn_wait);
            // Move Forward
            epuck_set_speed(MOTOR_MAX_SPEED);
            // Shake
            epuck_shake(100, 1000, 2);
            // Flash Lights
            animate_lights(0, 0);
            // Turn Back
            e_set_speed(MOTOR_BIAS_SPEED, 500);
            wait(2 * conf_turn_wait);           // Wait for 2 turns for a 180d turn
            // Move Forward
            epuck_set_speed(MOTOR_MAX_SPEED);
            // Shake
            epuck_shake(100, 1000, 2);
            // Repeat
        }
    }
}