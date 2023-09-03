@echo off

:: Set the server address
set "serverAddress=mc.website3.cf:2762"

Title Minecraft Bedrock Proxy [%serverAddress%]

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
    >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
    >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin

:: Now run the rest of your script here
@echo off

:: Define the URL and file name
set "downloadURL=https://github.com/jhead/phantom/releases/download/v0.5.4/phantom-windows.exe"
set "fileName=phantom-windows.exe"

:: Check if the file exists, and if not, download it using PowerShell
if not exist "%fileName%" (
    echo File not found. Downloading %fileName%...
    
    :: Download the file using PowerShell
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('%downloadURL%', '%fileName%')"
    
    :: Check if the file was downloaded successfully
    if exist "%fileName%" (
        echo File %fileName% downloaded successfully.
    ) else (
        echo Error downloading %fileName%. Check your internet connection or the download URL.
        pause
        exit /B 1
    )
)

:: Run the command
cd /d "%~dp0"
%fileName% -server %serverAddress%

:: Restore the original working directory
cd /d "%~dp0"

:: Pause until a key is pressed
pause
