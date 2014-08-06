@ECHO OFF

echo "Enter machine tag:" 
set /p pcname= 

echo.
echo "Checking remote registry service..."
sc \\%pcname% start "remoteregistry"


set regpath=\\%pcname%\HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers
reg query "%regpath%"
pause
