#include "preprocess.h"

// Function Implementation

int extractPathLength(string & N) {
    /**
     * Description:
     *      Extract the number of waypoints in a shortest path
     *      from the response sent by the server
     *
     * Parameters:
     *      N (string &): response message that contains the number of
     *      waypoints in a shortest path
     *
     * Return:
     *      path_length (int): the number of waypoints
     */

    split(N, ' ');
    int path_length = stoi(N);

    return path_length;
}

string coordToStr(string & response) {
    /*
     * Description:
     *      Convert and formatted the string from the server, which
     *      contains a waypoint, into the format that can be recognized by the
     *      plotter
     *
     * Parameters:
     *      response (string &): response from the server, which contain a
     *      waypoint
     *
     * Return:
     *      coord (string): coordinate of a waypoint (in the format that can be
     *      recognized by the plotter)
     */

    long long lat = stoll(split(response, ' '));
    long long lon = stoll(split(response, ' '));

    string coord = to_string(static_cast<double>(lat) / 100000.0);
    coord.append(" ");
    coord.append(to_string(static_cast<double>(lon) / 100000.0));
    coord.append("\n");

    return coord;
}

string formatRequest(string & start, string & end) {
    /**
     * Description:
     *      Generate a route request for the server
     *
     * Parameters:
     *      start (string &): coordinates of the start point
     *
     *      end (string &): coordinates of the end point
     *
     * Return:
     *      request (string): route request message
     */

    string f_start = strToCoord(start);
    string f_end = strToCoord(end);

    string request = "R";
    request.append(" ");
    request.append(f_start);
    request.append(" ");
    request.append(f_end);

    return request;
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

string strToCoord(string & s_coord) {
    /**
     * Description:
     *      Convert and format the coordinates of a point such that it can be
     *      recognized and used by the server for route finding
     *
     * Parameters:
     *     s_coord (string &): a string that contains the coordinates of a point
     *
     * Return:
     *      coord (string): a string that contains the coordinates of a point in
     *      a format that can be recognized by the server
     */

    long long lat = static_cast<long long>(stod(split(s_coord, ' '))
                                           * SCALE);
    long long lon = static_cast<long long>(stod(split(s_coord, ' '))
                                           * SCALE);

    string coord = to_string(lat);
    coord.append(" ");
    coord.append(to_string(lon));

    return coord;
}

