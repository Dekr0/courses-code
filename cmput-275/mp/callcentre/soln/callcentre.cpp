/*
 * Name: Chengxuan Li
 */
#include <iostream>
using namespace std;

int main() {

   int n = 0, q = 0;
   cin >> n >> q;

   int array[n];
   int dp[n];

   for (int i = 0; i < n; ++i) {
       cin >> array[i];
       dp[i] = -1;
   }

   int ps = 0;

   for (int i = 0; i < q; ++i) {
       int s, t;
       int l = 0, u = 0;
       cin >> s >> t;

       if (s == t) {
           cout << array[s - 1] << endl;
           continue;
       }

       if (s <= 1 || dp[s - 2] < 0) {
           for (int j = s <= ps ? ps : 0; j <= s - 2; ++j) {
               l += array[j];
               dp[j] = l;
           }
       } else {
           l = dp[s - 2];
       }

       if (dp[t - 1] < 0) {
           u += l;
           for (int j = s - 1; j <= t - 1; ++j) {
               u += array[j];
               dp[j] = u;
           }
       } else {
           u = dp[t - 1];
       }

       ps = s;
       cout << u - l << endl;

   }

    return 0;
}