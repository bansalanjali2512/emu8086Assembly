; ASSEMBLY PROGRAM TO CONVERT PACKED BCD NUMBER INTO UNPACKED USING SHIFT
; AUTHOR: ANJALI BANSAL (04)

DATA SEGMENT
    PACKED DB 12H,34H,56H,78H,13H,57H,24H,68H   ;DECLARE ARRAY PACKED OF SIZE 8 WITH VALUES
    UNPACKED DB 16 DUP(?)                       ;DECLARE ARRAY UNPACKED OF SIZE 16
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA, CS: CODE
    START:
        MOV AX,DATA
        MOV DS,AX

        MOV SI,0                                ;INITIALIZE SI WITH 0
        MOV DI,0                                ;INITIALIZE DI WITH 0
        MOV CX,8                                ;INITIALIZE CX WITH 8

    NEXT:         
        XOR AX,AX                               ;CLEAR AX
        MOV AL,PACKED[SI]                       ;MOV 8 BITS OF PACKED[SI] INTO AL
        SHL AX,4                                ;SHIFT LEFT AX BY 4 BITS
        SHR AL,4                                ;SHIFT RIGHT AL BY 4 BITS
        MOV WORD PTR UNPACKED[DI],AX            ;MOV 16 BITS AX INTO UNPACKED[DI]
        INC SI                                  ;INCREMENT SI BY 1
        INC DI                                  ;INCREMENT DI BY 1
        INC DI
        LOOP NEXT
    HLT                                         ;HALTS PROGRAM

CODE ENDS
END START