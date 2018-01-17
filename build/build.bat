@ECHO OFF
SETLOCAL

SET __Config=Release
IF /I [%1] == [debug] (
    SET __Config=Debug
)


IF NOT EXIST "%VS120COMNTOOLS%..\..\VC\vcvarsall.bat" (
    ECHO Visual Studio 2013 not found on this computer
    PAUSE
    GOTO end
)


call "%VS120COMNTOOLS%..\..\VC\vcvarsall.bat"



:do_process

call DEVENV apihook.sln /rebuild "%__Config%|Win32"
IF NOT %ERRORLEVEL% == 0 (
    ENDLOCAL
    ECHO Errors detected while compiling Deviare
    PAUSE
    GOTO end
)

call DEVENV apihook.sln /rebuild "%__Config%|x64"
IF NOT %ERRORLEVEL% == 0 (
    ENDLOCAL
    ECHO Errors detected while compiling Deviare
    PAUSE
    GOTO end
)

:end
ENDLOCAL
