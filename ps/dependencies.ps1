param($tempArtifactPath = "$PSScriptRoot\artifacts")

Import-Module $PSScriptRoot\ps\functions.ps1

Assert-RunAsAdministrator

Write-Host "Updating Help..." -ForegroundColor "Yellow"
Update-Help -Force

Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Get-PackageProvider NuGet -Force | Out-Null

Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module Posh-Git -Scope CurrentUser -Force
Install-Module PSWindowsUpdate -Scope CurrentUser -Force

Write-Information "Installing winget..." -ForegroundColor "Yellow"
$progressPreference = 'silentlyContinue'
$latestWingetMsixBundleUri = $(Invoke-RestMethod https://api.github.com/repos/microsoft/winget-cli/releases/latest).assets.browser_download_url | Where-Object { $_.EndsWith(".msixbundle") }
$latestWingetMsixBundle = $latestWingetMsixBundleUri.Split("/")[-1]
Invoke-WebRequest -Uri $latestWingetMsixBundleUri -OutFile "./artifacts/$latestWingetMsixBundle"
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage $latestWingetMsixBundle

Write-Information "Installing git..." -ForegroundColor "Yellow"
winget install Git.Git --silent --accept-package-agreements --override "/VerySilent /NoRestart /o:PathOption=CmdTools /Components=""icons,assoc,assoc_sh,gitlfs"""
winget install Git.Git --silent --accept-package-agreements --override "/VerySilent /NoRestart /o:PathOption=CmdTools /Components=""icons,assoc,assoc_sh,gitlfs"""

Write-Information "Installing zig compiler(functions as our cross platform c compiler)..." -ForegroundColor "Yellow"
winget install --id=zig.zig  -e

Write-Information "Installing node..." -ForegroundColor "Yellow"
winget install OpenJS.NodeJS --silent --accept-package-agreements

Write-Information "Installing powershell..." -ForegroundColor "Yellow"
winget install Microsoft.PowerShell --silent --accept-package-agreements

Write-Information "Installing neovim..." -ForegroundColor "Yellow"
winget install --id=Neovim.Neovim  -e

Write-Information "Installing wezterm..." -ForegroundColor "Yellow"
winget install --id=wez.wezterm  -e

Write-Information "Installing sql server..." -ForegroundColor "Yellow"
winget install Microsoft.SQLServer.2019.Developer --silent --accept-package-agreements
Write-Information "Installing sql server management studio..." -ForegroundColor "Yellow"
winget install Microsoft.SQLServerManagementStudio --silent --accept-package-agreements
Write-Information "Installing visual studio..." -ForegroundColor "Yellow"
winget install Microsoft.VisualStudio.2022.Professional --silent --accept-package-agreements --override "--wait --quiet --norestart --nocache --addProductLang En-us --add Microsoft.VisualStudio.Workload.Azure --add Microsoft.VisualStudio.Workload.NetWeb"

# Update env variables
Update-Environment

Write-Information "Deleting artifacts directory..."
Remove-Item -LiteralPath $tempArtifactPath -Force -Recurse