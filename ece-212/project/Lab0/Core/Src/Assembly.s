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


movs r4,#0
movs r5,#0
movs r6,#0
movs r7,#0
ldr r0, =Question1
bl printf
/*Q1 - What is the value in register r5 0*/
bl cr


movs r4,#44
movs r5,#55
movs r6,#66
movs r7,#77
ldr r0, =Question2
bl printf
/*Q2 - What is the value in register r5 55*/
bl cr

 /* 3.Set low data registers R4-R7 to 16 bit values */
movw r4,#4444
movw r5,#5555
movw r6,#6666
movw r7,#7777
ldr r0, =Question3
bl printf
/*Q3 - What is the value in register r5 5555*/
bl cr

/* 4.Load Low data registers R4-R17 to 32 bit values */
ldr r4, =44444444
ldr r5, =55555555
ldr r6, =66666666
ldr r7, =77777777
ldr r0, =Question4
bl printf
/*Q4 - What is the value in register r5 55555555*/
bl cr

movw r8,#0x8888
movw r9,#0x9999
movw r10,#0xAAAA
movw r11,#0xBBBB
movw r12,#0xCCCC
ldr r0, =Question5
bl printf
/*Q5 - What is the value in register r10 0xaaaa*/
bl cr



ldr r4, =0x20001000
ldr r0, =Question6
bl printf
/*Q6 - What is the value at memory address 0x20001000 1*/
bl cr
mov r5,r4
add r5,#32
ldr r6,[r4]
ldr r7,[r5]
str r6,[r5]
str r7,[r4]
ldr r0, =Question7
bl printf
/*Q7 - What is the value at memory address 0x20001000 0x9*/
bl cr


add r6,r7
ldr r0, =Question8
bl printf
/*Q8 - What is the value in register r6 10*/
bl cr
ldr r6,[r4]
add r6,r7,#2
ldr r0, =Question9
bl printf
/*Q9 - What is the value in register r6 11*/
bl cr


movs r5,#15
movs r6,#9
and r5,r6
ldr r0, =Question10
bl printf
/*Q10 - What is the value in register r5 1001*/
bl cr


ldr r0, =Question11
bl printf
/*Q11 - After you execute the next instruction, Which CCR bit is set(Hint, look at reference card and xpsr register */
lsr r5,#1 /*CHECK THE CCR after this instruction check xpsr 0100*/
bl cr
ldr r0, =Question12
bl printf
/*Q12 - What is the value in register r5 0b100*/
bl cr


movw r4,#2
movw r5,#50000
mul r5,r4,r5
ldr r0, =Question13
bl printf
/*Q13 - What is the value in register r5 100000*/
bl cr


mov r4,r5
sub r4,#1
mvn r5,r4
ldr r0, =Question14
bl printf
/*Q14 - What is the value in register r5 */
bl cr
/*------------------------------------*/

ldr r0, =Question15
bl printf
/*Q15 - What is the ASCII string stored at memory 0x20000000 to 0x20000005 */
bl cr
/*------------------------------------*/

ldr r0, =Finish
bl printf
bl cr
POP {PC}

  .data
//.align 2
Course:
.string "ECE212"
Welcome:
.string "Welcome to Lab0 Quiz"
Question1:
.string "Q1.What is the value in register r5?"
Question2:
.string "Q2.What is the value in register r5?"
Question3:
.string "Q3.What is the value in register r5?"
Question4:
.string "Q4.What is the value in register r5?"
Question5:
.string "Q5.What is the value in register r10?"
Question6:
.string "Q6.What is the Integer at Memory Location 0x20001000?"
Question7:
.string "Q7.What is the Integer at Memory Location 0x20001000?"
Question8:
.string "Q8.What is the value in register r6?"
Question9:
.string "Q9.What is the value in register r6?"
Question10:
.string "Q10.What is the value in register r5?"
Question11:
.string "Q11.After you execute the next instruction, Which CCR bit is set?"
Question12:
.string "Q12.What is the value in register r5?"
Question13:
.string "Q13.What is the value in register r5?"
Question14:
.string "Q14.What is the value in register r5?"
Question15:
.string "Q15.What is the ASCII string stored at memory (0x20000000 to 0x20000005)?"
Finish:
.string "This concludes the Quiz"
