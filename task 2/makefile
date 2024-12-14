# Define the compiler and assembler
CC=gcc
ASM=nasm

# Define the compiler flags
CFLAGS=-m32 -Wall -ansi -c -nostdlib -fno-stack-protector -std=c99
LDFLAGS=-m32 -no-pie -nostartfiles

# Define the source files
C_SOURCES=main.c Util.c
ASM_SOURCES=start.s

# Define the object files
C_OBJECTS=$(C_SOURCES:.c=.o)
ASM_OBJECTS=$(ASM_SOURCES:.s=.o)

# Define the executable
EXECUTABLE=start

# Build the executable
all: $(EXECUTABLE)

$(EXECUTABLE): $(C_OBJECTS) $(ASM_OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^

# Compile the C source files
%.o: %.c
	$(CC) $(CFLAGS) $< -o $@

# Assemble the assembly source files
%.o: %.s
	$(ASM) -f elf32 $< -o $@

# Clean up the build files
clean:
	rm -f $(C_OBJECTS) $(ASM_OBJECTS) $(EXECUTABLE)


CFLAGS=-m32 -Wall -ansi -c -nostdlib -fno-stack-protector -std=c99
LDFLAGS=-m32 -no-pie -nostartfiles