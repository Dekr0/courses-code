/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Weekly Exercise #6: Graph Concepts
 *
 */

#include <iostream>
#include <string>
#include <unordered_set>
#include "digraph.h"
#define VERTEX "V"
#define EDGE "E"
#define SPLIT ','

using namespace std;

int count_components(Digraph & graph);
Digraph read_city_graph_undirected();
void depth_first_search(const Digraph & graph, int id, unordered_set<int> &
    visited_id);

int main() {

    Digraph city_graph = read_city_graph_undirected();
    int count = count_components(city_graph);

    cout << count << endl;

    return 0;
}

int count_components(Digraph & graph) {
    /*
     * Description:
     *      Count the number of components in the Edmonton road network
     *
     * Parameters:
     *      (Digraph &) graph: reference to an Digraph instance that describe
     *      the Edmonton road network
     *
     * Returns:
     *      (int) number_components: number of components in the Edmonton road
     *      network
     */

    int number_components = 0;

    unordered_set<int> visited_id;
    // marked the coordinate id already visited. If a coordinate id is already
    // visited, that means is belongs to one of the connected component.

    for (auto & id : graph.vertices()) {
        /*
         * Loop through all the coordinate on the map and using depth first
         * search to find all the connect component of each coordinate. If
         * a depth first search is finished, that means an connected component
         * is found. Also, the visited coordinated will be marked off since
         * it already in one of the connected component.
         */

        if (visited_id.find(id) == visited_id.end()) {
            depth_first_search(graph, id, visited_id);
            ++number_components;
        }
    }

    return number_components;
}

Digraph read_city_graph_undirected() {
    /*
     * Description:
     *      generate an undirected graph that describe the Edmonton road network
     *
     * Returns:
     *      (Digraph) graph: an undirected graph that describe the Edmonton
     *      road network
     */

    Digraph graph;

    string raw;  // unprocessed input string line
    while (getline(cin, raw)) {
        // determine whether the line is about a vertex or edge
        string type = raw.substr(0, raw.find(SPLIT));

        if (type == VERTEX) {
            // obtain the id of the coordinate
            int id = stoi(raw.substr(raw.find(SPLIT) + 1, raw.find(SPLIT,
                raw.find(SPLIT) + 1) - 2));

            graph.addVertex(id);

        } else if (type == EDGE) {
            // determine the position of the comma in order to separate the
            // coordinate ids of the edge

            // first comma position after the first letter that determines
            // the line is about vertex or edge
            int start_pos = raw.find(SPLIT) + 1;

            // second comma position after the start id of the edge
            int mid_pos = raw.find(SPLIT, start_pos) + 1;

            // third comma position after the end id of the edge
            int end_pos = raw.find(SPLIT, mid_pos);

            int start = stoi(raw.substr(start_pos, mid_pos - start_pos - 1));
            int end = stoi(raw.substr(mid_pos, end_pos - mid_pos));

            graph.addEdge(start, end);
            graph.addEdge(end, start);
        }
    }

    return graph;
}

void depth_first_search(const Digraph & graph, int id, unordered_set<int> &
    visited_id) {
    /*
     * Description:
     *      Navigate a graph using depth first search. Instead of recovering
     *      the path, only determine an connected component starting from an
     *      given vertex, which include all the vertex that reachable from
     *      this given vertex.
     *
     * Parameters:
     *      (const Digraph &) graph: reference to an Digraph instance that describe
     *      the Edmonton road network
     *
     *      (int) id: id of an vertex / coordinate
     *
     *      (unordered_set<int> &) visited_id: an unordered set to keep tracked
     *      off the vertex that is already visited
     */

    if (visited_id.find(id) != visited_id.end()) {
        // return if an vertex reached before
        return;
    }

    visited_id.insert(id);  // mark off the visited vertex

    for (auto neighbour = graph.neighbours(id);
    neighbour != graph.endIterator(id); neighbour++) {

        // Visit the neighbour of the current vertex
        depth_first_search(graph, *neighbour, visited_id);
    }
}