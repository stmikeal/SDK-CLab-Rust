DRIVER_DIR := Drivers/STM32F4xx_HAL_Driver/Src

OBJS += $(patsubst %.c,%.o,$(wildcard $(DRIVER_DIR)/*.c))

C_DEPS += $(patsubst %.c,%.d,$(wildcard $(DRIVER_DIR)/*.c))

$(DRIVER_DIR)/%.o $(DRIVER_DIR)/%.su $(DRIVER_DIR)/%.cyclo: $(DRIVER_DIR)/%.c $(DRIVER_DIR)/subdir.mk
	$(GCC) "$<" $(ADV_FLAGS) $(BASE_FLAGS) -MF"$(@:%.o=%.d)" -MT"$@" -o "$@"

clean-obj: clean-Drivers-Src

clean-Drivers-Src:
	-$(RM) $(DRIVER_DIR)/*.cyclo $(DRIVER_DIR)/*.d $(DRIVER_DIR)/*.o $(DRIVER_DIR)/*.su

.PHONY: clean-Drivers-Src

