[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Gets the mods from txt on GitHub
$mods = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/voltage74/things/refs/heads/main/Roles%20sin%20terminar%202/mods.txt") -split "`n"

$shaders = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/voltage74/things/refs/heads/main/Roles%20sin%20terminar%202/shaderpacks.txt") -split "`n"

# It's the installation folder
$folder = "$env:APPDATA\.minecraft\worlds\Roles sin terminar 2"

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