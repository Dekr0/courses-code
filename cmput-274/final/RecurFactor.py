#!/usr/bin/env python
# -*- coding:utf-8 -*-


def factorial(n):
    if n == 1:
        return n
    return n * factorial(n-1)