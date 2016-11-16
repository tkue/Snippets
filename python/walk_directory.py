#!/usr/bin/python3
"""
Walk directory and return list of all files
"""
import os

def walk_dir(dir: str):
	if not os.path.exists(dir):
		return

	paths = []
	for rootdir, subdirs, files in os.walk(dir):
		for file in files:
			paths.append(os.path.join(rootdir, file))

	return paths
