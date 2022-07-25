# Makefile Targets
#	- server : main target which simply links all object files
#	- dijkstra.o : target that compiles the dijkstra.cpp into dijkstra.o
#	- handle.o : target that compiles the handle.cpp into handle.o
#	- server.o : target that compiles the server.cpp into server.o
#	- digraph.o : target that compiles the digraph.cpp into digraph.o
#	- clean : removes the executable and objects

EXE = server
OBJ = server.o handle.o dijkstra.o digraph.o
HEADER = digraph.h dijkstra.h handle.h wdigraph.h

$(EXE): $(OBJ) $(HEADER)
	@g++ -o server $^

digraph.o: digraph.cpp digraph.h
	@g++ -c digraph.cpp

dijkstra.o: dijkstra.cpp dijkstra.h wdigraph.h digraph.h
	@g++ -c dijkstra.cpp

handle.o: handle.cpp digraph.h handle.h wdigraph.h
	@g++ -c handle.cpp

server.o: server.cpp $(HEADER)
	@g++ -c server.cpp

clean:
	@rm -rf $(EXE) *.o
