$ErrorAction = 'Stop'

if (!(Get-Module powershell-yaml)){
    Install-Module powershell-yaml -Force -Verbose
}

Import-Module ./lib.ps1 -DisableNameChecking

Get-ChildItem ./webhooks/ -Recurse -File | ForEach-Object {

    $Name = $PSItem.BaseName
    $Content = Get-Content $PSItem -Raw
    $Content | ConvertFrom-Yaml | Post-Webhook
    $Content | ConvertFrom-WebHook | Set-Content ./docs/$Name`.md
}