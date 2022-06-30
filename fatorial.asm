section	.data
msg db 'O fatorial do numero inserido :',0xa	
len equ $ - msg			

section .bss
fatorial resb 1
section	.text
   global _start        
	
_start:                 

    mov bx, 3             ;inserir valor para fatorial
    call  _recursao_fatorial
    add   ax, 30h
    mov  [fatorial], ax
    
    mov	  edx, len        ; imprime msg
    mov	  ecx, msg        
    mov	  ebx, 1          
    mov	  eax, 4          
    int	  0x80           

    mov   edx, 1            ;imprime num
    mov	  ecx, fatorial      
    mov	  ebx, 1          
    mov	  eax, 4          
    int	  0x80           
    
    mov	  eax,1          
    int	  0x80  


_recursao_fatorial:
    cmp   bl, 1
    jg    _calculo_fat
    mov   ax, 1
    ret

_calculo_fat:
    dec   bl
    call  _recursao_fatorial
    inc   bl
    mul   bl        ;ax = al * bl
    ret


         