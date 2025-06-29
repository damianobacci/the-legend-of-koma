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
        sta COLUP0
        lda #$00
        sta COLUP1
        
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
        sta RESP0
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        sta RESP1
        ldx #35
TOP:
	sta WSYNC
        dex
        bne TOP
        sta VBLANK
        ldx #92
VISIBLE:
	sta WSYNC
        dex
        bne VISIBLE
	STA WSYNC	; One scanline
	LDA #$3c	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$42	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$a5	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$81	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$a5	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$99	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$42	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$3c	; 
	STA GRP0
	STA GRP1

	STA WSYNC	; One scanline
	LDA #$00	; 
	STA GRP0
	STA GRP1

        lda #$F8
        sta COLUBK
        ldx #91
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