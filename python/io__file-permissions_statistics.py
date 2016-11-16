import os
import stat
import sys

# ==============================================================================
# os.access()
# ==============================================================================
"""
Mode:
    os.F_OK
        test existence
    os.R_OK
        test readability
    os.W_OK
        test writability
    os.X_OK
        test executability
"""

file_path = '/tmp/file'
is_read_access = os.access(file_path, os.R_OK)

# ==============================================================================
# Check if access error
# ==============================================================================
try:
    fp = open('filepath')
except IOError as e:
    if e.errno == errno.EACCES:
        return 'Permission error'
    raise # Not a permission error
else:
    with fp:
        return fp.read()

# ==============================================================================
# Comparing os.stat with stat
# ==============================================================================

def is_group_readable(filepath):
    """
    Checks if can read file

    Source:
        http://stackoverflow.com/questions/1861836/checking-file-permissions-in-linux-with-python
    """
    st = os.stat(filepath)
    return bool(st.st_mode & stat.S_IRGRP)

# sticky bit
stat.S_ISVTX

# mask for file permissions
stat.S_IRWXU

# ownver has write permission
stat.S_IRUSR

# owner has execute permissions
stat.S_IXUSR

# mask for group permissions
stat.S_IRWXG

# group has read permission
stat.S_IRGRP

# group has read permission
stat.S_IRGRP

# group has write permissions
stat.S_IWGRP

# group has exec permissions
stat.S_IXGRP
