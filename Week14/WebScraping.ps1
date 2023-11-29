$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://192.168.3.128/ToBeScraped.html

#count links
$scraped_page.Links.Count

#display links
$scraped_page.Links

#display url and its text
$scraped_page.Links | select outerText, href

#outertext of all h2
$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | select outerText
$h2s | Out-String

#elemnts with a tag fith element h2
$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2")

for($i=0; $i -lt $h2s.length; $i++){
$h2s[$i].getElementsByTagName("a") | select `
@{Name="h2 element"; Expression={$i}}, outerText, href | Out-String
}

#innerText of every div elemnt with class div-1
$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | where { `
$_.getAttributeNode("class").value -ilike "div-1"} | select innerText

$divs1 | Out-String

#content from table
$trs=$scraped_page.ParsedHtml.body.getElementsByTagName("tr")

$multirow = @()
for($i=1; $i -lt $trs.length; $i++){
$tds=$trs[$i].getElementsByTagName("td")

$singlerow = @(
@{Row=$i; Employee=$tds[0].innerText; Department=$tds[1].innerText; `
Salary=$tds[2].innerText}
)
$multirow += $singlerow
}
$multirow | Out-String

#average salary
$totalSalaray=0
for($i=0; $i -lt $multirow.length; $i++){
$totalSalaray += $multirow[$i].Salary
}
$avgSalary = [Math]::Round($totalSalaray / $multirow.Length, 2)
Write-Host "Average Salary is" $avgSalary

$divs=$scraped_page.ParsedHtml.body.getElementsByTagName("div")
$divs | select ID | Out-String
