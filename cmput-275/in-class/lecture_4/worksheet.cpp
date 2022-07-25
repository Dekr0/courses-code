#include <iostream>
using namespace std;

int main() {

	// const char *words[] = {"bee", "dog", "mouse"};
	// short word[] = {1, 2, 1, 2, 0};
	// short pos[] = {2, 1, 1, 3, 1};
	// char secret[6];
	// for (int i = 0; i < 5; ++i) {
	// 	secret[i] = *(*(words + *(word+i)) + *(pos+i));
	// }

	// secret[5] = '\0';

	int array[] = {1, 8, 4, 3, 0};
	int *ptr1 = &array[1], *ptr2 = &array[3];
	
	cout << *ptr1 << endl;
	cout << ptr1 << endl;
	cout << ptr2 << endl;
	cout << ptr2-ptr1 << endl;


	return 0;
}
