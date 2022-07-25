#include <iostream>
using namespace std;

int main() {

	char str[6] = "hello";
	cout << *(str+4) << endl;

/*
	for (char c : str)
		cout << c << endl;

	
	cout << '\0' << endl;
*/

	return 0;
}
