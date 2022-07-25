/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Weekly Exercise #4: Matrix Class
 *
 * Matrix Class Implementation
 */

#include <cassert>
#include "matrix.h"

Matrix::Matrix(size_t num_rows, size_t num_columns, float init) {
    matrix = nullptr;
    row = num_rows;
    column = num_columns;

    matrix = new float*[row];
    for (int i = 0; i < row; ++i) {
        matrix[i] = new float[column];
        for (int j = 0; j < column; ++j) {
            matrix[i][j] = init;
        }
    }
}

Matrix::Matrix(size_t num_rows, size_t num_columns, float* arr_ptr) {
    matrix = nullptr;
    row = num_rows;
    column = num_columns;

    matrix = new float*[row];
    for (int i = 0; i < row; ++i) {
        matrix[i] = new float[column];
        for (int j = 0; j < column; ++j) {
            matrix[i][j] = *arr_ptr;
            ++arr_ptr;
        }
    }
}

Matrix::Matrix(const Matrix& copy) {
    cout << "copy" << endl;
    if (&copy != this) { restruct(copy); }
}

Matrix::~Matrix() {
    cout << "Destructor called" << endl;
    destruct();
}

void Matrix::restruct(const Matrix& copy) {
    destruct();
    row = copy.row;
    column = copy.column;

    assert(row == copy.row && column == copy.column);

    matrix = new float*[row];

    for (int i = 0; i < row; ++i) {
        matrix[i] = new float[column];
        for (int j = 0; j < column; ++j) {
            matrix[i][j] = copy.matrix[i][j];
        }
    }
}

void Matrix::destruct() {
    for (int i = 0; i < row; ++i) {
        float* old_row = matrix[i];
        matrix[i] = nullptr;
        delete[] old_row;
    }

    float** old_column = matrix;
    matrix = nullptr;
    delete[] old_column;

    row = 0;
    column = 0;
}

Matrix Matrix::operator+(const Matrix& rhs) {
    assert(row == rhs.row && column == rhs.column);
    assert(row > 0 && column > 0);

    Matrix new_matrix = Matrix(row, column, 0.0);

    for (int i = 0; i < new_matrix.row; ++i) {
        for (int j = 0; j < new_matrix.column; ++j) {
            new_matrix[i][j] += matrix[i][j] + rhs.matrix[i][j];
        }
    }

    return new_matrix;
}

Matrix Matrix::operator-(const Matrix& rhs) {
    assert(row == rhs.row && column == rhs.column);
    assert(row > 0 && column > 0);

    Matrix new_matrix = Matrix(row, column, 0.0);

    for (int i = 0; i < new_matrix.row; ++i) {
        for (int j = 0; j < new_matrix.column; ++j) {
            new_matrix[i][j] += matrix[i][j] - rhs.matrix[i][j];
        }
    }

    return new_matrix;
}

Matrix Matrix::operator*(const Matrix& rhs) {
    assert(column == rhs.row);
    assert(column > 0 && row > 0 && rhs.column > 0);

    Matrix new_matrix = Matrix(row, rhs.column, 0.0);

    for (int i = 0; i < new_matrix.row; i++) {
        for (int j = 0; j < new_matrix.column; j++) {
            for (int k = 0; k < column; k++) {
                new_matrix.matrix[i][j] += matrix[i][k] * rhs.matrix[k][j];
            }
        }
    }

    return new_matrix;
}

Matrix& Matrix::operator=(const Matrix& copy) {
    if (&copy != this) { restruct(copy); }

    return *this;
}

Matrix Matrix::operator-() {
    Matrix new_matrix = Matrix(row, column, 0.0);

    for (int i = 0; i < new_matrix.row; ++i) {
        for (int j = 0; j < new_matrix.column; ++j) {
            new_matrix[i][j] = -matrix[i][j];
        }
    }

    return new_matrix;
}

float* Matrix::operator[](size_t index) {
    return matrix[index];
}

const float* Matrix::operator[](size_t index) const {
    return matrix[index];
}

Matrix Matrix::submatrix(size_t row_start, size_t row_end, size_t column_start,
        size_t column_end) {

    float items[(row_end - row_start) * (column_end - column_start)];
    int n = 0;

    for (int i = row_start; i < row_end; ++i) {
        for (int j = column_start; j < column_end; ++j) {
            items[n] = matrix[i][j];
            ++n;
        }
    }

    Matrix sub = Matrix(row_end - row_start, column_end - column_start, items);

    return sub;
}

Matrix Matrix::transpose() {
    assert(row > 0 && column > 0);

    Matrix new_matrix = Matrix(column, row, 0.0);

    for (int i = 0; i < new_matrix.row; ++i) {
        for (int j = 0; j < new_matrix.column; ++j) {
            new_matrix.matrix[i][j] = matrix[j][i];
        }
    }

    return new_matrix;
}

ostream& operator<<(ostream& out, const Matrix& matrix_obj) {
    assert(matrix_obj.row > 0 && matrix_obj.column > 0);
    for (int i = 0; i < matrix_obj.row; ++i) {
        for (int j = 0; j < matrix_obj.column; ++j) {
            out << matrix_obj.matrix[i][j];
            if (j != matrix_obj.column - 1) { out << ' '; }
        }
        out << endl;
    }

    return out;
}

istream& operator>>(istream& in, Matrix& matrix_obj) {
    for (int i = 0; i < matrix_obj.row; ++i) {
        for (int j = 0; j < matrix_obj.column; ++j) {
            cin >> matrix_obj.matrix[i][j];
        }
    }

    return in;
}