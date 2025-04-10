@echo off
:: Set the path to your script and conhost.exe
set scriptPath=%CD%\app\script\bat\menu.bat
set conhostPath=%CD%\app\script\conhost\conhost.exe
set homePage=%CD%\app\pages\txt\browser.special.intro.txt\page.txt

:: Check if conhost.exe exists
if exist "%conhostPath%" (
    :: Launch the batch file (menu.bat) in conhost.exe
    start "" "%conhostPath%" "%scriptPath%"
) else (
    echo Error: conhost.exe not found!
)

:: Open the home.txt/page.txt file
if exist "%homePage%" (
    start "" notepad "%homePage%"
) else (
    echo Error: Welcome page not found!
)

exit
