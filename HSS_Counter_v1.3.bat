::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCWOcUO7C7AYq9Tf4P2JrkIcUPEDcJzI5beBNe4H71epeJc+wn9IpMICHA5MMBCqem8=
::fBE1pAF6MU+EWHreyHcjLQlHcCWOcUO7C7AYq9Tf4P2JrkIcUPEDcJzI5beBNe4H71epeJc+wn9IpPkJDR9Ve1y/dhtU
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBNQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQImeVUHLA==
::ZQ05rAF9IBncCkqN+0xwdVtCHUrRXA==
::ZQ05rAF9IAHYFVzEqQIYGygUbwuXMn+/FNU=
::eg0/rx1wNQPfEVWB+kM9LVsJDCyxDyuZCaAS/O3pr/zW7B59
::fBEirQZwNQPfEVWB+kM9LVsJDCyxDyuZCaAS/O3pr/zW7B59
::cRolqwZ3JBvQF1fEqQIYGygUbwuXMn+/FNU=
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE1E8iIRlGTRWGPnm7Zg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmsx3FwCxRBQhCHLgs=
::Zh4grVQjdCyDJGyX8VAjFDpYASyDMW6+RYk45//14+WGpl4hXPEsR4zUz7qaJfJe50T3YZM/6lJpq/QvAw5Wahe5URll5z0Ms3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title HSS Counter v1.3
color 0d
mode con: cols=50 lines=20
:: Always on top function Source: https://stackoverflow.com/questions/32554646/always-on-top-batch-script
echo. Loading...
@powershell -ExecutionPolicy UnRestricted -Command "(Add-Type -memberDefinition \"[DllImport(\"\"user32.dll\"\")] public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int x,int y,int cx, int xy, uint flagsw);\" -name \"Win32SetWindowPos\" -passThru )::SetWindowPos((Add-Type -memberDefinition \"[DllImport(\"\"Kernel32.dll\"\")] public static extern IntPtr GetConsoleWindow();\" -name \"Win32GetConsoleWindow\" -passThru )::GetConsoleWindow(),-1,0,0,0,0,67)"
::Auto backup function if older then 1 day
forfiles /p "HSS_Counter_Logs" -s -m *.log -d -01 -c "cmd /c ren @file @fname.bak" 2>&1 >nul
FOR /f %%a in ('WMIC OS GET LocalDateTime ^| find "."') DO set DTS=%%a
set CUR_DATE=%DTS:~0,4%-%DTS:~4,2%-%DTS:~6,2%
rename HSS_Counter_Logs\hsscounter.bak hsscounter_%CUR_DATE%.bak 2>&1 >nul
if not exist bak (md bak)
move /-y "HSS_Counter_Logs\*.bak" "bak"
::==============================
::HSS Counter v1.3
::Author: @mribraqdbra
::Source: https://github.com/mribraqdbra/hss_counter
::==============================
::::::::::::::::::::::::::::::[main:start]
:main
color %colorcode%
cls
echo ==============================
echo.      HSS Counter v1.3
echo ==============================
echo.
echo  1. Add Member(ID)
echo.
echo  2. Add Stuff(Name)
echo.
echo  3. View/Edit
echo.
echo  0. Exit
echo.
set /p input=: || set input="?"
if /i %input%==1 goto addmember
if /i %input%==2 goto addstuff
if /i %input%==3 goto vieworedit
if /i %input%==0 goto exit
if /i %input%==cc cls && echo. && set /p colorcode=Please enter your ColorCode: || set colorcode="?" & goto main
cls
echo.
echo           %input% Invalid option!
echo.
pause
goto main
::::::::::::::::::::::::::::::[main:end]
echo.
::::::::::::::::::::::::::::::[addmember:start]
:addmember
cls
echo.
echo.
:: Advanced user input in batch [using xcopy]
:: Source: https://superuser.com/questions/1290375/limit-length-of-user-input-batch
set input=^
for %%. in (1 2) do if %%.==2 (^
for /F "delims=" %%I in ('input.bat !args!') do ^
set "memberid=%%I"^
) else set args=
setlocal EnableDelayedExpansion
set memberid="?"
%input% "prompt=MemberID(#):" "length=6" "allowed=1 2 3 4 5 6 7 8 9 0"
setlocal DisableDelayedExpansion
if /i %memberid%==0 goto main
echo.
echo.
:: Advanced user input in batch [using xcopy]
:: Source: https://superuser.com/questions/1290375/limit-length-of-user-input-batch
set input=^
for %%. in (1 2) do if %%.==2 (^
for /F "delims=" %%I in ('input.bat !args!') do ^
set "memberamount=%%I"^
) else set args=
setlocal EnableDelayedExpansion
set memberamount="?"
%input% "prompt=Amount($):" "length=4" "allowed=1 2 3 4 5 6 7 8 9 0"
setlocal DisableDelayedExpansion
if /i %memberamount%==0 goto main
if not exist HSS_Counter_Logs (md HSS_Counter_Logs)
if exist "HSS_Counter_Logs\hsscounter.log" (
echo. %memberid% - %memberamount%R - [%date%] [%time%] >>HSS_Counter_Logs\hsscounter.log
) else (
echo.
echo. HSS Counter v1.3 >>HSS_Counter_Logs\hsscounter.log
echo. >>HSS_Counter_Logs\hsscounter.log
echo. ================================ >>HSS_Counter_Logs\hsscounter.log
echo. Stuff[ID] - Amount[$] - Time[T] >>HSS_Counter_Logs\hsscounter.log
echo. ================================ >>HSS_Counter_Logs\hsscounter.log
echo. %memberid% - %memberamount%R - [%date%] [%time%] >>HSS_Counter_Logs\hsscounter.log
)
goto main
::::::::::::::::::::::::::::::[addmember:end]
echo.
::::::::::::::::::::::::::::::[addstuff:start]
:addstuff
cls
echo.
echo.
:: Advanced user input in batch [using xcopy]
:: Source: https://superuser.com/questions/1290375/limit-length-of-user-input-batch
set input=^
for %%. in (1 2) do if %%.==2 (^
for /F "delims=" %%I in ('input.bat !args!') do ^
set "stuffname=%%I"^
) else set args=
setlocal EnableDelayedExpansion
set stuffname="?"
%input% "prompt=Stuff(Name):" "length=6" "allowed=a A b B c C d D e E f F g G h H i I j J k K l L m M n N o O p P q Q r R s S t T u U v V w W x X y Y z Z 0"
setlocal DisableDelayedExpansion
if /i %stuffname%==0 goto main
echo.
echo.
:: Advanced user input in batch [using xcopy]
:: Source: https://superuser.com/questions/1290375/limit-length-of-user-input-batch
set input=^
for %%. in (1 2) do if %%.==2 (^
for /F "delims=" %%I in ('input.bat !args!') do ^
set "stuffamount=%%I"^
) else set args=
setlocal EnableDelayedExpansion
set stuffamount="?"
%input% "prompt=Total Cash($):" "length=5" "allowed=1 2 3 4 5 6 7 8 9 0"
setlocal DisableDelayedExpansion
if /i %stuffamount%==0 goto main
if not exist HSS_Counter_Logs (md HSS_Counter_Logs)
if exist "HSS_Counter_Logs\hsscounter.log" (
echo. %stuffname% - %stuffamount%R - [%date%] [%time%] >>HSS_Counter_Logs\hsscounter.log
) else (
echo.
echo. HSS Counter v1.3 >>HSS_Counter_Logs\hsscounter.log
echo. >>HSS_Counter_Logs\hsscounter.log
echo. ================================ >>HSS_Counter_Logs\hsscounter.log
echo. Stuff[ID] - Amount[$] - Time[T] >>HSS_Counter_Logs\hsscounter.log
echo. ================================ >>HSS_Counter_Logs\hsscounter.log
echo. %stuffname% - %stuffamount%R - [%date%] [%time%] >>HSS_Counter_Logs\hsscounter.log
)
goto main
::::::::::::::::::::::::::::::[addstuff:end]
echo.
::::::::::::::::::::::::::::::[vieworedit:start]
:vieworedit
cls
echo.
echo  1. View Log
echo.
echo  2. Find string
echo.
echo  3. Remove string
echo.
echo  0. Back
echo.
set /p vieworedit=: || set vieworedit="?"
if /i %vieworedit%==1 goto viewlog
if /i %vieworedit%==2 goto findstring
if /i %vieworedit%==3 goto removestring
if /i %vieworedit%==0 goto main
cls
goto vieworedit
::::::::::::::::::::::::::::::[vieworedit:end]
echo.
::::::::::::::::::::::::::::::[viewlog:start]
:viewlog
cls
type HSS_Counter_Logs\hsscounter.log
echo.
pause
goto vieworedit
::::::::::::::::::::::::::::::[viewlog:end]
echo.
::::::::::::::::::::::::::::::[findstring:start]
:findstring
cls
echo.
echo.
set /p findstring=: || set findstring="?"
if /i %findstring%==0 goto vieworedit
cls
echo.
echo. Finding the string wait...
timeout /t 2 /nobreak 2>&1 >nul
echo.
findstr /i /c:"%findstring%" HSS_Counter_Logs\hsscounter.log
if not errorlevel 1 (
echo.
echo.
echo. Done!
echo.
echo.
pause
goto vieworedit
) else (
echo.
echo.
echo. Error! Nothing found!
echo.
pause
goto vieworedit
)
::::::::::::::::::::::::::::::[findstring:end]
echo.
::::::::::::::::::::::::::::::[removestring:start]
:removestring
cls
echo.
echo.
set /p removestring=: || set removestring="?"
if /i %removestring%==0 goto vieworedit
cls
echo.
echo. Finding the string wait...
timeout /t 2 /nobreak 2>&1 >nul
echo.
findstr /i /c:"%removestring%" HSS_Counter_Logs\hsscounter.log
if not errorlevel 1 (
goto confirmremovestring
) else (
echo.
echo.
echo. Error! Nothing found!
echo.
pause
goto vieworedit
)
::::::::::::::::::::::::::::::[removestring:end]
echo.
::::::::::::::::::::::::::::::[confirmremovestring:start]
:confirmremovestring
cls
echo.
echo.
findstr /i /c:"%removestring%" HSS_Counter_Logs\hsscounter.log
echo.
echo.
set /p confirmremovestring=Are you sure want to continue Yes=1/No=0?: || set confirmremovestring="?"
if /i %confirmremovestring%==1 goto applyremovestring
if /i %confirmremovestring%==0 goto vieworedit
goto confirmremovestring
::::::::::::::::::::::::::::::[confirmremovestring:end]
echo.
::::::::::::::::::::::::::::::[applyremovestring:start]
:applyremovestring
cls
findstr /v /i /L /c:"%removestring%" HSS_Counter_Logs\hsscounter.log >HSS_Counter_Logs\HSS_Counter_Logs_out.log & del /q HSS_Counter_Logs\hsscounter.log
cd HSS_Counter_Logs && ren HSS_Counter_Logs_out.log hsscounter.log & cd..
echo.
echo.
echo. Done!
echo.
echo.
pause
goto vieworedit
::::::::::::::::::::::::::::::[applyremovestring:end]
echo.
::::::::::::::::::::::::::::::[exit:start]
:exit
cls
exit /b
::::::::::::::::::::::::::::::[exit:end]
echo.
::==============================
::HSS Counter v1.3
::Author: @mribraqdbra
::Source: https://github.com/mribraqdbra/hss_counter
::==============================