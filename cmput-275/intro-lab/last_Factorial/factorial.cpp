#include <iostream>
using namespace std;

int main(void)
{
	int t, n;

	cin >> t;
	for (int i = 0; i < t; i++)
	{
		int f = 1;
		cin >> n;
		for (int j = 1; j <= n; j++)
		{
			f = f * j;
		}
		cout << f % 10 << endl;
	}

	return 0;
}
