#include <iostream>
using namespace std;

void reverse(int*, int*);

int main() {

	int a[7] = {1, 2, 3, 4, 5, 6, 7};
	reverse(a+2, a+6);

	for (int i : a) {
		cout << i << " ";
	}

	cout << endl;

	return 0;
}

void reverse(int* begin, int* end) {
	
	--end;

	while (begin != end && begin != end-1) {

		int tmp = *begin;
		*begin = *end;
		*end = tmp;

		++begin;
		--end;
	}
}

