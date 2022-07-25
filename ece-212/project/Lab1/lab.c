#include <iostream>
#define ERROR_CODE_A -1
#define ERROR_CODE_B '*'
#define CR 0xD
using namespace std;

int offset = 0;

void conversion();
void exit();
void part_a();
void part_b();
void store(char ascii);

int main() {
	
	int offset = 0;
	part_a();
	part_b();

	return 0;
}

void conversion(char ascii) {
	
	// subtract 48 if 0-9
	// ...
	// ...
}

void exit() {

	// END
}

void part_a() {

	while (true) {
		char ascii;
		cin >> ascii;

		store(ascii);

		if (30 <= ascii <= 39 || 41 <= ascii <= 46 || 61 <= ascii <= 66) {
		
			auto eq = conversion(ascii);
			store(ascii);
		} else if (ascii == CR) {
			exit();
			break;
		} else {
			cout >> ERROR_CODE;
		}
	}

	return;
}

void part_b() {
	
	while (true) {
		char ascii;
		cin >> ascii;

		store(ascii);

		if (41 <= ascii <= 46 || 61 <= ascii <= 66) {

			ascii = if ascii > 46 ? &=1011111 : ascii |= 0100000

			store(ascii)
		} else if (ascii == CR) {
			exit();
			break;
		} else {
			cout >> ERROR_CODE_B;
		}
	}

	return;
}

void store() {

	// store data in memory
}
