/*Author - Wing Hoy. Last edited on Feb 12, 2021 */
.global Clear

.text
.equ Opcode, 0x20001000

Clear:
PUSH {lr}
ldr r4, =Opcode
ldr r5,[r4,#12]
movs r6, #50
movs r3,#0
again:
str r3,[r5]
add r5,#4
sub r6,#1
cmp r6,#0
bgt again

ldr r4, =Opcode
ldr r5,[r4,#16]
movs r6, #50
movs r3,#0
again1:
str r3,[r5]
add r5,#4
sub r6,#1
cmp r6,#0
bgt again1

ldr r4, =Opcode
ldr r5,[r4,#20]
movs r6, #50
movs r3,#0
again2:
str r3,[r5]
add r5,#4
sub r6,#1
cmp r6,#0
bgt again2

movs r4,r4
POP {PC}
