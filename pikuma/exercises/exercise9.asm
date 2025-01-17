 	processor 6502
 	seg Code ; Define a new segment named "Code"
 	org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
 	LDA #1 ; Initialize the A register with the decimal value 1
Loop:
 	CLC
    ADC #1; Increment A
	CMP #10; Compare the value in A with the decimal value 10
	BNE Loop; Branch back to loop if the comparison was not equals (to zero)
	JMP Start
 	org $FFFC ; End the ROM always at position $FFFC
 	.word Start ; Put 2 bytes with reset address at memory position $FFFC
 	.word Start ; Put 2 bytes with break address at memory position $FFFE