Data segment
    sum dw 0
    array dw 1,2,3,4,5
Data ends

code segment
    assume DS: Data
    start:
        MOV AX,Data
        MOV DS,AX

        MOV SI,0
        MOV CX,4
        XOR AX,AX 
        LEA BX,array
        ADD AX,BX[SI]       
    next:
        INC SI  
        INC SI
        ADC AX,BX[SI]
        LOOP next    
    MOV sum,AX
code ends
end start