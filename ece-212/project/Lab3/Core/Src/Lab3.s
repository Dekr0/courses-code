/*Author - Wing Hoy. Last edited on Feb 26, 2021 */
/*-----------------DO NOT MODIFY--------*/
.global TestAsmCall
.global printf
.global cr
.extern value
.extern getstring

// BL branch linker -> call subrountines / function.
// Return address will be stored automatically into LR
// Be careful overwriting LR after multiples times of LR

// Save returning address from LR in eachb subrountine just in case (might be lost)

// BX lr for return from subrountines to where pointed by LR (R14)

.text
TestAsmCall:
PUSH {lr}
/*--------------------------------------*/
ldr r4,=0xFFFFFFFF
PUSH {r4}
bl Welcomeprompt
POP {r4}
ldr r0,=0x20001000
PUSH {r4}
bl Sort
POP {r4}
//POP {r5}
ldr r5,=0x20001000
PUSH {r5}
PUSH {r4}
bl Display
POP {r4}
POP {r5}
/*-----------------DO NOT MODIFY--------*/
POP {PC}
.data
/*--------------------------------------*/
