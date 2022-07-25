#include <iostream>
#define ARRAY_SIZE 5
using namespace std;


void swap(double&, double&);
void swap_ptr(double*, double*);
void pow(int*, int);

int main() {

	double num1 = 3.14, num2 = 0.1;
	int var = 5;
	int array[ARRAY_SIZE] = {1, -3, 5, -7, 9};

	cout << num1 << " " << num2 << endl;
	swap(num1, num2); 
	pow(array, ARRAY_SIZE);  // first arg can also be &array[0]
	// swap(&num1, &num2);

	/* 
	 * copys of (the value of) num1 and num2 are passed into swap() frames, 
	 * and the changes only stay in the swap() stack frames, which means
	 * only the copys are being swaped
	 */

	for (int x : array) cout << x << endl;

	cout << num1 << " " << num2 << endl;

	const int *i_ptr = &war;
	cout << var << endl;
	var += 2;
	cout << var << endl;
	cout << *i_ptr << endl;
	*i_ptr = 6;  // error
		
	return 0;
}


void swap_ptr(double * var1, double * var2) {
	double tmp;
	tmp = *var1;  
	*var1 = *var2;
	*var2 = tmp;
}

void swap(double &var1, double &var2) {
	
	double tmp;
	tmp = var1;
	var1 = var2;
	var2 = tmp;
}

void pow(int * arr, int len) {

	for (int i = 0; i < len; i++) {

		arr[i] *= arr[i];
		// *(arr + i) *= *(arr + i);
	}
}
