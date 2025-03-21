@echo off
:: Set the working directory to the specified location
cd "C:\Program Files\Apache Software Foundation\Tomcat1\webapps\ChatApp"

:: Set the classpath to include the Tomcat lib directory
set CLASSPATH=%CLASSPATH%;C:\Program Files\Apache Software Foundation\Tomcat1\lib\*;C:\Program Files\Apache Software Foundation\Tomcat1\webapps\ChatApp\WEB-INF\lib\*

:: Set the directory for the compiled classes
set OUTPUT_DIR=WEB-INF\classes

:: Create the output directory if it doesn't exist
if not exist "%OUTPUT_DIR%" (
    mkdir "%OUTPUT_DIR%"
)

:: Compile all Java files in the current directory (or modify the path as needed)
javac -d "%OUTPUT_DIR%" *.java

echo Compilation complete!
pause
