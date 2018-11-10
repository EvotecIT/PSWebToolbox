$Blogs = Get-RSSFeed -url 'https://evotec.xyz'
$Blogs += Get-RSSFeed -url 'https://www.sconstantinou.com'
$Blogs += Get-RSSFeed -url 'https://ridicurious.com'
$Blogs += Get-RSSFeed -url 'https://kevinmarquette.github.io'
$Blogs | Format-Table -AutoSize