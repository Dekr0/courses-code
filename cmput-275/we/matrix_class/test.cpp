#include <iostream>
#include "matrix.h"

void test_one();
void test_two();

int main() {

    test_one();
    test_two();

    return 0;
}

void test_one() {

    cout << "Test 1" << endl << endl;

    float arr_ptr[] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0};

    // Test the first constructor

    Matrix* a = new Matrix(3,3,1.0);

    Matrix A = Matrix(2, 3, 1.0);
    Matrix B = Matrix(2, 3, 2.0);
    const Matrix C = Matrix(3, 2, 3.0);

    cout << "A\n" << A << endl;
    cout << "B\n" << B << endl;

    // Test the second constructor
    Matrix D = Matrix(3, 2, arr_ptr);
    cout << "D\n" << D << endl;

    // Test matrix addition
    cout << "A + B\n" << (A + B) << endl;

    // Test matrix subtraction
    cout << "A - B\n" << (A - B) << endl;

    // Test matrix multiplication
    cout << "B * C\n" << (B * C) << endl;

    // Test unary negation
    cout << "-B\n" << (-B) << endl;

    // Test bracket operator
    // non-const
    A[0][0] = 0.0;
    cout << "modified A\n" << A << endl;

    // const
    // C[0][0] = 1.0;
    cout << "C[0][0]\n" << C[0][0] << endl;

    // Test transpose
    cout << "A.transpose()\n" << A.transpose() << endl;

    // Test submatrix
    cout << "D.submatrix(1, 3, 0, 1)\n" << D.submatrix(1, 3, 0, 1) << endl;

    // Test extraction operator
    Matrix E = Matrix(3, 2, 0.0);
    cout << "Please enter 6 floats to populate E" << endl;
    cin >> E;
    cout << "E after extraction\n" << E << endl;

    // Test copy constructor
    Matrix F = B;
    F[0][0] = 100;
    cout << "B after B's copy is modified\n" << B << endl;
}

void test_two() {
    cout << "Test 2" << endl << endl;
    float arr_ptr[] = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0};

    // Test the first constructor
    Matrix A = Matrix(2, 3, 1.0);
    Matrix B = Matrix(2, 3, 2.0);
    const Matrix C = Matrix(2, 3, 3.0);
    Matrix D = Matrix(2, 3, arr_ptr);
    Matrix E = Matrix(3, 2, arr_ptr);

    A = (B + C - D) * E;
    cout << "A\n" << A << endl;

    Matrix F = A;
    cout << "F\n" << F << endl;

    cout << "B before reassign\n" << B << endl;
    B = E;
    cout << "B after reassign\n" << B << endl;

    B[0][0] = 100;
    cout << "E after E's copy is modified\n" << E << endl;

}