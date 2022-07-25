#ifndef RESOURCE_MANAGER_H
#define RESOURCE_MANAGER_H


#include <iostream>
#include <mutex>
#include <string>
#include <unordered_map>

#define NRES_TYPES 10

using namespace std;


class ResourceFrame {

public:
    ResourceFrame(string, int);

private:
    string resourceName;
    int numUnits;
    mutex lock;

};


class ResourceManager {

public:
    ResourceManager();

    int addResource(string);

private:
    int numTypes;

    unordered_map<string, ResourceFrame> resources;

};


#endif
