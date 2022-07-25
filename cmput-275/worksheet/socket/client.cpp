#include <arpa/inet.h>
#include <cstring>
#include <iostream>
#include <netdb.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <unistd.h>
#define BUFFER 1024
#define PORT 8888

using namespace std;

int main() {

    const char * IP = "127.0.0.1";

    int connection_socket = socket(AF_INET, SOCK_STREAM, 0);

    if (connection_socket == -1) {
        cerr << "Failed to connection socket" << endl;
        close(connection_socket);
        return 1;
    }
    cout << "Connection socket was created..." << endl;

    sockaddr_in client_addr = {}, host_addr = {};

    memset(&client_addr, '\0', sizeof(client_addr));
    memset(&host_addr, '\0', sizeof(host_addr));

    host_addr.sin_family = AF_INET;
    host_addr.sin_port = htons(PORT);
    inet_aton(IP, &host_addr.sin_addr);

    if (connect(connection_socket, (sockaddr *) &host_addr,
            (socklen_t) sizeof(host_addr)) == -1) {
        cerr << "Failed to establish connection with the server" << endl;
        close(connection_socket);
        return 1;
    }
    cout << "Connection request accepted from " << inet_ntoa(host_addr.sin_addr)
    << ":" << ntohs(host_addr.sin_port) << endl;

    string line;
    cout << "Enter text to encrypt: ";
    while (getline(cin, line)) {
        if (line.length() == 0) break;

        char packet[BUFFER];
        memset(packet, '\0', sizeof(packet));

        strcpy(packet, line.c_str());
        int send_size = send(connection_socket, packet, sizeof(packet), 0);

        if (send_size == -1) {
            cerr << "Failed to send packet to server\nPlease retry" << endl;
            continue;
        }

        memset(packet, 0, sizeof(packet));

        int recv_size = recv(connection_socket, packet, BUFFER, 0);
        cout << "Encrypted text: " << packet << endl;
        cout << "Enter text to encrypt: ";
    }

    char eof[1] = {0};
    send(connection_socket, eof, sizeof(eof), 0);

    close(connection_socket);

    return 0;
}