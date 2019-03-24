# Auto Hot Key notes

git clone --recursive git://github.com/rshipp/ahk-libs.git

## Keys

:
::
etc
hotkey stuff

- `#` -> (Windows Key)
- `!` -> Alt Key
- `^` -> Control
- `+` -> Shift
- `&` -> Used between any two keys or mouse buttons to combine them into a custom hotkey.
- `<` -> Use the left key of the pair. e.g. <!a is the same as !a except that only the left Alt key will trigger it.
- `>` -> Use the right key of the pair.
- `<^>!` -> AltGr (alternate graving). If your keyboard layout has an AltGr key instead of a right-Alt key
- `~` -> Passthrough Keystrokes
- `$` -> Mandate Hardware Keystrokes (ignore `Send( *Some_HotKey* )`)
- `UP` -> Fire on Release rather than press

Numpad0
Numpad1
Numpad2
Numpad3
Numpad4
Numpad5
Numpad6
Numpad7
Numpad8
Numpad9

WheelUp
WheelDown
LButton
RButton
MButtion

Alt
AppsKey
LAlt
Ctrl
RControl
LControl
RShift
LShift

...incomplete

###

Title |  Matching Behaviour
A |  The Active Window
ahk_class  | Window Class
ahk_id |  Unique ID/HWND
ahk_pid |  Process ID
ahk_exe |  Process Name/Path
ahk_group |  Window Group
 |  Multiple Criteria
(All empty) |  Last Found Window


## Variables

### Types

AutoHotkey supports these types of values:
- Strings (text)
- Numbers (integers and floating-point numbers)
- Objects
Some other related concepts:
- Boolean
- Nothing

#### `Typeof`

- `integer` (decimal, hexadecimal, float and integer, positive and negative)
- `float`
- `number` (integer or floating point)
- `digit` - a numerical character
- `xdigit` - a hexa numerical character (number + A-F)
- `alpha` character- not numbers, punct, spaces
- `upper` uppercase chars
- `lower` -lowercase chars
- `alnum` -alpha + digit (alphanumeric A-Z 0-9)
- `space` - True if Var is empty or contains only whitespace, which consists of the following characters: space (`%A_Space%`), tab (%A_Tab% or \`t), linefeed (\`n), return (\`r), vertical tab (\`v), and formfeed (\`f)
- `time`-True if Var contains a valid date-time stamp, which can be all or just the leading part of the YYYYMMDDHH24MISS format. For example, a 4-digit string such as 2004 is considered valid. Use StringLen to determine whether additional time components are present.
- `date` -equivalent to the above

#### Namespace (Global and Local Variables)

**Local variables** are specific to a single function and are visible only inside that function. Consequently, a local variable may have the same name as a global variable and both will have separate contents. Separate functions may also safely use the same variable names. All local variables which are not static are automatically freed (made empty) when the function returns.

Built-in variables such as `Clipboard`, `ErrorLevel`, and `A_TimeIdle` are never local (they can be accessed from anywhere), and cannot be re-declared.

Functions are _assume-local by default_. Variables accessed or created inside an assume-local function are local by default, with the following exceptions:

- `Super-global` variables, including classes.
- A dynamic variable reference may resolve to an existing global variable if no local variable exists by that name.
- Commands that create pseudo-arrays may create all elements as global even if only the first element is declared.

The default may also be overridden as shown below (by declaring the variable or by changing the mode of the function).

**Force-local mode**

[v1.1.27+]: If the function's first line is the word "`local`", all variable references (even dynamic ones) are assumed to be local unless they are declared as global inside the function. Unlike the default mode, force-local mode has the following behavior:

- Super-global variables (including classes) cannot be accessed without declaring them inside the function.
- Dynamic variable references follow the same rules as non-dynamic ones. Only global variables which are declared inside the function can be accessed.
- `StringSplit` and other commands which create pseudo-arrays follow the same rules as non-dynamic variable references (avoiding a common source of confusion).
- The `LocalSameAsGlobal` warning is never raised for variables within a force-local function.

**Global variables**
Assume-global mode: If a function needs to access or create a large number of global variables, it can be defined to assume that all its variables are global (except its parameters) by making its first line either the word "`global`" or the declaration of a local variable.

For example:

```ahk
    SetDefaults()
    {
        global  ; This word may be omitted if the first line of this function will be something like "local MyVar".
        MyGlobal := 33  ; Assigns 33 to a global variable, first creating the variable if necessary.
        local x, y:=0, z  ; Local variables must be declared in this mode, otherwise they would be assumed global.
    }
```

This assume-global mode can also be used by a function to create a global array, such as a loop that assigns values to `Array%A_Index%`.

**Super-global variables** [v1.1.05+]:
If a global declaration appears outside of any function, it takes effect for all functions by default (excluding force-local functions). This avoids the need to redeclare the variable in each function. However, if a function parameter or local variable with the same name is declared, it takes precedence over the global variable. Variables created by the class keyword are also super-global.

Static variables

Static variables are always implicitly local, but differ from locals because their values are remembered between calls. For example:

```ahk
LogToFile(TextToLog)
    {
        static LoggedLines = 0
        LoggedLines += 1 ; Maintain a tally locally (its value is remembered between calls).
        global LogFileName
        FileAppend, %LoggedLines%: %TextToLog%`n, %LogFileName%
    }
```

**Static Initializers:** In versions prior to 1.0.46, all static variables started off blank; so the only way to detect that one was being used for the first time was to check whether it was blank. A static variable may be initialized to something other than "" by following it with := or = followed by one of the following: true, false, a literal integer, a literal floating point number, or a literal/quoted string such as "fox". For example: static X:=0, Y:="fox". Each static variable is initialized only once (before the script begins executing).

`Static var := expression` is supported. All such expressions are evaluated immediately before the script's auto-execute section in the order they are encountered in the script.

**Assume-static mode:** A function may be defined to assume that all its variables are static (except its parameters) by making its first line the word "static". For example:

```ahk
GetFromStaticArray(WhichItemNumber)
{
    static
    static FirstCallToUs := true ; A static declaration's initializer still runs only once (upon startup).
    if FirstCallToUs ; Create a static array during the first call, but not on subsequent calls.
    {
        FirstCallToUs := false
        Loop 10
        StaticArray%A_Index% := "Value #" . A_Index
    }
    return StaticArray%WhichItemNumber%
}
```

In assume-static mode, any variable that should not be static must be declared as local or global (with the same exceptions as for assume-local mode, unless force-local mode is also in effect).

Force-local mode can be combined with assume-static mode by specifying local and then static, as shown below. This allows the function to use force-local rules but create variables as static by default.

```ahk
global MyVar := "This is global"
DemonstrateForceStatic()

DemonstrateForceStatic()
{
    local
    static
    MyVar := "This is static"
    ListVars
    MsgBox
}
```

### Operators

**x.y:** Object access
`%Var%` - If a variable is enclosed in percent signs within an expression (e.g. `%Var%`), whatever that variable contains is assumed to be the name or partial name of another variable (if there is no such variable, `%Var%` resolves to a blank string).

Creates a new object derived from another object. For example, `x := new y` is often equivalent to `x := {base: y}`. new should be followed by a variable or simple class name of the form GlobalClass.NestedClass, and optionally parameters as in `x := new y(z)`
++,-- Pre- and post-increment/decrement
`Var := ++X` increments X immediately and then assigns its value to Var.
`Var := X++` increments X only after assigning the current value of X to Var
**Note:** Due to backward compatibility, the operators ++ and -- treat blank variables as zero, but only when they are alone on a line; for example, y:=1, ++x and MsgBox % ++x both produce a blank result when x is blank.
** Power.
**Note:** Negative base with a fractional Exponent will produce an error `(-2)**0.5`Unary minus (-): Applies to a single expression (its a negative)`-(3 / -x)`. The opposite Unary positive +5 (positive 5) is ignored Logical-not (!): If the operand is blank or 0, the result of applying logical-not is 1, which means "true". Otherwise, the result is 0 (false). Bitwise-not (~): This inverts each bit of its operand. If the operand is a floating point value, it is truncated to an integer prior to the calculation Address (&): Dereference (*) -`\*Expression ` it retrieves the byte at that address as a number between 0 and 255 (0 is always retrieved if the address is 0; but any other invalid address must be avoided because it might crash the script). However, NumGet() is preferred

Multiply (\*): The result is an integer if both inputs are integers; otherwise, it is a floating point number.
True divide (/): Unlike EnvDiv, true division yields a floating point result even when both inputs are integers.
Floor divide (//): The double-slash operator uses high-performance integer division if the two inputs are integers. For example, 5//3 is 1 and 5//-3 is -1. If either of the inputs is in floating point format, floating point division is performed and the result is truncated to the nearest integer to the left
EnvDiv (/ =)- Sets a variable to itself divided by the given value. _Deprecated_: This command is not recommended for use in new scripts. Use Var := Var / Value or Var /= Value instead

EnvMult (_=) -Sets a variable to itself times the given value. Deprecated: This command is not recommended for use in new scripts. Use `Var := Var _ Value`or`Var \*= Value` instead.

Add (+)
EnvAdd (+=) -Sets a variable to the sum of itself plus the given value (can also add or subtract time from a date-time value). Synonymous with: var += value.
Subtract (-).
EnvSub (-=) Sets a variable to itself minus the given value (can also compare date-time values). Synonymous with: Var -= Value.

#### Bitwise:

Bitwise-and (`&`)
Bitwise-exclusive-or (`^`)
Bitwise-or (`|`).
Bit shift left (`<<`) and right (>>). Shift left (<<) is equivalent to multiplying Value1 by "2 to the Value2th power". Shift right (>>) is equivalent to dividing Value1 by "2 to the Value2th power" and rounding the result to the nearest integer leftward on the number line; for example, -3>>1 is -2.

#### Concatenate

(`.`) The period (dot) operator is used to combine two items into a single string (there must be at least one space on each side of the period). (See Below)
Example (expression method): `Var := "The color is " . FoundColor`
Example (traditional method): `Var = The color is %FoundColor%`

~= [v1.0.90+]: Shorthand for RegExMatch. For example, "`abc123" ~= "\d`" sets ErrorLevel to 0 and yields 4 (the position of the first numeric character). Earlier versions acted differently.

Greater (>), less (<), greater-or-equal (`>`=), and less-or-equal (<=).
Equal (=), case-sensitive-equal (`==`), and not-equal (`<>` or `!=`).
`NOT` Logical-NOT.

`AND` or `&&` logical-AND
`OR` or `||` - logical-OR
`?:` Ternary operator -This operator is a shorthand replacement for the if-else statement. It evaluates the condition on its left side to determine which of its two branches should become its final result. For example, `var := x>y ? 2 : 3` stores 2 in Var if x is greater than y; otherwise it stores 3. To enhance performance, only the winning branch is evaluated (see short-circuit evaluation in help).

Assignment
`:=`

`+=` , `-=` , `\*=` , /= , `//=` , `.=` , `|=` ,`&=` , `^=` , `>>=` , `<<=`

, Comma (multi-statement) Commas may be used to write multiple sub-expressions on a single line. This is most commonly used to group together multiple assignments or function calls. For example: x:=1, y+=2, ++index, MyFunc().
Note: A line that begins with a comma (or any other operator) is automatically appended to the line above it. See also: comma performance.

### Built in Variables (A\_\*)

- Special Characters: A_Space, A_Tab
- Script Properties: command line parameters, A_WorkingDir, A_ScriptDir, A_ScriptName, (...more...)
- Date and Time: A_YYYY, A_MM, A_DD, A_Hour, A_Min, A_Sec, (...more...)
- Script Settings: A_IsSuspended, A_BatchLines, A_ListLines, A_TitleMatchMode, (...more...)
- User Idle Time: A_TimeIdle, A_TimeIdlePhysical, A_TimeIdleKeyboard, A_TimeIdleMouse
- GUI Windows and Menu Bars: A_Gui, A_GuiControl, A_GuiEvent, A_EventInfo
- Hotkeys, Hotstrings, and Custom Menu Items: A_ThisHotkey, A_EndChar, A_ThisMenuItem, (...more...)
- Operating System and User Info: A_OSVersion, A_ScreenWidth, A_ScreenHeight, (...more...)
- Misc: A_Cursor, A_CaretX, A_CaretY, Clipboard, ClipboardAll, ErrorLevel
- Loop: A_Index, (...more...)
A_Args
A_WorkingDir
A_ScriptDir
A_ScriptName
A_ScriptFullPath
A_ScriptHwnd
A_LineNumber
A_LineFile

#### Special Characters

A_Space This variable contains a single space character. See AutoTrim for details.
A_Tab This variable contains a single tab character. See AutoTrim for details.

#### Script Properties

- **1, 2, 3, etc.** These variables are automatically created whenever a script is launched with command line parameters. They can be changed and referenced just like normal variable names (for example: %1%), but cannot be referenced directly in an expression. The variable %0% contains the number of parameters passed (0 if none). For details, see the command line parameters.
- `A_Args`Read/write: Contains an array of command line parameters. For details, see Passing Command Line Parameters to a Script.
- `A_WorkingDir` The script's current working directory, which is where files will be accessed by default. The final backslash is not included unless it is the root directory. Two examples: C:\ and C:\My Documents. Use SetWorkingDir to change the working directory.
- `A_ScriptDir` The full path of the directory where the current script is located. The final backslash is omitted (even for root directories).
- `A_ScriptName` The file name of the current script, without its path, e.g. MyScript.ahk.
- `A_ScriptFullPath` The combination of the above two variables to give the complete file specification of the script, e.g. C:\My Documents\My Script.ahk
- `A_ScriptHwnd` The unique ID (HWND/handle) of the script's hidden main window.
- `A_LineNumber` The number of the currently executing line within the script (or one of its #Include files). This line number will match the one shown by ListLines; it can be useful for error reporting such as this example: MsgBox Could not write to log file (line number %A_LineNumber%). Since a compiled script has merged all its #Include files into one big script, its line numbering may be different than when it is run in non-compiled mode.
- `A_LineFile` The full path and name of the file to which A_LineNumber belongs, which will be the same as A_ScriptFullPath unless the line belongs to one of a non-compiled script's #Include files.
- `A_ThisFunc` The name of the user-defined function that is currently executing (blank if none); for example: MyFunction. See also: IsFunc()
- `A_ThisLabel` The name of the label (subroutine) that is currently executing (blank if none); for example: MyLabel. It is updated whenever the script executes Gosub/Return or Goto. It is also updated for automatically-called labels such as timers, GUI threads, menu items, hotkeys, hotstrings, OnClipboardChange (label), and OnExit. However, A_ThisLabel is not updated when execution "falls into" a label from above; when that happens, A_ThisLabel retains its previous value. See also: A_ThisHotkey and IsLabel()
- `A_AhkVersion` In versions prior to 1.0.22, this variable is blank. Otherwise, it contains the version of AutoHotkey that is running the script, such as 1.0.22. In the case of a compiled script, the version that was originally used to compile it is reported. The formatting of the version number allows a script to check whether A_AhkVersion is greater than some minimum version number with > or >= as in this example: if A_AhkVersion >= 1.0.25.07.
- `A_AhkPath` For non-compiled scripts: The full path and name of the EXE file that is actually running the current script. For example: C:\Program Files\AutoHotkey\AutoHotkey.exe

#### For compiled scripts:

The same as the above except the AutoHotkey directory is discovered via the registry entry HKLM\SOFTWARE\AutoHotkey\InstallDir. If there is no such entry, A_AhkPath is blank.

- `A_IsUnicode` Contains 1 if strings are Unicode (16-bit) and an empty string (which is considered false) if strings are ANSI (8-bit). The format of strings depends on the version of AutoHotkey.exe which is used to run the script, or if it is compiled, which bin file was used to compile it.
- `A_IsCompiled` Contains 1 if the script is running as a compiled EXE and an empty string (which is considered false) if it is not.
- `A_ExitReason` The most recent reason the script was asked to terminate. This variable is blank unless the script has an OnExit subroutine and that subroutine is currently running or has been called at least once by an exit attempt. See OnExit for details.

#### Date and Time

- `A_YYYY` Current 4-digit year (e.g. 2004). Synonymous with A_Year. Note: To retrieve a formatted time or date appropriate for your locale and language, use FormatTime, OutputVar (time and long date) or FormatTime, OutputVar,, LongDate (retrieves long-format date).\
- `A_Year` (above)
- `A_MM` | `A_Mon` Current 2-digit month (01-12). Synonymous with
- `A_DD` | `A_MDay` Current 2-digit day of the month (01-31). Synonymous with
- `A_MMMM` Current month's full name in the current user's language, e.g. July
- `A_MMM` Current month's abbreviation in the current user's language, e.g. Jul
- `A_DDDD` Current day of the week's full name in the current user's language, e.g. Sunday
- `A_DDD` Current day of the week's abbreviation in the current user's language, e.g. Sun
- `A_WDay` Current 1-digit day of the week (1-7). 1 is Sunday in all locales.
- `A_YDay` Current day of the year (1-366). The value is not zero-padded, e.g. 9 is retrieved, not 009. To retrieve a zero-padded value, use the following: FormatTime, OutputVar,, YDay0.
- `A_YWeek` Current year and week number (e.g. 200453) according to ISO 8601. To separate the year from the week, use StringLeft, Year, A_YWeek, 4 and StringRight, Week, A_YWeek, 2. Precise definition of A_YWeek: If the week containing January 1st has four or more days in the new year, it is considered week 1. Otherwise, it is the last week of the previous year, and the next week is week 1.
- `A_Hour` Current 2-digit hour (00-23) in 24-hour time (for example, 17 is 5pm). To retrieve 12-hour time as well as an AM/PM indicator, follow this example: FormatTime, OutputVar, , h:mm:ss tt
- `A_Min`Current 2-digit minute (00-59).
- `A_Sec` Current 2-digit second (00-59).
- `A_MSec` Current 3-digit millisecond (000-999). To remove the leading zeros, follow this example: Milliseconds := A_MSec + 0.
- `A_Now`The current local time in YYYYMMDDHH24MISS format.
- `A_NowUTC` The current Coordinated Universal Time (UTC) in YYYYMMDDHH24MISS format. UTC is essentially the same as Greenwich Mean Time (GMT).
- `A_TickCount`The number of milliseconds since the computer was rebooted. By storing A_TickCount in a variable, elapsed time can later be measured by subtracting that variable from the latest A_TickCount value.

Note: Date and time math can be performed with EnvAdd and EnvSub. Also, FormatTime can format the date and/or time according to your locale or preferences.

For example:

```
StartTime := A_TickCount
Sleep, 1000
ElapsedTime := A_TickCount - StartTime
MsgBox, %ElapsedTime% milliseconds have elapsed.
```

If you need more precision than A_TickCount's 10ms, use QueryPerformanceCounter().

#### Script Settings

- `A_IsSuspended` Contains 1 if the script is suspended and 0 otherwise.
- `A_IsPaused`[v1.0.48+] Contains 1 if the thread immediately underneath the current thread is paused. Otherwise it contains 0.
- `A_IsCritical`[v1.0.48+] Contains 0 if Critical is off for the current thread. Otherwise it contains an integer greater than zero, namely the message-check frequency being used by Critical. Since Critical 0 turns off critical, the current state of Critical can be saved and restored via Old_IsCritical := A_IsCritical followed later by Critical %Old_IsCritical%.
- `A_BatchLines` (synonymous with A_NumBatchLines) The current value as set by SetBatchLines. Examples: 200 or 10ms (depending on format).
- `A_ListLines`
- [v1.1.28+] Contains 1 if ListLines is enabled. Otherwise it contains 0.
- `A_TitleMatchMode` The current mode set by SetTitleMatchMode: 1, 2, 3, or RegEx.
- `A_TitleMatchModeSpeed` The current match speed (fast or slow) set by SetTitleMatchMode.
- `A_DetectHiddenWindows` The current mode (On or Off) set by DetectHiddenWindows.
- `A_DetectHiddenText` The current mode (On or Off) set by DetectHiddenText.
- `A_AutoTrim` The current mode (On or Off) set by AutoTrim.
- `A_StringCaseSense` The current mode (On, Off, or Locale) set by StringCaseSense.
- `A_FileEncoding` [v1.0.90+]: Contains the default encoding for various commands; see FileEncoding.
- `A_FormatInteger` The current integer format (H or D) set by SetFormat. [v1.0.90+]: This may also contain lower-case h.
- `A_FormatFloat` The current floating point number format set by SetFormat.
- `A_SendMode` [v1.1.23+]: The current mode (Event, Input, Play or InputThenPlay) set by SendMode.
- `A_SendLevel` [v1.1.23+]: The current SendLevel setting (an integer between 0 and 100, inclusive).
- `A_StoreCapsLockMode` [v1.1.23+]: The current mode (On or Off) set by SetStoreCapsLockMode.
- `A_KeyDelay`
- `A_KeyDuration` The current delay or duration set by SetKeyDelay (always decimal, not hex). A_KeyDuration requires [v1.1.23+].
- `A_KeyDelayPlay`
- `A_KeyDurationPlay` The current delay or duration set by SetKeyDelay for the SendPlay mode (always decimal, not hex). Requires [v1.1.23+].
- `A_WinDelay` The current delay set by SetWinDelay (always decimal, not hex).
- `A_ControlDelay` The current delay set by SetControlDelay (always decimal, not hex).
- `A_MouseDelay`
- `A_MouseDelayPlay` The current delay set by SetMouseDelay (always decimal, not hex). A_MouseDelay is for the traditional SendEvent mode, whereas A_MouseDelayPlay is for SendPlay. A_MouseDelayPlay requires [v1.1.23+].
- `A_DefaultMouseSpeed` The current speed set by SetDefaultMouseSpeed (always decimal, not hex).
- `A_CoordModeToolTip`
- `A_CoordModePixel`
- `A_CoordModeMouse`
- `A_CoordModeCaret`
- `A_CoordModeMenu` [v1.1.23+]: The current mode (Window, Client or Screen) set by CoordMode.
- `A_RegView` [v1.1.08+]: The current registry view as set by SetRegView.
- `A_IconHidden` Contains 1 if the tray icon is currently hidden or 0 otherwise. The icon can be hidden via #NoTrayIcon or the Menu command.
- `A_IconTip` Blank unless a custom tooltip for the tray icon has been specified via Menu, Tray, Tip -- in which case it's the text of the tip.
- `A_IconFile` Blank unless a custom tray icon has been specified via Menu, tray, icon -- in which case it's the full path and name of the icon's file.
- `A_IconNumber` Blank if A_IconFile is blank. Otherwise, it's the number of the icon in A_IconFile (typically 1).

#### User Idle Time

- `A_TimeIdle` The number of milliseconds that have elapsed since the system last received keyboard, mouse, or other input. This is useful for determining whether the user is away. Physical input from the user as well as artificial input generated by any program or script (such as the Send or MouseMove commands) will reset this value back to zero. Since this value tends to increase by increments of 10, do not check whether it is equal to another value. Instead, check whether it is greater or less than another value. For example: IfGreater, A_TimeIdle, 600000, MsgBox, The last keyboard or mouse activity was at least 10 minutes ago.
- `A_TimeIdlePhysical` Similar to above but ignores artificial keystrokes and/or mouse clicks whenever the corresponding hook (keyboard or mouse) is installed; that is, it responds only to physical events. (This prevents simulated keystrokes and mouse clicks from falsely indicating that a user is present.) If neither hook is installed, this variable is equivalent to A_TimeIdle. If only one hook is installed, only its type of physical input affects `A_TimeIdlePhysical` (the other/non-installed hook's input, both physical and artificial, has no effect).
- `A_TimeIdleKeyboard` [v1.1.28+] If the keyboard hook is installed, this is the number of milliseconds that have elapsed since the system last received physical keyboard input. Otherwise, this variable is equivalent to A_TimeIdle.
- `A_TimeIdleMouse` [v1.1.28+] If the mouse hook is installed, this is the number of milliseconds that have elapsed since the system last received physical mouse input. Otherwise, this variable is equivalent to A_TimeIdle.

#### GUI Windows and Menu Bars

- `A_DefaultGui` [v1.1.23+] The name or number of the current thread's default GUI.
- `A_DefaultListView` [v1.1.23+] The variable name or HWND of the ListView control upon which the ListView functions operate. If the default GUI lacks a ListView, this variable is blank.
- `A_DefaultTreeView` [v1.1.23+] The variable name or HWND of the TreeView control upon which the TreeView functions operate. If the default GUI lacks a TreeView, this variable is blank.
- `A_Gui` The name or number of the GUI that launched the current thread. This variable is blank unless a Gui control, menu bar item, or event such as GuiClose/GuiEscape launched the current thread.
- `A_GuiControl` The name of the variable associated with the GUI control that launched the current thread. If that control lacks an associated variable, A_GuiControl instead contains the first 63 characters of the control's text/caption (this is most often used to avoid giving each button a variable name). A_GuiControl is blank whenever: 1) A_Gui is blank; 2) a GUI menu bar item or event such as GuiClose/GuiEscape launched the current thread; 3) the control lacks an associated variable and has no caption; or 4) The control that originally launched the current thread no longer exists (perhaps due to Gui Destroy).
- `A_GuiWidth`
- `A_GuiHeight` These contain the GUI window's width and height when referenced in a GuiSize subroutine. They apply to the window's client area, which is the area excluding title bar, menu bar, and borders. [v1.1.11+]: These values are affected by DPI scaling.
- `A_GuiX`
- `A_GuiY` These contain the X and Y coordinates for _GuiContextMenu_ and _GuiDropFiles_ events. Coordinates are relative to the upper-left corner of the window. [v1.1.11+]: These values are affected by DPI scaling.
- `A_GuiEvent` | `A_GuiControlEvent` The type of event that launched the current thread. If the thread was not launched via GUI action, this variable is blank. Otherwise, it contains one of the following strings:
  - **Normal**: The event was triggered by a single left-click or via keystrokes (arrow keys, TAB key, space bar, underlined shortcut key, etc.). This value is also used for menu bar items and the special events such as GuiClose and GuiEscape.
  - **DoubleClick**: The event was triggered by a double-click. Note: The first click of the click-pair will still cause a Normal event to be received first. In other words, the subroutine will be launched twice: once for the first click and again for the second.
  - **RightClick**: Occurs only for _GuiContextMenu_, _ListViews_, and _TreeViews_.

#### Context-sensitive values:

For details see _GuiContextMenu_, _GuiDropFiles_, _Slider_, _MonthCal_, _ListView_, and _TreeView_.

- `A_EventInfo`Contains additional information about the following events:
  - The OnClipboardChange label
  - Mouse wheel hotkeys (WheelDown/Up/Left/Right)
  - OnMessage()
  - RegisterCallback()
  - Regular Expression Callouts
  - GUI events, namely _GuiContextMenu_, _GuiDropFiles_, _ListBox_, _ListView_, _TreeView_, and _StatusBar_. If there is no additional information for an event, A_EventInfo contains 0.

Note: Unlike variables such as A_ThisHotkey, each thread retains its own value for A_Gui, A_GuiControl, A_GuiX/Y, A_GuiEvent, and A_EventInfo. Therefore, if a thread is interrupted by another, upon being resumed it will still see its original/correct values in these variables.

#### Hotkeys, Hotstrings, and Custom Menu Items

- `A_ThisMenuItem` The name of the most recently selected custom menu item (blank if none).
- `A_ThisMenu` The name of the menu from which A_ThisMenuItem was selected.
- `A_ThisMenuItemPos` A number indicating the current position of A_ThisMenuItem within A_ThisMenu. The first item in the menu is 1, the second is 2, and so on. Menu separator lines are counted. This variable is blank if - `A_ThisMenuItem` is blank or no longer exists within A_ThisMenu. It is also blank if A_ThisMenu itself no longer exists.
- `A_ThisHotkey` The most recently executed hotkey or non-auto-replace hotstring (blank if none), e.g. #z. This value will change if the current thread is interrupted by another hotkey, so be sure to copy it into another variable immediately if you need the original value for later use in a subroutine.

When a hotkey is first created -- either by the Hotkey command or a double-colon label in the script -- its key name and the ordering of its modifier symbols becomes the permanent name of that hotkey, shared by all variants of the hotkey.

See also: `A_ThisLabel`

- `A_PriorHotkey` Same as above except for the previous hotkey. It will be blank if none.
- `A_PriorKey` [v1.1.01+]: The name of the last key which was pressed prior to the most recent key-press or key-release, or blank if no applicable key-press can be found in the key history. All input generated by AutoHotkey scripts is excluded. For this variable to be of use, the keyboard or mouse hook must be installed and key history must be enabled.
- `A_TimeSinceThisHotkey` The number of milliseconds that have elapsed since A_ThisHotkey was pressed. It will be -1 whenever A_ThisHotkey is blank.
- `A_TimeSincePriorHotkey` The number of milliseconds that have elapsed since A_PriorHotkey was pressed. It will be -1 whenever A_PriorHotkey is blank.
- `A_EndChar` The ending character that was pressed by the user to trigger the most recent non-auto-replace hotstring. If no ending character was required (due to the \* option), this variable will be blank.

#### Operating System and User Info

- `ComSpec` [v1.0.43.08+] | `A_ComSpec` [v1.1.28+] Contains the same string as the environment's `ComSpec` variable (e.g. C:\Windows\system32\cmd.exe). Often used with Run/RunWait.
- `A_Temp` [v1.0.43.09+] The full path and name of the folder designated to hold temporary files (e.g. C:\DOCUME~1\<UserName>\LOCALS~1\Temp). It is retrieved from one of the following locations (in order): 1) the environment variables TMP, TEMP, or USERPROFILE; 2) the Windows directory.
- `A_OSType` The type of operating system being run. Since AutoHotkey 1.1 only supports NT-based operating systems, this is always WIN32_NT. Older versions of AutoHotkey return WIN32_WINDOWS when run on Windows 95/98/ME.
- `A_OSVersion` One of the following strings, if appropriate: WIN_7 [requires v1.0.90+], WIN_8 [requires v1.1.08+], WIN_8.1 [requires v1.1.15+], WIN_VISTA, WIN_2003, WIN_XP, WIN_2000.

Applying compatibility settings in the AutoHotkey executable or compiled script's properties causes the OS to report a different version number, which is reflected by A_OSVersion.

[v1.1.20+]: If the OS version is not recognized as one of those listed above, a string in the format "major.minor.build" is returned. For example, 10.0.14393 is Windows 10 build 14393, also known as version 1607.
; This example is obsolete as these operating systems are no longer supported.

```
if A_OSVersion in WIN_NT4,WIN_95,WIN_98,WIN_ME ; Note: No spaces around commas.
{
    MsgBox This script requires Windows 2000/XP or later.
    ExitApp
}
```

- `A_Is64bitOS` [v1.1.08+]: Contains 1 (true) if the OS is 64-bit or 0 (false) if it is 32-bit.
- `A_PtrSize` [v1.0.90+]: Contains the size of a pointer, in bytes. This is either 4 (32-bit) or 8 (64-bit), depending on what type of executable (EXE) is running the script.
- `A_Language` The system's default language, which is one of these 4-digit codes.
- `A_ComputerName` The name of the computer as seen on the network.
- `A_UserName` The logon name of the user who launched this script.
- `A_WinDir` The Windows directory. For example: C:\Windows
- `A_ProgramFiles` | `ProgramFiles` The Program Files directory (e.g. C:\Program Files or C:\Program Files (x86)). This is usually the same as the ProgramFiles environment variable.

On 64-bit systems (and not 32-bit systems), the following applies:
- If the executable (EXE) that is running the script is 32-bit, A_ProgramFiles returns the path of the "Program Files (x86)" directory.
- For 32-bit processes, the ProgramW6432 environment variable contains the path of the 64-bit Program Files directory. On Windows 7 and later, it is also set for 64-bit processes.
- The ProgramFiles(x86) environment variable contains the path of the 32-bit Program Files directory.

_**[v1.0.43.08+]: The A\_ prefix may be omitted, which helps ease the transition to `#NoEnv`.**_

- `A_AppData` [v1.0.43.09+] The full path and name of the folder containing the current user's application-specific data. For example: C:\Documents and Settings\Username\Application Data
- `A_AppDataCommon` [v1.0.43.09+] The full path and name of the folder containing the all-users application-specific data.
- `A_Desktop` The full path and name of the folder containing the current user's desktop files.
- `A_DesktopCommon` The full path and name of the folder containing the all-users desktop files.
- `A_StartMenu` The full path and name of the current user's Start Menu folder.
- `A_StartMenuCommon` The full path and name of the all-users Start Menu folder.
- `A_Programs` The full path and name of the Programs folder in the current user's Start Menu.
- `A_ProgramsCommon` The full path and name of the Programs folder in the all-users Start Menu.
- `A_Startup` The full path and name of the Startup folder in the current user's Start Menu.
- `A_StartupCommon` The full path and name of the Startup folder in the all-users Start Menu.
- `A_MyDocuments` The full path and name of the current user's "My Documents" folder. Unlike most of the similar variables, if the folder is the root of a drive, the final backslash is not included. For example, it would contain M: rather than M:\
- `A_IsAdmin`If the current user has admin rights, this variable contains 1. Otherwise, it contains 0.

NOTE:_**To have the script restart itself as admin (or show a prompt to the user requesting admin), use Run \*RunAs. However, note that running the script as admin causes all programs launched by the script to also run as admin. For a possible alternative, see the FAQ.**_

- `A_ScreenWidth`
- `A_ScreenHeight`

The width and height of the primary monitor, in pixels (e.g. 1024 and 768).

To discover the dimensions of other monitors in a multi-monitor system, use SysGet.

To instead discover the width and height of the entire desktop (even if it spans multiple monitors), use the following example:

```ahk
SysGet, VirtualWidth, 78
SysGet, VirtualHeight, 79
```

In addition, use SysGet to discover the work area of a monitor, which can be smaller than the monitor's total area because the taskbar and other registered desktop toolbars are excluded.

- `A_ScreenDPI` [v1.1.11+] Number of pixels per logical inch along the screen width. In a system with multiple display monitors, this value is the same for all monitors. On most systems this is 96; it depends on the system's text size (DPI) setting. See also Gui -DPIScale.
- `A_IPAddress1` through 4 The IP addresses of the first 4 network adapters in the computer.

#### Misc.

`A_Cursor`
The type of mouse cursor currently being displayed. It will be one of the following words: AppStarting, Arrow, Cross, Help, IBeam, Icon, No, Size, SizeAll, SizeNESW, SizeNS, SizeNWSE, SizeWE, UpArrow, Wait, Unknown. The acronyms used with the size-type cursors are compass directions, e.g. NESW = NorthEast+SouthWest. The hand-shaped cursors (pointing and grabbing) are classified as Unknown.

`A_CaretX`

`A_CaretY`
The current X and Y coordinates of the caret (text insertion point). The coordinates are relative to the active window unless CoordMode is used to make them relative to the entire screen. If there is no active window or the caret position cannot be determined, these variables are blank.

The following script allows you to move the caret around to see its current position displayed in an auto-update tooltip. Note that some windows (e.g. certain versions of MS Word) report the same caret position regardless of its actual position.

```
#Persistent
SetTimer, WatchCaret, 100
return
WatchCaret:
ToolTip, X%A_CaretX% Y%A_CaretY%, A_CaretX, A_CaretY - 20
return
```

#### Clipboard

- `Clipboard Read`/ `Clipboard Write`: The contents of the OS's clipboard, which can be read or written to. See the Clipboard section.
- `ClipboardAll` The entire contents of the clipboard (such as formatting and text). See ClipboardAll.
- `ErrorLevel Read/write`: See ErrorLevel.
- `A_LastError` The result from the OS's GetLastError() function or the last COM object invocation. For details, see DllCall() and Run/RunWait.
- `True` & `False` Contain 1 and 0. They can be used to make a script more readable. See Boolean Values for details.

#### Loop

- `A_Index` This is the number of the current loop iteration (a 64-bit integer). For example, the first time the script executes the body of a loop, this variable will contain the number 1. For details see Loop or While-loop.
- `A_LoopFileName`, etc. This and other related variables are valid only inside a file-loop.
- `A_LoopRegName`, etc. This and other related variables are valid only inside a registry-loop.
- `A_LoopReadLine` See file-reading loop.
- `A_LoopField` See parsing loop.

### Objects

x[y] , [a, b, c][v1.0.90+]: Member access. Get or set a value or call a method of object x, where y is a parameter list (typically an array index or key) or an expression which returns a method name.

                    [v1.0.97+]: Array literal. If the open-bracket is not preceded by a value (or a sub-expression which yields a value), it is interpreted as the beginning of an array literal. For example, [a, b, c] is equivalent to Array(a, b, c) (a, b and c are variables).See array syntax and object syntax for more details.

{a: b, c: d} = Object literal. Create an object or associative array. For example, x := {a: b} is equivalent to x := Object("a", b) or x := Object(), x.a := b. See Associative Arrays for details.

### Simple Arrays

Create an array: `Array := [Item1, Item2, ..., ItemN]` or `Array := Array(Item1, Item2, ..., ItemN)`

Retrieve an item: `Value := Array[Index]`

Assign an item: `Array[Index] := Value`

Insert one or more items at a given index: `Array.InsertAt(Index, Value, Value2, ...)`

Append one or more items: `Array.Push(Value, Value2, ...)`

Remove an item: `RemovedValue := Array.RemoveAt(Index)`

Remove the last item: `RemovedValue := Array.Pop()`

Also `Array.MinIndex(`) `Array.MaxIndex()` == `Array.Length()`

### Associative Arrays

An associative array is an object which contains a collection of unique keys and a collection of values, where each key is associated with one value. Keys can be strings, integers or objects, while values can be of any type. An associative array can be created as follows: `Array := {KeyA: ValueA, KeyB: ValueB, ..., KeyZ: ValueZ}` OR `Array := Object("KeyA", ValueA, "KeyB", ValueB, ..., "KeyZ", ValueZ)`

Using the **{key:value}** notation, quote marks are optional for keys which consist only of word characters. Any expression can be used as a key, but to use a variable as a key, it must be enclosed in parentheses. For example, `{(KeyVar): Value}` and `{GetKey(): Value}` are both valid.

Retrieve an item: `Value := Array[Key]`

Assign an item: `Array[Key] := Value`

Remove an item: `RemovedValue := Array.Delete(Key)`

Enumerating items:

```AHK
array := {ten: 10, twenty: 20, thirty: 30}
For key, value in array
    MsgBox %key% = %value%
```

### Lists (Finally!)

Very difficult to find this documented. List syntax is separated by |

But...its not a built in function, looks like its really an array

```ahk
listName =  = Ben|Ellie|Ian|Will

MsgBox % List(listName,1)
MsgBox % List(listName,2)
MsgBox % List(listName,3)
MsgBox % List(listName,4)


;*************FUNCTION***********
List(listName,integer)
{
 Loop, parse, listName, |
 {
  If (integer = A_Index) {
   returnValue := A_LoopField
  }
 }
 return returnValue
}
```

### = vs :=

```ahk
;Legacy mode [=]
vNum = 123
vString = This is a string ;Unquoted
vThisIsACopyofaVar = %myVar% ;Note percent signs

MsgBox The value in the variable named Var is %Var%.
CopyOfVar = %Var%


;Expression mode assignment :=
vNum := 123 ;the same
vString := "This is a String" ;Requires quotes
vThisIsACopyofaVar := myVar ;No Percent Signs

MsgBox % "The value in the variable named Var is " . Var . "."  ; A period is used to concatenate (join) two strings.
CopyOfVar := Var

```

for example- these are equivalent

```ahk
myvar = %A_AppData%\ICA Client\
MsgBox, %myvar%
myvar := A_AppData "\ICA Client\ "
MsgBox, %myvar%
```

**Empty strings:** To specify an empty string in an expression, use an empty pair of quotes. For example, the statement if (MyVar <> "") would be true if MyVar is not blank. However, in a traditional-if, a pair of empty quotes is treated literally. For example, the statement if MyVar = "" is true only if MyVar contains an actual pair of quotes. Thus, to check if a variable is blank with a traditional-if, use = or <> with nothing on the right side as in this example:

```ahk
vMyString :=

if (vMyString = "") {
    MsgBox, String is Blank
}
;However, this evaluates as false (there is a string value), the msgbox is not displayed.  Its actually looking for literally vMyString := "" (two double quotes)

if(vMyString = )

if Var =
```

Assigning Values is also odd:

```
MyVar =
MyVar := ""
```

Both of these store blank values. But `MyVar = ""` will store `""`.

## Control Statements

### No Case or Switch

From ManaUser on the [ArchivedAHKForums](https://autohotkey.com/board/topic/18276-switchcase-statement-for-autohotkey/)

If IsLabel("Case-" . MyVar)
Loop 1 {
Goto Case-%MyVar%
Case-A:
Send A
SoundBeep
Break
Case-B:
Send B
SoundBeep
Break
Case-C:
Send C
SoundBeep
Break
} Else {
Send X
SoundBeep
}

## Expressions

The == operator behaves identically to = except when either of the inputs is not a number, in which case == is always case sensitive and = is always case insensitive (the method of insensitivity depends on StringCaseSense). By contrast, <> and != obey StringCaseSense.

## Functions

### Optional Parameters

```ahk
Add(X, Y, Z:=0) {
    return X + Y + Z
}
```

### "From Functions" TODO Format

### Frequently-used Functions

`FileExist` Checks for the existence of a file or folder and returns its attributes.
`GetKeyState` Returns true (1) if the specified key is down and false (0) if it is up.
`InStr` Searches for a given occurrence of a string, from the left or the right.
`RegExMatch` Determines whether a string contains a pattern (regular expression).
`RegExReplace` Replaces occurrences of a pattern (regular expression) inside a string.
`StrLen` Retrieves the count of how many characters are in a string.
`StrReplace` Replaces occurrences of the specified substring with a new string.
`StrSplit` Separates a string into an array of substrings using the specified delimiters.
`SubStr` Retrieves one or more characters from the specified position in a string.
`WinActive` Checks if the specified window exists and is currently active (foremost), and returns its Unique ID (HWND).
`WinExist` Checks if a matching window exists and returns the Unique ID (HWND) of the first matching window.

#### Miscellaneous Functions

Function

Description

`Asc` Returns the numeric value of the first byte or UTF-16 code unit in the specified string.
`Chr` Returns the string (usually a single character) corresponding to the character code indicated by the specified number.
`DllCall` Calls a function inside a DLL, such as a standard Windows API function.
`Exception` Creates an object which can be used to throw a custom exception.
`FileOpen` Provides object-oriented file I/O.
`Format` Formats a variable number of input values according to a format string.
`Func` Retrieves a reference to the specified function.
`GetKeyName`/VK/SC Retrieves the name/text, virtual key code or scan code of a key.
`IsByRef` Returns a non-zero number if a ByRef parameter of a function was supplied with the specified variable.
`IsFunc` Returns a non-zero number if the specified function exists in the script.
`IsLabel` Returns a non-zero number if the specified label exists in the script.
`IsObject` Returns a non-zero number if the specified value is an object.
`ListView` Functions to add, insert, modify or delete ListView rows/colums, or to get data from them.
`NumGet` Returns the binary number stored at the specified address+offset.
`NumPut` Stores a number in binary format at the specified address+offset.
`OnMessage` Monitors a message/event.
`Ord` Returns the ordinal value (numeric character code) of the first character in the specified string.
`StrGet` Copies a string from a memory address, optionally converting it between code pages.
`StrPut` Copies a string to a memory address, optionally converting it between code pages.
`RegisterCallback` Creates a machine-code address that when called, redirects the call to a function in the script.
`TreeView` Functions to add, modify or delete TreeView items, or to get data from them.
`Trim` Trims characters from the beginning and/or end of a string.
`VarSetCapacity` Enlarges a variable's holding capacity or frees its memory.

Math

Function

Description

`Abs` Returns the absolute value of Number.
`Ceil` Returns Number rounded up to the nearest integer (without any .00 suffix).
`Exp` Returns e (which is approximately 2.71828182845905) raised to the Nth power.
`Floor` Returns Number rounded down to the nearest integer (without any .00 suffix).
`Log` Returns the logarithm (base 10) of Number.
`Ln` Returns the natural logarithm (base e) of Number.
`Max` / `Min` Returns the highest/lowest value of one or more numbers.
`Mod` Returns the remainder when Dividend is divided by Divisor.
`Round` Returns Number rounded to N decimal places.
`Sqrt` Returns the square root of Number.
`Sin` / `Cos` / `Tan` Returns the trigonometric sine/cosine/tangent of Number.
`ASin` / `ACos` / `ATan` Returns the arcsine/arccosine/arctangent in radians

## Specific Tips and Tricks

### Run as Admin

NOTE:_**To have the script restart itself as admin (or show a prompt to the user requesting admin), use Run \*RunAs. However, note that running the script as admin causes all programs launched by the script to also run as admin. For a possible alternative, see the FAQ.**_

or this:

```ahk
; check if running as administrator, then if not, try and restart as admin,

full_command_line := DllCall("GetCommandLine", "str")

if not (A_IsAdmin or RegExMatch(full_command_line, " /restart(?!\S)"))
{
    try
    {
        if A_IsCompiled
            Run *RunAs "%A_ScriptFullPath%" /restart
        else
            Run *RunAs "%A_AhkPath%" /restart "%A_ScriptFullPath%"
    }
    ExitApp, 1
}


;Debug Remove
MsgBox A_IsAdmin: %A_IsAdmin%`nCommand line: %full_command_line%
```

## Other Things

### MsgBox

MsgBox, Text
MsgBox, Options, Title, Text, Timeout

Options
0x0 Ok
0x1 Ok, Cancel
0x2 Abort, Retry, Ignore
0x3 Yes, No, Cancel
0x4 Yes, No
0x5 Retry, Cancel
0x6 Cancel, Try Again, Continue
Icons
0x10 Hand (Stop)
0x20 Question
0x30 Exclaimation
0x40 Info button
Default Button
0x000\* 1st (implied)
0x100 2nd Button
0x200 3rd Button
0x300 4th Button (Only present with Help)
Modality
0x0000 Default (?)
0x1000 System (ALways on Top)
0x2000 Task (?)
0x40000 System (Sans Icon)
Other
0x4000 Help Button
0x80000 Right Justified
0x100000 Right to Left Reading Order

    0x100000    Right to Left Reading Order
    0x80000     Right Justified
    0x40000     System Modality (Sans Icon)
    0x20000
    0x10000
    0x8000
    0x4000      Help Button
    0x2000      Task (?) Modality
    0x1000      System Modality     (ALways on Top)
    0x800
    0x400
        0x300       4th Button (Only present with Help)
    0x200       3rd Button Default
    0x100       2nd Button Default
    0x80
    0x40        Info button
        0x30    Exclaimation
    0x20        Question
    0x10        Hand (Stop)
    0x8
        0x5     Retry,  Cancel
    0x4         Yes,    No
        0x3     Yes,    No,     Cancel
    0x2         Abort,  Retry,  Ignore
    0x1         Ok,     Cancel
    0x0         Ok
