#install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

$programs=@('Discord','Steam','Firefox','powershell-core','vscodium','notepadplusplus.install','vlc','git','7zip','microsoft-windows-terminal','spotify','winscp','geforce-experience')

#install apps with chocolatey
foreach ($program in $programs) {
    choco install $program -y
}

#Debloat install
$script = $PSScriptRoot+"\Windows10Debloater.ps1"
&$script

#activate windows
irm https://massgrave.dev/get | iex