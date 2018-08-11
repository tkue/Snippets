# How to make a bootable Windows 10 USB in Linux

## Get ISO

Should be able to get ISO trial from Microsoft

## Format USB/Disk using fdisk and mkdosfs

create bootable partition using fdisk


make fat32 partition using mkdosfs

```shell
sudo mkdosfs -F 32 -I /dev/sdb1
```


## Use WoeUSB to make bootable disk

```shell
# Get app
cd bin/
git clone https://github.com/slacka/WoeUSB.git
cd WoeUSB/

# Build (follow instructions on GitHub page)
./setup-development-environment.bash
sudo apt-get update && sudo apt-get install devscripts equivs gdebi-core
mk-build-deps
sudo gdebi woeusb-build-deps_3.2.1-1-g5470bd6_all.deb
dpkg-buildpackage -uc -b
sudo gdebi ../woeusb_3.2.1-1-g5470bd6_amd64.deb

# Start App
gksu woeusbgui &
```

