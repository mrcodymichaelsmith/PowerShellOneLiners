
Add-WindowsCapability -Name Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0 -Online
# Checks to see if the source computer is online.
while( $ConfirmComp1 -ne 'y' ){
    $DaComp = Read-Host -Prompt 'Enter the computer to check'

    if( -not ( Test-Connection -ComputerName $DaComp -Count 2 -Quiet ) ){
        Write-Warning "$DaComp is not online. Please enter another computer name."
        continue
    }
    Get-ADComputer $DaComp 
    #$DaDate = (Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $DaComp).LastBootupTime

    #$DaDate
    #Who is logged in?
    Invoke-Command -ComputerName $DaComp -ScriptBlock{
        quser
        WMIC BIOS GET SERIALNUMBER
    }
}

<#
$DaComp = "INSERTCOMPUTERNAMHERE"


#Get time since last book
#Get-Uptime does not work for me???
(Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $DaComp).LastBootupTime

#Who is logged in?
Invoke-Command -ComputerName $DaComp -ScriptBlock{quser}

#Get Serial Number.
Invoke-Command -ComputerName  $DaComp -ScriptBlock{WMIC BIOS GET SERIALNUMBER}
#>
