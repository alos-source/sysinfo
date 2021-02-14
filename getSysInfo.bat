wmic computersystem get model,name,manufacturer,systemtype >./mySys.txt
wmic bios get smbiosbiosversion>>./mySys.txt
wmic bios get serialnumber>>./mySys.txt

wmic diskdrive get caption, status, serialnumber, Size >>./mySys.txt
wmic os get version>>./mySys.txt

wmic CPU get NumberOfCores,NumberOfLogicalProcessors>>./mySys.txt
wmic memorychip get capacity>>./mySys.txt
