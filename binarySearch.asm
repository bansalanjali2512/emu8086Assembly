; ASSEMBLY PROGRAM FOR BINARY SEARCH
; AUTHOR: ANJALI BANSAL (04)

DATA SEGMENT   
    ARRAY DB 1H,2H,3H,4H,5H        ;DECLARE ARRAY OF SIZE 5 WITH SORTED VALUES
    ELEMENT DB 3H                      ;ELEMENT TO BE SEARCHED IN ARRAY
    FIRST DB 0H
    LAST DB 4H
    MID DB DUP(?)
DATA ENDS

CODE SEGMENT
    ASSUME DS: DATA, CS: CODE
    START:
        MOV AX,DATA
        MOV DS,AX
        
        MOV SI,0                         ;INITIALIZE SI WITH 0
        XOR AX,AX                        ;CLEAR AX

        MOV AL,FIRST
        ADD AL,LAST
        SHR AL,1
        MOV MID,AL                       ;CALCULATING MID INDEX

    NEXT:   
        MOV BL,LAST
        CMP BL,FIRST          
        JL NOTFOUND                       ;JUMP TO LABEL NOTFOUND IF ELEMENT NOT FOUND
        
        MOV BX,0
        XOR DX,DX
        MOV DL,MID
        MOV SI,DX
        MOV BH,ARRAY[SI]
        MOV BL,ELEMENT
        CMP BH,BL                         ;COMPARE ELEMENT AND ARRAY[MID]
        JE FOUND                          ;JUMP TO LABEL FOUND IF ELEMENT FOUND
        JL UPPER                          ;CHECK ELEMENT IN UPPER HALF OF ARRAY
        JG LOWER                          ;CHECK ELEMENT IN LOWER HALF OF ARRAY
    
        UPPER: 
            INC DL
            MOV LOW,DL                    ;MODIFY LOW TO MID+1
            MOV AL,FIRST
            ADD AL,LAST
            SHR AL,1
            MOV MID,AL  
            JMP NEXT

        LOWER:    
            DEC DL
            MOV LAST,DL                   ;MODIFY HIGH TO MID-1
            MOV AL,LAST
            ADD AL,FIRST
            SHR AL,1 
            MOV MID,AL
    JMP NEXT    
           
    NOTFOUND:
        XOR AX,AX                        ;CLEAR AX IF ELEMENT NOT FOUND
    FOUND:
        MOV AX,1                         ;SET AX TO 1 IF ELEMENT FOUND
    HLT                                  ;HALTS PROGRAM

CODE ENDS
END START