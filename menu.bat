@echo off
:loop
set /p filename=Enter the file name (e.g., home.txt): 
set filepath=%CD%\app\pages\txt\%filename%\page.txt
set notepadpath=%CD%\app\\notepad\notepad.exe

if exist "%filepath%" (
    start "" "%notepadpath%" "%filepath%"
) else (
    echo File not found: %filepath%
)

echo.
echo Press any key to enter another file name or close the window to exit.
pause >nul
goto loop
