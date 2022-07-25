# Makefile Targets:
# 		graph_concepts - link graph_concepts.o and digraph.o
#		graph_concepts.o - compiles the graph_concepts.cpp into graph_concepts.o
#		digraph.o - compiles the digraph.cpp into digraph.o
#		clean - removes all the object and executable
#		run - execute graph_concepts to count and print the number of components
#			  in Edmonton

EXE = graph_concepts
HEADER = digraph.h
OBJ = digraph.o graph_concepts.o
SRC = digraph.cpp graph_concepts.cpp
TEST = edmonton-roads-2.0.1.txt

$(EXE): $(OBJ)
	@g++ -o $(EXE) $^

graph_concepts.o : $(HEADER) $(SRC)
	@g++ -c graph_concepts.cpp

digraph.o : $(HEADER) $(SRC)
	@g++ -c digraph.cpp

clean:
	@rm -rf $(EXE) *.o

run: $(TEST)
	@./$(EXE) < $<
