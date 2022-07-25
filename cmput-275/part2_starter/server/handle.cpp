#include <cassert>
#include <fstream>
#include "handle.h"

using namespace std;


// Function Implementation
int findPath(const int & start, const int & end, list<int> & path,
    unordered_map<int, PIL> & tree) {
    /**
     * Description:
     *      Construct a path from starting point to the end point via way
     *      points from the search tree
     *
     * Parameters:
     *      start (const int &): id of the starting point
     *
     *      end (const int &): id of the end point
     *
     *      path (list<int>): a list of way points that describe the path from
     *      starting point to end point
     *
     *      tree (unordered_map<int, PIL> &): a map that stores all the way point
     *      and reachable point from the starting point
     *
     * Return:
     *      num_wpoints (int): number of way points in the path
     */

    if (tree.find(end) == tree.end())
        // if the end point is not in the search tree, then there is no path
        // between the starting point and end point
        return 0;
    
    // Constructing the path by recursively crawling backward to the starting
    // point
    int way_point = end;
    while (way_point != start) {
        path.push_front(way_point);  // Insert a way point
        way_point = tree[way_point].first;  // Obtain the parent / next way point
    }
    path.push_front(start);
    
    return path.size();
}

int getClosestPoint(const Point & point, unordered_map<int, Point> & points) {
    /**
     * Description:
     *      Return the closest point id that is already stored in weighted graph
     *      instance to the given point from the request query
     *
     * Parameters:
     *      point (const Point &): a point given from the request query
     *
     *      points (unordered_map<int, Point>): a map that stores the id of all
     *      points and corresponding Point instance (coordinate)
     *
     * Return:
     *      point_id (int): the id of a point that has the smallest manhattan
     *      distance to given point form the request query
     */

    int point_id = points.begin()->first;
    
    // smallest distance between a point in the WDigraph instance and the given
    // point
    long long min_distance = manhattan(point, points.begin()->second);
    
    for (auto & iter : points) {
        long long distance = manhattan(point, iter.second);
        
        if (distance < min_distance) {
            min_distance = distance;
            point_id = iter.first;
        }
    }
    
    return point_id;
}

long long manhattan(const Point & pt1, const Point & pt2) {
    /**
     * Description:
     *      Return the Manhattan distance between the two given points
     *
     * Parameters:
     *      pt1 (const Point &): first point
     *
     *     pt2 (const Point &): second point
     *
     * Return:
     *      distance (long long): the Manhattan distance between the two given
     *      points
     */
    
    long long distance = -1;
    
    distance = abs(pt1.lat - pt2.lat) + abs(pt1.lon - pt2.lon);
    assert(distance >= 0);
    
    return distance;
}

string coordToStr(const Point & point) {
    /**
     * Description:
     *      Generate a waypoint message to the client
     *
     * Parameters:
     *      point (const Point &): the coordinates of a point
     *
     * Return:
     *      coord (string): a waypoint message
     */

    string coord = "W ";
    coord.append(to_string(point.lat));
    coord.append(" ");
    coord.append(to_string(point.lon));
    coord.append("\n");

    return coord;
}

string formattedPathLength(const int & path_length) {
    /**
     * Description:
     *      Generate a message for client, which contains the number of waypoint
     *      in a shortest path
     *
     * Parameters:
     *      path_length (const int &): the length of the shortest path
     *
     * Return:
     *      N (string): a message for client, which contains the number of waypoint
     *      in a shortest path
     */

    string N = "N ";
    N.append(to_string(path_length));

    return N;
}

string split(string & line, char symbol) {
    /**
     *  Description:
     *      Split a string into two parts based on a given character, return the string
     *      that is before the given symbol, and truncate this part from the original
     *      string
     *
     *  Parameters:
     *      line (string &): string is being split and truncated
     *
     *      symbol (char): character that indicates where the string splits
     *
     *  Return:
     *      data (string): the part being truncated off from the original string
     */
     
    string data = line.substr(0, line.find(symbol));
    line = line.substr(line.find(symbol) + 1);
    
    return data;
}

void readGraph(string filename, WDigraph & graph, unordered_map<int, Point> &
points) {
    /**
     * Description:
     *      Read the Edmonton map data from the provided file and load it into
     *      the given WDigraph object.
     *      Store vertex coordinates in Point struct and map each vertex to its
     *      corresponding Point struct.
     *
     * Parameters:
     *      filename (string): name of the file describing a road network
     *
     *      graph (WDigraph &): an instance of the weighted directed graph
     *      (WDigraph) class
     *
     *      points (unordered_map<int, Point> &): a mapping between vertex
     *      identifiers and their coordinates
     */

    ifstream fb(filename);  // open the text file as an input stream
    
    assert(fb.is_open());  // Make sure the file is open
    
    string line;
    while (getline(fb, line)) {
        string type = split(line, ',');
        // determine whether line is about a vertex or an edge

        if (type == VERTEX) {
            try {
                int id = stoi(split(line, ','));
                long long lat = static_cast<long long>(stod(split(line, ','))
                                                       * SCALE);
                long long lon = static_cast<long long>(stod(split(line, ','))
                                                       * SCALE);

                points[id] = Point{lat, lon};
                graph.addVertex(id);
            } catch (const invalid_argument & e) {
                // Invalid input from .txt file
            }
            
        } else if (type == EDGE) {
            try {
                int start = stoi(split(line, ','));  // starting point of the edge
                int end = stoi(split(line, ','));  // end point of the edge
                string name = split(line, ',');  // street name

                long long distance = manhattan(points[start], points[end]);

                graph.addEdge(start, end, distance);
            } catch (const invalid_argument & e) {
                // Invalid input from .txt file
            }
        }
    }
    
    fb.close();
}

void strToCoord(Point & point, string & coord) {
    /**
     * Description:
     *      Extract the coordinates of a point in a string format, and store in
     *      a Point struct instance
     *
     * Parameters:
     *      point (Point &): a reference of a Point struct instance
     *
     *      coord (string &): a string that contains the coordinates of a point
     */

    long long lat = stoll(split(coord, ' '));
    long long lon = stoll(split(coord, ' '));

    point.lat = lat;
    point.lon = lon;
}