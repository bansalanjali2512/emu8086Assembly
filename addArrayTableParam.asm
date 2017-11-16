; ASSEMBLY PROGRAM TO CALCULATE SUM OF ARRAY ELEMENTS USING TABLE OF PARAMETERS
; AUTHOR: ANJALI BANSAL (04)

DATA SEGMENT
    SUM DW 0                                  ;DECLARE & INITIALIZE SUM WITH 0
    ARRAY DW 1H,2H,3H,4H,5H                   ;DECLARE ARRAY OF SIZE 5 WITH VALUES
    TABLE DW 2 DUP(0)                         ;TABLE OF PARAMETERS TO STORE ADDRESS OF SUM AND ARRAY
DATA ENDS

STACK SEGMENT
    DW 100 DUP(0)                             ;RESERVE 100 WORD SIZE MEMORY
    TOS LABEL WORD                            ;TOS REFERS TO TOP OF STACK
STACK ENDS

CODE SEGMENT
  ASSUME DS:DATA, SS:STACK, CS:CODE
  START: MOV AX,DATA
         MOV DS,AX
         MOV AX,STACK                             
         MOV SS,AX                                 
          
         XOR AX,AX                            ;CLEAR AX
         MOV SP,OFFSET TOS                    ;MOV OFFEST TOS INTO STACK POINTER
         MOV TABLE,OFFSET ARRAY               ;MOV OFFEST OF ARRAY INTO TABLE
         MOV TABLE+2,OFFSET SUM               ;MOV OFFEST OF SUM INTO TABLE
         MOV BX,OFFSET TABLE                  ;MOV OFFEST OF TABLE INTO BX
          
         CALL ADDARRAY                        ;CALL PROCEDURE ADDARRAY

         ADDARRAY PROC NEAR                   ;ADDARRAY PROCEDURE
            MOV SI,[BX] 
            MOV CX,5H 
            MOV DI,[BX+2]                             
            NEXT: ADD AX,[SI]
                  INC SI
                  INC SI
            LOOP NEXT 
            MOV [DI],AX
         ADDARRAY ENDP

CODE ENDS
END START      