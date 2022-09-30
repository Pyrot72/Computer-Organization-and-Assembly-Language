[org 0x0100]

    jmp start

message:     db   'p200070'  
length:      dw   7

clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    nextloc:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 4000
        jne  nextloc

    pop  di 
    pop  ax
    pop  es
    ret

firstfunction:

    push ax 
    push es 
    push di 


                mov  ax, 0xb800                                                     ; video memory base
                mov  es, ax                                                ; cannot move to es through IMM
                mov  di, 640  
                
                main:                                                        ; top left location  
                    mov  word [es:di], 0x0F2A                            ;; 00 for balck                 
                    
                    ; [es:di] its mean move the operands(0x042B) from es to di location of video memory. 
                    add  di, 2
                    cmp  di, 2076
                    jne main


                    pop di 
                    pop es
                    pop ax
                    ret


color1:
   
    push ax 
    push es 
    push di 


                mov  ax, 0xb800                                                     ; video memory base
                mov  es, ax                                                ; cannot move to es through IMM
                mov  di, 2080  
                
                main1:                                                        ; top left location  
                    mov  word [es:di], 0xDF20                           ;; 00 for balck                 
                    
                    ; [es:di] its mean move the operands(0x042B) from es to di location of video memory. 
                    add  di, 2
                    cmp  di, 4000
                    jne main1


                    pop di 
                    pop es
                    pop ax
                    ret



printstr:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 ; video memory base
    mov es, ax 
    mov di , 2146
   ;mov di, 648   
            
    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x0F     ;only need to do this once ; for color, 07 is code of  Dark gray

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
        
         ;dec cx 
         ;jnz nextchar     

        ; alternatively 
        loop nextchar 


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 


start: 
    call clrscr 
   call firstfunction

  call color1
    push ax


    mov ax, message 
    push ax 
    push word [length]
    call printstr 

    



    ; wait for keypress 
    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov ax, 0x4c00 
    int 0x21 

