$confirmation = Read-Host "This will remove multiple files/folders for the purpose of TSM Assessment 3. Are you sure you'd like to proceed?"
if ($confirmation -eq 'y') {
  # proceed
}

#Clean up App Server
$AppServer = "DEP-MA01"
foreach($Computer in $AppServer)
{
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Munis\TylerInstalls" -recurse}
}

#Clean up External Web Server
$WebServer = "DEP-EW01"
foreach($Computer in $WebServer)
{
#TPAR
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Website -Name TPAR}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\prod" -recurse}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\0100" -recurse}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool TPAR}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.parksrec}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.parksrecadmin}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.parksrecservices}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.parksrecservice}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.parksrec}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.parksrecadmin}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.parksrecservices}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.parksrecservice}
#Executime
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Website -Name Tyler311}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tyler311\prod" -recurse}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tyler311\0100" -recurse}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool Tyler311}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.portalservice}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timportal}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timpublic}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.portalservice}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timportal}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timpublic}
}