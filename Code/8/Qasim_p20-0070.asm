;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;
;;;;;;;		Write a program in assembly language that display the design given below.
;;;;;;;		ans show in picuter.
;;;;;;;
;;;;;;;
;;;;;;;
;;;;;;;
;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




[org 0x100]
jmp start
data:db 'Assembly Language-Course, FAST university peshawar campus'
msglenght: db 0

data1: db 'I Love Pakistan'
msg2end:



clearscreen:
 push es
    push ax
    push cx
    push di

    mov  ax, 0xb800
    mov  es, ax
    xor  di, di
    mov  ax, 0x0720
    mov  cx, 4000

    cld                 ; auto-increment mode 
    rep stosw           ; rep cx times, store words 
                        ; source is ax for word, al for bytes 
                        ; destination is es:di 
                        ; inc/dec di as well by 2 bytes 

    pop  di
    pop  cx
    pop  ax
    pop  es
    ret




;=====================================clearscreen=================================



printstr1:
mov cx , msglenght - data
;mov bx, 0001h
;mov al,1


mov bh ,0       ;page number pa print hona 
mov bl , 07         ; color 
mov dh , 5              ;row number 5
mov dl ,9                  ;Column 13 

push cs             ; push a data  a count 
pop es                ; pop a next data address

mov bp ,data
mov ah,13h                      ; to print string on screen 
int 10h 
;mov ah , 00h 
;int 16h


ret

;================================print a string university name ===========================================
setBordercolour:

;left color boder 
mov ah , 06h            ;scroll up function 
mov al , al                ;number of line scroll up function 
mov cx , cx                ;uper ch = row and cl == Column 
;mov dx  3501H
mov cl , 0
mov  dh , 23            
mov dl , 01 
mov bh , 0Dfh      ;color 0 write colour  5 is color of baground 
INT 10H 


;right color boder 
mov ah , 06h  
mov al , al 
mov ch , 0
mov cl,78 
mov  dh , 23
mov dl , 79 
mov bh , 0Dfh   
INT 10H 


;upside  color boder 
mov ah , 06h  
xor al , al 
;xor cx , cx 
mov ch , 0
mov cl,0 
mov dx , 004fh
mov bh , 0Dfh 
INT 10H 


;bottm  color boder 
;mov ah , 06h  
xor al , al 
;xor cx , cx 
mov ch , 24
mov cl,0
mov dh,24
mov dl,79
;mov bh , 0Dfh 
INT 10H 

ret 
;=======================================================complete a setBordercolour=======================================

upstarts:

push di 
push es 
push ax 

mov  ax, 0xb800         ; video memory base
mov  es, ax             ; cannot move to es through IMM
mov ax, 5f40h            ; cannot move to es through IMM
mov  di, 4           

nextpos: 
    mov  word [es:di], ax     ; 00 for balck, 20 for space
                                    
    add  di, 2
    cmp  di, 154
    jne  nextpos

    pop ax 
    pop es 
    pop di 
    ret

downstarts:
push di 
push es 
push ax 
mov  ax, 0xb800         ; video memory base
mov  es, ax
mov ax, 5f40h            ; cannot move to es through IMM
mov  di, 3844 
         ; top left location 

nextpos1: 
    mov  word [es:di], ax    ;; 00 for balck, 20 for space

    add  di, 2
    cmp  di, 3996
    jne  nextpos1

    pop ax 
    pop es 
    pop di 
    ret

;;====================================upstarts and downstarts ====================================


drawRectange:
;for a white place 
mov ah , 06h                ;scroll down function 
xor al , al                   ;
mov ch , 7          ;top side color of center
mov cl, 15          ; left side color
mov dh, 15            ;down side
 mov dl, 30             ;right side color
 mov bh, 0Ffh       ; colour of is 2 is green 
 INT 10H 


;for a green space 
mov ah , 06h                ;scroll down function 
xor al , al                   ;
mov ch , 7          ;top side color of center
mov cl, 27          ; left side color
mov dh, 15            ;down side
 mov dl, 60             ;right side color
 mov bh, 02fh       ; colour of is 2 is green 
 INT 10H 

 ;//Print msg in Rectange 
 mov cx , msg2end - data1
 mov al , 1
  mov bh, 0
  mov bl , 07           ; colour  the text and baground
  mov dh ,11        ;row number 12
  mov dl, 33        ;Column 20 
  push cs 
  pop es 
  mov bp , data1            ; to print a string 
  mov ah , 13h 
 int 10H

ret 

;;===================================================== flag ======================================


start:
call clearscreen


call printstr1
call setBordercolour
call drawRectange
call upstarts
call downstarts



    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov ax, 0x4c00 
    int 0x21 
