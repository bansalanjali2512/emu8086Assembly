; ASSEMBLY PROGRAM TO CALCULATE SUM OF ARRAY ELEMENTS
; AUTHOR: ANJALI BANSAL (04)

DATA SEGMENT
    SUM DD 0                                  ;DECLARE & INITIALIZE SUM WITH 0
    ARRAY DD 1H,2H,3H,4H,5H,6H,7H,8H,9H,AH    ;DECLARE ARRAY OF SIZE 10 WITH VALUES
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA, CS: CODE
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV SI,0                               ;INITIALIZE SI WITH 0
        MOV CX,10                              ;INITIALIZE CX WITH 10
        XOR AX,AX                              ;CLEAR AX
        XOR DX,DX                              ;CLEAR DX
              
    NEXT:        
        ADC AX,WORD PTR ARRAY[SI]              ;ADD LOWER 16 BITS INTO AX
        ADC DX,WORD PTR ARRAY[SI+2]            ;ADD UPPER 16 BITS INTO DX
        INC SI                                 ;INCREMENT SI WITH 1
        INC SI  
        INC SI
        INC SI
        LOOP NEXT                              ;JUMP TO LABEL NEXT IF CX!=0
    MOV WORD PTR SUM,AX                        ;MOV AX INTO LOWER 16 BITS OF SUM 
    MOV WORD PTR SUM+2,DX                      ;MOV DX INTO UPPER 16 BITS OF SUM
    HLT                                        ;HALTS PROGRAM

CODE ENDS
END START