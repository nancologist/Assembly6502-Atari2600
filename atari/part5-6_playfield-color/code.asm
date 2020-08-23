    processor 6502

;; Include required files with definitions and macros
    include "vcs.h"
    include "macro.h"

;; Start ROM code
    seg
    org $f000

Reset:
    CLEAN_START         ; macro to clean memory and TIA

    ldx #$80            ; blue for background color
    stx COLUBK

    lda #%1111           ; #$1C yellow for playfield color OR set it to #%1111 for white.
    sta COLUPF

;; Set the TIA registers for the color of Player0 and Player1:
    lda #$48
    sta COLUP0          ; light red for Player0

    lda #$c6
    sta COLUP1          ; light green for Player1

;; Start a new frame by configuring VBLANK and VSYNC
StartFrame:
    lda #2
    sta VBLANK          ; turn VBLANK on
    sta VSYNC           ; turn VSYNC on

;; Generate 3 VSYNC scanlines:
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Draw the 192 visible scanlines:
VisibleScanlines:
    ; Draw 10 empty scalines at the top of the frame
    REPEAT 10
        sta WSYNC
    REPEND

    ; Display 10 scalines for the scoreboard number.
    ; Pull data from an array of bytes defined at NumberBitmap
    ldy #0
ScoreboardLoop:
    lda NumberBitmap,Y
    sta PF1
    sta WSYNC
    iny
    cpy #10
    bne ScoreboardLoop

    lda #0
    sta PF1         ; Disable applied Bitmap to PF1

    ; Draw 50 empty scanlines between scoreboard and player
    REPEAT 50
        sta WSYNC
    REPEND

    ; Display 10 Scanlines for the Player 0 graphics.
    ; (Pull data from an array of bits defined at PlayerBitmap.)
    ldy #0
Player0Loop:
    lda PlayerBitmap,Y
    sta GRP0        ; Draw Player0 (GRP0: Graphical Player 0)
    sta WSYNC
    iny
    cpy #10
    bne Player0Loop

    lda #0
    sta GRP0         ; Disable applied Bitmap to the Player 0

    ; Display 10 Scanlines for the Player 1 graphics.
    ; (Pull data from an array of bits defined at PlayerBitmap.)
    ldy #0
Player1Loop:
    lda PlayerBitmap,Y
    sta GRP1        ; Draw Player0 (GRP0: Graphical Player 1)
    sta WSYNC
    iny
    cpy #10
    bne Player1Loop

    lda #0
    sta GRP1         ; Disable applied Bitmap to the Player 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Draw the reminaing 102 scanlines, since we already
;; used 10+10+50+10+10=90 scanlines in the current frame.
    REPEAT 102
        sta WSYNC
    REPEND

;; Output 30 more VBLANK overscan lines to compelete our frame
    REPEAT 30
        sta WSYNC
    REPEND

;; Load to next frame:
    jmp StartFrame

;;;;;;;;;;;;;;;;; Bitmaps ;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFE8
PlayerBitmap:
    .byte #%01111110
    .byte #%11111111
    .byte #%10011001
    .byte #%11111111
    .byte #%11111111
    .byte #%11111111
    .byte #%10111101
    .byte #%11000011
    .byte #%11111111
    .byte #%01111110

    org $FFF2
NumberBitmap:
    .byte #%00001110
    .byte #%00001110
    .byte #%00000010
    .byte #%00000010
    .byte #%00001110
    .byte #%00001110
    .byte #%00001000
    .byte #%00001000
    .byte #%00001110
    .byte #%00001110

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Complete ROM size
    org $FFFC
    .word Reset
    .word Reset