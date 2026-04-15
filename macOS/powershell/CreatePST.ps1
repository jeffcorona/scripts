$module = "ExchangeOnlineManagement"

$version = (Get-InstalledModule $module | Select-Object -Property version | Select-Object -ExpandProperty version)


#verify that module is installed
if ($version -ge 3)
{
    write-host "ExchangeOnlineManagement is installed"
    Connect-IPPSSession -EnableSearchOnlySession
}
else {
    write-host "ExchangeOnlineManagement is not installed"
    Write-Host "Installing module...."
    Install-Module $module
    Connect-IPPSSession -EnableSearchOnlySession
}


#get user info
$employee = read-Host ("Please enter the username you want to search. Do not enter domain name!")
$mailbox = "$employee@avantiwindow.com"
$case = read-host "Please enter a case name"
$name = read-host "Please enter a name for the search query"

 #create case and search
New-ComplianceCase -Name $case
Write-Host "Creating compliance search '$name' for mailbox $mailbox ..."
New-ComplianceSearch -Name $name -Case $case -ExchangeLocation $mailbox | Out-Null
Start-Sleep -Seconds 5

#start search
Start-ComplianceSearch -Identity $name