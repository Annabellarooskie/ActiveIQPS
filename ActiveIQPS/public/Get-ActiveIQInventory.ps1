<#
.SYNOPSIS
Returns NetApp Inventory for OHSU

.DESCRIPTION
Returns NetApp Inventory for OHSU

.EXAMPLE
Get-ActiveIQInventory

#>

function Get-ActiveIQInventory {
    [CmdletBinding()]
    param (

    )

    process {

        try {

            $request = @{

                PSBoundParameters = $PSBoundParameters

                PSCmdlet          = $PSCmdlet

            }

            GetActiveIQInventory -Request $request

        } catch {

            $PSCmdlet.ThrowTerminatingError($PSItem)

        }

    }
}