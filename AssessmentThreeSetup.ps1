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
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.timtasks}
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
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.timtasks}
  #Cashiering
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Users\tyladmin\Desktop\Tyler Cashiering.lnk"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name CashieringProd -Site "Default Web Site"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name Cashiering0100 -Site "Default Web Site"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool CashieringProd}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool Cashiering0100}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\CashieringProd"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\Cashiering0100"}
}

#Clean up TCM Server
$TCMServer = "DEP-CM01"
foreach($Computer in $TCMServer)
{
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Users\Tyladmin\Desktop\SaaS AppLab TCM.lnk"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Users\Tyladmin\Desktop\OnPrem AppLab TCM.lnk"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\ApacheCerts\Cert.pem"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete Tomcat0100}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete TomcatProd}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Program Files\Apache Software Foundation"}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete SearchDb_tylercmprod2003}
  Invoke-Command -ComputerName $Computer -ScriptBlock {sc.exe delete SearchDb_tylercm01002004}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\SearchDB" -Recurse}
  Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Users\Tyladmin\empirecache" -Recurse}
}

#SQL Cleanup
#TylerCMProd
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylercmprod'
GO
USE [master]
GO
ALTER DATABASE [tylercmprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [tylercmprod]
GO" -ServerInstance "DEP-DB01\tylerci"
#TylerCM0100
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylercm0100'
GO
USE [master]
GO
ALTER DATABASE [tylercm0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [tylercm0100]
GO" -ServerInstance "DEP-DB01\tylerci"
#Tyler311Prod
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tyler311prod'
GO
USE [master]
GO
ALTER DATABASE [tyler311prod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [tyler311prod]
GO" -ServerInstance "DEP-DB01\tylerci"
#0100Tyler311
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'0100tyler311'
GO
USE [master]
GO
ALTER DATABASE [0100tyler311] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [0100tyler311]
GO" -ServerInstance "DEP-DB01\tylerci"
#ParksRecProd
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'parksrecprod'
GO
USE [master]
GO
ALTER DATABASE [parksrecprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [parksrecprod]
GO" -ServerInstance "DEP-DB01\tylerci"
#ParksRec0100
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'parksrec0100'
GO
USE [master]
GO
ALTER DATABASE [parksrec0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [parksrec0100]
GO" -ServerInstance "DEP-DB01\tylerci"
#CashieringProd
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'cashieringprod'
GO
USE [master]
GO
ALTER DATABASE [cashieringprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [cashieringprod]
GO" -ServerInstance "DEP-DB01\tylerci"
#Cashiering0100
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'cashiering0100'
GO
USE [master]
GO
ALTER DATABASE [cashiering0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [master]
GO
DROP DATABASE [cashiering0100]
GO" -ServerInstance "DEP-DB01\tylerci"