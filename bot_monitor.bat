@echo off
setlocal EnableDelayedExpansion
set "processTitle=StartBotGramAddict"
cd %CD%

set "scriptPath=.\start_bot.bat"
set "maxAttempts=10"
set "attemptFile=.\attemptCount.txt"
if not exist "%attemptFile%" (
    echo 0 > "%attemptFile%"
)

set /p attemptCount=<%attemptFile%

echo Checking if the script is running...
tasklist /v /fi "IMAGENAME eq cmd.exe" | findstr /I /C:"%processTitle%" >nul

if %ERRORLEVEL% neq 0 (
    set /a attemptcnt=%attemptCount%+1
    goto not_running
) else (
    goto running
)

:not_running
echo Script not running! Attempting to start the script... Attempt #%attemptcnt%
echo %attemptcnt% > %attemptFile%
timeout /t 2
start "" "%scriptPath%"

if %attemptcnt% geq %maxAttempts% (
    echo Maximum attempts reached! Restarting computer...
    echo Script not running! Restarting computer ...
    echo Disable this script by removing the task scheduler item ...
    timeout /t 30
    shutdown /r /t 0
)
exit

:running
echo Checking GramAddict bot ...
echo Script is still running :D ...
set /a attemptCount=0
echo %attemptCount% > "%attemptFile%"
timeout /t 2
exit