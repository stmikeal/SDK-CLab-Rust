CORE_DIR := Core/Src

OBJS += $(patsubst %.c,%.o,$(wildcard $(CORE_DIR)/*.c))

C_DEPS += $(patsubst %.c,%.d,$(wildcard $(CORE_DIR)/*.c))

$(CORE_DIR)/%.o $(CORE_DIR)/%.su $(CORE_DIR)/%.cyclo: $(CORE_DIR)/%.c $(CORE_DIR)/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -c -ICore/Inc -IDrivers/STM32F4xx_HAL_Driver/Inc -IDrivers/STM32F4xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F4xx/Include -IDrivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean-obj: clean-Core-Src	

clean-Core-Src:
	-$(RM) $(CORE_DIR)/*.cyclo $(CORE_DIR)/*.d $(CORE_DIR)/*.o $(CORE_DIR)/*.su

.PHONY: clean-Core-2f-Src

