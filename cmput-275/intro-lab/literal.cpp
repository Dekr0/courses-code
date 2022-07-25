#include <iostream>
using namespace std;

int main(void)
{
	unsigned long i = 0;
	
	while (i < 0xFAD9CEA62ul)
	{
		i++;	
	}

	cout << i << " is equal to 0xFAD9CEA62ul" << endl;

	return 0;
}
