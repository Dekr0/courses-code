#include <iostream>

using namespace std;


int main() {
 
    int n = 0;
    cin >> n;
    
    int h[n];
    int p[n];
    int out[n];
    
    for (int i = 0; i < n; ++i) {
        cin >> h[i];
        out[i] = 0;

        if (i == 0) {
            p[i] = 0;
            continue;
        }
        
        p[i-1] = h[i] > h[i-1] ? 1 : 0;
    }

    out[n - 2] = 0;
    for (int i = n - 2; i >= 0; --i) {
        out[i] = p[i] ? p[i] + out[i + 1] : p[i];
    }
    
    for (int i : out) {
        cout << i << " ";
    }

	return 0;
}