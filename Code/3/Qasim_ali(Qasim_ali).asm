;;;;;;;;;;;;;;;;;;
4 bits number save in 8 bits memony? 
out show in memony.  
;;;;;;;;;;;


[org 0x100]
jmp start 
multiplicand:db 13      ;4 bits number save of 8 bits
multiplier:db 5          ;4 bits 
result:db 0               ;8 bits number 


start:
    mov cl , 4              ;how many times we need to run the problem
    mov bl ,[multiplicand]
    mov dl ,[multiplier]
checkbit:
        shr dl ,1
    jnc skipAddition
            add [result] , bl
        
skipAddition:
        shl bl , 1
        dec cl
        jnz checkbit

        mov ax , 0x4c00
        int 0x21 




