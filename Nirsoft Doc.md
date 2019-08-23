# Nirsoft Documentation


## Reg Scanner 

[Regscanner Doc](http://www.nirsoft.net/utils/regscanner.html)

#### Tips for using RegScanner

-   If you want to view all Registry values under a specific key, choose 'Registry item contains any value' in the matching combo-box, uncheck the 'Scan the following base keys', and in the Base Key combo-box type the desired key (For example: `HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer`)

-   If you want to view all Registry values that contains large amount of data, uncheck the 'Add entry for each found key' option, choose 'Registry item contains any value' in the matching combo-box, choose the 'Display only data with the following lenth range', and type the data length range that you want to find, for example: from 1000 bytes to 100000 bytes.

-   If you want to view the list of all Registry keys that have been modified in the last few hours or days, check the 'Add entry for each found key' and 'Add only keys' options, choose 'Registry item contains any value' in the matching combo-box, choose the 'Display only keys that their modified time is within the following range' option, and then select the modified date/time range that you want to view.

#### Searching DWORD/Binary values

Starting from version 1.40, you can search DWORD/Binary values. In order to specify a DWORD value to search, you can type (In the Find string text-box) a decimal value (for example: 255) or an hexadecimal value (for example: 0xff).
In order to specify a binary value that you want to search, type (In the Find string text-box) a sequence of hexadecimal bytes, with or without spaces between them.
For example:
      013fc7a127cc4a
      01 3f c7 a1 27 cc 4a

#### Searching the Registry in a remote computer

Starting from version 1.40, you can search the Registry in a remote computer on your network. In order to do that, you should login to the remote computer with admin user. Also, be aware that searching the Registry in a remote computer might be quite slow.

For more information about connecting to the Registry of a remote computer, read this:

[How to connect a remote Windows 7/Vista/XP computer with NirSoft utilities]
(http://blog.nirsoft.net/2009/10/22/how-to-connect-a-remote-windows-7vistaxp-computer-with-nirsoft-utilities/).

#### Using reg: Links

Starting from version v1.50, RegScanner allows you to use reg: URL as a link to the Registry key in RegEdit editor.
For Example: Clicking the link below will open RegEdit with the specified Registry key:

`<reg:HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion>`

You can also type the same reg: string in the address bar of Internet Explorer or in the Run dialog-box of Windows.

In order to enable/disable this feature, go to the File menu of RegScanner utility, and choose the 'Support Reg: Links' option.
Be aware that changing this option only affects the current logged on user.

#### Using the /regedit and /clipregedit Command-Line Options

Starting from version 1.50, you can use RegScanner.exe utility to open the desired key in RegEdit, by using the /regedit command-line option.
For example:

`RegScanner.exe /regedit "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"`

Starting from version 1.60, you can also use the `/clipregedit` command-line option if you want to open a key that you copied into the clipboard.

#### Notice about transition effects

If you want that RegEdit will be opened as fast as possible with the right Registry value, you should disable the 'transition effects' on your system. (On Windows 2000, go to the 'Display Properties' window, select the 'Effects' tab, and uncheck the 'Use transition effects...' option.

#### Command-Line Options

| Command              | Action                                           |
| -------------------- | ------------------------------------------------ |
| /cfg <Filename>      | Start RegScanner with the specified config file. |
| /stext <Filename>    | *into a simple text file.                        |
| /stab <Filename>     | *into a tab-delimited text file.                 |
| /scomma <Filename>   | *into a comma-delimited text file (csv).         |
| /stabular <Filename> | *into a tabular text file.                       |
| /shtml <Filename>    | *into HTML file (Horizontal).                    |
| /sverhtml <Filename> | *into HTML file (Vertical).                      |
| /sxml <Filename>     | *into XML file.                                  |

* Scan the Registry and export the result


## Install Packages View

#### Description

InstalledPackagesView is a tool for Windows that displays the list of all software packages installed on your system with Windows Installer, and lists the files, Registry keys, and .NET Assemblies associated with them. For every installed software, the following information is displayed: Display Name, Display Version, Install Date, Registry Time, Estimated Size, Install Location, Install Source, MSI Filename (In C:\Windows\Installer), and more...
You can watch the installed software packages information from your local system or from another system on external hard-drive.

The installed software information is loaded from the following Registry keys:
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\Products
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Installer\UserData\Components

Be aware that this tool lists only software installed by Windows Installer (MSI), it doesn't list any software installed by other installers.

#### System Requirements

This utility works on any version of Windows, starting from Windows XP and up to Windows 10\. Both 32-bit and 64-bit systems are supported.

![](http://www.nirsoft.net/utils/installedpackagesview.png)

#### Versions History

-   Version 1.05:
    -   Added /cfg command-line option to start InstalledPackagesView with the specified config file.
    -   Added 'Save File Encoding' option.
-   Version 1.02:
    -   Added 'Load Product Icon' option. When it's turned on, InstalledPackagesView displays the icon of the product, if it's available.
-   Version 1.01:
    -   You can now resize the properties window, and the last size/position of this window is saved in the .cfg file.
    -   You can now send the data to stdout by specifying empty string as filename, for example:
        InstalledPackagesView.exe /scomma "" | more
-   Version 1.00 - First release.

#### Start Using InstalledPackagesView

InstalledPackagesView doesn't require any installation process or additional DLL files. In order to start using it, simply run the executable file - InstalledPackagesView.exe

After running InstalledPackagesView, the upper pane of the main window displays the list of all MSI packages installed on your system. When selecting an item in the upper pane, the lower pane displays the list of files, Registry keys, and NET Assemblies associated with the selected software package.

If you want to view the information of external drive, go to the 'Advanced Options' window (F9), choose to load from external drive and then type the config folder (For example: F:\windows\system32\config) on the external drive.

#### Command-Line Options

| /stext <Filename> | Save the installed Windows Installer packages into a simple text file. |
| --- |  --- |
| /stab <Filename> | Save the installed Windows Installer packages into a tab-delimited text file. |
| /scomma <Filename> | Save the installed Windows Installer packages into a comma-delimited text file (csv). |
| /stabular <Filename> | Save the installed Windows Installer packages into a tabular text file. |
| /shtml <Filename> | Save the installed Windows Installer packages into HTML file (Horizontal). |
| /sverhtml <Filename> | Save the installed Windows Installer packages into HTML file (Vertical). |
| /sxml <Filename> | Save the installed Windows Installer packages into XML file. |
| /cfg <Filename> | Start InstalledPackagesView with the specified configuration file. For example:InstalledPackagesView.exe /cfg "c:\config\ipv.cfg"InstalledPackagesView.exe /cfg "%AppData%\InstalledPackagesView.cfg" |

#### Translating InstalledPackagesView to other languages

In order to translate InstalledPackagesView to other language, follow the instructions below:

1.  Run InstalledPackagesView with /savelangfile parameter:
    InstalledPackagesView.exe /savelangfile
    A file named InstalledPackagesView_lng.ini will be created in the folder of InstalledPackagesView utility.
2.  Open the created language file in Notepad or in any other text editor.
3.  Translate all string entries to the desired language. Optionally, you can also add your name and/or a link to your Web site. (TranslatorName and TranslatorURL values) If you add this information, it'll be used in the 'About' window.
4.  After you finish the translation, Run InstalledPackagesView, and all translated strings will be loaded from the language file.
    If you want to run InstalledPackagesView without the translation, simply rename the language file, or move it to another folder.

#### License

This utility is released as freeware. You are allowed to freely distribute this utility via floppy disk, CD-ROM, Internet, or in any other way, as long as you don't charge anything for this and you don't sell it or distribute it as a part of commercial product. If you distribute this utility, you must include all files in the distribution package, without any modification !

#### Disclaimer

The software is provided "AS IS" without any warranty, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The author will not be liable for any special, incidental, consequential or indirect damages due to loss of data or any other reason.

#### Feedback

If you have any problem, suggestion, comment, or you found a bug in my utility, you can send a message to <nirsofer@yahoo.com>

| [Download InstalledPackagesView 64-bit](http://www.nirsoft.net/utils/installedpackagesview-x64.zip) |

## Shell Menu View

#### Description

ShellMenuView is a small utility that displays the list of static menu items that appeared in the context menu when you right-click a file/folder on Windows Explorer, and allows you to easily disable unwanted menu items.

#### System Requirements

ShellMenuView works properly on any version of Windows starting from Windows 2000 and up to Windows 10. You can also use ShellMenuView on Windows 98 for viewing the menu items list, but the disable/enable feature won't work on this version of Windows. (The disabling feature is achieved by adding 'LegacyDisable' key to the desired menu item in the Registry, and this Registry key is not supported by Windows 98)

#### Notice !

Some of the menu items in the context menu of Explorer are created dynamically using shell extensions. In these cases, you can use the [ShellExView](shexview.html) utility to disable them.

![](http://www.nirsoft.net/utils/shellmenuview.gif)

#### Using ShellMenuView

ShellMenuView doesn't require any installation process or additional DLLs. In order to start using it, just copy the executable file (shmnview.exe) to any folder you like, and run it.
The main window of ShellMenuView displays the list of menu items. You can select one or more menu item, and enable/disable them.
You can also set or remove the extended mode of menu item. When menu item is in extended mode, the item is displayed only if you press the Shift key when the context menu is opened.

#### Command-Line Options


| Command              | "Save list of menu command... "             |
| -------------------- | ------------------------------------------- |
| /stext <Filename>    | ... into a regular text file.               |
| /stab <Filename>     | ...into tab-delimited text file.            |
| /scomma <Filename>   | ... into a comma-delimited text file (csv). |
| /stabular <Filename> | ... into a tabular text file.               |
| /shtml <Filename>    | ... into HTML file (Horizontal).            |
| /sverhtml <Filename> | ... into HTML file (Vertical).              |
| /sxml <Filename>     | ... into XML file.                          |
| /sort <column>       | *see below                                  |
| /nosort              | the list will be saved without any sorting. |

(*)- This command-line option can be used with other save options for sorting by the desired column. If you don't specify this option, the list is sorted according to the last sort that you made from the user interface. The `<column>` parameter can specify the column index (0 for the first column, 1 for the second column, and so on) or the name of the column, like "Menu Key" and "File Type". You can specify the '`~`' prefix character (e.g: "~Modified Time") if you want to sort in descending order. 

You can put multiple `/sort` in the command-line if you want to sort by multiple columns.Examples:
      shmnview.exe /shtml "f:\temp\menus.html" /sort 2 /sort ~1
      shmnview.exe /shtml "f:\temp\menus.html" /sort "Menu Name" /sort "Extensions"

#### License

This utility is released as freeware. You are allowed to freely distribute this utility via floppy disk, CD-ROM, Internet, or in any other way, as long as you don't charge anything for this. If you distribute this utility, you must include all files in the distribution package, without any modification !

#### Disclaimer

The software is provided "AS IS" without any warranty, either expressed or implied, including, but not limited to, the implied warranties of merchantability and fitness for a particular purpose. The author will not be liable for any special, incidental, consequential or indirect damages due to loss of data or any other reason.

#### Translating ShellMenuView to other languages

In order to translate ShellMenuView to other language, follow the instructions below:

1.  Run ShellMenuView with /savelangfile parameter:
    shmnview.exe /savelangfile
    A file named shmnview_lng.ini will be created in the folder of ShellMenuView utility.
2.  Open the created language file in Notepad or in any other text editor.
3.  Translate all string entries to the desired language. Optionally, you can also add your name and/or a link to your Web site. (TranslatorName and TranslatorURL values) If you add this information, it'll be used in the 'About' window.
4.  After you finish the translation, Run ShellMenuView, and all translated strings will be loaded from the language file.
    If you want to run ShellMenuView without the translation, simply rename the language file, or move it to another folder.