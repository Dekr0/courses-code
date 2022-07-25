@echo off
call :compile
call :test

:compile
cd part1
g++ -o server server.cpp handle.cpp digraph.cpp dijkstra.cpp

:test
./server.exe < ../tests/input/test00-input.txt