#include <iostream>
using namespace std;

int power(int, int);

int main(void)
{
	int a, b;

	cin >> a >> b;
	cout << power(a, b) << endl;

	return 0;
}

int power(int a, int b)
{
	int r = 1;

	for (int i = 0; i < b; i++)
	{
		r = r * a;
	}

	return r;
}

