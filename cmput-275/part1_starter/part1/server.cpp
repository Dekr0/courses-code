/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Assignment - Trivial Navigation System - Part I
 */
#include <iostream>
#include <list>
#include "dijkstra.h"
#include "handle.h"

using namespace std;


int main() {
    WDigraph network_graph;  // Weighted Directed graph describe the road network
    
    // Map that stores the vertices id and their coordinates
    unordered_map<int, Point> points;
    
    // Read the edmonton route network and construct weighted directed graph
    // that describes the network
    readGraph(FILENAME, network_graph, points);
    
    // A map that stores all reachable points from a given point
    unordered_map<int, PIL> search_tree;
    
    // a linked list that describes the path between two points via way points
    list<int> path;
    
    // Initialized the id and coordinates for starting point and end point
    Point start_point = {0, 0};
    Point end_point = {0, 0};
    int spoint_id = -1;
    int epoint_id = -1;
    
    // query sending from the client
    bool show_wpoints = false;
    string request;
    while (getline(cin, request)) {
        // the type of process the client request
        string type = split(request, ' ');
        
        if (type == REQUEST) {
            // Reset the id and coordinate each time the client sends a new set
            // of points

            show_wpoints = false;
            spoint_id = -1, epoint_id = -1;
            
            // Obtain the coordinates from the request
            try {
                start_point = {stoll(split(request, ' ')), stoll(split(request,
                               ' '))};
                end_point = {stoll(split(request, ' ')), stoll(split(request,
                             ' '))};

                // Find the closest points, which are in the weighted directed graph instance
                // to the starting point and end point respectively
                spoint_id = setPoint(start_point, points);
                epoint_id = setPoint(end_point, points);

                // Call dijkstra algorithm to find the shortest path between two
                // points
                dijkstra(network_graph, spoint_id, search_tree);

                // Obtain number of way points in the path from starting point to end
                // point
                int num_wpoints = findPath(spoint_id, epoint_id, path, search_tree);

                cout << "N " << num_wpoints << endl;

                if (num_wpoints) show_wpoints = true;
            } catch (const invalid_argument & e) {
                // Invalid input from the client
            }

        } else if (type == BUFFER && show_wpoints) {
            if (!path.empty()) {
                Point way_point = points[path.front()];
                cout << "W " << way_point.lat << " " << way_point.lon << endl;

                path.pop_front();
            } else {
                show_wpoints = false;
                cout << "E" << endl;
            }
        }
    }
    
    return 0;
}

