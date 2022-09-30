;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; 
;;;;;;;
;;;;;;;		Multiple a two number in 4 bit and store a ans in 8 bit using Assembly Language Programming in Nasm 16 bits
;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x100]
jmp start
multiplicand:db 13      ;4 bits number save of 8 bits
multiplier:db 5          ;4 bits 
result:db 0               ;8 bits number 


start:
mov cl, 4
mov bl , [multiplicand]
mov dl , [multiplier]
checkbit:
shr dl ,1
jnc skips
    add [result], bl 

skips:
shl bl ,1 
dec cl 
jnz checkbit

mov ax , 4ch
int 21h



