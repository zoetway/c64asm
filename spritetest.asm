	processor 6502
	org $1000

init_screen:
	lda #$00	;load black color
	sta $d020 	;transfer acc to screen memory
	sta $d021 	;transfer acc to border memory
clear:
	lda #$20 	;load space character
	sta $0400,x 	;transfer acc to character memory
	sta $0500,x
	sta $0600,x
	dex
	bne clear 	;branch to clr if x is not zero
	
	lda #%00000001	;binary set sprite to scale x2
	sta $D01D	;store binary value from acc to scalex2 x-axis
	sta $D017	;store binary value from acc to scalex2 y-axis

	lda #$0E	;load light blue color in acc
	sta $D027	;copy acc in sprite 1 color memory
	lda #$80	;value of 80 points to memory address 2000?
	sta $07f8	;load acc into sprite 1 memory address
	lda #$01	;load value of 1 in acc to turn on sprite
	sta $d015	;load acc in memory to turn on sprite 1
	lda #$80	;load value 80 in acc for position
	sta $d000	;load acc in sprite 1 x coordinate mem
	sta $d001	;load acc in sprite 1 y coordinate mem
loop:	
	jmp loop
	org $2000
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$cc,$00,$01,$fe,$00,$01,$ae,$00,$01,$ae,$00,$03,$ff
	.byte $00,$07,$ff,$80,$07,$ff,$80,$03,$ff,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$05