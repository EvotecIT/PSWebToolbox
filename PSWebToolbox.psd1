#
# Module manifest for module 'PSRSSReader'
#
# Generated by: Przemyslaw Klys
#
# Generated on: 07.11.2018
#

@{
    # Script module or binary module file associated with this manifest.
    RootModule           = 'PSWebToolbox.psm1'

    # Version number of this module.
    ModuleVersion        = '0.0.4'

    # Supported PSEditions
    CompatiblePSEditions = @('Desktop', 'Core')

    # ID used to uniquely identify this module
    GUID                 = '66dca55a-449d-43c8-84a1-f1538168de30'

    # Author of this module
    Author               = 'Przemyslaw Klys'

    # Company or vendor of this module
    CompanyName          = 'Evotec'

    # Copyright statement for this module
    Copyright            = 'Evotec (c) 2018. All rights reserved.'

    # Description of the functionality provided by this module
    Description          = 'Simple Web Toolbox (RSS)'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion    = '5.1'

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules      = @('PSSharedGoods')

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport    = @('Get-RSSFeed')

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = @('RSS', 'Blog', 'Viewer', 'Web')

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/EvotecIT/PSWebToolbox'

            # A URL to an icon representing this module.
            IconUri    = 'https://evotec.xyz/wp-content/uploads/2018/11/PSWebToolbox.png'

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable
}
