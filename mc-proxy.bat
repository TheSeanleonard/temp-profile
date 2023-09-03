@echo off

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

:: Check if the file exists, and if not, download it
if not exist "%fileName%" (
    echo File not found. Downloading %fileName%...
    
    :: Check if bitsadmin is available
    bitsadmin /? >nul 2>&1
    if %errorlevel% EQU 0 (
        bitsadmin /transfer "Downloading" "%downloadURL%" "%fileName%"
        if %errorlevel% NEQ 0 (
            echo Error downloading %fileName%. Check your internet connection or the download URL.
            pause
            exit /B 1
        )
    ) else (
        echo BITS (Background Intelligent Transfer Service) is not available on this system. Cannot download the file.
        pause
        exit /B 1
    )
)

:: Run the command
cd /d "%~dp0"
%fileName% -server mc.website3.cf:2762

:: Restore the original working directory
cd /d "%~dp0"

:: Pause to keep the console window open (opti onal)
pause@echo off

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

:: Check if the file exists, and if not, download it
if not exist "%fileName%" (
    echo File not found. Downloading %fileName%...
    
    :: Check if bitsadmin is available
    bitsadmin /? >nul 2>&1
    if %errorlevel% EQU 0 (
        bitsadmin /transfer "Downloading" "%downloadURL%" "%fileName%"
        if %errorlevel% NEQ 0 (
            echo Error downloading %fileName%. Check your internet connection or the download URL.
            pause
            exit /B 1
        )
    ) else (
        echo BITS (Background Intelligent Transfer Service) is not available on this system. Cannot download the file.
        pause
        exit /B 1
    )
)

:: Run the command
cd /d "%~dp0"
%fileName% -server mc.website3.cf:2762

:: Restore the original working directory
cd /d "%~dp0"

:: Pause to keep the console window open (optional)
pause
