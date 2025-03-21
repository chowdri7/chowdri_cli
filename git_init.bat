@echo off
echo/
echo ===============================
echo   Create New GitHub Repo
echo ===============================
echo/

REM Get repository name
set "reponame="
set /p "reponame=Enter new GitHub repository name: "

REM Get visibility choice
echo/
echo Select repository visibility:
echo   1) Public
echo   2) Private
set "visibilityChoice="
set /p "visibilityChoice=Choice (1/2): "

if /i "%visibilityChoice%"=="1" (
    set "visibility=--public"
) else (
    set "visibility=--private"
)

REM Create repo
echo/
echo Creating repository '%reponame%' on GitHub...
gh repo create %reponame% %visibility% --confirm
if errorlevel 1 (
    echo Failed to create repository
    pause
    exit /b 1
)

REM Initialize local repo
git init

echo/
echo Setting remote 'origin'...
git remote add origin https://github.com/chowdri7/%reponame%.git 2>nul

echo/
echo Staging files...
git add .

REM Commit changes
set "initialCommitMsg="
set /p "initialCommitMsg=Enter initial commit message: "
git commit -m "%initialCommitMsg%"
git branch -M main

REM Push to GitHub
echo/
echo Pushing to GitHub...
git push -u origin main

echo/
echo Repository created and pushed successfully!
pause