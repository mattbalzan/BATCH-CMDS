@ECHO OFF
echo "Enter machine tag:" 
set /p pcname=
echo.
echo "Checking remote registry service..."
sc \\%pcname% start "remoteregistry"
set dir=\\%pcname%\C$\Program Files\Kodak\.
@IF EXIST "%dir%" GOTO Exists
:END
Echo Folder not found
Pause
exit
:Exists
Echo Kodak Folder found
pause
exit
