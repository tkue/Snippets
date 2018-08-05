################################################
## OVERVIEW: .bashrc ##
################################################
#
# Bash allows these prompt strings to be customized by inserting a
# number of backslash-escaped special characters that are
# decoded as follows:

#   \a    an ASCII bell character (07)
#   \d    the date in "Weekday Month Date" format (e.g., "Tue May 26")
#   \D{format}  the format is passed to strftime(3) and the result
#         is inserted into the prompt string an empty format
#         results in a locale-specific time representation.
#         The braces are required
#   \e    an ASCII escape character (033)
#   \h    the hostname up to the first `.'
#   \H    the hostname
#   \j    the number of jobs currently managed by the shell
#   \l    the basename of the shell's terminal device name
#   \n    newline
#   \r    carriage return
#   \s    the name of the shell, the basename of $0 (the portion following
#         the final slash)
#   \t    the current time in 24-hour HH:MM:SS format
#   \T    the current time in 12-hour HH:MM:SS format
#   \@    the current time in 12-hour am/pm format
#   \A    the current time in 24-hour HH:MM format
#   \u    the username of the current user
#   \v    the version of bash (e.g., 2.00)
#   \V    the release of bash, version + patch level (e.g., 2.00.0)
#   \w    the current working directory, with $HOME abbreviated with a tilde
#   \W    the basename of the current working directory, with $HOME
#        abbreviated with a tilde
#   \!    the history number of this command
#   \#    the command number of this command
#   \$    if the effective UID is 0, a #, otherwise a $
#   \nnn    the character corresponding to the octal number nnn
#   \\    a backslash
#   \[    begin a sequence of non-printing characters, which could be used
#         to embed a terminal control sequence into the prompt
#   \]    end a sequence of non-printing characters

#   The command number and the history number are usually different:
#   the history number of a command is its position in the history
#   list, which may include commands restored from the history file
#   (see HISTORY below), while the command number is the position in
#   the sequence of commands executed during the current shell session.
#   After the string is decoded, it is expanded via parameter
#   expansion, command substitution, arithmetic expansion, and quote
#   removal, subject to the value of the promptvars shell option (see
#   the description of the shopt command under SHELL BUILTIN COMMANDS
#   below).


################################################
## COLORS ##
################################################

# # Reset
# Color_Off='\e[0m'       # Text Reset

# # Regular Colors
# Black='\e[0;30m'        # Black
# Red='\e[0;31m'          # Red
# Green='\e[0;32m'        # Green
# Yellow='\e[0;33m'       # Yellow
# Blue='\e[0;34m'         # Blue
# Purple='\e[0;35m'       # Purple
# Cyan='\e[0;36m'         # Cyan
# White='\e[0;37m'        # White

# # Bold
# BBlack='\e[1;30m'       # Black
# BRed='\e[1;31m'         # Red
# BGreen='\e[1;32m'       # Green
# BYellow='\e[1;33m'      # Yellow
# BBlue='\e[1;34m'        # Blue
# BPurple='\e[1;35m'      # Purple
# BCyan='\e[1;36m'        # Cyan
# BWhite='\e[1;37m'       # White

# # Underline
# UBlack='\e[4;30m'       # Black
# URed='\e[4;31m'         # Red
# UGreen='\e[4;32m'       # Green
# UYellow='\e[4;33m'      # Yellow
# UBlue='\e[4;34m'        # Blue
# UPurple='\e[4;35m'      # Purple
# UCyan='\e[4;36m'        # Cyan
# UWhite='\e[4;37m'       # White

# # Background
# On_Black='\e[40m'       # Black
# On_Red='\e[41m'         # Red
# On_Green='\e[42m'       # Green
# On_Yellow='\e[43m'      # Yellow
# On_Blue='\e[44m'        # Blue
# On_Purple='\e[45m'      # Purple
# On_Cyan='\e[46m'        # Cyan
# On_White='\e[47m'       # White

# # High Intensity
# IBlack='\e[0;90m'       # Black
# IRed='\e[0;91m'         # Red
# IGreen='\e[0;92m'       # Green
# IYellow='\e[0;93m'      # Yellow
# IBlue='\e[0;94m'        # Blue
# IPurple='\e[0;95m'      # Purple
# ICyan='\e[0;96m'        # Cyan
# IWhite='\e[0;97m'       # White

# # Bold High Intensity
# BIBlack='\e[1;90m'      # Black
# BIRed='\e[1;91m'        # Red
# BIGreen='\e[1;92m'      # Green
# BIYellow='\e[1;93m'     # Yellow
# BIBlue='\e[1;94m'       # Blue
# BIPurple='\e[1;95m'     # Purple
# BICyan='\e[1;96m'       # Cyan
# BIWhite='\e[1;97m'      # White

# # High Intensity backgrounds
# On_IBlack='\e[0;100m'   # Black
# On_IRed='\e[0;101m'     # Red
# On_IGreen='\e[0;102m'   # Green
# On_IYellow='\e[0;103m'  # Yellow
# On_IBlue='\e[0;104m'    # Blue
# On_IPurple='\e[0;105m'  # Purple
# On_ICyan='\e[0;106m'    # Cyan
# On_IWhite='\e[0;107m'   # White# Reset
# Color_Off='\e[0m'       # Text Reset

# # Regular Colors
# Black='\e[0;30m'        # Black
# Red='\e[0;31m'          # Red
# Green='\e[0;32m'        # Green
# Yellow='\e[0;33m'       # Yellow
# Blue='\e[0;34m'         # Blue
# Purple='\e[0;35m'       # Purple
# Cyan='\e[0;36m'         # Cyan
# White='\e[0;37m'        # White

# # Bold
# BBlack='\e[1;30m'       # Black
# BRed='\e[1;31m'         # Red
# BGreen='\e[1;32m'       # Green
# BYellow='\e[1;33m'      # Yellow
# BBlue='\e[1;34m'        # Blue
# BPurple='\e[1;35m'      # Purple
# BCyan='\e[1;36m'        # Cyan
# BWhite='\e[1;37m'       # White

# # Underline
# UBlack='\e[4;30m'       # Black
# URed='\e[4;31m'         # Red
# UGreen='\e[4;32m'       # Green
# UYellow='\e[4;33m'      # Yellow
# UBlue='\e[4;34m'        # Blue
# UPurple='\e[4;35m'      # Purple
# UCyan='\e[4;36m'        # Cyan
# UWhite='\e[4;37m'       # White

# # Background
# On_Black='\e[40m'       # Black
# On_Red='\e[41m'         # Red
# On_Green='\e[42m'       # Green
# On_Yellow='\e[43m'      # Yellow
# On_Blue='\e[44m'        # Blue
# On_Purple='\e[45m'      # Purple
# On_Cyan='\e[46m'        # Cyan
# On_White='\e[47m'       # White

# # High Intensity
# IBlack='\e[0;90m'       # Black
# IRed='\e[0;91m'         # Red
# IGreen='\e[0;92m'       # Green
# IYellow='\e[0;93m'      # Yellow
# IBlue='\e[0;94m'        # Blue
# IPurple='\e[0;95m'      # Purple
# ICyan='\e[0;96m'        # Cyan
# IWhite='\e[0;97m'       # White

# # Bold High Intensity
# BIBlack='\e[1;90m'      # Black
# BIRed='\e[1;91m'        # Red
# BIGreen='\e[1;92m'      # Green
# BIYellow='\e[1;93m'     # Yellow
# BIBlue='\e[1;94m'       # Blue
# BIPurple='\e[1;95m'     # Purple
# BICyan='\e[1;96m'       # Cyan
# BIWhite='\e[1;97m'      # White

# # High Intensity backgrounds
# On_IBlack='\e[0;100m'   # Black
# On_IRed='\e[0;101m'     # Red
# On_IGreen='\e[0;102m'   # Green
# On_IYellow='\e[0;103m'  # Yellow
# On_IBlue='\e[0;104m'    # Blue
# On_IPurple='\e[0;105m'  # Purple
# On_ICyan='\e[0;106m'    # Cyan
# On_IWhite='\e[0;107m'   # White



# needed for SublimeLinter
if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
 shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
 [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

# enhanced_prompt=yes
PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( $(sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo)/1024))"\033[38;5;22m/"$(($(sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo)/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"'

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes

    else
	color_prompt=
    fi
fi

################################################
## PROMPT ##
################################################
#
# Use PROMPT_COMMAND to build the value up in a sane fashion.
# This saves a lot of quoting and makes the text much more readable.
# Note that you can use \e instead of \033 to represent the escape
# character inside a prompt.

# https://stackoverflow.com/questions/22361722/simplifying-advanced-bash-prompt-variable-ps1-code/22362727#22362727
# set_prompt () {
#     local last_command=$?  # Must come first!
#     PS1=""
#     # Add a bright white exit status for the last command
#     PS1+='\[\e[01;37m\]$? '
#     # If it was successful, print a green check mark. Otherwise, print
#     # a red X.
#     if [[ $last_command == 0 ]]; then
#         PS1+='\[\e[01;32m\]\342\234\223 '
#     else
#         PS1+='\[\e[01;31m\]\342\234\227 '
#     fi
#     # If root, just print the host in red. Otherwise, print the current user
#     # and host in green.
#     # in
#     if [[ $EUID == 0 ]]; then
#         PS1+='\[\e[01;31m\]\h '
#     else
#         PS1+='\[\e[01;32m\]\u@\h '
#     fi
#     # Print the working directory and prompt marker in blue, and reset
#     # the text color to the default.
#     PS1+='\[\e[01;34m\] \w \$\[\e[00m\] '
# }
# You can define variables for the more esoteric escape sequences,
# at the cost of needing some extra escapes inside the double quotes,
# to accommodate parameter expansion.
set_prompt () {
    local last_command=$? # Must come first!
    PS1=""
    local blue='\[\e[01;34m\]'
    local white='\[\e[01;37m\]'
    local red='\[\e[01;31m\]'
    local green='\[\e[01;32m\]'
    local reset='\[\e[00m\]'
    local fancyX='\342\234\227'
    local checkmark='\342\234\223'

    PS1+="$white\$? "
    if [[ $last_command == 0 ]]; then
        PS1+="$green$checkmark "
    else
        PS1+="$red$fancyX "
    fi
    if [[ $EUID == 0 ]]; then
        PS1+="$red\\h "
    else
        PS1+="$green\\u@\\h "
    fi
    PS1+="$blue\\w \\\$$reset "
}
# PROMPT_COMMAND='set_prompt'

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1+='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '

    PROMPT_COMMAND='set_prompt'
# elif [ "$enhanced_prompt" = yes ]; then
# 	PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( $(sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo)/1024))"\033[38;5;22m/"$(($(sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo)/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"'
# 	PS1='\[\e[m\n\e[1;30m\][$$:$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][\[\e[1;34m\]\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

export AA_P="export PVE=\"\\033[m\\033[38;5;2m\"\$(( \`sed -n \"s/MemFree:[\\t ]\\+\\([0-9]\\+\\) kB/\\1/p\" /proc/meminfo\` / 1024 ))\"\\033[38;5;22m/\"\$((\`sed -n \"s/MemTotal:[\\t ]\\+\\([0-9]\\+\\) kB/\\1/p\" /proc/meminfo\`/ 1024 ))MB\"\\t\\033[m\\033[38;5;55m\$(< /proc/loadavg)\\033[m\";echo -en \"\"" \
export PROMPT_COMMAND="history -a;((\$SECONDS % 10==0 ))&&eval \"\$AA_P\";echo -en \"\$PVE\";" \
export PS1="\\[\\e[m\\n\\e[1;30m\\][\$\$:\$PPID \\j:\\!\\[\\e[1;30m\\]]\\[\\e[0;36m\\] \\T \\d \\[\\e[1;30m\\][\\[\\e[1;34m\\]\\u@\\H\\[\\e[1;30m\\]:\\[\\e[0;37m\\]\${SSH_TTY} \\[\\e[0;32m\\]+\${SHLVL}\\[\\e[1;30m\\]] \\[\\e[1;37m\\]\\w\\[\\e[0;37m\\] \\n(\$SHLVL:\\!)\\\$ " \
export PVE="\\033[m\\033[38;5;2m813\\033[38;5;22m/1024MB\\t\\033[m\\033[38;5;55m0.25 0.22 0.18 1/66 26820\\033[m" && eval $AA_P

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    # ls aliases
  alias ll='ls -l --color=auto | sort'
  alias la='ls -A --color=auto | sort'
  alias l='ls -CF --color=auto | sort'

  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

################################################
## Colorful Man Pages ##
################################################

export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode – red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode – bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode – yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode – cyan


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#
## UTILITY FUNCTIONS ##
#

# Execute external shell script
exec_sh() {
    if [[ -f "$1" ]]; then
    source "$1"
  else
    echo "Could not source $1. File does not exist."
    fi
}


#####################################################
# INSTALLED APPLICATIONS #
#####################################################

# Sublime Text
alias sublime="/opt/sublime_text"
alias sublime_text="/opt/sublime_text"

# Thunar
alias openFolder="pwd | thunar &"		    # open current location
alias openFolderRoot="pwd | gksu thunar &"	# open current location as root

# Redshift
alias rson="redshift -r -l 28.08:-82.4"     #redshift on for tampa
alias rsoff="redshift -x"                   #redshift off

# Firefox
alias flash-accel-firefox="VDPAU_DRIVER=va_gl firefox"  # Enable flash hardware acceleration


#####################################################
# UNIX UTILITIES #
#####################################################

alias grep="grep -E --color=auto" #grep - extended/color
alias bc="bc -l" # bc to use math library for decimals
alias ls="ls -l --color=auto"

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# confirmation #
#alias mv='mv -i'
#alias cp='cp -i'
#alias ln='ln -i'

# update fonts
alias update-fonts="sudo fc-cache -fv"

# sd card reader
alias disable_sdcard-reader="rmmod rts5139"
alias enable_sdcard-reader="modprobe rts5139"

alias apt-get="apt-fast"

# automatic smart output (align)
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'


#####################################################
# CPU INFO AND COMMANDS #
#####################################################

# set CPU governor
alias setgov-performance="sudo cpufreq-set -g performance"
alias setgov-powersave="sudo cpufreq-set -g powersave"
alias setgov-ondemand="sudo cpufreq-set -g ondemand"
alias setgov-conservative="sudo cpufreq-set -g conservative"

# set max cpu frequency (percent)
setMaxCpu() {
	sudo echo $1 > /sys/devices/system/cpu/intel_pstate/max_perf_pct
}
alias cpuSetMax=setMaxCpu

# set min cpu frequency (percent)
setMinCpu() {
	sudo echo $1 > /sys/devices/system/cpu/intel_pstate/max_perf_pct
}
alias cpuSetMin=setMinCpu

# get max/min cpu frequencies (percent)
alias cpuGetMax="cat /sys/devices/system/cpu/intel_pstate/max_perf_pct"
alias cpuGetMin="cat /sys/devices/system/cpu/intel_pstate/min_perf_pct"

# get and set turbo boost
alias cpuGetNoTurbo="cat /sys/devices/system/cpu/intel_pstate/no_turbo"
alias cpuTurboOn="sudo echo 0 > /sys/devices/system/cpu/intel_pstate/no_turbo"
alias cpuTurboOff="sudo echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo"


#####################################################
# GET SYSTEM INFO #
#####################################################

## pass options to free ##
alias get-sys-meminfo='free -m -l -t'

## get top process eating memory
alias get-sys-psmem='ps auxf | sort -nr -k 4'
alias get-sys-psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias get-sys-pscpu='ps auxf | sort -nr -k 3'
alias get-sys-pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias get-sys-cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias get-sys-gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# GET PUBLIC IP
alias get-public-ip="curl http://ipecho.net/plain; echo";

# Get external IP address
alias get-external-ip="curl -s checkip.amazonaws.com"


#####################################################
# GET INSTALLED PACKAGES #
#####################################################

# get a list of recently installed packages
alias get-installed-packages-recent="tail -n 25 /var/log/apt/history.log"

# get a list of installed packages (manual and automatic)
alias get-installed-packages-all="dpkg --get-selections | sed -n 's/\t\+install$//p'"

# get a list of automatically installed packages
alias get-installed-packages-automatic="</var/lib/apt/extended_states awk -v RS= '/\nAuto-Installed: *1/{print$2}'"

# get a list of manually installed packages
alias get-installed-packages-manual="comm -23 <(dpkg --get-selections | sed -n 's/\t\+install$//p') \
         <(</var/lib/apt/extended_states \
           awk -v RS= '/\nAuto-Installed: *1/{print$2}' |sort)"



#####################################################
# UTILILITY COMMANDS #
#####################################################

# Kills a process that is locking a file.
alias unlock-file="fuser -k filename"

# Find Duplicate Files (based on size first, then MD5 hash)
# alias find-duplicates="$(find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 md5sum | sort | uniq -w32 --all-repeated=separate)"

# Create graphical list of subdirectories
# alias get-subdirectories="$(ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/')"

#####################################################
# FIX GPG KEY #
#####################################################

## fix GPG key
fixGpgKey() {
	gpg --keyserver pgpkeys.mit.edu --recv-key $1
	gpg -a --export $1 | sudo apt-key add -
}
alias fixkey=fixGpgKey



######################################################
# Screen Layouts #
######################################################

alias screenlayoutDefault="xrandr --output HDMI1 --off --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output VGA1 --off"
alias screenlayoutTwoDell="xrandr --output HDMI1 --mode 1920x1080 --pos 1366x0 --rotate normal --output LVDS1 --mode 1366x768 --pos 0x0 --rotate normal --output DP1 --off --output VGA1 --off"



#####################################################
# TIMESTAMP #
#####################################################

# GET TIMESTAMP: YYYYMMDD_HH:MM:SS.NNNN
getFullTimestamp() {
	numChar=4; # number of chars to take off end
	timeStamp=$(date +%Y%H%d_%H:%M:%S.%N);
	endChar="$((${#timeStamp}-$numChar))";
	echo "$(echo $timeStamp | cut -c1-$endChar)";
}
alias timestamp=getTimestamp


#####################################################
# BACKUP FILE #
#####################################################

# CREATE BACKUP FILE

# backup() {
# 	source "/home/tom/bin/scripts/backup_file.sh";
# }
alias backup=getBackup
getBackup() {
	# timestamp
	timeStamp=$(date +%Y%m%d);
	backupFile="$1.$timeStamp~";
	i=0;

	while [ -f "$backupFile" ]; do
		i=$(($i + 1));
		backupFile="$1.$timeStamp-$i~";
	done

	echo "File to backup: $1" ;
	echo "Backup location: $backupFile";

	cp "$1" "$backupFile";

	if [ $? == 0 ]; then
		echo "Backup successful";
	else
		echo "Backup failed";
	fi
}

#####################################################
# EXTRACT #
#####################################################

function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

#####################################################
# VIEW MARKDOWN IN TERMINAL #
#####################################################
#
# Uses:
#	- Pandoc 	-> Converts many file types to and from markdown
#	- Lynx		-> Text-based web browser that runs in the terminal

function viewMarkdown() {

	# isPandocInstalled=false;
	# isLynxInstalled=false;

	# if hash pandoc 2>/dev/null; then
	# 	isPandocInstalled=true
	# if hash lynx 2>/dev/null; then
	# 	isLynxInstalled=true

	# if ["$isPandocInstalled" == false]
	# 	echo "Pandoc cannot be found!"
	# if ["$isLynxInstalled" == false]
	# 	echo "Lynx cannot be found!"

	# if ["$isPandocInstalled" && "$isLynxInstalled"]
	# 	pandoc $1 | lynx -stdin
	# else
	# 	echo "Exiting..."

	pandoc $1 | lynx -stdin
}
alias rmd=viewMarkdown


#####################################################
# GET OVERVIEW OF COLORS #
#####################################################
colors() {
  local fgc bgc vals seq0

  printf "Color escapes are %s\n" '\e[${value};...;${value}m'
  printf "Values 30..37 are \e[33mforeground colors\e[m\n"
  printf "Values 40..47 are \e[43mbackground colors\e[m\n"
  printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

  # foreground colors
  for fgc in {30..37}; do
    # background colors
    for bgc in {40..47}; do
      fgc=${fgc#37} # white
      bgc=${bgc#40} # black

      vals="${fgc:+$fgc;}${bgc}"
      vals=${vals%%;}

      seq0="${vals:+\e[${vals}m}"
      printf "  %-9s" "${seq0:-(default)}"
      printf " ${seq0}TEXT\e[m"
      printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
    done
    echo; echo
  done
}
alias get-colors=colors