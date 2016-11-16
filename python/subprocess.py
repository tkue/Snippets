#!/bin/python3

import subprocess


if __name__ == '__main__':

	subprocess.run('ls -l')	# run = latest version
	subprocess.call('ls -l') # call = earlier versions of python3