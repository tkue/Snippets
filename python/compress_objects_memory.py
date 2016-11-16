import cPickle
import zlib

"""
Description:
    Compress object in memory

Quote:
    If obj has references to a number of small objects,
    this can reduce the amount of memory used by a lot.

    A lot of small objects in Python add up because of per-object memory
    overhead as well as memory fragmentation.

Source:
    https://stackoverflow.com/questions/19500530/compress-python-object-in-memory
"""

# Compress 'obj'
compressed = zlib.compress(cPickle.dumps(obj))

# Get 'obj' back
obj = cPickle.loads(zlib.decompress(compressed))


# ==============================================================================
# Produce complete gzip-compatible binary string
# ==============================================================================
"""
Source:
    https://stackoverflow.com/questions/8506897/how-do-i-gzip-compress-a-string-in-python
"""
import StringIO
import gzip

out = StringIO.StringIO()
with gzip.GzipFile(fileobj=out, mode="w") as f:
    f.write("Compressed string value")
out.getvalue()

# returns '\x1f\x8b\x08\x00\xbd\xbe\xe8N\x02\xff\x0b\xc9\xc8,V\x00\xa2\xdc\xcc\xecT\x85\xbc\xd2\xdc\xa4\xd4"\x85\xfc\xbcT\x1d\xa0X\x9ez\x89B\tH:Q!\'\xbfD!?M!\xad4\xcf\x1e\x00w\xd4\xea\xf41\x00\x00\x00'
