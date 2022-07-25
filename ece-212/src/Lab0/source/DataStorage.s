/*Author - Wing Hoy. Last edited on Jan 14, 2021 */
.global Intialization

.text
.equ Opcode, 0x20001000

Intialization:
PUSH {lr}

ldr r4, =Opcode
ldr r5, =Instruction
ldr r6,[r5]


again:
add r5,r5,#4
ldr r7,[r5]
str r7,[r4]
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again

POP {PC}

.data

Instruction:
.long 0x00000009
.long 0x1
.long 0x2
.long 0x3
.long 0x4
.long 0x5
.long 0x6
.long 0x7
.long 0x8
.long 0x9


