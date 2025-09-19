# Compiler and flags
CC = arm-none-eabi-gcc
CFLAGS = -mcpu=cortex-m7 -mthumb -O2 -Wall -Iinclude

# Source and object files
SRCS = src/main.c src/motor_control.c
OBJS = $(SRCS:.c=.o)

# Output file
TARGET = firmware.elf

# Default rule
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(OBJS) $(TARGET)
