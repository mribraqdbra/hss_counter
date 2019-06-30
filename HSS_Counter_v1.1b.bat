@echo off
title HSS Counter v1.1b
color 0d
mode con: cols=50 lines=20
:: Always on top function source: https://stackoverflow.com/questions/32554646/always-on-top-batch-script
@powershell -ExecutionPolicy UnRestricted -Command "(Add-Type -memberDefinition \"[DllImport(\"\"user32.dll\"\")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int x,int y,int cx, int xy, uint flagsw);\" -name \"Win32SetWindowPos\" -passThru )::SetWindowPos((Add-Type -memberDefinition \"[DllImport(\"\"Kernel32.dll\"\")] public static extern IntPtr GetConsoleWindow();\" -name \"Win32GetConsoleWindow\" -passThru )::GetConsoleWindow(),-1,0,0,0,0,67)"
::==============================
::HSS Counter v1.1b
::@mribraqdbra - 2019-06-29
::==============================
echo.
::::::::::::::::::::::::::::::[main:start]
:main
cls
echo ==============================
echo.      HSS Counter v1.1b
echo.  @mribraqdbra - 2019-06-29
echo ==============================
echo.
echo.
echo  1. Add
echo.
echo  2. View/Edit
echo.
echo  0. Exit
echo.
set /p input=: || set input="?"
if /I %input%==1 goto add
if /I %input%==2 goto vieworedit
if /I %input%==0 goto exit
cls
echo.
echo           %input% Invalid option!
echo.
pause
goto main
::::::::::::::::::::::::::::::[main:end]
echo.
::::::::::::::::::::::::::::::[add:start]
:add
cls
echo.
echo.
set /p moneytype=Cash=1 / Later=2 ?: || set moneytype="?"
if /I %moneytype%==1 goto cash
if /I %moneytype%==2 goto money
if /I %moneytype%==0 goto main
echo.
echo           %input% Invalid option!
echo.
pause
goto add
::::::::::::::::::::::::::::::[add:end]
echo.
::::::::::::::::::::::::::::::[cash:start]
:cash
cls
echo.
echo.
set /p stuffname=Stuff Name{#}: || set stuffname="?"
if /I %stuffname%==0 goto main
echo.
echo.
set /p totalcash=Total Cash{$}: || set totalcash="?"
if /I %totalcash%==0 goto main
md HSS_Counter
echo. >>HSS_Counter\cash.log
echo  ------------------------------ >>HSS_Counter\cash.log
echo  %date% - %time% >>HSS_Counter\cash.log
echo. >>HSS_Counter\cash.log
echo. >>HSS_Counter\cash.log
echo  Stuff Name{#}: %stuffname% >>HSS_Counter\cash.log
echo. >>HSS_Counter\cash.log
echo  Total Cash{$}: %totalcash%R >>HSS_Counter\cash.log
echo. >>HSS_Counter\cash.log
echo  {Type}: Take Cash >>HSS_Counter\cash.log
echo  ------------------------------ >>HSS_Counter\cash.log
echo. >>HSS_Counter\cash.log
goto main
::::::::::::::::::::::::::::::[cash:end]
:money
::::::::::::::::::::::::::::::[money:end]
cls
echo.
echo.
set /p username=UserName{-}: || set username="?"
if /I %username%==0 goto main
echo.
echo.
set /p memberid=MemberID{#}: || set memberid="?"
if /I %memberid%==0 goto main
echo.
echo.
set /p amount=Amount{$}: || set amount="?"
if /I %amount%==0 goto main
md HSS_Counter
echo. >>HSS_Counter\money.log
echo  ------------------------------ >>HSS_Counter\money.log
echo  %date% - %time% >>HSS_Counter\money.log
echo. >>HSS_Counter\money.log
echo. >>HSS_Counter\money.log
echo  User Name{-}: %username% >>HSS_Counter\money.log
echo. >>HSS_Counter\money.log
echo  MemberID{#}: %memberid% >>HSS_Counter\money.log
echo. >>HSS_Counter\money.log
echo  Amount{$}: %amount%R >>HSS_Counter\money.log
echo. >>HSS_Counter\money.log
echo  {Type}: Money Later >>HSS_Counter\money.log
echo  ------------------------------ >>HSS_Counter\money.log
echo. >>HSS_Counter\money.log
goto main
::::::::::::::::::::::::::::::[money:end]
echo.
::::::::::::::::::::::::::::::[vieworedit:start]
:vieworedit
cls
echo.
echo  1. View/Edit cash.log
echo.
echo  2. View/Edit money.log
echo.
echo  3. Rename old logs
echo.
echo  4. Remove all logs
echo.
echo  0. Back
echo.
set /p vieworedit=: || set vieworedit="?"
if /I %vieworedit%==1 start HSS_Counter\cash.log
if /I %vieworedit%==2 start HSS_Counter\money.log
if /I %vieworedit%==3 goto renamecurrentlogs
if /I %vieworedit%==4 goto renameoldlogs
if /I %vieworedit%==0 goto main
cls
echo.
echo           %vieworedit% Invalid option!
goto vieworedit
::::::::::::::::::::::::::::::[vieworedit:end]
echo.
::::::::::::::::::::::::::::::[renameoldlogs:start]
:renameoldlogs
del /q HSS_Counter\cash_*.log
del /q HSS_Counter\money_*.log
cls
echo.
echo  Success!
echo.
pause
goto vieworedit
::::::::::::::::::::::::::::::[renameoldlogs:end]
echo.
::::::::::::::::::::::::::::::[renamecurrentlogs:start]
:renamecurrentlogs
set HR=%time:~0,2%
set HR=%Hr: =0% 
set HR=%HR: =%
rename HSS_Counter\cash.log cash_%date:~10,4%-%date:~4,2%-%date:~7,2%_%HR%%time:~3,2%.log
rename HSS_Counter\money.log money_%date:~10,4%-%date:~4,2%-%date:~7,2%_%HR%%time:~3,2%.log
cls
echo.
echo  Success!
echo.
pause
goto vieworedit
::::::::::::::::::::::::::::::[renamecurrentlogs:end]
echo.
::::::::::::::::::::::::::::::[exit:start]
:exit
cls
exit /b
::::::::::::::::::::::::::::::[exit:end]
echo.
::==============================
::HSS Counter v1.1b
::@mribraqdbra - 2019-06-29
::==============================