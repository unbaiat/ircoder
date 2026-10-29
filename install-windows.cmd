@echo off
rem Installs the ClipAI_Word add-in for Word for the current Windows user. No admin rights needed.
rem It downloads the add-in manifest and registers it in Word's per-user developer add-in list.
setlocal
set "ADDIN_ID=bfcdbf3e-b664-4722-be3d-ee13fae01b07"
set "MANIFEST_URL=https://unbaiat.github.io/ircoder/manifest.xml"
set "TARGET=%LOCALAPPDATA%\ClipAI_Word"

echo Installing ClipAI_Word for Word...
if not exist "%TARGET%" mkdir "%TARGET%"

curl.exe -fsSL "%MANIFEST_URL%" -o "%TARGET%\manifest.xml"
if errorlevel 1 goto failed

reg add "HKCU\Software\Microsoft\Office\16.0\Wef\Developer" /v "%ADDIN_ID%" /t REG_SZ /d "%TARGET%\manifest.xml" /f >nul
if errorlevel 1 goto failed

echo.
echo Done. Close Word if it is open and start it again, then select
echo ClipAI on the Home tab. If it isn't there, choose Home ^> Add-ins ^> ClipAI_Word.
echo.
pause
exit /b 0

:failed
echo.
echo Installation failed. Check your internet connection and try again.
echo.
pause
exit /b 1
