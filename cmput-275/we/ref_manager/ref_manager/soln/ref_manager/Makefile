SRC = ref_manager.cpp we3_test.cpp
OBJ = ref_manager.o we3_test.o
EXE = we3_solution

main: all

all: we3_solution

clean: $(EXE) $(OBJ)
	rm -rf $(EXE) $(OBJ)

we3_solution: $(OBJ)
	g++ -o $(EXE) $(OBJ)

compile: $(SRC)
	g++ -c $(SRC)
