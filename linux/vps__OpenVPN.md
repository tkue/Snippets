OpenVPN Install
===============

## With outside script

Tested on Debian 8 (LetBox)

Need to test script

```shell
SHA1="e0e0ec3a6f1440372fb9eed0225ece75318e9cc9"
URL="https://raw.githubusercontent.com/Nyr/openvpn-install/master/openvpn-install.sh"

if [ ! `id -u` -ne 0 ]; then
	echo "Need to run as root"
	exit 1
fi

get_script() {
	wget $URL || \
		echo "Failed to download script" && exit 1

	if [[ ! $(sha1sum openvpn-install.sh) -eq $SHA1 ]]; then
		echo "Original SHA1 hash does not match. Re-evaluate."
		mv openvpn-install.sh /tmp/
		exit 1
	fi
}

get_script
./openvpn-install.sh

```
