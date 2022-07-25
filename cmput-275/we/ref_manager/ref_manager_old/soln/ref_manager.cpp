#include "ref_manager.h"
#include <cassert>

ReferenceManager::ReferenceManager() {
  numToDelete = 0;
  for (int i = 0; i < MAX_PTRS; i++) {
    pointers[i] = NULL;
  }
}

ReferenceManager::~ReferenceManager() {
	
	for (int i = 0; i < MAX_PTRS; i++) {
		reassignPointer(i, NULL);
	}

	garbageCollect();
}

void ReferenceManager::garbageCollect() {

	for (int i = 0; i < numToDelete; i++) {
		cout << garbage[i] << endl;
		delete[] garbage[i];
		garbage[i] =  NULL;
	}

	numToDelete = 0;
}

void ReferenceManager::reassignPointer(unsigned int ptrIndex, const char* newAddr) {
	
	if ( getPtr(ptrIndex) != newAddr ) {
		// prevent assign same string / address to the same pointer

		if ( getPtr(ptrIndex) != NULL ) {
			// if this pointer already points to a string, check whether			
			// reassigning the pointer will reduce the references count of
			// the string pointed by this pointer previsouly to 0;
			// skip this process if this pointer is NULL
		
			const char * oldAddr = getPtr(ptrIndex);
			if ( refCount[oldAddr] == 1 ) {
				// if the references count of the oldAddr is 1, assign a
				// garbage pointer to this string
			
				garbage[numToDelete] = oldAddr;
				refCount[oldAddr] = 0;
				++numToDelete;
			} else {
				refCount[oldAddr] -= 1;
			}
		
			oldAddr = NULL;
		}

		pointers[ptrIndex] = newAddr;

		if (newAddr != NULL) {
			// prevent NULL address / string being written into refCount

			if (refCount.find(newAddr) != refCount.end()) {
				refCount[newAddr] += 1;
			} else {
				refCount[newAddr] = 1;
			}
		}
	}
}

void ReferenceManager::readString(unsigned int ptrIndex, unsigned int length) {
	
	if (ptrIndex < MAX_PTRS) {
		char * str = new char[length + 1];
		cin >> str;
	
		reassignPointer(ptrIndex, str);
	}

}

const char* ReferenceManager::getPtr(unsigned int ptrIndex) {
  assert(ptrIndex < MAX_PTRS);
  return pointers[ptrIndex];
}
