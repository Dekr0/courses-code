#include <iostream>

using namespace std;

typedef unsigned int uint;

uint climbing(const uint * heights, uint length, uint rest, uint limit);

int main() {
    uint hs[] = {3, 7, 13, 25, 27, 34};
    uint size = sizeof(hs) / sizeof(uint);
    
    cout << climbing(hs, size, 3, 56) << endl;
    
    return 0;
}
