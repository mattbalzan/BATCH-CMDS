REM Run Launch_WiFi.bat to execute this!
REM Created by M. Balzan 18 12 2012

@Echo off
if exist %temp%\temp.hta del %temp%\temp.hta

echo ^<html^> >> %temp%\temp.hta
echo ^<head^> >> %temp%\temp.hta
echo ^<HTA:APPLICATION >> %temp%\temp.hta
echo      APPLICATIONNAME="WLAN NETWORK SELECTOR" >> %temp%\temp.hta
echo      ID="WLAN NETWORK SELECTOR" >> %temp%\temp.hta
echo      BORDERSTYLE = "Normal" >> %temp%\temp.hta
echo      CAPTION = "No" >> %temp%\temp.hta
echo      CONTEXTMENU = "No" >> %temp%\temp.hta
echo      INNERBORDER = "No" >> %temp%\temp.hta
echo      MAXIMIZEBUTTON  = "No" >> %temp%\temp.hta
echo      MINIMIZEBUTTON = "No" >> %temp%\temp.hta
echo      NAVIGABLE  = "Yes" >> %temp%\temp.hta
echo      SCROLL="No" >> %temp%\temp.hta
echo      SCROLLFLAT = "No" >> %temp%\temp.hta
echo      SELECTION = "No" >> %temp%\temp.hta
echo      SHOWINTASKBAR  = "No" >> %temp%\temp.hta
echo      SINGLEINSTANCE="yes" >> %temp%\temp.hta
echo      SYSMENU   = "No"/^> >> %temp%\temp.hta

echo ^<STYLE^> >> %temp%\temp.hta
echo html, body { >> %temp%\temp.hta
echo 	background-color: #333333;>> %temp%\temp.hta
echo     font-family: calibri;>> %temp%\temp.hta
echo     font-size: 1em; >> %temp%\temp.hta
echo     line-height: 1em;>> %temp%\temp.hta
echo     margin: 10; >> %temp%\temp.hta
echo     padding: 0; >> %temp%\temp.hta
echo } >> %temp%\temp.hta
echo list { >> %temp%\temp.hta
echo     color: #000000; >> %temp%\temp.hta
echo     font-size: 1em; >> %temp%\temp.hta
echo     text-transform: uppercase; >> %temp%\temp.hta
echo     text-align: center; >> %temp%\temp.hta
echo } >> %temp%\temp.hta
echo h2 { >> %temp%\temp.hta
echo     color: #FFFFFF; >> %temp%\temp.hta
echo     font-size: 0.9em; >> %temp%\temp.hta
echo     text-transform: lowercase; >> %temp%\temp.hta
echo     text-align: center; >> %temp%\temp.hta
    
echo } >> %temp%\temp.hta
echo h5 { >> %temp%\temp.hta
echo     color: #FFA800; >> %temp%\temp.hta
echo     font-size: 1.2em; >> %temp%\temp.hta
echo     text-align: center; >> %temp%\temp.hta
echo } >> %temp%\temp.hta

echo ^</STYLE^> >> %temp%\temp.hta
 
echo ^<script type='text/vbscript'^> >> %temp%\temp.hta
echo Sub Window_onLoad() >> %temp%\temp.hta
echo Me.ResizeTo 350,600 >> %temp%\temp.hta
echo Me.MoveTo Screen.Width /2 - 150,Screen.Height / 2 - 300 >> %temp%\temp.hta
echo End Sub >> %temp%\temp.hta

echo ^</script^> >> %temp%\temp.hta

echo ^</head^> >> %temp%\temp.hta
 
echo ^<body^> >> %temp%\temp.hta
 
echo ^<p align="center"^>^<img src="C:\Program Files\WLAN\nhs_transp.png" alt="NHSGGC Logo"/^>^</p^> >> %temp%\temp.hta
echo ^<h5^>WLAN Wi-Fi Network Selector^</h5^> >> %temp%\temp.hta
echo ^<h2^>Choose your Wi-Fi Network from the list below^</h2^> >> %temp%\temp.hta
echo ^<select align="center" style="background-color: #333333;border-thickness:0;font: 12px Calibri;color: #FFA800" size="20" name="Listbox" onChange="Connect_Wifi"^> >> %temp%\temp.hta

REM Run scan for available wifi networks
SET Index=1
SETLocal EnableDelayedExpansion

for /f "tokens=3* delims=: " %%f in ('netsh wlan show networks ^| findstr "SSID"') do (
 
 SET file!Index!=%%f
 
 SET /A index=!index!+1
 Echo ^<option value="%%f"^>%%f^</option^>^<br^> >> %temp%\temp.hta
 )
SETLocal DisableDelayedExpansion

echo ^</select^> >> %temp%\temp.hta

echo ^<p align="center"^>^<form^> >> %temp%\temp.hta
echo ^<input type="button" style="background-color:FFA800;color:000000;border-color=FFA800" value="Close" onClick="window.close()"^>^&nbsp^&nbsp >> %temp%\temp.hta
REM echo ^<input type="button" style="background-color:FFA800;color:000000;border-color=FFA800" value="Rescan" onClick="Rescan"^>^</form^>^</p^> >> %temp%\temp.hta 

echo ^</Body^> >> %temp%\temp.hta
echo ^<SCRIPT type="text/vbscript"^> >> %temp%\temp.hta
echo Sub Connect_Wifi >> %temp%\temp.hta
echo Set objShell = CreateObject("WScript.Shell") >> %temp%\temp.hta
REM  Msgbox Listbox.value >> %temp%\temp.hta
echo objShell.Run "%comspec% /c netsh wlan connect name=" + Listbox.value  >> %temp%\temp.hta
echo End Sub >> %temp%\temp.hta
echo ^</SCRIPT^> >> %temp%\temp.hta 
echo ^</HTML^> >> %temp%\temp.hta

REM Run Compiled HTA
c:\windows\system32\mshta.exe %temp%\temp.hta