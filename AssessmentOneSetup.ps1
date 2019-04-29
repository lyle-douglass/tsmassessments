$confirmation = Read-Host "This will remove multiple files/folders for the purpose of TSM Assessment 1. Are you sure you'd like to proceed?"
if ($confirmation -eq 'y') {
  # proceed
}

$AppServer = "DEP-MA01"
foreach($Computer in $AppServer)
{
#APPSERVER: Removes Files and Desktop Icons for MIU and GDC
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Program Files (x86)\Tyler Technologies" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\ProgramData\Munis" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Program Files (x86)\FourJs" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Users\Public\Desktop\MUNIS Prod.lnk" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Users\Public\Desktop\MUNIS 0100.lnk" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Users\Public\Desktop\Managed Internet Update.lnk" -recurse}
#Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Munis\TylerInstalls" -recurse}
}
#Uninstalls MIU and GDC from App Server's Programs and Features
#MIU
$app = Get-WmiObject -Class Win32_Product `
                     -Filter "Name = 'Managed Internet Update (MIU)'"
$app.Uninstall()
#GDC
$app = Get-WmiObject -Class Win32_Product `
                     -Filter "Name = 'Munis Desktop Client 3.10'"
$app.Uninstall()

#MSS-SERVER: Stops and Deletes the MIU Agent Service
$MSSServer = "DEP-EW01"
Foreach($Computer in $MSSServer)
{
Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe stop MIUAgent}
Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete MIUAgent}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path 'C:\Program Files (x86)\Tyler Technologies' -recurse}
}

