# pre-req (file in current diretory), something that require to exist or created in order to run the target
# all is a target, main is target
# main is pre-req of target all, first.o and second.o is pre-req of target main
# start the more general target, then the more specific
# touch, reverse the previous make

OBJ = first.o second.o

CC = g++
CC_FLAGS = -Wall -02 -g

all: main  

main: $(OBJ)   # pre-req
	$(CC) -o main $(OBJ)

first.o: first.cpp
	$(CC) $(CC_FLAGS) first.cpp

second.o: second.cpp
	g++ -c second.cpp

clean:
	# remove all the object files
	rm -f first.o seonc.o
