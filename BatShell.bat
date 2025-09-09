@echo off
setlocal enabledelayedexpansion

:: #############################################################################
:: #                                                                           #
:: #                             BatShell v1.0                                 #
:: #               A Custom Command-Line Tool for Windows                      #
:: #                                                                           #
:: #############################################################################

:: --- Initial Setup ---
title BatShell v1.0
color 0B
cls

:: --- Welcome Message ---
echo.
echo  BBBBBB    SSSSSS      BatShell v1.0
echo  B     B  S      S     A custom and open-source command-line tool.
echo  B     B  S            Type 'help' for a list of commands.
echo  BBBBBB    SSSSSS      Type 'exit' to quit.
echo  B     B         S
echo  B     B         S
echo  B     B  S      S
echo  BBBBBB    SSSSSS
echo.

:: #############################################################################
:: #                               MAIN LOOP                                   #
:: #############################################################################

:main_loop
:: Set a custom prompt that shows the current directory
set "prompt_str=[%cd%]$G "
set /p "userInput=!prompt_str!"

:: Parse the user input to separate the command from arguments
for /f "tokens=1,*" %%a in ("!userInput!") do (
    set "command=%%a"
    set "args=%%b"
)

:: Make command case-insensitive
set "command_lower=!command!"

:: #############################################################################
:: #                             COMMAND HANDLER                               #
:: #############################################################################

:: --- BatShell Core Commands ---
if /i "!command_lower!"=="help" goto :cmd_help
if /i "!command_lower!"=="exit" goto :cmd_exit
if /i "!command_lower!"=="quit" goto :cmd_exit
if /i "!command_lower!"=="cls" (cls & goto :main_loop)
if /i "!command_lower!"=="clear" (cls & goto :main_loop)
if /i "!command_lower!"=="ver" (echo BatShell v1.0 & goto :main_loop)
if /i "!command_lower!"=="version" (echo BatShell v1.0 & goto :main_loop)
if /i "!command_lower!"=="about" goto :cmd_about
if /i "!command_lower!"=="reprompt" goto :main_loop

:: --- System Information Commands ---
if /i "!command_lower!"=="sysinfo" (systeminfo & goto :main_loop)
if /i "!command_lower!"=="hostname" (echo %COMPUTERNAME% & goto :main_loop)
if /i "!command_lower!"=="username" (echo %USERNAME% & goto :main_loop)
if /i "!command_lower!"=="os" (ver & goto :main_loop)
if /i "!command_lower!"=="cpuinfo" (wmic cpu get name, NumberOfCores, MaxClockSpeed /format:list & goto :main_loop)
if /i "!command_lower!"=="meminfo" (wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value & goto :main_loop)
if /i "!command_lower!"=="diskinfo" (wmic logicaldisk get caption,size,freespace & goto :main_loop)
if /i "!command_lower!"=="uptime" (systeminfo | find "System Boot Time" & goto :main_loop)
if /i "!command_lower!"=="drivers" (driverquery & goto :main_loop)
if /i "!command_lower!"=="pcmodel" (wmic csproduct get name, vendor & goto :main_loop)
if /i "!command_lower!"=="battery" (wmic path Win32_Battery get EstimatedChargeRemaining, BatteryStatus & goto :main_loop)
if /i "!command_lower!"=="datetime" (echo %date% %time% & goto :main_loop)

:: --- File and Directory Management ---
if /i "!command_lower!"=="ls" (dir !args! & goto :main_loop)
if /i "!command_lower!"=="dir" (dir !args! & goto :main_loop)
if /i "!command_lower!"=="cd" (cd /d !args! & goto :main_loop)
if /i "!command_lower!"=="pwd" (echo %cd% & goto :main_loop)
if /i "!command_lower!"=="mkdir" (md !args! & goto :main_loop)
if /i "!command_lower!"=="touch" (type nul > !args! & goto :main_loop)
if /i "!command_lower!"=="del" (del !args! & goto :main_loop)
if /i "!command_lower!"=="rm" (del !args! & goto :main_loop)
if /i "!command_lower!"=="rmdir" (rd !args! & goto :main_loop)
if /i "!command_lower!"=="copy" (copy !args! & goto :main_loop)
if /i "!command_lower!"=="move" (move !args! & goto :main_loop)
if /i "!command_lower!"=="ren" (ren !args! & goto :main_loop)
if /i "!command_lower!"=="cat" (type !args! & goto :main_loop)
if /i "!command_lower!"=="type" (type !args! & goto :main_loop)
if /i "!command_lower!"=="tree" (tree !args! & goto :main_loop)
if /i "!command_lower!"=="findfile" (dir /s /b "*!args!*" & goto :main_loop)
if /i "!command_lower!"=="countfiles" (dir /b /a-d | find /c /v "" & goto :main_loop)

:: --- Networking Commands ---
if /i "!command_lower!"=="ip" (ipconfig | find "IPv4" & goto :main_loop)
if /i "!command_lower!"=="ipall" (ipconfig /all & goto :main_loop)
if /i "!command_lower!"=="ping" (ping !args! & goto :main_loop)
if /i "!command_lower!"=="trace" (tracert !args! & goto :main_loop)
if /i "!command_lower!"=="dnsflush" (ipconfig /flushdns & goto :main_loop)
if /i "!command_lower!"=="netstat" (netstat -an & goto :main_loop)
if /i "!command_lower!"=="lookup" (nslookup !args! & goto :main_loop)
if /i "!command_lower!"=="mac" (getmac /v & goto :main_loop)
if /i "!command_lower!"=="arp" (arp -a & goto :main_loop)

:: --- Process Management ---
if /i "!command_lower!"=="ps" (tasklist & goto :main_loop)
if /i "!command_lower!"=="tasklist" (tasklist & goto :main_loop)
if /i "!command_lower!"=="kill" (taskkill /F /IM !args! & goto :main_loop)
if /i "!command_lower!"=="killpid" (taskkill /F /PID !args! & goto :main_loop)
if /i "!command_lower!"=="services" (net start & goto :main_loop)

:: --- Utility and Tool Commands ---
if /i "!command_lower!"=="calc" (start calc.exe & goto :main_loop)
if /i "!command_lower!"=="notepad" (start notepad.exe !args! & goto :main_loop)
if /i "!command_lower!"=="countdown" goto :cmd_countdown
if /i "!command_lower!"=="timer" goto :cmd_countdown
if /i "!command_lower!"=="date" (echo %date% & goto :main_loop)
if /i "!command_lower!"=="time" (echo %time% & goto :main_loop)
if /i "!command_lower!"=="echo" (echo !args! & goto :main_loop)
if /i "!command_lower!"=="shutdown" (shutdown /s /t 0 & goto :main_loop)
if /i "!command_lower!"=="reboot" (shutdown /r /t 0 & goto :main_loop)
if /i "!command_lower!"=="logoff" (logoff & goto :main_loop)
if /i "!command_lower!"=="lock" (rundll32.exe user32.dll,LockWorkStation & goto :main_loop)
if /i "!command_lower!"=="random" (echo %RANDOM% & goto :main_loop)
if /i "!command_lower!"=="path" (echo %PATH% & goto :main_loop)
if /i "!command_lower!"=="env" (set & goto :main_loop)
if /i "!command_lower!"=="color" (color !args! & goto :main_loop)
if /i "!command_lower!"=="title" (title !args! & goto :main_loop)
if /i "!command_lower!"=="search" (start "" "https://www.google.com/search?q=!args!" & goto :main_loop)

:: --- If command is not found ---
echo.
echo This command is not recognized as a BatShell command.
echo For a list of commands, type 'help'.
echo.
goto :main_loop


:: #############################################################################
:: #                              COMMAND LOGIC                                #
:: #############################################################################

:cmd_help
cls
echo.
echo ======================== BatShell Command List ========================
echo.
echo   --- BatShell Core ---
echo   help                 - Shows this help message
echo   exit/quit            - Exits BatShell
echo   cls/clear            - Clears the screen
echo   ver/version          - Displays BatShell version
echo   about                - Information about BatShell
echo   reprompt             - Refreshes the command prompt
echo.
echo   --- System Information ---
echo   sysinfo              - Displays detailed system information
echo   hostname             - Shows the computer name
echo   username             - Shows the current user's name
echo   os                   - Displays the Windows version
echo   cpuinfo              - Shows detailed CPU information
echo   meminfo              - Shows total and free RAM
echo   diskinfo             - Lists disk drives with size and free space
echo   uptime               - Shows system boot time
echo   drivers              - Lists all installed device drivers
echo   pcmodel              - Shows PC manufacturer and model
echo   battery              - Shows battery status and charge percentage
echo   datetime             - Displays the current date and time
echo.
echo   --- File & Directory Management ---
echo   ls/dir [path]        - Lists files and directories
echo   cd [path]            - Changes the current directory
echo   pwd                  - Prints the working (current) directory
echo   mkdir [name]         - Creates a new directory
echo   touch [filename]     - Creates a new empty file
echo   del/rm [filename]    - Deletes a file
echo   rmdir [name]         - Removes an empty directory
echo   copy [src] [dest]    - Copies a file
echo   move [src] [dest]    - Moves or renames a file/directory
echo   ren [old] [new]      - Renames a file
echo   cat/type [filename]  - Displays the content of a text file
echo   tree [path]          - Displays a graphical directory tree
echo   findfile [name]      - Searches for a file in the current dir and subdirs
echo   countfiles           - Counts files in the current directory
echo.
echo   --- Networking ---
echo   ip                   - Shows your local IPv4 address
echo   ipall                - Shows all IP configuration details
echo   ping [host]          - Pings a host to check connectivity
echo   trace [host]         - Traces the route to a host
echo   dnsflush             - Flushes the DNS resolver cache
echo   netstat              - Displays active network connections
echo   lookup [host]        - Performs a DNS lookup for a host
echo   mac                  - Displays the MAC address of network adapters
echo   arp                  - Displays the ARP cache
echo.
echo   --- Process Management ---
echo   ps/tasklist          - Lists all running processes
echo   kill [name.exe]      - Kills a process by its name
echo   killpid [PID]        - Kills a process by its Process ID (PID)
echo   services             - Lists running services
echo.
echo   --- Utilities & Tools ---
echo   calc                 - Opens the Windows Calculator
echo   notepad [file]       - Opens Notepad (optionally with a file)
echo   countdown/timer [s]  - Starts a countdown for 's' seconds
echo   date/time            - Displays the current date or time
echo   echo [message]       - Displays a message on the screen
echo   shutdown/reboot      - Shuts down or reboots the computer
echo   logoff               - Logs the current user off
echo   lock                 - Locks the computer
echo   random               - Generates a random number
echo   path                 - Displays the system PATH variable
echo   env                  - Displays all environment variables
echo   color [attr]         - Changes the console text color (e.g., color 0A)
echo   title [text]         - Changes the console window title
echo   search [query]       - Searches Google for the query in your browser
echo.
echo =======================================================================
echo.
goto :main_loop

:cmd_about
echo.
echo   BatShell v1.0
echo   Created as a powerful, all-in-one batch script to extend
echo   the functionality of the standard Windows Command Prompt.
echo.
goto :main_loop

:cmd_countdown
if "!args!"=="" (
    echo Usage: countdown [seconds]
    goto :main_loop
)
echo Starting countdown for !args! seconds...
for /l %%i in (!args!, -1, 1) do (
    echo|set /p"=%%i..."
    timeout /t 1 /nobreak > nul
)
echo.
echo Time's up!
goto :main_loop

:cmd_exit
echo.
echo Exiting BatShell. Goodbye!
timeout /t 1 /nobreak > nul

exit


