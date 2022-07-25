#include <iostream>
using namespace std;

int main(){
	const int max_size = 20;
	long long factorials[max_size];

	factorials[0] = 1;
	factorials[1] = 1;
	for (int i=2; i<max_size; i++)
		factorials[i] = i * factorials[i-1];
	for (int i=0; i<max_size; i++)
		cout << i << "! = " << factorials[i] << endl;

	return 0;
}