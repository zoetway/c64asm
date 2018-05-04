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
	
	lda #$80
	sta $07f8
	lda #$01
	sta $d015
	lda #$80
	sta $d000
	sta $d001

loop:	
	jmp loop
	org $2000
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$cc,$00,$01,$fe,$00,$01,$ae,$00,$01,$ae,$00,$03,$ff
	.byte $00,$07,$ff,$80,$07,$ff,$80,$03,$ff,$00,$00,$00,$00,$00,$00,$00
	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$05
