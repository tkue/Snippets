import shutil
# import tarfile, zipfile, gzip, bz2
#
# shutil == higher level util

# unpack
shutil.unpack_archive('archive_name.tgz')

# pack
'''
Supports:
    - zip
    - tar
    - bztar
    - gztar

    To get supported archive formats:
        shutil.get_archie_formats()
'''
shutil.make_archive('base_name', 'zip')

# get list of supported formats(second param of pack)
shutil.get_archive_formats()

# ==============================================================================
# Shutil make_archive
# ==============================================================================
# https://docs.python.org/2/library/shutil.html#shutil.make_archive
from shutil import make_archive
import os

archive_name = os.path.expanduser(os.path.join('~', 'myarchive'))
root_dir = os.path.expanduser(os.path.join('~', '.shh'))
make_archive(archive_name, 'gztar', root_dir)

# results in
#   '/Users/tarek/myarchive.tar.gz'


# ==============================================================================
# Compressing a directory
# ==============================================================================
# https://stackoverflow.com/questions/1855095/how-to-create-a-zip-archive-of-a-directory

import os
import zipfile

def zipdir(path, ziph):
    for rootdir, subdirs, files in os.walk(path):
        for file in files:
            ziph.write(os.path.join(rootdir, file))

if __name__ == '__main__':
    zipf = zipfile.ZipFile('Python.zip', 'w', zipfile.ZIP_DEFLATED)
    zipdir('tmp/', zipf)
    zipf.close()
