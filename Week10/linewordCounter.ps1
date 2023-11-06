$FilesToLookAt = Get-ChildItem -Recurse -Filter "*.bash"

$filesInfo = @()

for ($i=0; $i -lt $FilesToLookAt.Length; $i++){
#Get-Content $FilesToLookAt[$i].FullName | Measure-Object -Line -Word
$filesInfo += Get-Content $FilesToLookAt[$i].FullName | Measure-Object -Line -Word
}

Write-Host "Info for WORDS: "
$filesInfo.Words | measure -Maximum -Minimum -Average
Write-Host "Info for LINES: "
$filesInfo.Lines | measure -Maximum -Minimum -Average
