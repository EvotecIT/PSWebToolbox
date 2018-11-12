Import-Module PSWebToolbox -Force

$Feed = Get-RssFeed -Url 'https://evotec.xyz/feed' -Verbose -Count 15
$Feed | Out-GridView