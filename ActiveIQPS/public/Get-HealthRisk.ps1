<#
.SYNOPSIS
Returns NetApp Risks for systems

.DESCRIPTION
Returns NetApp Risks for systems

.EXAMPLE
Get-HealthRisk

#>

function Get-HealthRisk {
    [CmdletBinding()]
    param (

    )

    process {

        try {

            $request = @{

                PSBoundParameters = $PSBoundParameters

                PSCmdlet          = $PSCmdlet

            }

            $Risk = GetHealthRisk -Request $request

            Write-Output $Risk

        } catch {

            $PSCmdlet.ThrowTerminatingError($PSItem)

        }

    }
}