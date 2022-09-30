;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;; 		 
;;;;;;;;;		Generater a ramdan number 1 to 10  in Assembly Language
;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x100]

number: db 10 
jmp start 
Screenclean:
push ax
push es 
push di 
            mov ax , 0xb800
            mov es , ax 
            xor di, di
            mov ax,0x0765
            mov cx ,2000
            cld 
            rep stosw
pop di 
pop es
pop ax
ret
ramdan_number:
    push ax 
    push bx

    mov al, byte[number]
    add al,31
    mov byte[number], al 
    div bl 
    mov al , ah 


    pop ax 
    pop bx 
    ret

printnumber:
    push ax 
    push bx 
    push bp 
    push bp, sp 
    push dx
    push es 
    push di
    

start:

call  Screenclean

mov bl , number
call ramdan_number

call printnumber

mov ah,0x1
int 0x21

mov ax , 0x4c00
int 0x21


