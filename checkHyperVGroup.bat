@echo off
setlocal enabledelayedexpansion

REM Colors: 0A = Black on Light Green, 0C = Black on Light Red

REM Display locale setting
echo.
echo [Locale setting:]
for /f "tokens=3" %%a in ('reg query "HKCU\Control Panel\International" /v LocaleName ^| find "LocaleName"') do (
    set "locale=%%a"
)
echo Locale: %locale%
echo.

REM Initialization
set "found=0"
set "existingGroups="

REM List of group names (with spaces, handled correctly)
set "groupList[0]=Hyper-V-Administratoren"
set "groupList[1]=Hyper-V Administrators"
set "groupList[2]=Administradores de Hyper-V"

REM Loop through groups
for /L %%i in (0,1,2) do (
    call set "groupName=%%groupList[%%i]%%"
    net localgroup "!groupName!" >nul 2>&1
    if !errorlevel! EQU 0 (
        echo Group found: !groupName!
        set "existingGroups=!existingGroups!|!groupName!"
    ) else (
        echo Group not found: !groupName!
    )
)

REM Check if user is in any of the existing groups
for %%G in (!existingGroups!) do (
    for /f "tokens=1 delims=|" %%H in ("%%G") do (
        net localgroup "%%H" | findstr /i "%USERNAME%" >nul
        if !errorlevel! EQU 0 (
            set "found=1"
            set "group=%%H"
        )
    )
)

REM Display result
echo.
if "%found%"=="1" (
    color 0A
    echo %USERNAME% is a member of the group "!group!".
) else (
    color 0C
    echo %USERNAME% is **not** a member of any known Hyper-V administrator group.
)

echo.
pause
endlocal