/*Author - Wing Hoy. Last edited on Jan 14, 2021 */
.global TestAsmCall
.global printf
.global cr
 //.align 2

.text
 TestAsmCall:
 PUSH {lr}
 bl cr
 ldr r0, =Welcome
 bl printf
 bl cr

/* 1.Initializing low data registers R4-R7 to zero */
movs r4,#0
movs r5,#0
movs r6,#0
movs r7,#0
ldr r0, =LowRegisters1
bl printf
bl cr

 /* 2.Set low data registers R4-R7 to 8 bit values */
movs r4,#44
movs r5,#55
movs r6,#66
movs r7,#77
ldr r0, =LowRegisters2
bl printf
bl cr

 /* 3.Set low data registers R4-R7 to 16 bit values */
movw r4,#0x4444
movw r5,#0x5555
movw r6,#0x6666
movw r7,#0x7777
ldr r0, =LowRegisters3
bl printf
bl cr

/* 4.Load Low data registers R4-R17 to 32 bit values */
ldr r4, =0x44444444
ldr r5, =0x55555555
ldr r6, =0x66666666
ldr r7, =0x77777777
ldr r0, =LowRegisters4
bl printf
bl cr

/* 5.Set high data registers R8-R12 to 16 bit values */
movw r8,#0x8888
movw r9,#0x9999
movw r10,#0xAAAA
movw r11,#0xBBBB
movw r12,#0xCCCC
ldr r0, =HighRegisters
bl printf
bl cr


/*Swapping first value with last value*/
/*--------------------------------------*/
/* 6A.Fetch value from memory*/
ldr r4, =0x20001000
mov r5,r4
add r5,#32
ldr r6,[r4]
ldr r7,[r5]
ldr r0, =Fetch
bl printf
bl cr

/* 6B.Write value to memory*/
str r6,[r5]
str r7,[r4]
ldr r0, =Write
bl printf
bl cr
/*-------------------------------------*/

/* Arithmitic example */
/* 7A. Adding two registers */
add r6,r7
ldr r0, =Add
bl printf
bl cr
/* 7B. Adding an immediate value of 2 to register */
ldr r6,[r4]
add r6,r7,#2
ldr r0, =Add1
bl printf
bl cr
/*--------------------------*/

/* 8. Logic example */
movs r5,#15
movs r6,#9
and r5,r6
ldr r0, =Logic
bl printf
bl cr
/*-----------------------*/

/* 9. Bit shift example */
lsr r5,#1
ldr r0, =Shift
bl printf
bl cr
/*------------------------*/

/* 10. Creating a larger than 16 bit number ie) 100000 */
movw r4,#2
movw r5,#50000
mul r5,r4,r5
ldr r0, =Large
bl printf
bl cr
/*-------------------------*/

/* 11. Creating a Negative number*/
mov r4,r5
sub r4,#1
mvn r5,r4
ldr r0, =Negative
bl printf
bl cr
/*------------------------------------*/

ldr r0, =Finish
bl printf
bl cr
POP {PC}

  .data
//.align 2
Welcome:
.string "Welcome to the tutorial"
LowRegisters1:
.string "1.Monitor the Low Registers(Initialize) r4-r7"
LowRegisters2:
.string "2.Monitor the Low Registers(8bit value) r4-r7"
LowRegisters3:
.string "3.Monitor the Low Registers(16bit value) r4-r7"
LowRegisters4:
.string "4.Monitor the Low Registers(32bit value) r4-r7"
HighRegisters:
.string "5.Monitor the High Registers(16bit value) r8-r12"
Fetch:
.string "6A.Monitor Register r6,r7 & Memory Location 0x20001000"
Write:
.string "6B.Monitor Register r6,r7 & Memory Location 0x20001000"
Add:
.string "7A.Adding two registers. Monitor Register r6"
Add1:
.string "7B.Adding immediate value to register. Monitor Register r6"
Logic:
.string "8.And Logic Operation. Monitor Register r5"
Shift:
.string "9.Bit shift Operation. Monitor Register r5"
Large:
.string "10.Creating a >16bit number. Monitor Register r5"
Negative:
.string "11.Creating a negative number. Monitor Register r5"
Finish:
.string "This concludes the Tutorial"
