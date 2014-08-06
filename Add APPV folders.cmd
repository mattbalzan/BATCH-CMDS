@ECHO OFF
echo "Enter APPV number only:" 
set /p appv=
echo.
echo Creating folders in Q drive...
md Q:\APPV%appv%.001
md Q:\APPV%appv%.V01
echo.
echo Done! :-)
echo.
pause
