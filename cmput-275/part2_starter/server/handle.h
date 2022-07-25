#ifndef _HANDLE_H_
#define _HANDLE_H_

#include <cstring>
#include <list>
#include <netinet/in.h>
#include <string>
#include <unordered_map>
#include <utility>
#include "wdigraph.h"

// Constant Label
#define EDGE "E"
#define VERTEX "V"
#define FILENAME "./edmonton-roads-2.0.1.txt"
#define SCALE 100000


typedef pair<int, long long> PIL;


// Struct Definition
struct Point {
    long long lat; // latitude of the point
    long long lon; // longitude of the point
    
    bool operator==(const Point & rhs) const {
        /**
         * Description:
         *      Overloading the == operator so that a given Point instance
         *      can compared with another Point instance if they have the
         *      same latitude and longitude.
         *
         * Parameters:
         *      rhs (const Point &): a constant reference of a Point instance
         *
         * Return:
         *      (bool) : result of whether the latitude and longitude are
         *      same between two Point instances.
         */
        
        return lat == rhs.lat && lon == rhs.lon;
    }
};


// Function prototype

// construct a path from starting point to the ending point via way points from the
// search tree
int findPath(const int & start, const int & end, list<int> & path,
    unordered_map<int, PIL> & tree);

// Return the closest point id that is already stored in weighted graph instance
// to the given point from the request query
int getClosestPoint(const Point & point,unordered_map<int, Point> & points);

// Return the manhattan distance between two points
long long manhattan(const Point & pt1, const Point & pt2);

// Generate a waypoint message to the client
string coordToStr(const Point & point);

// Generate a message for client, which contains the number of waypoint
// in a shortest path
string formattedPathLength(const int & path_length);

// Split a string into two parts based on a given character, return the string
// that is before the given symbol, and truncate this part of string from the
// original string
string split(string & line, char symbol);

void readGraph(string filename, WDigraph & graph, unordered_map<int, Point> &
points);

// Extract the coordinates of a point in a string format, and store in
// a Point struct instance
void strToCoord(Point & point, string & coord);

#endif