Import-Module PSWebToolbox -Force

'https://evotec.xyz/feed' | Get-RSSFeed -Count 10 -Verbose | Format-Table -AutoSize
'https://blogs.technet.microsoft.com/heyscriptingguy/feed/' | Get-RssFeed -Verbose -Count 20 | Out-GridView
'http://blogs.technet.com/b/heyscriptingguy/atom.aspx' | Get-RssFeed -Verbose -Count 15 | Out-GridView