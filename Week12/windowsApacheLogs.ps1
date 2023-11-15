clear


Get-Content C:\xampp\apache\logs\access.log

Write-Host "List 5 apache logs of xampp"
Get-Content C:\xampp\apache\logs\access.log -Tail 5

Write-Host "Logs that contain 404 or 400"
Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 404 ', ' 400 '

Write-Host "Logs that do not contaion 200"
$B = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern ' 200 ' -NotMatch
$B

Write-Host "Last 5 Logs that contain the word 'error'"
$A = Get-Content C:\xampp\apache\logs\*.log | Select-String -Pattern 'error'
$A[-5..-1]

Write-Host "IP Addresses from Logs that do not contain 200"
$regex = [regex] `
"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)"
$ips = $regex.Matches($B) | select @{Name="IP"; Expression={ $_.value }}
$ips | select IP | Out-String

Write-Host "Count of the IPs"
$counts = $ips | Group-Object IP -NoElement
$counts | select Count, Name | Out-string

$countsDetailed = $counts | Select-Object Count, Name, `
@{Name="Decision"; Expression={ if($_.Count -gt 3) {"Abnormal"} `
                                else {"Normal"}
                                }}
$countsDetailed | select Count, Name, Decision | Out-String

foreach($ip in $countsDetailed){

    if([string]$ip.Decision -ilike "Abnormal"){
    Write-Host "Blocking $ip.Name"
    New-NetFirewallRule -DisplayName "Bad IPs $ip.Name" `
    -Direction Inbound -Action Block -RemoteAddress $ip.Name
    }

}

Remove-NetFirewallRule -DisplayName "Bad IPs *"