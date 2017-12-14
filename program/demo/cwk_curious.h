void run_curious();

void epuck_set_speed(int speed, int wait_time);
void epuck_shake(int speed, int wait_time, int iterations);
void update_sensor_array(int *state_prox);
void epuck_creep(int max_ir_index, int current_ir_activation);
void epuck_led_wait(int led_wait);
int rand_range(int min, int max);