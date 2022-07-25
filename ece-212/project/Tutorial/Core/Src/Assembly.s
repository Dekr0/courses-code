/*Author - Wing Hoy. Last edited on Jan 14, 2021 */
.global TestAsmCall
.global printf
.global cr
 //.align 2

.text
 TestAsmCall:
 PUSH {lr}

.equ A, 0xFFFFFFFF
.equ B, 0x00000000

ldr r0 ,= B
ldr r1 ,= A
movs r0, r1, asr#0x02
ldr r2 ,= A


POP {PC}

.data
