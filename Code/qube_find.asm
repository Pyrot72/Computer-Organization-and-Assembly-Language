;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;
;;;;;;;;;	 Cube of a number e.g 20^3 in Assembly Language
;;;;;;;;;	It adding a NUmber that contain sa 20+20+------200 ans
;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[org 0x100]

jmp start

squra_functio:

	push ax
	push bx
	push cx
	push dx
	mov dx , ax 

loop1:
	    add ax ,dx              ; add ax current value and dx old value 
	    dec cx                  ; cx - 1

	    cmp cx ,1               ; compara the cx is equal to 0 if the 0 the function work complet 
	    mov bx , ax             ;total ans save in her also in ax 
	    jnz loop1
	 
pop dx 
pop cx 
pop bx
pop ax 
ret

start:
	mov ax , 20
	mov cx , 20 

	push ax
	push cx

	call squra_functio          ;call function 

	mov ax, 0x4c00
	int 0x21                ;end function all 
