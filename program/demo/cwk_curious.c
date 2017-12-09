#include "p30f6014A.h"
#include "stdio.h"
#include "stdlib.h"
#include "string.h"
#include "math.h"

#include <time.h>

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
               long k;
               switch (flag) {
        case 0:
            e_set_led(8, 1);
            wait(wait_time);
            e_set_led(8, 0);
            break;
        case 1:

            for(k=0;k<50;k++){
            k2000_led();            
            wait(wait_time);
            }
            break;
        default:
            break;
    }
}

void epuck_set_speed(int speed, int wait_time) {
    e_set_speed_left(speed);
    e_set_speed_right(speed);
    wait(wait_time);
}

void epuck_shake(int speed, int wait_time, int iterations) {
    long i;
    for (i = 0; i < iterations; ++i) {
        e_set_speed(0, -1 * speed);
        wait(wait_time);
        e_set_speed(0, 1 * speed);
        wait(wait_time);
        e_set_speed(0, 1 *speed);
        wait(wait_time);
        e_set_speed(0, -1 * speed);
        wait(wait_time);
    }
}

void update_sensor_array(int *state_prox) {
    long i;
    for (i = 0; i < SENSORS; i++) {
        state_prox[i] = e_get_calibrated_prox(i);
    }
}

void creep(int max_ir_index, int current_ir_activation, int proximity_threshold) {
    int linear_speed, angular_speed;

    /* Flags */
    int proximity_alert = 0;
    int prox_detected = max_ir_index < 8;

    // Set global linear speed; Max if object detected, random out of half otherwise
    linear_speed = (prox_detected) ? MOTOR_MAX_SPEED : (rand() % (MOTOR_MAX_SPEED / 2));

    // Override linear_speed as a proximity based multiplier - Logarithmic Decrease
    int speed_multiplier = log(current_ir_activation + 1) / log(100 + 1);

    if (speed_multiplier < 0.9) {
        linear_speed = (1 - speed_multiplier) * linear_speed;
    } else {
        // Proximity Alert
        proximity_alert = 1;
    }

    switch (max_ir_index) {
        case 0: // -3
            angular_speed = (int) floor((120 / 2) * (-1));
            break;
        case 1: // -2
            angular_speed = (int) floor((120 / 2) * (-2 / 3));
            break;
        case 2: // -1
            angular_speed = (int) floor((120 / 2) * (-1 / 3));
            break;
        case 3: // +4
            angular_speed = (int) floor((120 / 2) * 0);
            break;
        case 4: // +4
            angular_speed = (int) floor((120 / 2) * 0);
            break;
        case 5: // +1
            angular_speed = (int) floor((120 / 2) * (1 / 3));
            break;
        case 6: // +2
            angular_speed = (int) floor((120 / 2) * (2 / 3));
            break;
        case 7: // +3
            angular_speed = (int) floor((120 / 2) * (1));
            break;
        default:
            angular_speed = (rand() % 2*120)-120;
            break;
    }

    // Reverse override for proximity alert
    if (proximity_alert) {
        linear_speed = -1 * linear_speed;
        angular_speed = -1 * angular_speed;
    }

    e_set_speed(linear_speed, angular_speed);
}

#pragma clang diagnostic push
#pragma ide diagnostic ignored "OCDFAInspection"

void run_curious() {
    /* Initialisations */
    e_init_port();
    e_init_ad_scan(ALL_ADC);
    e_init_motors();
    e_init_uart1();
    
    e_start_agendas_processing();
    e_calibrate_ir();

    srand(time(NULL));

    /* Configurations */
    int conf_curious_mode = 1;          // Uses Prox sensors if set to 1.
    int conf_wait_time = 50000;         // Wait time for all operations
    int conf_turn_wait = 500;           // Time needed to complete the turn
    int conf_animateled_wait = 50000;   // Wait time for LED Animations
    int conf_cal_ir_activation = 200;    // Assumed Range 0-100
    int conf_proximity_threshold = 0.9;
    
    long wait_iter, i, j ,k;


    /* State Variables */
    int state_prox[SENSORS] = {0, 0, 0, 0, 0, 0, 0, 0};

    while (1) {
        if (conf_curious_mode) {
            // Prox Sensor Enabled Code
            //update_sensor_array(state_prox);

            for (i = 0; i < SENSORS; i++) {
                state_prox[i] = e_get_prox(i);
            }
            
            int max_ir_index = 8;
            for (i = 0; i < SENSORS; ++i) { // Update LED on IR Activation
                if (state_prox[i] > conf_cal_ir_activation) {
                    e_set_led(i, 1);
                    max_ir_index = i;
                } else {
                    e_set_led(i, 0);
                }
            }

            // Creep towards object - Creep slows down, the closer the object is.
            creep(max_ir_index, (max_ir_index < SENSORS) ? state_prox[max_ir_index] : 0, conf_proximity_threshold);
            // Repeat
            for(i=0; i<50000; i++) { asm("nop"); }

        } else {
            // Basic Movement Code
            //animate_lights(0, conf_animateled_wait);
            // Move Forward - Random
            e_set_speed(rand()%(400+1-350)+350, rand()%(2*80)-80);
            wait(conf_wait_time*4);
            //wait(conf_wait_time*4);
            // Shake
            epuck_shake(500, conf_turn_wait, 1);
            animate_lights(1, 1000);
            // Flash Lights
            //animate_lights(0, conf_animateled_wait);
        }
    }
}

#pragma clang diagnostic pop