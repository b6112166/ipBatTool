@ECHO OFF&PUSHD %~DP0 &TITLE my bat

mode con cols=45lines=20
set /p a = Acess admin(y/n)?
if "%a%" == "y" (
goto BatchGotAdmin
)else(goto init)

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
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:init

set /p Ip= enter ur Ip.
if "%Ip" == "lol" set Ip=1

:Menu




@echo. ip tool
@echo. 1. ping ip
@echo. 2. trace ip
@echo. 3. change ip
@echo. 4. display ip
@echo. 5. get admin 
@echo. q. quit
set /p sel=     enter ur selection.
if /i "%sel%" == "1" Goto Ping
if /i "%sel%" == "2" Goto Trace
if /i "%sel%" == "3" Goto Change
if /i "%sel%" == "4" Goto Display
if /i "%sel%" == "q" Exit

@ echo.
echo nope 
goto menu


goto menu
:Ping
ping %Ip% -t
goto menu

:Trace

tracert %Ip% > C:\traced.txt
goto menu

:Change
set /p Ip=  enter the ip.

goto menu

:Display
echo %Ip%
goto menu


