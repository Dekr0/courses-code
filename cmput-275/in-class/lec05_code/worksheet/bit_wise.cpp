#include <iostream>
using namespace std;

void printBits(int16_t);

int main() {

	int16_t a;
	cin >> a;

	printBits(a);

	return 0;
}

void printBits(int16_t a) {
	
	int pt = 32768;
	for (int i = 0; i < 16; ++i) {
		int r = (a & pt) != 0 ? 1 : 0;
		cout << r;
		pt /= 2;
	}
	cout << endl;

}
