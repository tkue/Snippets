"""
Description:
	Get the home directory of the current user

Python Docs:
	On Unix and Windows, return the argument with an initial component of ~ or ~user replaced by that user‘s home directory.

	On Unix, an initial ~ is replaced by the environment variable HOME if it is set; otherwise the current user’s home directory is looked up in the password directory through the built-in module pwd. An initial ~user is looked up directly in the password directory.

	On Windows, HOME and USERPROFILE will be used if set, otherwise a combination of HOMEPATH and HOMEDRIVE will be used. An initial ~user is handled by stripping the last directory component from the created user path derived above.

	If the expansion fails or if the path does not begin with a tilde, the path is returned unchanged.

Docs URL:
	https://docs.python.org/3/library/os.path.html#os.path.expanduser
"""
from os.path import expanduser
home = expanduser("~")

print(home)
'''
/home/tom
'''