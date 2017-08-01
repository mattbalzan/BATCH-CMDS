
:Connect@ECHO OFF
:Main
color 17
Echo.
Echo.NHSGGC - Health Information Technology
Echo.
Echo Choose your Wi-Fi Network
Echo -------------------------
Echo.

SET index=1

SETLOCAL ENABLEDELAYEDEXPANSION
FOR /F "tokens=3* delims=: " %%f IN ('netsh wlan show networks ^| findstr "SSID"') DO (

   SET file!index!=%%f
   ECHO !index! - %%f
   SET /A index=!index!+1
)

SETLOCAL DISABLEDELAYEDEXPANSION
Echo.
SET /P selection="select wi-fi by number:"

SET file%selection% >nul 2>&1

IF ERRORLEVEL 1 (
   ECHO invalid number selected   
   EXIT /B 1
)

CALL :RESOLVE %%file%selection%%%
Echo.
ECHO Selected Wi-Fi: %file_name%

GOTO :Connect

:RESOLVE
SET file_name=%1
GOTO :EOF

:Connect
netsh wlan connect name=%file_name%

pause
