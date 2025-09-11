# BatShell v1.1

### BatShell is a custom, open-source command-line interpreter for Windows, written entirely in Batch.
### It extends the traditional Windows Command Prompt with dozens of built-in commands for system info, file management, networking, development, and utilities.

✨ Features

🖥️ System info commands (CPU, RAM, uptime, drivers, battery, etc.)

📂 File & directory management (including touch, zip/unzip, countlines)

🌐 Networking tools (ip, ping, wifipass, netstat, lookup, etc.)

⚙️ Process & service management (ps, kill, services)

👨‍💻 Developer-friendly extras (python, pip, git, curl, uuidgen, b64encode)

🛠️ Utilities like weather, qrcode, caffeinate, calc, and more

Lightweight, portable, and runs out of the box on Windows (no installer needed)

🚀 Installation

Clone the repository using Git:

``git clone https://github.com/Matt-The-Generico/BatShell.git``


Navigate to the project folder:

``cd BatShell``


Run BatShell:

``BatShell.bat``


(Optional): Add the folder to your system PATH to call BatShell from anywhere.

📖 Commands

Here’s the full list of commands available in v1.1:

<details> <summary>▶ BatShell Core</summary>

help – Shows help message

exit / quit – Exits BatShell

cls / clear – Clears the screen

ver / version – Displays BatShell version

about – Information about BatShell

reprompt – Refreshes the command prompt

</details> <details> <summary>▶ System Information</summary>

sysinfo – Detailed system information

hostname - Shows the computer hostname

username - Shows the computer username

os – Shows OS info

cpuinfo, meminfo – CPU and RAM details

diskinfo - Shows disk usage

uptime – Shows boot time

drivers - Shows installed drivers

pcmodel – Shows PC model

battery - Shows battery

datetime – Shows date/time

</details> <details> <summary>▶ File & Directory Management</summary>

ls - List files in the current directory

dir [path] – Shows directories

cd [path] – Change directory

pwd - print directory

mkdir [name] – Create directory

touch / emptyfile [file] – Create empty file

del / rm [f] – Delete file

rmdir [d] - Delete directory

copy - Copy file

move - Move file

ren – Rename file

cat / type [file] – Show file content

tree [path] – Directory tree

findfile [name] – Search file recursively

countfiles – Count files in directory

countlines [file] – Count lines in file

open [file/url/app] – Open with default app

zip [arch] [files] - Zip files (PowerShell Required)

unzip [arch] – Unzip files (PowerShell Required)

</details> <details> <summary>▶ Networking</summary>

ip - Shows current IPs

ipall - Shows all IP configuration

ping [host],  – Tests host connectivity

trace [host] - Traces host route

dnsflush – Flush DNS cache

netstat - Shows connection status

arp, mac – Network details (ARP and MAC adress)

lookup [host] – DNS lookup

wifilist – List saved Wi-Fi profiles

wifipass [profile] – Show Wi-Fi password

</details> <details> <summary>▶ Process Management</summary>

ps / tasklist – List processes

kill [name.exe], killpid [PID] – Kill process

services – List running services

</details> <details> <summary>▶ Developer Tools</summary>

py / python [script/file] – Run Python script or file

pinstall [pkg] – Install Python package

puninstall [pkg] – Uninstall Python package

plist – List installed Python packages

git [args] – Run Git command

curl [args] – Run curl command

which [cmd] – Show path of executable

uuidgen – Generate GUID

b64encode [str], b64decode [str] – Base64 encode/decode

</details> <details> <summary>▶ Utilities & Tools</summary>

calc – Open Calculator

notepad [file] – Open Notepad

countdown / timer [s] – Countdown timer

search [query] – Google search

weather [loc] – Show weather (e.g., weather London)

qrcode [text] – Generate QR code in console

shutdown / reboot – Power controls (shuts down or reboot computer)

logoff, lock – Session controls (logoffs user or lock computer)

caffeinate – Prevent system sleep

random – Generates random number

path – Show PATH

env – Show environment variables

color [attr], title [text] – Customize console (window color or title)

</details>
📌 Requirements

Windows 7/8/10/11

PowerShell
(for zip, unzip, weather, qrcode)

Optional: Python, Git, Curl (for developer tools)

🤝 Contributing

Contributions are welcome!
If you’d like to add new commands, improve existing ones, or fix bugs:

Fork this repo

Create a feature branch (git checkout -b feature/new-command)

Commit your changes (git commit -m "Added new feature")

Push and open a PR


You’re free to use, modify, and distribute it, just give credit.


⚡ BatShell v1.1 - Bringing power to your Windows terminal! ⚡
