Import-Module PSWebToolbox -Force

$Feed = Get-RssFeed -Url 'https://evotec.xyz/feed' -Verbose -All
$Feed | Out-GridView