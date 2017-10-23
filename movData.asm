; ASSEMBLY PROGRAM TO MOVE BLOCK OF DATA FROM ONE MEMORY LOCATION TO ANOTHER
; AUTHOR: ANJALI BANSAL (04)

DATA SEGMENT
    BLOCK1 DB 1H,2H,3H,4H,5H         ;DECLARE BLOCK1 OF SIZE 5 WITH VALUES
    BLOCK2 DB 5 DUP(?)               ;DECLARE BLOCK2 OF SIZE 5
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA, CS: CODE
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV SI,0                      ;INITIALIZE SI WITH 0
        MOV CX,5                      ;INITIALIZE CX WITH 10
        XOR AX,AX                     ;CLEAR AX

    NEXT:        
        MOV AL,BLOCK1[SI]             ;MOV 8 BITS OF BLOCK1 INTO AL
        MOV BLOCK2[SI],AL             ;MOV 8 BITS AL INTO BLOCK2[2]
        INC SI                        ;INCREMENT SI WITH 1
        LOOP NEXT                     ;JUMP TO LABEL NEXT IF CX!=0
    HLT                               ;HALTS PROGRAM

CODE ENDS
END START
