<#
.SYNOPSIS
Returns NetApp account information based on the level

.DESCRIPTION
Returns NetApp account information based on the level

.PARAMETER Level
Level of Query. Valid choices are Customer, Site, Group

.EXAMPLE
Get-AccountInfo -Level Customer

#>
function Get-AccountInfo {

    [CmdletBinding(PositionalBinding, ConfirmImpact = 'low')]

    param (

        [Parameter(Mandatory, ValueFromPipelineByPropertyName, ValueFromPipeline, ParameterSetName = 'Level')]
        [ValidateSet('Customer', 'Site', 'Group')]
        [string]
        $Level

    )

    process {

        try {

            $request = @{

                PSBoundParameters = $PSBoundParameters

                PSCmdlet          = $PSCmdlet

            }

            GetAccountInfo -Request $request

        } catch {

            $PSCmdlet.ThrowTerminatingError($PSItem)

        }

    }

}