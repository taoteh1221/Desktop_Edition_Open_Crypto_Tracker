@echo off
:======================================================================================================================================================
:This was written by Anthony Ogundipe, diltony@gmail.com as part of phpbrowserbox v6x CLI
:Feel free to modify for your own use, but dont remove this information
:======================================================================================================================================================

set "cwd=%cd%"
set "distdir=%BBDISTR%"

echo.
echo Preparing to copy files to %distdir%...

if not exist "%distdir%" mkdir "%distdir%"

echo [1/5] Copying base files...
xcopy "%BBHOME%*.exe" "%distdir%" /Y /Q >NUL

rem transfer apps
echo [2/5] Copying apps folder...
if exist "%distdir%\apps" rmdir "%distdir%\apps" /S /Q
mkdir "%distdir%\apps"
xcopy "%BBHOME%\apps\*.*" "%distdir%\apps"  /S /E /Q /Y >NUL

rem transfer assets
echo [3/5] Copying assets folder...
if exist "%distdir%\assets" rmdir "%distdir%\assets" /S /Q
mkdir "%distdir%\assets"
xcopy "%BBHOME%\assets\*.*" "%distdir%\assets"  /S /E /Q /Y >NUL

rem transfer www
echo [4/5] Copying www folder...
if exist "%distdir%\www" rmdir "%distdir%\www" /S /Q
mkdir "%distdir%\www"
xcopy "%BBHOME%\www\*.*" "%distdir%\www"  /S /E /Q /Y >NUL

rem transfer bin
echo [5/5] Copying bin folder...
if exist "%distdir%\bin" rmdir "%distdir%\bin" /S /Q
mkdir "%distdir%\bin"
xcopy "%BBHOME%\bin\*.*" "%distdir%\bin"  /S /E /Q /Y >NUL

echo.
echo Pruning binary folder...
if exist "%distdir%\bin\mysql\data" rmdir "%distdir%\bin\mysql\data" /S /Q

echo.
echo Copying completed into "%distdir%"

:END
cd "%cwd%"
