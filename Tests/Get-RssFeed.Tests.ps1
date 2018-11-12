#Requires -Modules Pester
Import-Module $PSScriptRoot\..\PSWebToolbox.psd1 -Force #-Verbose

Describe 'Get-RssFeed - Should get RSS feeds' {
    It 'Get 15 articles from Evotec Blog' {
        $Feed = Get-RssFeed -Url 'https://evotec.xyz/feed' -Count 15
        $Feed.Count | Should -Be 15
    }
    It 'Get 10 articles from Evotec Blog' {
        $Feed = Get-RssFeed -Url 'https://evotec.xyz/feed'
        $Feed.Count | Should -Be 10
    }
    It 'Get 10 articles from Evotec Blog via pipeline' {
        $Feed = 'https://evotec.xyz/feed' | Get-RssFeed
        $Feed.Count | Should -Be 10
    }
    It 'Get 10 articles from each of 3 defined blogs via pipeline (should return 30 articles)' {
        $Feed = 'https://evotec.xyz/feed',
        'https://blogs.technet.microsoft.com/heyscriptingguy/feed/',
        'https://ridicurious.com/feed' | Get-RSSFeed -Count 10
        $Feed.Count | Should -Be 30
    }
    It 'Get 12 articles from each of 3 defined blogs via pipeline (should return 36 articles)' {
        $Feed = 'https://evotec.xyz/feed',
        'https://blogs.technet.microsoft.com/heyscriptingguy/feed/',
        'https://ridicurious.com/feed' | Get-RSSFeed -Count 12
        $Feed.Count | Should -Be 36
    }
    It 'Get 12 articles from blog and check their categories count' {
        $Feed = 'https://evotec.xyz/feed'| Get-RSSFeed -Count 12 -CategoriesOnly
        $Feed.Name.Count | Should -BeGreaterThan 12
    }
    It 'Get All articles from blog' {
        $Feed = 'https://evotec.xyz/feed'| Get-RSSFeed -All
        $Feed.Count | Should -BeGreaterThan 130
    }
}