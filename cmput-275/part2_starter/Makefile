# Makefile Targets
#	- all : runs the server and client targets to generate all the executables
#	- client : links all object files for client and builds an executable called
#	client in the same directory as the client.cpp
#	- client.o : compiles the client.cpp into client.o
#	- dijkstra.o : target that compiles the dijkstra.cpp into dijkstra.o
#	- handle.o : target that compiles the handle.cpp into handle.o
#	- server : links all object files for client and builds an executable called
#	server in the same directory as the server.cpp
#	- preprocess.o: target that compiles the preprocess.cpp into preprocess.cpp
#	- server.o : target that compiles the server.cpp into server.o
#	- digraph.o : target that compiles the digraph.cpp into digraph.o
#	- clean : removes the executable and objects

SERVER = server
CLIENT = client
SERVER_HEADER = $(SERVER)/digraph.h $(SERVER)/dijkstra.h $(SERVER)/handle.h $(SERVER)/wdigraph.h
SERVER_OBJ = $(SERVER)/digraph.o $(SERVER)/dijkstra.o $(SERVER)/handle.o $(SERVER)/server.o
CLIENT_HEADER = $(CLIENT)/preprocess.h
CLIENT_OBJ = $(CLIENT)/client.o $(CLIENT)/preprocess.o

all: $(SERVER) $(CLIENT)

$(CLIENT): $(CLIENT_OBJ) $(CLIENT_HEADER)
	@g++ -o $(CLIENT)/$(CLIENT) $^

$(SERVER): $(SERVER_OBJ) $(SERVER_HEADER)
	@g++ -o $(SERVER)/$(SERVER) $^

client.o: $(CLIENT)/client.cpp $(CLIENT_HEADER)
	@g++ -c $(CLIENT)/client.cpp
	@mv client.o $(CLIENT)

digraph.o: $(SERVER)/digraph.cpp $(SERVER)/digraph.h
	@g++ -c $(SERVER)/digraph.cpp
	@mv digraph.o $(SERVER)

dijkstra.o: $(SERVER)/dijkstra.cpp $(SERVER)/dijkstra.h $(SERVER)/digraph.h $(SERVER)/wdigraph.h
	@g++ -c $(SERVER)/dijkstra.cpp
	@mv dijkstra.o $(SERVER)

handle.o: $(SERVER)/handle.cpp $(SERVER)/handle.h
	@g++ -c $(SERVER)/handle.cpp
	@mv handle.o $(SERVER)

preprocess.o: $(CLIENT)/preprocess.cpp $(CLIENT)/preprocess.h
	@g++ -c $(CLIENT)/preprocess.cpp
	@mv preprocess.o $(CLIENT)

server.o: $(SERVER)/server.cpp $(SERVER_HEADER)
	@g++ -c $(SERVER)/server.cpp
	@mv server.o $(SERVER)

clean:
	rm -rf $(SERVER)/$(SERVER) $(SERVER)/*.o
	rm -rf $(CLIENT)/$(CLIENT) $(CLIENT)/*.o
	unlink inpipe
	unlink outpipe