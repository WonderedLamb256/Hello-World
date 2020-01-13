; Language: x86 Assembly, Comment Prefix: ;

BITS 16 ; NASM directive: "this is 16 bits"
ORG 0x7C00 ; NASM directive: "start this at 0x7C00"

SECTION .TEXT ; code to be ran

      BOOT: ; the initial code
            MOV AH,0x0E ; Load character in TTY mode, used by 0x10 interrupt
      
            MOV BL,5 ; When MUL is called, it uses BL (BX-lower) to get the multiplier. The multiplier is 5.
            MOV AL,10 ; When MUL is called, it uses AL (AX-lower) to get the multiplicand. The multiplicand is 10.

            ; Multiplication Formula: (multiplicand) x (multiplier) = (result)
            ; MUL Formula: (AL) x (BL) = (stored temporarily in CPU)

            MUL BL ; It also checks AL, don't worry.

            ; If the register contains a signed integer, use IMUL instead of MUL!

            JNZ NOTZERO ; JNZ = [J]ump if the result is [N]ot equal to [Z]ero
            JZ ZERO ; JZ = [J]ump if the result is equal to [Z]ero

      .NOTZERO: ; Jumps via JNZ NOTZERO (Local/. labels are attributed to the parent (no .) label)
            MOV SI,ZEROFALSE ; Moves SI (used as text pointer) to ZEROFALSE label
            LODSB ; load the bytes contained as a string
            OR AL,AL ; Checks using OR logic gate to see if AL = 0 (OR gate looks for TRUE in either of them)
            JZ HALT ; Jump if zero to HALT label
            INT 0x10 ; Magically makes data appear on screen
            JMP .NOTZERO ; Loop back to .NOTZERO
      .ZERO: ; Jumps via JZ ZERO
            MOV SI,ZEROTRUE ; Moves SI (used as text pointer) to ZEROTRUE label
            LODSB ; load the bytes contained as a string
            OR AL,AL ; Checks using OR logic gate to see if AL = 0 (OR gate looks for TRUE in either of them)
            JZ HALT ; Jump if zero to HALT label
            INT 0x10 ; Magically makes data appear on screen
            JMP .ZERO ; Loop back to .ZERO
      HALT: ; Jumps via JZ HALT
            CLI ; Clear BIOS interrupts that are set
            HLT ; Halt the processor
SECTION .DATA ; used for storing data that gets used like variables
      ZEROTRUE: DB 'Number = 0',0 ; Text data (DB = Data Form Byte)
      ZEROFALSE: DB 'Number =/= 0',0 ; Text data
      
      TIMES 510 - ($-$$) DB 0 ; Zeroes out the rest of the MBR
      DW 0xAA55 ; Bootloader Signature: the BIOS only boots a bootloader if it has this word (DW = Data Form Word)
