/*
 * Name: Chengxuan Li
 */
#include <vector>
#include <iostream>
#define SCALE 4201337

using namespace std;

int path(vector<vector<unsigned long long>> & dp, int i, int j);

int main() {
    int n = 0, m = 0, t = 0;
    cin >> n >> m;
    
    vector<vector<unsigned long long>> dp(n + 1,
        vector<unsigned long long> (m + 1, 0));
    
    t = path(dp, n, m);
    
    cout << t << endl;
    
    return 0;
}

int path(vector<vector<unsigned long long>> & dp, int i, int j) {
    if (i == 0 && j == 0) {
        return 1;
    }
    
    if (dp[i][j] != 0) {
        return dp[i][j];
    }
    
    if (i == 0)
        dp[i][j] = path(dp, i, j - 1);
    else if (j == 0)
        dp[i][j] = path(dp, i - 1, j) ;
    else
        dp[i][j] = (path(dp, i - 1, j) + path(dp, i, j - 1)) % SCALE;
    
    return dp[i][j];
}



