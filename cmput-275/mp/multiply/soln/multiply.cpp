#include <iostream>
#include <algorithm>

using namespace std;

int main() {
  int a[100], b[100], product[200];
  int n, m;

  // Read the input
  cin >> n >> m;


  for (int i = 0; i < n; ++i) {
      cin >> a[i];
      product[i] = 0;
  }

  for (int i = 0; i < m; ++i) {
      cin >> b[i];
      product[i + n] = 0;
  }

  // Solve the problem

  for (int i = 0; i < m; ++i) {
      for (int j = 0; j < n; ++j) {
          product[i + j] += a[n - 1 - j] * b[m - 1 - i];
          if (product[i + j] >= 10) {
              product[i + j + 1] += product[i + j] / 10;
              product[i + j] = product[i + j] == 10 ? 0 : product[i + j] -
                      product[i + j] / 10 * 10;
          }
      }
  }

  for (int i = n + m - 1; i >= 0; --i) {
      cout << product[i] << " ";
  }

  return 0;
}
