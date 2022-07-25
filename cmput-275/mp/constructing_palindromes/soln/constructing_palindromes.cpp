// Name: Chengxuan Li
#include <iostream>
using namespace std;

int main(){
	
	int n, l = 1;
	cin >> n;

	int cc[26] = {0};

	for (int i = 0; i < n; ++i) {
		char c;
		int t = 0;
		cin >> c;
	
		t = int(c) - int('a');
		if (cc[t] == 0) {
			cc[t] = 1;
		} else {
			cc[t] += 1;
			if (cc[t] % 2 == 0) {
				l += 2;
				cc[t] -= 2;
			}
		}
	}

	if (l > n)
		l -= 1;

	cout << l << endl;

	return 0;
}
