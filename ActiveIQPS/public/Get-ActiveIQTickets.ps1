function GetNodeChassis {

    [CmdletBinding(PositionalBinding, ConfirmImpact = 'medium')]

    param (

    )

    try {

        $params = @{

            Headers = $AuthorizationHeader

        }

        $commonParams = $Configuration.WebRequestParams

        $baseUri = "$($Configuration.Cluster.$CurrentCluster.BaseUri)$($Configuration.Resource.GetNodeChassis)"

        if ($Request.PsCmdlet.ParameterSetName -eq 'All') {

            $result = Invoke-WebRequest @commonParams @params -Method Get -Uri $baseUri

            $report = ($result.Content | ConvertFrom-Json)

        }

        if ($Request.PSBoundParameters.ContainsKey('Id')) {

            $result = Invoke-WebRequest @commonParams @params -Method Get -Uri ($baseUri + $Id)

            $report = ($result.Content | ConvertFrom-Json)

        }


        Write-Output $report

    } catch {

        $PSCmdlet.ThrowTerminatingError($PSItem)

    }

}