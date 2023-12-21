
# i spent hours struggling trynna making this work and i forgor what i needed this for 💀
function RecursivelyPrepend ($Object, $String) {


    if (($Object -Is [Array]) -or ($Object.GetType().Name -eq 'List`1')){
        $Object | ForEach-Object {
            $_ = RecursivelyPrepend $PSItem $String
        }
    } elseif ($Object -is [hashtable] ) {
            
        [string[]]$Object.keys | ForEach-Object {

            if ($Object[$_] -is [String]) {
                $Object[$_] = "$String/$($Object[$_])"
            }
            elseif(($Object[$_] -Is [Array]) -or ($Object[$_].GetType().Name -eq 'List`1')){
                $Object[$_] | ForEach-Object {
                    $_ = RecursivelyPrepend $PSItem $String
                }
            }
            else {
                $Object[$_] = RecursivelyPrepend $Object[$_] $String
            }
        }
    }


    $Object
}