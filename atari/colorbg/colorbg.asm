    processor 6502
    include "vcs.h"
    include "macro.h"

    SEG code
    ORG $F000       ; defines the orgin of the ROM at $FOOO

START:
    ;CLEAN_START     ; A macro to safely clear the memory.

; Set background luminosity color to yellow: -------------------------------------------
    LDA #$1E        ; Load yello color into A ($1E is yellow in NTSC)
    STA COLUBK      ; Store A-reg value into Background-Color (with Memory Address $09)
; --------------------------------------------------------------------------------------

    JMP START       ; Repeat From START.

; Fill ROM to its Capacity (4KB):
    ORG $FFFC       ; Defines orgin to $FFFC
    .word START     ; Reset vector at $FFFC (where the program starts)
    .word START     ; Interrupt vector at $FFFE (unused in the VCS)
