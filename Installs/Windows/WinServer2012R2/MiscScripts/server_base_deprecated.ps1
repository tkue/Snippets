# Set chocolately to accept all packages (e.g. same as passing -y option)
choco feature enable -n=allowGlobalConfirmation
# choco feature enable -n=allowEmptyChecksum
#cups all -y

# Initial Windows Setup 
Install-WindowsUpdate -AcceptEula 
if(Test-PendingReboot){Invoke-Reboot}
Install-WindowsUpdate -AcceptEula -Full

Update-ExecutionPolicy Unrestricted
Enable-RemoteDesktop

# Options
Disable-InternetExplorerESC
Disable-MicrosoftUpdate
Disable-UAC
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst

# Frameworks
cinst PowerShell -source windowsfeatures
cinst DotNet4.0 -source windowsfeatures
cinst DotNet4.5 -source windowsfeatures
cinst DotNet5.0 -source windowsfeatures
# cinst mono

# Windows Features
# cinst IIS-WebServerRole -source windowsfeatures
# cinst TelnetClient -source windowsFeatures
# cinst IIS-HttpCompressionDynamic -source windowsfeatures
# cinst IIS-ManagementScriptingTools -source windowsfeatures
# cinst IIS-WindowsAuthentication -source windowsfeatures


cinst googlechrome
cinst firefox
cinst 7zip.install

# Unlocker
# http://update.iobit.com/dl/unlocker-setup.exe
Install-ChocolateyPackage 'unlocker-setup' 'exe' '/passive /norestart' 'http://update.iobit.com/dl/unlocker-setup.exe'



# Development
cinst git.install

cinst nugetpackagemanager
cinst nuget.commandline

cinst sublimetext3
cinst sublimetext3.packagecontrol
cinst openinsublimetext # Adds a menu command that lets you open any solution, project, folder and file in Sublime Text.
cinst sublimetext3.powershellalias # add powershell subl command 

cinst python3
cinst python2
cinst pip
cinst pywin32
cinst ironpython
cinst python.pypy

if(Test-PendingReboot){Invoke-Reboot}

# SSMS
# http://download.microsoft.com/download/4/7/2/47218E85-5903-4EF4-B54E-3B71DD558017/SSMS-Setup-ENU.exe
Install-ChocolateyPackage 'SSMS-Setup-ENU' 'exe' '/passive /norestart' 'http://download.microsoft.com/download/4/7/2/47218E85-5903-4EF4-B54E-3B71DD558017/SSMS-Setup-ENU.exe'
if(Test-PendingReboot){Invoke-Reboot}

# Visual Studio 
# TODO: More specific install (based on ISO?)
cinst visualstudio2015professional
if(Test-PendingReboot){Invoke-Reboot}


Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"

