#include <iostream>
#include <cstring>
#define FPRIME 2
#define ISPRIME 'p'
#define TWINPRIME 't'
using namespace std;

bool isPrime(int);
void twinPrime(int);

int main() {
	
	char q;
	int n;
	cin >> q >> n;
	
	if (q == ISPRIME) {
		if (isPrime(n)) {
			cout << "prime" << endl;
		} else {
			cout << "not prime" << endl;
		}
	} else if (q == TWINPRIME) {
		twinPrime(n);
	}

	return 0;

}

bool isPrime(int n) {
	
	if (n < FPRIME) {
		return false;
	}

	for (int i = FPRIME; i * i <= n; i++) {
		if (n % i == 0) {
			return false;
		}
	}

	return true;
}

void twinPrime(int k) {

	int i = 0;
	int p = FPRIME;
	while (i < k) {
		if (isPrime(p) && isPrime(p+2)) {
			cout << p << " " << p + 2 << endl;
			p += 2;
			i++;
		} else {
			p++;
		}
		
	}	
}
