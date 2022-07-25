/*Author - Wing Hoy. Last edited on Mar 18, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Display
.global printf
.global cr
.extern value
.extern getstring
.extern offled()
.extern onled()
.extern column()
.extern Column()
.extern row()
.extern Row()

.text
Display:
/*--------------------------------------*/

/*-------Students write their code here ------------*/

POP {r1}  // Pop the pattern address out the stack
PUSH {LR}  // Push the return address into the stack
PUSH {r2-r3}  // Reserve the value for R2 to R3, R5 to R6
PUSH {r5-r7}
mov r7, #0  // Display times


Reset:
mov r2, #0  // Row Counter
mov r3, #7  // Column Counter
mov r6, #0 // Pattern of one row
mov r5, r1  // Copy the pattern address

rowLed:
ldrb r6, [r5]
add r5, r5, #1
b columnLed

columnLed:
lsr r6, r6, #1
bcc checkColumnCounter
mov r0, r3
PUSH {r1-r7}
bl Column
POP {r1-r7}
mov r0, r2
PUSH {r1-r7}
bl Row
POP {r1-r7}
PUSH {r1-r7}
bl onled
POP {r1-r7}
mov r0, #0
PUSH {r1-r7}
bl HAL_Delay
POP {r1-r7}
PUSH {r1-r7}
bl offled
POP {r1-r7}
b checkColumnCounter

checkColumnCounter:
// One led
sub r3, r3, #1
cmp r3, #0
bge columnLed
// One row
mov r3, #7
add r2, r2, #1
cmp r2, #7
// Move to next row
ble rowLed
add r7, r7, #1
cmp r7, #100
ble Reset
b return

return:
POP {r5-r7}
POP {r2-r3}
POP {r6}
PUSH {r1}
bx r6




/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/


.data
/*--------------------------------------*/
