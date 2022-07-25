#!/usr/bin/env python
# -*- coding:utf-8 -*-


def exponent(base, power):
    if power == 0:
        return 1

    return base * exponent(base, power-1)