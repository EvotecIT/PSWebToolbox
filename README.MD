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