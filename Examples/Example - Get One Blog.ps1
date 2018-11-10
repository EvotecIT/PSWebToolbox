$Data = Get-RSSFeed -url 'https://evotec.xyz/feed' -Count 10
$Data | Format-Table