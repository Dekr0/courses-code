#include <iostream>
using namespace std;

int main()
{
	cout << sizeof(float) << endl;
	cout << sizeof(double) << endl;
	cout << sizeof(long double) << endl;

	// auto keyword is not recommended unless it's necessary for some
	// scenarios
	auto var = 3.14F;   
	cout << sizeof var << endl;

	char c = 'A';
	int n;
	n = int(c);  
	// c and n are all basic integer type but this conversion 
	// expand the size of memory and space the variable allocated

	cout << sizeof(c) << endl;
	cout << sizeof(n) << endl;

	int num1 = 1;
	double num2 = 3.14;
	auto num3 = num1 + num2;  // take the types that has the largest size in this case
	cout << "num3 is " << sizeof num3 << " bytes" << endl;


	// implicit type conversion
	int num4 = 10;
	double num5;

	num5 = num4;  // the receiver determine the type during the conversion
	cout << "num5 is " << sizeof num5 << " bytes" << endl;
	num4 = num5;
	cout << "num4 is " << sizeof num4 << " bytes" << endl;

	return 0;
}
