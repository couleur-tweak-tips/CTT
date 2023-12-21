function Test-Url {
    param (
        [string]$url
    )

    try {
        $response = Invoke-WebRequest -Uri $url -Method Head -ErrorAction Ignore
    } catch {}
    if ($response.StatusCode -eq 404) {
        return "$($response.StatusCode) - $url"
    }

}

$mdFiles = Get-ChildItem -Path ./docs/ -Filter *.md -Recurse
$textBuilder = New-Object System.Text.StringBuilder

foreach ($file in $mdFiles) {
    $textBuilder.Append([System.IO.File]::ReadAllText($file.FullName)) | Out-Null
}

$allText = $textBuilder.ToString()
$urls = [regex]::Matches($allText, '\[.*?\]\((.*?)\)') | ForEach-Object { $_.Groups[1].Value } | Where-Object {$_ -Like "http*"}
$uniqueUrls = $urls | Select-Object -Unique

foreach ($url in $uniqueUrls) {

    Test-Url -url $url
}
