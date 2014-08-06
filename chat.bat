@echo off

:machine
echo "Enter machine tag:" 
set /p tag=
echo.

:user

echo "Enter username:" 
set /p user=
echo.

:message
echo "Enter message:" 
set /p message=
echo.

msg /server:%tag% %user% %message%

goto message
