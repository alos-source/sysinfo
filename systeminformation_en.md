# Systeminformationen auslesen mit Windows CLI
Many CMD-Commany are based on [WMIC](https://docs.microsoft.com/en-us/windows/win32/wmisdk/wmic) and also work in the powershell. For WMIC a large number of [Alisas](https://ss64.com/nt/wmic.html) are available, here are some examles. Additionally Powershell has more possibilties in many cases. Alternativly the hardware information can also be read using the ```MSINFO32```. In Linux system data can be read using [dmidecode](https://wiki.ubuntuusers.de/dmidecode/).

## BIOS version
CMD:
- ```wmic bios get smbiosbiosversion```
- ```systeminfo | findstr /I /c:bios```

## Serial number
CMD:
```wmic bios get serialnumber```

## Windows version
CMD:
```wmic os get version```
Shows Windows Version and Build-Nummer. From Build-Nummer the Release-Version of Win10 can be derived: https://www.gaijin.at/de/infos/windows-versionsnummern

## Article number
Depending on the mancufacturer, the article number of the PC can be read.
CMD:
- ```wmic csproduct get vendor, version```
- ```wmic computersystem get model,name,manufacturer,systemtype```

## Hardware
### RAM
CMD: 
- ```wmic memorychip list full```
- ```wmic memorychip get capacity```

### CPU
CMD: 
- ```wmic cpu get```
- ```wmic CPU get NumberOfCores,NumberOfLogicalProcessors```

### Festplatte
PS:
```gwmi win32_logicaldisk -filter "drivetype=3" |  where{$_.DeviceID -eq “C:”}```

### Network
IP-Address, MAC-Address, DNS, etc.
- CMD: 
    - ```ipconfig /all```
    - ```getmac /v```
    - ```wmic nic get AdapterType, Name, Installed, MACAddress, PowerManagementSupported, Speed```
- PS: 
    - ```Get-NetAdapter```