# New PC Setup Script

## Critical Software

- **Sysinternals Suite**
  - Needs to be added to Path
  - Needs to be accessable in SyMenu
- **RapidEE**
  - Set to Run as Admin by Default
- ** Powershell ISE Installed**
  - Include Modules
    - Script Browser
    - Script Analyzer
    - Module Browser
  - Install Config Scripts
- SyMenu
  - **NirSoft**
    - Add to Command Line (Path)
    - Short Cuts in Start Menu
- Cmder, ConEmu, Clink, Git, That whole Suite
  - ToDo get the customization file from the VM.
- Java
  - JRE
  - JDK
  - Docs
  - Java FX
  - Gradle
  - Maven
  - Ivy
  - Any
- Windows Network Monitor 3
  This holds the command line install instructions for the files beneath root, with the idea of creating a common repo that has all the customizations I like in a single package to be run on a new machine.

### Install AHK

```batch
AutoHotkey_1.1.28.02_setup.exe /S /D=C:\Program Files\AutoHotkey /U=64 /uiAccess=1
```

### Windows Universal Apps

- WinDbg
- Change Windows
- Character Map
-

### Install Window-Detective

```batch
Window-Detective-3.5.1-setup.exe /SP- /VerySilent /NoIcons /SaveINF=".\inst.inf"  /DIR="C:\tools\WindowDetective\"
```

### Boxstarter

The Boxstarter.Bootstrapper Module has been copied to C:\ProgramData\Boxstarter and added to your Module path.
You will need to open a new console for the path to be visible.
Use 'Get-Module Boxstarter._ -ListAvailable' to list all Boxstarter Modules.
To list all available Boxstarter Commands, use:
PS:>Import-Module Boxstarter.Bootstrapper
PS:>Get-Command -Module Boxstarter._

To find more info visit https://Boxstarter.org or use:
PS:>Import-Module Boxstarter.Bootstrapper
PS:>Get-Help Boxstarter

Located in C:\ProgramData\chocolatey\lib\boxstarter.bootstrapper
boxstarter.\* but it seems it needs to be moved

### boutdutunnel

choco
boutdutunnel.client , .server

### Choco

`choco list --lo > C:\Users\AndyT\Desktop\Choco.txt`

_Desktop Computer_

```
Chocolatey v0.10.11
7zip 18.5.0.20180730
7zip.install 18.5.0.20180730
autohotkey.portable 1.1.30.00
chocolatey 0.10.11
chocolatey-core.extension 1.3.3
chocolatey-misc-helpers.extension 0.0.1
chocolateygui 0.16.0
chromium 68.0.3440.106
greenshot 1.2.10.6
jdk10 10.0.2
jdk8 8.0.181
k-litecodecpackfull 14.3.0
nodejs 10.11.0
nodejs.install 10.11.0
pandoc 2.4
processhacker.install 2.39
rapidee 9.2.937
steam 3.0.1.0
utorrent 3.5.4.44520
winrar 5.60
20 packages installed.
```

_Work Computer_

```
C:\WINDOWS\system32>choco list -lo
7zip.portable 18.5
ant 1.10.5
arduino 1.8.6
autohotkey.install 1.1.28.02
**autohotkey.portable 1.1.28.02**
autoruns 13.82
boutdutunnel.client 1.5.3369.20120226
boutdutunnel.server 1.5.3369.20120225
Boxstarter.Bootstrapper 2.12.0
Boxstarter.Common 2.12.0
Boxstarter.WinConfig 2.12.0
ccleaner 5.50.6911
ccleaner.portable 5.50.0.6911
chocolatey 0.10.11
chocolatey-core.extension 1.3.3
chocolatey.server 0.2.5
chocolateygui 0.16.0
chromium 67.0.3396.79
**ConEmu 18.5.28.0**
dcmtk 3.6.3
desktopicons-winconfig 0.0.1
digimizer 5.3.4
docker-compose 1.22.0
docker-for-windows 18.06.1.19507
docker-toolbox 18.03.0
DotNet4.0 4.0.30319.20141222
DotNet4.5.2 4.5.2.20140902
DotNet4.6 4.6.00081.20150925
dotnet4.6.2 4.6.01590.20170129
dotnetfx 4.7.2.20180712
FiraCode 1.205
**git.install 2.17.0**
gradle 4.10.1
**greenshot 1.2.10.6**
hwinfo 5.82
hwinfo.install 5.82
intellijidea-ultimate 2018.1.4
*ivy 2.4.0.1*
**jdk10 10.0.1**
**jdk8 8.0.172**
**jre8 8.0.181**
**k-litecodecpackfull 14.1.0**
KB2919355 1.0.20160915
KB2919442 1.0.20160915
kubernetes-cli 1.12.0
**lastpass 4.1.54.20180330**
*maven 3.5.4*
**miktex.install 2.9.6753**
mingw 5.3.0
msys2 20180531.0.0
**ndm 1.2.0**
**nodejs.install 10.4.0**
notepadplusplus 7.5.6
notepadplusplus.install 7.5.6
nuget.commandline 4.8.1
NugetPackageExplorer 4.4.72
**pandoc 2.5**
**pip 1.2.0**
**processhacker 2.39**
**processhacker.install 2.39**
python2 2.7.14
rainmeter 4.1.0.2989
**rapidee 9.2.937**
scenebuilder9 9.0.1
setpoint 6.67.83.20161009
spacesniffer 1.3.0.2
steam 2.10.91.910201
sysinternals 2018.2.13
tccle 14.0.0.920161009
totalcommander 9.12.0.20180528
**ultrasearch.portable 2.2**
vscode 1.27.2
vscode-docker 1.0.0.20180620
**windirstat 1.1.2.20161210**
winlogbeat 6.5.3
winrar 5.50
wsltty 1.9.0
yarn 1.7.0
```

_Virtual Machine_

```

```

_Laptop_

```
7zip 18.5.0.20180730
7zip.install 18.5.0.20180730
adobereader 2015.007.20033.02
adobereader-update 18.011.20038
atom 1.28.2
autohotkey.portable 1.1.28.02
chocolatey 0.10.11
chocolatey-core.extension 1.3.3
chocolateygui 0.16.0
dia 0.97.2.2
eclipse 4.8.0
electron 1.8.4
Ghostscript.app 9.23
greenshot 1.2.10.6
InkScape 0.92.3.20180702
iTunes 12.7.5.9
jdk8 8.0.181
k-litecodecpackfull 14.1.5
libreoffice 5.4.4.20180111
libreoffice-fresh 6.0.5
nodejs 10.11.0
notepadplusplus 7.5.6
notepadplusplus.install 7.5.6
Opera 54.0.2952.64
PDFCreator 3.2.0
PowerShell 5.1.14409.20180105
pydev 6.5.0
rainmeter 4.1.0.2989
rapidee 9.2.937
steam 2.10.91.910201
sublimetext3 3.1.1
SublimeText3.PowershellAlias 0.1.0
telnet 0.9.0
vcredist2010 10.0.40219.2
vlc 3.0.4
winrar 5.60
yarn 1.10.1
youtube-dl 2018.07.29
38 packages installed.
```

### Terminal

Cmder (includes)
- ConEmu
- Clink
- TCC/LE
- 


#### Config

All config files must be in this folder. If there is no option to set this folder 
directly, it has to be hardlinked.

* `user-aliases.cmd`: aliases in cmd; called from vendor\init.bat; autocreated from
  `vendor\user-aliases.cmd.default`.
* `*.lua`: clink completions and prompt filters; autoloaded after all
  prompt filter and clink completions are initialized; add your own.
* `user-profile.{sh|cmd|ps1}`: startup files for bash|cmd|powershell tasks; called from their
  respective startup scripts in `vendor\`; autocreated from
  `vendor\user-profile.{sh|cmd|ps1}.default` on first start of such a task.
* `.history`: the current commandline history; autoupdated on close.
* `settings`: settings for readline; overwritten on update.
* `ConEmu.xml`: settings from ConEmu (=the UI of cmder -> Preferences); overwritten on update.



cmder

cmd /k "%ConEmuDir%\..\init.bat" -new_console:W:"C:\tools\cmder\img\cmder.jpg"
cmd /k "%ConEmuDir%\..\init.bat"-new_console:P:"^<Monokoi^>":W:"^<C:\tools\cmder\img\Cmder2.jpg^>"
*PowerShell -ExecutionPolicy RemoteSigned -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''"
*PowerShell -ExecutionPolicy RemoteSigned -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''"  -new_console:W:"C:\tools\cmder\img\simpowershell.png":C:"%CMDER_ROOT%\icons\cmder_blue.ico":P:"^<Powershell^>"
PowerShell -ExecutionPolicy Bypass -NoLogo -NoProfile -NoExit -Command "Invoke-Expression '. ''%ConEmuDir%\..\profile.ps1'''"
*%ConEmuDir%\..\git-for-windows\usr\bin\mintty.exe /bin/bash -l
> "%windir%\system32\cmd.exe" /k ""%ConEmuBaseDir%\CmdInit.cmd" & echo This is Native cmd.exe"

"%windir%\syswow64\cmd.exe" /k ""%ConEmuBaseDir%\CmdInit.cmd" & echo This is 32 bit cmd.exe -new_console:s50V"
set CHERE_INVOKING=1 & set "PATH=%ConEmuDir%\..\..\..\cygwin\bin;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe -new_console:p %ConEmuDir%\..\..\..\cygwin\bin\bash.exe --login -i -new_console:C:"%ConEmuDir%\..\..\..\cygwin\Cygwin.ico"
set "PATH=%ConEmuDrive%\Program Files\Git\usr\bin;%PATH%" & "%ConEmuDrive%\Program Files\Git\git-cmd.exe" --no-cd --command=%ConEmuBaseDirShort%\conemu-msys2-64.exe /usr/bin/bash.exe -l -i -new_console:p
cmd.exe /k type "%ConEmuBaseDir%\Addons\AnsiColors16t.ans" -cur_console:n
cmd /k ""%ConEmuDrive%\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat"" x86 -new_console:t:"VS 14.0" -new_console:C:"%CommonProgramFiles(x86)%\microsoft shared\MSEnv\VSFileHandler.dll,33"
*cmd.exe /k Title Chocolatey & "%ConEmuBaseDir%\Addons\ChocolateyAbout.cmd"
cmd /k ""%ConEmuDrive%\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsall.bat"" x64 -new_console:t:"VS 15.0" -new_console:C:"%CommonProgramFiles(x86)%\microsoft shared\MSEnv\VSFileHandler.dll,38"

cmd /k "%ConEmuDir%\..\init.bat"-new_console:P:"^<Monokoi^>":W:"^<C:\tools\Res\Cmder2.jpg^>"

<value name="BackGround Image" type="string" data="O:\OneDrive\Resources\StockImages\aurora-1197753_960_720.jpg"/>++

cmd /k "%ConEmuDir%\..\init.bat" -new_console:P:"^<PowerShell^>":W:"O:\OneDrive\Resources\StockImages\aurora1.jpg"
cmd /k "%ConEmuDir%\..\init.bat" -new_console:P:"^<PowerShell^>":W:"%ConEmuDrive%\Tools\Res\stk\aurora1.jpg"
cmd /k "%ConEmuDir%\..\init.bat" -new_console:W:"%ConEmuDrive%\Tools\Res\stk\aurora1.jpg":P:"PowerShell" Works!
cmd /k "%ConEmuDir%\..\init.bat" -new_console:W:"%ConEmuDrive%\Tools\Res\stk\aurora1.jpg":P:"PowerShell":C:"%ConEmuDrive%\Tools\Res\Icon.png"

