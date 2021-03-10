function GetHealthRisk {

    [CmdletBinding()]
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

        $Uri = "$($Baseuri)$($Resource.HealthRisk)"

        $result = Invoke-WebRequest @params -Method Get -Uri $Uri

        $report = ($result.Content | ConvertFrom-Json)

        Write-Output $report

    } catch {

        $PSCmdlet.ThrowTerminatingError($PSItem)

    }
}