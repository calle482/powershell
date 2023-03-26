#install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$programs=@(
'Discord'
'Steam'
'Firefox'
'powershell-core'
'vscodium'
'notepadplusplus.install'
'vlc'
'git'
'7zip'
'microsoft-windows-terminal'
'spotify'
'winscp'
'geforce-experience'
'prismlauncher'
)

#install apps with chocolatey
foreach ($program in $programs) {
    choco install $program -y
}

#Debloat install
$script = $PSScriptRoot+"\Windows10SysPrepDebloater.ps1"
&$script

#activate windows
& ([ScriptBlock]::Create((irm https://massgrave.dev/get))) /HWID

#copy csgo config
cd c:\temp
git clone https://github.com/calle482/csgo-config
New-Item -ItemType Directory -Force -Path "C:\Program Files (x86)\Steam\userdata/149571724"
Write-Host "Sleeping to allow git clone to finish"
Start-Sleep -Seconds 15
Copy-Item -Recurse "c:\temp\csgo-config\730" "C:\Program Files (x86)\Steam\userdata/149571724\"

Write-Host "Script finsihed"