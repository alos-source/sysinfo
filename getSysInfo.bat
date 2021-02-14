wmic computersystem get model,name,manufacturer,systemtype >%ComputerName%.txt
wmic bios get smbiosbiosversion>>%ComputerName%.txt
wmic bios get serialnumber>>%ComputerName%.txt

wmic diskdrive get caption, status, serialnumber, Size >>%ComputerName%.txt
wmic os get version>>%ComputerName%.txt

wmic CPU get NumberOfCores,NumberOfLogicalProcessors>>%ComputerName%.txt
wmic memorychip get capacity>>%ComputerName%.txt
