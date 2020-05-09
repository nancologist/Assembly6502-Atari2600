    PROCESSOR 6502
    SEG code
    ORG $F000       ; define the code origin at $F000

Start:
    SEI             ; disable interrupt
    CLD             ; clear the BCD (decimal math mode)
    LDX #$FF        ; load the X-reg with #$FF
    TXS             ; transfer X-reg to SP-reg

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Zero Page region ($FF to $00)
; Meaning the entire TIA register space and also RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    LDA #0          ; A-reg = 0
    LDX #$FF        ; X = 255

MemLoop:
    STA $0,X        ; store A-reg val (0 <- LINE-17) at address ($0 + X ($FF <- LINE-18) ) 
    DEX             ; Decrement X-reg val by one (X--)
    BNE             ; loop until X == 0 (z-flag set to 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ORG $FFFC       ; go to position $FFFC of ROM-Cartridge
    .word Start     ; reset vector at $FFFC (where program starts)
    .word Start     ; interrupt vector at $FFFE (unused in Atari-VCS system)