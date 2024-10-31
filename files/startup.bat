@echo off
REM Set the path to the program executable
set "programPath=rustdesk-1.3.1-x86_64.exe"

REM Set the name for the shortcut
set "shortcutName=rustdesk-1.3.1-x86_64.lnk"

REM Get the startup folder path
set "startupFolder=%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

REM Use PowerShell to create the shortcut in the startup folder
powershell -command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%startupFolder%\%shortcutName%'); $s.TargetPath = '%programPath%'; $s.Save()"

echo Program added to startup.
pause
