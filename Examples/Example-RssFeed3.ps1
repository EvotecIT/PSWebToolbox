Import-Module PSWebToolbox -Force

$Data = Get-RssFeed -url 'https://evotec.xyz/feed' -Count 10
$Data | Format-Table