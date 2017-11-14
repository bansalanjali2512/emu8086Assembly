DATA SEGMENT
    ELEMENT DB 05H
    RESULT DW 01H
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
    
    START: MOV AX,DATA
           MOV DS,AX
           
           XOR AX,AX
           MOV CL,ELEMENT
           MOV BL,ELEMENT
           
    NEXT: MOV AL,BYTE PTR RESULT
          MUL BL
          MOV RESULT,AX
          DEC BL
          LOOP NEXT
          
CODE ENDS
END START
            
