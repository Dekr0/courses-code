/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Interview Question: Makefile Length
 *
 */
#include <algorithm>
#include <iostream>
#include <string>
#include <unordered_map>
#include <unordered_set>

using namespace std;


int longestSequence(const string& target, unordered_map<string, unordered_set<string>>
    & targets, unordered_map<string, int> & memo);


int main() {
    
    int num_target = 0;
    cin >> num_target;
    
    // Hash table for targets and its dependencies
    unordered_map<string, unordered_set<string>> targets;
    
    // Read in all the target and its dependencies
    for (int i = 0; i < num_target; ++i) {
        int num_dep = 0;
        string target_name;
        
        cin >> num_dep >> target_name;
        
        target_name.pop_back();  // Remove the ":" after the target name
    
        for (int j = 0; j < num_dep; ++j) {
            string dep;
        
            cin >> dep;
            
            // A hash table (set) that stores the dependencies of a target
            targets[target_name].insert(dep);
        }
    }
    
    // a hash table that store the solution for sub-problem
    // (the longest sequence of a target)
    unordered_map<string, int> memo;
    
    int longest = 0;  // Longest sequence of dependencies
    
    // Iterate all the given target from the input and find longest sequence of
    // dependencies from the dependencies in all the targets. This most outer
    // layer of the recursion.
    for (auto target = targets.begin(); target != targets.end(); ++target) {
        int seq = longestSequence(target->first, targets, memo);
        longest = max(longest, seq);
    }
    
    cout << longest << endl;
    
    return 0;
}

int longestSequence(const string& target, unordered_map<string, unordered_set<string>>
    & targets, unordered_map<string, int> & memo) {
    /**
     * Description:
     *      Find the dependency, that has the longest sequence of dependencies
     *      , among all the dependencies of a given target (recursively).
     *
     *      Formal equation for describing the sub-problem:
     *      L_max(t) - the dependency with longest sequence in a given target
     *
     *      L_max(t) = if the target is a file given by users, 0
     *                 otherwise, max(L_max(D_i) + 1)
     *
     *      D_i - a dependency in a given target
     *
     *      L_max(D_i) - find the the longest sequence of dependencies in
     *      dependency D_i but it consider as a target this time. Then,
     *      after find all the longest sequence for each dependency in a given
     *      a target, choose the dependence with longest sequence
     *
     * Parameters:
     *      target (string): name of the target or dependency
     *
     *      targets (unordered_map<string, unordered_set<string>> &): a hash
     *      table that store the target and its dependencies
     *
     *      memo (unordered_map<string, int> &): a hash table that store the
     *      solution for sub-problem (the longest sequence of a target or
     *      a dependency)
     *
     * Return:
     *      longest (int): the longest sequence of dependencies in a given target
     */
    
    int longest = 0;
    
    if (memo.find(target) == memo.end()) {
        if (targets.find(target) == targets.end())
            memo[target] = 0;
        else {
            // Find the longest sequence of dependencies for each dependency in a given target
            for (auto dep = targets[target].begin(); dep != targets[target].end(); ++dep) {
                int seq = longestSequence(*dep, targets, memo) + 1;
                longest = max(longest,seq);
            }
            memo[target] = longest;
        }
    }
    
    return memo[target];
}

