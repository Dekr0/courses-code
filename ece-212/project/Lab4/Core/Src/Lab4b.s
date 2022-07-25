/*Author - Wing Hoy. Last edited on Mar 18, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global Convert
.global printf
.global cr
.extern value
.extern getstring
.extern convert1

.text
Convert:
/*--------------------------------------*/

/*-------Students write their code here ------------*/

POP {r0}  // Pop the ASCII character out the stack
PUSH {LR}  // Push the return address into the stack

PUSH {r0}  // Push the ASCII character into the stack
bl convert1
POP {r0}  // Pop the pattern address out the stack

POP {r6}  // Pop the return address out the stack
PUSH {r0}  // Push the pattern address into the stack
bx r6



/*-------Code ends here ---------------------*/

/*-----------------DO NOT MODIFY--------*/

.data
/*--------------------------------------*/
