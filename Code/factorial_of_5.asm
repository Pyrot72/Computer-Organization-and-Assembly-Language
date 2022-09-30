;;Find the factorial of 5 in assembly language through stack. use sub routine and loop


[org 0x100]

jmp start

result:dw 0

factoria:


mov cx , 5
mov ax , 1
mov bx , 0
mov dx , 5

loop1:

        shl dx ,1
    jc skipAddition
            add [result], dx
            add [result ] , ax
            add ax,2
            mov bx ,[result]
            
        
skipAddition:
        shl ax , 1
        dec cx
        jnz loop1
ret




start:

call factoria

mov ah , 0x1
int 0x21


mov ax , 0x4c00
int 0x21
