SRC = ref_manager.cpp we3_test.cpp
OBJ = ref_manager.o we3_test.o
EXE = we3_solution

all: executable

clean: $(EXE) $(OBJ)
	rm -rf $(EXE) $(OBJ)

executable: $(OBJ)
	g++ -o $(EXE) $(OBJ)

compile: $(SRC)
	g++ -c $(SRC)

unit_test:
	./we3_solution < sample_input_2.txt

