#include "iwdg.h"
#include "gpio.h"
#include "stm32f4xx_hal.h"
#include "trace.h"
#define STM32F423xx 

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

void delay_c() {
	HAL_Delay(250);
}
