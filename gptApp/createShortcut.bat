@echo off
setlocal enabledelayedexpansion

for %%A in ("%~dp0") do set "batchFileDir=%%~A"

set "sourceBatchFile=%batchFileDir%\ChatGPT.bat"
set "shortcutLocation=%batchFileDir%"
set "shortcutName=ChatGPT.lnk"
set "iconPath=%batchFileDir%\icon.ico"

set "shortcutCommand=powershell -command "$WScriptShell = New-Object -ComObject WScript.Shell;$Shortcut = $WScriptShell.CreateShortcut('%shortcutLocation%\%shortcutName%');$Shortcut.TargetPath = 'cmd.exe';$Shortcut.Arguments = '/C \"%sourceBatchFile%\"';$Shortcut.IconLocation = '%iconPath%';$Shortcut.Save()""
%shortcutCommand%

echo Shortcut created with icon!
