#include <iostream>

using namespace std;

class IntArray {

	public:
        IntArray(unsigned int size);
        IntArray(const IntArray& rhs);
        ~IntArray();
        
        IntArray& operator=(const IntArray& rhs);

		int * array;
		unsigned int asize;
};

IntArray::IntArray(unsigned int size) {
    cout << "Default Constructor" << endl;
	asize = size;
	array = new int[asize];  // allocate memory a size "asize" array in heap
}

// Function Overloading C++: compiler will know which version of the function
// will be called based on the parameters of the function is using
IntArray::IntArray(const IntArray& rhs) {
    cout << "Copy Constructor" << endl;
    this->asize = rhs.asize;
    this->array = new int[this->asize];

    for (int i = 0; i < this->asize; i++) {
        this->array[i] = rhs.array[i];
    }

}

IntArray::~IntArray() {
	cout << "Destruct!" << endl;
	delete [] array;
}


// usually without &, it will return a copy of that object instead of a precise
// reference of the memory addr of that object
// & also usually indicate it is a lvalue
IntArray& IntArray::operator=(const IntArray& rhs) {     
    /* 
     * overload assignment operator
     * 
     * Arguments:
     *      (const IntArray&) rhs: cannot be changed (all members, etc.)
     *      
     *      (using "IntArray rhs" will create a copy of the instance being 
     *      passed)
     *
     * Return:
     *      an IntArray reference
     */

    delete[] this->array;  
    // deallocated the mem. of current array for assigning a new pointer of the 
    // array in rhs (another instance of IntArray)
    
    this->asize = rhs.asize;
    this->array = new int[this->asize];

    for (int i = 0; i < this->asize; i++) {
        this->array[i] = rhs.array[i];
    }
    
    // the type of "this" is a pointer, specifically IntArray*
    // the type of "*this" is IntArray and it is an lvalue reference
    // to this actual instance of the array in memoery
    // pointer also occupiy some space in memory
    return *this;

}

int main() {

    IntArray a(20), b(10);
    IntArray c(a);  
    // built-in copy constrcutor, copy all the member of "a"
    // but it doesn't allocate any new mem. in heap (a pointer)

    cout << a.array << ' ' << b.array << ' ' << c.array << endl;
	b = a;  
	
    /*
     * reminder: assign an instance to another instance will copy
     * and paste all the member from current instance to another
     * instance; does not copy the dynamic memory over, it just
     * copies the pointer of the dynamic memory (dynmaic memory
     * is not a member of the class
     * 
     * memory leak, b's original heap array has no pointer to
     * point
     * 
     * also a memory location is being destructed twice, since
     * b and a point to the same memory location
     *
     * bad style when a memory location is being reference by multiples members,
     * like one member change the object in that memory location, it will reflect
     * to other memebers, or some types of behaviours on a memory location being
     * done more than once might causes exception or interrput
     *
     */


    /*
     * lvalue:
     * int x = 5, y = 6, z = 7;
     * (x = y) = z;
     * equivalent to the following:
     * x = y;
     * x = z;
     */

    cout << a.array << ' ' << b.array << endl;

	return 0;
}
