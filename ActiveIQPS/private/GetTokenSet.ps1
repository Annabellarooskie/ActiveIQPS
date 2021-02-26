function GetTokenSet {

    [CmdletBinding()]

    param (

    )

    [PSCustomObject] [ordered] @{

        Access  = (Get-VaultEntry -Resource 'ActiveIQPS.accesstoken' -IncludePassword -Force).Password

        Refresh = (Get-VaultEntry -Resource 'ActiveIQPS.refreshtoken' -IncludePassword -Force).Password

    }

}