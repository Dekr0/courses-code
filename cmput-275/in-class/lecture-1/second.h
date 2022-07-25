#ifndef SECOND_H  // unique name
#define SECOND_H

/* header guard, prevent re-declaration from other header files happen. In this case,
 * the prototype below is not defined / declared in the src file who calls this header
 * file, then defines this prototype */

void fetch(int);  // prototype, inform the compiler this function will be declared / defined later 
// in this interface; this prototype only determines the parameter of the type, not the name

int val = 10;

#endif

