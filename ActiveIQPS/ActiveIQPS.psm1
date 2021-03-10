Set-StrictMode -Version Latest

$Public = @(Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue)

$Private = @(Get-ChildItem -Recurse -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue)

foreach ($import in @($Public + $Private)) {

    try {

        . $import.fullname

    } catch {

        Write-Error -Message "[$($import.FullName)]: Failed to import function: $_"
    }

}

try {

    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    $script:M_Config = Import-PowerShellDataFile -Path $PSScriptRoot\Config.psd1 -ErrorAction Stop

} catch {

    Write-Error -Message "Failed to load module configuration" -ErrorAction Stop

}

$script:Baseuri = 'https://api.activeiq.netapp.com'

$script:Resource = @{

    TokenRequest        = "/v1/tokens/accessToken"

    AllAccountInfo      = '/v1/system/list/level/'

    SiteInfo            = "/v1/system/list/level/site"

    CustomerInfo        = '/v1/system/list/level/customer'

    HealthRisk          = '/v1/health/details/level/customer/id/' + $M_Config.CustomerInfo.customer_id

    CustomerInventory   = '/v2/system/details/level/customer/id/' + $M_Config.CustomerInfo.customer_id

    CapacityInfo6months = '/v1/capacity/trend/level/customer/id/' + $M_Config.CustomerInfo.customer_id

    SupportCase         = '/v1/support/cases/customer/' + $M_Config.CustomerInfo.customer_id


}

RequestAccessToken

$authTokens = GetTokenSet

$script:AuthHeader = @{

    "accept"             = "application/json"
    "authorizationtoken" = $authTokens.access

}

Write-Host $script:AuthHeader



