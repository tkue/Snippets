Debian - Install: OpenVas
=========================

__TODO:__
> - Sections below are for updating vulnerability DB
> - Add link to source
> - Add steps taken to create user for version 9
>     + Need this before able to login
>     + Need to add user and then modify the password


<!-- TOC depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 -->

	- [Quick Reference](#quick-reference)
		- [Login URL](#login-url)
	- [Add Repo](#add-repo)
	- [Installation (Ubuntu)](#installation-ubuntu)
		- [Main Packages to Install](#main-packages-to-install)
		- [Updating the Scripts/Data Repos](#updating-the-scriptsdata-repos)
			- [OpenVas 8](#openvas-8)
			- [OpenVas 9](#openvas-9)

<!-- /TOC -->

## Quick Reference

[Link to Ubuntu Repo](https://launchpad.net/~mrazavi/+archive/ubuntu/openvas)

### Login URL

| Version | URL                                              |
| ------- | ---                                              |
| 8       | [https://localhost:443](https://localhost:443)   |
| 9       | [https://localhost:4000](https://localhost:4000) |


## Add Repo

```bash

sudo add-apt-repository ppa:mrazavi/openvas
sudo apt-get update

```

## Installation (Ubuntu)

Tested on Ubuntu 14.04 (trusty) and 16.04 (xenial)

### Main Packages to Install

- greenbone-security-assistant
- greenbone-security-assistant9
- openvas9-manager
- openvas9-scanner
- openvas9-cli


### Updating the Scripts/Data Repos


#### OpenVas 8

```bash

sudo apt-get install sqlite3
sudo openvas-nvt-sync
sudo openvas-scapdata-sync
sudo openvas-certdata-sync

sudo service openvas-scanner restart
sudo service openvas-manager restart
sudo openvasmd --rebuild --progress

```

__Enable PDF reports__
```shell
sudo apt-get install texlive-latex-extra --no-install-recommends
```

__Login URL__<br>
[https://localhost:443](https://localhost:443)



#### OpenVas 9

__NOTE:__ Login URL changed from port `443` to `4000`

```shell

sudo apt-get install sqlite3
sudo openvas-nvt-sync
sudo greenbone-scapdata-sync
sudo greenbone-certdata-sync

sudo service openvas-scanner restart
sudo service openvas-manager restart
sudo openvasmd --rebuild --progress

```

__Login URL__<br>
[https://localhost:4000](https://localhost:4000)
