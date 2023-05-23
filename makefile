RM := rm -rf
GCC := arm-none-eabi-gcc
CARGO := cargo
OBJDUMP := arm-none-eabi-objdump
OBJCOPY := arm-none-eabi-objcopy
SIZE := arm-none-eabi-size
AR := arm-none-eabi-ar
MV := mv

PART_FLAGS := -mcpu=cortex-m4 --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb
BASE_FLAGS := $(PART_FLAGS) -g3 -c -MMD -MP  
MAIN_FLAGS := $(PART_FLAGS) -T"STM32F407VGTX_RAM.ld" --specs=nosys.specs -Wl,-Map="SDK_cLAB.map" -Wl,--gc-sections -static -Wl,--start-group -lc -lm -Wl,--end-group
ADV_FLAGS := -std=gnu11 -DUSE_HAL_DRIVER -DDEBUG -DSTM32F407xx -ICore/Inc -IDrivers/STM32F4xx_HAL_Driver/Inc -IDrivers/STM32F4xx_HAL_Driver/Inc/Legacy -IDrivers/CMSIS/Device/ST/STM32F4xx/Include -IDrivers/CMSIS/Include -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage

-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk

LIB := librust_main.a

all: main-build

main-build: SDK_cLAB.elf default_size SDK_cLAB.list SDK_cLAB.bin clean-obj

SDK_cLAB.elf SDK_cLAB.map: $(OBJS) $(USER_OBJS) makefile $(OPTIONAL_TOOL_DEPS) $(LIB)
	$(GCC) -o "SDK_cLAB.elf" $(OBJS) $(LIB) $(USER_OBJS) $(LIBS) $(MAIN_FLAGS) 

default_size: $(EXECUTABLES) makefile $(OPTIONAL_TOOL_DEPS)
	$(SIZE)  SDK_cLAB.elf
	
SDK_cLAB.list: $(EXECUTABLES) makefile $(OPTIONAL_TOOL_DEPS)
	$(OBJDUMP) -h -S SDK_cLAB.elf > "SDK_cLAB.list"

SDK_cLAB.bin: $(EXECUTABLES) makefile $(OPTIONAL_TOOL_DEPS)
	$(OBJCOPY)  -O binary SDK_cLAB.elf "SDK_cLAB.bin"

$(LIB):
	$(CARGO) build
	$(MV) target/thumbv7em-none-eabihf/debug/librust_main.a $(LIB)
	$(AR) -r $(LIB) Core/Src/func.o
	
clean:
	$(RM) SDK_cLAB.bin SDK_cLAB.elf

clean-obj:
	$(RM) SDK_cLAB.list SDK_cLAB.map default.size.stdout librust_main.a
	$(RM) target
	$(CARGO) clean

.PHONY: all clean dependents main-build

-include makefile.targets
