@echo off
:======================================================================================================================================================
:This was written by Anthony Ogundipe, diltony@gmail.com as part of phpbrowserbox v6x CLI
:Feel free to modify for your own use, but dont remove this information
:======================================================================================================================================================

::===========================================================================
fsutil dirty query %systemdrive%  >nul 2>&1 || (
echo ==== ERROR ====
echo This script require administrator privileges.
echo To do so, right click on this script and select 'Run as administrator'
echo.
echo Press any key to exit...
pause >nul
exit
)

setlocal EnableExtensions DisableDelayedExpansion

rem you can use like this from CLI : bbphp download php-8.2.2-Win32-vs16-x64
IF "%1"=="download" (
  IF NOT "%2"=="" (
    SET "PHPVERSION=%2"
	goto FETCHPHPBIN
  ) ELSE (
	goto DOWNLOADPHPBIN
  )
)

rem you can use like this from CLI : bbphp install php-8.2.2-Win32-vs16-x64
IF "%1"=="install" (
	goto REPLACEPHPBIN
)



:======================================================================================================================================================
:MAINMENU
cls
echo.
echo PHPBrowserBox v6.0 PHP Menu
echo.
echo.  [1] Detect Current PHP Version
echo.
echo.  [2] Download New PHP Version
echo.
echo.  [3] Install Downloaded PHP Version
echo.
echo.  [4] Exit
echo.
choice /C:1234 /N /M " Enter Your Choice [1,2,3,4] : "

if %errorlevel%==1 Goto:DETECTPHPVER
if %errorlevel%==2 Goto:DOWNLOADPHPBIN
if %errorlevel%==3 Goto:INSTALLPHPBIN
if %errorlevel%==4 Goto:EXITMNU

:DETECTPHPVER
php --version
echo.
pause
goto MAINMENU


:DOWNLOADPHPBIN
echo.
call bbphpdownload.cmd
pause
goto MAINMENU

echo Select PHP Version to Download
echo.
echo.  [1] Download php-8.2.2-Win32-vs16-x64
echo.
echo.  [2] Download php-8.1.10-Win32-vs16-x64
echo.
echo.  [3] Download php-8.0.19-Win32-vs16-x64
echo.
echo.  [4] Download php-7.4.6-Win32-vc15-x64
echo.
echo.  [5] Download php-7.3.9-Win32-VC15-x64
echo.
echo.  [6] Download php-7.2.33-Win32-VC15-x64
echo.
echo.  [7] Download php-7.1.14-Win32-VC14-x64
echo.
echo.  [8] Download php-5.5.15-Win32-VC11-x64
echo.
echo.  [9] Main Menu
echo.
choice /C:123456789 /N /M " Enter Your Choice [1,2,3,4,5,6,7,8,9] : "
echo.

if %errorlevel%==1 set "PHPVERSION=php-8.2.2-Win32-vs16-x64" && goto FETCHPHPBIN
if %errorlevel%==2 set "PHPVERSION=php-8.1.10-Win32-vs16-x64" && goto FETCHPHPBIN
if %errorlevel%==3 set "PHPVERSION=php-8.0.19-Win32-vs16-x64" && goto FETCHPHPBIN
if %errorlevel%==4 set "PHPVERSION=php-7.4.6-Win32-vc15-x64" && goto FETCHPHPBIN
if %errorlevel%==5 set "PHPVERSION=php-7.3.9-Win32-VC15-x64" && goto FETCHPHPBIN
if %errorlevel%==6 set "PHPVERSION=php-7.2.33-Win32-VC15-x64" && goto FETCHPHPBIN
if %errorlevel%==7 set "PHPVERSION=php-7.1.14-Win32-VC14-x64" && goto FETCHPHPBIN
if %errorlevel%==8 set "PHPVERSION=php-5.5.15-Win32-VC11-x64" && goto FETCHPHPBIN
if %errorlevel%==9 goto MAINMENU


:INSTALLPHPBIN
echo.
call bbphpinstall.cmd
echo.
pause
goto MAINMENU


:FETCHPHPBIN
rem set "url=http://localhost:8080/playground/binaries/archives/%PHPVERSION%.zip"
set "url=https://windows.php.net/downloads/releases/archives/%PHPVERSION%.zip"

set "download_folder=%BBHOME%downloads"
set "download_path=%download_folder%\%PHPVERSION%.zip"

IF EXIST "%download_path%" (
	echo.
	echo You already have the target %download_path%
	echo.
  pause
	goto MAINMENU
)

echo.
echo Source :: %url%
echo Destination :: %download_path%
echo.

choice /C:GXS /N /M "[S] Start Downloading [G] Go Back  [X] Exit : "
if %errorlevel%==1 Goto:DOWNLOADPHPBIN
if %errorlevel%==2 Goto:EXITMNU

if NOT EXIST "%download_folder%" mkdir "%download_folder%"

echo.
echo Downloading %url%...

curl.exe -o "%download_path%" "%url%"

echo.
echo Download of %PHPVERSION% completed
echo.
pause
goto MAINMENU


:EXITMNU
