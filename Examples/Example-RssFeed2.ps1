Import-Module PSWebToolbox -Force

$Blogs = Get-RSSFeed -url 'https://evotec.xyz/feed' -Verbose
$Blogs += Get-RSSFeed -url 'https://www.sconstantinou.com/feed' -Verbose
$Blogs += Get-RSSFeed -url 'https://ridicurious.com/feed' -Verbose
$Blogs += Get-RSSFeed -url 'https://kevinmarquette.github.io/feed' -Verbose -Count 10
$Blogs | Format-Table -AutoSize
$Blogs | Out-GridView