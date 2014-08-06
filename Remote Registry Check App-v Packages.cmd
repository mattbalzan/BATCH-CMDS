:Main
@ECHO OFF
CLS
echo "Enter machine tag:" 
set /p pcname=
echo.
echo "Checking remote registry service..."
sc \\%pcname% start "remoteregistry"


set regpath=\\%pcname%\HKLM\SOFTWARE\Microsoft\SoftGrid\4.5\Client\Applications
reg query "%regpath%" > %userprofile%\desktop\appv.log
pause
GOTO Main