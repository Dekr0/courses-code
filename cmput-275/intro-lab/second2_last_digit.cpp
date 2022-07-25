#include <iostream>
#include <cstdlib>
using namespace std;

int main(void)
{
	int a;

	cin >> a;	
	cout << abs(a) / 10 % 10 << endl;

	return 0;
}
