;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;		 
;;;;;;;
;;;;;;;			Find second even number and second odd number in Assembly Language Programming
;;;;;;;
;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x100]
jmp start
array:dw 2,9,56,43,1,4,3
Even:dw 2
Odd:dw 9
Function:
    push ax
    push bx
    push cx
    push dx
    push si 

mov ax ,[array]
loop1:
    mov dx ,[array + bx ]
    cmp dx , 2
    jnz loop2
    mov si ,dx 
cmp si, [Even]
                    jg even
                    mov [Even] , si  
                    odd:
                    add bx , 2
                    dec cx
                    jnz loop1   
loop2:
 cmp dx , [Odd]
                    jg odd
                    mov [Odd] , dx 
                    even:
                    add bx , 2
                    dec cx
                    jnz loop1
    pop si 
    pop dx
    pop cx
    pop bx 
    pop ax 
                ret
start:
mov cx ,7
push cx 

call Function


mov ax , 0x4c00
int 0x21
