[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$mods = (
    "https://mediafilez.forgecdn.net/files/5424/863/%5B1.20.1%5D%20SecurityCraft%20v1.9.10.jar",
    "https://mediafilez.forgecdn.net/files/5160/697/alexsmobs-1.22.8.jar",
    "https://mediafilez.forgecdn.net/files/5137/938/architectury-9.2.14-forge.jar",
    "https://mediafilez.forgecdn.net/files/5414/790/artifacts-forge-9.5.11.jar",
    "https://mediafilez.forgecdn.net/files/5176/879/athena-forge-1.20.1-3.1.2.jar",
    "https://mediafilez.forgecdn.net/files/6004/945/azurelibarmor-neo-1.20.1-2.0.14.jar",
    "https://mediafilez.forgecdn.net/files/5546/654/azurelib-neo-1.20.1-2.0.30.jar",
    "https://mediafilez.forgecdn.net/files/5467/600/balm-forge-1.20.1-7.3.6-all.jar",
    "https://mediafilez.forgecdn.net/files/4860/141/bellsandwhistles-0.4.3-1.20.x.jar",
    "https://mediafilez.forgecdn.net/files/5108/576/bigcontraptions-1.0.jar",
    "https://mediafilez.forgecdn.net/files/5486/70/botarium-forge-1.20.1-2.3.4.jar",
    "https://mediafilez.forgecdn.net/files/5534/330/camera-forge-1.20.1-1.0.12.jar",
    "https://mediafilez.forgecdn.net/files/4882/500/carryon-forge-1.20.1-2.1.2.7.jar",
    "https://mediafilez.forgecdn.net/files/5270/39/Chipped-forge-1.20.1-3.0.6.jar",
    "https://mediafilez.forgecdn.net/files/5559/513/citadel-2.5.6-1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5580/456/clockwork-1.20.1-0.1.16-forge-b3b22e39fe.jar",
    "https://mediafilez.forgecdn.net/files/5550/348/copycats-2.0.5%2Bmc.1.20.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5157/34/corpse-forge-1.20.1-1.0.12.jar",
    "https://mediafilez.forgecdn.net/files/5381/714/create_connected-0.8.2-mc1.20.1-all.jar",
    "https://mediafilez.forgecdn.net/files/5331/908/create_enchantment_industry-1.20.1-for-create-0.5.1.f-1.2.9.d.jar",
    "https://mediafilez.forgecdn.net/files/4763/414/create_mechanical_extruder-1.20.1-1.5.7.e-22.jar",
    "https://mediafilez.forgecdn.net/files/5206/625/create_tweaked_controllers-1.20.1-1.2.4.jar",
    "https://mediafilez.forgecdn.net/files/5838/779/create-1.20.1-0.5.1.j.jar",
    "https://mediafilez.forgecdn.net/files/5555/936/createbigcannons-5.5.0-mc.1.20.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5293/982/createdeco-2.0.2-1.20.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5092/594/createendertransmission-2.0.7-1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5365/584/createframed-1.20.1-1.4.4.jar",
    "https://mediafilez.forgecdn.net/files/5080/957/create-new-age-forge-1.20.1-1.1.2.jar",
    "https://mediafilez.forgecdn.net/files/5568/293/CreativeCore_FORGE_v2.11.33_mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4997/459/Croptopia-1.20.1-FORGE-3.0.4.jar",
    "https://mediafilez.forgecdn.net/files/5367/944/curios-forge-5.9.1%2B1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5062/89/devices-0.8.2-forge.jar",
    "https://mediafilez.forgecdn.net/files/5574/86/dynamic-fps-3.6.3%2Bminecraft-1.20.0-forge.jar",
    "https://mediafilez.forgecdn.net/files/5569/587/easy_npc-forge-1.20.1-5.3.0.jar",
    "https://mediafilez.forgecdn.net/files/5566/632/embeddium-0.3.28%2Bmc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5436/746/embeddiumplus-1.20.1-v1.2.13.jar",
    "https://mediafilez.forgecdn.net/files/5429/151/entityculling-forge-1.6.6-mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4889/101/EpheroLib-1.20.1-FORGE-1.2.0.jar",
    "https://mediafilez.forgecdn.net/files/4866/973/epicempires-0.0.4-neo.jar",
    "https://mediafilez.forgecdn.net/files/4710/987/epicpaladins-0.1.1-1.20.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5493/853/epicsamurai-0.0.46-1.20.1-neo.jar",
    "https://mediafilez.forgecdn.net/files/5959/921/essential_1-3-5-5_forge_1-20-1.jar",
    "https://mediafilez.forgecdn.net/files/5010/620/FallingTree-1.20.1-4.3.4.jar",
    "https://mediafilez.forgecdn.net/files/5051/242/FarmersDelight-1.20.1-1.2.4.jar",
    "https://mediafilez.forgecdn.net/files/4810/975/ferritecore-6.0.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5399/211/FramedBlocks-9.3.0.jar",
    "https://mediafilez.forgecdn.net/files/5388/226/framework-forge-1.20.1-0.7.6.jar",
    "https://mediafilez.forgecdn.net/files/5460/309/geckolib-forge-1.20.1-4.4.7.jar",
    "https://mediafilez.forgecdn.net/files/4588/152/hole_filler_mod-1.2.8_mc-1.20.1_forge.jar",
    "https://mediafilez.forgecdn.net/files/5351/805/immersive_aircraft-1.0.1%2B1.20.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5493/390/Jade-1.20.1-forge-11.9.4.jar",
    "https://mediafilez.forgecdn.net/files/5576/551/jei-1.20.1-forge-15.8.2.25.jar",
    "https://mediafilez.forgecdn.net/files/5540/985/journeymap-1.20.1-5.10.1-forge.jar",
    "https://mediafilez.forgecdn.net/files/5402/61/kotlinforforge-4.11.0-all.jar",
    "https://mediafilez.forgecdn.net/files/4884/96/kubejs-create-forge-2001.2.5-build.2.jar",
    "https://mediafilez.forgecdn.net/files/5454/840/kubejs-forge-2001.6.5-build.14.jar",
    "https://mediafilez.forgecdn.net/files/5573/448/lightmanscurrency-1.20.1-2.2.2.6.jar",
    "https://mediafilez.forgecdn.net/files/5439/224/mcw-doors-1.1.1forge-mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/4961/142/mcw-windows-2.2.1-mc1.20.1forge.jar",
    "https://mediafilez.forgecdn.net/files/5351/648/minecraft-comes-alive-7.5.18%2B1.20.1-universal.jar",
    "https://mediafilez.forgecdn.net/files/5603/569/oculus-flywheel-compat-forge1.20.1%2B1.1.2.jar",
    "https://mediafilez.forgecdn.net/files/5299/671/oculus-mc1.20.1-1.7.0.jar",
    "https://mediafilez.forgecdn.net/files/5542/496/PlayerRevive_FORGE_v2.0.26_mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5509/920/protection_pixel-1.0.1.jar",
    "https://mediafilez.forgecdn.net/files/5229/844/radium-mc1.20.1-0.12.3%2Bgit.50c5c33.jar",
    "https://mediafilez.forgecdn.net/files/5570/559/refurbished_furniture-forge-1.20.1-1.0.3.jar",
    "https://mediafilez.forgecdn.net/files/5558/225/RegionsUnexploredForge-0.5.6%2B1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5568/216/resourcefullib-forge-1.20.1-2.1.28.jar",
    "https://mediafilez.forgecdn.net/files/4944/325/rhino-forge-2001.2.2-build.18.jar",
    "https://mediafilez.forgecdn.net/files/5114/427/s_a_b-1.3.0_1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5637/720/s_a_b_r_tfmg-0.1-1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5296/475/sophisticatedbackpacks-1.20.1-3.20.5.1044.jar",
    "https://mediafilez.forgecdn.net/files/5326/245/sophisticatedcore-1.20.1-0.6.22.611.jar",
    "https://mediafilez.forgecdn.net/files/5331/300/Steam_Rails-1.6.4%2Bforge-mc1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5529/117/tacz-1.20.1-1.0.2-release.jar",
    "https://mediafilez.forgecdn.net/files/5378/180/TerraBlender-forge-1.20.1-3.0.1.7.jar",
    "https://mediafilez.forgecdn.net/files/5558/101/tfmg-0.9.0d-1.20.1.jar",
    "https://mediafilez.forgecdn.net/files/5566/864/trackwork-1.20.1-1.0.1-beta.jar",
    "https://mediafilez.forgecdn.net/files/4753/168/trashslot-forge-1.20-15.1.0.jar",
    "https://mediafilez.forgecdn.net/files/5212/232/valkyrienskies-120-2.3.0-beta.5.jar",
    "https://cdn.modrinth.com/data/hWlsli6y/versions/WxMAoWX0/MapFrontiers-1.20.1-2.6.0p4-forge.jar",
    "https://cdn.modrinth.com/data/JmybsfWs/versions/4zjj5Jhw/Create-Dreams-n-Desires-1.20.1-0.2c.PREBETA.jar"
)

$shaders = (
    "https://mediafilez.forgecdn.net/files/4681/281/Bliss_v2.0.4_%28Chocapic13_Shaders_edit%29.zip",
    "https://mediafilez.forgecdn.net/files/6137/622/ComplementaryUnbound_r5.4.zip",
    "https://mediafilez.forgecdn.net/files/6137/620/ComplementaryReimagined_r5.4.zip",
    "https://cdn.modrinth.com/data/lLqFfGNs/versions/6FdrBtKp/photon_v1.1.zip"
)

# It's the installation folder
$folder = "$env:APPDATA\.minecraft\worlds\Roles sin terminar 2\"

$directories = (
    "$folder\mods", 
    "$folder\kubejs",
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

# It downloads the zip from the repository, extracts in the modpack and deletes the zip
function download_zip {
    param (
        [Parameter(Mandatory=$true)] [string]$url
    )

    $file_name = $url.Split('/')[-1]
    $installations_folder = "$env:APPDATA\.minecraft\worlds"

    Start-BitsTransfer -Source $url -Destination $installations_folder -Priority High
    Expand-Archive -Path "$installations_folder\$file_name" -DestinationPath $folder -Force
    Remove-Item -Path "$installations_folder\$file_name" -Recurse -Force
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
Write-Host "Bienvenido al instalador del modpack de Roles sin terminar 3" 
Write-Host "Recuerda que se eliminarán todos los archivos de las carpetas que actualices y se pondrán los nuevos archivos`n" -ForegroundColor "DarkRed"

Write-Host "¿Quieres instalar los mods? (Si/No)"
$mods_check = answer

Write-Host "`n¿Quieres instalar los scripts? (Si/No)"
$scripts_check = answer

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

# Installs scripts
if ($scripts_check -eq "si") {
    Write-Host "`nInstalando los scripts" -ForegroundColor "Green"
    check_folder -Directory $directories[1]
    download_zip -url "https://raw.githubusercontent.com/voltage74/things/refs/heads/main/Roles%20sin%20terminar%202/kubejs.zip"

    Write-Host "Scripts instalados" -ForegroundColor "Magenta"
}

# Installs shaders
if ($shaders_check -eq "si") {
    Write-Host "`nInstalando los shaders:" -ForegroundColor "Green"
    check_folder -Directory $directories[2]
    download_url_array -file_url_array $shaders -directory $directories[2] -write_name "y"

    Write-Host "`nShaders instalados" -ForegroundColor "Magenta"
}

Read-Host -Prompt "`nPresiona Enter para salir"