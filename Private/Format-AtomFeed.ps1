function Format-AtomFeed {
    param (
        $Feed
    )
    $Entries = foreach ($Entry in $Feed) {
        [PSCustomObject][ordered] @{
            #PostID      = $Entry."post-id".InnerText
            ID          = $Entry.id
            Title       = $Entry.title
            Link        = $Entry.link
            PublishDate = if ($Entry.published -is [DateTime]) { [DateTime] $Entry.published } else { $Entry.published }
            #Creator     = $Entry.Creator.'#cdata-section'
            #Categories  = $Entry.Category.'#cdata-section' -join ',' # actually for Wordpress it's a mix of Category/Tags
            #isPermaLink = $Entry.Guid.isPermaLink
            #LinkPerm    = $Entry.Guid.'#text'
            #Description = $Entry.description.'#cdata-section'
            #Content           = ($Entry.encoded.'#cdata-section' -replace '<[^>]+>', '')
        }
    }
    return $Entries
}