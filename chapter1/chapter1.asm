	ORG	0100H
START:
	; ???ݸر
	CALL	CLS
	; ??ڲ԰?ޮ???
	LD	B,6
	LD	HL,PY
	LD	D,(HL)	; Y
	LD	HL,PX
	LD	E,(HL)	; X
	LD	HL,PLAYER
	CALL	0BFD0H
	; BREAK??ò
	CALL	0BE53H
	CP	051H
	JP	NZ,START
	; RETURN
	RET
; ؿ??
PLAYER:	DB	16,150,121,121,150,16
PX:	DB	1
PY:	DB	2
; ???ݸر
CLS:
	XOR	A
	LD	B,24*6
	LD	D,0
	LD	E,0
	CALL	0BFEEH
	RET