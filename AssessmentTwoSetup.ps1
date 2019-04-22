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
DROP DATABASE [dm_munprod]
GO" -ServerInstance "DEP-DB01\tylerci"

Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'dm_mun0100'
GO
USE [master]
GO
DROP DATABASE [dm_mun0100]
GO" -ServerInstance "DEP-DB01\tylerci"

Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'st_munprod'
GO
USE [master]
GO
DROP DATABASE [st_munprod]
GO" -ServerInstance "DEP-DB01\tylerci"

Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'st_mun0100'
GO
USE [master]
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
DROP DATABASE [tyleridprod]
GO" -ServerInstance "DEP-DB01\tylerci"

# Delete TylerID0100 Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerid0100'
GO
USE [master]
GO
DROP DATABASE [tylerid0100]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerHubProd Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerhubprod'
GO
USE [master]
GO
DROP DATABASE [tylerhubprod]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerHub0100 Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerhub0100'
GO
USE [master]
GO
DROP DATABASE [tylerhub0100]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerFormsProd Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerformsprod'
GO
USE [master]
GO
DROP DATABASE [tylerformsprod]
GO" -ServerInstance "DEP-DB01\tylerci"

#Delete TylerForms0100 Database
Invoke-Sqlcmd -Query "EXEC msdb.dbo.sp_delete_database_backuphistory @database_name = N'tylerforms0100'
GO
USE [master]
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
}