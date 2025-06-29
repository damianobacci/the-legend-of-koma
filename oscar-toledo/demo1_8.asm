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
        sta WSYNC
        lda #2
        sta VSYNC
        sta WSYNC
        sta WSYNC
        sta WSYNC
        lda #0
        sta VSYNC
        ldx #36
TOP:
	sta WSYNC
        dex
        bne TOP
        lda #0
        sta VBLANK
        
        ldx #96
VISIBLE:
	sta WSYNC
        dex
        bne VISIBLE
        lda #$F8
        sta COLUBK
        ldx #96
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
  