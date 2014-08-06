@Echo off
start wifi_scanner.bat
ping 127.0.0.1 -n 2
taskkill /f /im cmd.exe
exit