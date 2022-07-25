#include <queue>
#include "dijkstra.h"

// Function Implementation
void dijkstra(const WDigraph & graph, int startVertex, unordered_map<int, PIL> &
    tree) {
    /**
     * Description:
     *      Compute least cost paths that start from a give vertex
     *      Use a binary heap to efficiently retrieve an explored vertex that
     *      has the minimum distance from the start vertex at every iteration
     *
     * Parameters:
     *      graph(const WDigraph &): an instance of the weighted directed
     *      graph (WDigraph) class
     *
     *      startVertex (int): a vertex in this graph which serves as the root of
     *      the search tree
     *
     *      tree (unordered_map<int, PIL> &): a search tree used to construct the
     *      least cost path to some vertex
     */
    
    // Heap for obtain the next closest way point to the current way point
    priority_queue<PIPIL, vector<PIPIL>, Compare> inq_points;
    
    // Initially start with the starting point
    inq_points.push(PIPIL(startVertex, PIL(-1, 0)));
    while (!inq_points.empty()) {
        // the next closest way point to the current way point
        PIPIL m_point = inq_points.top();
        inq_points.pop();
        
        // id of the current way point and parent way point
        int id = m_point.first, parent = m_point.second.first;
        
        // distance between the current way point and parent way point
        long long distance = m_point.second.second;
        
        if (tree.find(id) != tree.end())
            continue;
        
        tree[id] = PIL(parent, distance);
        
        // push the neighbour way points of the current way point into the heap
        for (auto iter = graph.neighbours(id); iter != graph.endIterator(id);
        ++iter) {
            int nbr = *iter;
            long long t_distance = distance + graph.getCost(id, nbr);
            
            inq_points.push(PIPIL(nbr, PIL(id, t_distance)));
        }
    }
}