@echo off
set "url=https://github.com/rustdesk/rustdesk/releases/download/1.3.1/rustdesk-1.3.1-x86_64.exe"
set "filename=rustdesk-1.3.1-x86_64.exe"
set "filepath=%~dp0%filename%"

:: Check if the file already exists
if exist "%filepath%" (
    echo File "%filename%" already exists in the current directory.
) else (
    :: Download the file using PowerShell
    certutil -urlcache -split -f "%url%" "%filepath%"

    echo File downloaded to "%filepath%".
)

set "folderPath=%AppData%\RustDesk\config"
if not exist "%folderPath%" (
    mkdir "%folderPath%"
)

set "outputFile=%folderPath%\RustDesk2.toml"

(
echo rendezvous_server = 'portable.liangdengyu.com:21116'
echo [options]
echo verification-method = 'use-both-passwords'
echo relay-server = 'portable.liangdengyu.com'
echo key = 'oZ7R6RFgxt4iBCe3BgRFwpI6VqCopXs0NTcQak6orHE='
echo custom-rendezvous-server = 'portable.liangdengyu.com'
echo allow-remote-config-modification = 'Y'
) > "%outputFile%"

start "" "rustdesk-1.3.1-x86_64.exe"
