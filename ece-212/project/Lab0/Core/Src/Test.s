.global TestAsmCall
.global printf
.global cr

.text
TestAsmCall:
MOV R0, #0
MOV R1, #20
LDR R3, =0x20001000
REPEAT:
LDR R4, [R3]
ADD R3, #4
IT CS
ADDCS R0, #1
MOV R5, #0
.data
