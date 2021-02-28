if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator"))
{
	Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}
# Installs or upgrades Chocolately to the most current version
Invoke-Expression ((New-Object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

$ChocoPackages = @(
    "GoogleChrome",
    "notepadplusplus.install",
    "7zip.install",
    "vscode",
    "f.lux.install",
    "steam",
    "WhatsApp",
    "telegram.install",
    "signal",
    "discord.install",
    "logitechgaming",
    "Firefox",
    "vlc",
    "twitch",
    "adobereader",
    "Office365ProPlus",
    "adobedigitaleditions",
    "handbrake.install",
    "adobe-creative-cloud",
    "origin",
    "tuxguitar",
    "rdcman",
    "intel-xtu",
    "MakeMKV",
    "bitwarden",
    "goggalaxy",
    "battle.net",
    "powertoys",
    "epicgameslauncher",
    "authy-desktop"
)

foreach ($Package in $ChocoPackages) {
	try {
		Start-Process choco -ArgumentList "install $Package -y" -Wait -NoNewWindow
	}
	catch {
		throw "Failed to install $Package"
	}
}
