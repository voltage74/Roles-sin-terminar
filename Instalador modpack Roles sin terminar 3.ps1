[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$mods = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/voltage74/Roles-sin-terminar/refs/heads/main/Roles%20sin%20terminar%203/mods.txt") -split "`n"

$weapons = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/voltage74/Roles-sin-terminar/refs/heads/main/Roles%20sin%20terminar%203/weapons.txt") -split "`n"

$shaders = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/voltage74/Roles-sin-terminar/refs/heads/main/Roles%20sin%20terminar%203/shaderpacks.txt") -split "`n"

# It's the installation folder
$folder = "$env:APPDATA\.minecraft\worlds\Roles sin terminar 3"

$directories = (
    "$folder\mods", 
    "$folder\kubejs", 
    "$folder\tacz",
    "$folder\shaderpacks",
    "$folder\resourcepacks",
    "$folder\config",
    "$folder\journeymap\data\mp"
)

$journeymap_directories = (
    "day",
    "night",
    "topo",
    "biome"
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

        curl.exe -s -L -o "$directory\$file_decoded_name" $file_url
    }
}

# It downloads the zip from the repository, extracts in the modpack and deletes the zip
function download_zip {
    param (
        [Parameter(Mandatory=$true)] [string]$url
    )

    $file_name = $url.Split('/')[-1]
    $installations_folder = "$env:APPDATA\.minecraft\worlds"

    curl.exe -s -L -o "$installations_folder\$file_name" $url
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

Write-Host "`n¿Quieres instalar las armas? (Si/No)"
$weapons_check = answer

Write-Host "`n¿Quieres instalar los shaders? (Si/No)"
$shaders_check = answer

Write-Host "`n¿Quieres instalar los paquetes de recursos? (Por ejemplo, que las orugas de un tanque sean de metal) (Si/No)"
$resource_packs_check = answer

Write-Host "`n¿Quieres instalar las macros? (Si/No)"
$macros_check = answer

Write-Host "`n¿Quieres instalar el mapa? (Si/No)"
Write-Host "ES NECESARIO HABER ENTRADO AL SERVIDOR AL MENOS UNA VEZ PARA INSTALARLO"
$map_check = answer

# Installs mods
if ($mods_check -eq "si"){
    # It checks the URL's from the mod array and downloads it
    Write-Host "`nInstalando los mods:" -ForegroundColor "Green"
    check_folder -Directory $directories[0]
    download_url_array -file_url_array $mods -directory $directories[0] -write_name "y"

    Write-Host "`nMods instalados" -ForegroundColor "Magenta"
}

# Installs scripts
if ($scripts_check -eq "si"){
    Write-Host "`nInstalando los scripts" -ForegroundColor "Green"
    check_folder -Directory $directories[1]
    download_zip -url "https://raw.githubusercontent.com/voltage74/things/refs/heads/main/Roles%20sin%20terminar%203/kubejs.zip"

    Write-Host "Scripts instalados" -ForegroundColor "Magenta"
}

# Installs weapons
if ($weapons_check -eq "si"){
    Write-Host "`nInstalando las armas" -ForegroundColor "Green"
    check_folder -Directory $directories[2]
    download_zip -url "https://raw.githubusercontent.com/voltage74/things/refs/heads/main/Roles%20sin%20terminar%203/weapons.zip"
    download_url_array -file_url_array $weapons -directory $directories[2]

    Write-Host "Armas instaladas" -ForegroundColor "Magenta"
}

# Installs shaders
if ($shaders_check -eq "si"){
    Write-Host "`nInstalando los shaders:" -ForegroundColor "Green"
    check_folder -Directory $directories[3]
    download_url_array -file_url_array $shaders -directory $directories[3] -write_name "y"

    Write-Host "`nShaders instalados" -ForegroundColor "Magenta"
}

if ($resource_packs_check -eq "si"){
    Write-Host "`nInstalando los paquetes de recursos" -ForegroundColor "Green"
    check_folder -Directory $directories[4]
    download_zip -url "https://raw.githubusercontent.com/voltage74/Roles-sin-terminar/refs/heads/main/Roles%20sin%20terminar%203/resourcepacks.zip"

    Write-Host "Paquetes de recursos instalados" -ForegroundColor "Magenta"
}

if ($macros_check -eq "si"){
    Write-Host "`nInstalando los macros" -ForegroundColor "Green"
    Remove-Item -Path "$($directories[5])\commandkeys.json" -ErrorAction SilentlyContinue
    curl.exe -s -L -o $directories[5] "https://raw.githubusercontent.com/voltage74/Roles-sin-terminar/refs/heads/main/Roles%20sin%20terminar%203/commandkeys.json"

    Write-Host "Macros instalados" -ForegroundColor "Magenta"
}

# Installs the map
if ($map_check -eq "si"){
    Write-Host "Instalación del mapa:" -ForegroundColor "Green"
    Write-Host "`nPara instalar el mapa, será necesario descargarlo manualmente EN LA CARPETA 'DESCARGAS'"
    Write-Host "El enlace a la carpeta de Google Drive es: https://bit.ly/rolesinterminar3-full-map, haz Ctrl+Click para abrirlo"
    Write-Host "`nTambién es necesario haber entrado al servidor al menos una vez"
    Write-Host "Cuando hayas hecho esto, presiona Enter"
    Read-Host 

    $map_folder_found = $false
    $zip_found = $false

    # Checks if the JourneyMap folder is created
    while (-not $map_folder_found){
        $Error.Clear()
        $map_folder = Get-ChildItem -Path $directories[6] -Directory -ErrorAction SilentlyContinue| 
                      Where-Object {$_.Name -like "*_4b0d4fe6~814b~48b8~8f1e~152eeba72cee*"}
        
        if ($error -or (-not $map_folder)) {
            Write-Host "No has entrado al servidor aún, para instalar el mapa hace falta meterse al menos una vez"
            Write-Host "Cuando te hayas metido, presiona Enter para continuar con la instalación o reinicia el instalador"
            Read-Host
        } else {
            $map_folder_found = $true
        }
    }
    
    # Checks if the zip is downloaded
    while (-not $zip_found) {
        $Error.Clear()
        $zip_file = Get-ChildItem -Path "$HOME\Downloads" -Filter "*.zip" -Recurse -ErrorAction SilentlyContinue|
                    Where-Object {$_.Name -eq "mapa.zip"}
        
        if ($error -or (-not $zip_file)){
            Write-Host "No se ha encontrado el zip del mapa en la carpeta 'Descargas'"
            Write-Host "El enlace para descargarlo es: https://bit.ly/rolesinterminar3-full-map, haz Ctrl+Click para abrirlo"
            Write-Host "Cuando lo hayas descargado y puesto en la carpeta correcta, presiona Enter"
            Read-Host
        } else {
            $zip_found = $true
        }
    }
    
    # Deletes the old folder to avoid corruptions
    foreach ($directory in $journeymap_directories){
        check_folder -Directory "$($directories[6])\$map_folder\overworld\$directory"
    }

    # Extracts the zip and deletes it
    Expand-Archive -Path "$HOME\Downloads\mapa.zip" -DestinationPath "$($directories[5])\$map_folder" -Force
    Remove-Item -Path "$HOME\Downloads\mapa.zip" -Recurse -Force

    Write-Host "Mapa instalado" -ForegroundColor "Magenta"
}

Read-Host -Prompt "`nPresiona Enter para salir"