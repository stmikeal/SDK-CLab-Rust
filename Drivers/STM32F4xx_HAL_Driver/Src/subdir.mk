DRIVER_DIR := Drivers/STM32F4xx_HAL_Driver/Src

OBJS += $(patsubst %.c,%.o,$(wildcard $(DRIVER_DIR)/*.c))

C_DEPS += $(patsubst %.c,%.d,$(wildcard $(DRIVER_DIR)/*.c))

$(DRIVER_DIR)/%.o $(DRIVER_DIR)/%.su $(DRIVER_DIR)/%.cyclo: $(DRIVER_DIR)/%.c $(DRIVER_DIR)/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -c -ICore/Inc -IDrivers/STM32F4xx_HAL_Driver/Inc -IDrivers/STM32F4xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F4xx/Include -IDrivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean-obj: clean-Drivers-Src

clean-Drivers-Src:
	-$(RM) $(DRIVER_DIR)/*.cyclo $(DRIVER_DIR)/*.d $(DRIVER_DIR)/*.o $(DRIVER_DIR)/*.su

.PHONY: clean-Drivers-Src

