#!/usr/bin/python3

"""
Calculate file hash
Reads file in chunks

Can use libraries:
	- hashlib (builtin)
	- xxhash (supposedly faster, but need to install)
		+ Still doesn't make use of multithreading
"""
try:
    import xxhash as h
except ImportError:
    import hashlib as h

def calc_hash(file_path, block_size=2 ** 20 * 60):
    import sys

    m = None
    if 'xxhash' in sys.modules:
        m = h.xxh64()
    elif 'hashlib' in sys.modules:
        m = h.sha256()
    else:
        raise ImportError

    with open(file_path, 'rb') as f:
        chunk = 0
        while chunk != b'':
            chunk = f.read(block_size)
            m.update(chunk)
    return m.hexdigest()
