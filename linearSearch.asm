; ASSEMBLY PROGRAM FOR LINEAR SEARCH
; AUTHOR: ANJALI BANSAL (04)

DATA SEGMENT   
    ARRAY DW 01H,02H,03H,04H,05H        ;DECLARE ARRAY OF SIZE 5 WITH VALUES
    ELEMENT DW 03H                      ;ELEMENT TO BE SEARCHED IN ARRAY
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA, CS: CODE
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV SI,0                         ;INITIALIZE SI WITH 0 
        MOV CX,5                         ;INITIALIZE CX WITH 5
        XOR AX,AX                        ;CLEAR AX
        MOV AX,ELEMENT                   ;MOV ELEMENT INTO AX FOR COMPARISON

    NEXT:
        CMP AX,ARRAY[SI]                 ;COMPARE ARRAY ELEMENTS WITH AX
        JE  FOUND                        ;IF ELEMENT FOUND JMP TO FOUND LABEL
        INC SI                           ;INCREMENT SI BY 1
        INC SI
        LOOP NEXT                        ;JUMP TO LABEL NEXT IF CX!=0
           
    NOTFOUND:
        XOR AX,AX                        ;CLEAR AX IF ELEMENT NOT FOUND
    FOUND:
        MOV AX,1                         ;SET AX TO 1 IF ELEMENT FOUND
    HLT                                  ;HALTS PROGRAM

CODE ENDS
END START