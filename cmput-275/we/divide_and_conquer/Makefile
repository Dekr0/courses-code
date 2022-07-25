# Makefile Targets:
# 		- climbing: link all objects required for testing the climbing function
#		and builds an executable called climbing.
#		- climbing.o: compiles climbing.cpp
#		- driver.o: compiles driver.cpp
#		- clean: removes all executable and object files

EXE = climbing
OBJ = climbing.o driver.o
SRC = climbing.cpp driver.cpp

$(EXE): $(OBJ)
	@g++ -o $(EXE) $^

climbing.o: climbing.cpp
	@g++ -c climbing.cpp

driver.o: driver.cpp
	@g++ -c driver.cpp

clean:
	@rm -rf $(EXE) *.o