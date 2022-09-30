;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

		Take your roll no (e.g 218742) as a multiplicant.
		We have 32 bit a multiplicatant and 8 bit multiplier.
		We are ausming that the all registers having size of 8 bits.
		Write Assembly code to perfrom Bit Multiplication using
		exdended shift.
		num1: dd (your rollno six digits )
		num2: dw 196
		Hint
		Memory allocation:
		- All variables must be declared, and memory space for each allocated.
		- Data definition directive can be followed by a single value, or a list of
		values separated by commas
		- Different data definition directives for different size types of memory
		1. DB - define byte (8 bits)
		2. DW - define word (16 bits)
		3. DD - define double word (32 bits)
		4. DQ - define quad word (64 bits)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x100]

jmp start

multiplicand:   dd 0x30D86   ;  0b 00000000 00000011 00001101 10000110           ans is = 39203528
multiplier:     dw 0xC4      ; 0b  000000000 11000100
result:         dd 0       ; should be ans is = 39203528


start:

mov  cl, 32
mov  dl, [multiplier]


checkbit: 
    shr  dl, 1
    jnc  skip

        mov  al, [multiplicand]      ; extended addition 
        add  byte [result], al
        mov  al, [multiplicand + 1]
        add  byte [result+1], al
        mov al , [multiplicand +2]
        add  byte [result+2], al
        mov al , [multiplicand + 3]
        add  byte [result+3], al

        adc  byte [result + 1], al 

    skip:
    shl  byte [multiplicand], 1      ; extended shift
          

    rcl  byte [multiplicand + 1], 1     ;2nd 8 bit 
    rcl  byte [multiplicand + 2], 1     ;3nd 8 bit 
    rcl  byte [multiplicand + 3], 1     ;4nd 8 bit 
    

    
    
    dec  cl
    jnz  checkbit




; exit syscall 
mov  ax, 0x4c00
int  0x21
