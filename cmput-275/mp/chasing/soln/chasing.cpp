#include <iostream>
#include <unordered_map>
using namespace std;

int main() {

	int S, A;
	cin >> S >> A;

	int addr[A];
	for (int i = 0; i < A; ++i)
		cin >> addr[i];

	int def = addr[0];
	unordered_map<int, bool> dp;
	while (true) {
		if (def < 0) {
			cout << def << endl;
			break;
		}
		
		if (dp.find(def) != dp.end()) {
			cout << "There was a cycle" << endl;
			break;
		}

		dp[def] = true;
		def = addr[def - S];
	}

  return 0;
}
