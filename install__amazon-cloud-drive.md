#!/bin/bash

# http://xmodulo.com/access-amazon-cloud-drive-command-line-linux.html

##
## Install
##
sudo pip3 install --upgrade --pre acdcli
cp Downloads/oauth_data ~/.cache/acd_cli/
acd_cli init # Throws error - need to sync
acd_cli sync


##
## Usage
##

cd_cli usage
acd_cli ls /

#To browse a particular folder:
acd_cli ls /Pictures

#To download an entire folder locally:
acd_cli dl /Pictures/Jessica_Wedding

# To upload an entire local folder to ACD:
acd_cli ul ./Xmas_2015 /Pictures 


# To mount ACD locally, simply run:
acd_cli mount /local/mount/point
# Now you can use native Linux commands (e.g., ls, df, cp, mv) to access your ACD account.
# To unmount ACD:
acd_cli umount ./acd
