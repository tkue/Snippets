
#Requires -RunAsAdministrator
param([String]$mode="start")

$mode = $mode.Trim().ToLower()

$services = (
    "MSSQLSERVER",
    "MSSQLLaunchpad",
    "SQLBrowser",
    "SQLSERVERAGENT",
    "SQLServerReportingServices",
    "SQLTELEMETRY",
    "SQLWriter",
    "MSSQLFDLauncher"
)

Function IsAdmin()
{  
    # $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    # (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
    return [bool](([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
}

Function GetServiceStatus($serviceName)
{
    return Get-Service | Where Name -eq "${serviceName}" | Select Status
}

Function StartStopSqlServerServices($mode)
{
    Foreach ($service in $services)
    {
        Write-Output "${service}"
        Try
        {
            
            Write-Output "Service: $service"

            # $cmd = 'Start-Service "$service"'
            # Start-Process "$psHome\powershell.exe" -Verb Runas -ArgumentList '-command $cmd'
            
            if ($mode -eq "start")
            {
                Start-Service "$service"
            }
            elseif ($mode -eq "stop")
            {
                Stop-Service "$service"
            }
            elseif ($mode -eq "status")
            {
                Get-CimInstance win32_service | Where-Object Name -eq "$service"
            }
            else
            {
                Write-Output "Unrecogized mode: '$mode'" 
            }
            
        }
        Catch
        {
            Write-Output "_.Exception"
        }
    }
}

$StartStopSqlServerServices

# Write-Output "$IsAdmin"
# Write-Output (([System.Security.Principal.WindowsIdentity]::GetCurrent()).groups -match "S-1-5-32-544")
