#include <iostream>
using namespace std;

int main() {

	int num1 = 10;
	int & num1_ref = num1;
	int * num1_ptr = &num1;
	num1_ptr += 1;

	cout << &num1_ref << " " << &num1 << endl;
	cout << &num1_ref << " " << num1_ptr << endl;

	return 0;

}
