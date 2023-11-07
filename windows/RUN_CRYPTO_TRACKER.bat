@echo off


:: Set paths
set browser_dir="bin\bbwebkit"
set temp_cache="bin\bbwebkit\user-dir\Default\Cache\Cache_Data"


:: ONLY DELETE FILES WITH THE PREFIX: data_
cd /d %temp_cache%
for /F "delims=" %%i in ('dir *data_* /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)  >nul 2>&1


:: Give the cache a small breather
timeout 2


:: Fire up the browser
cd /d ..\..\..\..\..\..\%browser_dir%
start "" bbwebkit.exe --aggressive-cache-discard --enable-aggressive-domstorage-flushing  >nul 2>&1