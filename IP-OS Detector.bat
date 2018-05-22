@echo off
color D
echo   IP-OS Detector By: Zaid "UnusualNinja"
ping -n 2 127.0.0.1>nul
ver | findstr /i "5\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_2000
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_XP
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_2003
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Vista
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Win7
ver | findstr /i "6\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_Win8
goto warn_and_exit

:ver_Win8
echo   Windows 8 Detected !
ping -n 1 127.0.0.1>nul
goto Newer_s

:ver_Win7
echo   Windows 7 Detected !
ping -n 1 127.0.0.1>nul
goto Newer_s

:ver_Vista
echo   Windows Vista Detected !
ping -n 1 127.0.0.1>nul
goto Newer_s

:ver_2003
echo   Windows Server 2003 Detected !
ping -n 1 127.0.0.1>nul
goto Older_s

:ver_XP
echo   Windows XP Detected !
ping -n 1 127.0.0.1>nul
goto Older_s

:ver_2000
echo   Windows 2000 Detected !
ping -n 1 127.0.0.1>nul
goto Older_s

:warn_and_exit
echo Machine OS cannot be determined.
Pause
exit

:Older_s
  ping -n 1 127.0.0.1>nul
  echo.
echo   Checking Connections "IP's"
echo.
  ping -n 1 127.0.0.1>nul
set ip_address_string="IP Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do (
    echo Your IP Address is: %%f
)
goto exit

:Newer_s
  ping -n 1 127.0.0.1>nul
  echo.
echo Checking Connections "IP's"
echo.
  ping -n 1 127.0.0.1>nul
set ip_address_string="IPv4 Address"
for /f "usebackq tokens=2 delims=:" %%f in (`ipconfig ^| findstr /c:%ip_address_string%`) do (
    echo Your IP Address is: %%f
)
goto exit

:exit
ping -n 3 127.0.0.1>nul
echo Press Any Key To Exit !
pause > nul
