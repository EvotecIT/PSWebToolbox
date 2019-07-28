#Import-Module PSWebToolbox -Force
Import-Module $PSScriptRoot\..\PSWebToolbox.psd1 -Force

$Feed = Get-RSSFeed -Url 'https://evotec.xyz/feed' -Verbose -All
#$Feed | Where-Object { $_.PublishDate -ge (Get-Date -year 2019 -Month 01 -Day 01) } | Format-Table
$Date = (Get-Date).AddYears(-1).AddMonths(-2)
$Date = Get-Date -Year 2018 -Month 06 -Day 01
$OneYearOld = $Feed | Where-Object { $_.PublishDate -ge $Date }
$OneYearOld.Count
$OneYearOld | Out-HtmlView -DisablePaging -DisableResponsiveTable -ScrollX -FilePath $Env:USERPROFILE\Desktop\File.html
#$Feed | Format-Table -AutoSize
#$Feed | Format-Table Title, PublishDate, Description