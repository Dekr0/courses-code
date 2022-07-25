#!/usr/bin/env python
# -*- coding:utf-8 -*-


def binary_search(target, array, lower, upper):
    mid = (lower + upper) // 2
    if target == array[mid]:
        return True
    elif mid + 1 == upper:
        return False
    elif target < array[mid]:
        return binary_search(target, array, lower, mid)
    elif target > array[mid]:
        return binary_search(target, array, mid, upper)


a = [1, 2, 3, 4, 5, 6, 7, 8]
print(binary_search(2, a, 0, len(a)-1))