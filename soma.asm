SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1

segment .data 

    titulo db "====== CALCULADORA =====", 0xA,0xD
    len1 equ $- titulo
    msg1 db "Numero 1: ", 0xA,0xD 
    len2 equ $- msg1 

    msg2 db "Numero 2: ", 0xA,0xD 
    len3 equ $- msg2 

    msg3 db "A soma é: "
    len4 equ $- msg3

segment .bss
    num1 resb 2 
    num2 resb 2 
    res resb 1    

section	.text
    global _start 
	
_start:        
    mov eax, SYS_WRITE         
    mov ebx, STDOUT         
    mov ecx, titulo         
    mov edx, len1 
   int 0x80      

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len2
   int 0x80                

   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 2
   int 0x80            

   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len3         
   int 0x80

   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 2
   int 0x80        

   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len4         
   int 0x80
   mov eax, [num1]
   sub eax, '0'
	
   mov ebx, [num2]
   sub ebx, '0'
   add eax, ebx
   ; conversao ascii
   add eax, '0'
   mov [res], eax

   ; imprime a soma
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res         
   mov edx, 1        
   int 0x80

exit:    
   
   mov eax, SYS_EXIT   
   xor ebx, ebx 
   int 0x80