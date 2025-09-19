# Compiler and flags
CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
CFLAGS = -mcpu=cortex-m7 -mthumb -O2 -Wall -Iinclude

# Source and object files
SRCS = src/main.c src/motor_control.c
OBJS = $(SRCS:.c=.o)

# Output files
TARGET = firmware.elf
BIN = firmware.bin

# Default rule
all: $(BIN)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(BIN): $(TARGET)
	$(OBJCOPY) -O binary $< $@

clean:
	rm -f $(OBJS) $(TARGET) $(BIN)
