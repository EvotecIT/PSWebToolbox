Import-Module PSWebToolbox -Force

Get-RSSFeed -Url 'https://blogs.msdn.microsoft.com/powershell/feed/' -Count 15 -Verbose | Format-Table #-Autosize