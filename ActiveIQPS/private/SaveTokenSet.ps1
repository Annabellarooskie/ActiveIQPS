function SaveTokenSet {

    [CmdletBinding()]

    param (

        [Parameter()]
        $AccessToken,

        [Parameter()]
        $RefreshToken

    )

    $accessCredential = New-Credential -Password $AccessToken -UserName access

    $refreshCredential = New-Credential -Password $RefreshToken -UserName refresh

    Add-VaultEntry -Resource 'ActiveIQPS.accesstoken' -PsCredential $accessCredential

    Add-VaultEntry -Resource 'ActiveIQPS.refreshtoken' -PsCredential $refreshCredential

}