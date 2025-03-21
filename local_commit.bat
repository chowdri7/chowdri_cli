@echo off
echo.
echo ===============================
echo     Initialize Local Git
echo ===============================
echo.

:: Initialize a new Git repo
git init

echo.
echo Git repository initialized in the current directory.

:: Stage all files
git add .

:: Prompt for the initial commit message
set /p commitMsg="Enter initial commit message: "

git commit -m "%commitMsg%"

echo.
echo Local Git repo initialized and first commit done!
pause
