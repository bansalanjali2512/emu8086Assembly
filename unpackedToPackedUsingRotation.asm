Data segment
    unpacked db 01H,02H,03H,04,05H,06H,07H,08H
    packed db 4 dup(?)
Data ends

code segment
    assume DS : Data
    start:
        MOV AX,Data
        MOV DS,AX
        MOV SI,00H
        MOV DI,00H
        XOR AX,AX
        MOV CX,04H
    next:
        MOV AX, WORD PTR unpacked[SI]
        ROR AL,4
        ROR AX,4
        MOV packed[DI],AL
        INC SI
        INC SI
        INC DI
        LOOP next
code ends
end start