#!/usr/bin/env python3
# -*- coding: utf-8 -*-
""" 
.. Created on 2018-08-03
.. codeauthor:: Ladislav Sulak <laco.sulak@gmail.com>
""" 
from abc import ABCMeta, abstractmethod


class AbstractCustomCls(metaclass=ABCMeta):
    """
    Abstract class for some calculations.
    """
    def __init__(self, raw_results):
        self._raw_results = raw_results

    @property
    @abstractmethod
    def name(self):
        pass

    @classmethod
    @abstractmethod
    def _calculate_something(cls, arg):
        pass

    @property
    def results(self):
        return self._raw_results

    @classmethod
    def compute(cls, arg1):
        print("Doing some pre-calculations with {}".format(arg1))

        some_results = cls._calculate_something(arg1)
        return cls(some_results)
