#include "complex.h"

int main() {

    Complex<int> a(5, 10);
    Complex<int> b(10.0, 5.0);


    cout << a << endl;
    cout << b << endl;
    cout << a + b << endl;

    return 0;
}
