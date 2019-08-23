# Windows Admin

/TODO Copy in OneNote notes

["D:\ASUSsync\VS Code\md\res"](D:\ASUSsync\VS Code\md\res)

## Notes

Note for Windows users on 64-bit systems

- Progra~1 = 'Program Files'
- Progra~2 = 'Program Files(x86)'


## VS Code

code _ , where _ is

- `.`(period) Open "Code" **in** *the* Current dir

## Windows Functions

`msconfig` - get to **safe mode**

### Shell Config

#### Environment Vars

see with `gci env:` in Powershell,

#### Start Menu Location

`C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu`
`%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu`
`C:\ProgramData\Microsoft\Windows\Start Menu`


#### Secret Location of the right click menu
`C:\Users\s163837\AppData\Local\Microsoft\Windows\WinX`


## Location of Personal Data

### Open/Save Menu

All files opened or saved with the Open/ Save dialog are stored here:


HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU 
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU 
 
Can be viewed with Nirsoft - OpenSaveFilesView

C:\Documents and Settings\[Your Profile]\Recent

### Folder Settings


Windows uses the following Registry keys to save the folders information: 
HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam 
HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell 
HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell (Only in Windows Vista) 

### User Assist 

Nirsoft - UserAssistView

HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist key in the Registry. The UserAssist key contains information about the exe files and links that you open frequently


### Passwords

DataProtectionDecryptor is a powerful tool for Windows that allows you to decrypt passwords and other information encrypted by the DPAPI (Data Protection API) system of Windows operating system. 

Here's some examples for passwords and other data encrypted with DPAPI: 

Passwords of Microsoft Outlook accounts, stored in the Registry under HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles or HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook\Profiles or HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\Profiles (Depending on version of Outlook) 
Credentials files of Windows (e.g: C:\Users\[User Profile]\AppData\Roaming\Microsoft\Credentials , C:\Users\[User Profile]\AppData\Local\Microsoft\Credentials ) 
Wireless network keys (Stored inside XML files under C:\ProgramData\Microsoft\Wlansvc\Profiles\Interfaces ) 
Passwords in some versions of Internet Explorer, stored in the following Registry key: HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\IntelliForms\Storage2 
Passwords stored in the passwords file of Chrome Web browser ('Login Data' file in the profile of Chrome). 
Encrypted cookies in Chrome Web browser ('Cookies' file in the profile of Chrome) 



## Protocol Host

Nirsoft URLProtocolView

Running `ms-taskswitcher:/` brings up task viewThe protocol host seems useful!
.

#### Getting a programs Path

Not 100% sure this works:

`|Computer|HKEY_CLASSES_ROOT|Applications|rstudio.exe|shell|open|command`

HKCR|Applications|name|shell|open|command

### Windows Search


[Windows Search Docs](https://docs.microsoft.com/en-us/windows/desktop/search/-search-3x-wds-overview)
[Legacy](https://docs.microsoft.com/en-us/windows/desktop/lwef/-search-2x-wds-aqsreference)

[Querying](https://docs.microsoft.com/en-us/windows/desktop/search/-search-querying-interfaces-entry-page)
[Reference](https://docs.microsoft.com/en-us/windows/desktop/search/-search-reference-entry-page)
Boolean operators include AND, OR, and NOT.


When you write a query with optional criteria, you use the following syntax:

        data store or scope:value
        file kind:value
        property:value

Content = Led Zeppelin + file kind = music + length = short (1 – 5 minutes)

## Keyboard SHortcuts

### Windows Keys

Left Windows + ...

[T] = Cycle Task Bar Apps
[U] = Open Ease of Access Center
[=] = Open Magnifier
[M] = Minimize all Windows
[Tab] = Open Task View
[R] = Run Dialogue
[K] = Open Quick Connect
[I] = Open Windows Settins
[E] = Open File Explorer
[L] = Lock
[G] = Windows Game Bar
[.] = Open Emoji Panel
[S] = Open Search
[A] = Open Action Center
[D] = Hide/Show Desktop
[X] = Open Quick Links
[Ctrl] + [Enter] = Open Narrator
[B] = Set Focus in Notification Area

[Ctrl] + [Shift] + [Esc] = Open Task Manager
[Ctrl] + [Esc] = Open Start
[Alt] + [Tab] = Switch Between Apps
[Alt] + [Esc] = Cycle Between Apps
[Alt] + [Left] = Go Back
[Alt] + [Right] = Go Forward

## Basic Commands


| Command       | Description                                                                |
| ------------- | -------------------------------------------------------------------------- |
| assoc         | Displays or modifies file name extension associations.[1]                  |
| at            | Schedules commands to run on a computer at a specified time [2]            |
| attrib        | Configures file attributes read only, hidden, system                       |
| bootcfg       | Used to repair or edit the boot.ini file                                   |
| cd or chdir   | Displays the name of the current directory or changes the current folder   |
| chkdsk        | Checks hard drives for errors. With switches,does repairs.                 |
| cls           | Clears the screen                                                          |
| copy          | Copies a file from one location to another                                 |
| del           | Deletes one or more files                                                  |
| dir           | Displays a list of a folder's files and subfolders                         |
| diskpart      | Disk management shell. A suite of various commands                         |
| driverquery   | Displays a list of all installed device drivers and their properties. [3]  |
| echo          | Used to display a message or to turn off/on messages in batch scripts      |
| exit          | Exits batch script or current command control                              |
| fc            | Compares two files and displays the differences between them               |
| find          | Searches for a text string in a file or files. [4]                         |
| findstr       | Searches for text string patterns in a file using regular expressions      |
| for           | Runs a specified command for each item in a set                            |
| fsutil        | Displays and configures certain file system properties. Suite              |
| ftype         | Displays or modifies file types used in file name extension associations   |
| getmac        | Returns the media access control (MAC) address for your network card       |
| goto          | Directs the command interpreter to a labeled line in a batch program       |
| if            | Performs conditional processing in batch programs                          |
| ipconfig      | Displays TCP/IP network config and refreshes DHCP and DNS[5]               |
| md or mkdir   | Creates a directory (folder) or subdirectory (subfolder)                   |
| more          | Displays output one screen at a time. Used with another command            |
| move          | Moves a file from one folder to another                                    |
| net           | A suite of various networking and service commands                         |
| netsh         | Network services shell . Complex suite of commands.                        |
| netstat       | Displays active TCP con. ports on which the computer is listening,+ [6]    |
| path          | Sets the command path in the PATH environment variable, [7]                |
| pathping      | Network performance and conditions at intermediate hops btw host and dest. |
| pause         | Used in batch scripts                                                      |
| ping          | Checks connectivity to other networked computers                           |
| popd, pushd   | Changes the directory being referenced in a command prompt. [8]            |
| powercfg      | Manages the power settings such as hibernation. Has numerous switches      |
| reg           | Adds, changes, and displays registry entries. A suite of various commands  |
| rd or rmdir   | Deletes a directory (folder)                                               |
| ren or rename | Changes the name of a file or a set of files                               |
| sc            | Used to obtain information about services and to configure them. Suite.    |
| schtasks      | Schedules commands and programs to run periodically or at a specific time  |
| set           | Displays, sets, or removes environment variables                           |
| sfc           | System file checker scans and verifies all protected system files          |
| shutdown      | Shuts down or restarts a computer                                          |
| sort          | Alphabetizes strings from a text file or the output of a command.          |
| start         | Starts an application or opens a new command window                        |
| subst         | Associates a folder with a drive letter                                    |
| systeminfo    | Displays configuration information on computer and OS                      |
| taskkill      | Ends one or more tasks or processes                                        |
| tasklist      | Lists running tasks, applications and services with their PID              |
| tree          | Graphically displays the directory structure of a folder or drive          |
| type          | Displays the contents of a text file                                       |
| vssadmin      | For administering and configuring volume shadow copies                     |
| xcopy         | Tool for copying and backing up files and folders                          |

1. Used alone, displays a list of all the current file name associations
2. Requires the Schedule service. Superseded by schtasks
3. Requires administrator privileges. (Not available in Windows XP Home)
4. Can also be used with output from another command.
5. Dynamic Host Configuration Protocol (DHCP) and Domain Name System (DNS) settings
6. Ethernet statistics, the IP routing table, statistics for the IP, ICMP, TCP, and UDP protocols
7. Which is the set of directories used to search for executable files
8. Pushd changes the directory and stores the previous directory. Popd changes the current directory to the directory stored by the pushd command
=======

- `Command`- Description|
- `-------------`- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
- `assoc`- Displays or modifies file name extension associations. Used alone, displays a list of all the current file name associations
- `at`- Schedules commands and programs to run on a computer at a specified time and date. Requires the Schedule service. Superseded by schtasks
- ` `-
- `attrib`- Configures file attributes read only, hidden, system
- `bootcfg`- Used to repair or edit the boot.ini file
- `cd or chdir`- Displays the name of the current directory or changes the current folder
- `chkdsk`- Checks hard drives for errors. With switches,does repairs.
- `cls`- Clears the screen
- `copy`- Copies a file from one location to another
- `del`- Deletes one or more files
- `dir`- Displays a list of a folder's files and subfolders
- `diskpart`- Disk management shell. A suite of various commands
- `driverquery`- Displays a list of all installed device drivers and their properties. Requires administrator privileges. (Not available in Windows XP Home)
- `echo`- Used to display a message or to turn off/on messages in batch scripts
- `exit`- Exits batch script or current command control
- `fc`- Compares two files and displays the differences between them
- `find`- Searches for a text string in a file or files. Can also be used with output from another command.
- `findstr`- Searches for text string patterns in a file using regular expressions
- `for`- Runs a specified command for each item in a set
- `fsutil`- Displays and configures certain file system properties. A suite of various commands
- `ftype`- Displays or modifies file types used in file name extension associations
- `getmac`- Returns the media access control (MAC) address for your network card
- `goto`- Directs the Windows command interpreter to a labeled line in a batch program
- `if`- Performs conditional processing in batch programs
- `ipconfig`- Displays all current TCP/IP network configuration values and refreshes Dynamic Host Configuration Protocol (DHCP) and Domain Name System (DNS) settings
- `md or mkdir`- Creates a directory (folder) or subdirectory (subfolder)
- `more`- Displays one screen of output at a time. Used with another command that has extensive output
- `move`- Moves a file from one folder to another
- `net`- A suite of various networking and service commands
- `netsh`- Network services shell . Complex suite of commands.
- `netstat`- Displays active TCP connections, ports on which the computer is listening, Ethernet statistics, the IP routing table, statistics for the IP, ICMP, TCP, and UDP protocols
- `path`- Sets the command path in the PATH environment variable, which is the set of directories used to search for executable files
- `pathping`- Provides information about network performance and conditions at intermediate hops between a source and destination
- `pause`- Used in batch scripts
- `ping`- Checks connectivity to other networked computers, routers, or Internet sites
- `popd, pushd`- Changes the directory being referenced in a command prompt. Pushd changes the directory and stores the previous directory. Popd changes the current directory to the directory stored by the pushd command
- `powercfg`- Manages the power settings such as hibernation. Has numerous switches
- `reg`- Adds, changes, and displays registry entries. A suite of various commands
- `rd or rmdir`- Deletes a directory (folder)
- `ren or rename`- Changes the name of a file or a set of files
- `sc`- Used to obtain information about services and to configure them. A suite of various commands
- `schtasks`- Schedules commands and programs to run periodically or at a specific time
- `set`- Displays, sets, or removes environment variables
- `sfc`- System file checker scans and verifies the versions of all protected system files
- `shutdown`- Shuts down or restarts a computer
- `sort`- Alphabetizes strings from a text file or the output of a command.
- `start`- Starts an application or opens a new command window
- `subst`- Associates a folder with a drive letter
- `systeminfo`- Displays detailed configuration information about a computer and its operating system
- `taskkill`- Ends one or more tasks or processes
- `tasklist`- Displays a list of applications and services with their Process ID (PID) for all tasks running
- `tree`- Graphically displays the directory structure of a folder or drive
- `type`- Displays the contents of a text file
- `vssadmin`- For administering and configuring volume shadow copies
- `xcopy`- Powerful command with many switches for copying and backing up files and folders





### List COM interfaces

Where can I find all of the COM objects that can be created in Powershell?

gci HKLM:\Software\Classes -ea 0| ? {$_.PSChildName -match '^\w+\.\w+$' -and
(gp "$($\_.PSPath)\CLSID" -ea 0)} | ft PSChildName

From <https://stackoverflow.com/questions/660319/where-can-i-find-all-of-the-com-objects-that-can-be-created-in-powershell>

How to get a list of COM objects via WMI & PowerShell
Posted: October 26th, 2013 | Tags: COM, wmi | Category: PowerShell | § 
Let’s see what WMI can tell us about COM objects on the system.
Get a list of all WMI classes with the word “COM” in them (doing a case sensitive match to avoid entries like “computer”).

```ps1
1   PS> gwmi -list | ?{ $_.Name -cmatch "COM" }
2    
3      NameSpace: ROOT\cimv2
4    
5   Name                                Methods              Properties
6   ----                                -------              ----------
7   MSFT_WMI_GenericNonCOMEvent         {}                   {ProcessId, PropertyNames, PropertyValues, ProviderName...}
8   Win32_COMApplication                {}                   {Caption, Description, InstallDate, Name...}
9   Win32_DCOMApplication               {}                   {AppID, Caption, Description, InstallDate...}
10  Win32_COMClass                      {}                   {Caption, Description, InstallDate, Name...}
11  Win32_ClassicCOMClass               {}                   {Caption, ComponentId, Description, InstallDate...}
12  Win32_COMSetting                    {}                   {Caption, Description, SettingID}
13  Win32_ClassicCOMClassSetting        {}                   {AppID, AutoConvertToClsid, AutoTreatAsClsid, Caption...}
14  Win32_DCOMApplicationSetting        {GetLaunchSecurit... {AppID, AuthenticationLevel, Caption, CustomSurrogate...}
15  Win32_ClassicCOMClassSettings       {}                   {Element, Setting}
16  Win32_COMApplicationSettings        {}                   {Element, Setting}
17  Win32_DCOMApplicationAccessAllow... {}                   {Element, Setting}
18  Win32_COMApplicationClasses         {}                   {GroupComponent, PartComponent}
19  Win32_ClassicCOMApplicationClasses  {}                   {GroupComponent, PartComponent}
20  Win32_DCOMApplicationLaunchAllow... {}                   {Element, Setting}
```

## Command Line

### Paths

[Dev Considerations for File Systems](https://docs.microsoft.com/en-us/windows/desktop/fileio/file-systems)

[NFTS Technical Reference](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2003/cc758691(v=ws.10))

[Directory Management](https://docs.microsoft.com/en-us/windows/desktop/fileio/directory-management)

[File Management](https://docs.microsoft.com/en-us/windows/desktop/fileio/file-management)

[Transaction Management of NFTS](https://docs.microsoft.com/en-us/windows/desktop/fileio/transactional-ntfs-portal)


Dot (. and ..) conventions—for example, `..\` resolves the path relative to the parent directory.

Names with no slashes ()—for example, `tmp` resolves the path relative to the current directory.

Root relative—for example, `\Windows\System32` resolves to the `current drive:\Windows\System32`. directory

Current working directory-relative—for example, if the current working directory is `C:\Windows\System32`, `C:File.txt` resolves to `C:\Windows\System32\File.txt`.

#### Symbolic Links

[Sym Links](https://docs.microsoft.com/en-us/windows/desktop/fileio/symbolic-links)

[Sym Links and Programs](https://docs.microsoft.com/en-us/windows/desktop/fileio/symbolic-link-effects-on-file-systems-functions)

A symbolic link is a file-system object that points to another file system object. The object being pointed to is called the target.

Symbolic links are transparent to users; the links appear as normal files or directories, and can be acted upon by the user or application in exactly the same manner.

Symbolic links are designed to aid in migration and application compatibility with UNIX operating systems. Microsoft has implemented its symbolic links to function just like UNIX links.

!!!example  Example of an Absolute Symbolic Link

    In this example, the original path contains a component, 'x', which is an absolute symbolic link. When 'x' is encountered, the fragment of the original path up to and including 'x' is completely replaced by the path that is pointed to by 'x'. The remainder of the path after 'x' is appended to this new path. This now becomes the modified path.

        X: "C:\alpha\beta\absLink\gamma\file"

        Link: "absLink" maps to "\\machineB\share"

        Modified Path: "\\machineB\share\gamma\file"

!!!example  Example of a Relative Symbolic Links

    In this example, the original path contains a component 'x', which is a relative symbolic link. When 'x' is encountered, 'x' is completely replaced by the new fragment pointed to by 'x'. The remainder of the path after 'x', is appended to the new path. Any dots (..) in this new path replace components that appear before the dots (..). Each set of dots replace the component preceding. If the number of dots (..) exceed the number of components, an error is returned. Otherwise, when all component replacement has finished, the final, modified path remains.

        X: C:\alpha\beta\link\gamma\file

        Link: "link" maps to "..\..\theta"

        Modified Path: "C:\alpha\beta\..\..\theta\gamma\file"

        Final Path: "C:\theta\gamma\file"

!!!Note Keep the following programming considerations in mind when working with symbolic links:
  - Symbolic links can point to a non-existent target.
  - When creating a symbolic link, the operating system does not check to see if the target exists.
  - If an application tries to open a non-existent target, ERROR_FILE_NOT_FOUND is returned.
  - Symbolic links are reparse points. For more information, see Determining Whether a Directory Is a Mounted Folder.
  - There is a maximum of 31 reparse points (and therefore symbolic links) allowed in a particular path.

### More Generally, the syntax

The following table describes the notation used to indicate [command-line syntax.](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/command-line-syntax-key)
| Notation                        | Description                                        |
| ------------------------------- | -------------------------------------------------- |
| Text without brackets or braces | Items you must type as shown                       |
| <Text inside angle brackets>    | Placeholder for which you must supply a value      |
| [Text inside square brackets]   | Optional items                                     |
| {Text inside braces}            | Set of required items; choose one                  |
| Vertical bar (\|)               | Separator for mutually exclusive items; choose one |
| Ellipsis (…)                    | Items that can be repeated                         |


### More

[SS64 Batch Help](https://ss64.com/nt/for.html)

[Microsoft (Server) Reference](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/windows-commands)


remote desktop command line (use /console if all slots full)
c:\> mstsc /v:SERVERNAME [/console]
list other RDP sessions on the server
c:\> query session
kick someone off -- useful when paired with sysinternals psexec, or powershell remoting
c:\> logoff SESSIONID

use mstsc /admin instead. Use mstsc /? for a list of commands.

Never knew aboput clip, and while investigating a problem yesterday I found another command I knew nothing about, the "where" command, it displays the location of a file.

where dotnet.exe
C:\Program Files\dotnet\dotnet.exe

 Create a text file
copy con lazydog.txt
The quick brown fox jumps over the lazy dog
Ctrl-z

cd \win*
type *.log[tab][tab][tab][tab]
cd syste[tab][tab]

Command prompt also supports drag and drop: If you want to copy the exact path to a folder or file to run the file or change the present working directory, you can simply drag and drop the file or the folder on the command prompt.
And there are more command history features available via function keys:
F1: Pastes per character last used command
F2: Pastes last used command only to a specified command character
F3: Pastes Last used command
F4: Delete command only to a specified command character
F5: Pastes last used command without cycling
F6: Pastes ^Z
F7: Provides a list of already used commands (selectable)
F8: Pastes cycleable used commands
F9: Will let you paste command from the list of recently used commands

I didn't know about clip, but then I've been using the UnxUtils collection for years and that has gclip, which does the same thing. I would probably have discovered clip by now if it wasn't for that.
Someone mentioned pushd and popd; there's a good use case for these that people may not be aware of. While you can navigate to a UNC path in File Explorer you can't cd to one on the command line, but you can use pushd to achieve the same thing. It will actually map a drive to the share with the next available drive letter, before changing to the directory. When the previous directory is popped off the stack with popd, the mapped drive is released.
I find Rob van der Woude's Scripting Pages to be a great resource for researching command line and batch language stuff. Look under Scripting Languages | Batch Files in the sidebar. There is info on a number of other scripting languages there too.
http://www.robvanderwoude.com/

copy con autoexec.bat
prompt $p$g
win
^Z

Redirecting output to txtfile always handy
Like:
dir /b | find ".exe" > findlist.txt | notepad findlist.txt
https://technet.microsoft.com/en-us/library/bb490982.aspx

SET /A for integer arithmetic, including bitwise operators.
The FOR command, for, well, just about anything. FORFILES.EXE, for one special case thereof.
DOSKEY.EXE for command prompt macros, and also macros for any command-line application.
GETMAC.EXE for getting adapter MAC addresses on the command line.
The CMD batch language itself.
And many, many more...


@echo off
setlocal
if "%echo%" neq "" echo %echo%
pushd %~dp0
What it does:
turn off output of commands.
make changes to the environment local to the script
check if the env-var echo contains something. by doing "set echo=on" before calling the script I can switch on output of commands for debugging.
Set the current directory to the scripts directory. this is optional, but most of my scripts assume relative path (My old saying: The absolute path is the singleton of config management)


Catching errors:
dir I-do-not-exist || goto :error
goto :eof
:error
echo ERROR in %~dpnx0 %*
exit /b 1
Explanation:
"||" executes the follwing command if the first fails
skip the ":error" block
echo the file in which the error occured (full path) and all the parameters
return some error code

Something I always have to do on new machines is create a new environment variable DIRCMD and set to /ogn
setx DIRCMD /ogn
Then output from 'dir' is always sorted correctly with directories grouped at the top, can't believe it's not the default


I often use findstr to locate strings in files. A 'memory helper' for parameters is 'sin' to search for sub directories, case insensitive, display line number. Example to find foobar in txt files:
findstr /s /i /n foobar *.txt

doskey.exe can clear, set the size of, and list the command history of an executable that's attached to the current console. The implementation uses the following undocumented console APIs:
doskey /reinstall /exename=[ExeName]
  VOID ExpungeConsoleCommandHistory(LPTSTR ExeName)
doskey /listsize=[Number] /exename=[ExeName]
  BOOL SetConsoleNumberOfCommands(DWORD Number,
                                  LPTSTR ExeName)
doskey /history /exename=[ExeName]
  DWORD GetConsoleCommandHistoryLength(LPTSTR ExeName)
  DWORD GetConsoleCommandHistory(LPTSTR CommandBuffer,
                                 DWORD CommandBufferLength,
                                 LPTSTR ExeName)
I can't be the only person frustrated by how opening a new console doesn't load the command history from previous (not current) instances of console applications. The console needs a SetConsoleCommandHistory function. Please ask the team that owns the console subsystem (conhost.exe, conhostv2.dll, condrv.sys) and doskey.exe to implement something like this -- and to document these functions as public APIs. A doskey "/historyfile" option could support [ExeName] sections, like the current "/macrofile" option.
cmd.exe supports an AutoRun registry value, which would allow running doskey.exe to load command history, but it doesn't allow automatically saving history. I'd prefer that cmd.exe handled this automatically (but only for its own history) by appending to a per-user history file stored in "%APPDATA%\Microsoft\Command Processor\history.txt", which reflects the location of its registry key, "HKCU\SOFTWARE\Microsoft\Command Processor".



Sorry, one more favorite of mine
start .
Open a File Explorer for the current directory. Because sometimes dir doesn't cut it.


dir /s | more
for pausing output per page


dir /a,
Hidden dir parameter - shows all files (hidden, system, etc) without have to specify the full list of things to unhide. (note that is a comma after the "/a")


"mklink" is a good use of "cmd". I prefer symbolic links to shortcuts. I haven't seen a way to make symbolic links in the file manager.



Try this on command line on NTFS drive:
echo hidden > test.txt:hidden
echo hidden2 >> test.txt:hidden
do a dir test.txt , what's the file size?
do a type test.txt or use notepad to edit , it's empty
do a more < test.txt:hidden
you see what you have echo and pipe and append into the test.txt section hidden ;-)


hostname
whoami


Don't forget pushd and popd.
'Pushd' changes directory to the parameter and remembers the current directory on a stack. It's a little better than 'cd' because you can also change folders and drive letters in one command.
'Popd' pops the directory off the stack and changes to it -- including changing drive letters.
So with pushd and popd you can really drill in and then pop back. I use a DOSKEY macrofile that makes 'cd' a macro for pushd and '.' a macro for popd. This turns the '.' key into a back button.



'Call' for subroutines
To execute a set of custom commands based on command line arguments
1. Parse/validate command line arguments
2. Use ECHO to write .bat file to execute the sequence of commands
3. Call that batch file
This provides equivalent function call functionality to bash.
Current command set:
- The built in dos batch commands
- gnuwin32 - most of the basic unix commands
- sysinternals suite
- image processing
- optipng - compress and fix badly formatted png files
- imagej - open dicom and lots of basic image formats, image processing, opens source
- xpdf - extract text from pdf, render pdf pages to 300 or higher dpi image files, extrac images from pdf, split pdf into individual pages, concatenate pdf files into a single pdf, ...
- jpegtran - optimize jpeg files, drop partial blocks from edge of file
- imagemagick
- gnuwin32's tiff2pdf convert a multipage tiff file to a single pdf
- media
- mplayer
- videolan
- audio
- lame
That's let me watch/convert from most video and audio formats, convert/extract/build pdf files, ...
If VS would only add one thing.....tell the actual DLL that was not found when it reports a DLL or one of its dependencies could not be loaded........................
The OS has the information since it could not find/load the DLL and should have a way to report it back to VS in debug mode.....

### Command Line Commands


   ADDUSERS Add or list users to/from a CSV file
   ADmodcmd Active Directory Bulk Modify
   ARP      Address Resolution Protocol
   ASSOC    Change file extension associations•
   ATTRIB   Change file attributes
b
   BCDBOOT  Create or repair a system partition
   BCDEDIT  Manage Boot Configuration Data
   BITSADMIN Background Intelligent Transfer Service
   BROWSTAT Get domain, browser and PDC info
c
   CACLS    Change file permissions
   CALL     Call one batch program from another•
   CERTREQ  Request certificate from a certification authority
   CERTUTIL Utility for certification authority (CA) files and services
   CD       Change Directory - move to a specific Folder•
   CHANGE   Change Terminal Server Session properties
   CHCP     Change the active console Code Page
   CHKDSK   Check Disk - check and repair disk problems
   CHKNTFS  Check the NTFS file system
   `CHOICE`   Accept keyboard input to a batch file
   CIPHER   Encrypt or Decrypt files/folders
   CleanMgr Automated cleanup of Temp files, recycle bin
   CLIP     Copy STDIN to the Windows clipboard
   CLS      Clear the screen•
   CMD      Start a new CMD shell
   CMDKEY   Manage stored usernames/passwords
   COLOR    Change colors of the CMD window•
   COMP     Compare the contents of two files or sets of files
   COMPACT  Compress files or folders on an NTFS partition
   COMPRESS Compress one or more files
   CONVERT  Convert a FAT drive to NTFS
   COPY     Copy one or more files to another location•
   Coreinfo Show the mapping between logical & physical processors
   CSCcmd   Client-side caching (Offline Files)
   CSVDE    Import or Export Active Directory data
d
   DATE     Display or set the date•
   DEFRAG   Defragment hard drive
   DEL      Delete one or more files•
   DELPROF  Delete user profiles
   DELTREE  Delete a folder and all subfolders
   DevCon   Device Manager Command Line Utility
   DIR      Display a list of files and folders•
   DIRQUOTA File Server Resource Manager Disk quotas
   DIRUSE   Display disk usage
   DISKPART Disk Administration
   DISKSHADOW Volume Shadow Copy Service
   DISKUSE  Show the space used in folders
   DISM     Deployment Image Servicing and Management
   DNSCMD   Manage DNS servers
   DOSKEY   Edit command line, recall commands, and create macros
   DriverQuery Display installed device drivers
   DSACLs   Active Directory ACLs
   DSAdd    Add items to active directory (user group computer)
   DSGet    View items in active directory (user group computer)
   DSQuery  Search for items in active directory (user group computer)
   DSMod    Modify items in active directory (user group computer)
   DSMove   Move an Active directory Object
   DSRM     Remove items from Active Directory
   Dsmgmt   Directory Service Management
e
   ECHO     Display message on screen•
   ENDLOCAL End localisation of environment changes in a batch file•
   ERASE    Delete one or more files•
   EVENTCREATE Add a message to the Windows event log
   EXIT     Quit the current script/routine and set an errorlevel•
   EXPAND   Uncompress CAB files
   EXPLORER Open Windows Explorer
   EXTRACT  Uncompress CAB files
f
   FC       Compare two files
   FIND     Search for a text string in a file
   FINDSTR  Search for strings in files
   FLTMC    Manage MiniFilter drivers
   FOR /F   Loop command: against a set of files•
   FOR /F   Loop command: against the results of another command•
   FOR      Loop command: all options Files, Directory, List•
   FORFILES Batch process multiple files
   FORMAT   Format a disk
   FREEDISK Check free disk space
   FSUTIL   File and Volume utilities
   FTP      File Transfer Protocol
   FTYPE    File extension file type associations•
g
   GETMAC   Display the Media Access Control (MAC) address
   GOTO     Direct a batch program to jump to a labelled line•
   GPRESULT Display Resultant Set of Policy information
   GPUPDATE Update Group Policy settings
h
   HELP     Online Help
   HOSTNAME Display the host name of the computer
i
   iCACLS   Change file and folder permissions
   IEXPRESS Create a self extracting ZIP file archive
   IF       Conditionally perform a command•
   IFMEMBER Is the current user a member of a group
   IPCONFIG Configure IP
   INUSE    Replace files that are in use by the OS
l
   LABEL    Edit a disk label
   LGPO     Local Group Policy Object utility
   LODCTR   Load PerfMon performance counters
   LOGMAN   Manage Performance Monitor logs
   LOGOFF   Log a user off
   LOGTIME  Log the date and time in a file
m
   MAKECAB  Create .CAB files
   MAPISEND Send email from the command line
   MBSAcli  Baseline Security Analyzer
   MEM      Display memory usage
   MD       Create new folders•
   MKLINK   Create a symbolic link (linkd) •
   MODE     Configure a system device COM/LPT/CON
   MORE     Display output, one screen at a time
   MOUNTVOL Manage a volume mount point
   MOVE     Move files from one folder to another•
   MOVEUSER Move a user from one domain to another
   MSG      Send a message
   MSIEXEC  Microsoft Windows Installer
   MSINFO32 System Information
   MSTSC    Terminal Server Connection (Remote Desktop Protocol)
n
   NET      Manage network resources
   NETDOM   Domain Manager
   NETSH    Configure Network Interfaces, Windows Firewall & Remote access
   NBTSTAT  Display networking statistics (NetBIOS over TCP/IP)
   NETSTAT  Display networking statistics (TCP/IP)
   NLSINFO  Display locale information (reskit).
   NLTEST   Network Location Test (AD)
   NOW      Display the current Date and Time
   NSLOOKUP Name server lookup
   NTBACKUP Windows Backup folders to tape
   NTDSUtil Active Directory Domain Services management
   NTRIGHTS Edit user account rights
   NVSPBIND Modify network bindings
o
   OPENFILES Query or display open files
p
   PATH     Display or set a search path for executable files•
   PATHPING Trace route plus network latency and packet loss
   PAUSE    Suspend processing of a batch file and display a message•
   PERMS    Show permissions for a user
   PERFMON  Performance Monitor
   PING     Test a network connection
   POPD     Return to a previous directory saved by PUSHD•
   PORTQRY  Display the status of ports and services
   POWERCFG Configure power settings
   PRINT    Print a text file
   PRINTBRM Print queue Backup/Recovery
   PRNCNFG  Configure or rename a printer
   PRNMNGR  Add, delete, list printers and printer connections
   ProcDump Monitor an application for CPU spikes
   PROMPT   Change the command prompt•
   PsExec     Execute process remotely
   PsFile     Show files opened remotely
   PsGetSid   Display the SID of a computer or a user
   PsInfo     List information about a system
   PsKill     Kill processes by name or process ID
   PsList     List detailed information about processes
   PsLoggedOn Who's logged on (locally or via resource sharing)
   PsLogList  Event log records
   PsPasswd   Change account password
   PsPing     Measure network performance
   PsService  View and control services
   PsShutdown Shutdown or reboot a computer
   PsSuspend  Suspend processes
   PUSHD    Save and then change the current directory•
q
   QGREP    Search file(s) for lines that match a given pattern
   Query Process / QPROCESS  Display processes
   Query Session / QWinsta   Display all sessions (TS/Remote Desktop)
   Query TermServer /QAppSrv List all servers (TS/Remote Desktop)
   Query User    / QUSER     Display user sessions (TS/Remote Desktop)
r
   RASDIAL  Manage RAS connections
   RASPHONE Manage RAS connections
   RD       Delete folder(s)•
   RECOVER  Recover a damaged file from a defective disk
   REG      Registry: Read, Set, Export, Delete keys and values
   REGEDIT  Import or export registry settings
   REGSVR32 Register or unregister a DLL
   REGINI   Change Registry Permissions
   REM      Record comments (remarks) in a batch file•
   REN      Rename a file or files•
   REPLACE  Replace or update one file with another
   Reset Session  Delete a Remote Desktop Session
   RMTSHARE Share a folder or a printer
   ROBOCOPY Robust File and Folder Copy
   ROUTE    Manipulate network routing tables
   RUN      Start | RUN commands
   RUNAS    Execute a program under a different user account
   RUNDLL32 Run a DLL command (add/remove print connections)

s
   SC       Service Control
   SCHTASKS Schedule a command to run at a specific time
   SET      Display, set, or remove session environment variables•
   SETLOCAL Control the visibility of environment variables•
   SetSPN   Edit Service Principal Names
   SETX     Set environment variables
   SFC      System File Checker
   SHARE    List or edit a file share or print share
   ShellRunAs Run a command under a different user account
   SHIFT    Shift the position of batch file parameters•
   SHORTCUT Create a windows shortcut (.LNK file)
   SHUTDOWN Shutdown the computer
   SIGCHECK Display file version no. VirusTotal status & timestamp
   SLEEP    Wait for x seconds
   SLMGR    Software Licensing Management (Vista/2008)
   SORT     Sort input
   START    Start a program, command or batch file•
   STRINGS  Search for ANSI and UNICODE strings in binary files
   SUBINACL Edit file and folder Permissions, Ownership and Domain
   SUBST    Associate a path with a drive letter
   SYSMON   Monitor and log system activity to the Windows event log
   SYSTEMINFO List system configuration
t
   TAKEOWN  Take ownership of a file
   TASKLIST List running applications and services
   TASKKILL End a running process
   TELNET   Communicate with another host using the TELNET protocol
   TIME     Display or set the system time•
   TIMEOUT  Delay processing of a batch file/command
   TITLE    Set the window title for a CMD.EXE session•
~~TLIST    Task list with full path~~
   TOUCH    Change file timestamps
   TRACERT  Trace route to a remote host
   TREE     Graphical display of folder structure
   TSDISCON Disconnect a Remote Desktop Session
   TSKILL   End a running process
   TYPE     Display the contents of a text file•
   TypePerf Write performance data to a log file
   TZUTIL   Time Zone Utility
v
   VER      Display version information•
   VERIFY   Verify that files have been saved•
   VMConnect Connect to a Hyper-V Virtual Machine
   VOL      Display a disk label•
   VSSADMIN Display volume shadow copy backups and shadow copy writers/providers.
w
   W32TM    Time Service
   WAITFOR  Wait for or send a signal
   WBADMIN  Windows Backup Admin
   WECUTIL  Windows Event Collector Utility
   WEVTUTIL Clear event logs, enable/disable/query logs
   WHERE    Locate and display files in a directory tree
   WHOAMI   Output the current UserName and domain
   WINDIFF  Compare the contents of two files or sets of files
   WINRM    Windows Remote Management
   WINRS    Windows Remote Shell
   WMIC     WMI Commands
   WPEUTIL  Run WinPE commands
   WPR      Windows Performance Recorder
   WUSA     Windows Update Standalone Installer
   WUAUCLT  Windows Update
x
   XCACLS   Change file and folder permissions
   XCOPY    Copy files and folders
   ::       Comment / Remark•

ARP
AT *deprecated*
A

### MKLINK

        Creates a symbolic link.

        MKLINK [[/D] | [/H] | [/J]] Link Target

                /D      Creates a directory symbolic link.  Default is a file
                        symbolic link.
                /H      Creates a hard link instead of a symbolic link.
                /J      Creates a Directory Junction.
                Link    Specifies the new symbolic link name.
                Target  Specifies the path (relative or absolute) that the new link
                        refers to.

[Junctions and Hardlinks]
(https://docs.microsoft.com/en-us/windows/desktop/fileio/hard-links-and-junctions)

[Symbolic Links](https://docs.microsoft.com/en-us/windows/desktop/fileio/creating-symbolic-links)


Arg 1 is the shortcut name, what you will click on to go where you want.

3 Options

[[none]] No flags- This creates a symbolic link between **files**  It creates a new pseudofile that occcrs elsewhere

[[D]] -more like a shortcut, but not a file.  Opening Folder A drops you in Folder B. This is the directory version of the 'default' option.

[[H]]   A hard link refers to a **file** not a directory

[[J]] - this is complicated.  The destination apparently cannot exist yet.  So I created `mklink /K folA folB`  A shortcut named `folA`.  Then I must create folder B.  In the expected spot.  Now when I open Folder B I am in Folder B.  And when I open Folder A I am in folder A.  But Anything in one appears in the other.

        The shortcut can't already exist, but the destination can.

### FSUTIL

[A reference](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/fsutil)

**You must be logged on as an administrator** or a member of the Administrators group to use Fsutil. The Fsutil command is quite powerful and should be used only by advanced users who have a thorough knowledge of Windows operating systems.

You **have to enable Windows Subsystem for Linux before you can run Fsutil.** Run the following command as Administrator in PowerShell to enable this optional feature:

`Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux`

You'll be prompted to restart your computer once it's installed. After your computer restarts, you'll be able to run Fsutil as an administrator

C:\temp$ fsutil

---- Commands Supported ----
- 8dot3name       8dot3name management
- behavior        Control file system behavior
- dirty           Manage volume dirty bit
- file            File specific commands
- fsinfo          File system information
- hardlink        Hardlink management
- objectid        Object ID management
- quota           Quota management
- repair          Self healing management
- reparsepoint    Reparse point management
- resource        Transactional Resource Manager management
- sparse          Sparse file control
- tiering         Storage tiering property management
- transaction     Transaction management
- usn             USN management
- volume          Volume management
- wim             Transparent wim hosting management

#### Subcommand & Description

- `Fsutil 8dot3name` - Queries or changes the settings for short name behavior on the system, for example, generates 8.3 character-length file names. Removes short names for all files within a directory. Scans a directory and identifies registry keys that might be impacted if short names were stripped from the files in the directory.

- `Fsutil behavior` - Queries or sets volume behavior.

- `Fsutil dirty` - Queries whether the volume's dirty bit is set or sets a volume's dirty bit. When a volume's dirty bit is set, autochk automatically checks the volume for errors the next time the computer is restarted.

- `Fsutil file` - Finds a file by user name (if Disk Quotas are enabled), queries allocated ranges for a file, sets a file's short name, sets a file's valid data length, sets zero data for a file, creates a new file of a specified size, finds a file ID if given the name, or finds a file link name for a specified file ID.

- `Fsutil fsinfo` - Lists all drives and queries the drive type, volume information, NTFS-specific volume information, or file system statistics.

- `Fsutil hardlink` - Lists hard links for a file, or creates a hard link (a directory entry for a file). Every file can be considered to have at least one hard link. On NTFS volumes, each file can have multiple hard links, so a single file can appear in many directories (or even in the same directory, with different names). Because all of the links reference the same file, programs can open any of the links and modify the file. A file is deleted from the file system only after all links to it are deleted. After you create a hard link, programs can use it like any other file name.

- `Fsutil objectid` - Manages object identifiers, which are used by the Windows operating system to track objects such as files and directories.

- `Fsutil quota` - Manages disk quotas on NTFS volumes to provide more precise control of network-based storage. Disk quotas are implemented on a per-volume basis and enable both hard- and soft-storage limits to be implemented on a per-user basis.

- `Fsutil repair` - Queries or sets the self-healing state of the volume. Self-healing NTFS attempts to correct corruptions of the NTFS file system online without requiring Chkdsk.exe to be run. Includes initiating on-disk verification and waiting for repair completion.

- `Fsutil reparsepoint` - Queries or deletes reparse points (NTFS file system objects that have a definable attribute containing user-controlled data). Reparse points are used to extend functionality in the input/output (I/O) subsystem. They are used for directory junction points and volume mount points. They are also used by file system filter drivers to mark certain files as special to that driver.

- `Fsutil resource` - Creates a Secondary Transactional Resource Manager, starts or stops a Transactional Resource Manager, displays information about a Transactional Resource Manager or modifies its behavior.

- `Fsutil sparse` - Manages sparse files. A sparse file is a file with one or more regions of unallocated data in it. A program will see these unallocated regions as containing bytes with the value zero, but no disk space is used to represent these zeros. All meaningful or nonzero data is allocated, whereas all non-meaningful data (large strings of data composed of zeros) is not allocated. When a sparse file is read, allocated data is returned as stored and unallocated data is returned as zeros (by default in accordance with the C2 security requirement specification). Sparse file support allows data to be deallocated from anywhere in the file.

- `Fsutil tiering` - Enables management of storage tier functions, such as setting and disabling flags and listing of tiers.

- `Fsutil transaction` - Commits a specified transaction, rolls back a specified transaction, or displays info about the transaction.


- `Fsutil usn` - Manages the update sequence number (USN) change journal, which provides a persistent log of all changes made to files on the volume.

- `Fsutil volume` - Manages a volume. Dismounts a volume, queries to see how much free space is available on a disk, or finds a file that is using a specified cluster.

- `Fsutil wim` - Provides functions to discover and manage WIM-backed files.

#### A detailed list of possible actions (2nd Level)

- ---- 8DOT3NAME Commands Supported ----
  - query   Query the current setting for the shortname behaviour on the system
  - scan    Scan for impacted registry entries
  - set     Change the setting that controls the shortname behavior on the system
  - strip   Remove the shortnames for all files within a directory
- ---- BEHAVIOR Commands Supported ----
  - query           Query the file system behavior parameters
  - set             Change the file system behavior parameters
    - allowExtChar
    - bugcheckOnCorrupt
    - disable8dot3 [<Volume Path>]
    - disableCompression
    - disableCompressionLimit
    - disableDeleteNotify [NTFS|ReFS]
    - disableEncryption
    - disableFileMetadataOptimization
    - disableLastAccess
    - disableSpotCorruptionHandling
    - encryptPagingFile
    - memoryUsage
    - mftZone
    - quotaNotify
    - symlinkEvaluation
    - disableWriteAutoTiering [<Volume Path>]
    - disableTxf [<Volume Path>]
- ---- DIRTY Commands Supported ----
  - query           Query the dirty bit
  - set             Set the dirty bit
- ---- FILE Commands Supported ----
  - createNew                Creates a new file of a specified size
  - findBySID                Find a file by security identifier
  - layout                   Query all the information available about the file
  - optimizeMetadata         Optimize metadata for a file
  - queryAllocRanges         Query the allocated ranges for a file
  - queryCaseSensitiveInfo   Query the case sensitive information for a directory
  - queryExtents             Query the extents for a file
  - queryExtentsAndRefCounts Query the extents and their corresponding refcounts for a file
  - queryFileID              Queries the file ID of the specified file
  - queryFileNameById        Displays a random link name for the file ID
  - queryOptimizeMetadata    Query the optimize metadata state for a file
  - queryValidData           Queries the valid data length for a file
  - setCaseSensitiveInfo     Set the case sensitive information for a directory
  - setShortName             Set the short name for a file
  - setValidData             Set the valid data length for a file
  - setZeroData              Set the zero data for a file
  - setEOF                   Sets the end of file for an existing file
  - setStrictlySequential    Sets ReFS SMR file as strictly sequential
- ---- FSINFO Commands Supported ----
  - drives          List all drives
  - driveType       Query drive type for a drive
  - ntfsInfo        Query NTFS specific volume information
  - refsInfo        Query REFS specific volume information
  - sectorInfo      Query sector information
  - statistics      Query file system statistics
  - volumeInfo      Query volume information
- ---- HARDLINK Commands Supported ----
  - create          Create a hardlink
  - list            Enumerate hardlinks on a file
- ---- OBJECTID Commands Supported ----
  - create          Create the object identifier
  - delete          Delete the object identifier
  - query           Query the object identifier
  - set             Change the object identifier
- ---- QUOTA Commands Supported ----
  - disable         Disable quota tracking and enforcement
  - enforce         Enable quota enforcement
  - modify          Set disk quota for a user
  - query           Query disk quotas
  - track           Enable quota tracking
  - violations      Display quota violations
- ---- REPAIR Commands Supported ----
  - enumerate      Enumerate the entries of a volume's corruption log
  - initiate       Initiate the repair of a file
  - query          Query the self healing state of the volume
  - set            Set the self healing state of the volume
  - state          Query the corruption state of the volume(s)
  - wait           Wait for repair(s) to complete
- ---- REPARSEPOINT Commands Supported ----
  - delete          Delete a reparse point
  - query           Query a reparse point
- ---- RESOURCE Commands Supported ----
  - create          Create a Secondary Transactional Resource Manager
  - info            Display information relating to a Transactional Resource Manager
  - setAutoReset    Set whether a default Transactional Resource Manager will clean its transactional metadata on next mount
  - setAvailable    Set a Transactional Resource Manager to prefer availability over consistency
  - setConsistent   Set a Transactional Resource Manager to prefer consistency over availability
  - setLog          Change characteristics of a running Transactional Resource Manager
  - start           Start a Transactional Resource Manager
  - stop            Stop a Transactional Resource Manager
- ---- SPARSE Commands Supported ----
  - queryFlag       Query sparse
  - queryRange      Query range
  - setFlag         Set sparse
  - setRange        Set sparse range
- ---- TIERING Commands Supported ----
  - clearFlags      Disable tiering behavior flags of a volume
  - queryFlags      Display the tiering behavior flags of a volume
  - regionList      List the regions of a volume and their respective storage tiers
  - setFlags        Enable tiering behavior flags of a volume
  - tierList        List the storage tiers associated with a volume
- ---- TRANSACTION Commands Supported ----
  - commit          Commit a specified transaction
  - fileinfo        Display transaction information for a specific file
  - list            Display currently running transactions
  - query           Display information on a specified transaction
  - rollback        Rollback a specified transaction
- ---- USN Commands Supported ----
  - createJournal           Create a USN journal
  - deleteJournal           Delete a USN journal
  - enableRangeTracking     Enable write range tracking for a volume
  - enumData                Enumerate USN data
  - queryJournal            Query the USN data for a volume
  - readJournal             Reads the USN records in the USN journal
  - readData                Read the USN data for a file
- ---- WIM Commands Supported ----
  - enumFiles           Enumerate WIM backed files
  - enumWims            Enumerate backing WIM files
  - removeWim           Remove a WIM from backing files
  - queryFile           Query the origin of a specific file


### clip

PIPE COMMAND OUTPUT TO THE CLIPBOARD
In Vista they added clip.exe. It captures any standard input and puts in the clipboard.

That means you can

```bat
dir /s | clip
ver | clip
ipconfig /all | clip
```

### type

type followed by the filename prints the contents of the file. Use the pipe (|) and clip to copy to the clipboard. Works in the same way cat does in PowerShell.

type somefile.txt | clip


### F7

F7 GIVES YOU A GRAPHICAL (TEXT) HISTORY

If you have already typed a few commands, you can press F7 to get an ANSI popup with a list of commands you've typed. 4DOS anyone?

F11 or "ALT-ENTER" in the command prompt (any prompt, cmd, powershell, or bash) will make it full screen. I like to put my command prompt on another virtual desktop and then use CTRL-WIN-ARROWS to move between them.


###  ?

cd | clip
dir /b /s | clip
mode con rate=32 delay=1
echo AT&F&C1&D2M1L3S11=33 > COM

### mpcmdrun.exe (Windows Defen


`MpCmdRun.exe` - Runs the Windows Defender Commandline tool, but it is not on path.

Usage: MpCmdRun.exe [command] [-options]

```bat
cd "%ProgramFiles%\Windows Defender\"
MpCmdRun.exe -?
#or better yet- just use:
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -?
```

| Command                                   | Description                                                |
| ----------------------------------------- | ---------------------------------------------------------- |
| -? or -h                                  | Displays all available options for this tool               |
| -Scan  [^Scan]                            | Scans for malicious software                               |
| -Trace [^Trace]                           | Starts diagnostic tracing                                  |
| -GetFiles                                 | Collects support information                               |
| -GetFilesDiagTrack                        | Same as Getfiles but outputs to temporary DiagTrack folder |
| -RemoveDefinitions                        | See details below for each [^Remove]                       |
| -SignatureUpdate                          | Checks for new Security intelligence updates               |
| -Restore [^Restore]                       | Restores or lists quarantined item(s)                      |
| -AddDynamicSignature [-Path]              | Loads dynamic Security intelligence                        |
| -ListAllDynamicSignatures                 | Lists the loaded dynamic Security intelligence             |
| -RemoveDynamicSignature [-SignatureSetID] | Removes dynamic Security intelligence                      |
| -CheckExclusion -path                     | Checks whether a path is excluded                          |


**Scan** has the following sub options
[^Scan]: [-ScanType #] [-File [-DisableRemediation] [-BootSectorScan]] [-Timeout ] [-Cancel]

Restore has the folloing options
 [^Restore]:  [-ListAll \| [[-Name ] [-All] \| [-FilePath ]] [-Path ]]

[^Trace]: [-Grouping #] [-Level #]

[^SignatureUpdate]: [-UNC \| -MMPC]
To run, use:


[^Remove]: RemoveDefinitions
  [-All] Restores the installed Security intelligence to a previous backup copy or to the original default set
 [-DynamicSignatures] Removes only the dynamically downloaded Security intelligence
 [-Engine]  Restores the previous installed engine
`"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -scan -scantype 3 -File <Path> -DisableRemediation`

Scantype 3 means a specific directory/file. File gives the file, and disabling remediation prevents any outcomes except to terminal (deleting, logging, attempting clean.)

### taskkill

Kill a task, then immediately restart it.

```bat
taskkill /f /im explorer.exe & start explorer.exe
```

Taskkill:

```bat
TASKKILL [/S system [/U username [/P [password]]]]
         { [/FI filter] [/PID processid | /IM imagename] } [/T] [/F]

Description:
    This tool is used to terminate tasks by process id (PID) or image name.

Parameter List:
    /S    system           Specifies the remote system to connect to.

    /U    [domain\]user    Specifies the user context under which the
                           command should execute.

    /P    [password]       Specifies the password for the given user
                           context. Prompts for input if omitted.

    /FI   filter           Applies a filter to select a set of tasks.
                           Allows "*" to be used. ex. imagename eq acme*

    /PID  processid        Specifies the PID of the process to be terminated.
                           Use TaskList to get the PID.

    /IM   imagename        Specifies the image name of the process
                           to be terminated. Wildcard '*' can be used
                           to specify all tasks or image names.

    /T                     Terminates the specified process and any
                           child processes which were started by it.

    /F                     Specifies to forcefully terminate the process(es).

    /?                     Displays this help message.

Filters:
    Filter Name   Valid Operators           Valid Value(s)
    -----------   ---------------           -------------------------
    STATUS        eq, ne                    RUNNING |
                                            NOT RESPONDING | UNKNOWN
    IMAGENAME     eq, ne                    Image name
    PID           eq, ne, gt, lt, ge, le    PID value
    SESSION       eq, ne, gt, lt, ge, le    Session number.
    CPUTIME       eq, ne, gt, lt, ge, le    CPU time in the format
                                            of hh:mm:ss.
                                            hh - hours,
                                            mm - minutes, ss - seconds
    MEMUSAGE      eq, ne, gt, lt, ge, le    Memory usage in KB
    USERNAME      eq, ne                    User name in [domain\]user
                                            format
    MODULES       eq, ne                    DLL name
    SERVICES      eq, ne                    Service name
    WINDOWTITLE   eq, ne                    Window title

    NOTE
    ----
    1) Wildcard '*' for /IM switch is accepted only when a filter is applied.
    2) Termination of remote processes will always be done forcefully (/F).
    3) "WINDOWTITLE" and "STATUS" filters are not considered when a remote
       machine is specified.

Examples:
    TASKKILL /IM notepad.exe
    TASKKILL /PID 1230 /PID 1241 /PID 1253 /T
    TASKKILL /F /IM cmd.exe /T
    TASKKILL /F /FI "PID ge 1000" /FI "WINDOWTITLE ne untitle*"
    TASKKILL /F /FI "USERNAME eq NT AUTHORITY\SYSTEM" /IM notepad.exe
    TASKKILL /S system /U domain\username /FI "USERNAME ne NT*" /IM *
    TASKKILL /S system /U username /P password /FI "IMAGENAME eq note*"
```

See also: Tasklist

### Tasklist

```bat
TASKLIST [/S system [/U username [/P [password]]]]
         [/M [module] | /SVC | /V] [/FI filter] [/FO format] [/NH]

Description:
    This tool displays a list of currently running processes on
    either a local or remote machine.

Parameter List:
   /S     system           Specifies the remote system to connect to.

   /U     [domain\]user    Specifies the user context under which
                           the command should execute.

   /P     [password]       Specifies the password for the given
                           user context. Prompts for input if omitted.

   /M     [module]         Lists all tasks currently using the given
                           exe/dll name. If the module name is not
                           specified all loaded modules are displayed.

   /SVC                    Displays services hosted in each process.

   /APPS                   Displays Store Apps and their associated processes.

   /V                      Displays verbose task information.

   /FI    filter           Displays a set of tasks that match a
                           given criteria specified by the filter.

   /FO    format           Specifies the output format.
                           Valid values: "TABLE", "LIST", "CSV".

   /NH                     Specifies that the "Column Header" should
                           not be displayed in the output.
                           Valid only for "TABLE" and "CSV" formats.

   /?                      Displays this help message.

Filters:
    Filter Name     Valid Operators           Valid Value(s)
    -----------     ---------------           --------------------------
    STATUS          eq, ne                    RUNNING | SUSPENDED
                                              NOT RESPONDING | UNKNOWN
    IMAGENAME       eq, ne                    Image name
    PID             eq, ne, gt, lt, ge, le    PID value
    SESSION         eq, ne, gt, lt, ge, le    Session number
    SESSIONNAME     eq, ne                    Session name
    CPUTIME         eq, ne, gt, lt, ge, le    CPU time in the format
                                              of hh:mm:ss.
                                              hh - hours,
                                              mm - minutes, ss - seconds
    MEMUSAGE        eq, ne, gt, lt, ge, le    Memory usage in KB
    USERNAME        eq, ne                    User name in [domain\]user
                                              format
    SERVICES        eq, ne                    Service name
    WINDOWTITLE     eq, ne                    Window title
    MODULES         eq, ne                    DLL name

NOTE: "WINDOWTITLE" and "STATUS" filters are not supported when querying
      a remote machine.

Examples:
    TASKLIST
    TASKLIST /M
    TASKLIST /V /FO CSV
    TASKLIST /SVC /FO LIST
    TASKLIST /APPS /FI "STATUS eq RUNNING"
    TASKLIST /M wbem*
    TASKLIST /S system /FO LIST
    TASKLIST /S system /U domain\username /FO CSV /NH
    TASKLIST /S system /U username /P password /FO TABLE /NH
    TASKLIST /FI "USERNAME ne NT AUTHORITY\SYSTEM" /FI "STATUS eq running"
```
### CHM Files and HTML HELP

Can be decompiled Using Powershell

[Dead Msft Source]

[Script Used as source](https://social.technet.microsoft.com/wiki/contents/articles/34963.how-to-decompile-a-compiled-html-help-chm-files-and-extract-information-using-powershell.aspx)

```ps1
$Exe = 'C:\Windows\hh.exe'
Test-Path $Exe
$Des = 'D:\ASUSsync\AHK\decom'
Test-Path $Des
$File = 'C:\Program Files\AutoHotkey\AutoHotkey.chm'
Start-Process -FilePath $Exe -ArgumentList "-decompile $Des $File"
```

more

```ps1
Function Get-DecompiledHTMLHelp
{
    [cmdletbinding()]
    param(
            [String] $Destination, [String]$Filename
    )
    $EXE = 'C:\Windows\hh.exe'
    If(-not (Test-Path $destination))
    {
        "Destination folder doesn't exist"
    }
    elseIf(-not (Test-Path $Filename))
    {
        "Target .chm file not found, please make sure you're entering the full path and file name"
    }
    else
    {
        Start-Process -FilePath $EXE -ArgumentList "-decompile $Destination $Filename"

        $FilesAndFolder = Get-ChildItem $Destination -Recurse| group psiscontainer
        $FolderCount = ($Filesandfolder| ?{$_.name -eq $true}).count
        $FileCount = ($Filesandfolder| ?{$_.name -eq $False}).count
        Write-host "Decompiled into $(if($Foldercount -gt 0){$Foldercount}else{0}) Folders and $(if($FileCount){$FileCount}else{0}) Files to Destination $Destination" -ForegroundColor Yellow
    }

}

### RunDll and its command

Can be run in AHK - from Help on RUn

If Target contains any commas, they must be escaped as shown three times in the following example:

        Run rundll32.exe shell32.dll`,Control_RunDLL desk.cpl`,`, 3  ; Opens Control Panel > Display Properties > Settings

When running a program via ComSpec (cmd.exe) -- perhaps because you need to redirect the program's input or output -- if the path or name of the executable contains spaces, the entire string should be enclosed in an outer pair of quotes. In the following example, the outer quotes are shown in red and all the inner quotes are shown in black:

        Run %ComSpec% /c ""C:\My Utility.exe" "param 1" "second param" >"C:\My File.txt""

If Target cannot be launched, an error window is displayed and the current thread is exited, unless the string UseErrorLevel is included in the third parameter or the error is caught by a Try/Catch statement.

Performance may be slightly improved if Target is an exact path, e.g. Run, C:\Windows\Notepad.exe "C:\My Documents\Test.txt" rather than Run, C:\My Documents\Test.txt.

Special CLSID folders may be opened via Run. For example:

        Run ::{20d04fe0-3aea-1069-a2d8-08002b30309d}  ; Opens the "My Computer" folder.
        Run ::{645ff040-5081-101b-9f08-00aa002f954e}  ; Opens the Recycle Bin.


### RunDll Commands

List  of Rundll32 Commands in Windows 10

| Function                                | Rundll32 command                                                      |
| --------------------------------------- | --------------------------------------------------------------------- |
| About Windows                           | Rundll32.exe shell32.dll,ShellAbout                                   |
| Add Network Location Wizard             | Rundll32 %SystemRoot%\system32\shwebsvc.dll,AddNetPlaceRunDll         |
| Add Printer Wizard                      | Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL AddPrinter            |
| Add Standard TCP/IP Printer Port Wizard | Rundll32.exe tcpmonui.dll,LocalAddPortUI                              |
| Control Panel                           | Rundll32.exe shell32.dll,Control_RunDLL                               |
| Date and Time                           | Rundll32.exe shell32.dll,Control_RunDLL timedate.cpl                  |
| Date and Time - Additional Clocks tab   | Rundll32.exe shell32.dll,Control_RunDLL timedate.cpl,,1               |
| Desktop Icon Settings                   | Rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0                   |
| Device Installation Settings            | Rundll32.exe %SystemRoot%\System32\newdev.dll DeviceInternetSettingUi |
| Device Manager                          | Rundll32.exe devmgr.dll DeviceManager_Execute                         |
| Display Settings                        | Rundll32.exe shell32.dll,Control_RunDLL desk.cpl                      |
| Ease of Access Center                   | Rundll32.exe shell32.dll,Control_RunDLL access.cpl                    |
| Environment Variables                   | Rundll32.exe sysdm.cpl,EditEnvironmentVariables                       |
| _File Explorer Options_                 |                                                                       |
| - General tab                           | Rundll32.exe shell32.dll,Options_RunDLL 0                             |
| - Search tab                            | Rundll32.exe shell32.dll,Options_RunDLL 2                             |
| - View tab                              | Rundll32.exe shell32.dll,Options_RunDLL 7                             |
| - Fonts folder                          | Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL FontsFolder           |
| Forgotten Password Wizard               | Rundll32.exe keymgr.dll,PRShowSaveWizardExW                           |
| Game Controllers                        | Rundll32.exe shell32.dll,Control_RunDLL joy.cpl                       |
| Hibernate or Sleep                      | Rundll32.exe powrprof.dll,SetSuspendState                             |
| Indexing Options                        | Rundll32.exe shell32.dll,Control_RunDLL srchadmin.dll                 |
| Infared                                 | Rundll32.exe shell32.dll,Control_RunDLL irprops.cpl                   |
| _Internet Explorer_                     |                                                                       |
| - delete browsing history               | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 255                   |
| - delete browsing (& addon) history     | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 4351                  |
| - delete cookies & site data            | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 2                     |
| - delete download history               | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 16384                 |
| - delete form data                      | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 16                    |
| - delete history                        | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 1                     |
| - delete passwords                      | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 32                    |
| - delete temp Internet files            | Rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 8                     |
| - Organize Favorites                    | Rundll32.exe shdocvw.dll,DoOrganizeFavDlg                             |
| - General tab                           | Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl                   |
| - Security tab                          | Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,1                |
| - Privacy tab                           | Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,2                |
| - Content tab                           | Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,3                |
| - Connections tab                       | Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,4                |
| - Programs tab                          | Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,5                |
| - Advanced tab                          | Rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,6                |
| Keyboard Properties                     | Rundll32.exe shell32.dll,Control_RunDLL main.cpl @1                   |
| Lock PC                                 | Rundll32.exe user32.dll,LockWorkStation                               |
| Map Network Drive wizard                | Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL Connect               |
| _Mouse Properties_                      |                                                                       |
| - Mouse swap left and right button      | Rundll32.exe user32.dll,SwapMouseButton                               |
| - Buttons tab                           | Rundll32.exe shell32.dll,Control_RunDLL main.cpl                      |
| - Pointers tab                          | Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,1                   |
| - Pointer Options tab                   | Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,2                   |
| - Wheel tab                             | Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,3                   |
| - Hardware tab                          | Rundll32.exe shell32.dll,Control_RunDLL main.cpl,,4                   |
| Network Connections                     | Rundll32.exe shell32.dll,Control_RunDLL ncpa.cpl                      |
| ODBC Data Source Administrator          | Rundll32.exe shell32.dll,Control_RunDLL odbccp32.cpl                  |
| _Offline Files_                         |                                                                       |
| - General tab                           | Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,0                  |
| - Disk Usage tab                        | Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,1                  |
| - Encryption tab                        | Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,2                  |
| - Network tab                           | Rundll32.exe Shell32.dll,Control_RunDLL cscui.dll,,3                  |
| Pen and Touch                           | Rundll32.exe shell32.dll,Control_RunDLL tabletpc.cpl                  |
| Personalization - Background            | Rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,2                   |
| Power Options                           | Rundll32.exe shell32.dll,Control_RunDLL powercfg.cpl                  |
| Printer User Interface                  | Rundll32.exe Printui.dll,PrintUIEntry /?                              |
| Printers folder                         | Rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL PrintersFolder        |
| Process idle tasks                      | Rundll32.exe advapi32.dll,ProcessIdleTasks                            |
| Programs and Features                   | Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,0                 |
| _Region_                                |                                                                       |
| - Formats tab                           | Rundll32.exe shell32.dll,Control_RunDLL Intl.cpl,,0                   |
| - Location tab                          | Rundll32.exe shell32.dll,Control_RunDLL Intl.cpl,,1                   |
| - Administrative tab                    | Rundll32.exe shell32.dll,Control_RunDLL Intl.cpl,,2                   |
| Safely Remove Hardware                  | Rundll32.exe shell32.dll,Control_RunDLL HotPlug.dll                   |
| Screen Saver Settings                   | Rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1                   |
| Security and Maintenance                | Rundll32.exe shell32.dll,Control_RunDLL wscui.cpl                     |
| Set Program Access and Comp Defaults    | Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,3                 |
| Set Up a Network wizard                 | Rundll32.exe shell32.dll,Control_RunDLL NetSetup.cpl                  |
| Sleep or Hibernate                      | Rundll32.exe powrprof.dll,SetSuspendState                             |
| _Sound_                                 |                                                                       |
| - Playback tab                          | Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,0                  |
| - Recording tab                         | Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,1                  |
| - Sounds tab                            | Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,2                  |
| - Communications tab                    | Rundll32.exe shell32.dll,Control_RunDLL Mmsys.cpl,,3                  |
| Speech Properties [5]                   | Rundll32.exe shell32.dll,Control_RunDLL                               |
|                                         | (...)  %SystemRoot%\System32\Speech\SpeechUX\sapi.cpl,,1              |
| Start Settings                          | Rundll32.exe shell32.dll,Options_RunDLL 3                             |
| Stored User Names and Passwords         | Rundll32.exe keymgr.dll,KRShowKeyMgr                                  |
| _System Properties_                     |                                                                       |
| - Computer Name tab                     | Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,1                  |
| - Hardware tab                          | Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,2                  |
| - Advanced tab                          | Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,3                  |
| - System Protection tab                 | Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,4                  |
| - Remote tab                            | Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,5                  |
| Taskbar Settings                        | Rundll32.exe shell32.dll,Options_RunDLL 1                             |
| Text Services and Input Languages       | Rundll32.exe Shell32.dll,Control_RunDLL input.dll,,                   |
|                                         | (...){C07337D3-DB2C-4D0B-9A93-B722A6C106E2}                           |
| User Accounts                           | Rundll32.exe shell32.dll,Control_RunDLL nusrmgr.cpl                   |
| Windows Features                        | Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,2                 |
| Windows Firewall                        | Rundll32.exe shell32.dll,Control_RunDLL firewall.cpl                  |
| Windows To Go Startup Options           | Rundll32.exe pwlauncher.dll,                                          |
|                                         | (...)ShowPortableWorkspaceLauncherConfigurationUX                     |


### Shell:: Commands

| Shell Command                     | Opens                                                                  |
| --------------------------------- | ---------------------------------------------------------------------- |
| shell:3D Objects                  | `%UserProfile%\3D Objects`                                             |
| shell:AccountPictures             | `%AppData%\Microsoft\Windows\AccountPictures`                          |
| shell:AddNewProgramsFolder        | `Control Panel\All Control Panel Items\Get Programs`                   |
| shell:Administrative Tools        | `%AppData%\Microsoft\Windows\Start Menu\Programs\Administrative Tools` |
| shell:AppData                     | `%AppData%`                                                            |
| shell:Application Shortcuts       | `%LocalAppData%\Microsoft\Windows\Application Shortcuts`               |
| shell:AppsFolder                  | `Applications`                                                         |
| shell:AppUpdatesFolder            | `Installed Updates`                                                    |
| shell:Cache                       | `%LocalAppData%\Microsoft\Windows\INetCache`                           |
| shell:Camera Roll                 | `%UserProfile%\Pictures\Camera Roll`                                   |
| shell:CD Burning                  | `%LocalAppData%\Microsoft\Windows\Burn\Burn`                           |
| shell:ChangeRemoveProgramsFolder  | `Control Panel\All Control Panel Items\Programs and Features`          |
| shell:Common Administrative Tools | `%ProgramData%\Microsoft\Windows\Start ...`                            |
| ...                               | `(...) Menu\Programs\Administrative Tools`                             |
| shell:Common AppData              | `%ProgramData%`                                                        |
| shell:Common Desktop              | `%Public%\Desktop`                                                     |
| shell:Common Documents            | `%Public%\Documents`                                                   |
| shell:CommonDownloads             | `%Public%\Downloads`                                                   |
| shell:CommonMusic                 | `%Public%\Music`                                                       |
| shell:CommonPictures              | `%Public%\Pictures`                                                    |
| shell:Common Programs             | `%ProgramData%\Microsoft\Windows\Start Menu\Programs`                  |
| shell:CommonRingtones             | `%ProgramData%\Microsoft\Windows\Ringtones`                            |
| shell:Common Start Menu           | `%ProgramData%\Microsoft\Windows\Start Menu`                           |
| shell:Common Startup              | `%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup`          |
| shell:Common Templates            | `%ProgramData%\Microsoft\Windows\Templates`                            |
| shell:CommonVideo                 | `%Public%\Videos`                                                      |
| shell:ConflictFolder              | `Control Panel\All Control Panel Items\Sync Center\Conflicts`          |
| shell:ConnectionsFolder           | `Control Panel\All Control Panel Items\Network Connections`            |
| shell:Contacts                    | `%UserProfile%\Contacts`                                               |
| shell:ControlPanelFolder          | `Control Panel\All Control Panel Items`                                |
| shell:Cookies                     | `%LocalAppData%\Microsoft\Windows\INetCookies`                         |
| shell:Cookies\Low                 | `%LocalAppData%\Microsoft\Windows\INetCookies\Low`                     |
| shell:CredentialManager           | `%AppData%\Microsoft\Credentials`                                      |
| shell:CryptoKeys                  | `%AppData%\Microsoft\Crypto`                                           |
| shell:desktop                     | `Desktop`                                                              |
| shell:device Metadata Store       | `%ProgramData%\Microsoft\Windows\DeviceMetadataStore`                  |
| shell:documentsLibrary            | `Libraries\Documents`                                                  |
| shell:downloads                   | `%UserProfile%\Downloads`                                              |
| shell:dpapiKeys                   | `%AppData%\Microsoft\Protect`                                          |
| shell:Favorites                   | `%UserProfile%\Favorites`                                              |
| shell:Fonts                       | `%WinDir%\Fonts`                                                       |
| shell:Games (removed in 1803)     | `Games`                                                                |
| shell:GameTasks                   | `%LocalAppData%\Microsoft\Windows\GameExplorer`                        |
| shell:History                     | `%LocalAppData%\Microsoft\Windows\History`                             |
| shell:HomeGroupCurrentUserFolder  | `Homegroup\(user-name)`                                                |
| shell:HomeGroupFolder             | `Homegroup`                                                            |
| shell:ImplicitAppShortcuts        | `%AppData%\Microsoft\Internet Explorer\Quick`                          |
| ...                               | `(...) Launch\User Pinned\ImplicitAppShortcuts`                        |
| shell:InternetFolder              | `Internet Explorer`                                                    |
| shell:Libraries                   | `Libraries`                                                            |
| shell:Links                       | `%UserProfile%\Links`                                                  |
| shell:Local AppData               | `%LocalAppData%`                                                       |
| shell:LocalAppDataLow             | `%UserProfile%\AppData\LocalLow`                                       |
| shell:MusicLibrary                | `Libraries\Music`                                                      |
| shell:MyComputerFolder            | `This PC`                                                              |
| shell:My Music                    | `%UserProfile%\Music`                                                  |
| shell:My Pictures                 | `%UserProfile%\Pictures`                                               |
| shell:My Video                    | `%UserProfile%\Videos`                                                 |
| shell:NetHood                     | `%AppData%\Microsoft\Windows\Network Shortcuts`                        |
| shell:NetworkPlacesFolder         | `Network`                                                              |
| shell:OneDrive                    | `OneDrive`                                                             |
| shell:OneDriveCameraRoll          | `%UserProfile%\OneDrive\Pictures\Camera Roll`                          |
| shell:OneDriveDocuments           | `%UserProfile%\OneDrive\Documents`                                     |
| shell:OneDriveMusic               | `%UserProfile%\OneDrive\Music`                                         |
| shell:OneDrivePictures            | `%UserProfile%\OneDrive\Pictures`                                      |
| shell:Personal                    | `%UserProfile%\Documents`                                              |
| shell:PicturesLibrary             | `Libraries\Pictures`                                                   |
| shell:PrintersFolder              | `All Control Panel Items\Printers`                                     |
| shell:PrintHood                   | `%AppData%\Microsoft\Windows\Printer Shortcuts`                        |
| shell:Profile                     | `%UserProfile%`                                                        |
| shell:ProgramFiles                | `%ProgramFiles%`                                                       |
| shell:ProgramFilesCommon          | `%ProgramFiles%\Common Files`                                          |
| shell:ProgramFilesCommonX64       | `%ProgramFiles%\Common Files (64-bit Windows only)`                    |
| shell:ProgramFilesCommonX86       | `%ProgramFiles(x86)%\Common Files (64-bit Windows only)`               |
| shell:ProgramFilesX64             | `%ProgramFiles% (64-bit Windows only)`                                 |
| shell:ProgramFilesX86             | `%ProgramFiles(x86)% (64-bit Windows only)`                            |
| shell:Programs                    | `%AppData%\Microsoft\Windows\Start Menu\Programs`                      |
| shell:Public                      | `%Public%`                                                             |
| shell:PublicAccountPictures       | `%Public%\AccountPictures`                                             |
| shell:PublicGameTasks             | `%ProgramData%\Microsoft\Windows\GameExplorer`                         |
| shell:PublicLibraries             | `%Public%\Libraries`                                                   |
| shell:Quick Launch                | `%AppData%\Microsoft\Internet Explorer\Quick Launch`                   |
| shell:Recent                      | `%AppData%\Microsoft\Windows\Recent`                                   |
| shell:RecordedTVLibrary           | `Libraries\Recorded TV`                                                |
| shell:RecycleBinFolder            | `Recycle Bin`                                                          |
| shell:ResourceDir                 | `%WinDir%\Resources`                                                   |
| shell:Ringtones                   | `%ProgramData%\Microsoft\Windows\Ringtones`                            |
| shell:Roamed Tile Images          | `%LocalAppData%\Microsoft\Windows\RoamedTileImages`                    |
| shell:Roaming Tiles               | `%AppData%\Microsoft\Windows\RoamingTiles`                             |
| shell:SavedGames                  | `%UserProfile%\Saved Games`                                            |
| shell:Screenshots                 | `%UserProfile%\Pictures\Screenshots`                                   |
| shell:Searches                    | `%UserProfile%\Searches`                                               |
| shell:SearchHistoryFolder         | `%LocalAppData%\Microsoft\Windows\ConnectedSearch\History`             |
| shell:SearchHomeFolder            | `search-ms:`                                                           |
| shell:SearchTemplatesFolder       | `%LocalAppData%\Microsoft\Windows\ConnectedSearch\Templates`           |
| shell:SendTo                      | `%AppData%\Microsoft\Windows\SendTo`                                   |
| shell:Start Menu                  | `%AppData%\Microsoft\Windows\Start Menu`                               |
| shell:StartMenuAllPrograms        | `StartMenuAllPrograms`                                                 |
| shell:Startup                     | `%AppData%\Microsoft\Windows\Start Menu\Programs\Startup`              |
| shell:SyncCenterFolder            | `Control Panel\All Control Panel Items\Sync Center`                    |
| shell:SyncResultsFolder           | `Control Panel\All Control Panel Items\Sync Center\Sync Results`       |
| shell:SyncSetupFolder             | `Control Panel\All Control Panel Items\Sync Center\Sync Setup`         |
| shell:System                      | `%WinDir%\System32`                                                    |
| shell:SystemCertificates          | `%AppData%\Microsoft\SystemCertificates`                               |
| shell:SystemX86                   | `%WinDir%\SysWOW64`                                                    |
| shell:Templates                   | `%AppData%\Microsoft\Windows\Templates`                                |
| shell:ThisPCDesktopFolder         | `Desktop`                                                              |
| shell:UsersFilesFolder            | `%UserProfile%`                                                        |
| shell:User Pinned                 | `%AppData%\Microsoft\Internet Explorer\Quick Launch\User Pinned`       |
| shell:UserProfiles                | `%HomeDrive%\Users`                                                    |
| shell:UserProgramFiles            | `%LocalAppData%\Programs`                                              |
| shell:UserProgramFilesCommon      | `%LocalAppData%\Programs\Common`                                       |
| shell:UsersLibrariesFolder        | `Libraries`                                                            |
| shell:VideosLibrary               | `Libraries\Videos`                                                     |
| shell:Windows                     | `%WinDir%`                                                             |


### MMC Syntax


| Admin Snap-in                             | Command                        |
| ----------------------------------------- | ------------------------------ |
| Services Management                       | Services.msc                   |
| Performance Monitor                       | PerfMon.msc                    |
| Task Scheduler                            | TaskSchd.msc                   |
| Server Roles, Features                    | ServerManager.msc              |
| Component Services                        | Comexp.msc                     |
| Computer Management                       | Compmgmt.msc                   |
| Win Mangement Instrum                     | WmiMgmt.msc                    |
| Notifications/Start menu/pol              | DevModeRunAsUserConfig.msc     |
| SQL Server configuration Man              | SQLServerManager11.msc         |
| Event Viewer                              | Eventvwr.msc                   |
| AD Domains and Trusts                     | Domain.msc                     |
| AD Sites and Services                     | DSsite.msc                     |
| ADSI Edit                                 | ADSIedit.msc                   |
| **_Disc, File_**                          |                                |
| Win Local Backup                          | WLBadmin.msc                   |
| Disk Manager                              | DiskMgmt.msc                   |
| Failover cluster Manager                  | Cluadmin.exe                   |
| Storage Mgmt                              | StorageMgmt.msc                |
| Win Server Backup (Local+Rem)             | WBadmin.msc                    |
| Disk Defragmenter                         | Defrag.exe (formerly Dfrg.msc) |
| Distributed File Service Mgmt             | DFSmgmt.msc                    |
| Shared Folders open files                 | FSmgmt.msc                     |
| File Server Resource manager              | FSRM.msc                       |
| **_Hardware_**                            |                                |
| Device Manager                            | Devmgmt.msc                    |
| DNS Manager                               | DNSmgmt.msc                    |
| NAP client configuration                  | NapCLCfg                       |
| Quality of Service Control Man            | ACSsnap.msc                    |
| Telephony Management                      | TAPImgmt.msc                   |
| **_Policy_**                              |                                |
| Local Group Policy Editor                 | GPedit.msc                     |
| Group Policy Management                   | GPmc.msc                       |
| Local Security Settings Manager           | SecPol.msc                     |
| Group Policy Management Editor            | GPme.msc                       |
| Group Policy Starter GPO Editor           | GPTedit.msc                    |
| Resultant Set of Policy                   | RSOP.msc                       |
| Print Management                          | PrintManagement.msc            |
| **_Remote Access_**                       |                                |
| Win Firewall                              | WF.msc                         |
| Teminal Services RDP                      | MSTSC                          |
| Remote Desktop                            | TSmmc.msc                      |
| Terminal Server Manager                   | TSadmin.exe                    |
| Teminal Services RDP to Console           | MSTSC /v:[server] /console     |
| **_Security_**                            |                                |
| Certificate Templates                     | Certtmpl.msc                   |
| AD Users and Computers                    | DSA.msc                        |
| Trusted Platform Module                   | TPM.msc                        |
| Embedded Lockdown Manager                 | EmbeddedLockdown.msc           |
| Local Users and Groups Manager            | LUsrMgr.msc                    |
| Certificates Management Cur user          | Certmgr.msc                    |
| Certificates Management Local mach        | Certlm.msc                     |
| Authorization manager                     | AZman.msc                      |
| Certification Authority Management        | Certsrv.msc                    |
|                                           |                                |
| From <https://ss64.com/nt/syntax-mmc.html |                                |

### Control Panel

!!!Note To create a shortcut:
    1) Right click or press and hold on your desktop, click/tap on New, and click/tap on Shortcut.

    2) Copy the command you want from the table below as the "location", and click/tap on Next.

    3) Type a name you want for this shortcut, and click/tap on Finish.

    4) If you like, you can Pin to Start, Pin to taskbar, add to All apps, add to Quick Launch, assign a keyboard shortcut to, or move this shortcut to where you like for easy use.

(Open Control Panel in last used view)  `%windir%\System32\control.exe`

OR

(Always Open Control Panel in category view) `%windir%\explorer.exe shell:::{26EE0668-A00A-44D7-9371-BEB064C98683}`

OR

(Always Open Control Panel in icons view) - x1`%windir%\explorer.exe shell:::{21EC2020-3AEA-1069-A2DD-08002B30309D}`

| Date and Time (Date and Time) control /name Microsoft.DateAndTime                            |


| Control Panel Item                | Commands                                                                     |
| --------------------------------- | ---------------------------------------------------------------------------- |
| Add a Device wizard               | %windir%\\System32\\DevicePairingWizard.exe                                  |
| Add Hardware wizard               | %windir%\\System32\\hdwwiz.exe                                               |
| Add a Printer wizard              | rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL AddPrinter                   |
| Additional Clocks                 | rundll32.exe shell32.dll,Control_RunDLL timedate.cpl,,1                      |
| Administrative Tools              | control /name Microsoft.AdministrativeTools                                  |
|                                   |                                                                              |
|                                   | **control admintools**                                                       |
| AutoPlay                          | control /name Microsoft.AutoPlay                                             |
| Backup and Restore (Win 7)        | control /name Microsoft.BackupAndRestoreCenter                               |
| BitLocker Drive Encryption        | control /name Microsoft.BitLockerDriveEncryption                             |
| Color and Appearance              | explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}...                   |
|                                   | (cont...) -Microsoft.Personalization\\pageColorization                       |
| Color Management                  | control /name Microsoft.ColorManagement                                      |
| Credential Manager                | control /name Microsoft.CredentialManager                                    |
|                                   | control timedate.cpl                                                         |
|                                   |                                                                              |
|                                   | **control date/time**                                                        |
|                                   |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL timedate.cpl,,0                      |
| Date and Time (Add'l Clocks)      | rundll32.exe shell32.dll,Control_RunDLL timedate.cpl,,1                      |
| Default Programs                  | control /name Microsoft.DefaultPrograms                                      |
| Desktop Background                | explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}                      |
|                                   | (cont...) -Microsoft.Personalization\\pageWallpaper                          |
| Desktop Icon Settings             | rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0                          |
| Device Manager                    | control /name Microsoft.DeviceManager                                        |
|                                   | control hdwwiz.cpl                                                           |
|                                   |                                                                              |
|                                   | devmgmt.msc                                                                  |
| Devices and Printers              | control /name Microsoft.DevicesAndPrinters                                   |
|                                   |                                                                              |
|                                   | control printers                                                             |
| Ease of Access Center             | control /name Microsoft.EaseOfAccessCenter                                   |
|                                   |                                                                              |
|                                   | control access.cpl                                                           |
| File Explorer Opts (General tab)  | control /name Microsoft.FolderOpts                                           |
|                                   |                                                                              |
|                                   | **control folders**                                                          |
|                                   |                                                                              |
|                                   | rundll32.exe shell32.dll,Options_RunDLL 0                                    |
| File Explorer Opts (View tab)     | rundll32.exe shell32.dll,Options_RunDLL 7                                    |
| File Explorer Opts (Search tab    | rundll32.exe shell32.dll,Options_RunDLL 2                                    |
| File History                      | control /name Microsoft.FileHistory                                          |
| Fonts                             | control /name Microsoft.Fonts                                                |
|                                   |                                                                              |
|                                   | **control fonts**                                                            |
| Game Controllers                  | control /name Microsoft.GameControllers                                      |
|                                   |                                                                              |
|                                   | control joy.cpl                                                              |
| Get Programs                      | control /name Microsoft.GetPrograms                                          |
|                                   |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,1                        |
| HomeGroup                         | control /name Microsoft.HomeGroup                                            |
| Indexing Opts                     | control /name Microsoft.IndexingOptions                                      |
|                                   |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL srchadmin.dll                        |
| Infrared                          | control /name Microsoft.Infrared                                             |
|                                   |                                                                              |
|                                   | control irprops.cpl                                                          |
|                                   |                                                                              |
|                                   | control /name Microsoft.InfraredOptions                                      |
| Internet Prop (General tab)       | control /name Microsoft.InternetOptions                                      |
|                                   |                                                                              |
|                                   | control inetcpl.cpl                                                          |
|                                   |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,0                       |
| Internet Prop (Security tab)      | rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,1                       |
| Internet Prop (Privacy tab)       | rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,2                       |
| Internet Prop (Content tab)       | rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,3                       |
| Internet Prop (Connections tab)   | rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,4                       |
| Internet Prop (Programs tab)      | rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,5                       |
| Internet Prop (Advanced tab)      | rundll32.exe shell32.dll,Control_RunDLL inetcpl.cpl,,6                       |
| iSCSI Initiator                   | control /name Microsoft.iSCSIInitiator                                       |
| Keyboard                          | control /name Microsoft.Keyboard                                             |
|                                   |                                                                              |
|                                   | control keyboard                                                             |
| Language                          | control /name Microsoft.Language                                             |
| Mouse Prop                        | control /name Microsoft.Mouse                                                |
| (Buttons tab 0)                   |                                                                              |
|                                   | control main.cpl                                                             |
|                                   |                                                                              |
|                                   | control mouse                                                                |
|                                   |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL main.cpl,,0                          |
| Mouse Prop                        | control main.cpl,,1                                                          |
| (Pointers tab 1)                  |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL main.cpl,,1                          |
| Mouse Prop                        | control main.cpl,,2                                                          |
| (Pointer Opt tab 2)               |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL main.cpl,,2                          |
| Mouse Prop                        | control main.cpl,,3                                                          |
| (Wheel tab 3)                     |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL main.cpl,,3                          |
|                                   |                                                                              |
|                                   | rundll32.exe shell32.dll,Control_RunDLL main.cpl,,4                          |
| Network and Sharing Center        | control /name Microsoft.NetworkAndSharingCenter                              |
| Network Connections               | control ncpa.cpl                                                             |
|                                   |                                                                              |
|                                   | control netconnections                                                       |
| Network Setup Wizard              | control netsetup.cpl                                                         |
| Notification Area Icons           | explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}                      |
| ODBC Data Source Administrator    | control odbccp32.cpl                                                         |
| Offline Files                     | control /name Microsoft.OfflineFiles                                         |
| Perf Opts (Vis Effects)           | %windir%\\system32\\SystemPropertiesPerformance.exe                          |
| Perf Opts (DEP)                   | %windir%\\system32\\SystemPropertiesDataExecutionPrevention.exe              |
| Personalization                   | explorer shell:::{ED834ED6-4B5A-4bfe-8F11-A626DCB6A921}                      |
| Phone and Modem                   | control /name Microsoft.PhoneAndModem                                        |
|                                   |                                                                              |
|                                   | control telephon.cpl                                                         |
| Power Opts                        | control /name Microsoft.PowerOptions                                         |
|                                   |                                                                              |
| _Power Opts_                      | control powercfg.cpl                                                         |
| - Advanced settings               | control powercfg.cpl,,1                                                      |
| - Create a Power Plan             | control /name Microsoft.PowerOptions /page pageCreateNewPlan                 |
| - Edit Plan Settings              | control /name Microsoft.PowerOptions /page pagePlanSettings                  |
| - System Settings                 | control /name Microsoft.PowerOptions /page pageGlobalSettings                |
| Presentation Settings             | %windir%\\system32\\PresentationSettings.exe                                 |
| Programs and Features             | control /name Microsoft.ProgramsAndFeatures                                  |
|                                   |                                                                              |
|                                   | control appwiz.cpl                                                           |
| Recovery                          | control /name Microsoft.Recovery                                             |
| Region (Formats tab)              | control /name Microsoft.RegionAndLanguage                                    |
|                                   |                                                                              |
|                                   | control /name Microsoft.RegionalAndLanguageOptions /page /p:"Formats"        |
|                                   |                                                                              |
|                                   | control intl.cpl                                                             |
|                                   |                                                                              |
|                                   | control international                                                        |
| Region (Location tab)             | control /name Microsoft.RegionalAndLanguageOptions /page /p:"Location"       |
| Region (Administrative tab)       | control /name Microsoft.RegionalAndLanguageOptions /page /p:"Administrative" |
| RemoteApp and Desktop Connections | control /name Microsoft.RemoteAppAndDesktopConnections                       |
| Scanners and Cameras              | control /name Microsoft.ScannersAndCameras                                   |
|                                   |                                                                              |
|                                   | control sticpl.cpl                                                           |
| Screen Saver Settings             | rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1                          |
| Security and Maintenance          | control /name Microsoft.ActionCenter                                         |
|                                   |                                                                              |
|                                   | control wscui.cpl                                                            |
| Set Associations                  | control /name Microsoft.DefaultPrograms /page pageFileAssoc                  |
| Set Default Programs              | control /name Microsoft.DefaultPrograms /page pageDefaultProgram             |
| Set Program Acc and Defaults      | rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,3                        |
| Sound (Playback tab)              | control /name Microsoft.Sound                                                |
|                                   |                                                                              |
|                                   | control mmsys.cpl                                                            |
|                                   |                                                                              |
|                                   | %windir%\\System32\\rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,0     |
| Sound (Recording tab)             | %windir%\\System32\\rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,1     |
| Sound (Sounds tab)                | %windir%\\System32\\rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,2     |
| Sound (Communications tab)        | %windir%\\System32\\rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,3     |
| Speech Recognition                | control /name Microsoft.SpeechRecognition                                    |
| Storage Spaces                    | control /name Microsoft.StorageSpaces                                        |
| Sync Center                       | control /name Microsoft.SyncCenter                                           |
| System                            | control /name Microsoft.System                                               |
|                                   |                                                                              |
|                                   | control sysdm.cpl                                                            |
| System Icons                      | explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9} \\SystemIcons,,0     |
| System Prop (Computer Name)       | %windir%\\System32\\SystemPropertiesComputerName.exe                         |
| System Prop (Hardware)            | %windir%\\System32\\SystemPropertiesHardware.exe                             |
| System Prop (Advanced)            | %windir%\\System32\\SystemPropertiesAdvanced.exe                             |
| System Prop (System Protection)   | %windir%\\System32\\SystemPropertiesProtection.exe                           |
| System Prop (Remote)              | %windir%\\System32\\SystemPropertiesRemote.exe                               |
| Tablet PC Settings                | control /name Microsoft.TabletPCSettings                                     |
| Text to Speech                    | control /name Microsoft.TextToSpeech                                         |
| Troubleshooting                   |                                                                              |
| User Accounts                     | control /name Microsoft.UserAccounts                                         |
|                                   | control userpasswords                                                        |
| User Accounts (netplwiz)          | netplwiz                                                                     |
|                                   | control userpasswords2                                                       |
| Windows Defender Antivirus        | %ProgramFiles%\\Windows Defender\\MSASCui.exe                                |
| Windows Defender Firewall         | control /name Microsoft.WindowsFirewall                                      |
|                                   | control firewall.cpl                                                         |
| Windows Features                  | %windir%\\System32\\OptionalFeatures.exe                                     |
|                                   | rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,2                        |
| Windows Mobility Center           | control /name Microsoft.MobilityCenter                                       |
| Windows To Go                     | %windir%\\System32\\pwcreator.exe                                            |
| Work Folders                      | %windir%\\System32\\WorkFolders.exe                                          |

*[DEP]: Data Execution Prevention

### Turn off the monitors

```powershell
#PS
Add-Type '[DllImport("user32.dll")] public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)
```

```batch
powershell (Add-Type '[DllImport(\"user32.dll\")]^public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)
```

Seems to leave a process running though. It doesn't end on its own. May be worth investigating.

### SFC

```bat
SFC /scannow
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log >%userprofile%\Desktop\sfcdetails.txt && notepad.exe "%userprofile%\Desktop\sfcdetails.txt"
```

### DISM

```bat
Dism /Online /Cleanup-Image /CheckHealth
Dism /Online /Cleanup-Image /ScanHealth
Dism /Online /Cleanup-Image /RestoreHealth
```

### reg

reg is a command line function to edit the registry.  An example from elsewhere in the document.

```batch
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
```

REG Operation [Parameter List]

  Operation =  [ QUERY | ADD | DELETE | COPY | SAVE | LOAD | UNLOAD | RESTORE | COMPARE | EXPORT | IMPORT  | FLAGS ]

Return Code: (Except for REG COMPARE)   0 - Successful, 1 - Failed

For help on a specific operation type:  `REG Operation /?`. Examples:

  REG QUERY /?
  REG ADD /?
  REG DELETE /?
  REG COPY /?
  REG SAVE /?
  REG RESTORE /?
  REG LOAD /?
  REG UNLOAD /?
  REG COMPARE /?
  REG EXPORT /?
  REG IMPORT /?
  REG FLAGS /?

C:\Windows\system32>reg add /?

- REG ADD KeyName [/v ValueName | /ve] [/t Type] [/s Separator] [/d Data] [/f] [/reg:32 | /reg:64]
  - KeyName  [\\Machine\]FullKey
    - Machine  Name of remote machine - omitting defaults to the current machine. Only HKLM and HKU are available on remote machines.
    - FullKey  ROOTKEY\SubKey
    - ROOTKEY  [ HKLM | HKCU | HKCR | HKU | HKCC ]
      - SubKey   The full name of a registry key under the selected ROOTKEY.

- /v       The value name, under the selected Key, to add.
- /ve      adds an empty value name (Default) for the key.
- /t       RegKey data types
  -   [ REG_SZ | REG_MULTI_SZ | REG_EXPAND_SZ | REG_DWORD | REG_QWORD | REG_BINARY | REG_NONE ] If omitted, REG_SZ is assumed.
- /s       Specify one character that you use as the separator in your data string for REG_MULTI_SZ. If omitted, use "\0" as the separator.
- /d       The data to assign to the registry ValueName being added.
- /f       Force overwriting the existing registry entry without prompt.
- /reg:32  Specifies the key should be accessed using the 32-bit registry view.
- /reg:64  Specifies the key should be accessed using the 64-bit registry view.

Examples:

- `REG ADD \\ABC\HKLM\Software\MyCo` - Adds a key HKLM\Software\MyCo on remote machine ABC
- `REG ADD HKLM\Software\MyCo /v Data /t REG_BINARY /d fe340ead` - Adds a value (name: Data, type: REG_BINARY, data: fe340ead)
- `REG ADD HKLM\Software\MyCo /v MRU /t REG_MULTI_SZ /d fax\0mail` - Adds a value (name: MRU, type: REG_MULTI_SZ, data: fax\0mail\0\0)
- `REG ADD HKLM\Software\MyCo /v Path /t REG_EXPAND_SZ /d ^%systemroot^%` - Adds a value (name: Path, type: REG_EXPAND_SZ, data: %systemroot%)   Notice:  Use the caret symbol ( ^ ) inside the expand string


#### Query


```batch
reg Query /?

REG QUERY KeyName [/v [ValueName] | /ve] [/s]
          [/f Data [/k] [/d] [/c] [/e]] [/t Type] [/z] [/se Separator]
          [/reg:32 | /reg:64]

  KeyName  [\\Machine\]FullKey
           Machine - Name of remote machine, omitting defaults to the
                     current machine. Only HKLM and HKU are available on
                     remote machines
           FullKey - in the form of ROOTKEY\SubKey name
                ROOTKEY - [ HKLM | HKCU | HKCR | HKU | HKCC ]
                SubKey  - The full name of a registry key under the
                          selected ROOTKEY

  /v       Queries for a specific registry key values.
           If omitted, all values for the key are queried.

           Argument to this switch can be optional only when specified
           along with /f switch. This specifies to search in valuenames only.

  /ve      Queries for the default value or empty value name (Default).

  /s       Queries all subkeys and values recursively (like dir /s).

  /se      Specifies the separator (length of 1 character only) in
           data string for REG_MULTI_SZ. Defaults to "\0" as the separator.

  /f       Specifies the data or pattern to search for.
           Use double quotes if a string contains spaces. Default is "*".

  /k       Specifies to search in key names only.

  /d       Specifies the search in data only.

  /c       Specifies that the search is case sensitive.
           The default search is case insensitive.

  /e       Specifies to return only exact matches.
           By default all the matches are returned.

  /t       Specifies registry value data type.
           Valid types are:
             REG_SZ, REG_MULTI_SZ, REG_EXPAND_SZ,
             REG_DWORD, REG_QWORD, REG_BINARY, REG_NONE
           Defaults to all types.

  /z       Verbose: Shows the numeric equivalent for the type of the valuename.

  /reg:32  Specifies the key should be accessed using the 32-bit registry view.

  /reg:64  Specifies the key should be accessed using the 64-bit registry view.

Examples:

  REG QUERY HKLM\Software\Microsoft\ResKit /v Version
    Displays the value of the registry value Version

  REG QUERY \\ABC\HKLM\Software\Microsoft\ResKit\Nt\Setup /s
    Displays all subkeys and values under the registry key Setup
    on remote machine ABC

  REG QUERY HKLM\Software\Microsoft\ResKit\Nt\Setup /se #
    Displays all the subkeys and values with "#" as the seperator
    for all valuenames whose type is REG_MULTI_SZ.

  REG QUERY HKLM /f SYSTEM /t REG_SZ /c /e
    Displays Key, Value and Data with case sensitive and exact
    occurrences of "SYSTEM" under HKLM root for the data type REG_SZ

  REG QUERY HKCU /f 0F /d /t REG_BINARY
    Displays Key, Value and Data for the occurrences of "0F" in data
    under HKCU root for the data type REG_BINARY

  REG QUERY HKLM\SOFTWARE /ve
    Displays Value and Data for the empty value (Default)
    under HKLM\SOFTWARE
```

### Powercfg

Edit the power configuration settings

- `powercfg /list` - list the power profiles
- `powercfg /query` -display the current power settings.
- `powercfg /export C:\somefile.POW {GUID of profile}`
- `powercfg /change [option]`
monitor-timeout-ac
monitor-timeout-dc
disk-timeout-ac
disk-timeout-dc
standby-timeout-ac
standby-timeout-dc
hibernate-timeout-ac
hibernate-timeout-dc

### SleepStudy

`powercfg sleepstudy`

passing this will output an HTML file into the file you are in.

### Logman

`logman` looks at the currently running loggers from performance manager.


### netsh

View the Windows Network Config Script:
 
This shows all the settings

```batch
netsh
>dump
```
## net

NET
    [ ACCOUNTS | COMPUTER | CONFIG | CONTINUE | FILE | GROUP | HELP |
      HELPMSG | LOCALGROUP | PAUSE | SESSION | SHARE | START |
      STATISTICS | STOP | TIME | USE | USER | VIEW ]
      
### Attrib

Sets and changes file attributes.

[Docs](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/attrib)

- R - **ReadOnly**
- A - **Archive file attribute.**
- S - System file attribute.
- H - Hidden file attribute.
- O - *Offline attribute.*
- I - **Not content indexed file attribute.**
- X - *No scrub file attribute.*
- V - *Integrity attribute.*
- P - *Pinned attribute.*
- U - *Unpinned attribute.*
- B - *SMR Blob attribute.*



A few useful aspects:

Navigate to a root dir, and run `ATTRIB /S /D -A` -  this clears the archive attribute.  Any file that changes from that point on will have it set.  Then you can run backup only files with `+A` attribute.

I am interesting in checking out if the `-I` flag might help my computer or laptop from wasting time.

Read Only and Hidden are visible in Properties.  Archive and Index are under advanced.  I am not sure what the remaining attributes do or where to find them.  Interestingly, the italicized items dont even appear in documentation.

### BCDEdit

#### Safemode

Re-allow the **F8** menu upon startup. May not work with Windows 10.

```batch
bcdedit /set {bootmgr} displaybootmenu yes
echo to turn off
bcdedit /set {bootmgr} displaybootmenu no
```

### BCDBoot

To repair a non booting computer- 

```batch
Diskpart
List disk  
REM   (Note which disk is your Boot drive number mine is 0)
Sel disk 0 (SYSTEM DISK)
List vol               (Note which volume is the EFI partition mine is 4)
Sel vol 4 (Will be FAT32)
assign letter=V:
Exit
Format V: /FS:Fat32
REM Or I did 
mkdir EFIOLD
mv EFI EFIOLD
bcdboot C:\windows /s V: /f UEFI 


### WMIC Windows Management Instrumentation Console

`wmic diskdrive list brief`

### Takeown

`takeown /r /f c:\windows\csc`

### Diskpart

To make it stop trying to connect to a dead drive

```batch
diskpart
    automount disable
    automount scrub
```

To make a drive read only

```batch
diskpart
    list disks
    sel dis #
    attributes disk set readonly
    exit

    list vol
    sel vol #
    attributes vol set readonly
    exit
```

To clean a disk with a recovery volume on it

```batch
diskpart
    list disks
    sel dis #
    clean
    exit
```

To delete a protected volume- like the windows recovery drive

```batch
diskpart
    list part
    sel part #
    delete partition override
    exit
```


## Changing Computer State

### Locking a Computer-  Calling User32.dll functions

The only way to lock a computer directly with the standard available tools is to call the `LockWorkstation()` function in `user32.dll`:

        rundll32.exe user32.dll,LockWorkStation


This command immediately locks the workstation. It uses `rundll32.exe`, which runs Windows DLLs (and saves their libraries for repeated use) to run `user32.dll`, a library of Windows management functions.

When you lock a workstation while Fast User Switching is enabled, such as on Windows XP, the computer displays the user logon screen rather than starting the current user's screensaver.

To shut down particular sessions on a Terminal Server, use the `tsshutdn.exe` command-line tool.

### Logging Off the Current Session

You can use several different techniques to log off of a session on the local system. The simplest way is to use the **Remote Desktop/Terminal Services** command-line tool, `logoff.exe` (For details, at the Windows PowerShell prompt, type logoff /?). To log off the current active session, type logoff with no arguments.

You can also use the shutdown.exe tool with its logoff option:

        shutdown.exe -l
        shutdown /t=0

A third option is to use WMI. The **Win32_OperatingSystem** class has a **Win32Shutdown method**. Invoking the method with the **0** flag initiates logoff:

		(Get-WmiObject -Class Win32_OperatingSystem -ComputerName .).Win32Shutdown(0)

For more information, and to find other features of the Win32Shutdown method, see "Win32Shutdown Method of the Win32_OperatingSystem Class" in MSDN.

### Shutting Down or Restarting a Computer

Shutting down and restarting computers are generally the same types of task. Tools that shut down a computer will generally restart it as well—and vice versa. There are two straightforward options for restarting a computer from Windows PowerShell. Use either `Tsshutdn.exe` or `Shutdown.exe` with appropriate arguments. You can get detailed usage information from `tsshutdn.exe /?` or `shutdown.exe /?`.


#### shutdown.exe

!!!note note: It also gives information on the counts and reasons

        Usage: shutdown.exe [/i | /l | /s | /sg | /r | /g | /a | /p | /h | /e | /o] [/hybrid] [/soft] [/fw] [/f]
            [/m \\computer][/t xxx][/d [p|u:]xx:yy [/c "comment"]]

            No args    Display help. This is the same as typing /?.
            /?         Display help. This is the same as not typing any options.
            /i         Display the graphical user interface (GUI).
                    This must be the first option.
            /l         Log off. This cannot be used with /m or /d options.
            /s         Shutdown the computer.
            /sg        Shutdown the computer. On the next boot,
                    restart any registered applications.
            /r         Full shutdown and restart the computer.
            /g         Full shutdown and restart the computer. After the system is
                    rebooted, restart any registered applications.
            /a         Abort a system shutdown.
                    This can only be used during the time-out period.
                    Combine with /fw to clear any pending boots to firmware.
            /p         Turn off the local computer with no time-out or warning.
                    Can be used with /d and /f options.
            /h         Hibernate the local computer.
                    Can be used with the /f option.
            /hybrid    Performs a shutdown of the computer and prepares it for fast startup.
                    Must be used with /s option.
            /fw        Combine with a shutdown option to cause the next boot to go to the
                    firmware user interface.
            /e         Document the reason for an unexpected shutdown of a computer.
            /o         Go to the advanced boot options menu and restart the computer.
                    Must be used with /r option.
            /m \\computer Specify the target computer.
            /t xxx     Set the time-out period before shutdown to xxx seconds.
                    The valid range is 0-315360000 (10 years), with a default of 30.
                    If the timeout period is greater than 0, the /f parameter is
                    implied.
            /c "comment" Comment on the reason for the restart or shutdown.
                    Maximum of 512 characters allowed.
            /f         Force running applications to close without forewarning users.
                    The /f parameter is implied when a value greater than 0 is
                    specified for the /t parameter.
            /d [p|u:]xx:yy  Provide the reason for the restart or shutdown.
                    p indicates that the restart or shutdown is planned.
                    u indicates that the reason is user defined.
                    If neither p nor u is specified the restart or shutdown is
                    unplanned.
                    xx is the major reason number (positive integer less than 256).
                    yy is the minor reason number (positive integer less than 65536).

        Reasons on this computer:
        (E = Expected U = Unexpected P = planned, C = customer defined)
        Type	Major	Minor	Title

        U  	    0	0	Other (Unplanned)
        E   	0	0	Other (Unplanned)
        E P 	0	0	Other (Planned)
        U  	    0	5	Other Failure: System Unresponsive
        E   	1	1	Hardware: Maintenance (Unplanned)
        E P 	1	1	Hardware: Maintenance (Planned)
        E   	1	2	Hardware: Installation (Unplanned)
        E P 	1	2	Hardware: Installation (Planned)
        E   	2	2	Operating System: Recovery (Unplanned)
        E P 	2	2	Operating System: Recovery (Planned)
        P 	    2	3	Operating System: Upgrade (Planned)
        E   	2	4	Operating System: Reconfiguration (Unplanned)
        E P 	2	4	Operating System: Reconfiguration (Planned)
          P	    2	16	Operating System: Service pack (Planned)
                2	17	Operating System: Hot fix (Unplanned)
          P     2	17	Operating System: Hot fix (Planned)
                2	18	Operating System: Security fix (Unplanned)
          P     2	18	Operating System: Security fix (Planned)
        E   	4	1	Application: Maintenance (Unplanned)
        E P 	4	1	Application: Maintenance (Planned)
        E P 	4	2	Application: Installation (Planned)
        E   	4	5	Application: Unresponsive
        E   	4	6	Application: Unstable
        U  	    5	15	System Failure: Stop error
        U  	    5	19	Security issue (Unplanned)
        E   	5	19	Security issue (Unplanned)
        E P 	5	19	Security issue (Planned)
        E   	5	20	Loss of network connectivity (Unplanned)
        U  	    6	11	Power Failure: Cord Unplugged
        U  	    6	12	Power Failure: Environment
          P	    7	0	Legacy API shutdown

!!!warning `tsshutdn.exe` is not found on W10 pro.

You can also perform shutdown and restart operations directly from Windows PowerShell as well.

To shut down the computer, use the `Stop-Computer` command

To restart the operating system, use the `Restart-Computer` command

To force an immediate restart, use the -Force parameter. `Restart-Computer -Force`


### Services (sc)

See the [Streamline Windows Batch File](#Batch-File) for more examples?

```bat
sc start vmms
sc queryex eventlog vmms
```

### VSSADMIN

Take a look and see where your computer is storing ShadowCopy Backups

`vssadmin list providers` list the things making shadowcopies.  Just Windows usually.

`vssadmin list volumes` -list the drives where shadow copies are kept

`vssadmin list shadows` - more interesting, lists the specific backups. Like this:

        Contents of shadow copy set ID: {91131afe-b83c-44cd-b243-142b8ed9d4b7}
        Contained 1 shadow copies at creation time: 3/24/2019 5:02:29 AM
            Shadow Copy ID: {db24bd58-fcb5-4fe4-877f-af5c43cadc5f}
                Original Volume: (X:)\\?\Volume{8e24b15f-7991-4509-bdcd-46e88aafab92}\
                Shadow Copy Volume: \\?\GLOBALROOT\Device\HarddiskVolumeShadowCopy36
                Originating Machine: DESKTOP
                Service Machine: DESKTOP
                Provider: 'Microsoft Software Shadow Copy provider 1.0'
                Type: DataVolumeRollback
                Attributes: Persistent, No auto release, No writers, Differential

`vssadmin list shadowstorage` -shows by drive how much space is taken up and how much is left.
        Shadow Copy Storage association
        For volume: (P:)\\?\Volume{11696a83-1b1a-44da-b6af-a7dca2d81c33}\
        Shadow Copy Storage volume: (P:)\\?\Volume{11696a83-1b1a-44da-b6af-a7dca2d81c33}\
        Used Shadow Copy Storage space: 32.1 MB (0%)
        Allocated Shadow Copy Storage space: 5.12 GB (1%)
        Maximum Shadow Copy Storage space: 102 GB (26%)

`vssadmin list writers` - not that interesting lists services that use VSS. **Will tell you if there is an error from each service**

`vssadmin Resize ShadowStorage` -

`vssadmin Delete Shadows /For=C:`


### schtasks

Description: Enables an administrator to create, delete, query, change, run and end scheduled tasks on a local or remote system.

SCHTASKS /parameter [arguments]

Parameter List:
- /Create         Creates a new scheduled task.
- /Delete         Deletes the scheduled task(s).
- /Query          Displays all scheduled tasks.
- /Change         Changes the properties of scheduled task.
- /Run            Runs the scheduled task on demand.
- /End            Stops the currently running scheduled task.
- /ShowSid        Shows the security identifier corresponding to a scheduled task name.
- /?              Displays this help message.

Examples:
- SCHTASKS
- SCHTASKS /?
- SCHTASKS /Run /?
- SCHTASKS /End /?
- SCHTASKS /Create /?
- SCHTASKS /Delete /?
- SCHTASKS /Query  /?
- SCHTASKS /Change /?
- SCHTASKS /ShowSid /?

Just typing `schtasks` will list all the scheduled and disabled tasks.

See the [Streamline Windows Batch File](#Batch-File) for more examples?

### Install Windows Feature (WSL)

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### Winrar

Program is contained in "C:\Program Files\WinRar\WinRAR.exe" usually

```batch
"C:\Program Files\WinRar\WinRAR.exe"
#To Add
cd d:\SaveDirectory
"C:\Program Files\WinRar\WinRAR.exe" a fileName.rar "D:\ASUSsync\VS Code\md\*

#Append date to filename with -ag
mkdir d:\asussync\backups\
"C:\Program Files\WinRar\WinRAR.exe" a -ag+YYMMDD "D:\ASUSsync\Backups\vsCodeBackUp.rar" "D:\ASUSsync\VS Code\md\*"  "D:\ASUSsync\ASUSVS-WorkSpace.code-workspace" "D:\ASUSsync\VS Code\.vscode\*"

#Using a file list and using version numbers and month string
"C:\Program Files\WinRar\WinRAR.exe" a -ag+YYMMM{v}nn-- -@+ "D:\ASUSsync\Backups\vsCodeBackUp.rar" @"D:\Asussync\backups\backups.txt"
```

#### Backup

!!!Warning Warning: This is a pop-up mess...Diasble Javascript before you go [Source](http://rareelement.tripod.com/winrar_sk.htm)

##### Full Backup
Intro: This is a backup of ALL the existing files in source folder.
Comment: This backup may be done once a while to get a complete snapshot of all the file at that moment.
Restoration: To restore a file, files can be directly retrieved from this archive (if no newer backup exists)

Command line:
`winrar.exe a -se -rr3% -ac -ag+YYYYMMDD_full_ -k -m5 -ms -os -r -ep1 e:\mydoc.rar @mydocpath.txt`

| command/switch | Purpose Used                                                     |
| -------------- | ---------------------------------------------------------------- |
| a              | add files to archive                                             |
| -se            | solid archive based on file extensions[1]                        |
| -ac            | clear archive attribute after archival                           |
| -ag+YYYYMMDD_  | add current date in archive name                                 |
| -k             | protect archive from tamper or accidental modification           |
| -m5            | use best compression (also slowest)                              |
| -ms            | Do not waste time in re-compressing compressed files [2]         |
| -os            | keep NTFS streams (recommended if your files are stored on NTFS) |
| -r             | recurs subfolders                                                |
| -ep1           | strip base folder name                                           |
| -rr3%          | recovery record is 3%                                            |

Additional

- md128

- mct -text compression

winrar.exe a -se -rr3% -ac -ag+YYYYMMDD_full_ -k -m5 -ms -os -r -ep1 -mc30:128t+ -md128 e:\ASUSsyncBU.rar @.\BackupPaths.txt

[1]- not recommended due to data loss risk on low quality media

[2]- such as ace, arj, bz2, cab, gz, jpeg, jpg, lha, lzh, mp3, rar, zip, taz, tgz, z

[3]- (alter as per the reliability of your media)

#####  Incremental Backup

Intro: Takes backup of the files modified since the last backup.

Comment: Takes very less time as only a small number of files are usually changed daily. These are the files backup up by this method.

Restoration: To restore a file, you need to first retrieve the last FULL backup, then ALL the incremental backups up to the date required in chronologically dated order, starting from the oldest to the latest.


Command Line: `winrar.exe a -se -rr3% -ac -ag+YYYYMMDD_incr_ -k -m4 -ms -os -r -ep1 -ac -ao e:\mydoc.rar @mydocpath.txt`

Command/switches used with purpose:

| command/switch           | Purpose Used                                   |
| ------------------------ | ---------------------------------------------- |
| All from the FULL backup | As tabulate above                              |
| -ao                      | add only the files with archive bit on         |
| -m4                      | Replaced -m5 with -m4 for faster daily backups |
| REMOVE -m5               | Replaced -m5 with -m4 for faster daily backups |

##### Differential Backup

Intro: Takes backup of all files since the last FULL backup.

Comment: Takes more time to backup with time. This is because this backup backups up all files modified since the last FULL backup.

Restoration: To restore a file, retrieve the last FULL backup, and then the latest differential backup file.


Command Line: `winrar.exe a -se -rr3% -ag+YYYYMMDD_diff_ -k -m4 -ms -os -r -ep1 -ao e:\mydoc.rar @mydocpath.txt`

Command/switches used with purpose:

| command/switch           | Purpose Used                                           |
| ------------------------ | ------------------------------------------------------ |
| All from the FULL backup | As tabulate above                                      |
| -ao                      | add only the files with archive bit on                 |
| REMOVE -ac               | to prevent the archive bit from changing due to backup |
| -m4                      | Replaced -m5 with -m4 for faster daily backups         |
| REMOVE -m5               | Replaced -m5 with -m4 for faster daily backups         |


### 7zip


 7z.exe a -t7z backup.7z -mx5 -m0=lzma2 -ms=200f -mmt=8
    "%inkscapePath%" --without-gui --file="%%cd%%\%%i" --export-png="%%cd%%\tmp\%%j\%%~ni-%%j.png" --export-dpi=%%j
    set /a innercount=innercount+1
7z a  \%fileName%.7z ".\*\*.png" -r -y -aoa -bse1 -bso0 -w".\tmp\" -m0=LZMAs=100f10m

- bsxy
comes in pairs x= (p - info, e- error, ? i forgot 3 debug maybe?) and y is 0 nowhere, 1 stdout 2 stderr the screen.

`-bse1 > Errorlog.txt` pipes out the error messages.
::-bse1 bs is redirect output and e is error and 1 is sted out
::-bso0 redirects standard output messages to 0 (off)

::setting methods is complicated af

methods
:: this is supposed to be the method  -m0=LZMA2s=100f10m
s=100f10m = solid format 100files or 10 Mb
- mx(1-9) sets default strength from store to ultra eg -mx1

Another example `7z.exe a -t7z backup.7z -mx1 -m0=lzma2:d=1024m:fb=273 -ms=16g -mmt=24`
- mmt=# is number of cpu threads
- ms=16g is solid, break into 16gb, can use b,k,m,g and f for files.
fb is fast bytes (IDK)
d: is directory size.T
There is a ton more.

 - aoa - append and overwrite

 - y dont ask

 - r subfolders.

 - w".\tmp\" workign directory?

 format is always 7z. then command.  a for add.  then archive.  The rest can be allegely any order.  Its confusing as hell

### Inkscape
[Inkscape Command Line](https://inkscape.org/doc/inkscape-man.html)

%inkscapePath%" --without-gui --file=".\%%i" --export-png=".\tmp\%%j\%DirN%\%%~ni-%%j.png" --export-dpi=%%j

See the batch script in scripts

### ImageMagick

[Image Magic Formats](https://imagemagick.org/script/formats.php)

[Image Magic CLI Doc](https://www.imagemagick.org/script/command-line-processing.php)

[Magick Examples](https://www.imagemagick.org/Usage/)

[Magick Doc Thumbnails](https://www.imagemagick.org/Usage/thumbnails/#html)

Make sure its added to PATH

then its run with `magick.exe`

The ImageMagick command-line consists of

one or more required input filenames.
zero, one, or more image settings.
zero, one, or more image operators.
zero, one, or more image sequence operators.
zero, one, or more image stacks.
zero or one output image filenames (required by convert, composite, montage, compare, import, conjure).

`magick logo: gif:- | display gif:-`
magick.exe montage  -label '%f' -size 128x128 '.\*.svg[128x128]' -auto-orient -caption "scraping-166"-geometry '100x100x10x10'-tile 8x "index.png"
magick.exe montage  -label '%f' -size 128x128 '.\*.svg[128x128]' -auto-orient -title  "Contents of %d "-geometry '100x100x10x10'-tile 8x "index.png"

magick -list tool | clip:

animate
compare
composite
conjure
convert
display
identify
import
mogrify
montage
stream


  montage -label '%t\n%[width]x%[height]' \
          - size 512x512 '../img_photos/*_orig.*[120x90]' -auto-orient \
          - geometry +5+5 -tile 5x  -frame 5  -shadow  photo_index.html


  montage -label '%t'  -size 128x128  -auto-orient -geometry +5+5 -tile 10x  -title "Font-Awesome Directory" -frame 5  -shadow './*.svg[128x128]'  photo_index-%d.html

  montage -label '%t'  -size 128x128 './100/*.svg[128x128]' -auto-orient -geometry +5+5 -tile 5x  -frame 5  -shadow -monitor photo_index-%d.html

    Title settings
        montage -pointsize 24  -background Lavender \
                - font Candice      -label Candice      label:Abc-123 \
                - font Corsiva      -label Corsiva      label:Abc-123 \
                - font SheerBeauty  -label SheerBeauty  label:Abc-123 \
                - font Ravie        -label Ravie        label:Abc-123 \
                - font Arial        -label Arial        label:Abc-123 \
                - font ArialI       -label ArialI       label:Abc-123 \
                - font ArialB       -label ArialB       label:Abc-123 \
                - font ArialBk      -label ArialBk      label:Abc-123 \
                - font CourierNew   -label CourierNew   label:Abc-123 \
                - font LokiCola     -label LokiCola     label:Abc-123 \
                - font Gecko        -label Gecko        label:Abc-123 \
                - font Wedgie       -label Wedgie       label:Abc-123 \
                - font WebDings     -label WebDings     label:Abc-123 \
                - font WingDings    -label WingDings    label:Abc-123 \
                - font WingDings2   -label WingDings2   label:Abc-123 \
                - font Zymbols      -label Zymbols      label:Abc-123 \
                \
                - frame 5  -geometry +2+2   -font Arial -pointsize 12 \
                - background none  -bordercolor SkyBlue  -mattecolor DodgerBlue \
                montage_fonts.gif
```
 convert image.png  -background white \
          \( -clone 0 -resize 16x16 -extent 16x16 \) \
          \( -clone 0 -resize 32x32 -extent 32x32 \) \
          \( -clone 0 -resize 48x48 -extent 48x48 \) \
          \( -clone 0 -resize 64x64 -extent 64x64 \) \
          - delete 0 -alpha off -colors 256 favicon.ico
```
Single Letter Attribute Percent Escapes
Here are common single letter escapes (short form) is used to report the most common attributes and properties of an image, such as: the image filename filename, type, width, height.
- \n - newline
- \r - carriage return
- < - less-than character.
- > - greater-than character.
- & - ampersand character.
- %% - a percent sign
- %b - file size of image read in (use -precision 16 to force results in B)
- %c - comment meta-data property
- %d - directory component of path
- %e - filename extension or suffix
- %f - filename (including suffix)
- %g - **layer canvas page geometry (equivalent to "%Wx%H%X%Y")**
- %h - current image height in pixels
- %i - image filename (note: becomes output filename for "info:")
- %k - CALCULATED: number of unique colors
- %l - label meta-data property
- %m - image file format (file magic)
- %n - number of images in current image sequence
- %o - output filename (used for delegates)
- %p - index of image in current image list
- %q - quantum depth (compile-time constant)
- %r - image class and colorspace
- %s - scene number (from input unless re-assigned)
- %t - **filename without directory or extension (suffix)**
- %u - unique temporary filename (used for delegates)
- %w - current width in pixels
- %x - x resolution (density)
- %y - y resolution (density)
- %z - image depth (as read in unless modified, image save depth)
- %A - image transparency channel enabled (true/false)
- %B - file size of image read in bytes
- %C - image compression type
- %D - image GIF dispose method
- %G - original image size (%wx%h; before any resizes)
- %H - page (canvas) height
- %M - Magick filename (original file exactly as given, including read mods)
- %O - page (canvas) offset ( = %X%Y )
- %P - page (canvas) size ( = %Wx%H )
- %Q - image compression quality ( 0 = default )
- %S - ?? scenes ??
- %T - image time delay (in centi-seconds)
- %U - image resolution units
- %W - page (canvas) width
- %X - page (canvas) x offset (including sign)
- %Y - page (canvas) y offset (including sign)
- %Z - unique filename (used for delegates)
- %@ - CALCULATED: trim bounding box (without actually trimming)
- %# - CALCULATED: 'signature' hash of image values

!!!Note Note This information was gathered using: `magick montage -list | clip`  A neat trick if I dont say so myself.
This lists all the parameters that can be set.  the `list` command is supposed to bring up more information on the command.  `magic montage -list compress`

Version: ImageMagick 7.0.8-32 Q16 x64 2019-03-05 http://www.imagemagick.org
Copyright: Copyright (C) 1999-2018 ImageMagick Studio LLC
License: http://www.imagemagick.org/script/license.php
Visual C++: 180040629
Features: Cipher DPC HDRI Modules OpenMP
Delegates (built-in): bzlib cairo flif freetype gslib heic jng jp2 jpeg lcms lqr lzma openexr pangocairo png ps raw rsvg tiff webp xml zlib
Usage: montage [options ...] file [ [options ...] file ...] file

- Image Settings:
  - adjoin              join images into a single multi-image file
  - affine matrix       affine transform matrix
  - alpha option        on, activate, off, deactivate, set, opaque, copy
                       transparent, extract, background, or shape
  - authenticate password
                       decipher image with this password
  - blue-primary point  chromaticity blue primary point
  - bordercolor *color*   border color
  -**caption** *string*      assign a caption to an image
  - colors value        preferred number of colors in the image
  - colorspace type     alternate image colorsapce
  - comment string      annotate image with comment
  - compose operator    composite operator
  - compress type       type of pixel compression when writing the image
  - define format:option
                       define one or more image format options
  - density geometry    horizontal and vertical density of the image
  - depth value         image depth
  - display server      query font from this X server
  - dispose method      layer disposal method
  - dither method       apply error diffusion to image
  - draw string         annotate the image with a graphic primitive
  - encoding type       text encoding type
  - endian type         endianness (MSB or LSB) of the image
  - extract geometry    extract area from image
  - fill color          color to use when filling a graphic primitive
  - filter type         use this filter when resizing an image
  - font name           render text with this font
  - format "string"     output formatted image characteristics
  - gamma value         level of gamma correction
  - geometry geometry   preferred tile and border sizes
  - gravity direction   which direction to gravitate towards
  - green-primary point chromaticity green primary point
  - identify            identify the format and characteristics of the image
  - interlace *type*      type of image interlacing scheme
  - interpolate method  pixel color interpolation method
  - kerning value       set the space between two letters
  -**label** *string*        assign a label to an image
  - limit type value    pixel cache resource limit
  - matte               store matte channel if the image has one
  - mattecolor color    frame color
  - mode type           framing style
  - monitor             monitor progress
  - page geometry       size and location of an image canvas (setting)
  - pointsize value     font point size
  - profile filename    add, delete, or apply an image profile
  - quality value       JPEG/MIFF/PNG compression level
  - quantize colorspace reduce colors in this colorspace
  - quiet               suppress all warning messages
  - red-primary point   chromaticity red primary point
  - regard-warnings     pay attention to warning messages
  - respect-parentheses settings remain in effect until parenthesis boundary
  - sampling-factor geometry
                       horizontal and vertical sampling factor
  - scenes range        image scene range
  - seed value          seed a new sequence of pseudo-random numbers
  - set attribute value set an image attribute
  - shadow              add a shadow beneath a tile to simulate depth
  - size geometry       width and height of image
  - stroke color        color to use when stroking a graphic primitive
  - support factor      resize support: > 1.0 is blurry, < 1.0 is sharp
  - synchronize         synchronize image to storage device
  - taint               declare the image as modified
  - texture filename    name of texture to tile onto the image background
  - thumbnail geometry  create a thumbnail of the image
  - tile geometry       number of tiles per row and column
  - title string        decorate the montage image with a title
  - transparent-color color
                       transparent color
  - treedepth value     color tree depth
  - trim                trim image edges
  - units type          the units of image resolution
  - verbose             print detailed information about the image
  - virtual-pixel method
                       virtual pixel access method
  - white-point point   chromaticity white point

Image Operators:
  - adaptive-sharpen geometry
                       adaptively sharpen pixels; increase effect near edges
  - annotate geometry text
                       annotate the image with text
  - auto-orient         automagically orient image
  - blur geometry      reduce image noise and reduce detail levels
  - border geometry     surround image with a border of color
  - channel mask        set the image channel mask
  - crop geometry       preferred size and location of the cropped image
  - extent geometry     set the image size
  - flatten             flatten a sequence of images
  - flip                flip image in the vertical direction
  - flop                flop image in the horizontal direction
  - frame geometry      surround image with an ornamental border
  - monochrome          transform image to black and white
  - polaroid angle      simulate a Polaroid picture
  - repage geometry     size and location of an image canvas (operator)
  - resize geometry     resize the image
  - rotate degrees      apply Paeth rotation to the image
  - scale geometry      scale the image
  - strip               strip image of all profiles and comments
  - transform           affine transform image
  - transpose           flip image vertically and rotate 90 degrees
  - transparent color   make this color transparent within the image
  - type type           image type
  - unsharp geometry    sharpen the image

Image Sequence Operators:
  - coalesce            merge a sequence of images
  - composite           composite image

Image Stack Operators:
  - clone indexes       clone an image
  - delete indexes      delete the image from the image sequence
  - duplicate count,indexes
                       duplicate an image one or more times
  - insert index        insert last image into the image sequence
  - reverse             reverse image sequence
  - swap indexes        swap two images in the image sequence

Miscellaneous Options:
  - debug events        display copious debugging information
  - help                print program options
  - list type           print a list of supported option arguments
  - log format          format of debugging information
  - version             print version information

In addition to those listed above, you can specify these standard X
resources as command line options:  -background, -bordercolor,
- mattecolor, -borderwidth, -font, or -title

By default, the image format of 'file' is determined by its magic
number.  To specify a particular image format, precede the filename
with an image format name and a colon (i.e. ps:image) or specify the
image type as the filename suffix (i.e. image.ps).  Specify 'file' as
'-' for standard input or output.

`magick montage *.svg "File-directory.png` works
`magick montage *.svg -label %t "File-directory.png` does not work
`magick montage -label %t -tile 5x *.svg  "File-directory.png` does  work
`magick montage -label %t -tile 10x20 *.png -resize 128x128  ..\FlatIcons(png)-index.html` does  work - out puts out1.png, out2.png
out.gif also works, about half the size. out.html produces html and a mapped png.




!!!code Convert an icon

        convert *.png -define icon:auto-resize=256,128,64,48,32,16 %t.ico
        magick convert *.png -define icon:auto-resize=256,128,64,48,32,16 "%t.ico"

       magick convert [name].svg -render -define icon:auto-resize [name].ico


!!!warning [From](https://imagemagick.org/script/command-line-options.php)
        Some 'properties' must be defined in a specific way to be used. For example only 'properties' prefixed with "filename:" can be used to modify the output filename of an image. For example

        convert rose: -set filename:mysize '%wx%h' 'rose_%[filename:mysize].png'

  so then this works:

`magick convert xxx.svg -render -define icon:auto-resize -set filename:name %t '%[filename:name].ico'` only it leaves quotes

magick convert archway.svg -resize 512x512 -transparent #FFFFFF  -define icon:auto-resize   -set filename:name %t   %[filename:name].ico

still with problems but the closest Ive gotten

the background is infact listed as white- using `magick identify -verbose archway.svg`

using `magick mogrify archway.svg -background #00000000` destroyed the image.

`magick convert arrow.svg -background #00000000 -define rsvg %[basename]2.svg` - bad


`convert -density 384 -background transparent -fill "#607D8B" -colorize 100 favicon.svg -define icon:auto-resize -colors 256 favicon.ico` [source](https://gist.github.com/azam/3b6995a29b9f079282f3)

`magick convert  -density 384 -background transparent -fill "#607D8B" -colorize 100 arrow.svg  -define icon:auto-resize -colors 256 %[basename]2.ico` name not working

!!!success THIS WORKS! Where fill is the output color.
    magick convert  -density 384 -background transparent -fill "#607D8B" -colorize 100 arrow.svg  -define icon:auto-resize -colors 256 -set filename:name %t   %[filename:name].ico

magick convert  -density 256x256 -background transparent -fill "#607D8B" -colorize 100 arrow.svg  -define icon:auto-resize -colors 256 -set filename:name %t   %[filename:name]2.ico


### Choco 

#### Install with cmd.exe

        @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

#### Install with Powershell

Run
     
     Get-ExecutionPolicy
     
If it returns `Restricted`, then run
        
         Set-ExecutionPolicy AllSigned 
         
or 

        Set-ExecutionPolicy Bypass -Scope Process.   

Finally run (this contains the above)

        Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


#### Set Global Confirm

        choco config set --name allowGlobalConfirmation --value true

then

        choco feature enable -n allowGlobalConfirmation

#### Get Installed Programs

        choco list --lo

        

### pandoc

pandoc" +RTS -K512m -RTS ECHOICU.utf8.md --to latex --from markdown+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash --output ECHOICU.tex --template "C:\Users\s163837\Documents\R\win-library\3.5\rmarkdown\rmd\latex\default-1.17.0.2.tex" --highlight-style tango --pdf-engine pdflatex --variable graphics=yes --variable "geometry:margin=1in" --variable "compact-title:yes"
output file: ECHOICU.knit.md

### Verifier

`verifier` - Opens windows driver verifier.  Make sure to make a back up and be able to roll things back.

### Set

to set variablsand have things expand.  Ess. like temp env vars.

Set /A VarName = Expression, where expression is a string, number or math
Set /P VarName = The Prompt to ask user.

### Prompt

Changes the prompt.  Lots of fun

Default is `$P$G>`.

Uses this table:

- $A  `&`           (Ampersand)
- $B  `|`           (pipe)
- $C `(`           (Left parenthesis)
- $D Current date
- $E Escape code  (ASCII code 27)
- $F  `)`           (Right parenthesis)
- $G ` >`           (greater-than sign)
- $H  Backspace   (erases previous character)
- $L  `<`           (less-than sign)
- $M  Display the remote name for Network drives
- $N  Current drive
- $P  Current drive and path
- $Q  `=`           (equal sign)
- $S              (space)
- $T  Current time
- $V  Windows version number
- $_  Carriage return and linefeed
- `$$  $`           (dollar sign)
- $+  Will display plus signs (`+`) one for each level of the PUSHD directory stack
-
### Fix DICOM Errors

!!!Important
Need [Grant, Revoke, Get DCOM permissions using PowerShell](https://gallery.technet.microsoft.com/Grant-Revoke-Get-DCOM-22da5b96)
It can be installed via ScriptBrowser

```powershell
cd "C:\Users\andyt\Documents\WindowsPowerShell\Scripts\Grant-Revoke-Get-DCOM-22da5b96\DCOMPermissions"
Import-Module .\DCOMPermissions.psm1
Grant-DComPermission -ApplicationID "{4839DDB7-58C2-48F5-8283-E1D1807D0D7D}" -Account "SYSTEM" -Type Launch -Permissions LocalLaunch,LocalActivation -OverrideConfigurationPermissions
```


### Shimgen

Using the .Net and Chocolatey Shimgen has been super useful.

First copy it from `%ChocolateyInstall%\tools` to `%ChocolateyInstall%\bin` so its on **PATH**.  (I cant remember if You need to add \bin to path or it comes that way?)  Anyway- Add `C:\ProgramData\Chocolatey\bin` to path.

Then run

```batch
cd /d %ChocolateyInstall%\tools
copy shimgen.exe ..\bin
shimgen -o="kdiff.exe" -p="..\..\..\Program Files\Kdiff3\Kdiff3.exe" -i=".\kdiff3.exe" --gui
```

Somehow shimgen knows to put things in Chocolatey\bin, so paths are relative to that.  Even attempting to put it in another folder fails- by explicitly setting output.  Will work fine like this though  You hae to generate a a relative path from the `C:\ProgramData\Chocolatey\bin` back to the file.

!!!Note - The Easy Way- go to directory of SOURCE - in this case winrar
    `c:\Program Files\WinRAR>shimgen -o='WinRar.exe' -p="%cd%\WinRAR.exe" -i=.\WinRAR.exe --gui`



## Other Notes

### File Explorer

Useful Categories to Add:
Type first
Name
Size
File Description
Product Name
Company

- Date Acceessed
- Content created
- Date Modified
- Owner

THen at the top- View -Options - Set to all Folders of that type'

In Windows


### Correct Selection

1. While on your desktop or in File Explorer, select one or more items you want to create shortcuts for.  Press and hold the Alt or Ctrl+Shift keys, drag and drop the selected item(s) to where you want to create the shortcut(s) at, and release the Alt or Ctrl+Shift keys.

When you are moving things you should right click in the destination or right click driag.

## Registry

### Important Locations

Computer\HKEY_CURRENT_USER\Environment
Computer\HKEY_CURRENT_USER\Console
Computer\HKEY_CURRENT_USER\Control Panel\Colors
Computer\HKEY_CURRENT_USER\Control Panel\Cursors
Computer\HKEY_CURRENT_USER\Control Panel\Desktop
Computer\HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics
Computer\HKEY_CURRENT_USER\Control Panel\Mouse
Computer\HKEY_CURRENT_USER\Control Panel\Input Method\Hot Keys
Computer\HKEY_CURRENT_USER\Control Panel\Personalization\Desktop Slideshow
Computer\HKEY_CURRENT_USER\Control Panel\Quick Actions\Pinned
### Registry Changes

Syntax of .Reg Files
A .reg file has the following syntax:

```txt
RegistryEditorVersion
Blank line
[RegistryPath1]

"DataItemName1"="DataType1:DataValue1"
DataItemName2"="DataType2:DataValue2"
Blank line
[RegistryPath2]

"DataItemName3"="DataType3:DataValue3"
```

where:

`RegistryEditorVersion` is either `"Windows Registry Editor Version 5.00"` for Windows 2000, Windows XP, and Windows Server 2003, or `"REGEDIT4"` for Windows 98 and Windows NT 4.0. The "REGEDIT4" header also works on Windows 2000-based, Windows XP-based, and Windows Server 2003-based computers.

Blank line is a blank line. This identifies the start of a new registry path. Each key or subkey is a new registry path. If you have several keys in your .reg file, blank lines can help you to examine and to troubleshoot the contents.
RegistryPathx is the path of the subkey that holds the first value you are importing. Enclose the path in square brackets, and separate each level of the hierarchy by a backslash. For example:
[HKEY_LOCAL_ MACHINE\SOFTWARE\Policies\Microsoft\Windows\System]
A .reg file can contain several registry paths. If the bottom of the hierarchy in the path statement does not exist in the registry, a new subkey is created. The contents of the registry files are sent to the registry in the order you enter them. Therefore, if you want to create a new subkey with another subkey below it, you must enter the lines in the correct order.

DataItemNamex is the name of the data item that you want to import. If a data item in your file does not exist in the registry, the .reg file adds it (with the value of the data item). If a data item does exist, the value in your .reg file overwrites the existing value. Quotation marks enclose the name of the data item. An equal sign (=) immediately follows the name of the data item.

DataTypex is the data type for the registry value and immediately follows the equal sign. For all the data types other than REG_SZ (a string value), a colon immediately follows the data type. If the data type is REG_SZ , do not include the data type value or colon. In this case, Regedit.exe assumes REG_SZ for the data type. The following table lists the typical registry data types:

- REG_BINARY - hexadecimal
- REG_DWORD - dword
- REG_EXPAND_SZ - hexadecimal(2)
- REG_MULTI_SZ - hexadecimal(7)
-

### Adding Registry Subkeys or Adding and Changing Registry Values

To add a registry subkey or add or change a registry value, make the appropriate changes in the registry, and then export the appropriate subkey or subkeys. Exported registry subkeys are automatically saved as .reg files. To make changes to the registry and export your changes to a .reg file, follow these steps:

1. Click Start, click Run, type regedit in the Open box, and then click OK.
2. Locate and then click the subkey that holds the registry item or items that you want to change.
3. Click File, and then click Export.

This step backs up the subkey before you make any changes. You can import this file back into the registry later if your changes cause a problem. In the File name box, type a file name to use to save the .reg file with the original registry items, and then click Save.

!!!Note Use a file name that reminds you of the contents, such as a reference to the name of the subkey.
In the right pane, add or modify the registry items you want.
Repeat steps 3 and 4 to export the subkey again, but use a different file name for the .reg file. You can use this .reg file to make your registry changes on another computer.
Test your changes on the local computer. If they cause a problem, double-click the file that holds the backup of the original registry data to return the registry to its original state. If the changes work as expected, you can distribute the .reg you created in step 6 to other computers by using the methods in the "Distributing Registry Changes" section of this article.

### Deleting Registry Keys and Values

To delete a registry key with a .reg file, put a hyphen (-) in front of the RegistryPath in the .reg file. For example, to delete the Test subkey from the following registry key:
`HKEY_LOCAL_MACHINE\Software`
put a hyphen in front of the following registry key in the .reg file:
`HKEY_LOCAL_MACHINE\Software\Test`
The following example has a .reg file that can perform this task.
`[-HKEY_LOCAL_MACHINE\Software\Test]`
To delete a registry value with a .reg file, put a hyphen (-) after the equals sign following the DataItemName in the .reg file. For example, to delete the TestValue registry value from the following registry key:
`HKEY_LOCAL_MACHINE\Software\Test`
put a hyphen after the "TestValue"= in the .reg file. The following example has a .reg file that can perform this task.
`HKEY_LOCAL_MACHINE\Software\Test`

`"TestValue"=-`
To create the .reg file, use Regedit.exe to export the registry key that you want to delete, and then use Notepad to edit the .reg file and insert the hyphen.

Renaming Registry Keys and Values
To rename a key or value, delete the key or value, and then create a new key or value with the new name.

### Setting Explorer to My PC not Quick Access

```batch
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
```


### Batch Examples

```batch
@echo off
Setlocal EnableDelayedExpansion
:: strLen String [RtnVar]
::             -- String  The string to be measured, surround in quotes if it contains spaces.
::             -- RtnVar  An optional variable to be used to return the string length.
Set "s=#%~1"
Set "len=0"
For %%N in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
  if "!s:~%%N,1!" neq "" (
    set /a "len+=%%N"
    set "s=!s:~%%N!"
  )
)
Endlocal&if "%~2" neq "" (set %~2=%len%) else echo %len%
Exit /b

::Exaple Calling
@Echo off
Setlocal
Set _demo="hello world"
Call strLen.cmd %_demo%
```

## Useful Microsoft Addons

[Microsoft Assessment and Deployment Toolkit](https://docs.microsoft.com/en-us/windows-hardware/get-started/adk-install)

[Microsoft Software Development Kit]()

[Microsoft Debugging Tools](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/debugger-download-tools)

[Windows Driver Kit (WDK)](https://docs.microsoft.com/en-us/windows-hardware/drivers/download-the-wdk)

[Windows Hardware Kit WHK](https://docs.microsoft.com/en-us/windows-hardware/drivers/download-the-wdk)

Microsoft Messaging

Microsoft Network TMonitor

Microsoft Message Analyzer

## MSI Executables

For example: `msiexec /a "C:\users\altimmons\downloads\python-2.7.15.amd64.msi" /lemox "./temp.txt"`

The above command says using msiexec (windows installer), run as an admin `/a` this file, `/l` log it, and in the log put- I dont remember all the other letters e is errors. x is more info I think. Save it in the local directory `./temp.txt`.

you can say program /? for more info

## Network

### Proxy Management

? Cntlm: Fast NTLM Authentication Proxy in C - not sure if this is part of the work computer or if I installed this...

### FireWall

Enable Remote desktop related rules.  Unclear which these are.

### Reserved IPs

#### IPv4

[Source](https://en.wikipedia.org/wiki/Reserved_IP_addresses)

| Address block      | Address range               | Number of addresses | Scope           | Description                                                                                                            |
| ------------------ | --------------------------- | ------------------- | --------------- | ---------------------------------------------------------------------------------------------------------------------- |
| 0.0.0.0/8          | 0.0.0.0–0.255.255.255       | 16777216            | Software        | Current network (only valid as source address).                                                                        |
| 10.0.0.0/8         | 10.0.0.0–10.255.255.255     | 16777216            | Private network | Used for local communications within a private network.                                                                |
| 100.64.0.0/10      | 100.64.0.0–100.127.255.255  | 4194304             | Private network | Shared address space for communications between a service provider and its subscribers when using a carrier-grade NAT. |
| 127.0.0.0/8        | 127.0.0.0–127.255.255.255   | 16777216            | Host            | Used for loopback addresses to the local host.                                                                         |
| 169.254.0.0/16     | 169.254.0.0–169.254.255.255 | 65536               | Subnet          | Used for link-local addresses between two hosts on a single link when no IP address is otherwise specified,            |
| 172.16.0.0/12      | 172.16.0.0–172.31.255.255   | 1048576             | Private network | Used for local communications within a private network.                                                                |
| 192.0.0.0/24       | 192.0.0.0–192.0.0.255       | 256                 | Private network | IETF Protocol Assignments.                                                                                             |
| 192.0.2.0/24       | 192.0.2.0–192.0.2.255       | 256                 | Documentation   | Assigned as TEST-NET-1, documentation and examples.                                                                    |
| 192.88.99.0/24     | 192.88.99.0–192.88.99.255   | 256                 | Internet        | Reserved.[6] Formerly used for IPv6 to IPv4 relay (included IPv6 address block 2002::/16).                             |
| 192.168.0.0/16     | 192.168.0.0–192.168.255.255 | 65536               | Private network | Used for local communications within a private network.                                                                |
| 198.18.0.0/15      | 198.18.0.0–198.19.255.255   | 131072              | Private network | Used for benchmark testing of inter-network communications between two separate subnets.                               |
| 198.51.100.0/24    | 198.51.100.0–198.51.100.255 | 256                 | Documentation   | Assigned as TEST-NET-2, documentation and examples.                                                                    |
| 203.0.113.0/24     | 203.0.113.0–203.0.113.255   | 256                 | Documentation   | Assigned as TEST-NET-3, documentation and examples.                                                                    |
| 224.0.0.0/4        | 224.0.0.0–239.255.255.255   | 268435456           | Internet        | In use for IP multicast. (Former Class D network).                                                                     |
| 240.0.0.0/4        | 240.0.0.0–255.255.255.254   | 268435456           | Internet        | Reserved for future use. (Former Class E network).                                                                     |
| 255.255.255.255/32 | 255.255.255.255             | 1                   | Subnet          | Reserved for the "limited broadcast" destination address.                                                              |

such as would have normally been retrieved from a DHCP server.

#### IPV6

| Address block (CIDR) | First address   | Last address     | Number of addresses                     | Usage         | Purpose         |                                                          |
| -------------------- | --------------- | ---------------- | --------------------------------------- | ------------- | --------------- | -------------------------------------------------------- |
|                      | ::/0            | ::               | ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff | 2128          | Routing         | Default route.                                           |
|                      | ::/128          | ::               |                                         | 1             | Software        | Unspecified address.                                     |
|                      | ::1/128         | ::1              |                                         | 1             | Host            | Loopback address to the local host.                      |
|                      | ::ffff:0:0/96   | ::ffff:0.0.0.0   | ::ffff:255.255.255.255                  | 2128−96 = 232 | Software        | IPv4 mapped addresses.                                   |
|                      | ::ffff:0:0:0/96 | ::ffff:0:0.0.0.0 | ::ffff:0:255.255.255.255                | 232           | Software        | IPv4 translated addresses.                               |
|                      | 64:ff9b::/96    | 64:ff9b::0.0.0.0 | 64:ff9b::255.255.255.255                | 232           | Global Internet | IPv4/IPv6 translation.                                   |
|                      | 100::/64        | 100::            | 100::ffff:ffff:ffff:ffff                | 264           | Routing         | Discard prefix.                                          |
|                      | 2001::/32       | 2001::           | 2001::ffff:ffff:ffff:ffff:ffff:ffff     | 296           | Global Internet | Teredo tunneling.                                        |
|                      | 2001:20::/28    | 2001:20::        | 2001:2f:ffff:ffff:ffff:ffff:ffff:ffff   | 2100          | Software        | ORCHIDv2.                                                |
|                      | 2001:db8::/32   | 2001:db8::       | 2001:db8:ffff:ffff:ffff:ffff:ffff:ffff  | 296           | Documentation   | Addresses used in documentation and example source code. |
|                      | 2002::/16       | 2002::           | 2002:ffff:ffff:ffff:ffff:ffff:ffff:ffff | 2112          | Global Internet | The 6to4 addressing scheme (now deprecated).             |
|                      | fc00::/7        | fc00::           | fdff:ffff:ffff:ffff:ffff:ffff:ffff:ffff | 2121          | Private network | Unique local address.                                    |
|                      | fe80::/10       | fe80::           | febf:ffff:ffff:ffff:ffff:ffff:ffff:ffff | 2118          | Link            | Link-local address.                                      |
|                      | ff00::/8        | ff00::           | ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff | 2120          | Global Internet | Multicast address.                                       |


## Setup Git

First setup basics

```bash
git config --global user.name "altimmons"
git config --global user.email "A.L.Timmons@gmail.com"
```

Then generate an SSH key to upload to github

```
ssh-keygen -t rsa -C "A.L.Timmons@gmail.com"
```

This is best done with wsl

 7dfc369ea46474e9a0d8131d6c247c3229cfe58f

`git show :.gitignore`

git checkout master

git commit

## Streamline Windows

This is the source of two separate packages:

- [Debloat Windows 10](https://github.com/W4RH4WK/Debloat-Windows-10)
- [Remove-Windows10-Bloat.bat](https://gist.githubusercontent.com/matthewjberger/2f4295887d6cb5738fa34e597f457b7f/raw/b23fa065febed8a2d7c2f030fba6da381f640997/Remove-Windows10-Bloat.bat)


## VS Code RegExp

[Reference 1](https://stackoverflow.com/questions/42179046/what-flavor-of-regex-does-visual-studio-code-use/42184299#42184299)

There are many flavors of RegExp- VS Code uses Rust [Rust RegExp](https://docs.rs/regex/0.2.10/regex/) specifically [Here](https://docs.rs/regex/0.2.10/regex/#syntax)

[Microsoft VS RegExp](https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/2k3te2cs(v=vs.110))
exe64=x64\\(.*?)(

[Substitutions in Reg Exp](https://docs.microsoft.com/en-us/dotnet/standard/base-types/substitutions-in-regular-expressions)

[File](..)

[GOOD- Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
[PDF Version](https://download.microsoft.com/download/D/2/4/D240EBF6-A9BA-4E4F-A63F-AEB6DA0B921C/Regular%20expressions%20quick%20reference.pdf)



!!!Note Note- The link- `Microsoft VS RegExp` suggests an older easier form of RegExp thats worth checking out if this isnt working

- Wildcards
  - `.` - 1   match a single char (any, except new line `\n`)
  - `*` - 0+  - zero or more occurances.
  - `+` - 1+  -one or more occurances.  Requires its occurance.
  - `?` - match 0 or more, but as few characters as possible (?).
    - `.+`  = one or more of any char **As above- this is a (non-null) Wildcard**
    - `.*` = zero or more of any char.  **This is a wildcard functionally**
    - `*?`,`+?`, `??`, `{#...}?` Lazy modifiers of the above.
  - {#} - specify the number of times something *preceeding* should occur.  Goes after. `[0-9]{3} = 142 or 999`
    - {#,#} - specify a range of occurances.  e.g. [0-9]{2,4}  match 10 - 9999
    - {#,} - match at least # times
- Anchors
  - `^` - anchor to front
  - `\r?$` -anchor to rear.  Old character was just `$`
- Parens and brackets
  - [...] - give characters to match.
    - [\], [c] - match a single char
    - [a-f], [0-9] - match a range
    - [pre], [.)-] - match a single character in a set. [abc] = a, b, c not d, matches a in aa.
  - (...) - specify a string to search for
    - (...) -> `\1` define a pattern then Reference it later (in the same pattern) with \1 (\2, \3) etc.  `({3}[x])z\1 = xxxzxxx`
    - (...) -> `$1` - in replacements, VS 2011+ replaced \1 with $1.
- Logic
  - `?!` = NOT , `real(?!ity)` matched real and really but not reality.
  - [^...] - NOT in set - as above for brackets, but invalidates `be[^abc]` does not match bear but would match bee.
  - `|` = OR - Match either the sequence before or after. `([0-9]|[a-f]|[^g-z])` - to find hex `#([0-9]|[a-f]){6}` find hex colors
- Types
  - `(\b\S+\s?){1,}`  USEFUL- find words - start at word boundary -repeat to go to non-space- find 0 or 1 space- then all of it {1,}- one or more words.
  - `\p{...}` match a type
  - `\b` -specifies a word boundary- usually a space `\bin` matches inside but not bin.
  - `\r?\n` - line break carriage return.   This is system independent - 0 or more \r (returns), then \n.  Or at least Unix/Win
  - `(?([^\r\n])\s)` Whitespace
  - `\d` digit
  - \u#### -unicode (specific char)
  - `((\".+?\")|('.+?'))` = quoted string
  - `\b0[xX]([0-9a-fA-F])\b` matches hex- Matches "0xc67f" but not "0xc67fc67f".
  - `\b[0-9]*\.*[0-9]+\b` int and floats.
- Characters
  - `\` -escape character - e.g. `\.` is a literal `.` not anychar.
  - \b - word boundary
  - \t tab character (\u0009)
  - \r carriage return \u000D
  - \v vert tab
  - \f form feed
  - `\n` new line (\u000A)
  - `\e` escape \u001b
  - `\###` | `\##` matches an **ASCII Character** in Octal | Hex
  - `\cC` matches CtrlC
  - `\octal` 2-3 digit octal character code
  - `\x` hex 2-digit hex character code
  - `\u` hex 4-digit hex character code
  - `\b` Backspace \u0008 NOTE-This is redundant with word boundry, not sure how it'd work.
  - `\e` Escape \u001B
- Classes- generally UPPER CASE is NOT a category.
  - \S -any non-White-Space
  - \s - any whitespace character
  - \D - Matches a nondigit char - equiv to `\P{Nd}`
  - \d - a decimal digit (e.g number 0-9)
    - \d{1,5}- Match from one to five decimal digits.
  - `\w` Alphanumeric ('Word character')
  - \W non word character
  - \p{**} - is in a category
  - \P{**} is NOT in a category
  - Categories (more specific classes) (`\p{...}`)
    - Ll  -Letter, Lowercase
    - Lu  -Letter, Uppercase
    - Lt  -Letter, Titlecase
    - Lo  -Letter, Other
    - Lm  -Letter, Modifier
    - Mn  -Mark, Nonspacing
    - Nd  -Number, Decimal Digit
    - Pc  -Punctuation, Connector. This category includes ten characters, the most commonly used of which is the LOWLINE character (_), u+005F.
    - L -Any letter
    - Mn - Mark, Nonspacing
    - Mc - Mark, Spacing Combining
    - Me - Mark, Enclosing
    - M - All diacritic marks. This includes the Mn, Mc, and Me categories.
    - Nd - Number, Decimal Digit
    - Nl - Number, Letter
    - No - Number, Other
    - N - All numbers. This includes the Nd, Nl, and No categories.
    - Pc - Punctuation, Connector
    - Pd - Punctuation, Dash
    - Ps - Punctuation, Open
    - Pe - Punctuation, Close
    - Pi - Punctuation, Initial quote (may behave like Ps or Pe depending on usage)
    - Pf - Punctuation, Final quote (may behave like Ps or Pe depending on usage)
    - Po - Punctuation, Other
    - P - All punctuation characters. This includes the Pc, Pd, Ps, Pe, Pi, Pf, and Po categories.
    - Sm - Symbol, Math
    - Sc - Symbol, Currency
    - Sk - Symbol, Modifier
    - So - Symbol, Other
    - S - All symbols. This includes the Sm, Sc, Sk, and So categories.
    - Zs - Separator, Space
    - Zl - Separator, Line
    - Zp - Separator, Paragraph
    - Z - All separator characters. This includes the Zs, Zl, and Zp categories.
    - Cc - Other, Control
    - Cf - Other, Format
    - Cs - Other, Surrogate
    - Co - Other, Private Use
    - Cn - Other, Not Assigned (no characters have this property)
    - C - All control characters. This includes the Cc, Cf, Cs, Co, and Cn categories.
- Anchors
  - `^`  match must occur at the _beginning_ of the string;
    - multiline mode, it must occur at the beginning of the line.
  - `$`  the match must occur at _the end of the string or before \n_ at the end of the string;
    - in multiline mode, it must occur at the end of the line or before \n at the end of the line.
  - `\A`  The match must occur at the beginning of the string only (no multiline support).
  - `\Z`  The match must occur at the end of the string, or before \n at the end of the string.
  - `\z`  The match must occur at the end of the string only.
  - `\G`  The match must start at the position where the previous match ended.
  - `\b`  The match must occur on a **word boundary.**
  - `\B`  The match must not occur on a word boundary.
^()(\S+?)([ ]{2,}\t*[ ]{2,})(\b.*)$
^()(\S+?)(([ ]{3,}|)\t*([ ]{3,}|))(\b.*)$

Group Referencing (Reusing a previously used group)
- `(exp)` Indexed group
- `(?<name>exp)` -  Named group
- `(?<name1-name2>exp)` - Balancing group
- `(?:exp)` - Noncapturing group
- `(?=exp)` - Zero-width positive lookahead
- `(?!exp)` - Zero-width negative lookahead
- `(?<=exp)` - Zero-width positive lookbehind
- `(?<!exp)` - Zero-width negative lookbehind
- `(?>exp)` - Non-backtracking (greedy)

Use To substitute
- `$n` - Substring matched by group number n
- `${` - name}     Substring matched by group
- `$$` - Literal $ character
- `$&` - Copy of whole match
- `` $` `` ([[DollarSign + Backtick]]- Text before the match
- `$'` - Text after the match
- `$+` - Last captured group
- `$` - _   Entire input string

Conditionals

- `a |b` - Either a or b
- `(?(exp) yes | no)` -> `yes` if exp is matched and  =`no` if exp isn't matched
- `(?(name) yes | no)` -> `yes` if name is matched  and  = `no` if name isn't matched

Comments
- `(?# comment)` Add inline comment
- `#` Add x-mode comment
-
backreferencing
- `\n` - Indexed group
- `\k<name>` - Named group
- Options
- `(?imnsximnsx)` Set or disable the specified options
- `(?imnsximnsx:exp)` Set or disable the specified options within the expression
  - `i` - Case-insensitive
  - `m` - Multiline mode
  - `n` - Explicit (named)
  - `s` - Single-line mode
  - `x` - Ignore white space

Greedy Lazy Matches
0 or more times | `*` Greedy `*?`  Lazy
1 or more times | `+` Greedy  `+?`  Lacy
 `?` |  `??` Lazy 0 or 1 time |
`{n}` `{n}?` Exactly n times
`{n,}` `{n,}?` At least n times
`{n,m}` `{n,m}?` From n to m times

| Greedy    | Lazy       | Matches           |
| --------- | ---------- | ----------------- |
| `*`       | `*?`       | 0 or more times   |
| `+`       | `+?`       | 1 or more times   |
| `?`       | `??`       | 0 or 1 time       |
| `{`n`}`   | `{`n`}?`   | Exactly n times   |
| `{`n,`}`  | `{`n,`}?`  | At least n times  |
| `{`n,m`}` | `{`n,m`}?` | From n to m times |

Note- `{n,m}` and similar are recorded weird because they disappear from table when entered verbatim, it must be the format of the table code.


The regular expression pattern \b`(?<n2>\d{2}-)?``(?(n2)``\d{7}`|`\d{3}-\d{2}-\d{4}`)\b is interpreted as shown in the following table.

Pattern  Description
- `\b`  Start at a word boundary.
- `(?<n2>\d{2}-)?` Match zero or one occurrence of two digits followed by a hyphen. Name this capturing group n2.
- `(?(n2)`  Test whether n2 was matched in the input string.
- `)\d{7}`   If n2 was matched, match seven decimal digits.
- `|\d{3}-\d{2}-\d{4}` If n2 was not matched, match three decimal digits, a hyphen, two decimal digits, another hyphen, and four decimal digits.
- `\b`  Match a word boundary.

### Examples

Verifying Email:

```c#
 public static void Main()
   {
      Stopwatch sw;
      string[] addresses = { "AAAAAAAAAAA@contoso.com",
                             "AAAAAAAAAAaaaaaaaaaa!@contoso.com" };
      // The following regular expression should not actually be used to
      // validate an email address.
      string pattern = @"^[0-9A-Z]([-.\w]*[0-9A-Z])*$";
      string input;

      foreach (var address in addresses) {
         string mailBox = address.Substring(0, address.IndexOf("@"));
         int index = 0;
         for (int ctr = mailBox.Length - 1; ctr >= 0; ctr--) {
            index++;

            input = mailBox.Substring(ctr, index);
            sw = Stopwatch.StartNew();
            Match m = Regex.Match(input, pattern, RegexOptions.IgnoreCase);
            sw.Stop();
            if (m.Success)
               Console.WriteLine("{0,2}. Matched '{1,25}' in {2}",
                                 index, m.Value, sw.Elapsed);
            else
               Console.WriteLine("{0,2}. Failed  '{1,25}' in {2}",
                                 index, input, sw.Elapsed);
         }
         Console.WriteLine();
      }
   }
```

Example with open and close paren- might need this someday.

<https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference>

[Better Source](https://docs.microsoft.com/en-us/dotnet/standard/base-types/grouping-constructs-in-regular-expressions#balancing_group_definition)

(?< name1 - name2 > subexpression )

Defines a balancing group definition. For more information, see the "Balancing Group Definition" section in Grouping Constructs.

`(((?'Open'\()[^\(\)]*)+((?'Close-Open'\))[^\(\)]*)+)*(?(Open)(?!))$`

"((1-3)*(3-1))" in "3+2^((1-3)*(3-1))"


[Parsing a string - Serial No Example in C#](https://stackoverflow.com/questions/18229939/regex-check-and-pad-string-to-ensure-certain-string-format-is-use)

#### My Examples


(^[a-zA-Z]*?) Standard

Finding a table

`(^\|)(.*?)(\|)(.*?)(\|$)`

!!!example For parsing tables:
    Intention is to find `^| ... | ... |$`

        `(^[\[\_.\:\+\*-\w]*)([\t]{2})(.*?$)` -
    convert input from R into (- `xxxx` - xxxx)


!!!code Convert var: text -
         (^[.$\w\s\(\;\)]*)([:])

!!!note Bold betweem the parentheses (xxx) -> **(xxx)**
            ([(])(.*?)([)])
            **$1$2$3**


!!!note   A series of entries like this:
    It would not continue the match onto the following line for some reason.
        encoding:
        The name of an encoding, default "native.enc". See connections.
        encoding:
        The name of an encoding, default "native.enc". See connections.

        (^[a-z.]+?)(:)([\n^.*])
    and replace with    -

            `$1`

    Or also, though I am not sure this wasnt something else:

          (^[\w]*?)([\n])(^.*?$)
    replace with

            $1 $3



!!!attention Matches patterns with a single word, and then the next     line- like this
    !!!quote
        **timeout**\
        timeout in seconds, ignored if 0. This is a limit for the elapsed time running command in a separate process. Fractions of seconds are ignored.

        **show.output.on.console**\
        logical (not NA), indicates whether to capture the output of the command and show it on the R console (not used by Rterm, which shows the output in the terminal unless wait is false).

        **invisible**\
        logical (not NA), indicates whether a command window should be visible on the screen.**

    !!!done    Which returns text like this:
        - _timeout_ - timeout in seconds, ignored if 0. This is a limit for the elapsed time running command in a separate process. Fractions of seconds are ignored.
        - _show.output.on.console_ - logical (not NA), indicates whether to capture the output of the command and show it on the R console (not used by Rterm, which shows the output in the terminal unless wait is false).
        - _minimized_ - logical (not NA), indicates whether a command window should be displayed initially as a minimized window.

        !!!tip Use:

                (^[\b\w., ]+?)([\n]|[\t\n])(^.+?$)
                (^[\b\w., ]+?)([\n])(^.+?$)

            and replace with

                        - _$1_ - $3
                        - `$1` - $3
                        - **$1** - $3

!!!example  [[Replace]]
    !!!quote Used for grabbing flags and commenting them
        -d --diff <file> <file>           Compare two files with each other.
        -a --add <folder>                 Add folder(s) to the last active window.
        -g --goto <file:line[:character]> Open a file at the path on the specified
                                            line and character position.
        -n --new-window                   Force to open a new window.
        -r --reuse-window                 Force to open a file or folder in an


        !!!tip Use:
                (-{1,2}[\w\S]+)(( \<.{3,30}\>)|)

            replace with

               `$1$3`

            !!!done    Which returns text like this:
       `-d` `--diff <file> <file>`           Compare two files with each other.
        `-a` `--add <folder>`                 Add folder(s) to the last active window.
        `-g` `--goto <file:line[:character]>` Open a file at the path on the specified
                                            line and character position.
        `-n` `--new-window`                   Force to open a new window.
        `-r` `--reuse-window`                 Force to open a file or folder in an


``(`)([ ]{3,})(\S)`` -> `$1 | $3`

!!!attention To match... TEMPLATE
    !!!quote Input from
        example

    !!!done    Which returns text like this:
        result

        !!!tip Use:
                <code>

            replace with

                <code>

!!!example  [[Replace]]
    !!!quote [[Source]]
        example\
        example\
        example\
        example

        !!!tip Use:
                <code>
                <code>
                <code>

            replace with

                <code>

            !!!done    Which returns text like this:
                - example
                - example
                - example
                - example


!!!example  [[Replace]]
    !!!quote [[Source]]
        example\
        example\
        example\
        example

    !!!tip Use:
            <code>
            <code>
            <code>

        replace with

            <code>

        !!!done    Which returns text like this:
            - example
            - example
            - example
            - example


!!!example  [[Replace]]
    !!!quote [[Source]]
        example\
        example\
        example\
        example

        !!!tip Use:
                <code>
                <code>
                <code>

            replace with

                <code>

    !!!done    Which returns text like this:
        - example
        - example
        - example
        - example


!!!example  [[Replace]]
    !!!quote [[Source]]
        example\
        example\
        example\
        example

    !!!tip Use:
            <code>
            <code>
            <code>

        replace with

            <code>

    !!!done    Which returns text like this:
        - example
        - example
        - example
        - example



!!!note   Replace 1 or two # with ># (##, >##) to remove comments in code blocks
            (\#)(\#|)
            (\#)(\#)([]|[ ])
    replace with : version 2 removes the space after.

!!!note Replace literal *'tabular'* data into an unordered list with code indicators around the first col.  This is for items that are generally:
        item    definition
        item2   definition2
        item3   definition3

    yields:

        - `item` - definition
        - `item2` - definition2
        - `item3` - definition3

    Rex Exp - more general and dynamic moving down this list.  Right now the last one performs the best.

        1. (\S*?)(\t)(.*) -most specific
        2. ^()(\S*?)(\t)(.*)$ -add empty group to make replacements match.
        3. ^([\s]*?)([\S]*?)(\t| )(.*)$
        4. ^([\s\t ]*?)(\b[\S]+?)(\t|[ ]*)(\b.*)$
        5. (\S*?)(\t|[ ]*)(\b\S.*)$
        6. ^()(\S+?)([ ]*\t+[ ]*)(\b.*)$
        7. ^()(\S+?)(([ ]{3,}|)\t*([ ]{3,}|))(\b.*)$

!!!note   Replace 1 or two # with ># (##, >##) to remove comments in code blocks
            (\#)(\#|)
            (\#)(\#)([]|[ ])
    replace with : version 2 removes the space after.

            >$1$2



## Other Tips, Tricks and Hacks

### Get any programs location using the registry.

This is in powershell
```ps1
>#get the path to 7-zip from the registry
$7zip = Join-Path (get-item HKLM:\SOFTWARE\7-Zip).GetValue('Path') '7z.exe'
```
The commandline has an equivalent (Reg)

```batch
>reg Query HKLM\Software\7-Zip

HKEY_LOCAL_MACHINE\Software\7-Zip
    Path64    REG_SZ    C:\Program Files\7-Zip\
    Path    REG_SZ    C:\Program Files\7-Zip\
```

Not sure how youd parse the output

### Norives


Hide drive mappings in 'My Computer', Windows Explorer and the standard Open dialog box.

Each letter is one bit more in binary.

So drive A(1) = 1, drive B(2)=2, driveC(3)=4, D=8, E=16 and so on.

Copy the result into the registry to hide the drive letter(s)

User Key:
[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]

System Key:
[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]

Value Name: NoDrives
Data Type: DWORD

After changing the registry, logoff or reboot so that it takes effect.

Drive mappings hidden with a nodrives registry setting are still available, just type the drive letter into the explorer address bar.

### Batch File

```batch
@rem *** Disable Some Service ***
sc stop DiagTrack
sc stop diagnosticshub.standardcollector.service
sc stop dmwappushservice
sc stop WMPNetworkSvc
sc stop WSearch

sc config DiagTrack start= disabled
sc config diagnosticshub.standardcollector.service start= disabled
sc config dmwappushservice start= disabled
REM sc config RemoteRegistry start= disabled
REM sc config TrkWks start= disabled
sc config WMPNetworkSvc start= disabled
sc config WSearch start= disabled
REM sc config SysMain start= disabled

REM *** SCHEDULED TASKS tweaks ***
REM schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentLogOn" /Disable
schtasks /Change /TN "Microsoft\Office\OfficeTelemetryAgentFallBack" /Disable
schtasks /Change /TN "Microsoft\Office\Office 15 Subscription Heartbeat" /Disable

REM schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
REM schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /Disable
REM schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
REM schtasks /Change /TN "Microsoft\Windows\DiskFootprint\Diagnostics" /Disable *** Not sure if should be disabled, maybe related to S.M.A.R.T.
REM schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
REM schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
REM schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
REM The stubborn task Microsoft\Windows\SettingSync\BackgroundUploadTask can be Disabled using a simple bit change. I use a REG file for that (attached to this post).
REM schtasks /Change /TN "Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
REM schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
REM schtasks /Change /TN "Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable


@rem *** Remove Telemetry & Data Collection ***
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f

@REM Settings -> Privacy -> General -> Let apps use my advertising ID...
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
REM - SmartScreen Filter for Store Apps: Disable
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
REM - Let websites provide locally...
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f

@REM WiFi Sense: HotSpot Sharing: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v value /t REG_DWORD /d 0 /f
@REM WiFi Sense: Shared HotSpot Auto-Connect: Disable
reg add "HKLM\Software\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" /v value /t REG_DWORD /d 0 /f

@REM Change Windows Updates to "Notify to schedule restart"
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v UxOption /t REG_DWORD /d 1 /f
@REM Disable P2P Update downlods outside of local network
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f


REM *** Hide the search box from taskbar. You can still search by pressing the Win key and start typing what you're looking for ***
REM 0 = hide completely, 1 = show only icon, 2 = show long search box
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d 0 /f

REM *** Disable MRU lists (jump lists) of XAML apps in Start Menu ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 0 /f

REM *** Set Windows Explorer to start on This PC instead of Quick Access ***
REM 1 = This PC, 2 = Quick access
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f

@rem Remove Apps
PowerShell -Command "Get-AppxPackage *3DBuilder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Getstarted* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsCamera* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bing* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *OneNote* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *people* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *photos* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *SkypeApp* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *solit* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsSoundRecorder* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
REM PowerShell -Command "Get-AppxPackage *WindowsCalculator* | Remove-AppxPackage"
REM PowerShell -Command "Get-AppxPackage *WindowsMaps* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Sway* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CommsPhone* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *ConnectivityStore* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"


@rem NOW JUST SOME TWEAKS
REM *** Show hidden files in Explorer ***
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f

REM *** Show super hidden system files in Explorer ***
REM reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f

REM *** Show file extensions in Explorer ***
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t  REG_DWORD /d 0 /f



REM *** Uninstall OneDrive ***
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /Q /S >NUL 2>&1
rd "%USERPROFILE%\OneDrive" /Q /S >NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S >NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
reg add "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v Attributes /t REG_DWORD /d 0 >NUL 2>&1
echo OneDrive has been removed. Windows Explorer needs to be restarted.
pause
start /wait TASKKILL /F /IM explorer.exe
start explorer.exe
```

### PowerShell Files

```ps1
#force-mkdir
function force-mkdir($path) {
    if (!(Test-Path $path)) {
        #Write-Host "-- Creating full path to: " $path -ForegroundColor White -BackgroundColor DarkGreen
        New-Item -ItemType Directory -Force -Path $path
    }
}
```

```ps1
function Takeown-Registry($key) {
    # TODO does not work for all root keys yet
    switch ($key.split('\')[0]) {
        "HKEY_CLASSES_ROOT" {
            $reg = [Microsoft.Win32.Registry]::ClassesRoot
            $key = $key.substring(18)
        }
        "HKEY_CURRENT_USER" {
            $reg = [Microsoft.Win32.Registry]::CurrentUser
            $key = $key.substring(18)
        }
        "HKEY_LOCAL_MACHINE" {
            $reg = [Microsoft.Win32.Registry]::LocalMachine
            $key = $key.substring(19)
        }
    }

    # get administraor group
    $admins = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544")
    $admins = $admins.Translate([System.Security.Principal.NTAccount])

    # set owner
    $key = $reg.OpenSubKey($key, "ReadWriteSubTree", "TakeOwnership")
    $acl = $key.GetAccessControl()
    $acl.SetOwner($admins)
    $key.SetAccessControl($acl)

    # set FullControl
    $acl = $key.GetAccessControl()
    $rule = New-Object System.Security.AccessControl.RegistryAccessRule($admins, "FullControl", "Allow")
    $acl.SetAccessRule($rule)
    $key.SetAccessControl($acl)
}

function Takeown-File($path) {
    takeown.exe /A /F $path
    $acl = Get-Acl $path

    # get administraor group
    $admins = New-Object System.Security.Principal.SecurityIdentifier("S-1-5-32-544")
    $admins = $admins.Translate([System.Security.Principal.NTAccount])

    # add NT Authority\SYSTEM
    $rule = New-Object System.Security.AccessControl.FileSystemAccessRule($admins, "FullControl", "None", "None", "Allow")
    $acl.AddAccessRule($rule)

    Set-Acl -Path $path -AclObject $acl
}

function Takeown-Folder($path) {
    Takeown-File $path
    foreach ($item in Get-ChildItem $path) {
        if (Test-Path $item -PathType Container) {
            Takeown-Folder $item.FullName
        } else {
            Takeown-File $item.FullName
        }
    }
}

function Elevate-Privileges {
    param($Privilege)
    $Definition = @"
    using System;
    using System.Runtime.InteropServices;

    public class AdjPriv {
        [DllImport("advapi32.dll", ExactSpelling = true, SetLastError = true)]
            internal static extern bool AdjustTokenPrivileges(IntPtr htok, bool disall, ref TokPriv1Luid newst, int len, IntPtr prev, IntPtr rele);

        [DllImport("advapi32.dll", ExactSpelling = true, SetLastError = true)]
            internal static extern bool OpenProcessToken(IntPtr h, int acc, ref IntPtr phtok);

        [DllImport("advapi32.dll", SetLastError = true)]
            internal static extern bool LookupPrivilegeValue(string host, string name, ref long pluid);

        [StructLayout(LayoutKind.Sequential, Pack = 1)]
            internal struct TokPriv1Luid {
                public int Count;
                public long Luid;
                public int Attr;
            }

        internal const int SE_PRIVILEGE_ENABLED = 0x00000002;
        internal const int TOKEN_QUERY = 0x00000008;
        internal const int TOKEN_ADJUST_PRIVILEGES = 0x00000020;

        public static bool EnablePrivilege(long processHandle, string privilege) {
            bool retVal;
            TokPriv1Luid tp;
            IntPtr hproc = new IntPtr(processHandle);
            IntPtr htok = IntPtr.Zero;
            retVal = OpenProcessToken(hproc, TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, ref htok);
            tp.Count = 1;
            tp.Luid = 0;
            tp.Attr = SE_PRIVILEGE_ENABLED;
            retVal = LookupPrivilegeValue(null, privilege, ref tp.Luid);
            retVal = AdjustTokenPrivileges(htok, false, ref tp, 0, IntPtr.Zero, IntPtr.Zero);
            return retVal;
        }
    }
"@
    $ProcessHandle = (Get-Process -id $pid).Handle
    $type = Add-Type $definition -PassThru
    $type[0]::EnablePrivilege($processHandle, $Privilege)
}
```

block-telemetry.ps1
