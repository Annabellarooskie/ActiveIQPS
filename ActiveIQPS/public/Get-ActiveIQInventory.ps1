<#
.SYNOPSIS
Returns NetApp Inventory for customer

.DESCRIPTION
Returns NetApp Inventory for customer

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