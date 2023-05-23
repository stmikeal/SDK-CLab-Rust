CORE_DIR := Core/Src

OBJS += $(patsubst %.c,%.o,$(wildcard $(CORE_DIR)/*.c))

C_DEPS += $(patsubst %.c,%.d,$(wildcard $(CORE_DIR)/*.c))

$(CORE_DIR)/%.o $(CORE_DIR)/%.su $(CORE_DIR)/%.cyclo: $(CORE_DIR)/%.c $(CORE_DIR)/subdir.mk
	$(GCC) "$<" $(ADV_FLAGS) $(BASE_FLAGS) -MF"$(@:%.o=%.d)" -MT"$@" -o "$@"

clean-obj: clean-Core-Src	

clean-Core-Src:
	-$(RM) $(CORE_DIR)/*.cyclo $(CORE_DIR)/*.d $(CORE_DIR)/*.o $(CORE_DIR)/*.su

.PHONY: clean-Core-2f-Src

