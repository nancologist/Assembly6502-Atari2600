    processor 6502
    include "vcs.h"
    include "macro.h"

    SEG code
    ORG $F000       ; We always start the Cartridge at this address!

Start:
    CLEAN_START     ; Macro to sfely clear memory and TIA

; Start a new frame by truning on VBLANK and VSYNC : ---------------------------------------
NextFrame:
    LDA #2          ; Same as binary value %00000010 
    STA VBLANK      ; Turn VBlank on by setting %00000010 to it!
    STA VSYNC       ; Turn on VSYNC
; ------------------------------------------------------------------------------------------
; ------------------------------------------------------------------------------------------

; Generate the Three Lines of VSYNC : ---------------------------------------
    STA WSYNC       ; First scanline
    STA WSYNC       ; Second scanline
    STA WSYNC       ; Third scanline

    LDA #0
    STA VSYNC       ; Turn off VSYNC
; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------

; Let the TIA output the recommended 37 Scanlines of VBLANK : ---------------
    LDX #37         ; X = 37 (to count 37 scanlines)
LoopVBlank:
    STA WSYNC       ; Hit WSYNC and wait for the next Scanline
    DEX             ; X--
    BNE LoopVBlank  ; Loop while X != 0

    LDA #0
    STA VBLANK      ; Turn off VBLANK
; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------

; Draw 192 Visible Scanlines (kernel) : -------------------------------------
    LDX #192        ; Counter for 192 visible scanlines
LoopVisible:
    STX COLUBK      ; Set the background color 
    STA WSYNC       ; Wait for the next scanline
    DEX             ; X--
    BNE LoopVisible ; Loop while X != 0
; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------

; Output 30 more VBLANK lines (overscan) to complete our frame : ------------
    LDA #2
    STA VBLANK      ; Hit and turn on VBLANK

    LDX #30         ; Counter for 30 scanlines
LoopOverscan:
    STA WSYNC       ; Wait for next scanline
    DEX             ; X--
    BNE LoopOverscan; Loop while X != 0

    JMP NextFrame
; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------

; Complete the ROM size to 4KB : --------------------------------------------
    ORG $FFFC
    .word Start
    .word Start
; ---------------------------------------------------------------------------
; ---------------------------------------------------------------------------

; Generate the Three Lines of VSYNC : ---------------------------------------
; ---------------------------------------------------------------------------