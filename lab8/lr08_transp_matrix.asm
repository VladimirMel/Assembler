SSEG	SEGMENT PARA STACK 'STACK'
	DB	200h dup (?)
SSEG	ENDS

DSEG	SEGMENT PARA PUBLIC 'DATA'
N	DW	5
Y	DB	'54321'    
	DB	'54321'
	DB	'54321'
	DB	'54321'
	DB	'54321'
DSEG	ENDS

CSEG	SEGMENT PARA 'CODE'
ASSUME	CS:CSEG, DS:DSEG, SS:SSEG
START:
	MOV	AX, DSEG
	MOV	DS, AX

	MOV	BX, OFFSET Y  ; Massiv
	MOV BP, 1  ; tek i
	MOV DX, N  ; tek j
	MOV	CX, N  ; max I
	DEC CX
	
M1:
	PUSH CX
	
	MOV SI, BP  ;
	MOV DI, DX  ;
M2:
	MOV	AL, [BX][SI]
 	XCHG AL, [BX][DI]
	XCHG AL, [BX][SI]
	ADD	DI, N
	INC	SI  
	LOOP M2
	
	ADD DX, N
	INC	DX
	ADD	BP, N
	INC	BP
	POP	CX
	LOOP M1
	
	MOV CX, N
	MOV SI, 0
PRINT1:
	PUSH CX
	MOV CX, N
	
PRINT2:
	MOV AH, 02h
	MOV DX, [BX][SI]
	INT 21h
	INC SI
	LOOP PRINT2
	
	MOV AH, 02h
	MOV DX, 13
	INT 21h
	MOV AH, 02h
	MOV DX, 10
	INT 21h
	POP CX
	LOOP PRINT1

STOP:
	MOV	AH, 4Ch
	INT	21h
CSEG	ENDS
	END	START
