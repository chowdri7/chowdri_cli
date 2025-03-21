@echo off
echo.
echo ===============================
echo     Local Commit - Push
echo ===============================
echo.

:: Prompt for a commit message
set /p commitMsg="Enter commit message: "

:: Stage all changes, commit, and push
git add .
git commit -m "%commitMsg%"
git push origin main

echo.
echo Commit and push complete!
pause
