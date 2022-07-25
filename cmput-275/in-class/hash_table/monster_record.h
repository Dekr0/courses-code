//
// Created by Dekr0 on 2021/3/5.
//


#include <string>
#include <functional>
#include <ostream>

using namespace std;

#ifndef HASH_TABLE_MONSTER_RECORD_H
#define HASH_TABLE_MONSTER_RECORD_H

struct MonsterRecord {
    public:
        string name;
        unsigned int AC;
        unsigned int HP;
        unsigned int speed;
        float CR;

        unsigned int hash() const;
        bool operator!=(const MonsterRecord& rhs) const;
        friend ostream& operator<<(ostream& out, const MonsterRecord& rhs);
};

unsigned int MonsterRecord::hash() const {
    std::hash<string> string_hash;

    return string_hash(name);
}

bool MonsterRecord::operator!=(const MonsterRecord &rhs) const {
    return name != rhs.name;
}

ostream& operator<<(ostream& out, const MonsterRecord& rhs) {
    return out << "name: " << rhs.name << "\nHP: " << rhs.HP << "\nspeed: " <<
    rhs.speed << "\nCR: " << rhs.CR << endl;
}

#endif //HASH_TABLE_MONSTER_RECORD_H
