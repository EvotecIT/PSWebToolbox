function Get-RSSFeed {
    [CmdletBinding(DefaultParameterSetName = 'Count')]
    param(
        [Parameter(ValueFromPipeline)][System.Uri[]] $Url,
        [Parameter(ParameterSetName = 'Count')][int] $Count = 10,
        [Parameter(ParameterSetName = 'All')] [switch] $All,
        [switch] $CategoriesOnly
    )
    Begin {
        if ($All) {
            $Count = 999999999
        }
        $Feed = [System.Collections.Generic.List[Object]]::new()
    }
    Process {
        [int] $CurrentCount = 0

        [int] $PageCount = 1
        [System.Uri] $BuildURL = "$Url"

        $Output = while ($true) {
            Write-Verbose "Get-Feed - Count: $($CurrentCount) Expected Count: $Count URL: $BuildURL"
            try {
                [Array] $Data = Invoke-RestMethod -Uri $BuildURL -Verbose:$false
                $CurrentCount = $CurrentCount + $Data.Count
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
            # return Data
            $Data

            #$FeedGlobal.AddRange($Data)
            # Verify if we're ok to close or not
            if ($CurrentCount -ge $Count) {
                # if count is defined return only defined count
                break
            }
            $PageCount++
            $BuildURL = "$Url/?paged=$PageCount"
        }
        if ($Output.Count -ge $Count) {
            $Output = $Output | Select-Object -First $Count
        }
        $Feed.AddRange($Output)

    }
    End {

        $Value = Format-RSSFeed -Feed $Feed
        if ($CategoriesOnly) {
            return $Value.Categories -Split ',' | Group-Object -NoElement | Sort-Object Count -Descending
        } else {
            Write-Verbose "Get-RssFeed - Returning $($Value.Count) articles"
            return $Value
        }
    }
}