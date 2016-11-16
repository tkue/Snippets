Using the function 'open' from Builtins
=====================================


## Arguments

| Argument  | Default Value |
|:----------|:--------------|
| file      |               |
| mode      | 'r'           |
| buffering | -1            |
| encoding  | None          |
| errors    | None          |
| newline   | None          |
| closfd    | True          |
| opener    | None          |


## Modes
| Note           | Character | Meaning                                                         |
|:---------------|:----------|:----------------------------------------------------------------|
|                | r         | open for writing                                                |
|                | w         | open for writing, truncating the file first                     |
|                | x         | open for exclusive creation, failing if the file already exists |
|                | a         | open for writing, appending to the end of the file if it exists |
|                | b         | binary mode                                                     |
| __Default__    | t         | text mode                                                       |
|                | +         | open a disk file for updating (reading and writing)             |
| __Deprecated__ | U         | universal newlines mode (deprecated)                            |

## Combinations
| Character | Meaning                  | Note                                |
|:----------|:-------------------------|:------------------------------------|
| w+b       | binary read-write access | Opens and truncates file to 0 bytes |
| r+b       | binary read-write access | Opens the file without truncation   |


## Errors
| Error             | Meaning                                                                                                               | Note                                                                                                                                                                                                   |
|:------------------|:----------------------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| string            | raise a `ValueError` if there is an encoding error                                                                    | The default value, `None`, has the same effect                                                                                                                                                         |
| ignore            | ignores errors                                                                                                        | Ignoring encoding errors can lead to data loss                                                                                                                                                         |
| replace           | causes a replacement marker (like `?`) to be inserted where there is malformed data                                   |                                                                                                                                                                                                        |
| surrogateescape   | will represent any incorrect bytes as code points in the `Unicode Private Use Area` raning from `U+DC80` to `U+DCFF`. | These private code points will then be turned back into the same bytes when the `surrogateescape` error handler is used when writing data. This is useful for processing files in an unknown encoding. |
| xmlcharrefreplace | Characters are not supported by the encoding are replaced with the appropriate XML character reference `&#nnn`        | Only supported when writing a file                                                                                                                                                                     |
| backslashreplace  | replaces malformed data by Python's backslashed escape sequences                                                      |                                                                                                                                                                                                        |
| namereplace       | replaces unsupported characters with `\N{...}` escape sequences                                                       | Only supported when writing                                                                                                                                                                            |

## Notes

__Exception:__
`OSError`
> If the file can't be opened, an `OSError` is raised


## Code

```python
import os

dir_fd = os.open('somedir', os.O_RDONLY)
def opener(path, flags):
  return os.open(path, flags, dir_fd=dir_fd)

with open('spamspam.txt', 'w', opener=opener) as f:
  print('This will be written to somedir/spamspamtxt', file=f)

os.close(dir_fd) # don't leak a file descriptor
```
