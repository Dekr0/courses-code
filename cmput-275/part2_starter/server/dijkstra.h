#ifndef _DIJKSTRA_H_
#define _DIJKSTRA_H_

#include "wdigraph.h"
#include <utility>
#include <unordered_map>

using namespace std;

// for brevity
// typedef introduces a synonym (alias)
// for the type specified
typedef pair<int, long long> PIL;

// again, for brevity
// used to store a vertex v and its predecessor pair (u,d) on the search
// where u is the node prior to v on a path to v of cost d
// eg. PIPIL x;
// x.first is "v", x.second.first is "u" and x.second.second is "d" from this
typedef pair<int, PIL> PIPIL;

// NOTE: you are not required to use PIPIL in your solution if you would prefer
// to implement Dijkstra's algorithm differently, this is here simply because
// it was used in the lecture for the slower version of Dijkstra's algorithm.


// Functional Class for comparing the manhattan distance of two edges
// Min heap only
class Compare {
public:
    bool operator()(const PIPIL & lhs, const PIPIL & rhs) {
        /**
         * Description:
         *      functor for comparing the distance / cost of two edges
         *      for constructing min heap only
         *
         * Parameters:
         *      lhs (const PIPIL &): first edge
         *
         *      rhs (const PIPIL &): second edge
         *
         * Return:
         *      (bool) return true if the weight of first edge larger than
         *      the second one
         */
        return lhs.second.second > rhs.second.second;
    }
};


void dijkstra(const WDigraph& graph, int startVertex,
              unordered_map<int, PIL>& tree);


#endif
