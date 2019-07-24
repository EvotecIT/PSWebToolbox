function Format-RSSFeed {
    [CmdletBinding()]
    param (
        [System.Collections.IList] $Feed
    )
    $Entries = foreach ($Entry in $Feed) {
        if ($Entry.link -like '*#*') {
            $Link = ($Entry.link).Split('#')[0]
        } else {
            $Link = $Entry.link
        }
        [PSCustomObject] @{
            Title       = $Entry.title
            Link        = $Link

            PublishDate = try { [DateTime] $Entry.pubDate } catch { $Entry.pubDate } ;
            Creator     = $Entry.Creator.'#cdata-section'
            Categories  = ($Entry.Category.'#cdata-section' | Sort-Object -Unique) -join ',' # actually for Wordpress it's a mix of Category/Tags
            LinkPerm    = $Entry.Guid.'#text'
            Description = ConvertFrom-HTML -HTML ((($Entry.description.'#cdata-section') -split '<p>', 0, 'SimpleMatch,IgnoreCase')[1]) -RemoveTags
            IsPermaLink = $Entry.Guid.isPermaLink
        }
    }
    return $Entries
}