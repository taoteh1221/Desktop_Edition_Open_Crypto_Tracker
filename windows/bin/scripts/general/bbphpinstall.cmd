
@echo off
:======================================================================================================================================================
:This was written by Anthony Ogundipe, diltony@gmail.com as part of phpbrowserbox v6x CLI 
:Feel free to modify for your own use, but dont remove this information
:======================================================================================================================================================

setlocal EnableExtensions DisableDelayedExpansion

set "dir_path=%BBHOME%downloads"
set "response_path=%BBHOME%tmp\selectphpzip.txt"

set "extract_path=%BBHOME%bin\php-unpacked"

REM select downloaded zips


FOR /F %%A IN ('DIR /A /B "%dir_path%\*.zip" 2^>nul') DO GOTO PROCEEDMENU
goto NODOWNLOADSFOUND


:PROCEEDMENU

echo.
echo Please select a php version to install for phpbrowserbox
echo.
selectphpzip


if not exist "%response_path%" goto EXITMENU

rem full path e.g. C:\php binan\app\downloads\php-5.5.15-Win32-VC11-x64.zip
set /p filepath=<"%response_path%"

set filepath=%filepath%

for /F "delims=" %%i in ("%filepath%") do set dirname=%%~dpi"
for /F "delims=" %%i in ("%filepath%") do set filename=%%~nxi
for /F "delims=" %%i in ("%filepath%") do set basename=%%~ni

echo.
echo You selected: %filename%

call bbphpunpack %filename%
rem if not exist "%extract_path%" mkdir "%extract_path%"
rem powershell -command "Expand-Archive '%selected%' '%extract_path%'"
rem echo PHP Unpacked Successfully
rem echo.

goto EXITMENU


:NODOWNLOADSFOUND
call bbphp download

:EXITMENU

exit /b 0
