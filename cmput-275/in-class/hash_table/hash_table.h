
/*
  A hash table for storing items. It is assumed the type T of the item
  being stored has a hash method, eg. you can call item.hash(), which
  returns an unsigned integer.

  Remember, the table stores the copy of the item

  .hash() method is implemented by the class or struct of the item

  Think: the hash table is like a python set.

  Also assumes the != operator is implemented for the item being stored,
  so we could check if two items are different.

  != operator is implemented by the class or struct of the item

  If you just want store integers int for the key, wrap it up in a struct
  with a .hash() method and the != operator.

  Build own unordered map if have time
  - check slide

  Course: CMPUT 275
  Zac Friggstad, 2021
*/

#ifndef _HASH_TABLE_H_
#define _HASH_TABLE_H_

#include "linked_list.h"
#include "dynarray.h"
#include <cassert>

template <typename T>
class HashTable {
public:

  // creates an empty hash table with the given number of buckets.
  HashTable(unsigned int tableSize);

  HashTable(const HashTable<T>& copy);
  ~HashTable();

  HashTable<T>& operator=(const HashTable<T>& rhs);

  // Check if the item already appears in the table.
  bool contains(const T& item) const;

  // Insert the item, do nothing if it is already in the table.
  // Returns true iff the insertion was successful (i.e. the item was not there).
  bool insert(const T& item);

  // Removes the item after checking, via assert, that the item was in the table.
  void remove(const T& item);

  void update(const T&item);

  void clear();

  unsigned int getMaxLoad();

  // Returns the number of items in the hash table.
  unsigned int size() const;

  // Returns a dynamic array containing the items in the hash table
  // (in no particular order).
  DynamicArray<T> getItemsArray() const;

private:
  LinkedList<T> *table; // start of the array of linked lists (buckets)
  unsigned int numItems; // # of items in the table
  unsigned int tableSize; // # of buckets

  // Computes the hash table bucket that the item maps into
  // by calling it's .hash() method.
  unsigned int getBucket(const T& item) const;
};


template <typename T>
HashTable<T>::HashTable(unsigned int tableSize) {
  // make sure there is at least one bucket
  assert(tableSize > 0);

  // calls the constructor for each linked list
  // so each is initialized properly as an empty list
  table = new LinkedList<T>[tableSize];

  // we are not storing anything
  numItems = 0;
  this->tableSize = tableSize;
}

template <typename T>
HashTable<T>::HashTable(const HashTable<T>& copy) {
  table = NULL;

  *this = copy;
}


template <typename T>
HashTable<T>::~HashTable() {
  // this will call the destructor for the linked list in each bucket
  delete[] table;
}


template <typename T>
HashTable<T>& HashTable<T>::operator=(const HashTable<T>& rhs) {
  // it could be table == NULL (if calling this from the copy constructor)
  // so best to double-check before we delete the old table
  if (table != NULL) {
    delete[] table;
  }

  tableSize = rhs.tableSize;
  numItems = rhs.numItems;

  table = new LinkedList<T>[tableSize];

  for (int i = 0; i < tableSize; i++) {
    // uses the = operator for the linked lists, so we truly get
    // a copy of each list in the rhs
    table[i] = rhs.table[i];
  }

  return *this;

  /*
   * assignment operator usually should return the reference of the current
   * instance, not the ptr (not copy because the copy of the current instance
   * will be deleted once out of scope of operator= method)
   */

}



template <typename T>
bool HashTable<T>::contains(const T& item) const {
  unsigned int bucket = getBucket(item);

  return table[bucket].find(item) != NULL;
}


template <typename T>
bool HashTable<T>::insert(const T& item) {
  // if the item is here, return false
  if (contains(item)) {
    return false;
  }
  else {
    // otherwise, insert it into the front of the list
    // in this bucket and return true
    unsigned int bucket = getBucket(item);
    table[bucket].insertFront(item);
    ++numItems;
    return true;
  }
}


template <typename T>
void HashTable<T>::remove(const T& item) {
  unsigned int bucket = getBucket(item);

  ListNode<T>* link = table[bucket].find(item);

  // make sure the item was in the list
  assert(link != NULL);

  table[bucket].removeNode(link);

  --numItems;
}


template <typename T>
void HashTable<T>::update(const T& item) {

    unsigned int bucket = getBucket(item);

    if (contains(item)) {
        remove(item);
    }

    insert(item);
}


template <typename T>
void HashTable<T>::clear() {
    /*
     * Clear the entire hash table
     */

    for(unsigned int i = 0; i < tableSize; ++i)
        table[i].clear();

    numItems = 0;

}


template <typename T>
unsigned int HashTable<T>::getMaxLoad() {
    /*
     * Return the maximum size of the linked lists.
     */

    unsigned int max_item = 0;

    for (unsigned int i = 0; i < tableSize; ++i)
        max_item = table[i].item > max_item ? table[i].item : max_item;

    return max_item;
}


template <typename T>
unsigned int HashTable<T>::size() const {
  return numItems;
}


template <typename T>
DynamicArray<T> HashTable<T>::getItemsArray() const {
  DynamicArray<T> array;

  // go through each bucket
  for (int i = 0; i < tableSize; i++) {
    // and crawl along the list in the bucket to add the items to the array
    ListNode<T>* node = table[i].getFirst();
    while (node != NULL) {
      array.pushBack(node->item);
      node = node->next;
    }
  }

  // returns a copy of the array because it is a local variable
  return array;
}


template <typename T>
unsigned int HashTable<T>::getBucket(const T& item) const {
  return item.hash() % tableSize;
}



#endif
