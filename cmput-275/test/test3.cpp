#include <iostream>
using namespace std;

int main() {

	int16_t x = 130;
	int8_t y = x;

	int16_t a = -10;
	int8_t b = a;

	cout << int16_t(y) << endl;
	cout << int16_t(b) << endl;

	return 0;
}
