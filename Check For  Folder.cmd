@ECHO OFF
echo "Enter machine tag:" 
set /p pcname=
echo.
echo "Checking remote registry service..."
sc \\%pcname% start "remoteregistry"
set dir=\\%pcname%\C$\Program Files\<add your application folder name here>
@IF EXIST "%dir%" GOTO Exists
:END
Echo App not found
Pause
exit
:Exists
Echo App found
<run your patch exe command here>
pause
exit
