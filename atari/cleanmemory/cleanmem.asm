    PROCESSOR 6502

    SEG code
    ORG $F000       ; define the code origin at $F000

Start:
    SEI             ; disable interrupt
    CLD             ; clear the BCD (decimal math mode)
    LDX #$FF        ; load the X-reg with #$FF
    TXS             ; transfer X-reg to SP-reg

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Zero Page region ($00 to $FF)
; Meaning the entire TIA register space and also RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;