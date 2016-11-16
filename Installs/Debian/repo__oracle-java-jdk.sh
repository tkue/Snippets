#!/bin/bash

if [ ! `id u` -eq 0]; then
	echo "Need to run as root."
	exit 1
fi

apt-add-repository ppa:webupd8team/java \
	&& apt-get update && apt-get install oracle-java8-installer