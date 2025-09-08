# BatShell

BatShell is a lightweight, open-source, command-line shell written in Batch. It provides a wide range of system, file, networking, and utility commands to interact with your Windows environment directly from the terminal.

---

## Features

- **Core shell commands**: help, exit/quit, clear screen, version info, reprompt
- **System information**: CPU, RAM, disk, OS, battery, drivers, uptime, hostname, username
- **File management**: navigation, creation, deletion, copying, moving, listing files & directories
- **Networking tools**: IP info, ping, traceroute, DNS lookup, ARP, MAC address
- **Process management**: list processes, kill by name or PID, list services
- **Utilities**: calculator, notepad, countdown timer, echo messages, shutdown/reboot, random numbers, console customization, Google search

---

## Installation

1. Clone this repository:
   
   ``git clone https://github.com/yourusername/BatShell.git``

2. Navigate to the project folder:

``cd BatShell``

Run BatShell.bat to start the shell.

**Usage**

Once inside BatShell, you can run commands directly. Some examples:


help           # Displays all available commands

sysinfo        # Shows detailed system information

ls             # Lists files in the current directory

ping google.com  # Pings google.com

kill notepad.exe # Kills the Notepad process

shutdown       # Shuts down the computer


## Command List

### BatShell Core


Command | Description


help	Shows help message

exit / quit	Exits BatShell

cls / clear	Clears the screen

ver / version	Displays BatShell version

about	Information about BatShell

reprompt	Refreshes the command prompt


### System Information

Command | Description


sysinfo	Displays detailed system information

hostname	Shows the computer name

username	Shows the current user's name

os	Displays the Windows version

cpuinfo	Shows detailed CPU information

meminfo	Shows total and free RAM

diskinfo	Lists disk drives with size and free space

uptime	Shows system boot time

drivers	Lists all installed device drivers

pcmodel	Shows PC manufacturer and model

battery	Shows battery status and charge percentage

datetime	Displays the current date and time


### File Management

Command | Description


ls / dir [path]	Lists files and directories

cd [path]	Changes the current directory

pwd	Prints the working (current) directory

mkdir [name]	Creates a new directory

touch [filename]	Creates a new empty file

del / rm [filename]	Deletes a file

rmdir [name]	Removes an empty directory

copy [src] [dest]	Copies a file

move [src] [dest]	Moves or renames a file/directory

ren [old] [new]	Renames a file

cat / type [filename]	Displays the content of a text file

tree [path]	Displays a graphical directory tree

findfile [name]	Searches for a file in the current dir and subdirs

countfiles	Counts files in the current directory


### Networking

Command | Description


ip	Shows your local IPv4 address

ipall	Shows all IP configuration details

ping [host]	Pings a host to check connectivity

trace [host]	Traces the route to a host

dnsflush	Flushes the DNS resolver cache

netstat	Displays active network connections

lookup [host]	Performs a DNS lookup for a host

mac	Displays the MAC address of network adapters

arp	Displays the ARP cache


### Process Management

Command | Description


ps / tasklist	Lists all running processes

kill [name.exe]	Kills a process by its name

killpid [PID]	Kills a process by its Process ID (PID)

services	Lists running services


### Utilities

Command | Description


calc	Opens the Windows Calculator

notepad [file]	Opens Notepad (optionally with a file)

countdown / timer [s]	Starts a countdown for 's' seconds

date / time	Displays the current date or time

echo [message]	Displays a message on the screen

shutdown / reboot	Shuts down or reboots the computer

logoff	Logs the current user off

lock	Locks the computer

random	Generates a random number

path	Displays the system PATH variable

env	Displays all environment variables

color [attr]	Changes the console text color (e.g., color 0A)

title [text]	Changes the console window title

search [query]	Searches Google for the query in your browser


# Contributing

Contributions are welcome! Feel free to submit issues or pull requests.


## Made with ❤️ using Batch.
