@echo off
:======================================================================================================================================================
:This was written by Anthony Ogundipe, diltony@gmail.com as part of phpbrowserbox v6x CLI
:Feel free to modify for your own use, but dont remove this information
:======================================================================================================================================================

echo kill phpbrowserbox
taskkill /f /im phpbrowserbox.exe

echo kill phpbbwebkit
taskkill /f /im bbwebkit.exe
