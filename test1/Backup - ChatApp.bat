@echo off

:: Source directory
set SOURCE_DIR="C:\Program Files\Apache Software Foundation\Tomcat1\webapps\ChatApp"

:: Destination directory
set DEST_DIR="C:\Users\chowdri-tt0825\Desktop\Backup-ChatAPP"

:: Get current timestamp in DD-MM-YYYY_HH-MM-SS format
for /f "tokens=1-4 delims=/- " %%A in ('echo %date%') do set DATE_PART=%%C-%%B-%%A
for /f "tokens=1-4 delims=:. " %%A in ('echo %time%') do set TIME_PART=%%A-%%B-%%C
set TIMESTAMP=%DATE_PART%_%TIME_PART%

:: Prompt user for an optional comment
set /p COMMENT=Enter an optional comment for the backup folder (leave blank for none):

:: Create the folder name with timestamp and optional comment
if "%COMMENT%"=="" (
    set BACKUP_FOLDER=%DEST_DIR%\%TIMESTAMP%
) else (
    set BACKUP_FOLDER=%DEST_DIR%\%TIMESTAMP% - %COMMENT%
)

:: Create the backup folder
mkdir "%BACKUP_FOLDER%"

:: Copy contents from source to backup folder
xcopy %SOURCE_DIR% "%BACKUP_FOLDER%" /E /H /C /I

:: Notify user of completion
echo Backup completed! Files are saved in: "%BACKUP_FOLDER%"
exit
