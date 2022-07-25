#include <iostream>			// std::cin, std::cout, std::cerr
#include <sys/types.h>		// include for portability
#include <sys/socket.h>		// socket, connect
#include <arpa/inet.h>		// inet_aton, htonl, htons
#include <unistd.h>			// close
#include <cstring>			// strlen, strcmp

#define BUFFER_SIZE 1024
#define SERVER_PORT 50000
#define SERVER_IP "127.0.0.1"

int main() {

	/*
	 * Declare structure variables that store local and peer socket addresses
	 * sockaddr_in is the address structure used for IPv4
	 * sockaddr is the protocol independent address structure
	 */

	struct sockaddr_in my_addr, peer_addr;

	// zero out the structor variable because it has an unused part
	// make sure the my_addr is empty (initialization)
	memset(&my_addr, '\0', sizeof my_addr);

	// Declare socket descriptor
	int socket_desc;

	char outbound[BUFFER_SIZE] = {};
	char inbound[BUFFER_SIZE] = {};

	/*
		socket() input arguments are:
		socket domain (AF_INET):	IPv4 Internet protocols
		socket type (SOCK_STREAM):	sequenced, reliable, two-way, connection-based
									byte streams
		socket protocol (0): 		OS selects a protocol that supports the requested
							 		socket type (in this case: IPPROTO_TCP)
		socket() returns a socket descriptor
	*/
	socket_desc = socket(AF_INET, SOCK_STREAM, 0);
	if (socket_desc == -1) {
		std::cerr << "Listening socket creation failed!\n";
		return 1;
	}

	// Prepare sockaddr_in structure variable
	peer_addr.sin_family = AF_INET;							// address family (2 bytes)

	peer_addr.sin_port = htons(SERVER_PORT);				// port in network byte order (2 bytes)
															// htons takes care of host-order to short network-order
															// conversion.
															// If the target IP address is behind firewall, the packet
															// will not be sent to the target machine

//	peer_addr.sin_addr.s_addr = htonl(INADDR_LOOPBACK);		// internet address (4 bytes). INADDR_LOOPBACK is localhost
	                                                        // address

	 inet_aton(SERVER_IP, &(peer_addr.sin_addr));           // inet_aton converts the Internet host address from the
															// IPv4 numbers-and-dots notation to binary form (network
															// byte order)
															// htonl takes care of host-order to long network-order
															// conversion.
															// This equivalent to manually assign IPV4 address into
															// struct -> peer_addr.sin.s_addr = htonl(...)

    /*
     * Bind to an IP address and port number for client is optional (not
     * important). Let the OS to select a port
     */

	/*
	 * connecting to the server socket
	 * require type casting for socket type. connect function is written for all
	 * type of socket family, which is use generic socket structure.
	 */
	if (connect(socket_desc, (struct sockaddr *) &peer_addr, sizeof peer_addr) == -1) {
		std::cerr << "Cannot connect to the host!\n";
		close(socket_desc);
		return 1;
	}

	/*
	 * Debugging use -> inet_ntoa converts the IP address from binary in network
	 * byte order to number and dot notation, text (string or char array); ntohs
	 * converts the server socket port number from network byte order to host
	 * byte order
	 */
	std::cout << "Connection established with " << inet_ntoa(peer_addr.sin_addr)
	    << ":" << ntohs(peer_addr.sin_port) << "\n";

    while (true) {

        std::cout << "Enter an integer or \"Q\" to quit:\n";
    	std::cin.getline(outbound, BUFFER_SIZE);

    	// + 1 account null character
    	send(socket_desc, outbound, strlen(outbound) + 1, 0);

    	// Terminate the program
    	if (strcmp("Q", outbound) == 0) {
    		break;
    	}

    	// blocking call
    	// the flag in recv() specify the behavior (leave it to 0 in default)
    	int rec_size = recv(socket_desc, inbound, BUFFER_SIZE, 0);
    	std::cout << "Received: " << inbound << std::endl;
    }

    // close socket
    close(socket_desc);

	return 0;
}