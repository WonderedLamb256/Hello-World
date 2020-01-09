;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Programming Profile: x86 Assembly
; Created: 1979 (Intel 8086)
; Assembler used: NASM
; Comment prefix: semicolon
; Credit: MikeOS devs
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BITS 16 ; NASM declaration to bit count

; Beginning of  bootloader
START:
      ; Set up stack by moving ax register and adding 288 ((4096+512)/16), then placing it in a stack register
      MOV AX, 0x07C0
      ADD AX, 288
      MOV SS, AX ; stack segment
      MOV SP, 4096
      
      MOV AX, 0x07C0
      MOV DS, AX ; data segment
      
      MOV SI, TEXT_STRING ; moves TEXT_STRING into si
      CALL PRINT_STRING ; goto PRINT_STRING function
      
      JMP $ ; loop from here when IP reaches the end of code
      
      TEXT_STRING DB 'Hello, world!', 0 ; Hello, world!
      
PRINT_STRING:
      MOV AH, 0x0E ; 0E in hex, ah = higher half of ax, 0E = int 10h function

.REPEAT:
      LODSB ; load string data
      CMP AL, 0
      JE .DONE
      INT 0x10 ; call BIOS interrupt 10h/0x10
      JMP .REPEAT ; loop
      
.DONE:
      RET
      
      
      
      TIMES 510-($-$$) DB 0
      DW 0xAA55
    
