$ErrorAction = 'Stop'
$DebugPreference = 'Continue'

if (!(Get-Module powershell-yaml)){
    Install-Module powershell-yaml -Force -Verbose
}

. ./lib.ps1

Get-ChildItem ./webhooks/ -Recurse -File | ForEach-Object {

    $Name = $PSItem.BaseName
    $Content = Get-Content $PSItem -Raw | ConvertFrom-Yaml
    $Content | Post-Webhook
    $Content | ConvertFrom-WebHook | Set-Content ./docs/$Name`.md
}