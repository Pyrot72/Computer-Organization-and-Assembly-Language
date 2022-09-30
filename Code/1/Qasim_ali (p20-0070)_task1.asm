;;;;;;;;
Q. Write an assembly language program to add all the digits of your Roll No and store the
sum in memory.


. Store all the digits of Roll No in the memory.
. Use jumps to add the digits.
. If the number is 0, then the program should not add that digit and move to the next digit.
. Store the sum in another variable.
. Note: Make it sure to use your own Roll No, otherwise zero marks will be awarded.
;;;;;;;;


[org 0x100]

mov ax , 0
mov bx , num1
mov cx , 0
mov dx , 10
l1:
    
    mov cx  , [bx]
    add bx , 2
    cmp cx   , 0
    jnz l2

l2:
    add ax , cx 
    sub dx ,1

jnz l1

mov [result] , ax


mov ax , 0x4c00
int 0x21

num1:dw 2,0,0,0,7,0
result : dw 0
