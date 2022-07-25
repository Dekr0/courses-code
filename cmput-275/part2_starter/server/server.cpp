/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Assignment - Trivial Navigation System - Part II
 */
#include <arpa/inet.h>
#include <cstring>
#include <iostream>
#include <netinet/in.h>
#include <list>
#include <string>
#include <sys/socket.h>
#include <sys/stat.h>
#include <unistd.h>
#include "dijkstra.h"
#include "handle.h"
#define PACKET_SIZE 38
#define LISTEN_BACKLOG 10

using namespace std;

void setServerSocket(int port, sockaddr_in & server_addr) {
    /**
     * Description:
     *      Configure the socket option based on the given port number and IP
     *      address
     *
     * Parameters:
     *      port (int): port number
     *
     *      server_addr (sockaddr_in &): reference of an sockaddr_in struct
     *      instance
     */

    memset(&server_addr, 0, sizeof(server_addr));

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(port);
    server_addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
}

int main(int argc, char const * argv[]) {

    // Check for valid arguments
    if (argc != 2) {
        cout << "Invalid arguments" << endl;

        return 0;
    }

    // Assign port number
    int conn_socket = -1, port = -1, server_socket = -1;
    port = atoi(argv[1]);

    // Create a server socket
    server_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (server_socket == -1) {
        cout << "Error: failed to create socket" << endl;

        return 1;
    }

    // Initialize socket address setting
    sockaddr_in client_addr = {}, server_addr = {};
    socklen_t addr_len = sizeof(client_addr);
    memset(&client_addr, 0, sizeof(client_addr));

    // Configure the socket options
    setServerSocket(port, server_addr);

    // Binding IP address and port
    if (bind(server_socket, (sockaddr *) &server_addr, sizeof(server_addr)) ==
        -1) {
        cerr << "Error: failed to bind IP address and port" << endl;

        return 1;
    }
    cout << "Server socket was bind to " << inet_ntoa(server_addr.sin_addr) <<
         ":" << ntohs(server_addr.sin_port) << endl;

    // listen for connection requests
    if (listen(server_socket, LISTEN_BACKLOG) == -1) {
        cerr << "Error: failed to set server socket to listen port"
             << ntohs(server_addr.sin_port) << endl;

        return 1;
    }
    cout << "Listening to " << inet_ntoa(server_addr.sin_addr) << ":" <<
         ntohs(server_addr.sin_port) << endl;


    conn_socket = accept(server_socket, (sockaddr *) &client_addr,
                             (socklen_t *) &addr_len);
    if (conn_socket == -1) {
        cerr << "Error: failed to create connection socket" << endl;

        return -1;
    }
    cout << "Connection request accepted from " << inet_ntoa(client_addr.sin_addr)
     << ":" << ntohs(client_addr.sin_port) << endl;


    WDigraph network_graph;  // WDigraph for route network
    unordered_map<int, Point> points; // vertex id and its coordinates

    // Read the edmonton route network into the WDigraph instance
    readGraph(FILENAME, network_graph, points);

    // Initialize buffer for receive and send
    char packet[PACKET_SIZE] = {0};

    while (true) {
        // Track the number of bytes recv or send
        int bytes_recv = 0, bytes_send = 0;

        // Reset buffer
        memset(packet, 0, sizeof(packet));

        // Receive the route message from the client
        bytes_recv = recv(conn_socket, packet, sizeof(packet), 0);
        if (strcmp(packet, "Q\n") == 0) {
            // Plotter was closed
            close(conn_socket);
            break;
        }

        // The route message should start with R and the length should be
        // exactly 37 bytes
        if (packet[0] == 'R' && bytes_recv == 37) {
            string request = string(packet);
            split(request, ' ');

            // Reset buffer
            memset(packet, 0, sizeof(packet));

            Point start_points = {-1, -1}, end_points = {-1, -1};

            // Extract the coordinates from the route message
            strToCoord(start_points, request);
            strToCoord(end_points, request);

            // Obtain closest point to the start point and end point respectively
            int start_id = getClosestPoint(start_points, points);
            int end_id = getClosestPoint(end_points, points);

            // Only one waypoint when the start point and end point are the same
            // or very close to each other
            if (start_id == end_id) {
                string N = formattedPathLength(1);

                // Send the number of waypoint
                strcpy(packet, N.c_str());
                bytes_send = send(conn_socket, packet, strlen(packet), 0);
                memset(packet, 0, sizeof(packet));

                // Wait acknowledgement
                bytes_recv = recv(conn_socket, packet, 1, 0);
                if (strcmp(packet, "A") == 0) continue;
            }

            unordered_map<int, PIL> search_tree;
            list<int> path;

            // Find the shortest path between two points and the path length
            dijkstra(network_graph, start_id, search_tree);
            int path_length = findPath(start_id, end_id, path, search_tree);
            string N = formattedPathLength(path_length);

            // Send the number of waypoints to the client
            strcpy(packet, N.c_str());
            bytes_send = send(conn_socket, packet, strlen(packet), 0);
            memset(packet, 0, sizeof(packet));  // Reset buffer

            if (path_length == 0) continue;

            // Wait for acknowledgement
            bytes_recv = recv(conn_socket, packet, 1, 0);
            if (strcmp(packet, "A") != 0) continue;
            memset(packet, 0, sizeof(packet));  // Reset buffer

            // Send each waypoint in the shortest path to the client
            for (int id : path) {
                Point point = points[id];
                string way_point = coordToStr(point);

                // Send a waypoint to the client
                strcpy(packet, way_point.c_str());
                bytes_send = send(conn_socket, packet, strlen(packet), 0);
                memset(packet, 0, sizeof(packet));  // Reset buffer

                // Wait for acknowledgement
                bytes_recv = recv(conn_socket, packet, 1, 0);
                if (strcmp(packet, "A") != 0) break;
                memset(packet, 0, sizeof(packet));
            }

            // Clear the search tree and all the waypoint
            search_tree.clear();
            path.clear();
        }
    }

    close(conn_socket);
    close(server_socket);

    return 0;
}
