cd C:\Users\champuser\Desktop

clear

Get-EventLog -List

$exportLog = Read-Host -Prompt "Please select a Log to Export"

Get-EventLog -LogName $exportLog -Newest 3 | Export-Csv -NoTypeInformation -Path "C:\Users\champuser\Desktop\rep.csv"