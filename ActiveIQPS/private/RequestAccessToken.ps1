function RequestAccessToken {

    [CmdletBinding()]
    param (


    )

    try {

        $currentTokens = GetTokenSet

        $Uri = "$($baseuri)$($Resource.TokenRequest)"

        $splat = @{

            Uri         = $Uri
            Method      = 'POST'
            ContentType = 'application/json'
            Body        = '{"refresh_token":"' + $currentTokens.refresh + '"}'

        }

        $response = Invoke-WebRequest @splat

        $newTokens = $response.content | ConvertFrom-Json

        SaveTokenSet -AccessToken $newTokens.access_token -RefreshToken $newTokens.refresh_token

    } catch {

        $PSCmdlet.ThrowTerminatingError($PSItem)

    }

}