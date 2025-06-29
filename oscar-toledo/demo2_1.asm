	processor 6502
        include "vcs.h"
        
        org $F000
START:
	    sei
        cld
        ldx #$FF
        txs
        lda #$00
CLEAR:
	sta 0,x
        dex
        bne CLEAR
SHOW_FRAME:
	lda #$88
        sta COLUBK
        lda #$0f
        sta COLUPF
        sta WSYNC
        lda #2
        sta VSYNC
        sta WSYNC
        sta WSYNC
        sta WSYNC
        lda #0
        sta VSYNC
        
        ; ball horizonal position (23 NOP for center)
        sta WSYNC
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        sta RESBL
        ldx #35
TOP:
	sta WSYNC
        dex
        bne TOP
        sta VBLANK
        ldx #95
VISIBLE:
	sta WSYNC
        dex
        bne VISIBLE
	sta WSYNC
        lda #$02
        sta ENABL
        sta WSYNC
        lda #$00
        sta ENABL
        lda #$F8
        sta COLUBK
        ldx #95
VISIBLE2:
	sta WSYNC
        dex
        bne VISIBLE2
        lda #2
        sta VBLANK
        ldx #30
BOTTOM:
	sta WSYNC
        dex
        bne BOTTOM
        JMP SHOW_FRAME
        org $FFFC
        .word START
        .word START