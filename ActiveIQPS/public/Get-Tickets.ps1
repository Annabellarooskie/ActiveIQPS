function Get-Tickets {
    [CmdletBinding()]
    param (

    )

    process {

        try {

            $request = @{

                PSBoundParameters = $PSBoundParameters

                PSCmdlet          = $PSCmdlet

            }

            $Tickets = GetTickets -Request $request

            Write-Output $Tickets.results


        } catch {

            $PSCmdlet.ThrowTerminatingError($PSItem)

        }

    }
}