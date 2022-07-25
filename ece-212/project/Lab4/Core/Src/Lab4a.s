/*Author - Wing Hoy. Last edited on Mar 18, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Welcomeprompt
.global printf
.global cr
.extern value
.extern getstring
.extern getchar
.extern putchar

.text
Welcomeprompt:
/*--------------------------------------*/

/*-------Students write their code here ------------*/

POP {r0}
PUSH {LR}

bl cr
ldr r0, =welcome
bl printf
bl cr

// Input character
input:
ldr r0, =inputPrompt
bl printf
bl cr
bl getchar
b checkRange

// Check for valid input
checkRange:
cmp r0, #48
blt invalidInput
cmp r0, #90
bgt invalidInput
cmp r0, #57
ble return
cmp r0, #65
bge return
b invalidInput

// Invalid input, request new input
invalidInput:
ldr r0, =invalidPrompt
bl printf
bl cr
b input

return:
POP {r6}
PUSH {r0}
bx r6

/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/

.data
welcome:
.string "Welcome to LED Display"
inputPrompt:
.string "Please enter an UpperCase letter or Number from the keyboard"
invalidPrompt:
.string "Invalid entry, please enter proper keystroke from keyboard"
/*--------------------------------------*/

