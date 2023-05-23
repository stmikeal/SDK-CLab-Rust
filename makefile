RM := rm -rf

BASE_FLAGS :=

-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk

all: main-build

main-build: SDK_cLAB.elf default_size SDK_cLAB.list SDK_cLAB.bin clean-obj

SDK_cLAB.elf SDK_cLAB.map: $(OBJS) $(USER_OBJS) makefile $(OPTIONAL_TOOL_DEPS) librust_main.a
	arm-none-eabi-gcc -o "SDK_cLAB.elf" $(OBJS) librust_main.a $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"STM32F407VGTX_RAM.ld" --specs=nosys.specs -Wl,-Map="SDK_cLAB.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -Wl,--start-group -lc -lm -Wl,--end-group

default_size: $(EXECUTABLES) makefile $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  SDK_cLAB.elf
	
SDK_cLAB.list: $(EXECUTABLES) makefile $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S SDK_cLAB.elf > "SDK_cLAB.list"

SDK_cLAB.bin: $(EXECUTABLES) makefile $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary SDK_cLAB.elf "SDK_cLAB.bin"

librust_main.a:
	cargo build
	mv target/thumbv7em-none-eabihf/debug/librust_main.a librust_main.a
	arm-none-eabi-ar -r librust_main.a Core/Src/func.o
	
clean:
	-$(RM) SDK_cLAB.bin SDK_cLAB.elf

clean-obj:
	-$(RM) SDK_cLAB.list SDK_cLAB.map default.size.stdout librust_main.a
	-$(RM) target
	cargo clean

.PHONY: all clean dependents main-build

-include makefile.targets
