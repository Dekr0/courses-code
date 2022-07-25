/*
 * Worksheet Question:
 * 1. A dynmaic array is an array that can be resized
 * 2. Regular array in c++ has fixed size, it can't insert or append new items
 * into the list, etc.
 * 3. If the array is full before adding an new item using pushBack(), it will
 * first resize the array using resize(); then, append the item at the end of
 * the array
 */
#ifndef _DYNARRAY_H_
#define _DYNARRAY_H_

#include <cassert>
#include <cstdlib>

using namespace std;

 /*
  * 1. A dynamic array that can be resized when desired.
  * 2. Regular array in c++ has fixed size. Thus, the array cannot have operation
  * 3. Current dynamic array has the following functionality:
  *     - resize
  *     - append a new item at the end of the array
  *     - indexing an item
  *     - assign to another array variable with same type
  * 4.
  */

// A dynamic array that can be resized when desired.
// Vector is also a dynamic array
template <typename T>
class DynamicArray {
public:
  // create a new array with the given size
  DynamicArray(unsigned int size = 0);
  ~DynamicArray();

  // copy constructor
  DynamicArray(const DynamicArray& copy);

  // assignment operator overload
  DynamicArray& operator=(const DynamicArray& rhs);

  // add a new entry to the end of the array
  // actually allocate twice as much space as the user use
  void pushBack(const T& item);

  // resize the array, keeping the items in the current array
  // except for ones that are indexed >= size (if any)
  void resize(unsigned int newSize);

  T& operator[](unsigned int index);

  // just return the # of slots allocated to the array
  unsigned int size() const;

  // this is what you will implement in exercise 2
  void insert(unsigned int index, const T& item);

  // this is what you will implement in exercise 3
  void erase(unsigned int index);

  // this is what you will implement in exercise 4
  T popBack();

  // this is what you will implement in exercise 6
  int find(const T& item);

private:
  T *array; // the actual array allocated in the heap
  unsigned int numItems;  // number of items in the array, for the user
  unsigned int arraySize; // size of the underlying array in the heap
};

template <typename T>
DynamicArray<T>::DynamicArray(unsigned int size) {
  // just point array to NULL and let resize do the work
  array = NULL;
  resize(size);
}

template <typename T>
DynamicArray<T>::~DynamicArray() {
  delete[] array;
}

template <typename T>
DynamicArray<T>::DynamicArray(const DynamicArray& copy) {
  // first get an array of the appropriate size,
  // since this is a constructor, we treat it as if the array pointer
  // was not initialized at all
  // FURTHER STUDY FOR THE CURIOUS: constructor delegation
  array = NULL;
  resize(numItems);

  // now the array has the proper size, so just copy the contents of the other
  // array into this array
  for (unsigned int i = 0; i < numItems; i++) {
    array[i] = copy.array[i];
  }
}

// different than the copy constructor, see the lecture slides for a discussion
template <typename T>
DynamicArray<T>& DynamicArray<T>::operator=(const DynamicArray& rhs) {
  resize(rhs.numItems);

  for (unsigned int i = 0; i < numItems; i++) {
    array[i] = rhs.array[i];
  }

  return *this;
}

template <typename T>
void DynamicArray<T>::resize(unsigned int newSize) {
  // get an array from the heap with twice the new user array size
  // (or 10, if the new size is really small)
  unsigned int newArraySize = max(newSize*2, 10u);

  // get the new array
  T *newArray = new T[newArraySize];

  // if we had an old array (i.e. this was not called from the constructor),
  // copy the contents over to the new array and then delete this array
  if (array != NULL) {
    // copy the old array over until we fill the new array (according to user size)
    // or we copied all contents from the old array
    for (unsigned int i = 0; i < min(numItems, newSize); i++) {
      newArray[i] = array[i];
    }
    delete[] array;
  }

  // update the class members for this new array and point to it now
  numItems = newSize;
  arraySize = newArraySize;
  array = newArray;
}

template <typename T>
unsigned int DynamicArray<T>::size() const {
  return numItems;
}

template <typename T>
void DynamicArray<T>::pushBack(const T& item) {
  // if the dynamic array is already full, resize it
  if (numItems == arraySize) {
    // resize to get enough space for more items
    resize(numItems+1);
    // but we haven't actually put the new item in yet
    numItems--;
  }

  // either way, we now have space to add the item
  // to the end of the user's array
  array[numItems] = item;
  numItems++;
}

template <typename T>
T& DynamicArray<T>::operator[](unsigned int index) {
  assert(index < numItems);
  return array[index];
}

// EXERCISE 2: Finish implementing the following
template <typename T>
void DynamicArray<T>::insert(unsigned int index, const T& item) {
    assert(index < numItems);
    if (numItems == arraySize) {
        resize(numItems + 1);
        --numItems;
    }

    for (int i = numItems; i > index; --i) {
        array[i] = array[i - 1];
    }

    array[index + 1] = item;
    numItems++;
 }

// EXERCISE 3: Finish implementing the following
template <typename T>
void DynamicArray<T>::erase(unsigned int index) {
    assert(index < numItems);

    for (int i = index; i < numItems - 1; ++i) {
        array[i] = array[i+1];
    }

    array[numItems - 1] = NULL;
    --numItems;

    /* from solution, de-allocate some un-used memory from heap if user's array
     * is much smaller than the actual array in heap
     */

    if (numItems < arraySize && arraySize > 10) {
        resize(numItems);
    }

}

// EXERCISE 4: Finish implementing the following
template <typename T>
T DynamicArray<T>::popBack() {
  // first thing we want to do is ensure there are actually items in the array
  if (numItems < 0) {
      return NULL;
  }

  // we should copy the item we want so that it can be returned
  T copy = array[numItems - 1];

  // new get rid of the item: can you reuse any code?
  erase(numItems-1);

  // finally, return the item that you created before
  return copy;
}

// EXERCISE 5: Finish implementing the following
template <typename T>
int DynamicArray<T>::find(const T& item) {
  // lets first just look for the item in the array

  for (int i = 0; i < numItems; ++i) {
      if (array[i] == item) {
          return i;
      }
  }

  return -1;
}


#endif
