@echo off
rem Removes the ClipAI_Word add-in for the current Windows user.
setlocal
set "ADDIN_ID=bfcdbf3e-b664-4722-be3d-ee13fae01b07"

reg delete "HKCU\Software\Microsoft\Office\16.0\Wef\Developer" /v "%ADDIN_ID%" /f >nul 2>&1
if exist "%LOCALAPPDATA%\ClipAI_Word" rmdir /s /q "%LOCALAPPDATA%\ClipAI_Word"
rem Folder used by versions released under the name I R Coder.
if exist "%LOCALAPPDATA%\IRCoder" rmdir /s /q "%LOCALAPPDATA%\IRCoder"

echo.
echo ClipAI_Word was removed. Restart Word to finish.
echo.
pause
