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
}