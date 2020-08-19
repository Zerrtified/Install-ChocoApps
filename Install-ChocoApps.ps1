if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit
}
# Installs or upgrades Chocolately to the most current version
Invoke-Expression ((New-Object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

$ChocoPackages = @("notepadplusplus.install",
    "7zip.install",
    "sysinternals",
    "git.install",
    "vscode",
    "azurepowershell",
    "putty.install",
    "cygwin",
    "openssh",
    "rdcman",
    "rsat",
    "spacesniffer",
    "DotNet4.5.2",
    "jre8",
    "wsl",
    "docker-for-windows",
    "python",
    "awscli",
    "f.lux.install",
    "powertoys",
    "vim",
    "neovim",
    "microsoft-edge",
    "authy-desktop",
    "signal",
    "telegram.install",
    "WhatsApp",
    "azurepowershell"
)

foreach ($Package in $ChocoPackages) {
    try {
        Start-Process choco -ArgumentList "install $Package -y" -Wait -NoNewWindow
    }
    catch {
        throw "Failed to install $Package"
    }
}
