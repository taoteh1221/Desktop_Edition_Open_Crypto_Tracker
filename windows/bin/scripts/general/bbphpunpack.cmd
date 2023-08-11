@echo off
:======================================================================================================================================================
:This was written by Anthony Ogundipe, diltony@gmail.com as part of phpbrowserbox v6x CLI
:Feel free to modify for your own use, but dont remove this information
:======================================================================================================================================================

setlocal EnableExtensions DisableDelayedExpansion

if "%1"=="" exit /b 0

set "extract_path=%BBHOME%bin\php-unpacked"
set "file_path=%BBHOME%downloads\%1"
set selected=%1%

set "php7apache=%BBHOME%bin\php-unpacked\php7apache2_4.dll"
set "php8apache=%BBHOME%bin\php-unpacked\php8apache2_4.dll"

set "php5apache=%BBHOME%bin\php-unpacked\php5apache2_4.dll"
set "php52apache=%BBHOME%bin\php-unpacked\php5apache2_2.dll"
set "php51apache=%BBHOME%bin\php-unpacked\php5apache2.dll"

if NOT exist "%file_path%" goto MISSINGMENU

:INITIALIZE


echo.
echo Unpacking %selected%...

rem empty and recreate extraction directory
if exist "%extract_path%" rmdir "%extract_path%" /S /Q
mkdir "%extract_path%"

powershell -command "Expand-Archive '%file_path%' '%extract_path%'"

echo.
echo Scanning for Apache Handler...
echo.

if exist "%php8apache%" (
 echo [Success] Detected php8apache2_4.dll
 goto INSTALLPACKAGE
)

if exist "%php7apache%" (
 echo [Success] Detected php7apache2_4.dll
 goto INSTALLPACKAGE
)

if exist "%php5apache%" (
 echo [Success] Detected php5apache2_4.dll
 goto INSTALLPACKAGE
)


if exist "%php52apache%" (
 echo [Success] Detected php5apache2_2.dll
 goto INSTALLPACKAGE
)

if exist "%php51apache%" (
 echo [Success] Detected php5apache2.dll
 goto INSTALLPACKAGE
)


echo [Failed] Missing php8apache2_4.dll...
echo [Failed] Missing php7apache2_4.dll...
echo [Failed] Missing php5apache2_4.dll...
echo [Failed] Missing php5apache2_2.dll...
echo [Failed] Missing php5apache2.dll...
echo.




echo.
echo [Notice] Removing unpacked files...
if exist "%extract_path%" rmdir "%extract_path%" /S /Q

goto EXITMENU

:INSTALLPACKAGE
echo.
echo [Notice] We are restarting to active new php version
call bbrestart
echo.
php --version
echo.
goto EXITMENU


:MISSINGMENU
echo.
echo %extract_path% does not exist
echo.

:EXITMENU
