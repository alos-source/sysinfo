set myDat=%date:~6,4%-%date:~3,2%-%date:~0,2%
set FILENAME=%ComputerName%_%myDat%.txt

wmic computersystem get model,name,manufacturer,systemtype >%FILENAME%
wmic bios get smbiosbiosversion>>%FILENAME%
wmic bios get serialnumber>>%FILENAME%

wmic diskdrive get caption, status, serialnumber, Size >>%FILENAME%
wmic os get version>>%FILENAME%

wmic CPU get NumberOfCores,NumberOfLogicalProcessors>>%FILENAME%

wmic memorychip get devicelocator, manufacturer, capacity, PartNumber, serialnumber, speed, memorytype, formfactor >>%FILENAME%

wmic nic get AdapterType, Name, Installed, MACAddress, PowerManagementSupported, Speed>>%FILENAME%

wmic computersystem get domain >>%FILENAME%