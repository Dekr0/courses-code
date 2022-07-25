#include <iostream>

using namespace std;

int main() {
    
    int n = 0;
    cin >> n;
    
    long long int floors[n];
    long long int total = 0;
    for (int i = 0; i < n; ++i) {
        cin >> floors[i];
        if (i != 0) {
            total = floors[i] > floors[i - 1] ?
                total + (floors[i] - floors[i - 1]) : total;
        }
    }
    
    cout << total << endl;
  
    return 0;
}
