clear
$url = "https://classlist.champlain.edu/show/courses/semester/spring/type/dayevening"

$ie = New-Object -ComObject internetexplorer.application
$ie.navigate($url)
while($ie.Busy) {Start-Sleep -s 10}
$ie.visible=$true

$FullTable = @()

$trs=$ie.Document.getElementsByTagName("tr")

for($i=1; $i -lt $trs.length; $i++){
$tds = $trs[$i].getElementsByTagName("td")

$FullTable += [pscustomobject]@{"Number" = $tds[0].innerText; `
                                "Title" = $tds[1].innerText; `
                                "Days" = $tds[4].innerText; `
                                "Times" = $tds[5].innerText; `
                                "Instructor" = $tds[6].innerText}
}

Write-Host "Every CSI Course"
$FullTable | select Number, Instructor, Days, Times | where {$_.Number -ilike "CSI*"} | Out-String

Write-Host "Every 200 level CSI Course"
$FullTable | select Number, Instructor, Days, Times | where {$_.Number -ilike "CSI 2*"} | Out-String

Write-Host "Every 300 level CSI course on Wensday"
$FullTable | select Number, Instructor, Days, Times | where { `
($_.Number -ilike "CSI 3*") -and ($_.Days -ilike "*W*")} | Out-String

Write-Host "Every CSI Course Tought By Staff"
$FullTable | select Number, Title, Instructor, Days | where { `
($_.Number -ilike "CSI*") -and ($_.Instructor -ilike "*Staff*")} | Out-String

Write-Host "Every Course That Has Programming In Its Title"
$FullTable | select Number, Title, Instructor, Days | where {$_.Title -ilike "*Programming*"} | Out-String

$ie.Quit()