#include <iostream>
using namespace std;


int main(){
    int n, m;
    cin >> n >> m;

    int array[n];
    long long int bag[n];
    bag[0] = 1;

    for (int i = 0; i < n; ++i) {
        cin >> array[i];
        bag[i] = i == 0 ? bag[i] = array[i] : bag[i - 1] * array[i];
    }

    for (int i = 0; i < n; ++i) {

        if (i + m >= n - 1 && i - m <= 0) {
            cout << 0 << " ";
            continue;
        }

        if (bag[n - 1] == 1 || bag[n - 1] == -1) {
            cout << bag[n - 1] << " ";
            continue;
        }

        if (i + m >= n - 1) {
            cout << bag[i - m - 1] << " ";
            continue;
        }

        long long int div = bag[i + m];
        long long int lower = i - m - 1 >= 0 ? bag[i - m - 1] : 1;

        if (div != 0) {
            long long int upper = bag[n - 1];
            lower = (upper / div) * lower;
        } else {

            for (int j = i + m + 1; j < n; ++j) {

                lower *= array[j];

                if (array[j] == 0) {
                    lower = 0;
                    break;
                }
            }
        }

        cout << lower << " ";
    }

	return 0;
}
