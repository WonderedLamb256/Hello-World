;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helloWorld() Assembly Project
; Uses x86 Assembly + NASM     
; Based on Alex Parker's loader
; Stage: MBR
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BITS 16                       ; NASM compiler info: use 16 bits
ORG 0x7C00                    ; NASM compiler info: goto offset 7C00

BOOT:
      MOV SI,HELLO
      MOV AH,0x0E
      
.LOOP:
      LODSB
      OR AL,AL
      JZ HALT
      INT 0x10
      JMP .LOOP
      
HALT:
      CLI                     ; CLI - clears/closes the BIOS interrupt flag
      HLT                     ; HLT - force the processor to halt
      
HELLO: DB "Hello world!",0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                              ;
TIMES 510 - ($-$$) DB 0       ; zeroes out the rest of the MBR
DW 0xAA55                     ; 0xAA55: word AA55 (boot flag)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; EOF
