#ifndef MOTOR_CONTROL_H
#define MOTOR_CONTROL_H

#include "stm32h7xx_hal.h"

void Motor_Init(void);
void Motor_Set(uint8_t on); // on = 1 -> motor on, 0 -> off

#endif // MOTOR_CONTROL_H
