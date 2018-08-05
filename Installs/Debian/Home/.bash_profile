# needed for SublimeLinter
export PATH=$PATH:/bin:/sbin:~/bin:/opt/bin


## Cheat ##
#
# Gives it path to default editor
export EDITOR=/opt/sublime_text_3/sublime_text
#  Syntax highlighting
export CHEATCOLORS=true


# put clock at the top of terminal when idle
# (http://www.commandlinefu.com/commands/view/7916/put-a-console-clock-in-top-right-corner)
# while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
#
# Additional system information
# while true; do tput sc; tput cup 0 $(($(tput cols)-74)); w | grep load; tput rc; sleep 10; done &

#####################################################
# BEGINNING OF TERMINAL SESSION - PRINT MESSAGE #
#####################################################

# Screenfetch
if [ $(dpkg-query -W -f='${Status}' screenfetch 2>/dev/null | grep -c "ok installed") -eq 1 ]; then
	screenfetch;
fi

# GET SYSTEM INFO
#
# Helpful when you want a quick snapshot of system information.
# Displays quick system stats on a Linux machine, such as
#
#	- distro information
#	- kernel
#	- uptime
#	- memory
#	- swap
#	- chip architecture
#	- processor information
#	- the date
#	- user information
#	- group info
#	- current working directory
#	- user's home directory
#	- the system's hostname
#	- all ip addresses
#	- default gateway
#	- name servers
#
# SOURCE: https://community.spiceworks.com/scripts/show/2127-quick-system-information-on-a-linux-host

# SYSINFO=`head -n 1 /etc/issue`
# IFS=$'\n'
# UPTIME=`uptime`
# D_UP=${UPTIME:1}
# MYGROUPS=`groups`
# DATE=`date`
# KERNEL=`uname -a`
# CPWD=`pwd`
# ME=`whoami`
# CPU=`arch`

# printf ""
# printf "<=== SYSTEM ===>\n"
# echo "  Distro info:	"$SYSINFO""
# printf "  Kernel:\t"$KERNEL"\n"
# printf "  Uptime:\t"$D_UP"\n"
# free -tlh | awk '
# /Mem/{print "  Memory:\tTotal: " $2 "Mb\tUsed: " $3 "Mb\tFree: " $4 "Mb"}
# /Swap/{print "  Swap:\t\tTotal: " $2 "Mb\tUsed: " $3 "Mb\tFree: " $4 "Mb"}'
# printf "  Architecture:\t"$CPU"\n"
# cat /proc/cpuinfo | grep "model name\|processor" | awk '
# /processor/{printf "  Processor:\t" $3 " : " }
# /model\ name/{
# i=4
# while(i<=NF){
# 	printf $i
# 	if(i<NF){
# 		printf " "
# 	}
# 	i++
# }
# printf "\n"
# }'
# printf "  Date:\t\t"$DATE"\n"
# printf "\n<=== USER ===>\n"
# printf "  User:\t\t"$ME" (uid:"$UID")\n"
# printf "  Groups:\t"$MYGROUPS"\n"
# printf "  Working dir:\t"$CPWD"\n"
# printf "  Home dir:\t"$HOME"\n"

# printf "\n<=== NETWORK ===>\n"

# printf "  Hostname:\t"$HOSTNAME"\n"
# ip -o addr | awk '/inet /{print "  IP (" $2 "):\t" $4}'
# /sbin/route -n | awk '/^0.0.0.0/{ printf "  Gateway:\t"$2"\n" }'
# cat /etc/resolv.conf | awk '/^nameserver/{ printf "  Name Server:\t" $2 "\n"}'
# # printf "  External IP:\t$(curl -s checkip.amazonaws.com)"
# printf "\n\n"