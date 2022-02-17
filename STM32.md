# STM32 functions

## GPIO

```
HAL_Delay(0xfa); // in milliseconds
HAL_GPIO_TogglePin(LED_YELLOW_GPIO_Port,LED_YELLOW_Pin);
```

## EXTI

```
EXTI15_10_IRQHandler() 
calls:
HAL_GPIO_EXTI_IRQHandler(Specific Pin)
calls:
HAL_GPIO_EXTI_Callback(Specific Pin)
```

## UART
```
HAL_UART_Transmit(&huart2, buffer, sizeof(buffer),HAL_MAX_DELAY);
HAL_UART_Transmit_IT(&huart2, buffer, sizeof(buffer));  // Enable UART interrupt
HAL_UART_Transmit_DMA(&huart2, buffer, sizeof(buffer));  // Configure DMA
```
