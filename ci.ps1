
if (!(Get-Module powershell-yaml)) {
    Install-Module powershell-yaml -Force
}

Import-Module ./lib.ps1

# define repos

$repos = @(
    @{
        folder = 'Atlas-OS_Docs'
        branch = 'master'
        url = 'https://github.com/Atlas-OS/docs'
    }
    @{
        folder = 'MicrocontrollersDev_Alternatives'
        branch = 'main'
        url ='https://github.com/MicrocontrollersDev/Alternatives'
    }
)

# clone them in /docs/

foreach ($repo in $repos) {

    git clone --branch $repo.branch --single-branch --depth 1  $repo.$url .\docs\$repo.$folder
}

# get their nav values and append "{folder}/" to each of the path values

$mkdocs = Get-Content ./mkdocs.yaml | ConvertFrom-Yaml

