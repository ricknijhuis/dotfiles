Import-Module $PSScriptRoot\ps\functions.ps1
 
#Check Script is running with Elevated Privileges
Assert-RunAsAdministrator

$profileDir = Split-Path -parent $profile

Write-Host "Using powershell profile directory: $profileDir" 

Write-Host "Configuring windows" 
. $PSScriptRoot/ps/windows.ps1

Write-Host "Installing dependencies" 
. $PSScriptRoot/ps/dependencies.ps1

Write-Host "Creating symbolic links for neovim" 
New-Item -Path $env:USERPROFILE\AppData\Local\nvim -Value $PSScriptRoot\nvim -ItemType SymbolicLink -Force

Write-Host "Creating symbolic links for wezterm" 
New-Item -Path $env:USERPROFILE\.config\wezterm -Value $PSScriptRoot\wezterm -ItemType SymbolicLink -Force