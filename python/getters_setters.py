#!/usr/bin/python3
"""

Example Source:
	http://stackoverflow.com/questions/2627002/whats-the-pythonic-way-to-use-getters-and-setters
Python Property:
	http://docs.python.org/library/functions.html?highlight=property#property
"""

class C(object):
	def __init__(self):
		self._x = None

	@property
	def x(self):
	    """Getter for 'x' propery"""
	    return self._x

	@x.setter
	def x(self, value):
		self._x = value

	@x.deleter
	def x(self):
		del self._x
		