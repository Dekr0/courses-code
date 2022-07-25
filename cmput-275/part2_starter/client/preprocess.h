#ifndef PREPROCESS_H
#define PREPROCESS_H

/*
 * preprocess.h contain the definition of the functions that are used for
 * preprocess and formatting before send / write to server / plotter
 */

#include <string>
#define SCALE 100000

using namespace std;


// Function prototype

// Extract the number of waypoints in a shortest path
// from the response sent by the server
int extractPathLength(string & response);

// Convert and formatted the string from the server, which
// contains a waypoint, into the format that can be recognized by the
// plotter
string coordToStr(string & response);

// Generate a route request for the server
string formatRequest(string & start, string & end);

// Split a string into two parts based on a given character, return the string
// that is before the given symbol, and truncate this part of string from the
// original string
string split(string & line, char symbol);

// Convert and format the coordinates of a point such that it can be
// recognized and used by the server for route finding
string strToCoord(string & s_coord);

#endif
