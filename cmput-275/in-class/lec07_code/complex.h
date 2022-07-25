#ifndef _COMPLEX_H_
#define _COMPLEX_H_

#include <iostream>
#include <ostream>

using namespace std;

template <typename T>
class Complex {
    
    public:
        Complex(T re, T im);
        
        Complex<T> operator+(Complex<T> rhs);

        template <typename Q> 
        friend ostream& operator<<(ostream& out, Complex<Q> rhs);

    private:
        T real, imag;

};

template <typename T>
Complex<T>::Complex(T re, T im) {
    real = re;
    imag = im;
}

template <typename T>
Complex<T> Complex<T>::operator+(Complex<T> rhs) {
    /*
     * Remark: addition of two complex number using template must be using the
     * same type.
     */

    return Complex(real + rhs.real, imag + rhs.imag);
}

template <typename Q>
ostream& operator<<(ostream& out, Complex<Q> cplx) {
    /*
     * Remark: a friend function should have a separate template parameter
     */

    return out << cplx.real << ' ' << cplx.imag << 'i';
}

#endif
