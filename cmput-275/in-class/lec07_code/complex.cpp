#include <iostream>
#include <ostream>
using namespace std;

class Complex {
	public:
		Complex(double re = 0.0, double im = 0.0);  // constructor

		Complex operator+(Complex rhs);  // addition of complex numbers
		Complex operator-(Complex rhs);
		Complex operator*(Complex rhs);
		Complex operator/(Complex rhs);
		Complex operator-();

		friend ostream& operator<<(ostream& out, Complex cplx);
        friend istream& operator>>(istream& in, Complex &cplx);
        // this function is not within the scope of the class since the first
        // operand is not the memeber of the class, which means it doesn't have
        // access to the private members
        //
        // Using friend, means that this particualr function with these 
        // particular parameters and return type, it will have access to the
        // members of the complex class

	private:
		double real, imag;
};

Complex::Complex(double re, double im) {
	// implementation of constructor
	real = re;
	imag = im;
}

Complex Complex::operator+(Complex rhs) {
	return Complex(real + rhs.real, imag + rhs.imag);
}

Complex Complex::operator-(Complex rhs) {
	return Complex(real - rhs.real, imag - rhs.imag);
}

Complex Complex::operator*(Complex rhs) {
	return Complex(real * rhs.real -  imag * rhs.imag, real * rhs.imag + imag * rhs.real);
}

Complex Complex::operator-(){
    // return Complex() - *this
	return Complex(-real, -imag);
}

Complex Complex::operator/(Complex rhs) {
    
    double norm = rhs.real * rhs.real + rhs.imag * rhs.imag;
    double re = real * rhs.real + imag * rhs.imag;
    double im = -real * rhs.imag + imag * rhs.real;
    return Complex(re / norm, im / norm);

}

ostream& operator<<(ostream& out, Complex cplx) {
    
    // must return a reference of the ostream object (cout) when multiple <<
    // operators are chained together

    // << only is only implemented by the built-in data type and other built-in
    // class

	return (((out << cplx.real) << ' ') << cplx.imag) << 'i';
    // (out << cplex.real) is a lvalue
    // notice that it is not allowed to pass a copy of the obstream, it is
    // protected members in C++ (OOP realted); it is also not allowed to return
    // an copy of obstream object
}

istream& operator>>(istream& in, Complex &cplx) {
    return in >> cplx.real >> cplx.imag;
}


int main() {

	Complex a = Complex(10.0, 5.0);
	Complex b = Complex(1.00, 2.00);

    // << is a binary operator
    // cout is first operand, a is second operand; 
    // 
    // cout is ostram object (output stream), cannot implement as a method of a class
    // require to implement outside of the class
	cout << a << endl;
	cout << b << endl;

	cout << "a + b = " << a + b << endl;
	cout << "a - b = " << a - b << endl;
    cout << "a * b = " << a * b << endl;
    cout << "a / b = " << a / b << endl;

    return 0;
}
