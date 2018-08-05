#/bin/bash

#############################################################################
#
# ===========================================================================
# Author:
# Filename: 	debian_vesta_control_panel.sh
# File Path: 	/home/tom/Dropbox/Installs/debian_vesta_control_panel.sh
# ===========================================================================
#
# ==== OVERVIEW ====
#
#
#
# ==== USAGE ====
#
# -- Arguments
#
#
#
# -- User Inputer
#
#
#
# ==== OUTPUT ====
#
#
#
#############################################################################



curl -O http://vestacp.com/pub/vst-install.sh
bash vst-install.sh --nginx yes --apache yes --phpfpm no --vsftpd yes --proftpd no --exim yes --dovecot yes --spamassassin yes --clamav yes --named yes --iptables yes --fail2ban yes --mysql yes --postgresql no --remi yes --quota no --hostname lbdallas --email tomkuecken@gmail.com --password apacheserv3r