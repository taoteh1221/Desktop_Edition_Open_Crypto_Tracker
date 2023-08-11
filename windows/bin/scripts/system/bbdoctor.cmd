@echo off
:======================================================================================================================================================
:This was written by Anthony Ogundipe, diltony@gmail.com as part of phpbrowserbox v6x CLI
:Feel free to modify for your own use, but dont remove this information
:======================================================================================================================================================

setlocal EnableExtensions EnableDelayedExpansion


:======================================================================================================================================================

:MAINMENU

echo === Checking Application Version
bbconsole -v


echo.
echo === Checking Apache Version
httpd -v



echo.
echo === Checking PHP Version
php --version



echo.
echo === Checking MySQL Version
mysql --version


echo.
echo === Testing Apache Config
httpd -t

echo.
pause
