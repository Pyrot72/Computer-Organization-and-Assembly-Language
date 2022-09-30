;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;
;;;;;;;;;   	write a program to color the all side of screen and create a one square in center and wite a string? 
;;;;;;;;;	"I LOVE YOU "
;;;;;;;;;	The color is pink  its from use the change the color.
;;;;;;;;;
;;;;;;;;;
;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





[org 0x100]
jmp start


data:db 'Assembly Language-Course, FAST university peshawar campus'
msglenght: db 0

data1: db 'I Love Pakistan'
msg2end:

clearscreen:
mov AH , 06h                            ;scroll up function 
mov Al, Al                                ;number line which you 
xor cx , cx 
;mov ch , 0
;mov cl , 0


mov Dx, 184FH                           ;lower right corner DH =row DL= Column
;mov dh ,18
;mov dl,79
mov BH ,07h                             ;white on balck
INT 10H
ret 


setmode:
    ;mov ax, 0003h 
    mov al, 03h 
    mov ah, 00h 
    int 10h

    ret


setcursor:
    ;mov dx , 0C23h
    mov dh, 13
    mov dl, 35
    mov bh, 0 
    mov ah,02h
    int 10h

    ret

printstart:
mov cx , 5                  ;replictioncount
mov bx , 0007h              ;BH is dispalypage (0) 
mov ah,09h                  ;BIOS call 
mov al, 2ah                 ;2a === "*" charater
int 10h 
ret 


printstr1:
mov cx , msglenght - data
;mov bx, 0001h
mov al,1



mov bh ,0       ;page number pa print hona 
mov bl , 07         ; color 

mov dh , 5              ;row number 5
mov dl ,13                  ;Column 13 

push cs             ; push a data  a count 
pop es                ; pop a next data address

mov bp ,data
mov ah,13h                      ; to print string on screen 
int 10h 


;mov ah , 00h 
;int 16h

ret


setBordercolour:

;left color boder 
mov ah , 06h            ;scroll up function 
mov al , al                ;number of line scroll up function 
mov cx , cx                ;uper ch = row and cl == Column 
;mov dx  3501H
mov  dh , 23            
mov dl , 01 
mov bh , 05fh      ;color 0 write colour  5 is color of baground 
INT 10H 


;right color boder 
mov ah , 06h  
mov al , al 
mov ch , 0
mov cl,78 
mov  dh , 24
mov dl , 79 
mov bh , 05fh   
INT 10H 


;upside  color boder 
mov ah , 06h  
xor al , al 
;xor cx , cx 


mov ch , 00h 
mov cl,00h 
mov dx , 014fh
mov bh , 05fh 
INT 10H 



;bottm  color boder 
;upside  color boder 
mov ah , 06h  
xor al , al 
;xor cx , cx 


mov ch , 23
mov cl,0
mov dh,24
mov dl,79
mov bh , 05fh 
INT 10H 



ret 




drawRectange:
mov ah , 06h                ;scroll down function 
xor al , al                   ;
mov ch , 7
mov cl, 20 
mov dh, 15
 mov dl, 60 
 mov bh, 0dfh
 INT 10H 

 ;//Print msg in Rectange
 mov cx , msg2end - data1
 mov al , 1
  mov bh, 0
  mov bl , 07           ; colour  the text and baground
  mov dh ,11        ;row number 12
  mov dl, 31        ;Column 20 
  push cs 
  pop es 
  mov bp , data1            ; to print a string 
  mov ah , 13h 
 int 10H

ret 




start:

call clearscreen
;call setmode
;call setcursor
;call printstart
;call printstr1
call setBordercolour

call drawRectange
    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov ax, 0x4c00 
    int 0x21 
