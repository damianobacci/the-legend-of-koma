	processor 6502
 	seg Code ; Define a new segment named "Code"
 	org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
	LDA #1; Load the A register with the decimal value 1
	LDX #2; Load the X register with the decimal value 2
	LDY #3; Load the Y register with the decimal value 3
	INX; Increment X
	INY; Increment Y
    CLC
	ADC #1; Increment A
 	DEX; Decrement X
 	DEY; Decrement Y
 	SEC
    SBC #1; Decrement A
    JMP Start
 	org $FFFC ; End the ROM always at position $FFFC
 	.word Start ; Put 2 bytes with reset address at memory position $FFFC
 	.word Start ; Put 2 bytes with break address at memory position $FFFE