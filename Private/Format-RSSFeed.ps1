function Format-RSSFeed {
    param (
        $Feed
    )
    $Entries = foreach ($Entry in $Feed) {
        [PSCustomObject] @{
            #PostID      = $Entry."post-id".InnerText
            Title       = $Entry.title
            Link        = $Entry.link
            PublishDate = try { [DateTime] $Entry.pubDate } catch { $Entry.pubDate } ; #if ($Entry.pubDate -is [DateTime]) { [DateTime] $Entry.pubDate } else { $Entry.pubDate }
            Creator     = $Entry.Creator.'#cdata-section'
            Categories  = ($Entry.Category.'#cdata-section' | Sort-Object -Unique) -join ',' # actually for Wordpress it's a mix of Category/Tags
            isPermaLink = $Entry.Guid.isPermaLink
            LinkPerm    = $Entry.Guid.'#text'
            Description = $Entry.description.'#cdata-section'
            #Content           = ($Entry.encoded.'#cdata-section' -replace '<[^>]+>', '')
        }
    }
    return $Entries
}