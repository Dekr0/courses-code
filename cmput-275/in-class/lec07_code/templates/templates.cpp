/*
  Some examples of template arguments for functions and classes

  Course: CMPUT 275
  Zac Friggstad, 2021
*/


// templates allow to write code for generic type

#include <iostream>
#include <string>

using namespace std;

// Returns a copy of the maximum of the two items
// assumes the items are comparable via <
template <typename T>
T getMax(T arg1, T arg2) {
  if (arg1 < arg2) return arg2;
  else return arg1;
}

// Swaps the items
template <typename T>
void swapItems(T& arg1, T& arg2) {
  T arg3 = arg1;
  arg1 = arg2;
  arg2 = arg3;
}

int main() {

    /*
     * Compiler can deduce the type for T if two parameters have the same type
     *
     * Compiler will generate different version of the codes which using 
     * templates based on type being specified during the call and etc.
     *
     * Auto keyword, it can deduce the type in "runtime". Notice that auto is
     * not a type before the code is executing.
     */

  // type need to be the same
  cout << getMax<int>(6, 3) << endl;
  
  cout << getMax<char>('a', 'Q') << endl; 
  // lowercase letters have higher ASCII value
  
  cout << getMax<string>("apple", "orange") << endl;    

  int a = 4, b = 0;

  // swaps the items so a < b
  // note the lack of template argument: the compiler inferred
  // we wanted the argument to be an integer
  if (getMax(a, b) == a) swap(a, b);
  cout << a << ' ' << b << endl;

  return 0;

}
