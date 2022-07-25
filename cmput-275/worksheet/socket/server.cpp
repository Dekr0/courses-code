#include <arpa/inet.h>
#include <cstring>
#include <iostream>
#include <netdb.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#define PORT 8888
#define BUFFER 1024

using namespace std;

int main() {

    int listen_socket = socket(AF_INET, SOCK_STREAM, 0);

    if (listen_socket == -1) {
        cerr << "Failed to create listening socket" << endl;
        return 1;
    }
    cout << "Listening socket was created..." << endl;

    sockaddr_in host_addr = {}, client_addr = {};

    memset(&host_addr, '\0', sizeof(host_addr));
    memset(&client_addr, '\0', sizeof(client_addr));

    host_addr.sin_family = AF_INET;
    host_addr.sin_port = htons(PORT);
    host_addr.sin_addr.s_addr = htonl(INADDR_ANY);

    if (bind(listen_socket, (sockaddr *) &host_addr, sizeof(host_addr)) == -1) {
        cerr << "Failed to bind the socket's FD" << endl;
        close(listen_socket);
        return 1;
    }
    cout << "Listening socket was bind..." << endl;

    if (listen(listen_socket, 1) == -1) {
        cout << "Failed to set the socket to listen for an incoming connection"
            << endl;
        close(listen_socket);
        return 1;
    }
    cout << "Socket starts listening..." << endl;
    cout << "Waiting for upcoming connection..." << endl;

    int connection_socket = -1;
    socklen_t client_addr_len = sizeof(client_addr);

    connection_socket = accept(listen_socket, (sockaddr *) &client_addr,
            &client_addr_len);

    if (connection_socket != -1) {
        cout << "Connection request accepted from " <<
            inet_ntoa(client_addr.sin_addr) << ":" << ntohs(client_addr.sin_port)
             << endl;

        while (true) {
            char buffer[BUFFER];
            memset(buffer, 0, sizeof(buffer));

            recv(connection_socket, &buffer, BUFFER + 1, 0);

            if (buffer[0] == 0) {
                cout << "Connection will be closed" << endl;
                break;
            }

            cout << "Request received" << endl;
            cout << "Request content: " << buffer << endl;
        }
    } else {
        cout << "Failed to establish connection with upcoming client" << endl;
    }

    close(listen_socket);
    close(connection_socket);


    return 0;
}
