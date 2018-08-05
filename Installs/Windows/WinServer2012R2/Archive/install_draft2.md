README & DOCS
=============

<!-- MarkdownTOC -->

- [Overview](#overview)
- [Naming Conventions and Install Order](#naming-conventions-and-install-order)
- [Applications to Get](#applications-to-get)
	- [Generic](#generic)
- [Windows Settings to Change](#windows-settings-to-change)
- [Maybe](#maybe)

<!-- /MarkdownTOC -->


## Overview


## Naming Conventions and Install Order


## Applications to Get


### Generic

`Chocolately assumed to be installed by default`

choco instal -y googlechrome firefox Notepadpluplus.install 7zip git ccleaner sysinternals putty python wireshark wget aria2 fiddler4 teamviewer windirstat tortoisegit gitextensions pip linqpad4 sublimetext3 dotpeek beyondcompare Eclipse teracopy windbg ditto revo uninstaller nugetpackagemanager smtp4dev hw


## Chocolately Packages 


```powershell

# ======================================================
# (Optional)
# ======================================================

# cinst itunes
# cinst tor-browser
# cinst f.lux
# cinst openvpn

# ======================================================
# Environment-Specific 
# ======================================================

cinst vboxguestadditions.install

# ======================================================
# Office
# ======================================================
# TODO:
# 	- Need to install trials of:
# 		+ Office Professional Plus 2016 (30 days)
# 		+ Office Professional Plus 2013 (60 days or maybe 180)
# 	- Or:
# 		+ Use CW Office 2010 Install with License on VHD (should have ISO somewhere too)


# ======================================================
# Everyday Tools 
# ======================================================

cinst googlechrome
cinst firefox
cinst 7zip.install
# cinst peazip
cinst flashplayerplugin 	# ? 
cinst foxitreader


# ======================================================
# Remote Access 
# ======================================================
cinst teamviewer
# VNC, SplashTop, Parallels 
# BitVise SSH server 


# ======================================================
# Cloud Storage and Syncing 
# ======================================================
cinst dropbox
cinst onedrive

# ======================================================
# Development
# ======================================================
cinst nodejs.install
cinst git.install
cinst tortoisegit
cinst dotpeek
cinst microsoft-build-tools
# cinst syncthing-gtk

# ======================================================
# Text Editiors and IDE's 
# ======================================================
cinst notepadplusplus.install
cinst pycharm 	# PyCharm Professional 
cinst eclipse		# 4.5.1
cinst linqpad4

# Intellij
cinst intellijidea-ultimate
#cinst intellijidea-community

# Visual Studio 
cinst visualstudio2015professional # With updates
#cinst visualstudio2015community

# cinst powergui
# cinst resharper-platform 	# Re-Sharper Ultimate


# ======================================================
## Database
# ======================================================
# 
# TODO: 
#		- Latest SQL Server ISO with install script 
#		- Install SSMS 2016
# 		- Install SSDT 2016
#		- Install Extensions 
#			+ SQL Complete 
#				> Just install entire SQL Toolbelt? 
#			+ Apex: (1) SQL Complete; (2) SQL Search; (3) Refractor
#

cinst tsqlflex # SSMS add-in for scripting and Excel export.

#cinst mongodb


# ======================================================
## Sublime Text
# ======================================================
# TODO: Download/sync configuration  
cinst sublimetext3
cinst sublimetext3.packagecontrol
cinst openinsublimetext # Adds a menu command that lets you open any solution, project, folder and file in Sublime Text.
cinst sublimetext3.powershellalias # add powershell subl command 



# ======================================================
# System Utilities 
# ======================================================
# TODO:
#	- Telerik JustDecompile (already have DotPeek, though)
# 	- Need to get Unlocker (only have LockHunter available)
cinst lockhunter

cinst ccleaner
cinst ccenhancer # Enhances ccleaner 
cinst sysinternals
cinst procexp
cinst nugetpackagemanager
cinst nuget.commandline
cinst putty
cinst curl
cinst meld
cinst wget
cinst pstools # useful tools 
cinst Autoruns # see what programs are running 

cinst cygwin	# TODO: Need to automatically install desired packages
				# >> Can probably do with cyg-get 
				# 		e.g. You may provide a single package name or a comma 
				#			separated list of package names to install.
				#
				#				e.g. cyg-get openssh or cyg-get git gitk git-completion
cinst cyg-get 

cinst webpicmd # The Microsoft Web Platform Installer (Web PI) Command Line v5
cinst teracopy
cinst bginfo
cinst logparser
cinst nxlog 
cinst astrogrep
cinst grepwin
cinst carbon # Suite of Powershell scripts for automation 
cinst revo.uninstaller
cinst hashcheck
cinst sandboxie.install
cinst ilspy # ? 
cinst dnspy # ? 

# Manager for remote connections? 
# cinst rdcman
# mremote 
# or just create RDP files 


#cinst console2 	# Console2 is a Windows console window enhancement. 
			# Console features include: multiple tabs, text editor-like text selection, 
			# different background types, alpha and color-key transparency, configurable font, 
			# different window styles

cinst consolez	# This is a modified version of Console 2 for a better experience under 
			# Windows Vista/7/8/10 and a better visual rendering.


cinst pscx	# PowerShell Community Extensions (PSCX) 
			# is aimed at providing a widely useful set of additional 
			# cmdlets, providers, aliases, filters, functions and scripts 
			# for Windows PowerShell that members of the community have expressed interest in.



# ======================================================
# Security 
# ======================================================

# cinst microsoftsecurityessentials

# cinst AntiVirus
# cinst avastfreeantivirus
# cinst clamwin


# ======================================================
## Monitoring
# ======================================================

# cinst zabbix-agent

# ======================================================
# Git
# ======================================================
cinst git.install		# Should come with msysgit (that package is now deprecated)
cinst gitextensions
cinst poshgit 	# Provides git/powershell integration 
			# 	> May want to just stick with MySysGit || Cygwin ? 

# ======================================================
# Network Utils 
# ======================================================

cinst wireshark
cinst fiddler4
cinst winpcap
# cinst nmap

# ======================================================
# Frameworks
# ======================================================

cinst powershell
cinst dotnet4.5
cinst jdk8
# cinst mono
# cinst openssl.light

# ======================================================
# Java
# ======================================================
cinst maven
cinst ant
cinst gradle

# ======================================================
# Python
# ======================================================
cinst python3
cinst python2
cinst pip
cinst pywin32
cinst ironpython
cinst python.pypy



```




## Windows Settings to Change

- `?` Set-ExecutionPolicy Unretricted
- Turn off Internet Explorer protect mode
- Prevent UAC and give admin less nagging popups
- Configure
	+ Firewall (with TinyWall)
	+ `?` Anti-virus (ClamAV)
	+ Netorking and VPN
	+ Add appropriate users





------------------------ jdk
- dotnet 3/latest
- python
- rdcman
	+ or mremoteng
- unlocker
- astrogrep
- visual studio
	+ community or pro or ultimate
	+ maybe with ReSharper
	+ and maybe with Telrik package
- regate products
	+ free and non-free








## Maybe

- atom
- dropbox
- malwarebytes anti-malware
- boxstarter
- cygwin
- vagrant
- puppet
- chef
- foxit reader
- powershell community extensions
- pswindowsupdate
- nmap
- nsis.install
- webdeploy
- brackets
- firefoxesr
- f.lux
- explorer alt
	+ total commander
- nxlog
- pandoc
- everything
>"	Everything" is an administrative tool that locates files 	and folders by filename instantly for Windows.
> 	Unlike Windows search "Everything" initially displays 		every file and folder on your computer (hence the name "	Everything").

- imgburn
- decompiler(s)
	+ DotPeek
	+ JustDecompile
- ILSpy
- Virtual Machines
	+ VirtualBox
	+ VMWare
	+ HyperV
- powergui
- golang
- grepwin
- ccenhancer
	> Enhancements for CCleaner

- zabbix-agent
- autohotkey_l
- openvpn
- packer
- logparser
> Log parser is a powerful, versatile tool that provides universal query access to text-based data such as log files, XML files and CSV files, as well as key data sources on the Windows® operating system such as the Event Log, the Registry, the file system, and Active Directory®. You tell Log Parser what information you need and how you want it proce

- stylecop
> StyleCop analyzes C# source code to enforce a set of style and consistency rules. It can be run from inside of Visual Studio or integrated into an MSBuild project. StyleCop has also been integrated into many third-party development tools.| Please install with chocolatey (http://nuget.org/List/Packages/chocolatey).

- directorymonitor
- autoruns
- linkshellextension
> Link Shell Extension (LSE) provides for the creation of Hardlinks , Junctions , Volume Mountpoints , and Windows7/8's Symbolic Links, (herein referred to collectively as Links) a folder cloning process that utilises Hardlinks or Symbolic Links and a copy process taking care of Junctions, Symbolic Links, and Hardlinks. LSE, as its name implies is im...

- spybot
	+ search and destroy
- Intellij
- DataGrip
- PyCharm
- drmemory.install
- boxstarter
- rufus
- BleachBit
- SandBoxie
- UNetbootin
- Syncthing
- SparkleShare
- hashcheck
- speedfan
- onedrive
- baregrep
- processhacker
- rsync
- windows essentials
- aptana studio
- tunnlier
- monodevelop
- vmware-horizon-client
