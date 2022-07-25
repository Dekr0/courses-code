#include "heap.h"

using namespace std;

template <class T, class K>
HeapItem<T, K> BinaryHeap<T, K>::min() const{
    HeapItem<T, K> min = heap.front();
    return min;
}


template <class T, class K>
void BinaryHeap<T, K>::insert(const T& item, const K& key) {
    HeapItem<T, K> element = {item, key};
    heap.push_back(element);
    fixHeapUp(heap.size() - 1);
}


template <class T, class K>
void BinaryHeap<T, K>::popMin() {
    iter_swap(heap.begin(), heap.end() - 1);
    heap.pop_back();
    fixHeapDown(0);
}


template <class T, class K>
int BinaryHeap<T, K>::size() const {
    return heap.size();
}


template <class T, class K>
void BinaryHeap<T, K>::fixHeapUp(int i) {
    while (i != 0 && heap[i].key < heap[(i - 1) / 2].key) {
        swap(heap[i], heap[(i - 1) / 2]);
        i = i - 1 / 2;
    }
}


template <class T, class K>
void BinaryHeap<T, K>::fixHeapDown(int i) {

}
