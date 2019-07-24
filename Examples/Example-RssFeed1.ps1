#Import-Module PSWebToolbox -Force
Import-Module $PSScriptRoot\..\PSWebToolbox.psd1 -Force

$Feed = Get-RSSFeed -Url 'https://evotec.xyz/feed' -Verbose -Count 10
$Feed | Where-Object { $_.PublishDate -ge (Get-Date -year 2019 -Month 01 -Day 01) } | Format-Table
$Feed | Format-Table -AutoSize
$Feed | Format-Table Title, PublishDate, Description