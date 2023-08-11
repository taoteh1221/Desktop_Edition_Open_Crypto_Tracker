
@echo off
:======================================================================================================================================================
:This was written by Anthony Ogundipe, diltony@gmail.com as part of phpbrowserbox v6x CLI
:Feel free to modify for your own use, but dont remove this information
:======================================================================================================================================================

setlocal EnableExtensions DisableDelayedExpansion


echo.
echo Available PHP Versions
echo.
echo.  [8.2] php 8.2.2
echo.  [8.1] php 8.1.10
echo.  [8.0] php 8.0.19
echo.  [7.4] php 7.4.6
echo.  [7.3] php 7.3.9
echo.  [7.2] php 7.2.33
echo.  [7.1] php 7.1.14
echo.  [7.0] php 7.0.9
echo.  [5.6] php 5.6.8
echo.  [5.5] php 5.5.15
echo.
set /p selection="Enter php version to download e.g 8.2: "

if "%selection%"=="8.2" (
  set "PHPVERSION=php-8.2.2-Win32-vs16-x64"
) else if "%selection%"=="8.1" (
    set "PHPVERSION=php-8.1.10-Win32-vs16-x64"
) else if "%selection%"=="8.0" (
   set "PHPVERSION=php-8.0.19-Win32-vs16-x64"
) else if "%selection%"=="7.4" (
    set "PHPVERSION=php-7.4.6-Win32-vc15-x64"
) else if "%selection%"=="7.3" (
    set "PHPVERSION=php-7.3.9-Win32-VC15-x64"
) else if "%selection%"=="7.2" (
    set "PHPVERSION=php-7.2.33-Win32-VC15-x64"
) else if "%selection%"=="7.1" (
    set "PHPVERSION=php-7.1.14-Win32-VC14-x64"
) else if "%selection%"=="7.0" (
  set "PHPVERSION=php-7.0.9-Win32-VC14-x64"
) else if "%selection%"=="5.6" (
  set "PHPVERSION=php-5.6.8-Win32-VC11-x64"
) else if "%selection%"=="5.5" (
    set "PHPVERSION=php-5.5.15-Win32-VC11-x64"
) else (
  echo.
  echo You have not made a valid selection
  exit /b 0
)



set url=https://windows.php.net/downloads/releases/archives/%PHPVERSION%.zip

set download_folder=%BBHOME%downloads
set download_path=%download_folder%\%PHPVERSION%.zip

IF EXIST "%download_path%" (
	echo.
	echo You already have the target %download_path%
	echo.
  exit /b 0
)

echo.
echo You have selected \%PHPVERSION%
echo.
choice /C:XS /N /M "[S] Start Downloading  [X] Exit : "
if %errorlevel%==1 exit /b 0

echo.
if NOT EXIST "%download_folder%" mkdir "%download_folder%"

echo.
echo Downloading %url%...


curl.exe -o "%download_path%" "%url%"

echo.
echo Download of %PHPVERSION% completed
echo.
