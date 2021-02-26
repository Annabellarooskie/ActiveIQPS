function GetAccountInfo {

    [CmdletBinding(PositionalBinding, ConfirmImpact = 'medium')]

    param (

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [hashtable]
        $Request

    )

    try {

        $params = @{

            Headers = $script:AuthHeader

        }

        $Uri = "$($Baseuri)$($Resource.AllAccountInfo)"

        $result = Invoke-WebRequest @params -Method Get -Uri ($Uri + $Level)

        $report = ($result.Content | ConvertFrom-Json)

        Write-Output $report

    } catch {

        $PSCmdlet.ThrowTerminatingError($PSItem)

    }

}