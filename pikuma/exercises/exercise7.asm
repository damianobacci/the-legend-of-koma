	processor 6502
 	seg Code ; Define a new segment named "Code"
 	org $F000 ; Define the origin of the ROM code at memory address $F000
Start:
 	LDA #10; Load the A register with the decimal value 10
 	STA $80; Store the value from A into memory position $80
 	INC $80; Increment the value inside a (zero page) memory position $80
 	DEC $80; Decrement the value inside a (zero page) memory position $80
 	JMP Start
    org $FFFC ; End the ROM always at position $FFFC
 	.word Start ; Put 2 bytes with reset address at memory position $FFFC
 	.word Start ; Put 2 bytes with break address at memory position $FFFE