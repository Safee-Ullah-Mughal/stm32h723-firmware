####################################
# Target and Naming
####################################
TARGET = firmware

####################################
# Build Output Directory
####################################
BUILD_DIR = build

####################################
# Source files
####################################
C_SOURCES = \
src/main.c \
src/motor_control.c

####################################
# Include directories
####################################
INCLUDES = \
-Iinclude

####################################
# Toolchain
####################################
CC = arm-none-eabi-gcc
CP = arm-none-eabi-objcopy
SZ = arm-none-eabi-size

####################################
# Compiler/Linker flags (adjust if needed)
####################################
CFLAGS = -mcpu=cortex-m7 -mthumb -O2 -Wall -ffunction-sections -fdata-sections \
         -DSTM32H723xx
LDFLAGS = -TSTM32H723ZETx_FLASH.ld -Wl,--gc-sections

####################################
# Build rules
####################################
all: $(BUILD_DIR)/$(TARGET).bin

$(BUILD_DIR)/$(TARGET).elf: $(C_SOURCES) | $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) $(C_SOURCES) -o $@ $(LDFLAGS)
	$(SZ) $@

$(BUILD_DIR)/$(TARGET).bin: $(BUILD_DIR)/$(TARGET).elf
	$(CP) -O binary $< $@

$(BUILD_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
