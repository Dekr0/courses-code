#include <iostream>
using namespace std;

// int a = 0;  // global variable, change / access scope -> extern

int decimal_builder();
long long fib(int);

int main()
{
	int n;
	cin >> n;

	// int num1 = decimal_builder();
	for (int i = 0; i < n; i++)
	{
		cout << "F(" << i << ") = " << fib(i) << endl;
	}


	return 0;
}

long long fib(int n)
{
	long long first = 0, second = 1, temp;
	
	if (n == 0)
	{
		return first;
	} else if (n == 1) {
		return second;
	}
	
	for (int i = 2; i <= n; i++)
	{
		temp = second;
		second += first;
		first = temp;
	}

	return second;
}

int decimal_builder()
{
	int ndigits, digit, result = 0;
	
	cin >> ndigits;
	while (ndigits > 0)
	{
		cin >> digit;
		result = result * 10 + digit;
		ndigits--;
	}
	cout << "The integer is: " << result << endl;
	
	return result;
}
