/*
  Some tests for the Counter class. In particular, pay attention
  to when the constructor and destructor are called (the Counter implementation
  will cout something in the constructor and destructor so you can see it).

  Course: CMPUT 275
  Zac Friggstad, 2021
*/

#include <iostream>
#include "counter.h"

using namespace std;

// Demonstrates that the destructor is called at the end of this function
// because the variable falls out of scope.
void aFunction() {
  Counter counterFn(7, 2, 13);
  cout << "We constructed it!" << endl;
}

// Can return an instance of the counter from a function: it is just like
// returning a copy of a variable
Counter returnCounter() {
  Counter cnt(11, 10, 12);
  return cnt;
}

int main() {
  // a counter with range [1,10] that starts at value 9
  cout << "Before constructor" << endl;
  // myCounter is just a reference of an instance of the class Counter,
  // not the object / instance itself 
  Counter myCounter(9, 1, 10);
  Counter anotherCounter;  // use the default arugment  
  // Counter anotherCounter() -> does not use the default value, it declares a
  // function that takes no arguments and return anotherCounter
  cout << "After constructor" << endl << endl;


  for (int i = 0; i < 5; ++i) {
	// this instance of class Counter will be created and destroyed in each
	// iteration. everytime is a brand new instance of class Counter
	Counter loopCounter;
	cout << loopCounter.getCurrValue() << endl;
  }

  // this instance of clas Counter will be destroyed after this for loop but
  // it won't be created and destroyed in each iteration
  for (Counter iCounter(0,0,7); iCounter.getCurrValue() < 7; iCounter.increment()) {
	  cout << iCounter.getCurrValue() << endl;
  }


  cout << "Now playing with the clock" << endl;
  cout << myCounter.getCurrValue() << endl;

  cout << myCounter.increment() << endl;
  cout << myCounter.getCurrValue() << endl;

  cout << myCounter.increment() << endl;
  cout << myCounter.getCurrValue() << endl;
  myCounter.reset();
  cout << myCounter.getCurrValue() << endl;
  cout << "Done playing with the clock" << endl << endl;


  cout << endl << "Now calling aFunction()" << endl;
  aFunction();
  cout << "After aFunction returned!" << endl << endl;

  cout << "Now getting a clock from returnCounter()" << endl;
  Counter nxtCount = returnCounter();
  cout << "Returned from returnCounter()" << endl;
  cout << "It has this value: " << nxtCount.getCurrValue() << endl << endl;;


  // Try understanding these lines after listening to the dynamic memory videos
  Counter *clocks = new Counter[5]; // calls the constructor for each
  // pointer clocks can be treated as an array, who point to (the address of ) 
  // the first element in the array

  cout << "Clocks constructed!" << endl;
 
  for (int i = 0 ; i < 5; ++i) {
	  for (int j = 0; j < i; ++j) {
		  clocks[i].increment();
	  }
  }
  
  // delete clocks;  // destructor will not be called for each
  delete[] clocks; // calls the destructor for each
  cout << "Clocks deleted!" << endl << endl;

  cout << "The program is all done now!" << endl;
  return 0;
}
