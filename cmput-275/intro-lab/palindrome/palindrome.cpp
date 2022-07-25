#include <iostream>
#include <cstring>
using namespace std;

string palindrome(int);

int main() {

	int n;
	cin >> n;

	string r = palindrome(n);
	cout << r << endl;

	return 0;
}

string palindrome(int n) {

	char word[n];
	int s = 0;

	for (int i = 0; i < n; i++) {
		cin >> word[i];
	}

	if (n % 2 == 0) {
		return "Not a Palindrome";
	}

	n--;

	while (s != n) {
		if (word[s] != word[n]) {
			return "Not a Palindrome";
		}
		s++;
		n--;
	}

	return "Palindrome";
}

