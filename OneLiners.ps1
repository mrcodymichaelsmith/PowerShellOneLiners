
$DaComp = "INSERTCOMPUTERNAMHERE"


#Get time since last book
#Get-Uptime does not work for me???
(Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $DaComp).LastBootupTime

#Who is logged in?
Invoke-Command -ComputerName $DaComp -ScriptBlock{quser}

#Get Serial Number.
Invoke-Command -ComputerName  $DaComp -ScriptBlock{WMIC BIOS GET SERIALNUMBER}
