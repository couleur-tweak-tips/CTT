function Post-Webhook {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Hashtable]$Payload
    )

    $Payload | Filter-Pings

    "secret", "message_id", "channel" | ForEach-Object {
        if ([Array]$Payload.keys -notcontains $_){
            "Webhook needs the following keys: secret, message_link and channel"
        }
    }
    Write-Warning ([bool]$env:FUCK2)

    $channel = $Payload.channel
    $Token = (Get-Item -Path ("env:FUCK2") -ErrorAction Stop).Name
    $message_id = $Payload.message_id
    
    $Parameters = @{
        Uri = "https://discord.com/api/webhooks/$channel/$token/messages/$message_id"
        Method = "Patch"
        Body = $Payload | ConvertTo-Json -Depth 99 -Compress
        Headers = @{ "Content-Type" = "application/json" }
    }

    

    Write-Debug ($Parameters | ConvertTo-Yaml)

    Invoke-WebRequest @Parameters

    
}

function Filter-Pings { # void
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Hashtable]$Payload
    )
    @(
        '@everyone'
        '@here'
        '<@&\d{19}>' # roles
    ) | ForEach-Object {
        if ([Regex]::Matches($Payload, $PSItem)) {
            throw "Ping detected, aborting!"
            exit 1
        }
    }
    if ([Regex]::Matches($Payload, "<@\d{18}>").count -gt 5){
        throw "Pinged abve 5 users, aborting"
        exit 1
    }

}

function ConvertFrom-WebHook {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Hashtable]$Webhook
    )

    Write-Output $Webhook.content
    
    $Webhook.embeds | Where-Object Title | ForEach-Object {

        if ($author = $_.author -and $_.author.name){

            $author_str = ""

            if ($author.icon_url){
                $author_str += "<img class='author' src=`"$($author.icon_url)`" alt=`"author`" width=`"16`"/> "
            }
            if ($author.url){
                $author_str += "[$($author.name)]($($author.url))"
            }else{
                $author_str += $author.name
            }

            Write-Output $author_str
        }

        Write-Output "### $($_.Title)"

        if ($thumbnail = $_.thumbnail.url){
            Write-Output "`n<img align=`"right`" src=`"$thumbnail`" />`n"
        }

        Write-Output "`n$($_.description)"

        if ($_.fields){

            if ($_.fields.inline -eq $true -and $_.fields.length -le 3){
                Write-Output ($_.fields.name -join " | ")
                Write-Output ((0..3 | ForEach-Object {"|"}) -join "-")
                Write-Output ($_.fields.value -join " | ")

            } else {
                $_.fields | ForEach-Object {
                    Write-Output "#### $($_.name)"
                    Write-Output "`n$($_.value)`n"
                }
            }
        }

        if ($thumb = $_.thumbnail.url){
            Write-Output "`n![]($thumb)`n"
        }


        if ($footer = $_.footer){
            
            $footer_str = ""

            if ($footer.icon_url){
                $footer_str += "<img class='footer_icon' src=`"$($footer.icon_url)`" alt=`"author`" width=`"16`"/> "
            }
            if ($footer.text){
                $footer_str += $footer.text
            }else{
                $footer_str += $footer.name
            }

            Write-Output $footer_str
            # Write-Output "#### $($footer.text)"
        }
    }
}

