	ORG	0100H
START:
	; ���ݸر
	CALL	CLS
	; ����
	LD	HL,BX
	LD	A,10
	LD	(HL),A
	LD	HL,BY
	LD	A,2
	LD	(HL),A
	LD	HL,BF
	LD	A,0
	LD	(HL),A
LOOP:
	; ��߰�����ò
	CALL	0BE53H
	CP	01EH
	JP	NZ,VIEW
	; BULLET�ˮ���
	LD	HL,BF
	LD	A,1
	LD	(HL),A
VIEW:
	; ��ڲ԰�ޮ���
	LD	B,6
	LD	D,2	; Y
	LD	E,1	; X
	LD	HL,PLAYER
	CALL	0BFD0H
	; BULLET�׸޶���
	LD	HL,BF
	LD	A,(HL)
	CP	1
	JP	NZ,VIEWE
	; BULLET��ˮ�����
	LD	HL,BX
	LD	A,(HL)
	CP	24
	JP	Z,VIEWE
	; BULLET�ر
	LD	B,4
	LD	HL,BY
	LD	D,(HL)	; Y
	LD	HL,BX
	LD	E,(HL)	; X
	LD	HL,CLS4
	CALL	0BFD0H
	; BULLET��޳
	LD	HL,BX
	LD	A,(HL)
	ADD	A,1
	LD	(HL),A
	; BULLET�ޮ���
	LD	B,4
	LD	HL,BY
	LD	D,(HL)	; Y
	LD	HL,BX
	LD	E,(HL)	; X
	LD	HL,BULLET
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
	; BREAK��ò
	CALL	0BE53H
	CP	051H
	JP	NZ,LOOP
	; RETURN
	RET
PLAYER:	DB	16,150,121,121,150,16
BULLET:	DB	6,9,9,6
BX:	DB	10
BY:	DB	2
BF:	DB	0
CLS4:	DB	0,0,0,0
WT:	DB	0
 ; ���ݸر
CLS:
	XOR	A
	LD	B,24*6
	LD	D,0
	LD	E,0
	CALL	0BFEEH
