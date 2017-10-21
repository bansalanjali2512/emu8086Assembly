Data segment
    packed db 12H,34H,56H,78H
    unpacked db 8 dup(?)
Data ends

code segment
    assume DS : Data
    start:
        MOV AX,Data
        MOV DS,AX
        MOV SI,00H
        MOV DI,00H
        MOV CX,04H        
    next:         
        XOR AX,AX
        MOV AL,packed[SI]
        ROL AX,4
        ROR AL,4
        MOV WORD PTR unpacked[DI],AX
        INC SI
        INC DI
        INC DI
        LOOP next
code ends
end start