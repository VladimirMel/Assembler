                                                       COMMENT @
                
                 отладка в CV (CodeView)


- подготовить приведенную ниже программу к отладке:
а) скопировать текст программы в файл KR_1.ASM; v
б) выполнить трансл¤цию: MASM /Zi KR_1.ASM,,;
в) выполнить компоновку: LINK /CO KR_1.OBJ;
                                                               @
TITLE           

     SSTACK     SEGMENT PARA STACK  'STACK'
                DB   64 DUP('—“≈ ____')
     SSTACK     ENDS

     DSEG          SEGMENT  PARA PUBLIC 'DATA'
     CA        DB      'A'
     KA        DB      '65'
     TXT       DB      'символ "'
     C$        DB      ?
               DB      '" имеет код '
    KCH1       DB      ?
    KCH2       DB      ?
               DB      10,13,'$'
    MSG0       DB      'Ќј„јЋќ –јЅќ“џ',13,10,'$'
    MSG1       DB      ' ќЌ≈÷  –јЅќ“џ',13,10,'$'
     DSEG          ENDS

SUBTTL         
PAGE
     CSEG      SEGMENT PARA PUBLIC 'CODE'
               ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

     BEGIN     PROC FAR
     ; занести в стек такие начальные значени¤, чтобы программа
     ; могла возвратить управление MS DOS (отладчику) по RET.
               PUSH  DS ; поместить в стек номер параграфа адреса возврата
               MOV  AX,0
               PUSH  AX

     ; загрузить адрес сегмента данных DS
     M1:       MOV  AX,DSEG
               MOV  DS,AX

     ; вывод текста 
     M2:       MOV  AH,9
               MOV  DX,OFFSET MSG0
               INT  21H

     ; вывод строки 'A' имеет код 65"
     MA:       MOV  AL,CA
               MOV  C$,AL
                  MOV  AX,WORD PTR KA
                  MOV  WORD PTR KCH1,AX
               MOV  AH,9
               MOV DX,OFFSET TXT
               INT  21H

     ; вывод строки 'B' имеет код 66"
     MB:       INC  C$
               INC  KCH1+1
               INT  21H

     ; вывод строки "—»ћ¬ќЋ 'C' имеет код 67"
     MC:       INC  C$
               INC  KCH1+1
               INT  21H

     ; вывод текста 
     M3:       MOV  AH,9
               MOV  DX,OFFSET MSG1
               INT  21H

     ; возвратить управление MS DOS (отладчику)
               RET
     BEGIN     ENDP

     CSEG      ENDS
               END  BEGIN
COMMENT @
