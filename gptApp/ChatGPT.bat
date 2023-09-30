@echo off
setlocal enabledelayedexpansion

set "launcherPath=C:\Users\alexei\AppData\Local\Programs\Opera"
set "url=chat.openai.com"

echo !url! | find "?" > nul
if errorlevel 1 (
    set "url=!url!?popUp=true"
) else (
    set "url=!url!&popUp=true"
)

%launcherPath%\launcher --new-window "chat.openai.com?popUp=true"
