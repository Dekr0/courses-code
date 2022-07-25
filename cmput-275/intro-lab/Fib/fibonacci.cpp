#include <iostream>
using namespace std;

int main(void)
{
	int tmp;
	int a = 0;
	int b = 1;
	
	cout << a << endl << b << endl;
	for (int i = 0; i <= 20; i++)
	{
		tmp = b;
		b = a + b;
		cout << b << endl;
		a = tmp;
	}

	return 0;
}
