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
        XOR AX,AX

    NEXT:
        MOV AX, WORD PTR UNPACKED[SI]
        SHL AL,4                                ; shift left al register to 4 bit
        SHR AX,4
        MOV PACKED[DI],AL
        INC SI
        INC SI
        INC DI
        LOOP NEXT
CODE ENDS
END START
