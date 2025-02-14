Set-Location $PSScriptRoot

if (-not(Get-Command ConvertFrom-Yaml -ErrorAction Ignore)) {
    Install-Module -Name powershell-yaml -Force
}
 
[Hashtable[]]$nav = (Get-Content .\mkdocs.yml | ConvertFrom-Yaml).nav

function Display ([Hashtable]$Table, [int32]$Depth) {
    $str = '#' * $depth + ' '
    $depth++

    foreach ($item in $table.GetEnumerator()) {
        
        if ($item.value.keys.length -gt 1) {
            $link = if (-not($item.value.index)) {
                $item.value | Where-Object { $_ -is [string] }
            }
            else {
                $item.value.index
            }
            write-output ("`n`n" + $str + '[' + $item.name + "](https://ctt.cx/$link)`n") 
        }
        if ($item.value -is [string]) {
            write-output ($str + '[' + $item.name + "](https://ctt.cx/$($item.value))") 
        }
        foreach ($nesteditems in $item.value) {
            if ($nesteditems -is [string]) { continue }
            Display $nesteditems $depth
        }
    }
}
$depth = 2
$ret = foreach ($category in $nav) {

    display $category $depth

}

Set-Content ./map.md -Value @'
# [CTT.cx](https://ctt.cx)
'@
$ret -replace "\.md" -replace "/index" | Add-Content ./map.md


if (-not(Test-Path ./docs/map/)) {
    mkdir ./docs/map/ | out-null
}

if (-not(Get-Command markmap -ErrorAction Ignore)) {
    
    npm install -g markmap-cli
}

markmap ./map.md --offline --no-toolbar --no-open -o ./docs/map/index.html

# remove-item ./map.md
