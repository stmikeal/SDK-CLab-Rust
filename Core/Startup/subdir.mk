STARTUP_DIR := Core/Startup

OBJS += $(patsubst %.s,%.o,$(wildcard $(STARTUP_DIR)/*.s))

S_DEPS += $(patsubst %.s,%.d,$(wildcard $(STARTUP_DIR)/*.s))

$(STARTUP_DIR)/%.o: $(STARTUP_DIR)/%.s $(STARTUP_DIR)/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean-obj: clean-Core-Startup

clean-Core-Startup:
	-$(RM) $(STARTUP_DIR)/*.cyclo $(STARTUP_DIR)/*.d $(STARTUP_DIR)/*.o $(STARTUP_DIR)/*.su

.PHONY: clean-Core-Startup

