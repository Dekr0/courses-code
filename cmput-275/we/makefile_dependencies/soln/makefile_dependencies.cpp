/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Interview Question: Makefile Dependencies
 *
 */

#include <iostream>
#include <string>
#include <unordered_map>
#include <unordered_set>
#include <queue>

using namespace std;

void built_targets(unordered_map<string, queue<string>> & target_deps,
    unordered_set<string> & built, const string& target);

int main() {

    int num_target = 0, num_cmd = 0;
    cin >> num_target >> num_cmd;

    // an unordered map to store the all the target
    // and its dependencies
    unordered_map<string, queue<string>> target_deps;

    for (int i = 0; i < num_target; i++) {
        int num_dep = 0;
        string target_name;
        cin >> num_dep >> target_name;

        // Remove the colon after the target name
        target_name.pop_back();

        for (int j = 0; j < num_dep; j++) {
           string dep;
           cin >> dep;


            // Since the build order of the dependency is start from the first
            // one. Also, the name of first dependency is insert it first. Then,
            // it is first in first out from the property of queue.
           target_deps[target_name].push(dep);
        }
    }

    // Keep track of the target that already built
    unordered_set<string> built;

    for (int i = 0; i < num_cmd; i++) {
        string make, target;
        cin >> make >> target;

        if (built.find(target) != built.end()) {
            cout << "make: `" << target << "' is up to date." << endl;
        } else {
            built_targets(target_deps, built, target);
            built.insert(target);  // put the built target into the built set

            cout << target << endl;
        }
    }
}

void built_targets(unordered_map<string, queue<string>> & target_deps,
    unordered_set<string> & built, const string& target) {
    /*
     * Description:
     *      Recursively build all the dependency of a given target
     *
     * Parameters:
     *      (unordered_map<string, queue<string>> &) target_deps: an unordered
     *      map the store all the target and its dependency
     *
     *      (unordered_set<string> &) built: an unordered set that store the
     *      built target.
     *
     *      (const string &) target: target of the name
     */

    if (target_deps.find(target) == target_deps.end()) {
        // if a target name is not in the map, that's mean it is a file that
        // provided by the developer / user
        return;
    }

    while(!target_deps[target].empty()) {

        // build the first dependency in the target
        string dep = target_deps[target].front();
        target_deps[target].pop();

        if (built.find(dep) == built.end()) {
            built_targets(target_deps, built, dep);
            built.insert(dep);

            if (target_deps.find(dep) != target_deps.end()) {
                // dependency is already built
                cout << dep << " ";
            }
        }
    }

}