/*
 * Name: Chengxuan Li
 * ID: 1631060
 * CMPUT 275, Winter 2021
 *
 * Assignment - Trivial Navigation System - Part II
 */
#include <arpa/inet.h>
#include <cstring>
#include <fcntl.h>
#include <iostream>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <unistd.h>
#include "preprocess.h"
#define COORD_SIZE 44
#define PACKET_SIZE 37

using namespace std;


int create_and_open_fifo(const char * pname, int mode) {
    // creating a fifo special file in the current working directory
    // with read-write permissions for communication with the plotter
    // both processes must open the fifo before they can perform
    // read and write operations on it
    if (mkfifo(pname, 0666) == -1) {
        cout << "Unable to make a fifo. Ensure that this pipe does not exist already!" << endl;
        exit(-1);
    }

    // opening the fifo for read-only or write-only access
    // a file descriptor that refers to the open file description is
    // returned
    int fd = open(pname, mode);

    if (fd == -1) {
        cout << "Error: failed on opening named pipe." << endl;
        exit(-1);
    }

    return fd;
}

int main(int argc, char const *argv[]) {

    const char *inpipe = "inpipe";
    const char *outpipe = "outpipe";

    int in = create_and_open_fifo(inpipe, O_RDONLY);
    cout << "inpipe opened..." << endl;
    int out = create_and_open_fifo(outpipe, O_WRONLY);
    cout << "outpipe opened..." << endl;

    // Check for valid arguments
    if (argc != 3) {
        cout << "Invalid arguments" << endl;
        return 0;
    }

    int port = -1, conn_socket = -1;

    // Assign port number and IP address
    port = atoi(argv[1]);
    const char * ip_addr = argv[2];

    // Create a connection socket
    conn_socket = socket(AF_INET, SOCK_STREAM, 0);
    if (conn_socket == -1) {
        cerr << "Error: failed to create socket" << endl;

        return 1;
    }

    // Initialize socket parameter struct
    sockaddr_in server_addr = {};
    memset(&server_addr, 0, sizeof(server_addr));

    // Set the socket parameter
    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(port);
    inet_aton(ip_addr, &(server_addr.sin_addr));

    // Connect to server
    if (connect(conn_socket, (sockaddr *)&server_addr, sizeof(server_addr)) ==
    -1) {
        cerr << "Error: failed to connect to " << inet_ntoa(server_addr.sin_addr)
        << ":" << ntohs(server_addr.sin_port) << endl;

        return 1;
    }
    cout << "Connection request accepted from " << inet_ntoa(server_addr.sin_addr
    ) << ":" << ntohs(server_addr.sin_port) << endl;

    // Initialize buffer for read and write, receive and send
    char buffer[COORD_SIZE] = {0};
    char packet[PACKET_SIZE] = {0};
    const char end[2] = {'E', '\n'};  // Signal for no more waypoints
    const char ack[1] = {'A'};

    bool reset = false;
    string resend;

    while (true) {

        // Tracking number of bytes being read (recv) / write (send)
        int bytes_read = 0, bytes_write = 0, bytes_recv = 0 ,bytes_send = 0;

        // Reset buffer
        memset(buffer, 0, sizeof(buffer));
        memset(packet, 0, sizeof(packet));

        if (!reset) {
            // Read the coordinate of start point and end point
            bytes_read = read(in, buffer, sizeof(buffer));
            if (strcmp(buffer, "Q\n") == 0) {
                // Plotter was closed
                bytes_send = send(conn_socket, buffer, bytes_read, 0);
                break;
            }
        }

        // Pre-processing, obtain the coordinates of start point and end point
        // resepectively
        string coord = string(buffer);
        string start_point = split(coord, '\n');
        string end_point = coord;
        end_point.pop_back();

        // Reset buffer
        memset(buffer, 0, sizeof(buffer));

        // Generate the string for route request
        string request = !reset ? formatRequest(start_point, end_point) : resend;
        if (reset) reset = false;

        // Send the route request to the server
        strcpy(packet, request.c_str());
        bytes_send = send(conn_socket, packet, strlen(packet), 0);
        memset(packet, 0, sizeof(packet));  // Reset buffer

        // Receive the number of waypoint from the server
        bytes_recv = recv(conn_socket, packet, sizeof(packet), 0);

        if (packet[0] == 'N') {
            string N = string(packet);

            // Reset buffer
            memset(packet, 0, sizeof(packet));

            // Extract the path length from server's response
            int path_length = extractPathLength(N);

            // Skip current request if there's no waypoint or only one waypoint
            if (path_length == 0) {
                bytes_write = write(out, end, sizeof(end));
                continue;
            }

            // Acknowledgement
            bytes_send = send(conn_socket, ack, sizeof(ack), 0);
            if (path_length == 1) {
                bytes_write = write(out, end, sizeof(end));
                continue;
            }

            // Receive each waypoint and write the plotter
            for (int i = 0; i < path_length; ++i) {
                // Receive a waypoint
                bytes_recv = recv(conn_socket, packet, sizeof(packet), 0);
                // Acknowledgement
                bytes_send = send(conn_socket, ack, sizeof(ack), 0);

                if (packet[0] == 'W') {
                    // Pre-processing and formatting such that the coordinates
                    // readable by the plotter
                    string response = string(packet);
                    split(response, ' ');

                    string way_point = coordToStr(response);
                    strcpy(buffer, way_point.c_str());

                    bytes_write = write(out, buffer, strlen(buffer));
                } else {
                    // Unexpected message from the socket, resend the route request
                    reset = true;
                    resend = request;

                    break;
                }

                // Reset buffer
                memset(buffer, 0, sizeof(buffer));
                memset(packet, 0, sizeof(packet));
            }
        } else {
            // Unexpected message from the socket, resend the route request
            reset = true;
            resend = request;
        }

        bytes_write = write(out, end, sizeof(end));
    }

    close(conn_socket);
    close(in);
    close(out);
    unlink(inpipe);
    unlink(outpipe);

    return 0;
}
