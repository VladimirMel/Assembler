;��������� ������������ � ������ Set1 ����
;   Procedure (var A: LONGWORD; N:LONGWORD; P:LONGWORD)
;����������� ��������� ������� N ������� ������ S 
;� ����, ���� P=0, � �������,���� P �� ����� 0.
.386
.model FLAT,C
PUBLIC SetCler 

.CODE
SetCler PROC
  PUSH EBP
  MOV EBP,ESP
  
A EQU DWORD PTR[EBP+16]
N EQU DWORD PTR[EBP+12]
P EQU DWORD PTR[EBP+8]
  
  MOV EAX, A
  MOV ECX, N
  
  CMP P, 0
  JNZ P_1
  BTR [EAX], ECX
  JMP LAST
P_1:
  BTS [EAX], ECX 
  
LAST:
  POP EBP

  RET
SetCler ENDP
END
