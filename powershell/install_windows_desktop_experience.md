POWERSHELL: INSTALL WINDOWS DESKTOP EXPERIENCE
======================================================

<!-- MarkdownTOC -->

- [Script Requirements](#script-requirements)
	- [ Reasoning](#-reasoning)
	- [Izenda Docs on the Topic](#izenda-docs-on-the-topic)
- [Testing the Problem and Solution](#testing-the-problem-and-solution)
- [Questions](#questions)
- [Snippets](#snippets)
	- [Querying for Windows Server Features using PowerShell ServerManager Module](#querying-for-windows-server-features-using-powershell-servermanager-module)
	- [Check if specific feature is enabled](#check-if-specific-feature-is-enabled)
	- [PowerShell Script to check for Feature Activation/ PowerShell Script to Activate Feature at Web Scope](#powershell-script-to-check-for-feature-activation-powershell-script-to-activate-feature-at-web-scope)
- [Links](#links)
- [Scripts](#scripts)
	- [Install Desktop Experience on all RDSH servers in a deployment](#install-desktop-experience-on-all-rdsh-servers-in-a-deployment)
	- [Get-PendingReboot - Query Computer(s) For Pending Reboot State](#get-pendingreboot---query-computers-for-pending-reboot-state)

<!-- /MarkdownTOC -->


## Script Requirements

Need a script to enable the feature `Desktop Experience` under the section `User Inferfaces and Infrastructure`

FIgured it would probably be written in Powershell, however I have very limited knowledge of it.

__Command (Server 2012)__

`Install-WindowsFeature Desktop-Experience`

__Command (Server 2008 R2)__

`Add-WindowsFeature Desktop-Experience`

----

Can also install via `DISM.exe`

`DISM.exe /Online /Enable-Feature /FeatureName:MicrosoftWindowsPowerShell`



###  Reasoning

Without the feature enabled, it's causing some of the images for Report Writer not to load. From my personal observation, the extent in which this happens can vary.

Image paths were verified to be correct .


### Izenda Docs on the Topic

__From Izenda: Chart Images Not Rendering In My Report Thumbnails__

> Microsoft has created a new WebDAV extension module that has been completely rewritten for Windows Server >2008, Windows Server 2008 R2, and Windows Server 2012. This new WebDAV extension module incorporates many new >features that enable web authors to publish content better than before

[Source](http://wiki.izenda.us/FAQ/chart-images-not-rendering)


## Testing the Problem and Solution

1. Verify the issue by opening a report with broken images - the one I found probably had the majority of them broken
2. Enable the `Desktop Experience` feature
3. Reboot the server
4. Update `Owner.psa_site_url` to point the external IP, instead of the internal one on the front-end server.
5. Cleared IIS and Memcached caches
6. Opened the same report and verified that the images now load


## Questions

1. How many checks needed - is there a possibility of significant variability in server setup for premise partners?
2. How do we resolve the front-end server?


## Snippets


### Querying for Windows Server Features using PowerShell ServerManager Module

[Source:](http://www.shirmanov.com/2011/01/querying-for-windows-server-features.html)

> PowerShell 2.0 introduced a new module containing useful cmdlets to managing Windows Server features - ServerManager. It is not loaded by default so we should import it manually.

> There are several snippets which demonstrates the ease of querying for Windows Server features:
> - loading ServerManager module
> - displaying all its exported Cmdlets
> - list all Windows Server features
> - list features in tabular manner using two most significant columns - DisplayName and Installed
> - list all installed Windows Server features
> - list all not installed Windows Server features
> - check whether or not Web-Server is installed


```PowerShell

# import ServerManager module
Import-Module servermanager

# list all available Cmdlets
$module = Get-Module servermanager
$module.ExportedCmdlets


# list all available Windows Server features
Get-WindowsFeature

# list all Windows Feature propeties
Get-WindowsFeature | Get-Member -MemberType Property

# now we see that there are two important properties to display: DisplayName and Installed


# list all available Windows Server features in simple table manner to see whether or not they are installed
Get-WindowsFeature | ft DisplayName, Installed

# list all INSTALLED Windows Server features
Get-WindowsFeature | where {$_.Installed -eq "True"} | ft DisplayName, Installed

# list all NOT installed Windows Server features
Get-WindowsFeature | where {$_.Installed -eq "False"} | ft DisplayName, Installed


# check whether or not Web-Server is installed
$webserver = Get-WindowsFeature Web-Server
Write-Host $webserver.Installed
if( $webserver.Installed -eq "True" ) {
    Write-Host "IIS is installed"
}

```


----


```PowerShell

$WSBackup = Get-WindowsFeature -ComputerName $computername -Name Windows-Server-Backup
Write-Host $WSBackup.Installed
if ( $WSBackup.Installed -eq "True" ) {
Write-host "Windows Backup is Installed"}
else {Add-WindowsFeature -ComputerName $computername -Name Windows-Server-Backup}

```



### Check if specific feature is enabled

Uses [Get-SPFeature](https://msdn.microsoft.com/en-us/library/ff607945.aspx)

```PowerShell

try
{
    Enable-SPFeature -Identity <FEATURE> -Url <SCOPE> -ErrorAction Stop
}
catch [System.Management.Automation.ActionPreferenceStopException]
{
    if( !($_.Exception -is [System.Data.DuplicateNameException]) )
    {
        #Its not a "feature is already activated at scope" exception
        throw
    }
    else
    {
        #Handle the "feature is already activated at scope" exception
    }
}

```

### PowerShell Script to check for Feature Activation/ PowerShell Script to Activate Feature at Web Scope


>Below PowerShell script will check for WebFeature with Feature id *********, is active or not,  in all the SiteCollections in a WebApplication.

If the feature is not active it will go and enable it.

Get-SPFeature will get list of all Features which as different scopes Farm, WebApplication, Site, Web

As we are interested in Activating feature with Web Scope at all webs hence we are using scope as -Web.

[Source:](http://soreddymanjunath.blogspot.in/2014/06/powershell-script-to-check-for-feature.html)



```PowerShell

clear

Add-PSSnapin "Microsoft.SharePoint.Powershell"

try
{
$web=Get-SPWebApplication "http://SP2013LocalDev/" | Get-spsite -Limit All | get-spweb -Limit All | % {

$bool=Get-SPFeature -Web $_ | where {$_.Id -eq "54944497-1d5b-443d-aba9-d20991ed18bb"}

                if(!$bool)
                {
                Enable-SPFeature -Identity "54944497-1d5b-443d-aba9-d20991ed18bb" -Url $_.Url
                Write-Host  "Feature Activated"
                }
      else
      {
      Write-Host "Feature is Active at" $_.Url
      }

   }

}
catch{
         $ErrorMessage = $_.Exception.Message
         Write-Host $web.Title  $ErrorMessage
    }

```



## Links

[More of a manual guide to installing the feature via terminal](http://blogs.technet.com/b/rmilne/archive/2013/07/11/install-desktop-experience-on-windows-server-2012.aspx)



## Scripts

### Install Desktop Experience on all RDSH servers in a deployment

> This script uses the new Server 2012 RDS Windows PowerShell cmdlets to install the Desktop Experience feature on every RD Session Host server in a Remote Desktop Services deployment.

[Source](https://gallery.technet.microsoft.com/scriptcenter/Install-Desktop-Experience-ae573c09/view/Discussions)


```PowerShell

# Install Desktop Experience on all RDSH servers in a deployment
#=======================================================#

# SOURCE:
# https://gallery.technet.microsoft.com/scriptcenter/Install-Desktop-Experience-ae573c09/view/Discussions


[CmdletBinding(SupportsShouldProcess=$true)]
param (
    [Parameter(Mandatory=$false)]
    [string]
    $ConnectionBroker,

    [Parameter(Mandatory=$false)]
    [switch]
    $Force
)

import-module ServerManager
import-module RemoteDesktop

# Fetch all RDSH servers in the deployment
$sessionHosts = Get-RDServer -Role RDS-RD-SERVER -ConnectionBroker $ConnectionBroker -ErrorAction Stop
if(-not $sessionHosts)
{
    Write-Error "No RD Session Host servers found in the deployment"
    return
}

$sessionHostsString = $sessionHosts.Server -Join ", "
Write-Verbose "Discovered session hosts: $sessionHostsString"

# Determine which ones don't have desktop experience installed
$toInstall = New-Object System.Collections.ArrayList
foreach($rdsh in $sessionHosts.Server)
{
    try
    {
        $desktopExp = Get-WindowsFeature -Name Desktop-Experience -ComputerName $rdsh -ErrorAction Stop

        if($desktopExp.Installed)
        {
            Write-Host "The Desktop Experience feature is already installed on $rdsh"
        }
        elseif($desktopExp.InstallState -ne [Microsoft.Windows.ServerManager.Commands.InstallState]::Available)
        {
            Write-Warning "Cannot install the Desktop Experience feature on $($rdsh): the feature does not appear to be available for installation, the InstallState is listed as '$($desktopExp.InstallState)' instead of 'Available'"
        }
        else
        {
            $toInstall.Add($rdsh.ToLower()) | Out-Null
        }
    }
    catch
    {
        Write-Warning "Cannot install the Desktop Experience feature on $($rdsh): error querying Desktop Experience feature: $_"
    }
}

if($toInstall.Count -eq 0)
{
    Write-Error "Cannot install the Desktop Experience feature: all RD Session Host servers either already have the feature installed or cannot install the feature."
    return
}

# If this server is an RD Session Host in the list, ensure it is at the end so that when we get rebooted we don't mess anything up.
if($toInstall.Count -gt 1)
{
    $localhost = [System.Net.Dns]::GetHostEntry([System.Net.Dns]::GetHostName()).HostName.ToLower()
    if($toInstall.Contains($localhost))
    {
        $toInstall.Remove($localhost)
        $toInstall.Add($localhost) | Out-Null
    }
}

# Prompt the user to ensure they want to install the feature on all of the detected RD Session Host servers
$toInstallString = $toInstall -Join ", "

$whatif = "The Desktop Experience feature will be installed on the following RD Session Host servers. Reboots will be performed if required. If this server is one of the RD Session Host servers, it will be the last server to be rebooted. RD Session Host servers: $toInstallString"

$message = "Are you sure you want to install the Desktop Experience feature on the following RD Session Host servers? Reboots will be performed if required. If this server is one of the RD Session Host servers, it will be the last server to be rebooted. RD Session Host servers: $toInstallString"

if(-not $PSCmdlet.ShouldProcess($whatif, $message, ""))
{
    return
}

if((-not $Force) -and (-not $PSCmdlet.ShouldContinue($message, "")))
{
    return
}

# Install the feature
foreach($rdsh in $toInstall)
{
    Write-Verbose "Installing Desktop-Experience on machine $rdsh"
    Install-WindowsFeature -Name Desktop-Experience -Restart -IncludeAllSubFeature -IncludeManagementTools -ComputerName $rdsh
}

```



### Get-PendingReboot - Query Computer(s) For Pending Reboot State

[Source:](https://gallery.technet.microsoft.com/scriptcenter/Get-PendingReboot-Query-bdb79542)

> This function gets the pending reboot status on a local or remote computer. Now supports SCCM 2012 Clients.
>
> 07/27/2015:
-Added Domain Join detection to PendComputerRename, DOES NOT currently detect Workgroup Join/Change.
-Fixed Bug where a computer rename was not detected in 2008 R2 and above if a domain join occurred at the same time.

> 07/21/2015:
> -This function no longer uses the .Net registry provider, it uses the StdRegProv WMI provider for more > flexibility when using the ComputerName parameter to connect remotely.
> -Added Pending Computer Rename - Detects whether or not a machine is pending a name change > requiring a reboot.
> -Fixed Bug where the CBServicing wasn't detected on Windows 10 and/or Windows Server Technical > Preview (2016)
>
> 06/2013:
> -SCCM Pending Reboot CCMClientSDK

> Initial Release:
> This function will query the registry on a local or remote computer and determine if the system is > pending a reboot, from either Microsoft Patching or a Software Installation. For Windows 2008 & above > the function will query the CBS registry key as another factor in determining pending reboot state.  > "PendingFileRenameOperations" and "Auto Update\RebootRequired" are observed as being consistant > across Windows Server 2003 & 2008.

> This function was featured on the Hey, Scripting Guy! Blog on June 10th/11th, 2013:
>
> http://blogs.technet.com/b/heyscriptingguy/archive/2013/06/10/determine-pending-reboot-status-> powershell-style-part-1.aspx
>
> http://blogs.technet.com/b/heyscriptingguy/archive/2013/06/11/determine-pending-reboot-status-> powershell-style-part-2.aspx
>
> You must load this "script" as a "function" by "dot sourcing" the .ps1 file, as in the following example:
> PS C:\> . .\Get-PendingReboot.ps1
> This example assumes the path to the Get-PendingReboot.ps1 file is relative to the current directory.
>
> Then the Function can be run:
> PS C:\> Get-PendingReboot -ComputerName WKS01, WKS02, SVR01, SVR02


----


```PowerShell

Function Get-PendingReboot
{
<#
.SYNOPSIS
    Gets the pending reboot status on a local or remote computer.

.DESCRIPTION
    This function will query the registry on a local or remote computer and determine if the
    system is pending a reboot, from either Microsoft Patching or a Software Installation.
    For Windows 2008+ the function will query the CBS registry key as another factor in determining
    pending reboot state.  "PendingFileRenameOperations" and "Auto Update\RebootRequired" are observed
    as being consistant across Windows Server 2003 & 2008.

    CBServicing = Component Based Servicing (Windows 2008)
    WindowsUpdate = Windows Update / Auto Update (Windows 2003 / 2008)
    CCMClientSDK = SCCM 2012 Clients only (DetermineIfRebootPending method) otherwise $null value
    PendFileRename = PendingFileRenameOperations (Windows 2003 / 2008)

.PARAMETER ComputerName
    A single Computer or an array of computer names.  The default is localhost ($env:COMPUTERNAME).

.PARAMETER ErrorLog
    A single path to send error data to a log file.

.EXAMPLE
    PS C:\> Get-PendingReboot -ComputerName (Get-Content C:\ServerList.txt) | Format-Table -AutoSize

    Computer CBServicing WindowsUpdate CCMClientSDK PendFileRename PendFileRenVal RebootPending
    -------- ----------- ------------- ------------ -------------- -------------- -------------
    DC01     False   False           False      False
    DC02     False   False           False      False
    FS01     False   False           False      False

    This example will capture the contents of C:\ServerList.txt and query the pending reboot
    information from the systems contained in the file and display the output in a table. The
    null values are by design, since these systems do not have the SCCM 2012 client installed,
    nor was the PendingFileRenameOperations value populated.

.EXAMPLE
    PS C:\> Get-PendingReboot

    Computer     : WKS01
    CBServicing  : False
    WindowsUpdate      : True
    CCMClient    : False
    PendComputerRename : False
    PendFileRename     : False
    PendFileRenVal     :
    RebootPending      : True

    This example will query the local machine for pending reboot information.

.EXAMPLE
    PS C:\> $Servers = Get-Content C:\Servers.txt
    PS C:\> Get-PendingReboot -Computer $Servers | Export-Csv C:\PendingRebootReport.csv -NoTypeInformation

    This example will create a report that contains pending reboot information.

.LINK
    Component-Based Servicing:
    http://technet.microsoft.com/en-us/library/cc756291(v=WS.10).aspx

    PendingFileRename/Auto Update:
    http://support.microsoft.com/kb/2723674
    http://technet.microsoft.com/en-us/library/cc960241.aspx
    http://blogs.msdn.com/b/hansr/archive/2006/02/17/patchreboot.aspx

    SCCM 2012/CCM_ClientSDK:
    http://msdn.microsoft.com/en-us/library/jj902723.aspx

.NOTES
    Author:  Brian Wilhite
    Email:   bcwilhite (at) live.com
    Date:    29AUG2012
    PSVer:   2.0/3.0/4.0/5.0
    Updated: 01DEC2014
    UpdNote: Added CCMClient property - Used with SCCM 2012 Clients only
       Added ValueFromPipelineByPropertyName=$true to the ComputerName Parameter
       Removed $Data variable from the PSObject - it is not needed
       Bug with the way CCMClientSDK returned null value if it was false
       Removed unneeded variables
       Added PendFileRenVal - Contents of the PendingFileRenameOperations Reg Entry
       Removed .Net Registry connection, replaced with WMI StdRegProv
       Added ComputerPendingRename
#>

[CmdletBinding()]
param(
  [Parameter(Position=0,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
  [Alias("CN","Computer")]
  [String[]]$ComputerName="$env:COMPUTERNAME",
  [String]$ErrorLog
  )

Begin {  }## End Begin Script Block
Process {
  Foreach ($Computer in $ComputerName) {
  Try {
      ## Setting pending values to false to cut down on the number of else statements
      $CompPendRen,$PendFileRename,$Pending,$SCCM = $false,$false,$false,$false

      ## Setting CBSRebootPend to null since not all versions of Windows has this value
      $CBSRebootPend = $null

      ## Querying WMI for build version
      $WMI_OS = Get-WmiObject -Class Win32_OperatingSystem -Property BuildNumber, CSName -ComputerName $Computer -ErrorAction Stop

      ## Making registry connection to the local/remote computer
      $HKLM = [UInt32] "0x80000002"
      $WMI_Reg = [WMIClass] "\\$Computer\root\default:StdRegProv"

      ## If Vista/2008 & Above query the CBS Reg Key
      If ([Int32]$WMI_OS.BuildNumber -ge 6001) {
        $RegSubKeysCBS = $WMI_Reg.EnumKey($HKLM,"SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\")
        $CBSRebootPend = $RegSubKeysCBS.sNames -contains "RebootPending"
      }

      ## Query WUAU from the registry
      $RegWUAURebootReq = $WMI_Reg.EnumKey($HKLM,"SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\")
      $WUAURebootReq = $RegWUAURebootReq.sNames -contains "RebootRequired"

      ## Query PendingFileRenameOperations from the registry
      $RegSubKeySM = $WMI_Reg.GetMultiStringValue($HKLM,"SYSTEM\CurrentControlSet\Control\Session Manager\","PendingFileRenameOperations")
      $RegValuePFRO = $RegSubKeySM.sValue

      ## Query ComputerName and ActiveComputerName from the registry
      $ActCompNm = $WMI_Reg.GetStringValue($HKLM,"SYSTEM\CurrentControlSet\Control\ComputerName\ActiveComputerName\","ComputerName")
      $CompNm = $WMI_Reg.GetStringValue($HKLM,"SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName\","ComputerName")
      If ($ActCompNm -ne $CompNm) {
    $CompPendRen = $true
      }

      ## If PendingFileRenameOperations has a value set $RegValuePFRO variable to $true
      If ($RegValuePFRO) {
        $PendFileRename = $true
      }

      ## Determine SCCM 2012 Client Reboot Pending Status
      ## To avoid nested 'if' statements and unneeded WMI calls to determine if the CCM_ClientUtilities class exist, setting EA = 0
      $CCMClientSDK = $null
      $CCMSplat = @{
    NameSpace='ROOT\ccm\ClientSDK'
    Class='CCM_ClientUtilities'
    Name='DetermineIfRebootPending'
    ComputerName=$Computer
    ErrorAction='Stop'
      }
      ## Try CCMClientSDK
      Try {
    $CCMClientSDK = Invoke-WmiMethod @CCMSplat
      } Catch [System.UnauthorizedAccessException] {
    $CcmStatus = Get-Service -Name CcmExec -ComputerName $Computer -ErrorAction SilentlyContinue
    If ($CcmStatus.Status -ne 'Running') {
        Write-Warning "$Computer`: Error - CcmExec service is not running."
        $CCMClientSDK = $null
    }
      } Catch {
    $CCMClientSDK = $null
      }

      If ($CCMClientSDK) {
    If ($CCMClientSDK.ReturnValue -ne 0) {
      Write-Warning "Error: DetermineIfRebootPending returned error code $($CCMClientSDK.ReturnValue)"
        }
        If ($CCMClientSDK.IsHardRebootPending -or $CCMClientSDK.RebootPending) {
      $SCCM = $true
        }
      }

      Else {
    $SCCM = $null
      }

      ## Creating Custom PSObject and Select-Object Splat
      $SelectSplat = @{
    Property=(
        'Computer',
        'CBServicing',
        'WindowsUpdate',
        'CCMClientSDK',
        'PendComputerRename',
        'PendFileRename',
        'PendFileRenVal',
        'RebootPending'
    )}
      New-Object -TypeName PSObject -Property @{
    Computer=$WMI_OS.CSName
    CBServicing=$CBSRebootPend
    WindowsUpdate=$WUAURebootReq
    CCMClientSDK=$SCCM
    PendComputerRename=$CompPendRen
    PendFileRename=$PendFileRename
    PendFileRenVal=$RegValuePFRO
    RebootPending=($CompPendRen -or $CBSRebootPend -or $WUAURebootReq -or $SCCM -or $PendFileRename)
      } | Select-Object @SelectSplat

  } Catch {
      Write-Warning "$Computer`: $_"
      ## If $ErrorLog, log the file to a user specified location/path
      If ($ErrorLog) {
    Out-File -InputObject "$Computer`,$_" -FilePath $ErrorLog -Append
      }
  }
  }## End Foreach ($Computer in $ComputerName)
}## End Process

End {  }## End End

}## End Function Get-PendingReboot

```


