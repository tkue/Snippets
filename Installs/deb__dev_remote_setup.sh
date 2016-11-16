#!/bin/bash
##
## NOTE
## 		O/S used: Debian 8 x64 minimal

# ==============================================================================
# Initial Setup
# ==============================================================================

inital_setup() {
	apt-get update && apt-get upgrade && apt-get dist-upgrade
	apt-get install norestart
	shutdown -r now
}