Overview of Bootstrapping Installation for Windows Server 2012 R2
=================================================================

<!-- TOC START min:1 max:3 link:true update:true -->
  - [Install Operating System](#install-operating-system-)
    - [Keys](#keys-)
  - [Download Boxstarter](#download-boxstarter-)
  - [Examples: Windows Install](#examples-windows-install-)
  - [Official Documentation](#official-documentation-)
  - [Official Docs: WinConfig Options](#official-docs-winconfig-options-)

<!-- TOC END -->

## Install Operating System

### Keys

__Windows Server 2012 R2 Standard__

> - 49NWH-6KB2J-93R8T-GTXQJ-PJ98M
> - Q7D3T-KN9YM-CGVVR-GWTWX-66K8M
> - 6RNQD-4GW22-B24HV-DKKX3-WQJFY
> - T4TNY-GJ7TR-VC7P8-XHMF3-C36PB
> - 6QWNF-DVY6X-PTK46-CDJKV-6XWFY

__Windows Server 2012 R2 Datacenter__
> - DNKPP-VH383-GYXTB-F48VG-CGXCM
> - 38BQK-NXTDR-PBYDV-6BT38-Q68GB
> - NWK69-89B77-G62XJ-7KHD8-CPM6B
> - W9K2N-2M92J-K6PXQ-92QVD-MDVJY
> - MRMFP-QNHKT-Q3V9B-XJ3XM-CWDWY

<br>

## Download Boxstarter

`TODO`
> Automate download and install

[http://boxstarter.org/downloads/Boxstarter.2.8.29.zip](http://boxstarter.org/downloads/Boxstarter.2.8.29.zip)

1. Unzip
2. Run setup.bat

> This will install Boxstarter and Chocolately


## Examples: Windows Install

```powershell
Install-WindowsUpdate -AcceptEula
cinst Microsoft-Hyper-V -source windowsfeatures
cinst Microsoft-Hyper-V-Management-PowerShell -source windowsfeatures
```
[Source](https://gist.githubusercontent.com/mwrock/8066325/raw/e0c830528429cd68a8c71dbff6f48298576d8d20/gistfile1.txt)


```powershell
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst
Install-WindowsUpdate -acceptEula
```
[Source](https://gist.github.com/phillip-haydon/b7dec246f0ad953ad65c)

<br>


`FileName: 01-Update-Windows.ps1`
```powershell
# http://boxstarter.org/package/url?

#####################
# BEGIN CONFIGURATION
#####################

#region Initial Windows Config

    Install-WindowsUpdate -AcceptEula
    Update-ExecutionPolicy Unrestricted
    Set-ExplorerOptions -showFileExtensions
    Enable-RemoteDesktop

#endregion

#region Add some windows extras
    cinst IIS-WebServerRole -source windowsfeatures
    cinst TelnetClient -source windowsFeatures
    cinst IIS-HttpCompressionDynamic -source windowsfeatures
    cinst IIS-ManagementScriptingTools -source windowsfeatures
    cinst IIS-WindowsAuthentication -source windowsfeatures
#endregion


# Let's get the latest version of powershell and .net frameworks
cinstm PowerShell
cinstm DotNet4.0
cinstm DotNet4.5
cinstm mono
```

<br>

`Filename: 02-Dev-PC.ps1`
```powershell
# http://boxstarter.org/package/url?

    # Screenshot tool
    cinstm greenshot

    # It's nice to be able to browse NuGet files if necessary
    cinstm NugetPackageExplorer

    # If we're doing web development, we need a few browsers
    cinstm GoogleChrome
    cinstm Firefox
    cinstm Opera

    # Don't quite know why this is important, but I'll install silverlight and java runtime anyways
    cinstm Silverlight
    cinstm javaruntime

    # Gotta have Fiddler
    cinstm fiddler4

    # Editors and merge tools
    cinstm notepadplusplus.install
    cinstm nano
    cinst sublimetext2

    # Without Git, we might as well go home.
    cinstm poshgit
    cinstm git-credential-winstore -Version 1.2.0.0

    # Life sux without Visual Studio and the awesome extensions
    cinstm VisualStudio2012Professional

    # Get rid of upper case menu in Visual Studio
    Set-ItemProperty -Path HKCU:\Software\Microsoft\VisualStudio\11.0\General -Name SuppressUppercaseConversion -Type DWord -Value 1

    # Run Visual Studio Update
    if((Get-Item "$($Boxstarter.programFiles86)\Microsoft Visual Studio 11.0\Common7\IDE\devenv.exe").VersionInfo.ProductVersion -lt "11.0.60115.1") {
        if(Test-PendingReboot){Invoke-Reboot}
        Install-ChocolateyPackage 'vs update 2 ctp2' 'exe' '/passive /norestart' 'http://download.microsoft.com/download/8/9/3/89372D24-6707-4587-A7F0-10A29EECA317/vsupdate_KB2707250.exe'
    }

    # VS related extras
    cinstm resharper

    # Fix SSH-Agent error by adding the bin directory to the `Path` environment variable
    $env:PSModulePath = $env:PSModulePath + ";C:\Program Files (x86)\Git\bin"

    # Markdown is how documentation becomes awesomenes
    # Unfortunately I'm installing this at the end because it doesn't seem to work unattended... it requires the user to press "ok"
    cinstm MarkdownPad2 -installargs "/exelang 1033"

    # VPN Client
    # cinstm ShrewSoftVpn

    # Sql Server
    cinst SqlServer2012Express
```

[Source](https://gist.github.com/ChaseFlorell/7832733)

<br>

## Official Documentation

    First. Install Boxstarter.  The easiest way to do this is to install Boxstarter.Chocolatey from Chocolatey
    or download the zip from the CodePlex site and run the setup.bat. This installs all dependent modules and
    puts them in your user module path.

    Next create a package, build it and deploy your repository to b consumed from anywhere in your network
    or even a thumb drive. Like this:

```powershell
#After extracting Boxstarter.1.0.0.zip on MYCOMPUTER
.\setup.bat
Import-Module $env:appdata\boxstarter\Boxstarter.Chocolatey\Boxstarter.Chocolatey.psd1
#Create minimal nuspec and chocolateyInstall
New-BoxstarterPackage MyPackage
#Edit Install script to customize your environment
Notepad Join-Path $Boxstarter.LocalRepo "tools\ChocolateyInstall.ps1"
#Pack nupkg
Invoke-BoxstarterBuild MyPackage

#share Repo
Set-BoxstarterShare
#Or Copy to thumb drive G
Copy-Item $Boxstarter.BaseDir G:\ -Recurse

#Logon to your bare Windows install
\\MYCOMPUTER\Boxstarter\Boxstarter Mypackage

#Enter password when prompted and come back later to find all your apps installed
```

    Now lets look at what an install package might look like

```powershell
Install-WindowsUpdate -AcceptEula
Update-ExecutionPolicy Unrestricted
Move-LibraryDirectory "Personal" "$env:UserProfile\skydrive\documents"
Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-TaskbarSmall
Enable-RemoteDesktop

cinstm VisualStudioExpress2012Web
cinstm fiddler
cinstm mssqlserver2012express
cinstm git-credential-winstore
cinstm console-devel
cinstm skydrive
cinstm poshgit
cinstm windbg

cinst Microsoft-Hyper-V-All -source windowsFeatures
cinst IIS-WebServerRole -source windowsfeatures
cinst IIS-HttpCompressionDynamic -source windowsfeatures
cinst IIS-ManagementScriptingTools -source windowsfeatures
cinst IIS-WindowsAuthentication -source windowsfeatures
cinst TelnetClient -source windowsFeatures

Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\mstsc.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"

copy-item (Join-Path (Get-PackageRoot($MyInvocation)) 'console.xml') -Force $env:appdata\console\console.xml

Install-ChocolateyVsixPackage xunit http://visualstudiogallery.msdn.microsoft.com/463c5987-f82b-46c8-a97e-b1cde42b9099/file/66837/1/xunit.runner.visualstudio.vsix
Install-ChocolateyVsixPackage autowrocktestable http://visualstudiogallery.msdn.microsoft.com/ea3a37c9-1c76-4628-803e-b10a109e7943/file/73131/1/AutoWrockTestable.vsix
```

<br>

----
[Source](http://www.hurryupandwait.io/blog/easily-script-machine-reinstalls-with-boxstarter)

<br>

## Official Docs: WinConfig Options

__Disable-InternetExplorerESC__
> Turns off Internet Explorer Enhanced Security Configuration that is on by default on Server OS versions.

__Disable-GameBarTips__
> Turns off the GameBar Tips of Windows 10 that are shown when a game - or what Windows 10 thinks is a game - is launched.

__Disable-MicrosoftUpdate__
> Turns off the Windows Update option to include updates for other Microsoft products installed on the system.

__Disable-UAC__
> Disables UAC. Note that Windows 8 and 8.1 can not launch Windows Store applications with UAC disabled.

__Disable-BingSearch__
> Disables the Bing Internet Search when searching from the search field in the Taskbar or Start Menu.

__Enable-RemoteDesktop__
> Allows Remote Desktop access to machine and enables Remote Desktop firewall rule.

__Enable-MicrosoftUpdate__
> Turns on the Windows Update option to include updates for other Microsoft products installed on the system.

__Enable-UAC__
> Enables UAC.

__Install-WindowsUpdate__
> Finds, downloads and installs all Windows Updates. By default, only critical updates will be searched.
> However the command takes a -Criteria argument allowing one to pass a custom Windows Update query.
> For details about the Install-WindowsUpdate command, run:

```powershell
Help Install-WindowsUpdate -Full
```

__Move-LibraryDirectory__
>Libraries are special folders that map to a specific location on disk. These are usually found somewhere under $env:userprofile. This function can be used to redirect the library folder to a new location on disk. If the new location does not already exist, the directory will be created. Any content in the former library directory will be moved to the new location unless the DoNotMoveOldContent switch is used. Use Get-LibraryNames to discover the names of different libraries and their current physical directories.

```powershell
Move-LibraryDirectory "Personal" "$env:UserProfile\skydrive\documents"
```

>This moves the Personal library (aka Documents) to the documents folder off of the default SkyDrive directory.


__Set-StartScreenOptions__
> Sets options for the Start Screen in Windows 8/8.1

```powershell
Set-StartScreenOptions -EnableBootToDesktop -EnableDesktopBackgroundOnStart -EnableShowStartOnActiveScreen -EnableShowAppsViewOnStartScreen -EnableSearchEverywhereInAppsView -EnableListDesktopAppsFirst
```

> It is also possible to do the converse actions, if required.

```powershell
Set-StartScreenOptions -DisableBootToDesktop -DisableDesktopBackgroundOnStart -DisableShowStartOnActiveScreen -DisableShowAppsViewOnStartScreen -DisableSearchEverywhereInAppsView -DisableListDesktopAppsFirst
```

__Set-CornerNavigationOptions__
> Sets options for the Windows Corner Navigation in Windows 8/8.1

```powershell
Set-CornerNavigationOptions -EnableUpperRightCornerShowCharms -EnableUpperLeftCornerSwitchApps -EnableUsePowerShellOnWinX
```

> It is also possible to do the converse actions, if required.

```powershell
Set-CornerNavigationOptions -DisableUpperRightCornerShowCharms -DisableUpperLeftCornerSwitchApps -DisableUsePowerShellOnWinX
```


__Set-WindowsExplorerOptions__
> Sets options on the Windows Explorer shell

```powershell
Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -EnableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder
```

> It is also possible to do the converse actions, if required.

```powershell
Set-WindowsExplorerOptions -DisableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles -DisableShowFileExtensions -DisableShowFullPathInTitleBar -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -DisableExpandToOpenFolder
```

__Set-TaskbarOptions__
> Sets options on the Windows Taskbar

```powershell
Set-TaskbarOptions -Size Small -Lock -Dock Top -Combine Always
```

> It is also possible to do the converse actions, if required.

```powershell
Set-TaskbarOptions -Size Large -UnLock -Dock Bottom -Combine Never
```

__Update-ExecutionPolicy__
> The execution policy is set in a separate elevated PowerShell process.
> If running in the Chocolatey runner, the current window cannot be used because its execution policy has been explicitly set.
>
> If on a 64 bit machine, the policy will be set for both 64 and 32 bit shells.

<br>

----
[Source](http://boxstarter.org/WinConfig)
