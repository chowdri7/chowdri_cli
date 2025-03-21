@echo off
echo.
echo ===============================
echo     Commit - Push to GitHub
echo ===============================
echo.

:: Check if it's a Git repository
git rev-parse --is-inside-work-tree >nul 2>nul
if errorlevel 1 (
    echo Error: This is not a Git repository. Run the setup script first.
    pause
    exit /b 1
)

:: Check if remote 'origin' exists
git remote get-url origin >nul 2>nul
if errorlevel 1 (
    echo.
    echo Remote 'origin' is not configured.
    set /p reponame="Enter GitHub repository name (e.g., my-project): "
    git remote add origin https://github.com/chowdri7/%reponame%.git
)

:: Stage, commit, and push
set /p commitMsg="Enter commit message: "
git add .
git commit -m "%commitMsg%"
git push -u origin main

echo.
if errorlevel 1 (
    echo Push failed! Check your network or permissions.
) else (
    echo Successfully pushed to GitHub!
)
pause