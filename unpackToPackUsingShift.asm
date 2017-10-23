; ASSEMBLY PROGRAM TO CONVERT UNPACKED BCD NUMBER INTO PACKED USING SHIFT
; AUTHOR: ANJALI BANSAL (04)

DATA SEGMENT
    UNPACKED DB 01H,02H,03H,04,05H,06H,07H,08H
    PACKED DB 4 DUP(?)
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA, CS: CODE
    START:
        MOV AX,DATA
        MOV DS,AX

        MOV SI,0                                ;INITIALIZE SI WITH 0
        MOV DI,0                                ;INITIALIZE DI WITH 0
        MOV CX,8                                ;INITIALIZE CX WITH 8
        XOR AX,AX                               ;CLEAR AX

    NEXT:
        MOV AX, WORD PTR UNPACKED[SI]           ;MOV 16 BITS OF UNPACKED[SI] INTO AX
        SHL AL,4                                ;SHIFT LEFT AL BY 4 BITS
        SHR AX,4                                ;SHIFT RIGHT AX BY 4 BITS
        MOV PACKED[DI],AL                       ;MOV 8 BITS AL INTO PACKED[DI]
        INC SI                                  ;INCREMENT SI BY 1
        INC SI
        INC DI                                  ;INCREMENT DI BY 1
        LOOP NEXT
    HLT                                         ;HALTS PROGRAM

CODE ENDS
END START