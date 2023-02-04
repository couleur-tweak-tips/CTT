function Post-Webhook {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [System.IO.FileInfo]$Path
    )

    $Payload = Get-Content $Path | ConvertFrom-Yaml

    $Keys = [Array]$Payload.Keys

    if ('channel' -notin $Keys) {
        Write-Warning "Webhook ``$($Path.Name)`` needs the following keys: secret, message_link and channel"
        return
    }

<#
    Sample of a (dead) webhook URL:
    https://discord.com/api/webhooks/1071479561239396523/3AEEnB5VhR130TDaFtinu2M_vMVJZSiMwi2jLTHiM6gTXkb_scjVsKx-6gW736Q9w7dN
    
    `channel` should just contain
    1071479561239396523/3AEEnB5VhR130TDaFtinu2M_vMVJZSiMwi2jLTHiM6gTXkb_scjVsKx-6gW736Q9w7dN
#>
    # Parameters is a hashtable that is gonna be fed as a splat to Invoke-WebRequest
    # See splatting: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting
    # Invoke-WebRequest docs: https://go.microsoft.com/fwlink/?LinkID=2097126
    $Parameters = @{
        Uri = ("https://discord.com/api/webhooks/" + (Get-Item "env:$($Payload.channel)").Value)
        Body = Format-Embed $Payload.clone()
        Headers = @{ "Content-Type" = "application/json" }
    }


    if ($Payload.message_link){
        # Then we're modifying an existing message, we need to specify which via the message link
        $Parameters.Uri += "/messages/$($Payload.message_link)"
        $Parameters.Method = "Patch"
    } else {
        $Parameters.Method = "Post"
    }

    if ($Payload.thread_id){
        # Then we need to provide context over which creation/modification this is in
        $Parameters.Uri += "?thread_id=$($Payload.thread_id)"
    }

    # if ($env:COULEUR){ Wait-Debugger }

    Write-Debug ($Parameters | ConvertTo-Yaml)

    Invoke-WebRequest @Parameters
}

# Returns a JSON string to feed to the GitHub API
# Strips pings (parse_mentions)
function Format-Embed { 
    param(
        [Hashtable]$Payload
    )

    foreach ($CTT_Keyword in ("channel", "message_link", "thread_id")) {
        $Payload.remove($CTT_Keyword)
    }

    # Blocks out any potential mentions
    # https://birdie0.github.io/discord-webhooks-guide/structure/allowed_mentions.html
    $Payload."allowed_mentions" = @{
        "parse" = @()
        "roles" = @()    
    }

    return $Payload | ConvertTo-Json -Depth 5

}

function ConvertFrom-WebHook {
    param(
        [Parameter(ValueFromPipeline = $true)]
        [Hashtable]$Webhook
    )

    Write-Output $Webhook.content
    
    $Webhook.embeds | Where-Object Title | ForEach-Object {

        if (($author = $_.author) -and $_.author.name){

            $author_str = "`n"

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

