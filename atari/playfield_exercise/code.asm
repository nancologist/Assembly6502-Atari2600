    processor 6502

;; Include required files with definitions and macros
    include "vcs.h"
    include "macro.h"

;; Start ROM code
    seg code
    org $f000

Reset:
    CLEAN_START

    ldx #$80            ; blue for background color
    stx COLUBK

    lda #$1C            ; yellow for playfield color
    sta COLUPF

;; Start a new frame by configuring VBLANK and VSYNC
StartFrame:
    lda #2
    sta VBLANK          ; turn VBLANK on
    sta VSYNC           ; turn VSYNC on

;; Generate 3 lines of VSYNC:
    REPEAT 3
        sta WSYNC       ; 3 scanlines for VSYNC
    REPEND

;; Turn VSYNC off:
    lda #0
    sta VSYNC

;; Let TIA outputs the 37 recommended lines of VBLANK:
    REPEAT 37
        sta WSYNC
    REPEND

;; Turn VBLANK off:
    lda #0
    sta VBLANK

;; Set the CTRLPF register to allow playfield reflection
    ldx #%00000001
    stx CTRLPF          ; CTRLPF register (D0 means reflect the PF (playfield))

;; Draw the 192 visible scanline: ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ; Skip 7 scanlines with no PF set (first 7 blue lines)
    ldx #0
    stx PF0
    stx PF1
    stx PF2
    REPEAT 7
        sta WSYNC
    REPEND

    ; Create the 2nd 7 lines (beginning and ending with blue and in between yellow line (top border of the arena))
    ldx #%11100000
    stx PF0
    ldx #%11111111
    stx PF1
    stx PF2
    REPEAT 7
        sta WSYNC
    REPEND

    ; Set the next 164 scanlines only with PF0 third bit enabled
    ldx #%01100000
    stx PF0
    ldx #0
    stx PF1
    ldx #%10000000
    stx PF2
    REPEAT 164
        sta WSYNC
    REPEND

    ; Create the before last 7 scanlines (beginning and ending with blue and in between yellow line (top border of the arena))
    ldx #%11100000
    stx PF0
    ldx #%11111111
    stx PF1
    stx PF2
    REPEAT 7
        sta WSYNC
    REPEND

    ; Last 7 scanlines with no PF set (blue)
    ldx #0
    stx PF0
    stx PF1
    stx PF2
    REPEAT 7
        sta WSYNC
    REPEND

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Output 30 more VBLANK overscan lines to complete the frame
    lda #2
    sta VBLANK
    REPEAT 30
        sta WSYNC
    REPEND
    lda #0
    sta VBLANK

;; Load to next frame:
    jmp StartFrame

;; Complete ROM size
    org $fffc
    .word Reset
    .word Reset