#include "motor_control.h"

// Uses HAL. Drop this into the client's CubeMX-generated project where HAL is available.
void Motor_Init(void)
{
    // Enable GPIOA clock (adjust if pin 14 is on a different port)
    __HAL_RCC_GPIOA_CLK_ENABLE();

    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_PIN_14;
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

    // Start low
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_14, GPIO_PIN_RESET);
}

void Motor_Set(uint8_t on)
{
    HAL_GPIO_WritePin(GPIOA, GPIO_PIN_14, on ? GPIO_PIN_SET : GPIO_PIN_RESET);
}
