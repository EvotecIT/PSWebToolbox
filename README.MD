# PSWebToolbox - PowerShell Module

[![Build status](https://ci.appveyor.com/api/projects/status/gl0ekjy96mg2gcmt?svg=true)](https://ci.appveyor.com/project/PrzemyslawKlys/pswebtoolbox)
[![Build Status](https://dev.azure.com/evotecpl/PSWebToolbox/_apis/build/status/EvotecIT.PSWebToolbox)](https://dev.azure.com/evotecpl/PSWebToolbox/_build/latest?definitionId=4)


## Examples for Get-RssFeed
Below you can find couple of examples on `Get-RssFeed`

### Example 1

```powershell
Import-Module PSWebToolbox -Force

'https://evotec.xyz/feed',
'https://blogs.technet.microsoft.com/heyscriptingguy/feed/',
'https://ridicurious.com/feed' | Get-RSSFeed -Count 12 -Verbose | Format-Table -AutoSize
```

### Example 2

```powershell
Import-Module PSWebToolbox -Force

'https://evotec.xyz/feed' | Get-RSSFeed -Count 10 -Verbose | Format-Table -AutoSize
'https://blogs.technet.microsoft.com/heyscriptingguy/feed/' | Get-RssFeed -Verbose -Count 20 | Out-GridView
'http://blogs.technet.com/b/heyscriptingguy/atom.aspx' | Get-RssFeed -Verbose -Count 15 | Out-GridView
```

### Example 3

```powershell
Import-Module PSWebToolbox -Force

$Blogs = Get-RSSFeed -url 'https://evotec.xyz/feed' -Verbose
$Blogs += Get-RSSFeed -url 'https://www.sconstantinou.com/feed' -Verbose
$Blogs += Get-RSSFeed -url 'https://ridicurious.com/feed' -Verbose
$Blogs += Get-RSSFeed -url 'https://kevinmarquette.github.io/feed' -Verbose -Count 10
$Blogs | Format-Table -AutoSize
$Blogs | Out-GridView
```

### Example 4

```powershell
Import-Module PSWebToolbox -Force

Get-RSSFeed -Url 'https://blogs.msdn.microsoft.com/powershell/feed/' -Count 15 | Format-Table #-Autosize
```

### Example 5

```powershell
Import-Module PSWebToolbox -Force
Get-RssFeed -Url 'https://evotec.xyz/feed' -CategoriesOnly
```

```
# Output:
Count Name
----- ----
    8 powershell
    5 office 365
    5 windows
    2 mailbox
    2 exchange online
    2 Exchange
    1 workflow
    1 smtp
    1 import-pssession
    1 prefix
    1 exchange mailbox move
    1 forwarding rules
    1 insiders
    1 windows 10
    1 windows 10 1809
    1 windows server
    1 inboxrules
    1 windows 2012
    1 windows 2012R2
    1 runspaces
    1 psblacklistchecker
    1 autoit
    1 environment
    1 discord
    1 active directory
    1 azure
    1 azure ad
    1 parameters
    1 ip
    1 net.dns
    1 resolve-dns
    1 blacklist ip
    1 psmodulepath
    1 variables
    1 blacklist

```