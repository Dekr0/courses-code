#include <iostream>

void test_ptr(int *);

int main() {

	int a[5] = {1, 2, 3, 4, 5};
	int * ptr = a;
	
	ptr += 1;
	
	test_ptr(ptr);

	std::cout << *ptr << std::endl;
	std::cout << ptr[0] << std::endl;

	return 0;
}

void test_ptr(int * ptr) {

	std::cout << std::endl;
}
