// Name: Chengxuan Li

#include <iostream>
#define BAD "BAD"
#define GOOD "GOOD"
using namespace std;

int main() {

	int n, m, r = 1;
	cin >> n >> m;

	if (n == 1) {
		cout << BAD << endl;
	} else {
		while (true) {
			if (r == m) {
				cout << GOOD << endl;
				break;
			} else if (r > m) {
				cout << BAD << endl;
				break;
			}
			r *= n;
		}
	}

	return 0;
}
