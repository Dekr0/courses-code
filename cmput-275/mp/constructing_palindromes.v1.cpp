// Name: Chengxuan Li
#include <iostream>
#include <map>
using namespace std;

int main(){
	
	int n, l = 1;
	cin >> n;

	map<char, int> cmap;

	for (int i = 0; i < n; ++i) {
		char t;
		cin >> t;
		if (cmap.find(t) == cmap.end()) {
			cmap[t] = 1;
		} else {
			cmap[t] += 1;
			if (cmap[t] % 2 == 0) {
				l += 2;
				cmap[t] -= 2;
			}
		}
	}
	
	if (l > n)
		l -= 1;

	cout << l << endl;

	return 0;
}
