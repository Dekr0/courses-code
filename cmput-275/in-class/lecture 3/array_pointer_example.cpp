#include <iostream>
#include <cstring>
#include <string>
using namespace std;

const int a_size = 5;

int main() {
	int arr[] = {1, 2, 3};

	for (int i=0; i<5; ++i) {
		cout << arr[i] << endl;
		cout << "the array size is: " << sizeof arr << endl;
	}

	char name[20] = "John Doe";
	cout << sizeof name << endl;
	cout << strlen(name) << endl;
	name[8] = 'a';
	cout << name << endl;

	string anothername = "John Doe";
	anothername[4] = 'e';
	cout << anothername << endl;
	cout << anothername.size() << endl;
	anothername = "Vincent";
	cout << anothername << endl;
	cout << anothername.size() << endl;

	int var = 10;
	cout << "var is stored at " << &var << " and has value: " << var << endl;
	int *ptr_var = &var;
	cout << "size of a pointer-to-int is: " << sizeof ptr_var << endl;

	double my_array[10] = {};
	double *ptr_d = my_array;
	cout << ptr_d << endl;
	cout << "size of a pointer-to-double is: " << sizeof ptr_d << endl;

	*ptr_d = 10.23;
	cout << *ptr_var << " " << var << endl;
	cout << *ptr_d << " " << my_array[0] << endl;
	*ptr_d = 4.13;
	cout << ptr_d[1] << " " << my_array[0] << endl;

	ptr_d++;
	cout << *ptr_d << " " << my_array[1] << endl;
	ptr_d--;

	int coins[8] = {1, 5, 10, 25, 50, 100, 200, 0};
	cout << coins[6] << endl;
	cout << *(coins + 6) << endl;
	cout << *coins + 6 << endl;

	cout << coins << endl;

	int a = 10;
	double d = 3.14;
	double *newptr = NULL;  // pointers should be initilized
	double *newptr1 = &d;
	newptr1++; // newptr1 += 1;
	newptr1 = NULL;
	// *newptr1 = 1; dereferencing a null pointer will cause a seg fault
	return 0;
}
