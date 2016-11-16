# http://stackoverflow.com/questions/1215408/how-to-list-all-class-properties
property_names=[p for p in dir(SomeClass) if isinstance(getattr(SomeClass,p),property)]


############################
'''
inspect.getmembers gets inherited members as well
(and selects members by a predicate,
here we coded isprop because it's not among the
many predefined ones in module inspect;
you could also use a lambda, of course, if you prefer)
'''

import inspect

def isprop(v):
  return isinstance(v, property)

propnames = [name for (name, value) in inspect.getmembers(SomeClass, isprop)]
