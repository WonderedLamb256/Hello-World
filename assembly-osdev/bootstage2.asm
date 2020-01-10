;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helloWorld() Assembly Project
; Uses x86 Assembly + NASM     
; Based on Alex Parker's loader
; Stage: MBR
; Version: V2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

BITS 16
ORG 0x7C00

BOOT:
      MOV AX,0x2401
      INT 0x15                ; A20 BIT = TRUE
      MOV AX,0x3
      INT 0x10                ; VGA MODE = 3
      LGDT [GDT_POINTER]      ; checks GDT_POINTER function bytes for GDT
      MOV EAX,CR0
      OR EAX,0x1
      MOV CR0,EAX
      JMP CODE_SEG:BOOT2      ; long jump to GDT code segment
      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
      
GDT_START:
      DQ 0x0
      
GDT_CODE:
      DW 0xFFFF
      DW 0x0
      DB 0x0
      DB 10011010b
      DB 11001111b
      DB 0x0
      
GDT_DATA:
      DW 0xFFFF
      DW 0x0
      DB 0x0
      DB 10010010b
      DB 11001111b
      DB 0x0
      
GDT_END:
      
GDT_POINTER:
      DW GDT_END - GDT_START
      DD GDT_START
      
CODE_SEG EQU GDT_CODE - GDT_START
DATA_SEG EQU GDT_DATA - GDT_START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             ; 32 bit mode

BITS 32

BOOT2:
      MOV AX,DATA_SEG        ; Some GDT setup
      MOV DS,AX
      MOV ES,AX
      MOV FS,AX
      MOV GS,AX
      MOV SS,AX
      
      MOV ESI,HELLO          ; Some prep for Hello World
      MOV EBX,0xB8000        ; Ask for VGA text buffer
      
.LOOP:
      LODSB                  ; Load string
      OR AL,AL
      JZ HALT                ; Jump if AL = 0 (JZ = Jump if Zero)
      OR EAX,0x0100
      MOV WORD [EBX],AX
      ADD EBX,2
      JMP .LOOP
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
 
HALT:
      CLI
      HLT
      
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HELLO: DB "Hello world!",0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                             ; Final MBR definitions
TIMES 510 - ($-$$) DB 0      ; Zero out the rest
DB 0xAA55                    ; MBR boot signature
                             ; The End!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
