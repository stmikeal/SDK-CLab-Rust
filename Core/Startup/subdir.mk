STARTUP_DIR := Core/Startup

OBJS += $(patsubst %.s,%.o,$(wildcard $(STARTUP_DIR)/*.s))

S_DEPS += $(patsubst %.s,%.d,$(wildcard $(STARTUP_DIR)/*.s))

$(STARTUP_DIR)/%.o: $(STARTUP_DIR)/%.s $(STARTUP_DIR)/subdir.mk
	$(GCC) $(BASE_FLAGS) -x assembler-with-cpp -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"

clean-obj: clean-Core-Startup

clean-Core-Startup:
	-$(RM) $(STARTUP_DIR)/*.cyclo $(STARTUP_DIR)/*.d $(STARTUP_DIR)/*.o $(STARTUP_DIR)/*.su

.PHONY: clean-Core-Startup

