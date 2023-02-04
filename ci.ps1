$ErrorAction = 'Stop'
$DebugPreference = 'Continue'

if (!(Get-Module powershell-yaml)){
    Write-Host "Getting PowerShell-YAML.. " -NoNewLine
    Install-Module powershell-yaml -Force
    Write-Host "Done"
}

. ./lib.ps1

$webhooks = Get-ChildItem ./webhooks/ -Recurse -File
# Gets an array all files within the webhooks folder

foreach ($embed in $webhooks){

    $Name = $embed.BaseName
    # e.g /webhooks/obs.yaml -> obs

    Post-WebHook $embed

    Get-Content $Embed -Raw | # 1. Get the content of the file
        ConvertFrom-YAML | # 2. Deserialize it into a Hashtable object
            ConvertFrom-WebHook | # 3. ConvertFrom-WebHook outputs a multi-line string of markdown
                Set-Content ./docs/$Name`.md # 4. Set-Content writes what is piped to a file that has the same name
    
    
   
}