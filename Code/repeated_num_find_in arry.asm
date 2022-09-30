;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; 
;;;;;;;			Find a repeated number in arry used in  Assembly Language
;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


[org 0x100]
jmp start
arry:dw 1,2,2,4,5
result:dw 0

repeatedNumber:
push ax 
push bx
push cx
push dx 
push si 
mov bx , 0


loop1:
    mov  ax,[arry + bx]
    cmp  ax, [arry + bx + 2]
    je loop2
    add dx , ax 

loop2:
    add bx , 2
    sub cx , 1
    jnz loop1



pop dx
pop cx
pop bx
pop ax
pop si 
ret

start:

mov si , arry
mov cx , 5

push si 
push cx
call repeatedNumber

mov ax ,0x4c00
int 0x21




