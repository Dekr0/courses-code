cmake_minimum_required(VERSION 3.16)
project(matrix_class)

set(CMAKE_CXX_STANDARD 11)

add_executable(matrix_class test.cpp matrix.cpp)