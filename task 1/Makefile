all: start

start: Util.o start.o 
	ld -m elf_i386 Util.o start.o -o start

start.o: start.s
	nasm -f elf32 start.s -o start.o

Util.o: Util.c
	gcc -m32 -Wall -ansi -c -nostdlib -fno-stack-protector Util.c -o Util.o

clean:
	rm -f *.o start
