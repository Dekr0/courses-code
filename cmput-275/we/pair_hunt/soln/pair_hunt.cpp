/* 
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Interview Problem: Pair Hunt
 */
#include <iostream>
using namespace std;

int main() {

	int n, T;
	bool found = false;  // flag for whether a pair is found or not
	cin >> n >> T;
	int prices[n];  // array for storing prices of product

	for (int i = 0; i < n; ++i) {
		cin >> prices[i];
	}

	int begin = 0, end = n - 1;  // indices for two end of the array

	while (begin < end) {
		// scaning the array from two end at the same time
		// since the price is in the order, can check whether
		// the smaller number in one end can pair with the 
		// larger number in another end to get the desire
		// price

		int tprice = prices[begin] + prices[end];  // total price
		if (tprice == T) {
			found = true;
			break;
		} else if (tprice < T) {
			++begin;
		} else {
			--end;
		}
	}

	if (found) {
		cout << "YES" << endl;
	} else {
		cout << "NO" << endl;
	}

	return 0;
}


