@echo off
setlocal enabledelayedexpansion

REM Get the directory of the batch file
for %%A in ("%~dp0") do set "batchFileDir=%%~A"

REM Define the paths
set "sourceBatchFile=%batchFileDir%\ChatGPT.bat"
set "shortcutLocation=%batchFileDir%"
set "shortcutName=ChatGPT.lnk"
set "iconPath=%batchFileDir%\icon.ico"

REM Create the shortcut
set "shortcutCommand=powershell -command "$WScriptShell = New-Object -ComObject WScript.Shell;$Shortcut = $WScriptShell.CreateShortcut('%shortcutLocation%\%shortcutName%');$Shortcut.TargetPath = '%sourceBatchFile%';$Shortcut.IconLocation = '%iconPath%';$Shortcut.Save()""
%shortcutCommand%

echo Shortcut created with icon!