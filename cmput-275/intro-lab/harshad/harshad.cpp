#include <iostream>
using namespace std;

int main(void)
{
	int n;
	cin >> n;
	while (true)
	{
		int s = 0;
		int tmp = n;
		while (tmp != 0)
		{
			s += tmp % 10;
			tmp /= 10;
		}
		
		if (n % s == 0)
		{
			cout << n << endl;
			break;
		}

		n++;
	}

	return 0;
}


