# Assembly Language and System Calls Lab

A comprehensive lab implementation focusing on assembly language programming and system calls, featuring an encoder program and a demonstration of executable file manipulation through virus attachment simulation.

## Author
- **Nissim Brami**

## Table of Contents
- [Overview](#overview)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Tasks](#tasks)
- [Usage](#usage)
- [Technical Details](#technical-details)
- [License](#license)

## Overview
This lab project demonstrates low-level programming concepts through two main components:
1. An assembly-based character encoder
2. A virus attachment simulation program

Key learning objectives include:
- Assembly language programming
- Direct system call implementation
- File I/O operations without standard library
- Executable file manipulation

## Project Structure
```
.
├── task1/                  # Assembly Encoder Implementation
│   ├── start.s            # Main assembly implementation
│   └── makefile           # Build configuration for task1
│
└── task2/                 # Virus Attachment Implementation
    ├── main.c             # C program implementation
    ├── start.s            # Assembly implementations
    └── makefile           # Build configuration for task2
```

## Prerequisites
- Linux operating system
- NASM (Netwide Assembler)
- GCC with 32-bit support
- GNU Make

## Installation

1. Clone the repository:
```bash
git clone https://github.com/nissimbrami/assembly-system-calls-lab.git
cd assembly-system-calls-lab
```

2. Build all components:
```bash
# Build encoder
cd task1
make

# Build virus attachment program
cd ../task2
make
```

## Tasks

### Task 1: Assembly Character Encoder
A character encoding program implemented purely in assembly language.

#### Features
- Character encoding: Increments characters in range 'A' to 'z'
- File I/O support through command-line arguments
- Debug mode for argument inspection
- Direct system call implementation

#### Implementation Components
1. Debug output system
2. Standard I/O handling
3. File I/O operations
4. Character encoding logic

### Task 2: Virus Attachment Demonstration
A program demonstrating executable file modification techniques.

#### Features
- Executable file modification
- Command-line argument processing
- Status reporting
- Mixed C and Assembly implementation

#### Components
- C-based main program
- Assembly implementations:
  - `infection()`: Status display
  - `infector()`: File manipulation

## Usage

### Task 1: Encoder
```bash
# Standard I/O operation
./task1

# Input file specification
./task1 -iinput.txt

# Output file specification
./task1 -ooutput.txt

# Combined input/output operation
./task1 -iinput.txt -ooutput.txt
```

### Task 2: Virus Attachment
```bash
# Attach to target file
./task2 -atarget_file
```

## Technical Details

### Implementation Notes
- Pure assembly implementation for Task 1
- Hybrid C/Assembly implementation for Task 2
- Direct system call usage throughout
- No standard library dependencies

### System Calls Used
- `sys_read` (0x03)
- `sys_write` (0x04)
- `sys_open` (0x05)
- `sys_close` (0x06)

### Compilation Instructions
```bash
# Task 1
nasm -f elf32 start.s -o start.o
ld -m elf_i386 start.o -o task1

# Task 2
nasm -f elf32 start.s -o start.o
gcc -m32 -Wall main.c start.o -o task2
```

### Security Considerations
- Task 2 modifies executable files
- Use only in controlled environments
- Do not run on system executables
- Keep backups of target files

## Safety Warning
The virus attachment program (Task 2) is designed for educational purposes only. It demonstrates executable file modification techniques and should only be used in a controlled environment with appropriate precautions.

## License
MIT License

Copyright (c) 2024 Nissim Brami

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
