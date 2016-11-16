Python and SQLite
=================

## Docs

[https://docs.python.org/2/library/sqlite3.html](https://docs.python.org/2/library/sqlite3.html)

## Types Conversion

__Python type to SQLite type__
```
None = NULL
int = INTEGER
long = INTEGER
float = REAL
str(UTF8-encoded) = TEXT
unicode = TEXT
buffer = BLOB
```

__SQLite type to Python Type__
```
NULL = None
INTEGER = int or long (depending on size)
REAL = float 
TEXT = unicode by default, but depends on text_factory
BLOB = buffer
```