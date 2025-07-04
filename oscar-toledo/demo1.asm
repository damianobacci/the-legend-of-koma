	PROCESSOR 6502
	INCLUDE "vcs.h"

	ORG $F000
START:
	SEI
	CLD
	LDX #$FF
	TXS
	LDA #$00
CLEAR:
	STA 0,X
	DEX
	BNE CLEAR

SHOW_FRAME:
	LDA #$88
	STA COLUBK

	STA WSYNC
	LDA #2
	STA VSYNC
	STA WSYNC
	STA WSYNC
	STA WSYNC
	LDA #0
	STA VSYNC

	LDX #36
TOP:
	STA WSYNC
	DEX
	BNE TOP
	LDA #0
	STA VBLANK

	LDX #192
VISIBLE:
	STA WSYNC
	DEX
	BNE VISIBLE

	LDA #2
	STA VBLANK
	LDX #30
BOTTOM:
	STA WSYNC
	DEX
	BNE BOTTOM

	JMP SHOW_FRAME

	ORG $FFFC
	.word START
	.word START