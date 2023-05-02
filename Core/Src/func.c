#include "iwdg.h"
#include "gpio.h"
#include "trace.h"

void toggle_pin13_c() {
	HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_13);
}

void toggle_pin15_c() {
	HAL_GPIO_TogglePin(GPIOD, GPIO_PIN_15);
}

void trace_pin13_c() {
	SDK_TRACE_Timestamp(LED1, HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_13));
}

void trace_pin15_c() {
	SDK_TRACE_Timestamp(LED3, HAL_GPIO_ReadPin(GPIOD, GPIO_PIN_15));
}

void delay_c(int time) {
	HAL_Delay(time);
}
