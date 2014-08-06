
IF EXIST "C:\Users" (
for /f %%a in ('dir /B /AD C:\Users') do (
    if exist "C:\Users\%%a\Desktop\Apollo-FM.url" del /F /Q "C:\Users\%%a\Desktop\Apollo-FM.url"
    if exist "C:\Users\%%a\Desktop\Apollo-FM.lnk" del /F /Q "C:\Users\%%a\Desktop\Apollo-FM.lnk"
)
)

IF EXIST "C:\Documents and Settings" (
for /f %%b in ('dir /B /AD C:\Documents and Settings') do (
    if exist "C:\Users\%%b\Desktop\Apollo-FM.url" del /F /Q "C:\Users\%%b\Desktop\Apollo-FM.url"
    if exist "C:\Users\%%b\Desktop\Apollo-FM.lnk" del /F /Q "C:\Users\%%b\Desktop\Apollo-FM.lnk"
)
)