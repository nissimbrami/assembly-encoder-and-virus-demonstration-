section .data
    msg db 'Hello, Infected File!', 0x0A
    new_line db 0x0A

code_start:
    db 'VIRUS_CODE', 0x0A
code_end:
code_vius_size equ code_end - code_start

open_err_msg db 'Error open file', 0xA
open_err_len equ $ - open_err_msg
lseek_err_msg db 'Error seeking file', 0xA
lseek_err_len equ $ - lseek_err_msg
write_err_msg db 'Error to write the file', 0xA
write_err_len equ $ - write_err_msg
close_err_msg db 'Error close the file', 0xA
close_err_len equ $ - close_err_msg

section .text
global _start
extern main
extern strlen
global system_call
global infection
global infector

_start:
    pop dword ecx
    mov esi, esp
    mov  eax, ecx
    shl eax, 2
    add eax, esi
    add eax, 4
    push dword eax
    push dword esi
    push dword ecx

    call main

    mov ebx, eax
    mov eax , 1
    int 0x80

system_call:
    push ebp
    mov ebp, esp
    sub esp, 4
    pushad

    mov eax, [ebp+8]
    mov ebx, [ebp+12]
    mov ecx, [ebp+16]
    mov edx , [ebp+20]
    int 0x80
    mov [ebp-4], eax
    popad
    mov ax, [ebp-4]
    add esp, 4
    pop ebp
    ret

global infection
infection:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 21
    int 0x80

    ret

global infector
infector:
    push  ebp
    mov ebp , esp
    sub esp, 4
    mov ecx, [ebp+8]

    mov ebx, 1

    push ecx
    call strlen
    mov edx, eax
    pop ecx
    mov  eax , 4
    int 0x80

    cmp eax, -1
    je open_error

    mov eax, 5
    mov ebx , ecx
    mov ecx, 2
    xor edx, edx
    int 0x80

    cmp eax , -1
    je open_error

    mov [ebp-4] , eax

    mov  eax, 19
    mov ebx, [ebp-4]
    xor ecx, ecx
    mov  edx, 2
    int 0x80

    cmp  eax, -1
    je lseek_error

    mov ebx , [ebp-4]
    mov eax, 4
    lea ecx , [code_start]
    mov edx, code_vius_size
    int 0x80

    cmp eax, -1
    je write_error

    mov eax, 6
    mov ebx, [ebp-4]
    int 0x80

    cmp  eax, -1
    je close_error

    mov eax, 4
    mov ebx , 1
    mov ecx , new_line
    mov edx, 1
    int 0x80

    cmp eax, -1
    je write_error

    leave
    ret

open_error:
    mov eax, 4
    mov ebx, 1
    mov ecx , open_err_msg
    mov edx , open_err_len
    int 0x80
    jmp exit

lseek_error:
    mov eax, 4
    mov ebx , 1
    mov  ecx  , lseek_err_msg
    mov edx, lseek_err_len
    int 0x80
    jmp  exit

write_error:
    mov eax, 4
    mov ebx , 1
    mov ecx,  write_err_msg
    mov edx, write_err_len
    int 0x80
    jmp exit

close_error:
    mov eax, 4
    mov ebx,  1
    mov ecx, close_err_msg
    mov edx , close_err_len
    int 0x80
    jmp exit

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80