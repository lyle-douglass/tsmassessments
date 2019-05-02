$confirmation = Read-Host "This will remove multiple files/folders for the purpose of TSM Assessment 2. Are you sure you'd like to proceed?"
if ($confirmation -eq 'y') {
  # proceed
}

#MSSServer: Gives the MSS ServerName as a variable for the ForEach Function 
$MSSServer = "DEP-EW01"

#Delete MSS/Mobile WebApps, folders, and AppPools
Foreach($Computer in $MSSServer)
{
#MSSProd
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MSSProd -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\MSSProd" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MSSProd}

#MSS0100
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MSS0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\MSS0100" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MSS0100}

#MSSHostingProd
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MSSHostingProd -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\MSSHostingProd" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MSSHostingProd}

#MSSHosting0100
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MSSHosting0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\MSSHosting0100" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MSSHosting0100}

#MobileProd
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MobileProd -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\MobileProd" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MobileProd}

#Mobile0100
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name Mobile0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\Mobile0100" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool Mobile0100}

#MobileHostingProd
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MobileHostingProd -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\MobileHostingProd" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MobileHostingProd}

#MobileHosting0100
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MobileHosting0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\wwwroot\MobileHosting0100" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MobileHosting0100}
}

#SQL: Removes Cubes DBs
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'dm_munprod'
GO
USE [master]
GO
ALTER DATABASE [dm_munprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [dm_munprod]
GO" -ServerInstance "DEP-DB01\tylerci"

Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'dm_mun0100'
GO
USE [master]
GO
ALTER DATABASE [dm_mun0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [dm_mun0100]
GO" -ServerInstance "DEP-DB01\tylerci"

Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'st_munprod'
GO
USE [master]
GO
ALTER DATABASE [st_munprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [st_munprod]
GO" -ServerInstance "DEP-DB01\tylerci"

Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'st_mun0100'
GO
USE [master]
GO
ALTER DATABASE [st_mun0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [st_mun0100]
GO" -ServerInstance "DEP-DB01\tylerci"

#Remove TID/Hub
#ISServer: Gives the IS ServerName as a variable for the ForEach Function 
$ISServer = "DEP-IS01"

#Delete TID and Hub WebApps, folders, and AppPools
Foreach($Computer in $ISServer)
{
#TylerID
#Prod
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name Prod -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.accountlinking}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.administration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.api}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.configuration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.idpconfigsdk}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.systemadministration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.tyleridatos}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.useradmin}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.usermanagementsdk}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.userprovisioning}
#0100
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name 0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.accountlinking}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.administration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.api}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.configuration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.idpconfigsdk}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.systemadministration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.tyleridatos}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.useradmin}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.usermanagementsdk}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.userprovisioning}
#Hub
#Prod
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Website -Name TylerHubProd}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.hub}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool prod.omnibar}
#0100
#Hub
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Website -Name TylerHub0100}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.hub}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool 0100.omnibar}

#Remove Prod Virtual Directory
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\prod" -recurse}
#Remove 0100 Virtual Directory
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\inetpub\tylerroot\0100" -recurse}
}

# Delete TylerIDProd Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tyleridprod'
GO
USE [master]
GO
ALTER DATABASE [tyleridprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [tyleridprod]
GO" -ServerInstance "DEP-DB01\tylerci"

# Delete TylerID0100 Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerid0100'
GO
USE [master]
GO
ALTER DATABASE [tylerid0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [tylerid0100]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerHubProd Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerhubprod'
GO
USE [master]
GO
ALTER DATABASE [tylerhubprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [tylerhubprod]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerHub0100 Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerhub0100'
GO
USE [master]
GO
ALTER DATABASE [tylerhub0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [tylerhub0100]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerFormsProd Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerformsprod'
GO
USE [master]
GO
ALTER DATABASE [tylerformsprod] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [tylerformsprod]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerForms0100 Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerforms0100'
GO
USE [master]
GO
ALTER DATABASE [tylerforms0100] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
DROP DATABASE [tylerforms0100]
GO" -ServerInstance "DEP-DB01\tylerci"

#Remove MunisWeb
#MAServer: Gives the MA ServerName as a variable for the ForEach Function 
$MAServer = "DEP-MA01"

#Delete MunisWeb WebApps, folders, and AppPools
Foreach($Computer in $MAServer)
{
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MunisProd -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MunisHostingProd -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name Munis0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name MunisHosting0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MunisProd}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool Munis0100}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MunisHostingProd}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool MunisHosting0100}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Munis\munprod\webapps\MunisHostingProd" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Munis\mun0100\webapps\MunisHosting0100" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Munis\munprod\webapps\MunisProd" -recurse}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-Item -Path "C:\Munis\mun0100\webapps\Munis0100" -recurse}
#Remove XCF Files
Invoke-Command -ComputerName $Computer -ScriptBlock {Get-ChildItem *.xcf -Recurse -Path "C:\Munis\munprod\webapps\gas\wa" | Remove-Item}
Invoke-Command -ComputerName $Computer -ScriptBlock {Get-ChildItem *.xcf -Recurse -Path "C:\Munis\munprod\webapps\gas\ws" | Remove-Item}
Invoke-Command -ComputerName $Computer -ScriptBlock {Get-ChildItem *.xcf -Recurse -Path "C:\Munis\mun0100\webapps\gas\wa" | Remove-Item}
Invoke-Command -ComputerName $Computer -ScriptBlock {Get-ChildItem *.xcf -Recurse -Path "C:\Munis\mun0100\webapps\gas\ws" | Remove-Item}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GAS0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GAS0100Cash -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GAS0100Integration -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GAS0100MSS -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GAS0100Net -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GAS0100RPT -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GAS0100Sched -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASWA0100 -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASPROD -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASPRODCash -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASPRODIntegration -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASPRODMSS -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASPRODNet -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASPRODRPT -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASPRODSched -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebApplication -Name GASWAPROD -Site "Default Web Site"}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GAS0100}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GAS0100Cash}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GAS0100Integration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GAS0100MSS}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GAS0100Net}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GAS0100RPT}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GAS0100Sched}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASWA0100}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASPROD}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASPRODCash}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASPRODIntegration}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASPRODMSS}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASPRODNet}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASPRODRPT}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASPRODSched}
Invoke-Command -ComputerName $Computer -ScriptBlock {Remove-WebAppPool GASWAPROD}
}

$confirmation = Read-Host "You will now need to manually remove SSRS Reports for the Assessment. Confirm you will perform this task now..."
if ($confirmation -eq 'y') {
  # proceed
}