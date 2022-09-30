;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;
;;;;;;;;;     Find a mix and min number in Assembly Language 
;;;;;;;;;
;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x100]
jmp start

element:dw 11,2,33,4,5,6,7,8,88,77

maximum:dw 0
minimum:dw 0

maximuminteger:

push ax 
push bx
push cx
push dx
    mov bx ,0
    mov dx ,0
loop1:
    mov dx ,[element + bx]

    cmp dx , [element+ bx + 2]
    jl end
    mov [maximum] , dx 
    jmp end
end:
    add bx , 2
    sub cx , 1
    cmp cx , 5
    jnz loop1
pop dx 
pop cx 
pop bx 
pop ax 
ret 

;=========================================minimuminteger================================================;

minimuminteger:

push ax 
push bx
push cx
push dx
    mov bx ,12
    mov dx ,0
    mov cx , 4    

looop1:
        mov dx, [element + bx]
        cmp [minimum], dx
        jl breakloop

            mov [minimum], dx
        


 breakloop:
            add bx , 2
            sub cx , 1
            jnz looop1       

pop dx 
pop cx 
pop bx 
pop ax 
ret 




start: 

    mov ax, [element + 10]
    mov [minimum], ax

    
    mov ax , element
    mov cx, 10

    push ax 
    push cx

    call  maximuminteger

    call minimuminteger
    
    mov ah , 0x1
    int 0x21
    
    mov ax , 0x4c00
    int 0x21
    
    mov ax, 0x4c00
    
    int 0x21
