section .data
    newline_sym db 0xA              
    input_file_id dd 0              
    output_file_id dd 1             
    std_err dd 2

section .bss
    input_buff resb 1               

section .text
    global _start
    extern strlen

    ; "magic numbers" that used in thie code
    SYS_READ equ 3                  
    SYS_WRITE equ 4                 
    SYS_OPEN equ 5                  
    SYS_EXIT equ 1                  
    STDIN equ 0                     
    STDOUT equ 1                    
    O_RDONLY equ 0                  
    O_WRONLY equ 1                  
    O_CREAT equ 64                  
    O_TRUNC equ 512                 
    MODE_777 equ 511                

_start:
    mov ecx, [esp + 4]              
    add esp, 4                      

    test ecx, ecx                   
    jz encode_start                 

    push ecx                        
    call strlen                     
    mov edx, eax                    

    mov eax, SYS_WRITE              
    mov ebx, dword [std_err]  
    pop ecx                         
    int 0x80                        

    push ecx                        
    mov eax, SYS_WRITE              
    mov ebx, dword [std_err] 
    mov ecx, newline_sym            
    mov edx, 1                      
    int 0x80                        
    pop ecx                         

    call manage_files              
    jmp _start                      

encode_start:
    call read_char                  
    cmp eax, 0                      
    je end_program                  

    mov al, [input_buff]            
    call encode_char                
    call write_char                 
    jmp encode_start                

manage_files:
    push ecx                        
    call check_manage_files         
    pop ecx                         
    ret                             

check_manage_files:
    cmp byte [ecx], '-'             
    jne end_check_manage_files      

    cmp byte [ecx + 1], 'i'         
    je handle_input                 

    cmp byte [ecx + 1], 'o'         
    je handle_output                

end_check_manage_files:
    ret                             

handle_input:
    add ecx, 2                      
    mov eax, SYS_OPEN               
    mov ebx, ecx                    
    mov ecx, O_RDONLY               
    mov edx, 0                      
    int 0x80                        
    cmp eax, -1                     
    je end_check_manage_files       
    mov [input_file_id], eax        
    ret                             

handle_output:
    add ecx, 2                      
    mov eax, SYS_OPEN               
    mov ebx, ecx                    
    mov ecx, O_WRONLY + O_CREAT + O_TRUNC 
    mov edx, MODE_777               
    int 0x80                        
    cmp eax, -1                     
    je end_check_manage_files       
    mov [output_file_id], eax       
    ret                             

read_char:
    mov eax, SYS_READ               
    mov ebx, dword [input_file_id]  
    mov ecx, input_buff             
    mov edx, 1                      
    int 0x80                        
    ret                             

encode_char:
    cmp al,'A'                     
    jl encode_char_end              

    cmp al,'z'                     
    jg encode_char_end              

    inc al                          

encode_char_end:
    mov [input_buff], al            
    ret                             

write_char:
    mov eax, SYS_WRITE              
    mov ebx,  dword [output_file_id] 
    mov ecx, input_buff             
    mov edx,  1                      
    int 0x80                        
    ret                             

end_program:
    mov eax,  SYS_EXIT               
    xor ebx,ebx                    
    int 0x80                        