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
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe stop ParksRecService0100}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe stop ParksRecServiceprod}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete ParksRecService0100}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete ParksRecServiceprod}
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
#Tyler311
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

#Clean up Infrastucture Server
$ISServer = "DEP-IS01"
foreach($Computer in $ISServer)
{
  #Tyler311
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe stop TIM.0100.windowsservice}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe stop TIM.prod.windowsservice}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete TIM.0100.windowsservice}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete TIM.prod.windowsservice}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\prod\tyler311" -recurse}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\0100\tyler311" -recurse}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.personsearch}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timadmin}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timincidentcreate}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timincidentsearch}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timincidentview}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timknowledgebase}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timlocationsearch}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timmessaging}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timprivate}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timreports}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timtask}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.personsearch}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timadmin}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timincidentcreate}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timincidentsearch}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timincidentview}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timknowledgebase}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timlocationsearch}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timmessaging}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timprivate}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timreports}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timtask}
}