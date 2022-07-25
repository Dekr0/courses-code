#include "resource_manager.h"


ResourceFrame::ResourceFrame(string resourceName, int numUnits) {
    this->resourceName = resourceName;
    this->numUnits = numUnits;
}


int ResourceManager::addResource(string pairs) {
    if (numTypes >= NRES_TYPES)
        return 1;

    int index = pairs.find(":");
    string resourceName = pairs.substr(0, index);
    string strNumUnits = pairs.substr(index + 1);

    int numUnits = stoi(strNumUnits);

    ResourceFrame &frame = ResourceFrame(resourceName, numUnits);

    numTypes++;

    return 0;
}