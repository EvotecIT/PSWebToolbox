Import-Module PSWebToolbox -Force

'https://evotec.xyz/feed',
'https://blogs.technet.microsoft.com/heyscriptingguy/feed/',
'https://ridicurious.com/feed' | Get-RSSFeed -Count 12 -Verbose | Format-Table -AutoSize