section	.text
   global _start        
	
_start:                 

   mov bx, 3             ;inserir valor para fatorial
   call  proc_fact
   add   ax, 30h
   mov  [fact], ax
    
   mov	  edx,len        ; imprime msg
   mov	  ecx,msg        
   mov	  ebx,1          
   mov	  eax,4          
   int	  0x80           

   mov    edx,1            ;imprime num
   mov	  ecx,fact       
   mov	  ebx,1          
   mov	  eax,4          
   int	  0x80           
    
   mov	  eax,1          
   int	  0x80           