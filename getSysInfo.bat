@echo off
REM Setzt das Datum im Format JJJJ-MM-TT
set myDat=%date:~6,4%-%date:~3,2%-%date:~0,2%

REM Setzt den Dateinamen mit dem Computernamen und dem Datum
set FILENAME=SysInfo_%ComputerName%_%myDat%.txt

REM Fügt eine Beschreibung für die Computer System Informationen hinzu
echo Computer System Information: >%FILENAME%
wmic computersystem get model,name,manufacturer,systemtype >>%FILENAME%

REM Fügt eine Beschreibung für die BIOS Version hinzu
echo. >>%FILENAME%
echo BIOS Version: >>%FILENAME%
wmic bios get smbiosbiosversion>>%FILENAME%

REM Fügt eine Beschreibung für die BIOS Seriennummer hinzu
echo. >>%FILENAME%
echo BIOS Serial Number: >>%FILENAME%
wmic bios get serialnumber>>%FILENAME%

REM Fügt eine Beschreibung für die Festplatteninformationen hinzu
echo. >>%FILENAME%
echo Disk Drive Information: >>%FILENAME%
wmic diskdrive get caption, status, serialnumber, Size >>%FILENAME%

REM Fügt eine Beschreibung für die Betriebssystemversion hinzu
echo. >>%FILENAME%
echo Operating System Version: >>%FILENAME%
wmic os get version>>%FILENAME%

REM Fügt eine Beschreibung für die CPU Informationen hinzu
echo. >>%FILENAME%
echo CPU Information: >>%FILENAME%
wmic CPU get NumberOfCores,NumberOfLogicalProcessors>>%FILENAME%

REM Fügt eine Beschreibung für die Speicherchip Informationen hinzu
echo. >>%FILENAME%
echo Memory Chip Information: >>%FILENAME%
wmic memorychip get devicelocator, manufacturer, capacity, PartNumber, serialnumber, speed, memorytype, formfactor >>%FILENAME%

REM Fügt eine Beschreibung für die Netzwerkadapter Informationen hinzu
echo. >>%FILENAME%
echo Network Adapter Information: >>%FILENAME%
wmic nic get AdapterType, Name, Installed, MACAddress, PowerManagementSupported, Speed>>%FILENAME%

REM Fügt eine Beschreibung für die Domäneninformationen hinzu
echo. >>%FILENAME%
echo Computer Domain: >>%FILENAME%
wmic computersystem get domain >>%FILENAME%

REM Fügt einen Ausdruck der Systeminfo hinzu
echo. >>%FILENAME%
echo SystemInfo: >>%FILENAME%
systeminfo >>%FILENAME%