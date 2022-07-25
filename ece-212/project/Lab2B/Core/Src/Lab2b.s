/*Author - Wing Hoy. Last edited on Feb 12, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/

/*-------Students write their code here ------------*/

// Macro
.equ Size, 0x20001000  // Number of data points
.equ PtrX, 0x20001004  // addresses of where the Data points of X
.equ PtrY, 0x20001008  // addresses of where the Data points of Y
.equ Stack, 0x2000100C  // address of temporary memory storage
.equ Final, 0x20001010  // address of where to store the final value


// Initialize
ldr r0, =Size
ldr r1, =PtrX
ldr r2, =PtrY
ldr r3, =Stack
ldr r4, =Final
ldr r5, =0
ldr r6, =0
ldr r7, =0

ldr r0, [r0]  // Number of data points
ldr r1, [r1]
ldr r2, [r2]
ldr r3, [r3]
ldr r4, [r4]


Main:  // Input two X data points
ldr r5, [r1]  // load first value a
add r1, r1, #4  // Mannual post index, offset by 4 each time
ldr r6, [r1]  // load second value b

// Delta X
sub r5, r6, r5  // b - a
ldr r6, =0  // initialize register 6 back to 0 to store f(a) + f(b)

// Input two Y data points
ldr r6, [r2]  // load first value f(a)
add r2, r2, #4  // Mannual post index, offset by 4 each time
ldr r7, [r2]  // load second value f(b)

// Sum two Y data points
add r6, r6, r7  // f(a) + f(b)
ldr r7 ,=0  // initialize register 6 back to 0 to store f(a) + f(b)

// Check the number of bits needed to logically shift left
cmp r5, #1  // multiple by 1
beq Sum  // directly apend the result into final value

cmp r5, #2  // multiple by 2
beq ShiftOne
b ShiftTwo  // multiple by 4


ShiftOne:
lsl r6, r6, #1  // logically shift one bit to the left
b Sum


ShiftTwo:
lsl r6, r6, #2  // logically shift two bit to the left
b Sum


Sum:
ldr r5, =0  // initialize register 5 back to 0 for loading the fianl value
ldr r5, [r4]

add r5, r5, r6  // add the new result into the final value

str r5, [r4]  // store the final value back into the memory
ldr r5, =0	// initialize register 5 and 6 back to 0 for use in next iteration
ldr r6, =0

sub r0, r0, #1  // counter calculation
cmp r0, #1
beq HalfSum  // divide the final value by half once all the value are process
b Main


HalfSum:
ldr r5, [r4]
asr r5, #1
str r5, [r4]
ldr r5, =0
b END


END:


/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/
POP {PC}

.data
/*--------------------------------------*/
