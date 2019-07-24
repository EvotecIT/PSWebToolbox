Import-Module PSWebToolbox -Force
#Import-Module .\PSWebToolbox.psd1 -Force

'https://evotec.xyz/feed',
'https://blogs.technet.microsoft.com/heyscriptingguy/feed/',
'https://ridicurious.com/feed' | Get-RSSFeed -Count 12 -Verbose | Out-HtmlView