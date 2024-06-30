            CODE SEGMENT
ASSUME CS:CODE,DS:CODE,ES:CODE,SS:CODE;

PPIC_C EQU 1EH ; control register
PPIC EQU 1CH
PPIB EQU 1AH
PPIA EQU 18H
ORG 1000H
MOV AL,10000000B
OUT PPIC_C,AL
MOV AL,11111111B  ; row active(1)
OUT PPIC,AL
MOV AL,11111111B  ; red light deactive(1)
OUT PPIB,AL
   ; for active red light
   ; MOV AL,00000000B  ; red light active(0)
   ; OUT PPIA,AL
   ; L2: OUT PPIB,AL

L1: MOV AL,11111110B   ; active 1st column(0), off(1)
L2: OUT PPIA,AL
CALL TIMER
ROL AL,1
JC L2   ; jump if carry=1
JMP L1
TIMER: MOV CX,0FFFFH
TIMER1: NOP
NOP
NOP
NOP
LOOP TIMER1
RET
CODE ENDS
END
