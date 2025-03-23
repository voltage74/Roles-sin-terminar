[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$mods = (
    "https://mediafilez.forgecdn.net/files/4795/160/%5B1.20.1%5D%20SecurityCraft%20v1.9.8.jar",
    "https://mediafilez.forgecdn.net/files/4959/531/alexsmobs-1.22.7.jar",
    "https://mediafilez.forgecdn.net/files/4921/323/Aquaculture-1.20.1-2.5.1.jar",
    "https://mediafilez.forgecdn.net/files/4663/10/architectury-9.1.12-forge.jar",
    "https://mediafilez.forgecdn.net/files/4764/357/athena-forge-1.20.1-3.1.1.jar",
    "https://mediafilez.forgecdn.net/files/4802/738/ava-1.20.1-2.5.9.jar",
    "https://mediafilez.forgecdn.net/files/4943/500/balm-forge-1.20.1-7.2.1.jar",
    "https://mediafilez.forgecdn.net/files/4860/141/bellsandwhistles-0.4.3-1.20.x.jar",
    "https://mediafilez.forgecdn.net/files/5118/353/botarium-forge-1.20.1-2.3.3.jar",
    "https://mediafilez.forgecdn.net/files/4814/533/camera-1.20.1-1.0.6.jar",
    "https://mediafilez.forgecdn.net/files/4602/980/cfm-forge-1.20.1-7.0.0-pre36.jar",
    "https://mediafilez.forgecdn.net/files/4634/856/chipped-forge-1.20.1-3.0.1.jar",
    "https://mediafilez.forgecdn.net/files/4848/887/citadel-2.4.9-1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4913/871/corpse-1.20.1-1.0.9.jar",
    "https://mediafilez.forgecdn.net/files/5102/222/create_connected-0.7.2-mc1.20.1-all.jar",
    "https://mediafilez.forgecdn.net/files/4835/191/create-1.20.1-0.5.1.f.jar",
    "https://mediafilez.forgecdn.net/files/5000/116/createbigcannons-forge-1.20.1-0.5.3.b.jar",
    "https://mediafilez.forgecdn.net/files/5050/588/createdeco-2.0.1-1.20.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5080/957/create-new-age-forge-1.20.1-1.1.2.jar",
    "https://mediafilez.forgecdn.net/files/5284/533/CreativeCore_FORGE_v2.11.27_mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4636/36/Croptopia-1.20.1-FORGE-2.3.2.jar",
    "https://mediafilez.forgecdn.net/files/4901/850/devices-0.8.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/4983/862/DungeonsArise-1.20.x-2.1.58-release.jar",
    "https://mediafilez.forgecdn.net/files/5014/652/easy_npc_1.20.1-3.7.3.jar",
    "https://mediafilez.forgecdn.net/files/5566/632/embeddium-0.3.28%2Bmc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4763/645/entityculling-forge-1.6.2-mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5010/620/FallingTree-1.20.1-4.3.4.jar",
    "https://mediafilez.forgecdn.net/files/4679/319/FarmersDelight-1.20.1-1.2.3.jar",
    "https://mediafilez.forgecdn.net/files/4810/975/ferritecore-6.0.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/4793/884/FramedBlocks-9.1.6.jar",
    "https://mediafilez.forgecdn.net/files/4588/152/hole_filler_mod-1.2.8_mc-1.20.1_forge.jar",
    "https://mediafilez.forgecdn.net/files/5168/708/immersive_aircraft-0.7.5%2B1.20.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/4712/868/jei-1.20.1-forge-15.2.0.27.jar",
    "https://mediafilez.forgecdn.net/files/4873/848/journeymap-1.20.1-5.9.18-forge.jar",
    "https://mediafilez.forgecdn.net/files/4991/167/lightmanscurrency-1.20.1-2.2.0.0g.jar",
    "https://mediafilez.forgecdn.net/files/5104/317/minecraft-comes-alive-7.5.14%2B1.20.1-universal.jar",
    "https://mediafilez.forgecdn.net/files/4944/891/nfm-2023.12.09-1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5271/584/PlayerRevive_FORGE_v2.0.25_mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5012/47/RegionsUnexploredForge-0.5.3.1%2B1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4973/823/resourcefullib-forge-1.20.1-2.1.20.jar",
    "https://mediafilez.forgecdn.net/files/5008/700/TerraBlender-forge-1.20.1-3.0.1.2.jar",
    "https://mediafilez.forgecdn.net/files/5079/967/tfmg-0.8.0b-1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4753/168/trashslot-forge-1.20-15.1.0.jar",
    "https://mediafilez.forgecdn.net/files/4985/852/TravelersBackpack-1.20.1-9.1.12.jar",
    "https://mediafilez.forgecdn.net/files/6020/952/oculus-mc1.20.1-1.8.0.jar",
    "https://mediafilez.forgecdn.net/files/5910/194/oculus-flywheel-compat-forge1.20.1%2B1.1.4.jar",
    "https://cdn.modrinth.com/data/hWlsli6y/versions/JBS1TJdd/MapFrontiers-1.20.1-2.6.0p1-forge.jar"
)

$shaders = (
    "https://cdn.modrinth.com/data/lLqFfGNs/versions/6FdrBtKp/photon_v1.1.zip",
    "https://mediafilez.forgecdn.net/files/4681/281/Bliss_v2.0.4_%28Chocapic13_Shaders_edit%29.zip",
    "https://mediafilez.forgecdn.net/files/6137/622/ComplementaryUnbound_r5.4.zip",
    "https://mediafilez.forgecdn.net/files/6137/620/ComplementaryReimagined_r5.4.zip"
)

# It's the installation folder
$folder = "$env:APPDATA\.minecraft\worlds\Roles sin terminar\"

$directories = (
    "$folder\mods", 
    "$folder\shaderpacks"
)

# It deletes the folder if it exists and makes a new one
function check_folder {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Directory
    )
    if (Test-Path -Path $Directory) {
        Remove-Item -Path $Directory -Recurse -Force
    }
    mkdir $Directory | Out-Null
}

# It downloads the url array
function download_url_array {
    param (
        [Parameter(Mandatory=$true)] [string[]]$file_url_array,
        [Parameter(Mandatory=$true)] [string]$directory,
        [string]$write_name
    )

    foreach ($file_url in $file_url_array){
        $file_name = $file_url.Split('/')[-1]
        $file_decoded_name = [uri]::UnescapeDataString($file_name)

        if ($write_name -eq "y"){
            Write-Host $file_decoded_name -ForegroundColor "Cyan"
        }

        Start-BitsTransfer -Source $file_url -Destination "$directory\$file_decoded_name" -Priority High
    }
}

# It controls the answer that is outputted
function answer {
    $answer = ""
    $admitted_answer = $false

    while (-not $admitted_answer) {
        $answer = Read-Host
        $answer = $answer.ToLower()
        if ($answer -eq "si" -or $answer -eq "no") {
            $admitted_answer = $true
        } else {
            Write-Host "`nRespuesta no válida, solo puede responder 'Si' o 'No'" -ForegroundColor "Red"
        }
    }
    return $answer
}

# Get input from the user
Write-Host "Bienvenido al instalador del modpack de Roles sin terminar" 
Write-Host "Recuerda que se eliminarán todos los archivos de las carpetas que actualices y se pondrán los nuevos archivos`n" -ForegroundColor "DarkRed"

Write-Host "¿Quieres instalar los mods? (Si/No)"
$mods_check = answer

Write-Host "`n¿Quieres instalar los shaders? (Si/No)"
$shaders_check = answer

# Installs mods
if ($mods_check -eq "si") {
    # It checks the URL's from the mod array and downloads it
    Write-Host "`nInstalando los mods:" -ForegroundColor "Green"
    check_folder -Directory $directories[0]
    download_url_array -file_url_array $mods -directory $directories[0] -write_name "y"

    Write-Host "`nMods instalados" -ForegroundColor "Magenta"
}

# Installs shaders
if ($shaders_check -eq "si") {
    Write-Host "`nInstalando los shaders:" -ForegroundColor "Green"
    check_folder -Directory $directories[1]
    download_url_array -file_url_array $shaders -directory $directories[1] -write_name "y"

    Write-Host "`nShaders instalados" -ForegroundColor "Magenta"
}

Read-Host -Prompt "`nPresiona Enter para salir"