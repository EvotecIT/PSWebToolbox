function Get-RSSFeed {
    [CmdletBinding(DefaultParameterSetName = 'Count')]
    param(
        [Parameter(ValueFromPipeline)][System.Uri[]] $Url,
        [Parameter(ParameterSetName = 'Count')][nullable[int]] $Count = 10,
        [Parameter(ParameterSetName = 'All')] [switch] $All,
        [switch] $CategoriesOnly
    )
    Begin {
        [Object] $FeedGlobal = $null
        switch ($PsCmdlet.ParameterSetName) {
            'All' { $Count = $null; break}
            'Count' { break }
        }
    }
    Process {
        [int] $PageCount = 1
        [System.Uri] $BuildURL = "$Url"
        [Object] $Feed = $null
        while ($true) {
            Write-Verbose "Get-Feed - Count: $($Feed.Count) Expected Count: $Count URL: $BuildURL"
            try {
                $Feed += Invoke-RestMethod -Uri $BuildURL -Verbose:$false
            } catch {
                $ErrorMessage = $_.Exception.Message -replace "`n", " " -replace "`r", " "
                if ($PageCount -eq 1) {
                    #
                    Write-Warning "Get-Feed - Url: $Url CurrentUrl: $BuildURL Error: $ErrorMessage"
                } else {
                    # Basically means end of feed for /?paged if it's more then 1 page being fed
                    # Especially for -All switch
                }
                break;
            }
            if ($All) {
                $FeedGlobal += $Feed
            } elseif ($Count) {
                if ($Feed.Count -ge $Count) {
                    # if count is defined return only defined count
                    $FeedGlobal += $Feed | Select-Object -First $Count
                    break
                }
            } else {
                # Shouldn't happen really
                break
            }
            $PageCount++
            $BuildURL = "$Url/?paged=$PageCount"
        }
    }
    End {
        $Value = Format-RSSFeed -Feed $FeedGlobal
        if ($CategoriesOnly) {
            return $Value.Categories -Split ',' | Group-Object -NoElement | Sort-Object Count -Descending
        } else {
            Write-Verbose "Get-RssFeed - Returning $($Value.Count) articles"
            return $Value
        }
    }
}