# Set chocolately to accept all packages (e.g. same as passing -y option)
choco feature enable -n=allowGlobalConfirmation
#cups all -y

# Initial Windows Setup 
Install-WindowsUpdate -AcceptEula -Full
Update-ExecutionPolicy Unrestricted
Enable-RemoteDesktop

# Options
Disable-InternetExplorerESC
Disable-MicrosoftUpdate
Disable-UAC
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst

# Windows Features
cinst IIS-WebServerRole -source windowsfeatures
cinst TelnetClient -source windowsFeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures

# Frameworks
cinst PowerShell -source windowsfeatures
cinst DotNet4.0 -source windowsfeatures
cinst DotNet4.5 -source windowsfeatures
cinst mono


# ======================================================
# ======================================================
# ======================================================


# ======================================================
# ======================================================
# Install Applications
# ======================================================
# ======================================================


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

# --------------------------
# Intellij
# --------------------------
cinst intellijidea-ultimate
#cinst intellijidea-community

# --------------------------
# Visual Studio 
# --------------------------
cinst visualstudio2015professional # With updates
#cinst visualstudio2015community

# Run Visual Studio Update
if((Get-Item "$($Boxstarter.programFiles86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe").VersionInfo.ProductVersion -lt "11.0.60115.1") {
    if(Test-PendingReboot){Invoke-Reboot}
    Install-ChocolateyPackage 'vs update 2 ctp2' 'exe' '/passive /norestart' 'http://download.microsoft.com/download/8/9/3/89372D24-6707-4587-A7F0-10A29EECA317/vsupdate_KB2707250.exe'
}

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
cinst poshgit 	        # Provides git/powershell integration 
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

#cinst powershell
#cinst dotnet4.5
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



# Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"