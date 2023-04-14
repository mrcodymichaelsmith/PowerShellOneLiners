

#Get time since last book
#Get-Uptime does not work for me???
(Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName INSERTCOMPUTERNAME).LastBootupTime
