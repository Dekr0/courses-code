#!/usr/bin/env python
# -*- coding:utf-8 -*-


from bubblesort import bubbleSort
from time import time
from random import randint


def benchmark(n):

    test = []

    for i in range(n):
        test.append(randint(-100000, 100000))

    start = int(time())
    bubbleSort(test)
    end = int(time())

    print(end-start)


if __name__ == "__main__":
    benchmark(16384)