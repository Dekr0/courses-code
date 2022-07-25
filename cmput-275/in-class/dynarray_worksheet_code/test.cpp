#include <iostream>
#include "dynarraytwo.h"

using namespace std;

int main() {
    DynamicArray<int> a(5);

    for (unsigned int i = 0; i < a.size(); i++) {
        a[i] = i + 1;
    }

    a.pushBack(6);
    a.insert(1, 7);

    for (unsigned int i = 0; i < a.size(); i++) {
        cout << a[i] << endl;
    }

    return 0;
}