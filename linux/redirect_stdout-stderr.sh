#!/bin/bash

# stderr
cmd 2> error.log

# stderr & stdout
cmd &> error.log
# ||
cmd > error.log 2>&1

# stderr to stdout
cmd 2>&1


# Example
find ~/ -name .profile 2>&1 | more
