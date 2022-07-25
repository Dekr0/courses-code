#include <iostream>
#include <map>
#define EAST 'e'
#define WEST 'w'
#define TRANSFER 100
using namespace std;

int main() {

    int n = 0, m = 0;
    cin >> n >> m;

    map<int, char> queue;

    for (int i = 0; i < n; ++i) {
        int time = 0;
        cin >> time;
        queue[time] = WEST;
    }

    for (int i = 0; i < m; ++i) {
        int time = 0;
        cin >> time;
        queue[time] = EAST;
    }

    char dir = WEST;
    int total = 0;
    for (auto & car : queue) {
        total += total < car.first ? car.first - total : 0;
        total += car.second == dir ? 0 : TRANSFER;
        total += TRANSFER;
        dir = car.second == WEST ? EAST : WEST;
    }

    cout << total << endl;

	return 0;
}