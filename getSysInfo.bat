@echo off
REM Arbeitet immer im Verzeichnis des Skripts, unabhängig vom Aufrufort
cd /d "%~dp0"

REM Setzt das Datum im Format JJJJ-MM-TT (locale-unabhängig über PowerShell)
for /f %%d in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set myDat=%%d

REM Setzt den Dateinamen mit dem Computernamen und dem Datum
set FILENAME=SysInfo_%ComputerName%_%myDat%.txt

REM Fügt eine Beschreibung für die Computer System Informationen hinzu
echo Computer System Information: >"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_ComputerSystem | Select-Object Model,Name,Manufacturer,SystemType | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die BIOS Version hinzu
echo. >>"%FILENAME%"
echo BIOS Version: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_BIOS | Select-Object SMBIOSBIOSVersion | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die BIOS Seriennummer hinzu
echo. >>"%FILENAME%"
echo BIOS Serial Number: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_BIOS | Select-Object SerialNumber | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die Festplatteninformationen hinzu
echo. >>"%FILENAME%"
echo Disk Drive Information: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_DiskDrive | Select-Object Caption,Status,SerialNumber,Size | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die Betriebssystemversion hinzu
echo. >>"%FILENAME%"
echo Operating System Version: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_OperatingSystem | Select-Object Version | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die CPU Informationen hinzu
echo. >>"%FILENAME%"
echo CPU Information: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_Processor | Select-Object NumberOfCores,NumberOfLogicalProcessors | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die Speicherchip Informationen hinzu
echo. >>"%FILENAME%"
echo Memory Chip Information: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_PhysicalMemory | Select-Object DeviceLocator,Manufacturer,Capacity,PartNumber,SerialNumber,Speed,MemoryType,FormFactor | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die Netzwerkadapter Informationen hinzu
echo. >>"%FILENAME%"
echo Network Adapter Information: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_NetworkAdapter | Select-Object AdapterType,Name,Installed,MACAddress,PowerManagementSupported,Speed | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die Netzwerkadapter und Metrik Informationen hinzu
echo. >>"%FILENAME%"
echo Network Adapter Information Metrics: >>"%FILENAME%"
powershell -NoProfile -Command "Get-NetIPInterface | Sort-Object InterfaceMetric | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt eine Beschreibung für die Domäneninformationen hinzu
echo. >>"%FILENAME%"
echo Computer Domain: >>"%FILENAME%"
powershell -NoProfile -Command "Get-CimInstance Win32_ComputerSystem | Select-Object Domain | Format-Table -AutoSize" >>"%FILENAME%"

REM Fügt einen Ausdruck der Systeminfo hinzu
echo. >>"%FILENAME%"
echo SystemInfo: >>"%FILENAME%"
systeminfo >>"%FILENAME%"

echo.
echo Fertig. Ausgabe gespeichert in "%FILENAME%"
pause