function Get-RSSFeed {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline)][System.Uri[]] $Url,
        [nullable[int]] $Count = 10,
        [switch] $All
    )
    Begin {
        [Object] $FeedGlobal = $null
    }
    Process {
        [int] $PageCount = 1
        [Object] $Feed = $null
        $BuildURL = "$Url"
        while ($true) {
            Write-Verbose "Get-Feed - Count: $($Feed.Count) Expected Count: $Count URL: $BuildURL"
            try {
                $Feed += Invoke-RestMethod -Uri $BuildURL -Verbose:$false
            } catch {
                $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
                Write-Warning "Get-Feed - Error: $ErrorMessage"
                break;
            }
            if ($All) {
                # place holder
            } elseif ($Count) {
                if ($Feed.Count -ge $Count) {
                    # if count is defined return only defined count
                    $FeedGlobal += $Feed | Select-Object -First $Count
                    break
                }
            } else {
                break
            }
            $PageCount++
            $BuildURL = "$Url/?paged=$PageCount"
        }
    }
    End {
        Format-RSSFeed -Feed $FeedGlobal
    }
}