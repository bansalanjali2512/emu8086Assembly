DATA SEGMENT
    MATRIX1 DB 01H,02H,03H
            DB 04H,05H,06H
            DB 07H,08H,09H
    MATRIX2 DB 09H,08H,07H
            DB 06H,05H,04H
            DB 03H,02H,01H
    MATRIX3 DB 9 DUP(?)  
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START: MOV AX,DATA
           MOV DS,AX
           
           MOV AX,0
           MOV SI,0
           MOV DI,0
           MOV CX,9
           
    NEXT: MOV AL,0
          MOV AL,MATRIX1[SI]
          ADD AL,MATRIX2[SI]
          MOV MATRIX3[DI],AL
          INC SI
          INC DI
          LOOP NEXT
          
CODE ENDS
END START
            
