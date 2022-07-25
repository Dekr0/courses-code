// Name: Chengxuan Li
#include <iostream>
using namespace std;

int main(){

	int n = 0;
	int t = 0;
	int smax = 0;
	int emin = 24;
	bool flag = true;
	cin >> n >> t;

	int p[n][2];
	for (int i = 0; i < n; ++i) {
		cin >> p[i][0] >> p[i][1];
		smax = p[i][0] > smax ? p[i][0] : smax;
		emin = p[i][1] < emin ? p[i][1] : emin;
	}

	for (int i = 0; i < n; ++i) {
		if (!flag) {
			break;
		}

		for (int j = i + 1; j < n; ++j) {
			if (p[i][0] >= p[j][1] || p[i][1] <= p[j][0]) {
				cout << "IMPOSSIBLE" << endl;
				flag = false;
				break;
			}
		}
	}

	if (flag) {
		int h = abs(smax-emin);
		int days = t % h > 0 ? t/h+1 : t/h;
		cout << days << endl;
	}

	return 0;
}
