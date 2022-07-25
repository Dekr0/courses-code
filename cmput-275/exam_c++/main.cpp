#include <iostream>
#include <string>

using namespace std;

class A {
public:
    A();
    A(const A& copy);
};

A::A() {
    cout << "constructor" << endl;
}

A::A(const A& copy) {
    cout << "copy" << endl;
}

int main() {
    A a;
    A b = a;
}

