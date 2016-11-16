choco feature enable -n=allowGlobalConfirmation

# Initial Windows Setup
Install-WindowsUpdate -AcceptEula -Full
Update-ExecutionPolicy Unrestricted
Enable-RemoteDesktop
Disable-InternetExplorerESC
Disable-MicrosoftUpdate
Disable-UAC
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst
# Frameworks
cinst PowerShell -source windowsfeatures
cinst DotNet4.0 -source windowsfeatures
cinst DotNet4.5 -source windowsfeatures

# Apps
cinst firefox
cinst 7zip.install

cinst dropbox
cinst onedrive

cinst sublimetext3
cinst sublimetext3.packagecontrol
cinst openinsublimetext # Adds a menu command that lets you open any solution, project, folder and file in Sublime Text.
cinst sublimetext3.powershellalias # add powershell subl command
cinst notepadplusplus.install

cinst sysinternals
cinst nugetpackagemanager
cinst nuget.commandline
cinst curl
cinst wget
cinst pstools
cinst teracopy
cinst logparser
cinst nxlog
cinst astrogrep
cinst git.install
cinst python3
cinst python2
cinst pip
cinst pywin32
cinst ironpython
cinst python.pypy