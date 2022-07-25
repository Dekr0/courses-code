#include "second.h"  // include the self-written header file in the current path / location
#include <iostream>  // <> for system header file in %PATH
using namespace std;  // without this namespace, cout and endl are not declared

int main(void)
{
	int val = 1;  // if a var is not initialized, it can be any value (also can be whatever the
	// value of the previous variable [memory address / location] used) 

	// re-declration will invoke error (includes things like prototype)

	cout << "first" << endl;
	cout << "short size: " << sizeof(short) << endl;
	cout << "int size: " << sizeof(int) << endl;
	cout << "long size: " << sizeof(long) << endl;
	cout << "long long size: " << sizeof(long long) << endl;
	
	fetch(val);
	return 0;
}
