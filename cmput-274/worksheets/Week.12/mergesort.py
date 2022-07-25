#!/usr/bin/env python
# -*- coding:utf-8 -*-


def MergeSort(array):
    if len(array) > 1:

        m = len(array) // 2  # Find the midpoint of the array

        L = array[:m]  # first half of the array
        R = array[m:]  # second half of the array

        MergeSort(L)  # continue to split first half of the array, until the array contain one element
        MergeSort(R)  # then split second half of the array, until the array contain one element

        i = j = k = 0
        # i, index for first half of the array; j, index for second half of the array
        # k, index for the array needed to sort

        # compare and merge
        while i < len(L) and j < len(R):
            if L[i] < R[j]:
                array[k] = L[i]
                i += 1
            else:
                array[k] = R[j]
                j += 1
            k += 1

        # resolve the case that the size of the array is not even
        # example: one of them [7, 21], another one is [1]
        while i < len(L):
            array[k] = L[i]
            i += 1
            k += 1

        while j < len(R):
            array[k] = R[j]
            j += 1
            k += 1


a = [5, 2, 6, 4, 10, 7]
MergeSort(a)
print(a)