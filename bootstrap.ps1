Import-Module $PSScriptRoot\ps\functions.ps1
 
#Check Script is running with Elevated Privileges
Assert-RunAsAdministrator

$profileDir = Split-Path -parent $profile

Write-Information "Using powershell profile directory: $profileDir" -ForegroundColor "Yellow"

Write-Information "Configuring windows" -ForegroundColor "Yellow"
. $PSScriptRoot/ps/windows.ps1

Write-Information "Installing dependencies" -ForegroundColor "Yellow"
. $PSScriptRoot/ps/dependencies.ps1

Write-Information "Creating symbolic links for neovim" -ForegroundColor "Yellow"
New-Item -Path $env:USERPROFILE\AppData\Local\nvim -Value $PSScriptRoot\nvim -ItemType SymbolicLink -Force

Write-Information "Creating symbolic links for wezterm" -ForegroundColor "Yellow"
New-Item -Path $env:USERPROFILE\.config\wezterm -Value $PSScriptRoot\wezterm -ItemType SymbolicLink -Force