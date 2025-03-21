@echo off
echo.
echo ===============================
echo     Pull/Reset to Latest
echo ===============================
echo.

git fetch origin
git checkout main
git reset --hard origin/main

echo.
echo Pulled latest changes from 'origin/main' and reset local 'main' to match.
pause
