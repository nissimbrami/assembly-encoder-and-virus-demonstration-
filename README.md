# Assembly Language and System Calls Lab

By: NISSIM BRAMI

## Project Purpose
This lab implements low-level programming concepts using assembly language and system calls. It consists of two main components:
1. An encoder program written in assembly
2. A virus attachment demonstration program

## Project Structure
```
├── task1/
│   ├── start.s     # Assembly implementation of encoder
│   └── makefile    # Build configuration for task1
└── task2/
    ├── main.c      # Main virus program implementation
    ├── start.s     # Assembly functions for virus attachment
    └── makefile    # Build configuration for task2
```

## Operating Instructions

### Building the Project

#### Task 1: Encoder
```bash
cd task1
make
```

#### Task 2: Virus Program
```bash
cd task2
make
```

### Running the Programs

#### Encoder Program (Task 1)
The encoder supports the following operations:
```bash
# Basic encoding from stdin to stdout
./task1

# Using input file
./task1 -iinputfile.txt

# Using output file
./task1 -ooutputfile.txt

# Using both input and output
./task1 -iinputfile.txt -ooutputfile.txt
```

#### Virus Program (Task 2)
To attach the virus code to a target file:
```bash
./task2 -atarget_file
```

## System Requirements
- Linux operating system
- NASM assembler
- GCC compiler with 32-bit support

Note: All implementations avoid using the C standard library and rely on direct system calls.
