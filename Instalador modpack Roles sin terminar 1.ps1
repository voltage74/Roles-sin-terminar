[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Gets the mods from txt on GitHub
$mods = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/voltage74/Roles-sin-terminar/refs/heads/main/Roles%20sin%20terminar%201/mods.txt") -split "`n"

$shaders = (Invoke-RestMethod -Uri "https://raw.githubusercontent.com/voltage74/Roles-sin-terminar/refs/heads/main/Roles%20sin%20terminar%201/shaderpacks.txt") -split "`n"

# It's the installation folder
$folder = "$env:APPDATA\.minecraft\worlds\Roles sin terminar"

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

        curl.exe -s -L -o "$directory\$file_decoded_name" $file_url
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