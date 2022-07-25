#include <iostream>
#include "hash_table.h"
#include "monster_record.h"

using namespace std;

template <typename T>
void printHashTable(const HashTable<T>&);

int main() {
    HashTable<MonsterRecord> table(10);
    MonsterRecord monsters[] = {
            {"Kobold", 12, 5, 30, 0.125},
            {"Ice Devil", 18, 180, 40, 14}
    };

    table.insert(monsters[0]);
    table.contains(monsters[0]);
    table.remove(monsters[0]);
    table.insert(monsters[1]);

    printHashTable(table);
}

template <typename T>
void printHashTable(const HashTable<T>& table) {
    DynamicArray<T> array = table.getItemsArray();
    for (unsigned int i = 0; i < array.size(); ++i) {
        cout << array[i] << endl;
    }
}
