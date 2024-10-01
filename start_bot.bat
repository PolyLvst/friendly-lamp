@echo off
title StartBotGramAddict
set /a attemptCount=0
set "maxAttempts=3"
cd %CD%
if not exist "./venv" (
    echo Creating virtual environment...
    python -m venv venv
    echo Installing requirements...
    call ./venv/Scripts/activate
    pip install gramaddict
) else (
    call ./venv/Scripts/activate
)
echo Sleeping 30s
timeout /t 30 > nul
:loop
echo Checking adb devices
adb connect localhost:5555
adb devices
python -m uiautomator2 init
py run.py --config accounts/nama-akun-mu/config.yml
if %ERRORLEVEL% neq 0 (
    echo The command failed with exit code %ERRORLEVEL%.
    echo CRASH OCCURED, Staying alive ...
    set /a attemptcnt=%attemptCount%+1
    goto crash_count
) else (
    echo The command succeeded with exit code %ERRORLEVEL%.
    echo Something is crashing
    exit
)
exit

:crash_count
echo Trying again ...
if %attemptcnt% geq %maxAttempts% (
    echo Maximum attempts reached! Restarting computer...
    echo Script not running! Restarting computer ...
    timeout /t 30
    shutdown /r /t 0
)
goto loop