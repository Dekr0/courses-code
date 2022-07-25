#!/bin/bash
compile()
{
  cd part1 || exit
  make server

}

clean()
{
  make clean
}

test()
{
#  ./server < ../tests/input/test00-input.txt
#  ./server < ../tests/input/test01-input.txt
   ./server < ../tests/input/test02-input.txt
}

compile
test
clean