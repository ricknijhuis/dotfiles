function Assert-RunAsAdministrator() {
    #Get current user context
    $CurrentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  
    #Check user is running the script is member of Administrator Group
    if ($CurrentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
        Write-Information "Script is running with Administrator privileges!" -ForegroundColor "Yellow"
    }
    else {
        #Create a new Elevated process to Start PowerShell
        $ElevatedProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";
 
        # Specify the current script path and name as a parameter
        $ElevatedProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"
 
        #Set the Process to elevated
        $ElevatedProcess.Verb = "runas"
 
        #Start the new elevated process
        [System.Diagnostics.Process]::Start($ElevatedProcess)
 
        #Exit from the current, unelevated, process
        Exit
    }
}

function Update-Environment {
    $locations = 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'HKCU:\Environment'

    $locations | ForEach-Object {
        $k = Get-Item $_
        $k.GetValueNames() | ForEach-Object {
            $name = $_
            $value = $k.GetValue($_)
            Set-Item -Path Env:\$name -Value $value
        }
    }

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
}

function Restart-Powershell {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = "-nologo";
    [System.Diagnostics.Process]::Start($newProcess);
    exit
}

function Clear-RecycleBin {
    $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
    $RecBin.Items() | ForEach-Object { Remove-Item $_.Path -Recurse -Confirm:$false }
}
