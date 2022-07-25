/*
  A simple demonstration of return-by-reference
  (i.e. the function call can itself be used as an lvalue)

  Course: CMPUT 275
  Zac Friggstad, 2021
*/

#include <iostream>

using namespace std;

int global_var;

// return by reference: will return an lvalue
// CAUTION: never return a local variable as an l-value since
//          the variable goes out of scope
int& func() {
  return global_var;
}

int main() {
  global_var = 5;
  func() = 7;  // an alias or reference

  int* ptr = new int;
  *(ptr+4) = 12;  // a reference about something in the memory (heap & stack)

  cout << global_var << endl;

  return 0;
}
