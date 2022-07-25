# Makefile Targets:
#	- make exercise5: links exercise5.o to generate an executable called
#	exercise5
#	- make clean: removes the object exercise5.o and the executable
#	exercise5
#	- make exercise5.o: compiles the object

EXE = exercise5
HEADER = dynarray.h hash_table.h linked_list.h
OBJ = exercise5.o
SRC = exercise5.cpp

exercise5: $(HEADER) exercise5.o
	g++ -o $(EXE) $(OBJ)

clean: $(EXE) $(OBJ)
	rm -rf $(EXE) $(OBJ)

exercise5.o: $(SRC) $(HEADER)
	g++ -c $(SRC)