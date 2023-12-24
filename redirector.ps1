<# 

    This file makes a bunch of redirects for all pages on the site

    It's meant to be run by GitHub Actions before actually building the site,
    not on your computer (unless you'd enjoy dozens of folders in /docs/)

#>

Set-Location $PSScriptRoot

function New-HtmlRedirect ($url) {
    return @"
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="refresh" content="0;url=$url">
      <style>
        body {background-color: #1e2129;}
      </style>
      <script>
        window.onload = function() {
          var currentFragment = window.location.hash;
          var newUrl = "$url" + currentFragment;
          window.location.replace(newUrl);
        }
      </script>
    </head>
    <body>
    </body>
    </html>
    
"@
}


filter Get-RelativePath {
    <#
     It strips three things from the path you give it:
 
     1. Remove ./docs/ and anything before that from it's path
     2. Replace backslashes by forward slashes
     3. If the first character is a slash, remove it
    #>
    $PSItem -replace [Regex]::Escape((Get-Item ./docs).FullName) -replace "\\", "/" -replace "^/"
}

$mdFiles = Get-ChildItem .\docs -Recurse -Include *.md

foreach ($filepath in $mdFiles.FullName) {
    
    # this is what's gonna be the redirect, e.g ctt.cx/foo
    $filename = [IO.Path]::GetFileNameWithoutExtension($filepath)

    # this is what it's gonna link to, e.g /video/obs/output#nvenc
    $target = ($filepath | Get-RelativePath) -replace "\/index\.md$" -replace "\.md$"

    if ($filename -eq "index"){
        $filename = $target | Split-Path -Leaf
    }

    if (Test-Path ./docs/$filename) {
        continue
    }
    
    if ($target -notlike "*/*") { continue } # no need to make redirects for non-nested

    if ($env:YES_MAKE_TONS_OF_FOLDERS) { mkdir ./docs/$filename }

    $Parameters = @{
        Path  = Join-Path (Resolve-Path ./docs) $filename/index.html
        Value = New-HtmlRedirect -url "/$target"
    }
    if ($env:YES_MAKE_TONS_OF_FOLDERS) { Set-Content @Parameters }
    
    Write-Host "ctt.cx/$filename -> $target"
}

$table = @{
    sm              = "video/smoothie"
    obsvkcapture    = "video/obs/linux/obs-vkcapture"
    vkcapture       = "video/obs/linux/obs-vkcapture"
    wt              = 'software/windows-terminal'
    windowsterminal = 'software/windows-terminal'
}

foreach ($key in [string[]]$table.keys) {

    if (Test-Path ./docs/$key) { continue }

    if ($env:YES_MAKE_TONS_OF_FOLDERS) { mkdir ./docs/$key }

    $Parameters = @{
        Path  = Join-Path (Resolve-Path ./docs) $key/index.html
        Value = New-HtmlRedirect -url "/$($table.$key)"
    }
    if ($env:YES_MAKE_TONS_OF_FOLDERS) { Set-Content @Parameters }

    Write-Host "ctt.cx/$key -> $($table.$key)"
}


