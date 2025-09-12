@echo off
setlocal enabledelayedexpansion

:: #############################################################################
:: #                                                                           #
:: #                             BatShell v1.1                                 #
:: #               A Custom Command-Line Tool for Windows                      #
:: #                                                                           #
:: #############################################################################

:: --- Initial Setup ---
title BatShell v1.1
color 0B
cls

:: --- Welcome Message ---
echo.
echo  BBBBBB    SSSSSS      BatShell v1.1
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
if /i "!command_lower!"=="ver" (echo BatShell v1.1 & goto :main_loop)
if /i "!command_lower!"=="version" (echo BatShell v1.1 & goto :main_loop)
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

:: --- File & Directory Management ---
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
if /i "!command_lower!"=="open" (start "" "!args!" & goto :main_loop)
if /i "!command_lower!"=="emptyfile" (type nul > !args! & goto :main_loop)
if /i "!command_lower!"=="countlines" (find /c /v "" < "!args!" & goto :main_loop)

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
if /i "!command_lower!"=="wifilist" (netsh wlan show profiles & goto :main_loop)
if /i "!command_lower!"=="wifipass" (netsh wlan show profile name="!args!" key=clear | findstr "Key Content" & goto :main_loop)

:: --- Process Management ---
if /i "!command_lower!"=="ps" (tasklist & goto :main_loop)
if /i "!command_lower!"=="tasklist" (tasklist & goto :main_loop)
if /i "!command_lower!"=="kill" (taskkill /F /IM !args! & goto :main_loop)
if /i "!command_lower!"=="killpid" (taskkill /F /PID !args! & goto :main_loop)
if /i "!command_lower!"=="services" (net start & goto :main_loop)

:: --- Developer Tools ---
if /i "!command_lower!"=="py" (python !args! & goto :main_loop)
if /i "!command_lower!"=="python" (python !args! & goto :main_loop)
if /i "!command_lower!"=="pinstall" (pip install !args! & goto :main_loop)
if /i "!command_lower!"=="puninstall" (pip uninstall !args! & goto :main_loop)
if /i "!command_lower!"=="plist" (pip list & goto :main_loop)
if /i "!command_lower!"=="git" (git !args! & goto :main_loop)
if /i "!command_lower!"=="curl" (curl !args! & goto :main_loop)
if /i "!command_lower!"=="which" (where !args! & goto :main_loop)
if /i "!command_lower!"=="uuidgen" (powershell -Command "[guid]::NewGuid().ToString()" & goto :main_loop)
if /i "!command_lower!"=="b64encode" goto :cmd_b64encode
if /i "!command_lower!"=="b64decode" goto :cmd_b64decode

:: --- Utility & Tool Commands ---
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
if /i "!command_lower!"=="weather" (curl wttr.in/!args! & goto :main_loop)
if /i "!command_lower!"=="qrcode" (curl qrenco.de/"!args!" & goto :main_loop)
if /i "!command_lower!"=="caffeinate" (powercfg /requestsoverride PROCESS "cmd.exe" System Display & echo System will not sleep while BatShell is running. & goto :main_loop)
if /i "!command_lower!"=="zip" goto :cmd_zip
if /i "!command_lower!"=="unzip" goto :cmd_unzip

:: --- if command is not found ---
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
echo ================================= BatShell Command List =================================
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
echo   hostname             - Shows computer hostname 
echo   usename              - Shows current username
echo   os                   - Shows OS info
echo   cpuinfo, meminfo     - Shows CPU and RAM details
echo   diskinfo, uptime     - Shows disk usage and system boot time
echo   drivers, pcmodel     - Lists drivers and PC model
echo   battery, datetime    - Shows battery status and current date/time
echo.
echo   --- File and Directory Management ---
echo   ls/dir [path]        - Lists files and directories
echo   cd [path], pwd       - Change and print the current directory
echo   mkdir [name]         - Creates a new directory
echo   touch/emptyfile [f]  - Creates a new empty file or empties an existing one
echo   del/rm [f]           - Deletes a file
echo   rmdir [d] -          - Deletes a directory
echo   copy [f]             - Copies a file
echo   move [f] [d]         - Moves a file
echo   rem/del [f]          - Deletes a file
echo   cat/type [filename]  - Displays the content of a text file
echo   tree [path]          - Displays a graphical directory tree
echo   findfile [name]      - Searches for a file in subdirectories
echo   countfiles           - Counts files in the current directory
echo   countlines [file]    - Counts lines in a text file
echo   open [file/url/app]  - Opens a file or URL with its default application
echo   zip [arch] [f]       - Creates a zip archive (needs PowerShell)
echo   unzip [arch]         - Extracts a zip archive (needs PowerShell)
echo.
echo   --- Networking ---
echo   ip, ipall            - Shows basic or all IP configuration
echo   ping [host]          - Tests connectivity
echo   trace [host]         - Traces route
echo   dnsflush             - Flushes the DNS resolver cache
echo   netstat, arp, mac    - Display network connections, ARP cache, or MAC address
echo   lookup [host]        - Performs a DNS lookup
echo   wifilist             - Lists all saved Wi-Fi network profiles
echo   wifipass [profile]   - Shows the saved password for a Wi-Fi profile
echo.
echo   --- Process Management ---
echo   ps/tasklist          - Lists all running processes
echo   kill [name.exe]      - Kills a process by name
echo   kill [PID]           - Kills a process by PID
echo   services             - Lists running services
echo.
echo   --- Developer Tools (Requires external programs in PATH) ---
echo   py/python [script]   - Executes a Python script
echo   pinstall [package]   - Installs a Python package using pip
echo   puninstall [package] - Uninstalls a Python package using pip
echo   plist                - Lists all installed Python packages
echo   git [args]           - Runs a git command
echo   curl [args]          - Runs a curl command
echo   which [command]      - Shows the full path of an executable
echo   uuidgen              - Generates a new unique identifier (GUID)
echo   b64encode [string]   - Base64 encodes a string
echo   b64decode [string]   - Base64 decodes a string
echo.
echo   --- Utilities and Tools ---
echo   calc, notepad [file] - Opens Calculator or Notepad
echo   countdown/timer [s]  - Starts a countdown for 's' seconds
echo   search [query]       - Searches Google for the query in your browser
echo   weather [location]   - Shows the weather for a location (e.g., 'weather London'), needs PowerShell
echo   qrcode [text]        - Generates a QR code in the console (needs PowerShell)
echo   shutdown/reboot      - Shuts down or reboots the computer
echo   logoff, lock         - Logs off the user or locks the computer
echo   caffeinate           - Prevents the system from sleeping while BatShell is open
echo   random, path, env    - Shows a random number, the PATH, or all env variables
echo   color [attr]         - Changes console color
echo   title [text]         - Changes the BatShell window title
echo.
echo ==============================================================================================
echo.
goto :main_loop

:cmd_about
echo.
echo   BatShell v1.1
echo   Created as a powerful, all-in-one batch script to extend
echo   the functionality of the standard Windows Command Prompt.
echo   Includes developer tools and advanced utilities.
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

:cmd_b64encode
if "!args!"=="" (
    echo Usage: b64encode [string to encode]
    goto :main_loop
)
set "temp_in=%TEMP%\batshell_b64_in.tmp"
set "temp_out=%TEMP%\batshell_b64_out.tmp"
echo|set /p="!args!" > "!temp_in!"
certutil -encode "!temp_in!" "!temp_out!" > nul
type "!temp_out!"
del "!temp_in!" "!temp_out!" > nul 2>&1
goto :main_loop

:cmd_b64decode
if "!args!"=="" (
    echo Usage: b64decode [base64 string to decode]
    goto :main_loop
)
set "temp_in=%TEMP%\batshell_b64_in.tmp"
set "temp_out=%TEMP%\batshell_b64_out.tmp"
echo -----BEGIN CERTIFICATE----- > "!temp_in!"
echo !args! >> "!temp_in!"
echo -----END CERTIFICATE----- >> "!temp_in!"
certutil -decode "!temp_in!" "!temp_out!" > nul
type "!temp_out!"
del "!temp_in!" "!temp_out!" > nul 2>&1
goto :main_loop

:cmd_zip
for /f "tokens=1,*" %%i in ("!args!") do (
    set "zipfile=%%i"
    set "file_to_zip=%%j"
)
if "!file_to_zip!"=="" (
    echo Usage: zip [archive_name.zip] [file_or_folder_to_zip]
    goto :main_loop
)
echo Zipping "!file_to_zip!" into "!zipfile!"...
powershell Compress-Archive -Path "!file_to_zip!" -DestinationPath "!zipfile!" -Force
echo Done.
goto :main_loop

:cmd_unzip
if "!args!"=="" (
    echo Usage: unzip [archive_name.zip]
    goto :main_loop
)
echo Unzipping "!args!"...
powershell Expand-Archive -Path "!args!" -DestinationPath "." -Force
echo Done.
goto :main_loop

:cmd_exit
echo.
echo Exiting BatShell. Goodbye!
:: this resets the sleep prevention if caffeinate was used
powercfg /requestsoverride PROCESS "cmd.exe" System Display
timeout /t 1 /nobreak > nul
exit



