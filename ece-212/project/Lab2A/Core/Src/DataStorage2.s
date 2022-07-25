/*Author - Wing Hoy. Last edited on Feb 12, 2021 */
.global Intialization

.text
.equ Opcode, 0x20001000

Intialization:
PUSH {lr}

ldr r4, =Opcode
ldr r5, =Instruction
movs r6, #6

again:
ldr r3,[r5]
str r3,[r4]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again

ldr r4, =Opcode
ldr r5,[r4,#4]
ldr r6,[r4]
ldr r4, =FirstBlock
again1: ldr r3,[r4]
str r3,[r5]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again1

ldr r4, =Opcode
ldr r5,[r4,#8]
ldr r6,[r4]
ldr r4, =SecondBlock
again2: ldr r3,[r4]
str r3,[r5]
add r5,r5,#4
add r4,r4,#4
sub r6,#1
cmp r6,#0
bgt again2

movs r4,r4

POP {PC}

.data
Instruction:
.long 0xC
.long 0x2000A000
.long 0x20005000
.long 0x2000C000
.long 0x20002000
.long 0x2000F000





FirstBlock:
.long 0x5A
.long 0x7B
.long 0x4C
.long 0x8D
.long 0x3E
.long 0x4F
.long 0xA5
.long 0xB6
.long 0xC4
.long 0xD3
.long 0xE4
.long 0xF7


SecondBlock:
.long 0x5F
.long 0x4E
.long 0x4D
.long 0x7C
.long 0x5B
.long 0x5A
.long 0xA5
.long 0xB4
.long 0xC3
.long 0xD4
.long 0xE4
.long 0xF2


