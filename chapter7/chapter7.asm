	ORG	0100H
START:
	; ???ݸر
	CALL	CLS
	; ????
	LD	HL,PX
	LD	A,1
	LD	(HL),A
	LD	HL,PY
	LD	A,2
	LD	(HL),A
	LD	HL,BF
	LD	A,0
	LD	(HL),A
	LD	HL,BLF
	LD	A,1
	LD	(HL),A
LOOP:
	; BULLET?׸޶???
	LD	HL,BF
	LD	A,(HL)
	CP	1
	JP	Z,VIEW
	; ??߰?????ò
	CALL	0BE53H
	CP	01EH
	JP	NZ,VIEW
	; BULLET????
	LD	HL,BF
	LD	A,1
	LD	(HL),A
	; ??ڲ԰ɲ???ʯ??
	LD	HL,PX
	LD	A,(HL)
	LD	HL,BX
	LD	(HL),A
	LD	HL,PY
	LD	A,(HL)
	LD	HL,BY
	LD	(HL),A
VIEW:
	; BULLET?׸޶???
	LD	HL,BF
	LD	A,(HL)
	CP	0
	JP	Z,PVIEW
	; BULLET??ˮ?????
	LD	HL,BX
	LD	A,(HL)
	CP	24
	JP	Z,BFINIT
	; ??ۯ??׸޶???
	LD	HL,BLF
	LD	A,(HL)
	CP	0
	JP	Z,BVIEW
	; ???????ò
	LD	HL,BX
	LD	A,(HL)
	LD	HL,BLX
	CP	(HL)
	JP	NZ,BVIEW
	; ??ۯ??ˮ???
	LD	HL,BLF
	LD	A,0
	LD	(HL),A
	; ??ۯ??ˮ???
	LD	B,8
	LD	HL,BLY
	LD	D,(HL)	; Y
	LD	HL,BLX
	LD	E,(HL)	; X
	LD	HL,CLS8
	CALL	0BFD0H
BFINIT:
	; BULLET?ˮ???
	LD	HL,BF
	LD	A,0
	LD	(HL),A
	; BULLET?ر
	LD	B,4
	LD	HL,BY
	LD	D,(HL)	; Y
	LD	HL,BX
	LD	E,(HL)	; X
	LD	HL,CLS4
	CALL	0BFD0H
	JP	PVIEW
BVIEW:
	; BULLET?ر
	LD	B,4
	LD	HL,BY
	LD	D,(HL)	; Y
	LD	HL,BX
	LD	E,(HL)	; X
	LD	HL,CLS4
	CALL	0BFD0H
	; BULLET??޳
	LD	HL,BX
	LD	A,(HL)
	ADD	A,1
	LD	(HL),A
	; BULLET?ޮ???
	LD	B,4
	LD	HL,BY
	LD	D,(HL)	; Y
	LD	HL,BX
	LD	E,(HL)	; X
	LD	HL,BULLET
	CALL	0BFD0H
PVIEW:
	; ??ڲ԰?ޮ???
	LD	B,6
	LD	HL,PY
	LD	D,(HL)	; Y
	LD	HL,PX
	LD	E,(HL)	; X
	LD	HL,PLAYER
	CALL	0BFD0H
	; ??ۯ??׸޶???
	LD	HL,BLF
	LD	A,(HL)
	CP	0
	JP	Z,VIEWE
	; ??ۯ??ޮ???
	LD	B,8
	LD	HL,BLY
	LD	D,(HL)	; Y
	LD	HL,BLX
	LD	E,(HL)	; X
	LD	HL,BLOCK
	CALL	0BFD0H
VIEWE:
	; WAIT
	LD	HL,WT
	LD	A,0
	LD	(HL),A
WAITI:
	LD	A,0
WAIT:
	ADD	A,1
	CP	255
	JP	NZ,WAIT
	LD	HL,WT
	LD	A,(HL)
	ADD	A,1
	LD	(HL),A
	CP	255
	JP	NZ,WAITI
	; BREAK??ò
	CALL	0BE53H
	CP	051H
	JP	NZ,LOOP
	; RETURN
	RET
; ؿ??
PLAYER:	DB	16,150,121,121,150,16
PX:	DB	1
PY:	DB	2
BULLET:	DB	6,9,9,6
BX:	DB	10
BY:	DB	2
BF:	DB	0
BLOCK:	DB	238,14,238,224,238,14,238,224
BLX:	DB	22
BLY:	DB	2
BLF:	DB	1
CLS4:	DB	0,0,0,0
CLS8:	DB	0,0,0,0,0,0,0,0
WT:	DB	0
; ???ݸر
CLS:
	XOR	A
	LD	B,24*6
	LD	D,0
	LD	E,0
	CALL	0BFEEH
	RET