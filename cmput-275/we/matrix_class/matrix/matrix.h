/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Weekly Exercise #4: Matrix Class
 *
 * Header file for Matrix Class declaration
 */

#include <cstddef>
#include <iostream>
#include <ostream>

using namespace std;

#ifndef MATRIX_CLASS_MATRIX_H
#define MATRIX_CLASS_MATRIX_H

class Matrix {

public:

    Matrix(size_t num_rows, size_t num_columns, float init);

    Matrix(size_t num_rows, size_t num_columns, float * arr_ptr);

    Matrix(const Matrix& copy);

    ~Matrix();

    void restruct(const Matrix& copy);

    void destruct();

    Matrix operator+(const Matrix& rhs);

    Matrix operator-(const Matrix& rhs);

    Matrix operator*(const Matrix& rhs);

    Matrix& operator=(const Matrix& copy);

    Matrix operator-();

    float* operator[](size_t index);

    const float* operator[](size_t index) const;

    Matrix transpose();

    Matrix submatrix(size_t row_start, size_t row_end, size_t column_start,
            size_t column_end);

    friend ostream& operator<<(ostream& out, const Matrix& matrix_obj);

    friend istream& operator>>(istream& in, Matrix& matrix_obj);

private:
    float **matrix;
    size_t row = 0, column = 0;
};

#endif //MATRIX_CLASS_MATRIX_H
