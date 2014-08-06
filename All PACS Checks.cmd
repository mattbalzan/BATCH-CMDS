@ECHO OFF

:Main
echo "Enter machine tag:" 
set /p pcname=
echo.
echo "Checking remote registry service..."
sc \\%pcname% start "remoteregistry"


set regpath=\\%pcname%\HKLM\SOFTWARE\Microsoft\SoftGrid\4.5\Client\Applications
reg query "%regpath%"
echo.
echo.
set regpath=\\%pcname%\HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
reg query "%regpath%" /v DefaultUserName
echo.
set dir=\\%pcname%\C$\Program Files\Kodak\.
@IF EXIST "%dir%" GOTO Exists
:END
Echo * Folder not found *
echo.
Pause
CLS
GOTO Main
:Exists
Echo *** Kodak Folder found ***
echo.
CLS
pause
GOTO Main