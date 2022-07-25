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
#define DEBUG false

Matrix::Matrix(size_t num_rows, size_t num_columns, float init) {
    /*
     * Description:
     *      The constructor will initialize a num_rows * num_column matrix and
     *      every element in the matrix will be assigned as floating point value
     *      init
     *
     * Arguments:
     *      (size_t) num_rows:
     *          Number of rows in the matrix
     *
     *      (size_t) num_columns:
     *          Number of columns in the matrix
     *
     *      (float) init:
     *          floating point value that will be assign to every element in the
     *          matrix
     */

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
    /*
     * Description:
     *      The constructor will create a num_rows * num_columns matrix and
     *      assign floating point value from a given array to each element in the
     *      matrix in order (row to column)
     *
     * Arguments:
     *      (size_t) num_rows:
     *          Number of rows in the matrix
     *
     *      (size_t) num_columns:
     *          Number of columns in the matrix
     *
     *      (float*) arr_ptr:
     *          Floating point values array for assignment of each element of the
     *          matrix
     */

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
    /*
     * Description:
     *      The copy constructor will create a deep copy from a provided instance
     *      and initialize an new instance with this deep copy
     *
     * Argument:
     *      (const Matrix&) copy:
     *          The Matrix's instance for deep copy
     */

    if (DEBUG) { cout << "copy constructor is called" << endl; }

    // Avoid self-assignment / creating a deep copy from instance itself
    if (&copy != this) { restruct(copy); }
}

Matrix::~Matrix() {
    /*
     * Description:
     *      The destructor of the instance. It will deallocate all the memory of
     *      2D array in the heap, and reassign all the members to either 0 or
     *      null pointer
     */

    if (DEBUG) { cout << "Destructor called" << endl; }
    destruct();
}

void Matrix::restruct(const Matrix& copy) {
    /*
     * Description:
     *      A separate step for creating a deep copy since copy instructor and
     *      assignment operator share the similar process of creating deep copy
     *
     * Arguments:
     *      (const Matrix&) copy:
     *          A Matrix's instance for deep copy
     */

    destruct();  // Clean up the existent value and memory for new content
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
    /*
     * Description:
     *      A separate step for memory deallocate and member reassignment since
     *      some methods share this process at the same time
     */

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
    /*
     * Description:
     *      Overloading the addition operator for Matrix class. Perform addition
     *      between matrix
     *
     * Arguments:
     *      (const Matrix&) rhs:
     *          Right hand side matrix for matrix addition
     *
     * Return:
     *      A new Matrix's instance that carry the result of addition of two
     *      matrix
     */

    // Make sure the matrix is not empty and has the same size
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
    /*
     * Description:
     *      Overloading the subtraction operator for Matrix class. Perform
     *      subtraction between matrix
     *
     * Arguments:
     *      (const Matrix&) rhs:
     *          Right hand side matrix for matrix subtraction
     *
     * Return:
     *      A new Matrix's instance that carry the result of subtraction of two
     *      matrix
     */

    // Make sure the matrix is not empty and has the same size
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
    /*
     * Description:
     *      Overloading the multiplication operator for Matrix class. Perform
     *      multiplication between matrix
     *
     * Arguments:
     *      (const Matrix&) rhs:
     *          Right hand side matrix for matrix multiplication
     *
     * Return:
     *      A new Matrix's instance that carry the result of multiplication of two
     *      matrix
     */


    // Make sure the matrix is not empty and has the same size
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
    /*
     * Description:
     *      Overloading the assignment operator. Perform the same process as the
     *      copy constructor but it's for an instance that already initialized
     *
     * Arguments:
     *      (const Matrix&) copy:
     *          The Matrix's instance for assignment (deep copy) to the current
     *          instance
     *
     * Return:
     *      (Matrix&) *this:
     *          a reference to the current instance
     */

    if (DEBUG) { cout << "assignment operator is called " << endl; }
    if (&copy != this) { restruct(copy); }

    return *this;
}

Matrix Matrix::operator-() {
    /*
     * Description:
     *      Overloading the unary operator. Perform negation on all the element
     *      in the matrix
     *
     * Return:
     *      A new instance which carry the result of negation of the matrix
     */

    Matrix new_matrix = Matrix(row, column, 0.0);

    for (int i = 0; i < new_matrix.row; ++i) {
        for (int j = 0; j < new_matrix.column; ++j) {
            new_matrix[i][j] = -matrix[i][j];
        }
    }

    return new_matrix;
}

float* Matrix::operator[](size_t index) {
    /*
     * Description:
     *      Overloading the bracket operator. Perform matrix indexing, it return
     *      the specific row based on given index
     *
     * Arguments:
     *      (size_t) index:
     *          the row to return
     *
     * Return:
     *      (float *) matrix[index], a pointer to the row / array being returned
     *      from the matrix
     */

    return matrix[index];
}

const float* Matrix::operator[](size_t index) const {
    /*
     * Description:
     *      Overloading the bracket operator (const Matrix's instance version)
     */

    return matrix[index];
}

Matrix Matrix::submatrix(size_t row_start, size_t row_end, size_t column_start,
        size_t column_end) {
    /*
     * Description:
     *      Return a submatrix of the original matrix
     *
     * Arguments:
     *      (size_t) row_start:
     *          start of the return row
     *      (size_t) row_end:
     *          end of the return row
     *      (size_t) column_start:
     *          start of the return column
     *      (size_t) column_end:
     *          end of the return column
     *
     * Return:
     *      (Matrix) submatrix:
     *          A Matrix's instance with size (row_end - row_start) *
     *          (column_end - column_start) that contains all the element from
     *          row_start to row_end - 1 and from column_start to column_end - 1
     *          in the original matrix
     */

    // An array to hold the elements from the original matrix for the submatrix
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
    /*
     * Description:
     *      Transpose of an m by n matrix into a n by m matrix
     *
     * Returns:
     *      A new Matrix's instance that carry the result of the transpose of
     *      the current matrix
     */

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
    /*
     * Description:
     *      Overloading insertion operator. Output the elements row by row
     *
     * Arguments:
     *      (ostream&) out:
     *          cout from iostream library for output
     *      (const Matrix&) matrix_obj:
     *          A matrix whose elements needed to print
     *
     * Returns:
     *      (ostream&) out:
     *          cout from iostream library for output
     */

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
    /*
     * Description:
     *      Overloading the insertion operator. Read in elements separated by
     *      space from input stream, and populates elements of the matrix row by
     *      row
     *
     *  Arguments:
     *      (istream&) in:
     *          cin from ostream library
     *
     *      (Matrix&) matrix_obj:
     *          matrix whose elements will be populates by the input stream
     *
     *  Returns:
     *      (istream&) in:
     *          cin from ostream library
     */

    for (int i = 0; i < matrix_obj.row; ++i) {
        for (int j = 0; j < matrix_obj.column; ++j) {
            cin >> matrix_obj.matrix[i][j];
        }
    }

    return in;
}