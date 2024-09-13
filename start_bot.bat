@echo off
title StartBotGramAddict
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
$exitCode = $LASTEXITCODE
if ($exitCode -gt 0) {
    echo CRASH OCCURED, Staying alive ...
    goto loop
}