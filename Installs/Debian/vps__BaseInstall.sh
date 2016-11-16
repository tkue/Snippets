#!/bin/bash

if [ `id -u` -eq 0 ]; then
    echo "Need to run as root"
    exit 1
fi

function runUpdates() {
    apt-get update \
        && apt-get upgrade \
        && apt-get dist-upgrade
}

function installPackages() {
    apt-get update
    apt-get install needrestart unp openssh-server sudo
}

function installWebmin() {
    apt-get update
    apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
    cd && wget http://prdownloads.sourceforge.net/webadmin/webmin_1.810_all.deb && dpkg -i webmin_1.810_all.deb
    needrestart
}

function addUser() {
    adduser tom
    usermod -aG sudo tom
}

runUpdates
shutdown -r now
installPackages
installWebmin
addUser

# Modify ssh config
#  - add different ports
#  - prevent root login
