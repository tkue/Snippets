## Debian Install

### Add Repo

#### Debian 

__Bash one-liner__
```shell

sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E \
	&& sudo printf "# X2Go Repository (release builds)\n" \
					"deb http://packages.x2go.org/debian jessie main\n" \
					"# X2Go Repository (sources of release builds)\n" \
					"deb-src http://packages.x2go.org/debian jessie main" \
				> /etc/apt/sources.list.d/x2go.list \
	&& sudo apt-get update \
	&& sudo apt-get install x2go-keyring \
	&& sudo apt-get update \
	&& sudo apt-get install x2goserver x2goclient k

```


```shell
sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E
```
```shell
sudo nano /etc/apt/sources.list.d/x2go.list
```
```
# X2Go Repository (release builds)
deb http://packages.x2go.org/debian jessie main
# X2Go Repository (sources of release builds)
deb-src http://packages.x2go.org/debian jessie main

# X2Go Repository (nightly builds)
#deb http://packages.x2go.org/debian jessie heuler
# X2Go Repository (sources of nightly builds)
#deb-src http://packages.x2go.org/debian jessie heuler
```
```shell
sudo apt-get update; sudo apt-get install x2go-keyring && sudo apt-get update \
	&& sudo apt-get install x2goserver x2goclient 
```


#### Ubuntu

# To add: add-apt-repository
sudo apt-get install python-software-properties

# Or for 14 and later
sudo apt-get install software-properties-common

# Add the ppa
sudo add-apt-repository ppa:x2go/stable
sudo apt-get update
sudo apt-get install x2goserver x2goserver-xsession


----



```bash

sudo apt-key adv --recv-keys --keyserver keys.gnupg.net E1F958385BFE2B6E

if [ -f /etc/apt/sources.list.d/x2go.list ]; then
	echo "The repository file already with the following content:\n";
	cat /etc/apt/sources.list.d/x2go.list

	echo -n "Would you like to continue and replace the file(y/n)?";

	read_is_replace

	if [ $read_is_replace == 'y' || $read_is_replace == 'yes']; then
		text = "# X2Go Repository (release builds)";
		text +=	deb http://packages.x2go.org/debian jessie main
		text +=	# X2Go Repository (sources of release builds)
		text +=	deb-src http://packages.x2go.org/debian jessie main
		text +=
		text +=	 # X2Go Repository (nightly builds)
		text +=	 #deb http://packages.x2go.org/debian jessie heuler
		text +=	 # X2Go Repository (sources of nightly builds)
		text +=	 #deb-src http://packages.x2go.org/debian jessie heuler

		while ( -e /etc/apt/sources.list.d/x2go.list ); do


sudo editor /etc/apt/sources.list.d/x2go.list


```
