#!/bin/bash

apt-get purge lxc-docker*
apt-get purge docker.io*
apt-get update
apt-get install apt-transport-https ca-certificates
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D



# deb https://apt.dockerproject.org/repo debian-wheezy main
# deb https://apt.dockerproject.org/repo debian-jessie main
# deb https://apt.dockerproject.org/repo debian-stretch main
#
cat 'deb https://apt.dockerproject.org/repo debian-wheezy main' > /etc/apt/sources.list.d/docker.list
apt-get update
apt-cache policy docker-engine
sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
sudo docker run hello-world




# Add the docker group if it doesn't already exist.
$ sudo groupadd docker

# Add the connected user "${USER}" to the docker group.
# Change the user name to match your preferred user.
# You may have to logout and log back in again for
# this to take effect.
$ sudo gpasswd -a ${USER} docker

# Restart the Docker daemon.
$ sudo service docker restart



