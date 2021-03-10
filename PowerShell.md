# PowerShell

[[TOC]]

## Settings

Brings up the command browser in command line
`SHOW-COMMAND`
`SHOW-COMMAND`
`SHOW-COMMAND`
`SHOW-COMMAND`
`SHOW-COMMAND`


## Common Examples:
```powershell
# Three ways to filter sets.
Get-ChildItem . -File | select -First 1 | foreach -Process { $_.Extension}
Get-ChildItem . -File | where -Property Extension -EQ -Value ".zip"
Get-ChildItem . -File | select -First 1 | select -Property Extension
#take out select -first for the whole set
#this does not work, though examples suggest it should
 Get-ChildItem .  -Include '*.zip' -File


Write-Warning -Message "Folder ``$(gl).Path`' is not empty as expected."
#backtick = escape. "" allows substitutions '' does not, its literal
```
## References:

[Getting Started with Powershell](https://docs.microsoft.com/en-us/powershell/scripting/powershell-scripting)


[Powershell Basics](https://www.comparitech.com/net-admin/powershell-cheat-sheet/)
[Powershell Docs](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-powershell-1.0/ee176842(v=technet.10))
[MoreRecentDocs](https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-6)

[Powershell Objects to Manage Windows](https://docs.microsoft.com/en-us/powershell/windows/get-started?view=win10-ps)



Modules

Microsoft.Powershell.
- [.Archive](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/?view=powershell-6)
- [.Core](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/?view=powershell-6)
- [.Diagnostics](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.diagnostics/?view=powershell-6)
- [.Host](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.host/?view=powershell-6)
- [.Management](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/?view=powershell-6)
- [.utility](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/?view=powershell-6)

[Microsoft.WSMan.Management](https://docs.microsoft.com/en-us/powershell/module/microsoft.wsman.management/?view=powershell-6)
[.Management](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/?view=powershell-6)
[PackageManagement](https://docs.microsoft.com/en-us/powershell/module/packagemanagement/?view=powershell-6)

[SS64](https://ss64.com/ps/)

[There is a powershell web access in Windows 2012,](https://docs.microsoft.com/en-us/powershell/scripting/components/web-access/install-and-use-windows-powershell-web-access?view=powershell-6#to-install-windows-powershell-web-access-by-using-windows-powershell-cmdlets)

[Online Module Browser](https://docs.microsoft.com/en-us/powershell/module/)

[Modules and Commands](https://docs.microsoft.com/en-us/powershell/windows/get-started?view=win10-ps)

[Special Modules?](https://docs.microsoft.com/en-us/powershell/module/dataprotectionmanager/?view=systemcenter-ps-2016)
[Microsoft Modules](https://docs.microsoft.com/en-us/powershell/module/?view=win10-ps)
[https://www.powershellgallery.com/](https://www.powershellgallery.com/)

### Basic Commands

`Get-Command | Format-List *`

`Out-Gridview` to get the nice interactive view


`Show-Command`

Use the Get-Command item to search, can get pretty detailed.

```
# PowerShell script to research parameters
Get-Command | Where { $_.parameters.keys -Contains "Filter" -And $_.Verb -Match "Get"}

# Research PowerShell Get-Childitem Parameters
Get-Help Get-Childitem -Full

#Module Browser
Import-Module PowerShellGet

#Install-Module ISEModuleBrowserAddon
Import-Module ISEModuleBrowserAddon
```

### Profile

### Common Parameters (Global)

SHORT DESCRIPTION
    Describes the parameters that Windows PowerShell Workflow adds to activities.
LONG DESCRIPTION
    Windows PowerShell Workflow adds the activity common parameters to activities that are derived from the  PSActivity base class. This category includes the InlineScript activity and Windows PowerShell cmdlets  that are implemented as activities, such as Get-Process and Get-WinEvent.
    The activity common parameters are not valid on the `Suspend-Workflow` and `Checkpoint-Workflow` activities and they are not added to cmdlets or expressions that Windows PowerShell Workflow automatically runs in an InlineScript script block or similar activity. The activity common parameters are available on the InlineScript activity, but not on commands in the
    InlineScript script block.

        Several of the activity common parameters are also workflow common parameters or Windows PowerShell common parameters. Other activity common parameters are unique to activities.
    For information about the workflow common parameters, see about_WorkflowCommonParameters. For information about the Windows PowerShell common parameters, see `about_CommonParameters`.

 LIST OF ACTIVITY COMMON PARAMETERS
    AppendOutput                      PSDebug
    Debug                             PSDisableSerialization
    DisplayName                       PSDisableSerializationPreference
    ErrorAction                       PSError
    Input                             PSPersist
    MergeErrorToOutput                PSPort
    PSActionRetryCount                PSProgress
    PSActionRetryIntervalSec          PSProgressMessage
    PSActionRunningTimeoutSec         PSRemotingBehavior
    PSApplicationName                 PSRequiredModules
    PSAuthentication                  PSSessionOption
    PSCertificateThumbprint           PSUseSSL
    PSComputerName                    PSVerbose
    PSConfigurationName               PSWarning
    PSConnectionRetryCount            Result
    PSConnectionRetryIntervalSec      UseDefaultInput
    PSConnectionURI                   Verbose
    PSCredential                      WarningAction

See more with : `Get-Help about_WorkflowCommonParameters -online`



### My Profiles
```
#$Profile.CurrentUserAllHosts
Write-Host -ForegroundColor Black 'Loading $Profile.CurrentUserAllHosts  [Location] C:\Users\andyt\Documents\WindowsPowerShell\profile.ps1'

# Store previous command's output in $__ (Double Underscore)
$PSDefaultParameterValues['Out-Default:OutVariable'] = '__'


Write-Host -ForegroundColor Black 'Setting $WarningPreference = "Inquire"'
$WarningPreference = "Inquire"

Write-Host -ForegroundColor Black 'Setting $InformationPreference = 'Continue' Default = "SilentlyContinue'
$InformationPreference = 'Continue'

Write-Host -ForegroundColor Black 'Setting $VerbosePreference = 'Continue' Default = "SilentlyContinue'
$VerbosePreference = 'Continue'

Write-Host -ForegroundColor Black 'Setting $DebugPreference = 'Continue' Default = "SilentlyContinue'
$DebugPreference = 'Continue'

#add an alias
New-Alias -Name WO -Value "Where-Object" -Scope Global

#open other profiles with ISE $profile.CurrentUserAllHosts

#Record all powershell sessions.
Start-Transcript -OutputDirectory $($env:OneDrive | join-path -ChildPath \Programming\Powershell\Transcipts)
```


```
# Store previous command's output in $__
Write-Host -ForegroundColor Black 'Loading $Profile.CurrentUserCurrentHost (Powershell Console) [Location] C:\Users\andyt\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1'


Write-Host -ForegroundColor GREEN 'Store previous command''s output in $__'
$PSDefaultParameterValues['Out-Default:OutVariable'] = '__'
Import-Module posh-git
Import-Module oh-my-posh
set-Theme paradox
```

```
#AllUsersCurrentHost
Write-Host -ForegroundColor Black 'Loading $PROFILE.AllUsersCurrentHost  [Location] C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1'

```

```
# All Users All Hosts File

Write-Host -ForegroundColor Black 'Loading $Profile.AllUsersAllHosts [Location] C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1'
```

## Automatic Variables 

$$	Contains the last token in the last line received by the session.
$?	Contains the execution status of the last operation. Equivalent to %errorlevel% in the CMD shell. See also $LastExitCode below.
It contains TRUE if the last operation succeeded and FALSE if it failed. ReadOnly, AllScope
$^	Contains the first token in the last line received by the session.
$_	Contains the current object in the pipeline object. You can use this variable in commands that perform an action on every object or on selected objects in a pipeline.
$Allnodes	This variable is available inside of a DSC configuration document when configuration data has been passed into it by using the -ConfigurationData parameter.
For more information, see "Separating Configuration and Environment Data"
$Args	Contains an array of the undeclared parameters and/or parameter values that are passed to a function, script, or script block. When you create a function, you can declare the parameters by using the param keyword or by adding a comma-separated list of parameters in parentheses after the function name.
$ConsoleFileName	Contains the path of the console file (.psc1) that was most recently used in the session. This variable is populated when you start PowerShell with the PSConsoleFile parameter or when you use the Export-Console cmdlet to export snap-in names to a console file.

When you use the Export-Console cmdlet without parameters, it automatically updates the console file that was most recently used in the session. You can use this automatic variable to determine which file will be updated.
ReadOnly, AllScope

$Error	Contains an array of error objects that represent the most recent errors. Constant
The most recent error is the first error object in the array ($Error[0]). Function to unwrap the error array via Idera.
$Event	Contains a PSEventArgs object that represents the event that is being processed. This variable is populated only within the Action block of an event registration command, such as Register-ObjectEvent. The value of this variable is the same object that the Get-Event cmdlet returns. Therefore, you can use the properties of the $Event variable, such as $Event.TimeGenerated , in an Action script block.
$EventArgs	Contains an object that represents the first event argument that derives from EventArgs of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the SourceEventArgs property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$EventSubscriber	Contains a PSEventSubscriber object that represents the event subscriber of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable is the same object that the Get-EventSubscriber cmdlet returns.
$ExecutionContext	Contains an EngineIntrinsics object that represents the execution context of the Windows PowerShell host. You can use this variable to find the execution objects that are available to cmdlets. Constant, AllScope
$False	Contains FALSE. You can use this variable to represent FALSE in commands and scripts instead of using the string "false". The string can be interpreted as TRUE if it is converted to a non-empty string or to a non-zero integer. Constant, AllScope
$ForEach	Contains the enumerator of a ForEach-Object loop. You can use the properties and methods of enumerators on the value of the $ForEach variable. This variable exists only while the For loop is running. It is deleted when the loop is completed.
$Home	Contains the full path of the user's home directory. ReadOnly, AllScope This variable is the equivalent of the %HomeDrive%%HomePath% environment variables, typically C:\Users\<user>
$Host	Contains an object that represents the current host application for Windows PowerShell. You can use this variable to represent the current host in commands or to display or change the properties of the host, such as $Host.version or $Host.CurrentCulture, or $host.ui.rawui.setbackgroundcolor("Red"). Constant, AllScope
$Input	An enumerator that contains the input that is passed to a function. The $Input variable is case-sensitive and is available only in functions and in script blocks. (Script blocks are essentially unnamed functions.) In the Process block of a function, the $Input variable contains the object that is currently in the pipeline. When the Process block is completed, the value of $Input is NULL. If the function does not have a Process block, the value of $Input is available to the End block, and it contains all the input to the function.
$LastExitCode	Contains the exit code of the last Windows-based program that was run.
$Matches	The $Matches variable works with the -match and -not match operators. When you submit scalar input to the -match or -notmatch operator, and either one detects a match, they return a Boolean value and populate the $Matches automatic variable with a hash table of any string values that were matched. For more information about the -match operator, see about_comparison_operators.
$MyInvocation	Contains an object with information about the current command, such as a script, function, or script block. You can use the information in the object, such as the path and file name of the script ($myinvocation.mycommand.path) or the name of a function ($myinvocation.mycommand.name) to identify the current command. See also $PSScriptRoot
$NestedPromptLevel	Contains the current prompt level. A value of 0 indicates the original prompt level. The value is incremented when you enter a nested level and decremented when you exit it. For example, Windows PowerShell presents a nested command prompt when you use the $Host.EnterNestedPrompt method. Windows PowerShell also presents a nested command prompt when you reach a breakpoint in the Windows PowerShell debugger. When you enter a nested prompt, Windows PowerShell pauses the current command, saves the execution context, and increments the value of the $NestedPromptLevel variable. To create additional nested command prompts (up to 128 levels) or to return to the original command prompt, complete the command, or type "exit". The $NestedPromptLevel variable helps you track the prompt level. You can create an alternative Windows PowerShell command prompt that includes this value so that it is always visible.
$NULL	Contains a NULL or empty value. A scalar value that contains nothing.
$OFS	$OFS is a special variable that stores a string that you want to use as an output field separator. Use this variable when you are converting an array to a string. By default, the value of $OFS is " ", but you can change the value of $OFS in your session, by typing $OFS="value". If you are expecting the default value of " " in your script, module, or configuration output, be careful that the $OFS default value has not been changed elsewhere in your code.
$PID	Contains the process identifier (PID) of the process that is hosting the current Windows PowerShell session. Constant, AllScope
If you stop this process, you will brute force kill the PowerShell host that is executing the script.
$Profile	Contains the full path of the Windows PowerShell profile for the current user and the current host application. You can use this variable to represent the profile in commands. For example, you can use it in a command to determine whether a profile has been created: test-path $profile Or, you can use it in a command to create a profile: new-item -type file -path $pshome -force You can also use it in a command to open the profile in Notepad: notepad $profile
$PSBoundParameters	Contains a dictionary of the active parameters and their current values. This variable has a value only in a scope where parameters are declared, such as a script or function. You can use it to display or change the current values of parameters or to pass parameter values to another script or function. For example: function test { param($a, $b) # Display the parameters in dictionary format. $psboundparameters # Call the Test1 function with $a and $b. test1 @psboundparameters }
$PsCmdlet	Contains an object that represents the cmdlet or advanced function that is being run. You can use the properties and methods of the object in your cmdlet or function code to respond to the conditions of use. For example, the ParameterSetName property contains the name of the parameter set that is being used, and the ShouldProcess method adds the WhatIf and Confirm parameters to the cmdlet dynamically. For more information about the $PSCmdlet automatic variable, see about_Functions_Advanced.
$PSCommandPath	Contains the full path and file name of the script that is being run. This variable is valid in all scripts.
$PsCulture	Contains the name of the culture currently in use in the operating system. The culture determines the display format of items such as numbers, currrency, and dates. This is the value of the System.Globalization.CultureInfo.CurrentCulture.Name property of the system. To get the System.Globalization.CultureInfo object for the system, use Get-Culture. ReadOnly, AllScope
$PSDebugContext	While debugging, this variable contains information about the debugging environment. Otherwise, it contains a NULL value. As a result, you can use it to indicate whether the debugger has control. When populated, it contains a PsDebugContext object that has Breakpoints and InvocationInfo properties. The InvocationInfo property has several useful properties, including the Location property. The Location property indicates the path of the script that is being debugged.
$PsHome	Contains the full path of the installation directory for Windows PowerShell, Constant, AllScope
Typically, %windir%\System32\WindowsPowerShell\v1.0
You can use this variable in the paths of Windows PowerShell files. For example, the following command searches the conceptual Help topics for the word "variable": select-string -pattern variable -path $pshome\*.txt
$PSitem	Represents the current input object, this is exactly the same as $_ it just provides an alternative name to make your pipeline code easier to read. Available in PowerShell 3.0 and greater.
$PSScriptRoot	Contains the directory from which the script module is being executed. This variable allows scripts to use the module path to access other resources. In PowerShell 3.0+ this is available everywhere, not just in modules.
$PSSenderInfo	Contains information about the user who started the PSSession, including the user identity and the time zone of the originating computer. This variable is available only in PSSessions.
The $PSSenderInfo variable includes a user-configurable property, ApplicationArguments, which, by default, contains only the $PSVersionTable from the originating session. To add data to the ApplicationArguments property, use the ApplicationArguments parameter of the New-PSSessionOption cmdlet.
$PsUICulture	Contains the name of the user interface (UI) culture that is currently in use in the operating system. The UI culture determines which text strings are used for user interface elements, such as menus and messages. This is the value of the System.Globalization.CultureInfo.CurrentUICulture.Name property of the system. To get the System.Globalization.CultureInfo object for the system, use Get-UICulture. ReadOnly, AllScope
$PsVersionTable	Contains a read-only hash table (Constant, AllScope) that displays details about the version of PowerShell that is running in the current session. The table includes the following items:
  CLRVersion          The version of the common language runtime (CLR)
  BuildVersion        The build number of the current version
  PSVersion           The Windows PowerShell version number
  WSManStackVersion      The version number of the WS-Management stack
  PSCompatibleVersions   Versions of PowerShell that are compatible with the current version.
  SerializationVersion   The version of the serialization method
  PSRemotingProtocolVersion  The version of the PowerShell remote management protocol
$Pwd	Contains a path object that represents the full path of the current directory.
$Sender	Contains the object that generated this event. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the Sender property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$ShellID	Contains the identifier of the current shell. Constant, AllScope
$SourceArgs	Contains objects that represent the event arguments of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the SourceArgs property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$SourceEventArgs	Contains an object that represents the first event argument that derives from EventArgs of the event that is being processed. This variable is populated only within the Action block of an event registration command. The value of this variable can also be found in the SourceArgs property of the PSEventArgs (System.Management.Automation.PSEventArgs) object that Get-Event returns.
$StackTrace	Contains a stack trace for the most recent error.
$This	In a script block that defines a script property or script method, the $This variable refers to the object that is being extended.
$True	Contains TRUE. You can use this variable to represent TRUE in commands and scripts. Constant, AllScope


### Settings

These are the built in variables for powershell.  There uses are unknown in many cases, but esp. those at the end seem like they could be powerful.
These are worth further investigation

```ps1
$env:
$HKCU:
$HKLM:
$Variable:
$Function:
$Alias
$WSMan:
$cert
$Global:
$Local:
$Private:
$Script:
```

`${Variable:$}` Not sure what this does but it popped up in ISE.

`Get-ChildItem Env:` produces a list of all the variables.  Likewise, `gci Variable:` spits out a list of all the variables.  Note the lack of `$` and presence of `:`.

```ps1
PS >>> gci Variable:
        Name                           Value
        ----                           -----
        $                              Env: #this was Variable the next timew.  Maybe its the last object
        ?                              True
        ^                              gci
        args                           {}
        ConfirmPreference              High
        ConsoleFileName
        DebugPreference                SilentlyContinue
        Error                          {Cannot find path 'O:\Portable\Env' because it does not exist., Cannot find path 'O:\Portable\Variable' because it does not exist., System.Management.Automat...
        #likewise  {The term 'Variable:' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included,
        ErrorActionPreference          Continue
        ErrorView                      NormalView
        ExecutionContext               System.Management.Automation.EngineIntrinsics
        false                          False
        FormatEnumerationLimit         4
        HOME                           C:\Users\andyt
        Host                           System.Management.Automation.Internal.Host.InternalHost
        InformationPreference          SilentlyContinue
        input                          System.Collections.ArrayList+ArrayListEnumeratorSimple
        MaximumAliasCount              4096
        MaximumDriveCount              4096
        MaximumErrorCount              256
        MaximumFunctionCount           4096
        MaximumHistoryCount            4096
        MaximumVariableCount           4096
        MyInvocation                   System.Management.Automation.InvocationInfo
        NestedPromptLevel              0
        null
        OutputEncoding                 System.Text.SBCSCodePageEncoding
        PID                            24584
        profile                        C:\Users\andyt\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1
        ProgressPreference             Continue
        PSBoundParameters              {}
        PSCommandPath                  C:\Users\andyt\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1
        PSCulture                      en-US
        PSDefaultParameterValues       {}
        PSEdition                      Desktop
        PSEmailServer
        PSHOME                         C:\Windows\System32\WindowsPowerShell\v1.0
        psISE                          Microsoft.PowerShell.Host.ISE.ObjectModelRoot
        PSScriptRoot                   C:\Users\andyt\Documents\WindowsPowerShell
        PSSessionApplicationName       wsman
        PSSessionConfigurationName     http://schemas.microsoft.com/powershell/Microsoft.PowerShell
        PSSessionOption                System.Management.Automation.Remoting.PSSessionOption
        PSUICulture                    en-US
        psUnsupportedConsoleApplica... {wmic, wmic.exe, cmd, cmd.exe...}
        PSVersionTable                 {PSVersion, PSEdition, PSCompatibleVersions, BuildVersion...}
        PWD                            O:\Portable
        ShellId                        Microsoft.PowerShell
        StackTrace                        at System.Management.Automation.Provider.CmdletProvider.GetContentReader(String path, CmdletProviderContext cmdletProviderContext)...
        true                           True
        VerbosePreference              Continue
        VHD                            Microsoft.Vhd.PowerShell.VirtualHardDisk
        WarningPreference              Stop
        WhatIfPreference               False
$ast
PS>>> $cursorColumn
PS>>> $ExecutionContext
    Host           : System.Management.Automation.Internal.Host.InternalHost
    Events         : System.Management.Automation.PSLocalEventManager
    InvokeProvider : System.Management.Automation.ProviderIntrinsics
    SessionState   : System.Management.Automation.SessionState
    InvokeCommand  : System.Management.Automation.CommandInvocationIntrinsics
PS>>> $Host
    Name             : Windows PowerShell ISE Host
    Version          : 5.1.17763.134
    InstanceId       : b66af481-400e-4007-8826-25bd10a6a7aa
    UI               : System.Management.Automation.Internal.Host.InternalHostUserInterface
    CurrentCulture   : en-US
    CurrentUICulture : en-US
    PrivateData      : Microsoft.PowerShell.Host.ISE.ISEOptions
    DebuggerEnabled  : True
    IsRunspacePushed : False
    Runspace         : System.Management.Automation.Runspaces.LocalRunspace
PS>>> $PSCommandPath
PS>>> $psISE
    CurrentPowerShellTab         : Microsoft.PowerShell.Host.ISE.PowerShellTab
    CurrentFile                  : Microsoft.PowerShell.Host.ISE.ISEFile
    CurrentVisibleHorizontalTool :
    CurrentVisibleVerticalTool   : Microsoft.PowerShell.Host.ISE.ISEAddOnTool
    Options                      : Microsoft.PowerShell.Host.ISE.ISEOptions
    PowerShellTabs               : {PowerShell 1}
PS>>> $PSSessionOption
    MaximumConnectionRedirectionCount : 5
    NoCompression                     : False
    NoMachineProfile                  : False
    ProxyAccessType                   : None
    ProxyAuthentication               : Negotiate
    ProxyCredential                   :
    SkipCACheck                       : False
    SkipCNCheck                       : False
    SkipRevocationCheck               : False
    OperationTimeout                  : 00:03:00
    NoEncryption                      : False
    UseUTF16                          : False
    IncludePortInSPN                  : False
    OutputBufferingMode               : None
    MaxConnectionRetryCount           : 5
    Culture                           :
    UICulture                         :
    MaximumReceivedDataSizePerCommand :
    MaximumReceivedObjectSize         : 209715200
    ApplicationArguments              :
    OpenTimeout                       : 00:03:00
    CancelTimeout                     : 00:01:00
    IdleTimeout                       : -00:00:00.0010000
PS>>> $psUnsupportedConsoleApplications
    wmic
    wmic.exe
    cmd
    cmd.exe
    diskpart
    diskpart.exe
    edit.com
    netsh
    netsh.exe
    nslookup
    nslookup.exe
    powershell
    powershell.exe
    ssh-keygen
    ssh-keygen.exe
PS>>> $PSVersionTable
    Name                           Value
    ----                           -----
    PSVersion                      5.1.17763.134
    PSEdition                      Desktop
    PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
    BuildVersion                   10.0.17763.134
    CLRVersion                     4.0.30319.42000
    WSManStackVersion              3.0
    PSRemotingProtocolVersion      2.3
    SerializationVersion           1.1.0.1
PS>>> $StackTrace
    at System.Management.Automation.CommandDiscovery.LookupCommandInfo(String commandName, CommandTypes commandTypes, SearchResolutionOptions searchResolutionOptions, CommandOrigin commandOrigi
    n, ExecutionContext context)
    at System.Management.Automation.CommandDiscovery.LookupCommandProcessor(String commandName, CommandOrigin commandOrigin, Nullable`1 useLocalScope)
    at System.Management.Automation.ExecutionContext.CreateCommand(String command, Boolean dotSource)
    at System.Management.Automation.PipelineOps.AddCommand(PipelineProcessor pipe, CommandParameterInternal[] commandElements, CommandBaseAst commandBaseAst, CommandRedirection[] redirections,
    ExecutionContext context)
    at System.Management.Automation.PipelineOps.InvokePipeline(Object input, Boolean ignoreInput, CommandParameterInternal[][] pipeElements, CommandBaseAst[] pipeElementAsts, CommandRedirection
    [][] commandRedirections, FunctionContext funcContext)
    at System.Management.Automation.Interpreter.ActionCallInstruction`6.Run(InterpretedFrame frame)
    at System.Management.Automation.Interpreter.EnterTryCatchFinallyInstruction.Run(InterpretedFrame frame)
PS>>> $tokens
$VerboseHelpErrors
```
mimi	Main Effects and Interactions in Mixed and Incomplete Data

## Basics

The Program is stored in C:\Windows\System32\WindowsPowerShell\v1.0

[C:\Windows\System32\WindowsPowerShell\v1.0](C:\)

These are the general data sources for Powershell

```ps1
Get-PSProvider

Name                 Capabilities                                         Drives
----                 ------------                                         ------
Registry             ShouldProcess, Transactions                          {HKLM, HKCU}
Alias                ShouldProcess                                        {Alias}
Environment          ShouldProcess                                        {Env}
FileSystem           Filter, ShouldProcess, Credentials                   {A, B, C, D...}
Function             ShouldProcess                                        {Function}
Variable             ShouldProcess                                        {Variable}
```
PowerShell includes a set of built-in providers that you can use to access the different types of data stores.

| Provider    | Drive        | Data store                                 |
| ----------- | ------------ |
| Alias       | Alias:       | PowerShell aliases                         |
| Certificate | Cert:        | x509 certificates for digital signatures   |
| Environment | Env:         | Windows environment variables              |
| FileSystem  | (*)          | File system drives, directories, and files |
| Function    | Function:    | PowerShell functions                       |
| Registry    | HKLM:, HKCU: | Windows registry                           |
| Variable    | Variable:    | PowerShell variables                       |
| WSMan       | WSMan:       | WS-Management configuration information    |


### Syntax

Things take the general format `verb-noun`.

Variables are marked with a `$` as in `$myVariable`. They are *NOT* Case sensitive.

```Powershell
$a=5
$a
> 5
$A = 6
$a
> 6
```
#### Hash Tables

[Hash Tables](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_hash_tables?view=powershell-6)


### Data Types

Encountered so far

- String - [String]
- String[] (Array) [String[]]
- int32 [Int32]
- 32bit int array `int32[]` - [int32[]]
- 64 bit int - `int64`  [int64]
- `int64[]` - [int64[]]
- [DateTime]
- [Boolean]
- [Switch]
- `long` [Long]
- `long[]`, (array) [Long[]]
- [Single], array [single[]]
-
        2 + 3.1
            5.1
        (2). GetType().FullName
            System.Int32
        (2 + 3.1).GetType().FullName
            System.Double
        (512MB).GetType().FullName
            System.Int32
        (512MB * 512MB).GetType().FullName
            System.Double

        ([int32]::minvalue + [uint32]::maxvalue).gettype().fullname
             System.Int64

#### Casting Types

Cast with [Type] or as (obj).method()

        PS > ([int]($v / 1000)).ToString()
        3

Check they type with obj.GetType()

    Really its (obj).method().field to check the type.

        !!!example As shown below:
                PS> (([int]($v / 1000)).ToString()).GetType()

                IsPublic IsSerial Name                      BaseType
                -------- -------- ----                      --------
                True     True     String                    System.Object

                PS > (([int]($v / 1000)).ToString()).GetType().FullName()
                Method invocation failed because [System.RuntimeType] does not contain a method named 'FullName'.
                At line:1 char:1
                + (([int]($v / 1000)).ToString()).GetType().FullName()
                + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                    + CategoryInfo          : InvalidOperation: (:) [], RuntimeException
                    + FullyQualifiedErrorId : MethodNotFound


                PS> (([int]($v / 1000)).ToString()).GetType().FullName
                System.String

(([int]($v / 1000)).ToString()).GetType().FullName

Plus there are Objects

#### Boolean

!!!note -confirm looks like this `-Confirm:$false`

In Powershell True must be given as `$True` and False as `$False`

```ps1
PS>  function test ($VALUE) {
>> if ($VALUE) {
>>     Write-Host -ForegroundColor GREEN “TRUE”
>> } else {
>>     Write-Host -ForegroundColor RED   “FALSE”
>> }
>> }
>>
PS> test $TRUE
TRUE
PS> test $FALSE
FALSE
PS> test TRUE
TRUE
PS> test FALSE
TRUE
```

The question a lot of PowerShell newbies ask is:  ‘Why is “FALSE” TRUE?”   In PowerShell, Strings can be evaluated as Booleans.  If a string is ZERO length – it is false, otherwise it is TRUE.  “FALSE” has 5 characters so it is TRUE.

So any value string (non-NULL) evaluates true.

Also, `"0"` evaluates to $True, since its a string, but only exactly numerical 0 is $false

```ps1
PS> test “0”
TRUE
PS> test 0
FALSE
PS> test 1
TRUE
PS> test 0.0
FALSE
PS> test 0x0
FALSE
PS> test 0mb
FALSE
PS> test 0kb
FALSE
PS> test 0D
FALSE
PS> test 0.00000001
TRUE
PS>
```

“0” is TRUE because it is a STRING and it has a length of 1.  0 is FALSE because it is a number and that number is 0.  In PowerShell, any number which evaluates to 0 is FALSE and every non-zero number is TRUE.  The example shows you a floating point zero, a hexadecimal zero, 0 megs, 0 kilos, 0 decimal, there are all sorts of zeros but to PowerShell, they all evaluate to FALSE.


#### Math

[Math Documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arithmetic_operators?view=powershell-6)

#### Strings

Backtick is the escape character:

```ps1
        PS>[int]$r = $a.Rank
        PS>"`$a rank: $r"
    $a rank: 1
```

##### String Formatting

[SS64.com doc](https://ss64.com/ps/syntax-f-operator.html)
[See My Code in the Invoke-Webrequest for Examples](#Get-a-web-file-(like-curl))

-f Format operator
Format a string expression.

Syntax:
       "String with placeholders" -f "Array of values to place into the placeholders"

       'Filename: {0} Created: {1}' -f $_.fullname,$_.creationtime

       "{I,A:FS} {I,A:FS} {I,A:FS}.." -f "string0", "string1", "string2"...
Place {0} {1} etc. into the string as placemarkers where you want the variables to appear, immediately follow the string with the -f operator and then lastly, a list of comma separated variables/objects which will be used to populate the placemarkers.

Key:
   I   Index of the item to display, 0,1,2 etc.
   A   Alignment.
       A positive number will right align n characters.
       A negative number will left align n characters.
        so {2,-25} will allocate 25 characters of horizontal space on the line, even if the string is only 1 character long.
   FS  An optional Format String that acts on the item depending on its type (not case sensitive).

       Valid format strings:
            :c - Currency format (for the current culture)
            :d - Padded. (:dP precision=number of digits); if needed, leading zeros are added to the beginning of the (whole) number.
            :e - Scientific (exp) notation
            :f - Fixed point
            :f5 = fix to 5 places
            :g - Most compact format, fixed or sci
            :g5 = 5 significant digits
            :n - Number (:nP precision=number of decimal places), includes culture separator for thousands 1,000.00
            :p - Percentage
            :r - Reversible Precision
            :x - Hex format
            :hh
            :mm
            :ss - Convert a DateTime to a 2 digit Hour/minute/second
            "{0:hh}:{0:mm}"
            :HH - Hour in 24 Hour format
            :dd - Day of Month
            :ddd - Convert a DateTime to Day of the Week
            :dddd - Full name of Day of Week
            :yyyy - Full year
            # - Digit Place Holder


Some of these letters `(:d, :D, :f, :F, :g, :G and :r, :R)` also perform double duty as date patterns which can lead to some confusion.
When applied to a date they will act as date patterns and they are then case sensitive: Full list of Date Formats
The -f format string can be surrounded by either single or double quotes.

Static text or more complex expressions may be included before or in-between the -f {format strings}
The -F operator has equal precedence with Arithmetic operators, * / % + - etc, see About_Operator_Precedence
When operators have equal precedence, PowerShell evaluates them from left to right.

Examples:

Display a number to 3 decimal places:

        PS C:\> "{0:n3}" -f 123.45678
        123.457

Right align the first number only:

        PS C:\>"{0,10}" -f 4,5,6
                4

Left and right align text:

        PS C:\> "|{0,-10}| |{1,10}|" -f "hello", "world"
        |hello     ||     world|

Display an integer with 3 digits:

        PS C:\> "{0:n3}" -f [int32]12
        012

  Another:

        $n = 1

        Do{
            $str = "{0,2:d2}" -f $n
            Write-Output $str
            $n++

        }while($n -le 60 )

Separate a number with dashes (# digit place holder):

        PS C:\> "{0:###-##-##}" -f 1234567
        123-45-67

Create a list of 100 names with a padded suffix no. (Name001 → Name100):

        1..100 | % { 'Name{0:d3}' -f $_ }

Convert a number to Hex:

        PS C:\> "{1,10} {0,10} {2,10:x}" -f "First", "Second", 255
            Second     First        FF

Display filenames and creation time:

PS C:\> Get-ChildItem c:\docs | ForEach-Object {'Filename: {0} Created: {1}' -f
        $_.fullname,$_.creationtime}

Display only the Year from a date time value:

        PS C:\> "{0:yyyy}" -f (Get-Date)
        2018

Display the hours and minutes from a date time value:
        PS C:\> "{0:hh}:{0:mm}" -f (Get-Date)
        17:52

Reverse the order of display:

        PS C:\> "{2} {1,-10} {0:n3}" -f [math]::pi, "world", "hello"
        hello world 3.142

Display a number as a percentage:

        S C:\> "{0:p0}" -f 0.5
        50%

Display a whole number padded to 5 digits:

        S C:\> "{0:d5}" -f 123
        00123

##### Quoting, Multiple Lines

[Quoting Rules](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-6)

###### Single vs. Double Quotes

Short Answer - Double Quotes - Evaluated, Single Quotes - Literal

```ps1
#Double Quotes
PS> $i = 5
PS> "The value of $i is $i."
    The value of 5 is 5.
PS> "The value of $(2+3) is 5."
    The value of 5 is 5.

#Single Quotes
PS> 'The value of $i is $i.'
    The value $i is $i.
PS>'The value of $(2+3) is 5.'
    The value of $(2+3) is 5.
```
Quoting Quotes:

```ps1
#To make double-quotation marks appear in a string, enclose the entire string in single quotation marks. For example:
PS>'As they say, "live and learn."'
As they say, "live and learn."

#You can also enclose a single-quoted string in a double-quoted string. For example:
PS>"As they say, 'live and learn.'"
As they say, 'live and learn.'

#Or, double the quotation marks around a double-quoted phrase. For example:
PS>"As they say, ""live and learn."""
As they say, "live and learn."

#To include a single quotation mark in a single-quoted string, use a second consecutive single quote. For example:
PS> 'don''t'
#don't  #this had to be escaped for linting
```
##### String Actions

`get-member -InputObject String`

`[String] | gm` also works.

Methods:


- `Clone` - System.Object Clone(), System.Object ICloneable.Clone()
- `CompareTo` - int CompareTo(System.Object value), int CompareTo(string strB), int IComparable.CompareTo(System.Object obj), int IComparable[string].CompareTo(string other)
- `Equals` - bool Equals(System.Object obj), bool Equals(string value), bool Equals(string value, System.StringComparison comparisonType), bool IEquatable[string].Equals(string other)
- `GetEnumerator` - System.CharEnumerator GetEnumerator(), System.Collections.IEnumerator IEnumerable.GetEnumerator(), System.Collections.Generic.IEnumerator[char] IEnumerable[char].GetEnumerator()
- `GetHashCode` - int GetHashCode()
- `GetType` - type GetType()
- `GetTypeCode` - System.TypeCode GetTypeCode(), System.TypeCode IConvertible.GetTypeCode()
- `IndexOf` - int IndexOf(char value), int IndexOf(char value, int startIndex), int IndexOf(string value), int IndexOf(string value, int startIndex), int IndexOf(string value, int startIndex, int count), int IndexOf(string value, System.StringComparison ... 
- `IndexOfAny` - int IndexOfAny(char[] anyOf), int IndexOfAny(char[] anyOf, int startIndex), int IndexOfAny(char[] anyOf, int startIndex, int count)
- `Insert` - string Insert(int startIndex, string value)
- `IsNormalized` - bool IsNormalized(), bool IsNormalized(System.Text.NormalizationForm normalizationForm)
- `LastIndexOf` - int LastIndexOf(char value), int LastIndexOf(char value, int startIndex), int LastIndexOf(string value), int LastIndexOf(string value, int startIndex), int LastIndexOf(string value, int startIndex, int count), int LastIndexOf(string value, ... 
- `LastIndexOfAny` - int LastIndexOfAny(char[] anyOf), int LastIndexOfAny(char[] anyOf, int startIndex), int LastIndexOfAny(char[] anyOf, int startIndex, int count)
- `Normalize` - string Normalize(), string Normalize(System.Text.NormalizationForm normalizationForm)
- `PadLeft` - string PadLeft(int totalWidth), string PadLeft(int totalWidth, char paddingChar)
- `PadRight` - string PadRight(int totalWidth), string PadRight(int totalWidth, char paddingChar)
- `Remove` - string Remove(int startIndex, int count), string Remove(int startIndex)
- `Replace` - string Replace(char oldChar, char newChar), string Replace(string oldValue, string newValue)
- `Split` - string[] Split(Params char[] separator), string[] Split(char[] separator, int count), string[] Split(char[] separator, System.StringSplitOptions options), string[] Split(char[] separator, int count, System.StringSplitOptions options), strin... 
- `StartsWith` - bool StartsWith(string value), bool StartsWith(string value, System.StringComparison comparisonType), bool StartsWith(string value, bool ignoreCase, cultureinfo culture)
- `Substring` - string Substring(int startIndex), string Substring(int startIndex, int length)
- `ToBoolean` - bool IConvertible.ToBoolean(System.IFormatProvider provider)
- `ToByte` - byte IConvertible.ToByte(System.IFormatProvider provider)
- `ToChar` - char IConvertible.ToChar(System.IFormatProvider provider)
- `ToCharArray` - char[] ToCharArray(), char[] ToCharArray(int startIndex, int length)
- `ToDateTime` - datetime IConvertible.ToDateTime(System.IFormatProvider provider)
- `ToDecimal` - decimal IConvertible.ToDecimal(System.IFormatProvider provider)
- `ToDouble` - double IConvertible.ToDouble(System.IFormatProvider provider)
- `ToInt16` - int16 IConvertible.ToInt16(System.IFormatProvider provider)
- `ToInt32` - int IConvertible.ToInt32(System.IFormatProvider provider)
- `ToInt64` - long IConvertible.ToInt64(System.IFormatProvider provider)
- `ToLower` - string ToLower(), string ToLower(cultureinfo culture)
- `ToLowerInvariant` - string ToLowerInvariant()
- `ToSByte` - sbyte IConvertible.ToSByte(System.IFormatProvider provider)
- `ToSingle` - float IConvertible.ToSingle(System.IFormatProvider provider)
- `ToString` - string ToString(), string ToString(System.IFormatProvider provider), string IConvertible.ToString(System.IFormatProvider provider)
- `ToType` - System.Object IConvertible.ToType(type conversionType, System.IFormatProvider provider)
- `ToUInt16` - uint16 IConvertible.ToUInt16(System.IFormatProvider provider)
- `ToUInt32` - uint32 IConvertible.ToUInt32(System.IFormatProvider provider)
- `ToUInt64` - uint64 IConvertible.ToUInt64(System.IFormatProvider provider)
- `ToUpper` - string ToUpper(), string ToUpper(cultureinfo culture)
- `ToUpperInvariant` - string ToUpperInvariant()
- `Trim` - string Trim(Params char[] trimChars), string Trim()
- `TrimEnd` - string TrimEnd(Params char[] trimChars)
- `TrimStart` - string TrimStart(Params char[] trimChars)


Properties:

- `Chars` - char Chars(int index) {get;}
- `Length` - int Length {get;}


###### Split

Use then .split() command.



        $uri = "https://cdn3.iconfinder.com/data/icons/outlined-electronic-components/108/electronicparts_nocolors-"
        $uri.split('/')
        >   https:

            cdn3.iconfinder.com
            data
            icons
            outlined-electronic-components
            108
            electronicparts_nocolors-

        $whole_uri.Split('/')[2]
        > cdn3.iconfinder.com

Use array indexing to get a particular one.

Same as `ConvertFrom-String` cmdlet. 

`ConvertFrom-String`  Extracts and parses structured properties from string content.
    
Syntax:  

        ConvertFrom-String [-InputObject] <String> [-Delimiter <String>] [-PropertyNames <String[]>] [<CommonParameters>]
        
        ConvertFrom-String [-InputObject] <String> [-IncludeExtent] [-TemplateContent <String[]>] [-TemplateFile <String[]>] [-UpdateTemplate] [<CommonParameters>]
    
    
DESCRIPTION
The ConvertFrom-String cmdlet extracts and parses structured properties from string content. This cmdlet generates an object by parsing text from a traditional text stream. For each string in the pipeline, the cmdlet splits the input by either a delimiter or a parse 

expression, and then assigns property names to each of the resulting split elements. You can provide these property names; if you do not, they are automatically generated for you.

The cmdlet's default parameter set, **ByDelimiter** , splits exactly on the regular expression delimiter. It does not perform quote matching or delimiter escaping as the Import-Csv cmdlet does.

The cmdlet's alternate parameter set, TemplateParsing , generates elements from the groups that are captured by a regular expression.

This cmdlet supports two modes: basic delimited parsing, and automatically-generated, example-driven parsing.

Delimited parsing, by *default,* _splits the input at white space,_ and assigns property names to the resulting groups. You can customize the delimiter by piping the ConvertFrom-String results into one of the Format- cmdlets, or you can use the Delimiter* parameter.

The cmdlet also supports automatically-generated, example-driven parsing based on the FlashExtract, research work by Microsoft Research (http://research.microsoft.com/en-us/um/people/sumitg/flashextract.html).

See `get-help ConvertFrom-String -examples`

1-This command generates an object with default property names, P1 and P2. The results are P1="Hello" and P2="World".

    PS C:\>"Hello World" | ConvertFrom-String

    P1    P2
    --    --
    Hello World

1a-The command generates one object with properties P1, P2; both properties are of 'string' type, by default.

    PS C:\>"Hello World" | ConvertFrom-String | Get-Member


       TypeName: System.Management.Automation.PSCustomObject

    Name        MemberType   Definition
    ----        ----------   ----------
    Equals      Method       bool Equals(System.Object obj)
    GetHashCode Method       int GetHashCode()
    GetType     Method       type GetType()
    ToString    Method       string ToString()
    P1          NoteProperty string P1=Hello
    P2          NoteProperty string P2=World


Example 2: Generate an object with default property names using a delimiter - This command generates an object with P1="He" and P2="o World" properties, by specifying the 'll' in Hello  as the delimiter.

    PS C:\>"Hello World" | ConvertFrom-String -Delimiter "ll"

    P1 P2
    -- --
    He o World

  Example 3: Generate an object that contains two named properties.  This command generates an object that contains two properties: - FirstWord , with value "Hello" - SecondWord , with value "World"

    PS C:\>"Hello World" | ConvertFrom-String -PropertyNames FirstWord, SecondWord

    FirstWord SecondWord
    --------- ----------
    Hello     World

Example 4: Use an expression as the value of the TemplateContent parameter, save the results in a variable.

This command uses an expression as the value of the TemplateContent parameter. The expression is saved in a variable for simplicity. Windows PowerShell understands now that the string that is used on the pipeline to ConvertFrom-String has three properties: - Name - phone - age  
    Each line in the input is evaluated by the sample matches; if the line matches the examples given in the pattern, values are extracted and passed to the output variable defined.

    $template = @'
    {Name*:Phoebe Cat}, {phone:425-123-6789}, {age:6}
    {Name*:Lucky Shot}, {phone:(206) 987-4321}, {age:12}
    '@

    $testText = @'
    Phoebe Cat, 425-123-6789, 6
    Lucky Shot, (206) 987-4321, 12
    Elephant Wise, 425-888-7766, 87
    Wild Shrimp, (111)  222-3333, 1
    '@

    $testText  |
        ConvertFrom-String -TemplateContent $template -OutVariable PersonalData |
        Out-Null

    Write-output ("Pet items found: " + ($PersonalData.Count))
    $PersonalData
    

    Pet items found: 4

    Name          phone           age
    ----          -----           ---
    Phoebe Cat    425-123-6789    6
    Lucky Shot    (206) 987-4321  12
    Elephant Wise 425-888-7766    87
    Wild Shrimp   (111)  222-3333 1
    
The sample data, `$template` , provides two different phone formats: -  425-123-6789
    
    -  (206) 987-4321


And, two different age formats:
    -  6

    -  12

This implies that phones like (206) 987 4321 will not be recognized, because there's no sample data that matches that pattern (there's no hyphen between the three digit sequence and the four digit sequence). Similar with 3 or more digit ages, they will not be recognized.        


Example 5: Specifying data types to the generated properties 
    This is the same example as No. 4, above; the only differences are in the pattern string that includes a data type for each desired property. Notice the difference in alignment for the age column between both examples.

    $template = @'
    {[string]Name*:Phoebe Cat}, {[string]phone:425-123-6789}, {[int]age:6}
    {[string]Name*:Lucky Shot}, {[string]phone:(206) 987-4321}, {[int]age:12}
    '@

    $testText = @'
    Phoebe Cat, 425-123-6789, 6
    Lucky Shot, (206) 987-4321, 12
    Elephant Wise, 425-888-7766, 87
    Wild Shrimp, (111)  222-3333, 1
    '@

    $testText  |
        ConvertFrom-String -TemplateContent $template -OutVariable PersonalData | Out-Null
    
    Write-output ("Pet items found: " + ($PersonalData.Count))
    $PersonalData


    Pet items found: 4

    Name          phone           age
    ----          -----           ---
    Phoebe Cat    425-123-6789      6
    Lucky Shot    (206) 987-4321   12
    Elephant Wise 425-888-7766     87
    Wild Shrimp   (111)  222-3333   1

###### Escape

Uses backtick [[`]]

```ps1
#To force PowerShell to interpret a double quotation mark literally, use a backtick character. This prevents PowerShell from interpreting the quotation mark as a string delimiter. For example:
PS>"Use a quotation mark (`") to begin a string."

#This doesn't work with single quotes (literal)
PS> PS C:\> 'Use a quotation mark (`') to begin a string.'
#Unexpected token ')' in expression or statement.
#At line:1 char:27
#+ 'Use a quotation mark (`') <<<<  to begin a string.'
```

And backslash [[`\`]]

See [Here-Strings](#Here-Strings-(Multi-Line)) below

```ps1
ConvertFrom-StringData @"
Vincentio = Heaven doth with us as we with torches do,\nNot light them for themselves; for if our virtues\nDid not go forth of us, 'twere all alike\nAs if we had them not.
Angelo = Let there be some more test made of my metal,\nBefore so noble and so great a figure\nBe stamp'd upon it.
"@ | Format-List

Name  : Angelo

Value : Let there be some more test made of my metal,
        Before so noble and so great a figure
        Be stamp'd upon it.

Name  : Vincentio
Value : Heaven doth with us as we with torches do,
        Not light them for themselves; for if our virtues
        Did not go forth of us, 'twere all alike
        As if we had them not.


```

###### Here-Strings (Multi-Line)

The appropriate thing to use are [Here-Strings](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-6#here-strings) for:

- Text that contains literal quotation marks
- Multiple lines of text, such as the text in an HTML or XML
- The Help text for a script or function document

```ps1
C:\PS> $string = @"
Msg1 = Type "Windows".
Msg2 = She said, "Hello, World."
Msg3 = Enter an alias (or "nickname").
Msg4 = $msg
"@

#msg4 would be replaced with the value of $msg
```
Single Quote Rules (Literal Interpretation) and Double-Quoted (Substitution) rules still apply to `here-strings`

Used for multiline values like XML or HTTP headers

```ps1
$page = [XML] @"
<command:command xmlns:maml="http://schemas.microsoft.com/maml/2004/10"
xmlns:command="http://schemas.microsoft.com/maml/dev/command/2004/10"
xmlns:dev="http://schemas.microsoft.com/maml/dev/2004/10">
<command:details>
        <command:name>
               Format-Table
        </command:name>
        <maml:description>
            <maml:para>Formats the output as a table.</maml:para>
        </maml:description>
        <command:verb>format</command:verb>
        <command:noun>table</command:noun>
        <dev:version></dev:version>
</command:details>
...
</command:command>
"@
```

To read the values- use [ConvertFrom-StringData](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/convertfrom-stringdata?view=powershell-6) command

```ps1
$TextMsgs = DATA {
ConvertFrom-StringData @'
Text001 = The $Notebook variable contains the name of the user's system notebook.
Text002 = The $MyNotebook variable contains the name of the user's private notebook.
'@
}
$TextMsgs.Text001

The $Notebook variable contains the name of the user's system notebook.

$TextMsgs.Text002

The $MyNotebook variable contains the name of the user's private notebook.
```
Because the text includes variable names, it must be enclosed in a single-quoted string so that the variables are interpreted literally and not expanded. Variables are not permitted in the DATA section.

```ps1

ConvertFrom-StringData "Message=Look in c:\\Windows\\System32"
Name                           Value
----                           -----
Message                        Look in c:\Windows\System32
```


### Operators

[about_Assignment_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_assignment_operators?view=powershell-6)

[about_Operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-6)


| Operator | Description                        | Example                      |
| -------- | ---------------------------------- | ---------------------------- |
| +        | Adds integers; concatenates        | 6 + 2                        |
|          | strings, arrays, and hash tables.  | "file" + "name"              |
|          |                                    | @(1, "one") + @(2.0, "two")  |
|          |                                    | @{"one" = 1} +  @{"two" = 2} |
| -        | Subtracts one value from another   | 6 - 2                        |
|          | value                              |                              |
| -        | Makes a number a negative number   | -6                           |
|          |                                    | (Get-Date).AddDays(-1)       |
| *        | Multiply numbers or copy strings   | 6 * 2                        |
|          | and arrays the specified number    | @("!") * 4                   |
|          | of times.                          | "!" * 3                      |
| /        | Divides two values.                | 6 / 2                        |
| %        | Modulus - returns the remainder of | 7 % 2                        |
|          | a division operation.              | .                            |
| -band    | Bitwise AND                        | 5 -band 3                    |
| -bnot    | Bitwise NOT                        | -bnot 5                      |
| -bor     | Bitwise OR                         | 5 -bor 0x03                  |
| -bxor    | Bitwise XOR                        | 5 -bxor 3                    |
| -shl     | Shifts bits to the left the        | 102 -shl 2                   |
|          | specified number of times          |                              |
| -shr     | Shifts bits to the right           | 102 -shr 2                   |


| The bitwise operators only work on integer types.


Rounding is like this: (note parentheses)

        PS A:\icons\scraping\166> [Int]2001/1000
        2.001

        PS A:\icons\scraping\166> [int]2001/1000
        2.001

        PS A:\icons\scraping\166> [Int] ((2001) `/` (1000))
        2

You can use the [Math] class to get different rounding behavior.

TABLE 5

```ps1
[int][Math]::Round(5 / 2,[MidpointRounding]::AwayFromZero)	#3
[int][Math]::Ceiling(5 / 2)	#3
[int][Math]::Floor(5 / 2)	#2
```
For more information, see the Math.Round method.

Overloaded __add__

Expression	Result
"file" + 16	       file16
$array + 16	      1,2,3,16
$array + "file"   1,2,3,file
$array * 2	     1,2,3,1,2,3
"file" * 3       filefilefile

Because the method that is used to evaluate statements is determined by the leftmost object, addition and multiplication in PowerShell are not strictly commutative. For example, (a + b) does not always equal (b + a), and (ab) does not always equal (ba).

The following examples demonstrate this principle:

        Expression	Result
        "file" + 16	file16
        16 + "file"	Cannot convert value "file" to type "System.Int32".
        Error: "Input string was not in a correct format."
        At line:1 char:1
        + 16 + "file"`

### Comparison Operators and Comparing Objects

!!!Note -  (merged Sections) Same topic **Comparison Operators** and **Comparing Objects**

[PowerShell Reference](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-6)

- `-lt`- Less Than
- `-gt`- Greater Than
- `-ge`- Greater than or equal
- `-le`- Less than or equal
- `-like`
- `-eq`- Equal
- `-ne`- not Equal

- `-match`
- `-notmatch`
- `-like`
- `-notlike`

- `-in`
- `-notin`
- `-contains`
- `-notcontains`

- `-is`
- `-isNot`
- `-as` - converts the input to e.g. `[DateTime]`


Use comparison operators (`-eq`, `-ne`, `-gt`, `-lt`, `-le`, `-ge`) to compare values and test conditions. For example, you can compare two string values to determine whether they are equal.

The comparison operators also include operators that find or replace patterns in text. The (`-match`, `-notmatch`, `-replace`) operators use regular expressions, and (`-like`, `-notlike`) use wildcards *.

Containment comparison operators determine whether a test value appears in a reference set (`-in`,` -notin`, `-contains`, `-notcontains`).

Bitwise comparison operators (`-bAND`, `-bOR`, `-bXOR`, `-bNOT`) manipulate the bit patterns in values.

#### Examples of Comparisons

```powershell
[PS]> $property.Name
armsvc

[PS]> $property -eq "armsvc"
False

[PS]> $property.Name -eq "armsvc"
True
```

An object has implicit methods as well.

```ps1
 $msg = Get-WinEvent -ProviderName "Microsoft-Windows-DistributedCOM"  | Where-Object {$_.Id -eq 10016}  |  Select-Object -ExpandProperty Message
   $i = 0

    for ($i=0 ; $i -lt $msg.Count ; $i++) {

        #iterate through each message
        $propertyNames = @(1,2,3,4,5,6,7,'Scope','Type',10,11,12,13,14,15,16,17,'CLSID',19,20,'APPID',22,23,24,'USER','USER2',27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54)
        $propertySelect = @('Scope','Type','CLSID','APPID','USER','USER2')
        $pmsg = $msg[$i]|  ConvertFrom-String -PropertyNames $propertynames | Select-Object -Property $propertySelect
```

### Other Operators

- `( )` - Grouping Expression operator
- `$( )` - SubExpression operator
- `::` - Static member operator
- `@( )` - Array SubExpression operator.
- `,` - Comma operator
- `&` - Call operator
- `.` Dot sourcing operator
- `-f` Format operator
- `..` Range Operator
- Other Symbols (Not Necessarily Operators)
    - `#`- Line Comments
    - `<#` and `#>` Block comments
    - `$`  Variable Indicator
    - `$_` Recent variable Place Holder
    - `$var[index]` Array Accessor 
    - `|` The Pipe Operator 
    - `*` WildCard Operator
    - `[]var` Cast Type Operator 
    - `%` The ForEach Alias
    - `?` The Where-Object Alias
    - `'` Literal String Marker 
    - ``( ` )``The Escape Character


[Ref](https://ss64.com/ps/syntax-operators.html)



#### Grouping Expression operator `( )`

`( )`

Parenthesis/Brackets work just as they do in mathematics, each pair will determine the order of evaluation and return the result of the expression within.
PS C:\> (2 + 3) * 5

A shortcut syntax is available (…).property that returns a single property from an item or a collection (PowerShell V3.0):

`PS C:\> (dir).FullName`

To *return multiple properties, pipe to* `ForEach-Object` `(%)` or `Select-Object`

Simple Parenthesis will also evaluate variable assignments - displaying the value(s).
for example:

        $msg = "Hello World"
        "$msg"
        can be rewritten as:
        ($msg = "Hello World")


#### SubExpression operator `$( )` 

`$( )` 

Use a subexpression to return specific properties of an object.
Unlike simple parenthesis, a subexpression can contain multiple ; semicolon ; separated ; statements.

The output of each statement contributes to the output of the subexpression. For a single result, it will return a scalar. For multiple results, it will return an array.
Subexpressions allow you to evaluate and act on the results of an expression in a single line; with no need for an intermediate variable:

        if($(code that returns a value/object) -eq "somevalue") { do_something }

        PS C:\> $city="Copenhagen"
        PS C:\> $strLength = "$($city.length)" #n.b. not "$city.length" that would return "Copenhagen.Length"

        PS C:\> "The result of 2 + 3 = $(2+3)"
        PS C:\> $(Get-WMIObject win32_Directory)

#### `@( )` - Array SubExpression operator.

`@( )`

- An array subexpression behaves just like a subexpression except that it **guarantees that the output will be an array.**
- This works **even if there is no output at all** (gives an empy array.)
- If the result is a scalar value then the result will be a single element array containg the scalar value.
- (If the output is already an array then the use of an array subexpression will have no effect, it won't wrap one array inside of another array.)

        `PS C:\> @(Get-WMIObject win32_logicalDisk)`

!!!Note Using either `$( )` or` @( )` will cause the powershell parser to re-evaluate the parsing mode based on the first non-whitespace character inside the parenthesis. A neat effect of this is that object properties will be evaluated instead of being treated as literal strings:

        "$user.department" ==> JDOE.department
        "$($user.department)" ==> "Human Resources"

##### `::` - Static member operator

Call the static properties operator and methods of a .NET Framework class.
To find the static properties and methods of an object, use the -Static parameter of Get-Member:

        [datetime] | gm -static
        [datetime]::now
        [datetime]::Utcnow

#### `,` - Comma operator

- As a _binary_ operator, the comma creates an array.
- As a _unary_ operator, the comma creates an array with one member. Place the comma before the member.

[See Arrays](#arrays)

#### `&` - Call operator

Run a command, script, or script block. The call operator, also known as the "invocation operator," lets you run commands that are stored in variables and represented by strings. **Because the call operator does not parse the command, it cannot interpret command parameters.**

        C:\PS> $c = "get-executionpolicy"
        C:\PS> $c
        get-executionpolicy
        C:\PS> & $c
        AllSigned

#### `.` Dot sourcing operator

Run a script in the current scope so that any functions, aliases, and variables that the script creates are added to the current scope. (**without dot sourcing, the variables created within a script will all disappear when the script finishes.**)

        . C:\sample1.ps1
        . .\sample2.ps1

!!!Note: The dot sourcing operator is followed by a space. Use the space to distinguish the dot from the dot (.) symbol that represents the current directory.

#### `-f` Format operator

[Format a string expression](#String-Formatting).

Place `{0} {1}` etc. into the string as placemarkers where you want the variables to appear, immediately follow the string with the `-f` operator and then lastly, the list of comma separated variables which will be used to populate the placemarkers.

        Get-ChildItem c:\ | ForEach-Object {'File {0} Created {1}' -f $_.fullname,$_.creationtime}

Optional format string(s) can be included to add padding/alignment and display dates/times/percentages/hex etc correctly, see the -f format page for full details.

        ..Range operator
        Produce a sequence of numbers:

        10..20
        5..25

#### `..` Range Operator

`$B = 5..8` - $B contains: 5, 6, 7, and 8.   [See Arrays](#arrays)


#### Others

##### `$` Variable Indicator or Symbol Indicator

##### `$_` placeHolder Symbol 

    Need a more correct description of this.

##### Comments

Comments are marked with `#`.

Block comments start with `<#` and end with `#>`.

##### Array Accessor 

$var[index]

$a[-1]

##### `%` For Each, For, Where

##### `|` The Pipe Operator 


##### `*` WildCard Operator


To get all commands in the session, type:

`Get-Command *`

This list includes external commands in your search path so it can contain thousands of items. It is more useful to look at a reduced set of commands.

!!!Note  The asterisk (`*`) is used for wildcard matching in PowerShell command arguments. The `* `means *"match one or more of any characters".* 

    You can type `Get-Command a*` to find all commands that begin with the letter "a". Unlike wildcard matching in cmd.exe, PowerShell's wildcard will also match a period.


##### `[]var` Cast Type Operator 

    See [Casting Types](#Casting-Types)

#### `%` The ForEach Alias

see `Get-Alias`

```ps1
    PS>$a = 1, 2, 3
    PS>$a.Clear()
    PS>$a | % { $null -eq $_ }
True
```

ForEach-Object has two aliases, `ForEach` and`%`, and also supports shorthand syntax beginning in PowerShell 3.0. The following three examples are identical in function.

```powershell
Get-WMIObject Win32_LogicalDisk | ForEach-Object {$_.FreeSpace}
Get-WMIObject Win32_LogicalDisk | ForEach {$_.FreeSpace}
Get-WMIObject Win32_LogicalDisk | % FreeSpace
```


##### `?` The Where-Object Alias

also `WO` 

Need more


##### `'` Literal String Marker 

Single Quote

##### `"` Evaluated String Marker 

Need the real name for this, but double quote vars are accessable.


##### ``( ` )``The Escape Character

Double Quotes - Evaluated, Single Quotes - Literal

## Arrays

To create an array named $A that contains the seven numeric (int) values of 22, 5, 10, 8, 12, 9, and 80, type:

        $A = 22,5,10,8,12,9,80

You can also create and initialize an array by using the range operator `(..)`. For example, to create and initialize an array named "$B" that contains the values 5 through 8, type:

`$B = 5..8` - $B contains: 5, 6, 7, and 8.

When no data type is specified, PowerShell creates each array as an **object array (type: `System.Object[]`).** To determine the data type of an array, use the `GetType()` method.

        $a.GetType()

To create a strongly typed array, that is, an array that can contain only values of a particular type, cast the variable as an array type, such as `string[]`, `long[]`, or `int32[]` or to create a strongly typed array of process objects, enter the following command:

        [int32[]]$intArray = 1500,2230,3350,4000
        [Diagnostics.Process[]]$zz = Get-Process

My own example... should have checked here first.

        [int32[]]$colors = @(0x000000, 0x111111, 0x222222, 0x333333, 0x444444, 0x555555, 0x666666, 0x777777, 0x888888, 0x99999, 0xAAAAAA, 0xBBBBBB, 0xCCCCCC, 0xDDDDDD, 0xEEEEEE, 0xFFFFFF)

You can use the _array operator_ to create an array of zero or one object.

        PS> $a = @("Hello World")
        PS> $a.Count
    1
        PS> $b = @()
        PS> $b.Count
    0

#### Arrays of zero or one

Beginning in Windows PowerShell 3.0, a collection of zero or one object has the Count and Length property. Also, you can index into an array of one object. This feature helps you to avoid scripting errors that occur when a command that expects a collection gets fewer than two items.

```ps1
#Zero objects
    PS>$a = $null
    PS>$a.Count
0
    PS>$a.Length
0
#One object
    PS>$a = 4
    PS>$a.Count
1
    PS>$a.Length
1
    PS>$a[0]
4
    PS>$a[-1]
4
```

!!!Note: The array operator is particularly useful in scripts when you are getting objects, but do not know how many objects you will get. For example:

        $p = @(Get-Process Notepad)

#### Properties of arrays


`Count` - which is really an alias of `Length` or `LongLength` if the array contains more than **2,147,483,647** elements.

```ps1
        $a = 0..9
        $a.Count
    10
        $a.Length
    10
```

`Rank` - Returns the number of dimensions in the array. Most arrays in PowerShell have one dimension, only. Even when you think you are building a multidimensional array; like the following example:

```ps1
        PS>$a = @(
            @(0,1),
            @("b", "c"),
            @(Get-Process)
        )

        PS>[int]$r = $a.Rank
        PS>"`$a rank: $r"
    $a rank: 1
```

!!!Note Note the use of backtick to escape a character.

Building a truly multidimensional array, in PowerShell, requires the assistance of the .Net Framework. Like in the following example:

```ps1
    PS>[int[,]]$rank2 = [int[,]]::new(5,5)
    PS>$rank2.rank
2
```

`Clear` Sets all element values to the default value of the array's element type. The Clear() method does not reset the size of the array.

```ps1
    PS>$a = 1, 2, 3
    PS>$a.Clear()
    PS>$a | % { $null -eq $_ }
True
True
True
    PS>[int[]] $intA = 1, 2, 3
    PS>$intA.Clear()
    PS>$intA
0
0
0

```
#### Reading an Array

0 indexed

Use the Range operator `..`

**inclusive**  - includes the last item

```ps1
        PS>$a = 1..5
        PS>$a
    1
    2
    3
    ...
        PS>$a[1]
    2
        PS>$a[0..2]
    1
    2
    3
    2
```

Negative numbers count from the end of the array. For example, "-1" refers to the last element of the array. To display the last three elements of the array, in index ascending order, type:

```ps1
        PS>$a = 0 .. 9
        PS>$a[-3..-1]
    7, 8, 9
```

!!!info I will show the arrays straight across from here on to save space.

If you type negative indexes in descending order, your output changes.

```ps1
        PS>$a = 0 .. 9
        PS>$a[-1..-3]
    9, 8, 7
```

The notation cycles from the end boundary to the beginning of the array.

```ps1
        PS>$a = 0 .. 9
        PS>$a[2..-2]
    2, 1, 0, 9, 8
```

You can use the plus operator (+) to combine a ranges with a list of elements in an array.

```ps1
        PS>$a[+0..2+4..6+8]
    0, 1, 2, 4, 5, 6, 8
```

#### Iterations over array elements

(and) [For Each](#ForEach-Object)

## Loops in PS

[about_For](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_for?view=powershell-6)

[about_Foreach](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_foreach?view=powershell-6)

[about_While](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_while?view=powershell-6)

[Break]()



### For Loop

[Source](https://www.business.com/articles/powershell-for-loop/)

_Syntax-_ `for (init; condition; repeat)`
             `{command_block}`

_Key_
   **init** - Commands, separated by commas, to run before the loop begins. Typically used to initialize a variable with a starting value.

   **condition** If this evaluates to TRUE the for loop {command_block} runs when the loop has run once the condition is evaluated again

   **repeat** Commands, separated by commas, to run each time the loop repeats.

_Examples:_

```powershell
$text = Get-Content($env:USERPROFILE + "\Documents\someBigFile.txt")
$pattern = "*some text"
For($i=0; $i -lt $text.Length; $i++){
    if($text[$i] -like $pattern){
        "line $i contains '"$pattern'""
    }
}
```

I am not entirely sure what the example is doing with the quotes.  The for loop has the standard syntax.  (declaration, comparison, iteration)-> `for($i=0; $i -lt 10; $i++){"$i"}`

Watch the loop with `Set-PSDebug -Trace 2`.

```powershell
For ($i=0; $i -le 10; $i++) {
    "10 * $i = " + (10 * $i)
    }

$colors = @("Red","Orange","Yellow","Green","Blue","Indigo","Violet")
For ($i=0; $i -lt $colors.Length; $i++) {
    $colors[$i]
    }

    $a = 0..9
for ($i = 0; $i -le ($a.length - 1); $i += 2) {
  $a[$i]
}
```

### While, Do-While, Do-Until

 `While` and `Do-While` loops are both used to perform an action while the condition evaluates to `$true`, and differ only in their syntax. `Do-Until` loops have similar syntax to `Do-While`, but stop processing once the condition statement is met.

```powershell
while($true){
    if(Test-Path ($env:USERPROFILE | "\temp.file")){
        Break
    } else {
        Start-Sleep -Seconds 30
    }
}

##The following are the 3 formats
$i=1
Do {
    $i
    $i++
    }
While ($i -le 10)

#this is equivalent to the above
$i=1
Do {
    $i
    $i++
    }
Until ($i -gt 10)

#also equivalent
$i=1
While ($i -le 10){
    $i
    $i++
    }

#Using Break
$i=1
While ($true) #infinate loop
    {
    $i
    $i++
    if ($i -gt 10) {
        Break #exit loop when if condition.
        }
    }
```

### ForEach-Object

This example shows Get-ChildItem, A For-EachObject loop, and an if statement example.

```powershell
$favorite = "\\fs1\Favs\Toms IT Pro.url"

Get-ChildItem -Path C:\Users\ -Directory | For-EachObject {
    $targetFav = $_.FullName + "\Favorites\Toms IT Pro.url"
    if((Test-Path $targetFav) -eq $false){
        Copy-Item $favorite $targetFav -Force
    }
}
```

At it's most simple, ForEach-Object requires only an object to be looped through and a script block containing the commands to be performed on each member of the object.

These parameters can be specified either by the `-InputObject` and `-Process` parameter names, or by piping the object to the ForEach-Object cmdlet and placing the script block as the first parameter. as shown below.  `-InputObject` is used instead of the pipe.

```powershell
$myDocuments = Get-ChildItem $env:USERPROFILEDocuments -File
#returns a list of all the file objects
$myDocuments | ForEach-Object {$_.FullName}
#returns a list of the 'FullName' of all the file objects (its path)
ForEach-Object -InputObject $myDocuments -Process {$_.FullName}
#this is equivaent to above.
```

ForEach-Object has two aliases, `ForEach` and`%`, and also supports shorthand syntax beginning in PowerShell 3.0. The following three examples are identical in function.

```powershell
Get-WMIObject Win32_LogicalDisk | ForEach-Object {$_.FreeSpace}
Get-WMIObject Win32_LogicalDisk | ForEach {$_.FreeSpace}
Get-WMIObject Win32_LogicalDisk | % FreeSpace
```
The `-Begin` and `-End` parameters can be used to define script blocks to execute just before or after the contents of the -Process script block. This can be used to set or modify a variable before or after execution of the loop.

```powershell
Get-PackageSource |ForEach-Object {
    Write-Host ($_ |Select -ExpandProperty Name)
    Set-PackageSource -Name ($_ |Select -ExpandProperty Name) -Trusted
    }  #doesnt work as intended, but syntax is correct anyway.

#Equivalent:
Get-PackageSource |ForEach-Object {Write-Host ($_.Name)}
Get-PackageSource |% {Write-Host ($_.Name)}
#Braces are required, o/w error.
```

Another common example

```ps1
$files = get-ChildItem $inputPath

foreach ($file in $files)
{
    $outFilename = $targetPath + $file.Name
    write-host $outFilename
}
```



#### ForEach

[about_Foreach](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_foreach?view=powershell-6)

You can also use looping constructs, such as ForEach, For, and While loops, to refer to the elements in an array. For example, to use a `ForEach` loop to display the elements in the `$a` array, type:

```ps1
    $a = 0..9
    foreach ($element in $a) {
    $element
    }
```

Likewise, the file iterator commonly used, is actually array based

```ps1
    $files = Get-ChildItem (Get-Location)
    foreach ($file in $files){
        $file #Action
    }
```

`%` The ForEach operator as well

```ps1
    PS>$a = 1, 2, 3
    PS>$a.Clear()
    PS>$a | % { $null -eq $_ }
True
True
True
```
And the foreach method (PS4+)

```ps1
    PS>$a = @(0 .. 3)
    PS>$a.ForEach({ $_ * $_})
0, 1, 4, 9
```

`ForEach(type convertToType)` The ForEach method can be used to swiftly cast the elements to a different type;

        PS>@("1/1/2017", "2/1/2017", "3/1/2017").ForEach([datetime])
    Sunday, January 1, 2017 12:00:00 AM
    Wednesday, February 1, 2017 12:00:00 AM
    Wednesday, March 1, 2017 12:00:00 AM

`ForEach(string propertyName, object[] newValue)` The ForEach method can also be used to quickly retrieve, or set property values for every item in the collection.

```ps1
        #Set all LastAccessTime properties of files to the current date.
    PS>(dir 'C:\Temp').ForEach('LastAccessTime', (Get-Date))
        #View the newly set LastAccessTime of all items, and find Unique entries.
    PS>(dir 'C:\Temp').ForEach('LastAccessTime') | Get-Unique
Wednesday, June 20, 2018 9:21:57 AM
```

`ForEach(string methodName, object[] arguments)`  Lastly, ForEach methods can be used to execute a method on every item in the collection.

        PS>("one", "two", "three").ForEach("ToUpper")
    ONE
    TWO
    THREE


[Retrieving properties and executing methods for each item in a collection can also be accomplished using "Methods of scalar objects and collections" ](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_methods?view=powershell-6)

##### The Foreach Statement Inside a Command Pipeline

[Source](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_simplified_syntax?view=powershell-5.1)

When Foreach appears in a command pipeline, Windows PowerShell uses the foreach alias, which calls the ForEach-Object command. When you use the foreach alias in a command pipeline, you do not include the ($<item> in $<collection>) syntax as you do with the Foreach statement. This is because the prior command in the pipeline provides this information. The syntax of the foreach alias when used in a command pipeline is as follows:

      <command> | foreach {<command_block>}

For example, the Foreach loop in the following command displays processes whose working set (memory usage) is greater than 20 megabytes (MB).

      Write-Host "Processes with working sets greater than 20 MB."
      Get-Process | foreach {
         if ($_.WS -gt 20MB)
         { Write-Host $_.name ": " ($_.WS/1MB).ToString("F0") MB -Separator ""}
      }


- The `Get-Process` command gets all of the processes on the computer. The `Foreach` alias performs the commands in the script block on each process in sequence.

- The `IF` statement selects processes with a working set (WS) greater than 20 megabytes. The `Write-Host` cmdlet writes the name of the process followed by a colon. It divides the working set value, which is stored in bytes by 1 megabyte to get the working set value in megabytes. Then it converts the result from a double to a string. It displays the value as a fixed point number with zero decimals (F0), a space separator (" "), and then "MB".

##### Beginning Middle and End Command Blocks

The `foreach` alias also supports **beginning command blocks, middle command blocks, and end command blocks**. The beginning and end command blocks run once, and the middle command block runs every time the Foreach loop steps through a collection or array.

The syntax of the `foreach` alias when used in a command pipeline with a beginning, middle, and ending set of command blocks is as follows:

      <command> | foreach {
          <beginning command_block>
      } {
          <middle command_block>
      } {
          <ending command_block>
      }

      The following example demonstrates the use of the beginning, middle, and end command blocks.

```ps1
Get-ChildItem | foreach {
    $fileCount = $directoryCount = 0
} {
    if ($_.PsIsContainer) {$directoryCount++} else {$fileCount++}
} {
    "$directoryCount directories and $fileCount files"
}
```

The *beginning* block creates and initializes two variables to 0:  `$fileCount = $directoryCount = 0}`

The *middle* block evaluates whether each item returned by `Get-ChildItem` is a directory or a file: ``{if ($_.PsIsContainer) {$directoryCount++} else {$fileCount++}}``

      If the item that is returned is a directory, the ``$directoryCount`` variable is incremented by 1. If the item is not a directory, the `$fileCount` variable is incremented by 1.

The ending block runs after the middle block completes its looping operation and then returns the results of the operation:  ``{"$directoryCount directories and $fileCount files"}``

By using the beginning, middle, and ending command block structure and the pipeline operator, you can rewrite the earlier example to find any files that are greater than 100 KB, as follows:


```ps1
Get-ChildItem | foreach {
$i = 0} {
  if ($_.length -gt 100KB) {
    Write-Host $_.name "file size:" ($_.length / 1024).ToString("F0") KB
    $i++
  }
  } {
  if ($i -ne 0) {
    Write-Host
    Write-Host "$i file(s) over 100 KB in the current directory."
  }
  else {
    Write-Host "No files greater than 100 KB in the current directory."
  }
}
```


###### A Complex Example

The following example, a function which returns the functions that are used in scripts and script modules, demonstrates how to use the MoveNext method (which works similarly to "skip X" on a For loop) and the Current property of the `$foreach` variable inside of a foreach script block, even if there are unusually- or inconsistently-spaced function definitions that span multiple lines to declare the function name. The example also works if there are comments in the functions used in a script or script module.

```ps1
function Get-FunctionPosition {
  [CmdletBinding()]
  [OutputType('FunctionPosition')]
  param(
    [Parameter(Position = 0, Mandatory, ValueFromPipeline,
      ValueFromPipelineByPropertyName)]
    [ValidateNotNullOrEmpty()]
    [Alias('PSPath')]
    [System.String[]]
    $Path
  )

  BEGIN {
    $psExtensions = @('.ps1', '.psm1')
    $prsErrorMsg = "File '{0}' has {1} parser errors."
  }

  PROCESS {
    try {
      $filesToProcess = if ($_ -is [System.IO.FileSystemInfo]) { $_ }
                        else { Get-Item -Path $Path }

      foreach ($item in $filesToProcess) {
        if ($item.PSIsContainer -or
          $item.Extension -notin $psExtensions) {
          continue
        }

        $tokens = $errors = $null
        $ast = [Management.Automation.Language.Parser]::ParseFile(
            $item.FullName,
            ([REF]$tokens),
            ([REF]$errors))

        if ($errors) {
          $msg = $prsErrorMsg -f $item.FullName,$errors.Count
          Write-Warning $msg
        }

        :tokenLoop  foreach ($token in $tokens) {
          if ($token.Kind -ne 'Function') {
            continue
          }

          $position = $token.Extent.StartLineNumber
          do {
            if (-not $foreach.MoveNext()) {
              break tokenLoop
            }

            $token = $foreach.Current
          } until ($token.Kind -in @('Generic', 'Identifier'))

          $functionPosition = [pscustomobject]@{
            Name     = $token.Text
            LineNumber = $position
            Path     = $item.FullName
          }

          $params = @{
            'InputObject' = $functionPosition
            'TypeName' = 'FunctionPosition'
            'PassThru' = $true
          }

          Add-Member @params
        }
      }
    }
    catch {
      throw
    }
  }
}
```

#### For Loops

[about_For](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_for?view=powershell-6)

```ps1
    PS>$a = 0..9
    PS>for ($i = 0; $i -le ($a.length - 1); $i += 2) {
        $a[$i]
    }
```
#### Other Methods

##### Where

Allows to filter or select the elements of the array. The script must evaluate to anything different than: zero (0), empty string, `$false` or `$null` for the element to show after the `Where`

Where(scriptblock expression[, WhereOperatorSelectionMode mode
                            [, int numberToReturn]])

```ps1
PS>(0..9).Where{ $_ % 2 }
1
3
5
7
9
```

Since the evens eval to 0, they are not shown.  If expression evals to False or Null or 0 its removed

##### Default or First
The Default mode filters items using the Expression scriptblock.

If a numberToReturn is provided, it specifies the maximum number of items to return.

```ps1
        #Get the zip files in the current users profile, sorted by LastAccessTime.
    $Zips = dir $env:userprofile -Recurse '*.zip' | Sort-Object LastAccessTime
        #Get the least accessed file over 100MB
    $Zips.Where({$_.Length -gt 100MB}, 'Default', 1)
```

!!!: Both the Default mode and First mode return the first (numberToReturn) items, and can be used interchangeably.

##### Last

```ps1
    $h = (Get-Date).AddHours(-1)
    $logs = dir 'C:\' -Recurse '*.log' | Sort-Object CreationTime
    # Find the last 5 log files created in the past hour.
    $logs.Where({$_.CreationTime -gt $h}, 'Last', 5)
```

##### SkipUntil

The `SkipUntil` mode skips all objects in a collection until an object passes the script block expression filter. It then returns ALL remaining collection items without testing them. Only **one** passing item is tested

The number of items returned can be limited by passing a value to the numberToReturn argument.

```ps1
    $computers = "Server01", "Server02", "Server03", "localhost", "Server04"
    #Find the first available online server.
    $computers.Where({ Test-Connection $_ }, 'SkipUntil', 1)

localhost
```

##### Until

The `Until` mode inverts the SkipUntil mode. It returns ALL items in a collection until an item passes the script block expression. Once an item passes the scriptblock expression, the Where method stops processing items.

This means that you will receive the first set of non-passing items from the Where method. After one item passes, the rest will NOT be tested nor returned.

The number of items returned can be limited by passing a value to the `numberToReturn` argument.

```ps1
    #Retrieve the first set of numbers less than or equal to 10.
    PS>(1..50).Where({$_ -gt 10}, 'Until')
    #This would perform the same operation.
    PS>(1..50).Where({$_ -le 10})

1
2
3
4
5
6
7
8
9
10
```

!!!: Both Until and SkipUntil operate under the premise of NOT testing a batch of items.
    `Until` returns the items **BEFORE** the first pass.\
    `SkipUntil` returns all the items **AFTER** the first pass, including the first passing item.

##### Split

The `Split` mode splits, or groups collection items into two separate collections. Those that pass the scriptblock expression, and those that do not.

If a `numberToReturn` is specified, the first collection, will contain the passing items, not to exceed the value specified.

```ps1
$running, $stopped = (Get-Service).Where({$_.Status -eq 'Running'}, 'Split')
$running
output

Copy
Status   Name               DisplayName
------   ----               -----------
Running  Appinfo            Application Information
Running  AudioEndpointBu... Windows Audio Endpoint Builder
Running  Audiosrv           Windows Audio
...
		$stopped
output

Copy
Status   Name               DisplayName
------   ----               -----------
Stopped  AJRouter           AllJoyn Router Service
Stopped  ALG                Application Layer Gateway Service
Stopped  AppIDSvc           Application Identity
...
```

#### Get the members of an array

To get the properties and methods of an array, such as the `Length` property and the `SetValue` method, use the `InputObject` parameter of the `Get-Member` cmdlet.

    Get-Member $a

When you pipe an array to `Get-Member`, PowerShell sends the items one at a time and `Get-Member` returns the type of each item in the array (ignoring duplicates).


When you use the `-InputObject` parameter, Get-Member returns the members of the array.

    Get-Member -InputObject $a

For example, the following command gets the members of the $a array variable.

    ,$a | Get-Member

    ,(1,2,3) | Get-Member

You can also get the members of an array by typing a comma (,) before the value that is piped to the Get-Member cmdlet. The comma makes the array the second item in an array of arrays. Windows PowerShell pipes the arrays one at a time and Get-Member returns the members of the array. Like the next two examples.

#### Manipulating an array

You can change the elements in an array, add an element to an array, and combine the values from two arrays into a third array.

To change the value of a particular element in an array, specify the array name and the index of the element that you want to change, and then use the assignment operator (=) to specify a new value for the element. For example, to change the value of the second item in the $a array (index position 1) to 10, type:


    $a[1] = 10

You can also use the SetValue method of an array to change a value. The following example changes the second value (index position 1) of the $a array to 500:

    $a.SetValue(500,1)

You can use the += operator to add an element to an array. The following example shows how to add an element to the $a array.

    $a = @(0..4)
    $a += 5

!!!: When you use the += operator, PowerShell actually creates a new array with the values of the original array and the added value. This might cause performance issues if the operation is repeated several times or the size of the array is too big.

##### Deleting From an Array

It is not easy to delete elements from an array, but you can create a new array that contains only selected elements of an existing array. For example, to create the $t array with all the elements in the $a array except for the value at index position 2, type:

    $t = $a[0,1 + 3..($a.length - 1)]

##### Combining Arrays

To combine two arrays into a single array, use the plus operator (+). The following example creates two arrays, combines them, and then displays the resulting combined array.

    $x = 1,3
    $y = 5,9
    $z = $x + $y

As a result, the $z array contains 1, 3, 5, and 9.

##### Delete an Array

To delete an array, assign a value of $null to the array. The following command deletes the array in the $a variable.

    $a = $null

You can also use the `Remove-Item` cmdlet, but assigning a value of $null is faster, especially for large arrays.



### Comments

Comments are marked with `#`.

Block comments start with `<#` and end with `#>`.


## Commands

### Get-Help

`Get-Help [ModuleName] -examples -online`

Find the available commands with `Get-Command`

!!! Note Note - Something that works well is `Get-Help about_` and then just hit [[Tab]] until you get to the one you want.  Has lots of basic info.


#### Get-Command

```ps1
Get-Command -CommandType Alias
Get-Command -CommandType Function
Get-Command -CommandType Script
```

Search within a Module

```ps1
Get-Command -Module ScriptBrowser | Select-Object -Property Name


Get-Command -Module ISEScriptingGeek | Select-Object -Property Name | Format-Wide -Column 2

1
Install-Module -Name ISEScriptingGeek -Force -Verbose
```

```

### Set-Alias

Create a bit of shorthand for yourself

```powershell
Set-Alias immo import-module
>immo ISESteroids
```

### Get-Member

Investigate whats in an object

`Get-member`

(gl | gci | member).Name - lists the available sub routines
((gl | gci | measure)|member) -gets all the things available from measure

### Output (Print)

`Write-Host`

`Write-Debug`

`Read-Host -Prompt` -this can't do formatting unfortunately

## Scopes

Source `Get-Help about_scopes`

Windows PowerShell Scopes

Scopes in Windows PowerShell have both names and numbers. The named
scopes specify an absolute scope. The numbers are relative and reflect
the relationship between scopes.


- _Global:_ The scope that is in effect when Windows PowerShell starts. Variables and functions that are present when Windows PowerShell starts have been created in the global scope. This includes automatic variables and preference variables. This also includes the variables, aliases, and functions that are in your Windows PowerShell profiles.

- _Local:_ The current scope. The local scope can be the global scope or any other scope.

- _Script:_ The scope that is created while a script file runs. Only the commands in the script run in the script scope. To the commands in a script, the script scope is the local scope.

- _Private:_ Items in private scope cannot be seen outside of the current scope. You can use private scope to create a private version of an item  with the same name in another scope.

- _Numbered Scopes:_ - You can refer to scopes by name or by a number that describes the relative position of one scope to another. Scope 0 represents the current, or local, scope. Scope 1 indicates the immediate parent scope. Scope 2 indicates the parent of the parent scope, and so on. Numbered scopes are useful if you have created many recursive scopes.

### Parent and Child Scopes

You can create a new scope by running a script or function, by creating a session, or by starting a new instance of Windows PowerShell. When you create a new scope, the result is a parent scope (the original scope) and a child scope (the scope that you created).


In Windows PowerShell, all scopes are child scopes of the global scope, but you can create many scopes and many recursive scopes.


Unless you explicitly make the items private, the items in the parent scope are available to the child scope. However, items that you create and change in the child scope do not affect the parent scope, unless you explicitly specify the scope when you create the items.


### Inheritance

A child scope does not inherit the variables, aliases, and functions from the parent scope. Unless an item is private, the child scope can view the items in the parent scope. And, it can change the items by explicitly specifying the parent scope, but the items are not part of the child scope.

However, a child scope is created with a set of items. Typically, it includes all the aliases that have the AllScope option. This option is discussed later in this topic. It includes all the variables that have the AllScope option, plus some variables that can be used to customize the scope, such as `MaximumFunctionCount`.

### Checking Scope

To find the items in a particular scope, use the `Scope` parameter of  `Get-Variable` or `Get-Alias`.


For example, to get all the variables in the local scope, type:

    get-variable -scope local


To get all the variables in the global scope, type:

    get-variable -scope global

!!!Summary  Summary : tJOS OS A SUMMASDF




### Scope Modifiers

To specify the scope of a new variable, alias, or function, use a scope modifier. The valid values of a modifier are Global, Local, Private, and Script.

The syntax for a scope modifier in a variable is:

    $[<scope-modifier>]:<name> = <value>

The syntax for a scope modifier in a function is:

    function [<scope-modifier>]:<name> {<function-body>}


The default scope for scripts is the script scope. The default scope for functions and aliases is the local scope, even if they are defined in a
script.

#### The Standard Case (local / unspecified)
The following command, which does not use a scope modifier, creates a variable in the current or local scope:

    $a = "one"



To create the same variable in the global scope, use the Global scope modifier:

    $global:a = "one"

To create the same variable in the script scope, use the script scope modifier:

    $script:a = "one"


You can also use a scope modifier in functions. The following function
definition creates a function in the global scope:

    function global:Hello
    {
write-host "Hello, World"
    }


You can also use scope modifiers to refer to a variable in a different
scope. The following command refers to the $test variable, first in the
local scope and then in the global scope:

    $test

    $global:test

The Using scope modifier

Using is a special scope modifier that identifies a local
variable in a remote command. By default, variables in remote
commands are assumed to be defined in the remote session.

The Using scope modifier is introduced in Windows PowerShell 3.0.

For more information, see about_Remote_Variables.


## Functions

[Source](https://ss64.com/ps/syntax-functions.html)
A block of code may be contained within a function for easy re-use.
To create a function, call the function keyword followed by a name for the function, then include your code inside a pair of curly braces.

```powershell
function Add-Numbers {
 $args[0] + $args[1]
}

PS C:\> Add-Numbers 5 10
15
```

A similar function with named parameters:

```powershell
function Output-SalesTax {
 param( [int]$Price, [int]$Tax )|
 $Price + $Tax
}

PS C:\> Output-SalesTax -price 1000 -tax 38
1038
```

To display the definition of a function several methods can be used:

```powershell
cat function:Add-Numbers
or
${function:Add-Numbers}
or
(get-command Add-Numbers).definition
```

To list all functions in the current session: `get-command -CommandType function`

N.B in a block of code you need to define the function before you call it.

!!!Attention Attention: Don't add brackets around the function parameters:

```powershell
$result = Add-Numbers (5, 10) --Wrong!
$result = Add-Numbers 5 10    --Right
```

### Pass by Reference

Using the `[ref]` flag

[ByRef](https://ss64.com/ps/syntax-ref.html)



```ps1
PS C:\> function add5([ref]$num)
>> {
>> $num.value = $num.value + 5
>> }

PS C:> $testing = 2
PS C:> $testing
2
PS C> add5 ([ref]$testing)
PS C> $testing
7

# Extending this to modify two variables:
PS> function add5minus5([ref]$add,[ref]$minus)
>> {
>> $add.value = $add.value + 5
>> $minus.value = $minus.value - 5
>> }
```
### Filter Functions

e.g. stream functions, defined with the word `filter` rather than function.

```ps
function [scope_type:]name
 { 
  [ param(param_list) ]
   script_block
 }
filter [scope_type:]name
 {
  [ param(param_list) ]
  script_block 
 }

```

Filter can also be implemented with `Where-Object` to create quick un-named filters.  The should return true or false.

The difference between a filter function and a regular function is the way they handle items passed through the pipeline:

With a regular function, pipeline objects are bound to the `$input` automatic variable, and execution is blocked until all input is received. The function then begins processing the data.

With a filter function, data is processes while it is being received, without waiting for all input. A filter receives each object from the pipeline through the `$_` automatic variable, and the script block is processed for each object.

The `param_list` is an optional list of comma separated parameter names, these may also be preceded by their data types in brackets. This makes the function more readable than using `$args` and also gives you the option to supply default values.


### Advanced function

An Advanced PowerShell function contains the `[cmdletbinding()]` attribute (or the `Parameter` attribute). This adds several capabilities such as additional parameter checking, and the ability to easily use `Write-Verbose.`

A function with cmdletbinding will throw an error if unhandled parameter values appear on the command line.

Advanced PowerShell functions typically include `Begin..Process..End` blocks for processing the input data, documentation and auto-help, including the parameters.

```

 function Get-ByOwner
 {
   Get-ChildItem -recurse C:\ | get-acl | where {$_.Owner -match $args[0]} 
 }

PS C:\> Get-ByOwner JackFrost


 function Get-Help2
 {
   param([string]$command)
   Start-process -filepath "https://ss64.com/ps/$command.html"
 }
 ```

### Variable Scope

By default, all variables created in functions are local, they only exist within the function, though they are still visible if you call a second function from within the first one.

To persist a variable, so the function can be called repeatedly and the variable will retain it's last value, prepend `$script:` to the variable name, e.g. `$script:myvar`

To make a variable global prepend `$global:` to the variable name, e.g. `$global:myvar`

### Splatting

[Splatting Doc](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-5.1)

Splatting is a method of passing a collection of parameter values to a command as unit. PowerShell associates each value in the collection with a command parameter. Splatted parameter values are stored in named splatting variables, which look like standard variables, but begin with an At symbol (`@`) instead of a dollar sign (`$`). The At symbol tells PowerShell that you are passing a collection of values, instead of a single value.

Examples

The first example uses the traditional format in which parameter names are omitted. The parameter values appear in position order in the command.

      Copy-Item "test.txt" "test2.txt" -WhatIf

The second example uses array splatting. The first command creates an array of the parameter values and stores it in the $ArrayArguments variable. The values are in position order in the array. The second command uses the $ArrayArguments variable in a command in splatting. The At symbol (@ArrayArguments) replaces the dollar sign ($ArrayArguments) in the command.

      $ArrayArguments = "test.txt", "test2.txt"
      Copy-Item @ArrayArguments -WhatIf

2- This example shows how to re-use splatted values in different commands. The commands in this example use the Write-Host cmdlet to write messages to the host program console. It uses splatting to specify the foreground and background colors.

To change the colors of all commands, just change the value of the $Colors variable.

The first command creates a hash table of parameter names and values and stores the hash table in the $Colors variable.

      $Colors = @{ForegroundColor = "black"; BackgroundColor = "white"}

The second and third commands use the $Colors variable for splatting in a Write-Host command. To use the $Colors variable, replace the dollar sign ($Colors) with an At symbol (@Colors).

      #Write a message with the colors in $Colors
      Write-Host "This is a test." @Colors

      #Write second message with same colors. The position of splatted
      #hash table does not matter.
      Write-Host @Colors "This is another test."

This example shows how to forward their parameters to other commands by using splatting and the $PSBoundParameters automatic variable.

The $PSBoundParameters automatic variable is a dictionary object (System.Collections.Generic.Dictionary) that contains all the parameter names and values that are used when a script or function is run.

3- In the following example, we use the $PSBoundParameters variable to forward the parameters values passed to a script or function from Test2 function to the Test1 function. Both calls to the Test1 function from Test2 use splatting.

      function Test1
      {
          param($a, $b, $c)

          $a
          $b
          $c
      }

      function Test2
      {
          param($a, $b, $c)

          #Call the Test1 function with $a, $b, and $c.
          Test1 @PsBoundParameters

          #Call the Test1 function with $b and $c, but not with $a
          $LimitedParameters = $PSBoundParameters
          $LimitedParameters.Remove("a") | Out-Null
          Test1 @LimitedParameters
      }

Output

      Test2 -a 1 -b 2 -c 3
      1
      2
      3
      2
      3



## Profiles

### Userfiles

```powershell
notepad.exe $Profile.currentusercurrenthost
```

There are 4+ in total -
One For CurrentUser and AllUsers

One for CurrentHosts (shell) and AllHosts- Hosts I have found so far- Powershell, PowershellISE, and VSCode

CurrentUser files are stored in
- CurrentUserAllHosts `C:\Users\[Andy]\Documents\WindowsPowerShell\profile.ps1`
- CurrentUserCurrentHost(Powershell)- `C:\Users\Andy\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`
- (Powershell ISE)-
`C:\Users\Andy\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1`
- (VS Code Terminal)
`C:\Users\Andy\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

- $profile.AllUsersAllHosts
`C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1`
- $profile.AllUsersCurrentHost
`C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShellISE_profile.ps1`
- $profile.AllUsersCurrentHost
`C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShell_profile.ps1`

PS C:\Windows\system32> $profile.AllUsersAllHosts
C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1

PS C:\Windows\system32> $profile.AllUsersCurrentHost
C:\Windows\System32\WindowsPowerShell\v1.0\Microsoft.PowerShellISE_profile.ps1

PS C:\Windows\system32> $profile.CurrentUserAllHosts
C:\Users\s163837\Documents\WindowsPowerShell\profile.ps1

PS C:\Windows\system32> $profile.CurrentUserCurrentHost
C:\Users\s163837\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1

#### CurrentUserAllHosts:

```ps
#General?
Import-Module getChildItemColor
Import-Module posh-git
#my profile.ps1


#http://serverfault.com/questions/95431


function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
    # https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt
    $origLastExitCode = $LastExitCode
    Write-VcsStatus

    if (Test-Administrator) {  # if elevated
        Write-Host "(Elevated) " -NoNewline -ForegroundColor White
    }

    Write-Host "$env:USERNAME@" -NoNewline -ForegroundColor DarkYellow
    Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray

    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    Write-Host $curPath -NoNewline -ForegroundColor Blue
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
    Write-Host " : " -NoNewline -ForegroundColor DarkGray
    $LastExitCode = $origLastExitCode
    "`n$('>' * ($nestedPromptLevel + 1)) "
}

Import-Module PSReadLine

Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
Set-PSReadLineOption -MaximumHistoryCount 4000
#-history substring search
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

#-Tab completion
Set-PSReadlineKeyHandler -Chord 'Shift+Tab' -Function Complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

function cddash {
    if ($args[0] -eq '-') {
        $pwd = $OLDPWD;
    } else {
        $pwd = $args[0];
    }
    $tmp = pwd;

    if ($pwd) {
        Set-Location $pwd;
    }
    Set-Variable -Name OLDPWD -Value $tmp -Scope global;
}

Set-Alias -Name cd -value cddash -Option AllScope`
```

#### AllUsersCurrentHost

C:\Users\Andy> more $profile.AllUsersCurrentHost
#$profile.AllUsersCurrentHost
Import-Module getChildItemColor
Import-Module posh-git
#my profile.ps1
function prompt {
    # Your non-prompt logic here

    # Have posh-git display its default prompt
    & $GitPromptScriptBlock
}

#### CurrentUserCurrentHost

```ps
Import-Module getChildItemColor
Import-Module posh-git
#my profile.ps1
function prompt {
    # Your non-prompt logic here

    # Have posh-git display its default prompt
    & $GitPromptScriptBlock
}
```


### Desktop CurrentUserCurrentHost

```powershell
#Microsoft.PowerShellISE_profile.ps1
#$profile.CurrentUserCurrentHost

Write-Host -ForegroundColor Yellow "Running CurrentUserCurrentHost Profile Settings, see $profile.currentusercurrenthost for more infomation"

Import-Module ScriptBrowser
Enable-ScriptBrowser
Import-Module ISEScriptAnalyzerAddOn
Enable-ScriptAnalyzer
Import-Module ISEModuleBrowserAddon

$VerbosePreference = "Continue" # ["SilentlyContinue"] | "Continue" | "Stop" | "Inquire"
$WarningPreference = "Stop" # # "SilentlyContinue" | {"Continue"} | "Stop" | "Inquire"

Set-Alias immo Import-Module
```
## .NET

Accessing .NET libraries seems pretty easy via PowerShell

```
if(![System.IO.File]::Exists($path)){
    # file with path $path doesn't exist
}
```
## Other tricks

### Get ENvironment Vars

`Get-childitem $env:`


### Debug

```powershell
Set-PSDebug -Trace 1 #| 2
#1 lists each line, 2 lists each line and each variable
Get-PSDepth  #Just a sample function?
Set-PSDebug -Off
```
### -OutVariable | -PipelineVariable

Takes a string and loads the result into a variable

```ps
Get-PackageSource -OutVariable Name
```

Produces the result.  But also loads result into `$Name`.  Variables have to be prefixed with `$` when getting value.

### Get-Item, Get-ItemProperty, Get-ItemPropertyValue, Get-ChildItem

`Get-ChildItem -Path C:\`
Gets the subfolders for C:\

`Get-Item -Path C:\` just returns an item that represents the C:\ drive.

```powershell
PS C:\Windows\system32> Get-ItemProperty -Path C:\ | Format-List
            Directory:
        Name           : C:\
        CreationTime   : 4/11/2018 4:04:33 PM
        LastWriteTime  : 1/7/2019 9:19:51 PM
        LastAccessTime : 1/7/2019 9:19:51 PM
        Mode           : d--hs-
        LinkType       :
        Target         : {}

PS C:\Windows\system32> Get-ItemProperty -Path C:\ -Name CreationTime

        CreationTime : 4/11/2018 4:04:33 PM
        PSPath       : Microsoft.PowerShell.Core\FileSystem::C:\
        PSParentPath :
        PSChildName  : C:\
        PSDrive      : C
        PSProvider   : Microsoft.PowerShell.Core\FileSystem

PS C:\Windows\system32> Get-ItemPropertyValue -Path C:\ -Name CreationTime

        Wednesday, April 11, 2018 4:04:33 PM
```
### Measure a value

You should use `Measure-Object` to count things. In this case it would look like:

        rite-Host ( Get-ChildItem c:\MyFolder | Measure-Object ).Count;

or if that's too long

        Write-Host ( dir c:\MyFolder | mo).Count;

and in PowerShell 4.0 use the measure alias instead of mo

        Write-Host (dir c:\MyFolder | measure).Count;

even: but the problem is, that if I have 1 or 0 items, the command does not work
        Write-Host ( Get-ChildItem c:\MyFolder ).Count;

(Get-Location | gci | measure).Count

### Get a Property

Get-ItemProperty

Get-Item

You can access an item by forcing PS to re-eval an item with `$` as in `$(<expr>)`:

        PS> $(GCI .\100.zip)
            Directory: A:\icons\scraping

        Mode                LastWriteTime         Length Name
        ----                -------------         ------ ----
        -a----        4/19/2019  12:47 PM        1238733 100.zip

        PS> $(GCI .\100.zip).Name
        100.zip

        PS> $(GCI .\100.zip).BaseName
        100

        PS A:\icons\scraping> $(GCI .\100.zip).FullName
        A:\icons\scraping\100.zip

### Get services format as table

 get-service | group-object -property status | format-table -wrap


### Formatting methods

Out-GridView
format-table -wrap

### Test a path

if (Test-Path $path) { ... }

if (-not (Test-Path $path)) { ... }


if (!(Test-Path $path)) { ... }

if(![System.IO.File]::Exists($path)){
    # file with path $path doesn't exist
}

try{ Test-Path -EA Stop $path; #stuff to do if found } catch { # stuff to do if not found }


```ps1
$##ather command meta data from the original Cmdlet (in this case, Test-Path)
$TestPathCmd = Get-Command Test-Path
$TestPathCmdMetaData = New-Object System.Management.Automation.CommandMetadata $TestPathCmd

$##se the static ProxyCommand.GetParamBlock method to copy
$##est-Path's param block and CmdletBinding attribute
$Binding = [System.Management.Automation.ProxyCommand]::GetCmdletBindingAttribute($TestPathCmdMetaData)
$Params  = [System.Management.Automation.ProxyCommand]::GetParamBlock($TestPathCmdMetaData)

$##reate wrapper for the command that proxies the parameters to Test-Path
$##sing @PSBoundParameters, and negates any output with -not
$WrappedCommand = {
    try { -not (Test-Path @PSBoundParameters) } catch { throw $_ }
}

$##efine your new function using the details above
$Function:notexists = '{0}param({1}) {2}' -f $Binding,$Params,$WrappedCommand

notexists will now behave exactly like Test-Path, but always return the opposite result:

PS C:\> Test-Path -Path "C:\Windows"
    True
PS C:\> notexists -Path "C:\Windows"
    False
PS C:\> notexists "C:\Windows" # positional parameter binding exactly like Test-Path
    False
As you've already shown yourself, the opposite is quite easy, just alias exists to          Test-Path:

    PS C:\> New-Alias exists Test-Path
    PS C:\> exists -Path "C:\Windows"
    True
```
### Get a particular value

```powershell
$someVar = Get-PackageSouce
$someVar."Name"
#or
write-host ($obj | Select -ExpandProperty "SomeProp")

#or for some function (Get-PackageSource here) using Select
Get-PackageSource | Select -ExpandProperty "Name"
```

Remember `-ExpandProperty`: select -expand "SomeProp" if you want the value. select "SomeProp" returns a customobject with a property "SomeProp".

Using Select-Object -Property will usually work, but still returns a custom object with a parameter of the value.  You have to use `-ExpandProperty` to get out the value in some cases.

Select also works.  Specific cases may need `Select-Object` over `Select` and `-ExpandProperty` over `-Property`

In this case at least, they are all superficially equivalent.

```Powershell
$property = (Get-Process)[0] | Select -Property Name
$property = (Get-Process)[0] | Select -ExpandProperty Name
$property = (Get-Process)[0] | Select-Object -Property Name
$property = (Get-Process)[0] | Select-Object -ExpandProperty Name
```

Running `$property.GetType()`  would probably return different things- objects for [1] and [3] and strings for the other two, though I am unsure.



### Setup

 PSRepository -> PackageSource -> PackageProviders-> Package -> Modules

 PSRepository is a specific source which is the default source of PS Modules.  But Powershell can get more than just PS Modules (Apps, Docker files, etc...)

 PackageSource is the repositories for these files

 (?) PackageProvider is the method, or the means by which the file is provided- via NuGet, OneGet, Choco, etc.

 Packages are modules which can be installed and will (usually?) persist.

 Just running import module seems to be one time only.

First Get NuGet

```powershell

#Set Verbose Preference
$VerbosePreference = "Continue" #SilentlyContinue |

Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

Find-PackageProvider #Same as Get-PackageProvider -ListAvailable

Install-PackageProvider -Name Chocolatey
Install-PackageProvider -Name NuGet -MinimumVersion 2.8 -Force
Install-PackageProvider -Name ChocolateyGet -Force
Install-PackageProvider -Name DockerMsftProvider -Force
Install-PackageProvider -Name DockerProvider -Force
Install-PackageProvider -Name ChocoOneGet -Force
Install-PackageProvider -Name Pacman-Provider -Force
Install-PackageProvider -Name psl -Force

Get-PackageSource

Set-PackageSource -Name PSGallery -Trusted
Set-PackageSource -Name Chocolatey -Trusted
Set-PackageSource -Name DockerDefault -Trusted
Set-PackageSource -Name Doc -Trusted

Install-Package PSReadLine -Source PSGallery
Install-Package ScriptBrowser -Source PSGallery
Install-Package ISEModuleBrowserAddOn -Source PSGallery
Install-Package ISEScriptAnalyzerAddOn -Source PSGallery
Install-Package ISESteroids -Source PSGallery
```

### Security

`Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned`


### Install Windows Feature (WSL)

```ps
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### Get a web file (like curl)

Invoke-WebRequest

```ps1
function Generate-URI {
    param([String]$uri, [Int32]$w, [Int32]$v, [String]$filetype)
 $str =   "$uri{0,3:d3}/{0,3:d3}{1,3:d3}$filetype" -f $w, $v
return $str

}

function Generate-filename {
    param([String]$scrape, [Int32]$w, [Int32]$v, [String]$filetype)
 $str =   "$scrape{0,3:d3}$filetype" -f $w, $v
return $str

}


function scrape-Uri{
param([Int32]$MajorStart, [Int32]$MajorStop, [Int32]$MinorStart0, [Int32]$MinorStop=999, [String]$filename = "scape", [String]$filetype =".svg", [String]$URL="https://image.flaticon.com/icons/svg/")

    #$WarningPreference = "SilentlyContinue"
    $v = $MinorStart
    $w = $MajorStart
    $uri = "https://image.flaticon.com/icons/svg/"
    $filetype = ".svg"
    $fileprefix = "scrape"
    $err
    Do{

        if(!(Test-Path $w)){
            mkdir $w
        }
        cd $w
        Do{
            $u = Generate-URI -uri $uri -w $w -v $v -filetype $filetype
            $f = Generate-filename -scrape $fileprefix -w $w -v $v -filetype $filetype
            if(!(Test-Path $f)){
                Invoke-WebRequest -Uri $u -OutFile $f -WarningVariable $err
            }
            Out-Host "The err is $err"
            $v = $v + 1
        }While($v -le $MinorStop)

        cd..
       # }
        $w = $w + 1
        $v = $MinorStart
    }While($w -le $MajorStop )

}

```

### Find a command

```powershell
Get-Command -Noun PackageProvider
Get-Command -Verb
#*******
Find-Command | Out-GridView
#The best, interactive search, but ties up the terminal its run in until it closes
#******
Find-Command -Name "Show-Browser"

function Add-Function
{
    param([string]$searchTerm)
    Install-Module -Name (Find-Command -Name $searchTerm | Select -ExpandProperty "ModuleName") -Verbose
}
```

### Get Help

```powershell
Get-Help Find-Command -examples
```

Or using this [example function]()

```powershell
 function Get-Help2
 {
   param([string]$command)
   Start-process -filepath "https://ss64.com/ps/$command.html"
 }
You can then do:
PS C:\> Get-Help2 -command set-acl
```

The built-in PowerShell alias names will take precedence over a function (or script) with the same name. To avoid conflicts always check if the name is already in use with help name. Choosing a good descriptive name for your function will help with this

### Show a file open dialogue

[Source](https://blogs.technet.microsoft.com/heyscriptingguy/2009/09/01/hey-scripting-guy-can-i-open-a-file-dialog-box-with-windows-powershell/)

```powershell
Get-FileNameFunction.ps1


Function Get-FileName($initialDirectory)
{
 [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = "All files (*.*)| *.*"
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} #end function Get-FileName

#*** Entry Point to Script ***

Get-FileName -initialDirectory "c:fso"

```

### Open Folder Dialog

[Sources](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.folderbrowserdialog?view=netframework-4.8)

[Source2](https://stackoverflow.com/questions/8184167/prompt-for-user-input-in-powershell)

[Source3](https://docs.microsoft.com/en-us/dotnet/api/system.windows.forms.openfiledialog?redirectedfrom=MSDN&view=netframework-4.8)

Also same as above.

```ps1
This mostly works.
Function Get-Directory($InitialDir){

[System.Reflection.Assembly]::LoadWithPartialName(“System.windows.forms”) | Out-Null
#OutNull to hide the success dialogue
$OpenDirDialogue = New-Object System.Windows.Forms.FolderBrowserDialog
$OpenDirDialogue.ShowNewFolderButton = $true
#$OpenDirDialogue.RootFolder = Environment.SpecialFolder.Personal

$OpenDirDialogue.Description = "Where to Look for Files?"
$OpenDirDialogue.ShowDialog()
$OpenDirDialogue.SelectedPath
}
```

returns

        PS C:\Users\andyt> Get-Directory(Get-Location)
        OK
        C:\Users\andyt\Desktop\TEMP_Desktop_Folder\retakes

maybe it needs   `$a = $OpenDirDialogue.ShowDialog()` to catch the "OK"

$InitialDir doesnt do anything.



### Prompt for input

```ps1
$Server = Read-Host -Prompt 'Input your server  name'
$User = Read-Host -Prompt 'Input the user name'
$Date = Get-Date
Write-Host "You input server '$Servers' and '$User' on '$Date'"
```

### Get Windows Events


```ps1
Get-Help Get-WinEvent -Examples

#Gets a list of events
Get-WinEvent -ProviderName "Microsoft-Windows-DistributedCOM" -MaxEvents 20

$Events = Get-EventLog -LogName System -Newest 1000
$Events | Group-Object -Property Source -NoElement | Sort-Object -Property Count -Descending

Get-EventLog -LogName System -InstanceId 10016 -Source DCOM

Get-WinEvent -ProviderName "Microsoft-Windows-DistributedCOM"  | Where-Object {$_.Id -eq 10016}  |  Select-Object -ExpandProperty Message

$msg[1]
$msg.Count
#Get a count for a loop


$msg[3] | ConvertFrom-String

$pmsg = $msg[4] | ConvertFrom-String
$msg[4] | ConvertFrom-String | Get-Member

#p9 = Launch
#p18 = CLSID
#p21 = APPID
#p25 & p26 =User
#p28 = SID (p27)
#p31 = Address
#p41 = Container



```
### File Methods Available

        PS A:\icons\scraping\166\1> Get-ChildItem .\scrape166.svg | Get-Member


        TypeName: System.IO.FileInfo

        Name                      MemberType     Definition
        ----                      ----------     ----------
        LinkType                  CodeProperty   System.String LinkType{get=GetLinkType;}
        Mode                      CodeProperty   System.String Mode{get=Mode;}
        Target                    CodeProperty   System.Collections.Generic.IEnumerable`1[[System.String, mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089]] Target{get=G...
        AppendText                Method         System.IO.StreamWriter AppendText()
        CopyTo                    Method         System.IO.FileInfo CopyTo(string destFileName), System.IO.FileInfo CopyTo(string destFileName, bool overwrite)
        Create                    Method         System.IO.FileStream Create()
        CreateObjRef              Method         System.Runtime.Remoting.ObjRef CreateObjRef(type requestedType)
        CreateText                Method         System.IO.StreamWriter CreateText()
        Decrypt                   Method         void Decrypt()
        Delete                    Method         void Delete()
        Encrypt                   Method         void Encrypt()
        Equals                    Method         bool Equals(System.Object obj)
        GetAccessControl          Method         System.Security.AccessControl.FileSecurity GetAccessControl(), System.Security.AccessControl.FileSecurity GetAccessControl(System.Security.AccessCo...
        GetHashCode               Method         int GetHashCode()
        GetLifetimeService        Method         System.Object GetLifetimeService()
        GetObjectData             Method         void GetObjectData(System.Runtime.Serialization.SerializationInfo info, System.Runtime.Serialization.StreamingContext context), void ISerializable....
        GetType                   Method         type GetType()
        InitializeLifetimeService Method         System.Object InitializeLifetimeService()
        MoveTo                    Method         void MoveTo(string destFileName)
        Open                      Method         System.IO.FileStream Open(System.IO.FileMode mode), System.IO.FileStream Open(System.IO.FileMode mode, System.IO.FileAccess access), System.IO.File...
        OpenRead                  Method         System.IO.FileStream OpenRead()
        OpenText                  Method         System.IO.StreamReader OpenText()
        OpenWrite                 Method         System.IO.FileStream OpenWrite()
        Refresh                   Method         void Refresh()
        Replace                   Method         System.IO.FileInfo Replace(string destinationFileName, string destinationBackupFileName), System.IO.FileInfo Replace(string destinationFileName, st...
        SetAccessControl          Method         void SetAccessControl(System.Security.AccessControl.FileSecurity fileSecurity)
        ToString                  Method         string ToString()
        PSChildName               NoteProperty   string PSChildName=scrape166.svg
        PSDrive                   NoteProperty   PSDriveInfo PSDrive=A
        PSIsContainer             NoteProperty   bool PSIsContainer=False
        PSParentPath              NoteProperty   string PSParentPath=Microsoft.PowerShell.Core\FileSystem::A:\icons\scraping\166\1
        PSPath                    NoteProperty   string PSPath=Microsoft.PowerShell.Core\FileSystem::A:\icons\scraping\166\1\scrape166.svg
        PSProvider                NoteProperty   ProviderInfo PSProvider=Microsoft.PowerShell.Core\FileSystem
        Attributes                Property       System.IO.FileAttributes Attributes {get;set;}
        CreationTime              Property       datetime CreationTime {get;set;}
        CreationTimeUtc           Property       datetime CreationTimeUtc {get;set;}
        Directory                 Property       System.IO.DirectoryInfo Directory {get;}
        DirectoryName             Property       string DirectoryName {get;}
        Exists                    Property       bool Exists {get;}
        Extension                 Property       string Extension {get;}
        FullName                  Property       string FullName {get;}
        IsReadOnly                Property       bool IsReadOnly {get;set;}
        LastAccessTime            Property       datetime LastAccessTime {get;set;}
        LastAccessTimeUtc         Property       datetime LastAccessTimeUtc {get;set;}
        LastWriteTime             Property       datetime LastWriteTime {get;set;}
        LastWriteTimeUtc          Property       datetime LastWriteTimeUtc {get;set;}
        Length                    Property       long Length {get;}
        Name                      Property       string Name {get;}
        BaseName                  ScriptProperty System.Object BaseName {get=if ($this.Extension.Length -gt 0){$this.Name.Remove($this.Name.Length - $this.Extension.Length)}else{$this.Name};}
        VersionInfo               ScriptProperty System.Object VersionInfo {get=[System.Diagnostics.FileVersionInfo]::GetVersionInfo($this.FullName);}

## Aliases
Alias           % -> ForEach-Object
Alias           ? -> Where-Object
Alias           h -> Get-History
Alias           r -> Invoke-History

## Commands in common with Linux and cmd

These commands are in common with Unix or cmd

- cat- `Get-Content`
- type- `Get-Content`


- ls- `Get-ChildItem`
- dir- `Get-ChildItem`

- mount- `New-PSDrive`

- rm- `Remove-Item`
- erase- `Remove-Item`
- move- `Move-Item`
- rmdir- `Remove-Item`
- ren- `Rename-Item`
- copy- `Copy-Item`

- cd - `Set-Location`
- chdir- `Set-Location`
- popd- `Pop-Location`
- pushd- `Push-Location`
- pwd- `Get-Location`

- clear- `Clear-Host`
- cls- `Clear-Host`

- history- `Get-History`
- h- `Get-History`
- r- `Invoke-History`

- ps- `Get-Process`

- sort- `Sort-Object`
- tee- `Tee-Object`
- diff- `Compare-Object`

- kill- `Stop-Process`

- echo- `Write-Output`
- lp- `Out-Printer`
- write- `Write-Output`

- sleep- `Start-Sleep`

| Alias     | Command               |
| --------- | --------------------- |
| ac        | Add-Content           |
| **cat**   | Get-Content           |
| clc       | Clear-Content         |
| gc        | Get-Content           |
| sc        | Set-Content           |
| **type**  | Get-Content           |
|           |                       |
| gm        | Get-Member            |
| gu        | Get-Unique            |
|           |                       |
| epcsv     | Export-Csv            |
| ipcsv     | Import-Csv            |
|           |                       |
| ft        | Format-Table          |
| fw        | Format-Wide           |
| fl        | Format-List           |
| fc        | Format-Custom         |
| fhx       | Format-Hex            |
|           |                       |
| ogv       | Out-GridView          |
|           |                       |
| CFS       | ConvertFrom-String    |
| sls       | Select-String         |
|           |                       |
| cli       | Clear-Item            |
| **copy**  | Copy-Item             |
| cp        | Copy-Item             |
| cpi       | Copy-Item             |
| del       | Remove-Item           |
| **erase** | Remove-Item           |
| gi        | Get-Item              |
| ii        | Invoke-Item           |
| mi        | Move-Item             |
| **move**  | Move-Item             |
| mv        | Move-Item             |
| ni        | New-Item              |
| rd        | Remove-Item           |
| **ren**   | Rename-Item           |
| ri        | Remove-Item           |
| **rm**    | Remove-Item           |
| **rmdir** | Remove-Item           |
| rni       | Rename-Item           |
| si        | Set-Item              |
|           |                       |
| **ls**    | Get-ChildItem         |
| **dir**   | Get-ChildItem         |
|           |                       |
| clp       | Clear-ItemProperty    |
| cpp       | Copy-ItemProperty     |
| gp        | Get-ItemProperty      |
| mp        | Move-ItemProperty     |
| rnp       | Rename-ItemProperty   |
| rp        | Remove-ItemProperty   |
| sp        | Set-ItemProperty      |
| gpv       | Get-ItemPropertyValue |
|           |                       |
| sleep     | Start-Sleep           |
|           |                       |
| gjb       | Get-Job               |
| rcjb      | Receive-Job           |
| rjb       | Remove-Job            |
| rujb      | Resume-Job            |
| sajb      | Start-Job             |
| spjb      | Stop-Job              |
| sujb      | Suspend-Job           |
| wjb       | Wait-Job              |
|           |                       |
| gsv       | Get-Service           |
| sasv      | Start-Service         |
| spsv      | Stop-Service          |
|           |                       |
| gps       | Get-Process           |
| **kill**  | Stop-Process          |
| **ps**    | Get-Process           |
| saps      | Start-Process         |
| spps      | Stop-Process          |
| start     | Start-Process         |
|           |                       |
|           |                       |
| **cd**    | Set-Location          |
| **chdir** | Set-Location          |
| gl        | Get-Location          |
| **popd**  | Pop-Location          |
| **pushd** | Push-Location         |
| **pwd**   | Get-Location          |
| sl        | Set-Location          |
|           |                       |
| cvpa      | Convert-Path          |
| rvpa      | Resolve-Path          |
|           |                       |
| gdr       | Get-PSDrive           |
| **mount** | New-PSDrive           |
| ndr       | New-PSDrive           |
| rdr       | Remove-PSDrive        |
|           |                       |
| %         | ForEach-Object        |
| ?         | Where-Object          |
| compare   | Compare-Object        |
| **diff**  | Compare-Object        |
| foreach   | ForEach-Object        |
| group     | Group-Object          |
| measure   | Measure-Object        |
| select    | Select-Object         |
| **sort**  | Sort-Object           |
| **tee**   | Tee-Object            |
| where     | Where-Object          |
|           |                       |

| **clear**       | Clear-Host                     |
| **cls**         | Clear-Host                     |
| oh              | Out-Host                       |
| **echo**        | Write-Output                   |
| **write**       | Write-Output                   |
| **lp**          | Out-Printer                    |
|                 |                                |
| clhy            | Clear-History                  |
| ghy             | Get-History                    |
| **h**           | Get-History                    |
| **history**     | Get-History                    |
| ihy             | Invoke-History                 |
| **r**           | Invoke-History                 |
|                 |                                |
| iex             | Invoke-Expression              |
|                 |                                |
| curl            | Invoke-WebRequest              |
| iwr             | Invoke-WebRequest              |
| wget            | Invoke-WebRequest              |
|                 |                                |
| irm             | Invoke-RestMethod              |
|                 |                                |
| iwmi            | Invoke-WmiMethod               |
| swmi            | Set-WmiInstance                |
| gwmi            | Get-WmiObject                  |
| rwmi            | Remove-WmiObject               |
|                 |                                |
| gmo             | Get-Module                     |
| ipmo            | Import-Module                  |
| nmo             | New-Module                     |
| rmo             | Remove-Module                  |
|                 |                                |
| cnsn            | Connect-PSSession              |
| dnsn            | Disconnect-PSSession           |
| epsn            | Export-PSSession               |
| etsn            | Enter-PSSession                |
| exsn            | Exit-PSSession                 |
| gsn             | Get-PSSession                  |
| ipsn            | Import-PSSession               |
| nsn             | New-PSSession                  |
| rcsn            | Receive-PSSession              |
| rsn             | Remove-PSSession               |
| npssc           | New-PSSessionConfigurationFile |
|                 |                                |
| asnp            | Add-PSSnapin                   |
| gsnp            | Get-PSSnapin                   |
| rsnp            | Remove-PSSnapin                |
|                 |                                |
| clv             | Clear-Variable                 |
| gv              | Get-Variable                   |
| nv              | New-Variable                   |
| rv              | Remove-Variable                |
| set             | Set-Variable                   |
| sv              | Set-Variable                   |
|                 |                                |
| shcm            | Show-Command                   |
| trcm            | Trace-Command                  |
|                 |                                |
| dbp             | Disable-PSBreakpoint           |
| ebp             | Enable-PSBreakpoint            |
| gbp             | Get-PSBreakpoint               |
| rbp             | Remove-PSBreakpoint            |
| sbp             | Set-PSBreakpoint               |
| gcs             | Get-PSCallStack                |
|                 |                                |
|                 |                                |
| ise             | powershell_ise.exe             |
| **man**         | **help**                       |
| **md**          | **mkdir**                      |
| gin             | Get-ComputerInfo               |
| gtz             | Get-TimeZone                   |
| stz             | Set-TimeZone                   |



## Scripts, Commandlets, Functions

[Modules](https://docs.microsoft.com/en-us/powershell/scripting/learn/writing-portable-modules?view=powershell-6)

### Scripts

Scripts have a Data Section:

```ps1
$TextMsgs = DATA {
ConvertFrom-StringData @'
Text001 = The $Notebook variable contains the name of the user's system notebook.
Text002 = The $MyNotebook variable contains the name of the user's private notebook.
'@
}
$TextMsgs.Text001

The $Notebook variable contains the name of the user's system notebook.

$TextMsgs.Text002

The $MyNotebook variable contains the name of the user's private notebook.
```

Variables are not allowed here.


### Writing Scripts

#### Passing Values into scripts

The first command in a .PS1 file must be Param()

What follows is a list of the parameters followed by some attributes, default values, data type and finally its name

[See Documentation](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-6)

```powershell
Param(
  [parameter(Mandatory=$false)]
  [alias()]
  [Switch]
  $Screen
)
```

The very general format is as follows:
```powershell
Param(
  [parameter(
    Mandatory=$true, # | $false ,
    ParameterSetName="Computer", #| "User" | <property name of a passed object>
    ValueFromPipelineByPropertyName=$true, # |$false I guess, although, usually just omit
    HelpMessage="displays when a mandatory parameter value is missing from a command",

  )]
  [Alias("ShorterName", "SN")]
  [AllowNull()] # |[AllowNull()]
  [Validate...]
  [String] # [String[]] | [Int32] | [DateTime] | [Boolean] | [Switch]
  $Name = Some_Default_Value

  [parameter()]
  [Switch]
  $AnotherName

  #minimally
  [Int32]$Int_Value_Var
)
```
Switch is preferred to Boolean.  Boolean variable is of the format `-Name:$true` or `-Name:$false`, but switch is the preferred way to go about this.

Its not entirely clear when Parameter is required or not.  The examples dont use it if a Validate flag is also used: `[ValidateSet("Chocolate", "Strawberry", "Vanilla")][String]$flavor = Strawberry` but otherwise they seem to.  The Doc says use this or use `CmdletBinding`, which I am unsure what that is right now.

There are lots of built in methods for validating input.  A brief summary of the Validation Flags and their methods that can replace `[Validate...]` is below:

- `[ValidateCount(1,5)]` # Min and max number of this parameter '-Name Andy, John, David -Next'
- `[ValidateLength(1,10)]` #Character Length
- `[ValidatePattern("[0-9][0-9][0-9][0-9]")]` #This checks the input for 4 digits 0-9 each (2535)
- `[ValidateRange(0,10)]` # Validates an (presumably numerical) input is within expected range
- `[ValidateScript({$_ -ge (Get-Date)})]` #Uses a script to compare a value*
- `[ValidateSet("Low", "Average", "High")]` #Must be one of these values**
- `[ValidateSet([SoundNames])]` # Dynamically Generated Set, uses code to generate a set -see below
- `[ValidateNotNull()]` #Ensures the value isnt null, some data types its inherent eg. string
- `[ValidateNotNullOrEmpty()]` #as above, but also "empty" string (not null) or empty array
- `[ValidateDrive("C","D","Variable","Function")]` #Something about checking paths
- `[ValidateUserDrive()]`

\*complicated, but this example checks that a given date is greater than or equal than the current date

\*\*Assigning this at runtime will still check and can produced errors, eg setting $Name = "Medium" in the middle of the script will throw an error.

The associated example of `[ValidateSet([SoundNames])]`:
```powershell
Class SoundNames : System.Management.Automation.IValidateSetValuesGenerator {
    [String[]] GetValidValues() {
        $SoundPaths = '/System/Library/Sounds/',
            '/Library/Sounds','~/Library/Sounds'
        $SoundNames = ForEach ($SoundPath in $SoundPaths) {
            If (Test-Path $SoundPath) {
                (Get-ChildItem $SoundPath).BaseName
            }
        }
        return [string[]] $SoundNames
    }
}
```

### Modules (Writing)

#### Storing and Installing a Module

Once you have created a **script,** **binary,** or **manifest** module, you can save your work in a location that others may access it. For example, your module can be stored in the system folder where Windows PowerShell is installed, or it can be stored in a user folder.

Generally speaking, you can determine where you should install your module by using one of the paths stored in the **$ENV:PSModulePath** variable. Using one of these paths means that PowerShell can automatically find and load your module when a user makes a call to it in their code. If you store your module somewhere else, you can explicitly let PowerShell know by passing in the location of your module as a parameter when you call Install-Module.

Regardless, the path of the folder is referred to as the base of the module (ModuleBase), and the name of the script, binary, or manifest module file should be the same as the module folder name, with the following exceptions:

[Defining Modules](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_modules?view=powershell-7.1)


[How to write](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/writing-a-windows-powershell-module?view=powershell-7.1)

[Understanding Modules](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/understanding-a-windows-powershell-module?view=powershell-7.1)

[Write A Script Module](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module?view=powershell-7.1)

[Write a Binary Module](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-binary-module?view=powershell-7.1)

[Write a Manifest Module](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest?view=powershell-7.1)

#### Module Manifests

A module manifest is a .psd1 file that contains a hash table. The keys and values in the hash table do the following things:

- Describe the contents and attributes of the module.
- Define the prerequisites.
- Determine how the components are processed.

Manifests are **not required** for a module. Modules can reference script files (.ps1), script module files (.psm1), manifest files (.psd1), formatting and type files (.ps1xml), cmdlet and provider assemblies (.dll), resource files, Help files, localization files, or any other type of file or resource that is bundled as part of the module. For an internationalized script, the module folder also contains a set of message catalog files. If you add a manifest file to the module folder, you can reference the multiple files as a single unit by referencing the manifest.

- The manifest itself describes the following categories of information:
- Metadata about the module, such as the module version number, the author, and the description.
- Prerequisites needed to import the module, such as the Windows PowerShell version, the common language runtime (CLR) version, and the required modules.
- Processing directives, such as the scripts, formats, and types to process.
- Restrictions on the members of the module to export, such as the aliases, functions, variables, and cmdlets to export.


## COM Objects

interesting bits from above:

```ps1
$objShell = New-Object -ComObject Shell.Application
PS O:\OneDrive\Useful Software\Root\_Fonts> gm -InputObject $objShell


   TypeName: System.__ComObject#{286e6f1b-7113-4355-9562-96b7e9d64c54}

Name                 MemberType Definition
----                 ---------- ----------
AddToRecent          Method     void AddToRecent (Variant, string)
BrowseForFolder      Method     Folder BrowseForFolder (int, string, int, Variant)
CanStartStopService  Method     Variant CanStartStopService (string)
CascadeWindows       Method     void CascadeWindows ()
ControlPanelItem     Method     void ControlPanelItem (string)
EjectPC              Method     void EjectPC ()
Explore              Method     void Explore (Variant)
ExplorerPolicy       Method     Variant ExplorerPolicy (string)
FileRun              Method     void FileRun ()
FindComputer         Method     void FindComputer ()
FindFiles            Method     void FindFiles ()
FindPrinter          Method     void FindPrinter (string, string, string)
GetSetting           Method     bool GetSetting (int)
GetSystemInformation Method     Variant GetSystemInformation (string)
Help                 Method     void Help ()
IsRestricted         Method     int IsRestricted (string, string)
IsServiceRunning     Method     Variant IsServiceRunning (string)
MinimizeAll          Method     void MinimizeAll ()
NameSpace            Method     Folder NameSpace (Variant)
Open                 Method     void Open (Variant)
RefreshMenu          Method     void RefreshMenu ()
SearchCommand        Method     void SearchCommand ()
ServiceStart         Method     Variant ServiceStart (string, Variant)
ServiceStop          Method     Variant ServiceStop (string, Variant)
SetTime              Method     void SetTime ()
ShellExecute         Method     void ShellExecute (string, Variant, Variant, Variant, Variant)
ShowBrowserBar       Method     Variant ShowBrowserBar (string, Variant)
ShutdownWindows      Method     void ShutdownWindows ()
Suspend              Method     void Suspend ()
TileHorizontally     Method     void TileHorizontally ()
TileVertically       Method     void TileVertically ()
ToggleDesktop        Method     void ToggleDesktop ()
TrayProperties       Method     void TrayProperties ()
UndoMinimizeALL      Method     void UndoMinimizeALL ()
Windows              Method     IDispatch Windows ()
WindowsSecurity      Method     void WindowsSecurity ()
WindowSwitcher       Method     void WindowSwitcher ()
Application          Property   IDispatch Application () {get}
Parent               Property   IDispatch Parent () {get}
```

`New-Object -ComObject Shell.Application` is the actual important bit

[New-Object Doc](https://docs.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Utility/New-Object?view=powershell-5.0)

[Creating Objects](https://docs.microsoft.com/en-us/powershell/scripting/samples/creating-.net-and-com-objects--new-object-?view=powershell-6)

Example 2: Create an Internet Explorer COM object

```ps1
$IE = New-Object -COMObject InternetExplorer.Application -Property @{Navigate2="www.microsoft.com"; Visible = $True}
New-Object -TypeName System.Version -ArgumentList "1.2.3.4"
$A = New-Object -COMObject Word.Application -Strict -Property @{Visible = $True}
#Generates Error see doc link above.  Note ComObject though
The first command uses the *ComObject* parameter of the **New-Object** cmdlet to create a COM object with the Shell.Application ProgID. It stores the resulting object in the $ObjShell variable.
PS C:\> $Objshell = New-Object -COMObject "Shell.Application"

The second command pipes the $ObjShell variable to the **Get-Member** cmdlet, which displays the properties and methods of the COM object. Among the methods is the ToggleDesktop method.
PS C:\> $objshell | Get-Member
The third command calls the **ToggleDesktop** method of the object to minimize the open windows on your desktop.
PS C:\> $objshell.ToggleDesktop()
```
New-Object provides the most commonly-used functionality of the VBScript CreateObject function. A statement like `Set objShell = CreateObject("Shell.Application")` in VBScript can be translated to `$objShell = New-Object -COMObject "Shell.Application"` in Windows PowerShell.

New-Object expands upon the functionality available in the Windows Script Host environment by making it easy to work with .NET Framework objects from the command line and within scripts.

### Creating Objects

The .NET Framework Class Library includes a class named `System.Diagnostics.EventLog` that can be used to manage event logs. You can create a new instance of a .NET Framework class by using the `New-Object` cmdlet with the `TypeName` parameter.

[[2]] Although the command has created an instance of the EventLog class, the instance does not include any data. That is because we did not specify a particular event log. How do you get a real event log?

To refer to a specific event log, you need to specify the name of the log. New-Object has an ArgumentList parameter.

```ps1
PS> New-Object -TypeName System.Diagnostics.EventLog

  Max(K) Retain OverflowAction        Entries Name
  ------ ------ --------------        ------- ----
#[2]
PS> New-Object -TypeName System.Diagnostics.EventLog -ArgumentList Application

Max(K) Retain OverflowAction        Entries Name
------ ------ --------------        ------- ----
16,384      7 OverwriteOlder          2,160 Application
```

### Known Objects

Since most of the .NET Framework core classes are contained in the System namespace, Windows PowerShell will automatically attempt to find classes you specify in the System namespace if it cannot find a match for the typename you specify. This means that you can specify Diagnostics.EventLog instead of System.Diagnostics.EventLog.

- Word.Application
- InternetExplorer.Application
- "Shell.Application"


## WMI Objects



Cmdlets from `CimCmdlets` module are the most important cmdlets for general system management tasks. _**All critical subsystem settings are exposed through WMI. (Source)[https://docs.microsoft.com/en-us/powershell/scripting/samples/collecting-information-about-computers?view=powershell-6]**_

!!!Note Note - For the current computer, either use a dot `.` or omit `-ComputerName`.


That said

        `Get-CimInstance -ClassName Win32_Desktop -ComputerName .`

Gives me an error:

        PS C:\WINDOWS\system32> Get-CimInstance -ClassName Win32_Desktop -ComputerName .

        VERBOSE: Perform operation 'Enumerate CimInstances' with following parameters, ''namespaceName' = root\cimv2,'className' = Win32_Desktop'.

        Get-CimInstance : The client cannot connect to the destination specified in the request. Verify that the service on the destination is running and is accepting requests. Consult the logs and documentation for the WS-Management service running on the destination, most commonly
        IIS or WinRM. If the destination is the WinRM service, run the following command on the destination to analyze and configure the WinRM service: "winrm quickconfig".
        At line:1 char:1
        + Get-CimInstance -ClassName Win32_Desktop -ComputerName .
        + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
            + CategoryInfo          : ConnectionError: (root\cimv2:Win32_Desktop:String) [Get-CimInstance], CimException
            + FullyQualifiedErrorId : HRESULT 0x80338012,Microsoft.Management.Infrastructure.CimCmdlets.GetCimInstanceCommand
            + PSComputerName        : .

        VERBOSE: Operation 'Enumerate CimInstances' complete.

While:

        PS C:\WINDOWS\system32> Get-CimInstance -ClassName Win32_Desktop

        VERBOSE: Perform operation 'Enumerate CimInstances' with following parameters, ''namespaceName' = root\cimv2,'className' = Win32_Desktop'.

        VERBOSE: Operation 'Enumerate CimInstances' complete.
        SettingID Name                         ScreenSaverActive ScreenSaverSecure ScreenSaverTimeout
        --------- ----                         ----------------- ----------------- ------------------
                NT AUTHORITY\SYSTEM          False
                NT AUTHORITY\LOCAL SERVICE   False
                NT AUTHORITY\NETWORK SERVICE False
                DESKTOP\andyt                True              False             900
                DESKTOP\RDV GRAPHICS SERVICE False
                DESKTOP\Backup               False
                IIS APPPOOL\DefaultAppPool   False
                .DEFAULT                     False

To fix this I had to do

```ps1
Enable-PSRemoting
#Which gave an error (One of the network Adapters is set to public -after searching)
Get-NetConnectionProfile
    Name             : 0
    InterfaceAlias   : LAN1
    InterfaceIndex   : 16
    NetworkCategory  : Private
    IPv4Connectivity : Internet
    IPv6Connectivity : NoTraffic
    #...etc
Set-NetConnectionProfile -InterfaceIndex 71 -NetworkCategory Private
#for each public one
Enable-PSRemoting
Enable-PSRemoting -force #is also an option?
#now the below works:
Get-CimInstance -ClassName Win32_Desktop -ComputerName .
```

It seems that specifying Computer Name triggers it as a remote operation.

### WMI Objects within Win32_OperatingSystem

`PS R:\Icons> Get-CimInstance -Class Win32_OperatingSystem | Get-Member -MemberType Property | Select -Property "Name"`

VERBOSE: Perform operation 'Enumerate CimInstances' with following parameters, ''namespaceName' = root\cimv2,'className' = Win32_OperatingSystem'.

VERBOSE: Operation 'Enumerate CimInstances' complete.
Name                                     
----                                     
BootDevice                               
BuildNumber                              
BuildType                                
Caption                                  
CodeSet                                  
CountryCode                              
CreationClassName                        
CSCreationClassName                      
CSDVersion                               
CSName                                   
CurrentTimeZone                          
DataExecutionPrevention_32BitApplications
DataExecutionPrevention_Available        
DataExecutionPrevention_Drivers          
DataExecutionPrevention_SupportPolicy    
Debug                                    
Description                              
Distributed                              
EncryptionLevel                          
ForegroundApplicationBoost               
FreePhysicalMemory                       
FreeSpaceInPagingFiles                   
FreeVirtualMemory                        
InstallDate                              
LargeSystemCache                         
LastBootUpTime                           
LocalDateTime                            
Locale                                   
Manufacturer                             
MaxNumberOfProcesses                     
MaxProcessMemorySize                     
MUILanguages                             
Name                                     
NumberOfLicensedUsers                    
NumberOfProcesses                        
NumberOfUsers                            
OperatingSystemSKU                       
Organization                             
OSArchitecture                           
OSLanguage                               
OSProductSuite                           
OSType                                   
OtherTypeDescription                     
PAEEnabled                               
PlusProductID                            
PlusVersionNumber                        
PortableOperatingSystem                  
Primary                                  
ProductType                              
PSComputerName                           
RegisteredUser                           
SerialNumber                             
ServicePackMajorVersion                  
ServicePackMinorVersion                  
SizeStoredInPagingFiles                  
Status                                   
SuiteMask                                
SystemDevice                             
SystemDirectory                          
SystemDrive                              
TotalSwapSpaceSize                       
TotalVirtualMemorySize                   
TotalVisibleMemorySize                   
Version             

### Listing All WMI-Objects

```ps1
PS> Get-WmiObject -List

__SecurityRelatedClass                  __NTLMUser9X
__PARAMETERS                            __SystemSecurity
__NotifyStatus                          __ExtendedStatus
Win32_PrivilegesStatus                  Win32_TSNetworkAdapterSettingError
Win32_TSRemoteControlSettingError       Win32_TSEnvironmentSettingError
...

#These are equivalent
Get-WmiObject -List
Get-WmiObject -List -ComputerName .
Get-WmiObject -List -ComputerName Admin01
Get-WmiObject -List -ComputerName 192.168.1.90
Get-WmiObject -List -ComputerName 127.0.0.1
Get-WmiObject -List -ComputerName localhost
```



Get-WmiObject uses the root/cimv2 namespace by default. If you want to specify another WMI namespace, use the Namespace parameter and specify the corresponding namespace path:

### Get ComObject

[Source](https://www.powershellmagazine.com/2013/06/27/pstip-get-a-list-of-all-com-objects-available/)

[Script](http://gallery.technet.microsoft.com/Get-ComObject-Function-to-50a92047)

```ps1
Get-ChildItem HKLM:\Software\Classes -ErrorAction SilentlyContinue | Where-Object {
   $_.PSChildName -match '^\w+\.\w+$' -and (Test-Path -Path "$($_.PSPath)\CLSID")
} | Select-Object -ExpandProperty PSChildName
```


```ps1
function Get-ComObject {

    param(
        [Parameter(Mandatory=$true,
        ParameterSetName='FilterByName')]
        [string]$Filter,

        [Parameter(Mandatory=$true,
        ParameterSetName='ListAllComObjects')]
        [switch]$ListAll
    )

    $ListofObjects = Get-ChildItem HKLM:\Software\Classes -ErrorAction SilentlyContinue | Where-Object {
        $_.PSChildName -match '^\w+\.\w+$' -and (Test-Path -Path "$($_.PSPath)\CLSID")
    } | Select-Object -ExpandProperty PSChildName

    if ($Filter) {
        $ListofObjects | Where-Object {$_ -like $Filter}
    } else {
        $ListofObjects
    }
}
```




### Set Network Properties

#### Get-NetConnectionProfile

returns the following info:

        Name             : 0
        InterfaceAlias   : LAN1
        InterfaceIndex   : 16
        NetworkCategory  : Private
        IPv4Connectivity : Internet
        IPv6Connectivity : NoTraffic

##### Set-NetConnectionProfile

Can set Networks to Domain, Private and Public.  Esp. Useful when there is more than one, and Windows only lets you set the current (?Primary) one.



**Windows Management Instrumentation (WMI)** is a core technology for Windows system administration because it exposes a wide range of information in a uniform manner. Because of how much WMI makes possible, the Windows PowerShell cmdlet for accessing WMI objects, Get-WmiObject, is one of the most useful for doing real work.

 WMI classes describe the resources that can be managed. There are hundreds of WMI classes, some of which contain dozens of properties.

`Get-WmiObject` addresses this problem by making WMI discoverable. You can get a list of the WMI classes available on the local computer by typing:

### Get Computer Properties

#### Listing BIOS Information

The WMI Win32_BIOS class returns fairly compact and complete information about the system BIOS on the local computer:

`Get-CimInstance -ClassName Win32_BIOS -ComputerName .`

            SMBIOSBIOSVersion : 1802
            Manufacturer      : American Megatrends Inc.
            Name              : 1802
            SerialNumber      : System Serial Number
            Version           : ALASKA - 1072009
            PSComputerName    : .

#### Listing Processor Information

        Get-CimInstance -ClassName Win32_Processor -ComputerName . | Select-Object -ExcludeProperty "CIM*"
        Get-CimInstance -ClassName Win32_Processor

        #For a generic string of the processor family -  this works:
        Get-CimInstance -ClassName Win32_ComputerSystem -ComputerName . | Select-Object -Property SystemType

#### Listing Computer Manufacturer and Model

Computer model information is also available from Win32_ComputerSystem. The standard displayed output will not need any filtering to provide OEM data:


`Get-CimInstance -ClassName Win32_ComputerSystem`

#### Listing Installed Hotfixes
You can list all installed hotfixes by using Win32_QuickFixEngineering:

`Get-CimInstance -ClassName Win32_QuickFixEngineering -ComputerName`

Although you can use the Get-CimInstance's Property parameter to choose only the HotFixID, doing so will actually return more information, because all the metadata is displayed by default:

`Get-CimInstance -ClassName Win32_QuickFixEngineering -ComputerName . -Property HotFixID`

#### Listing Operating System Version Information

`Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName . | Select-Object -Property BuildNumber,BuildType,OSType,ServicePackMajorVersion,ServicePackMinorVersion`

You can also use wildcards with the Select-Object's Property parameter. Because all the properties beginning with either Build or ServicePack are important to use here, we can shorten this to the following form:

        `Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName . | Select-Object -Property Build*,OSType,ServicePack*`

#### Listing Local Users and Owner
Local general user information — number of licensed users, current number of users, and owner name — can be found with a selection of Win32_OperatingSystem class' properties. You can explicitly select the properties to display like this:

		`Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName . | Select-Object -Property NumberOfLicensedUsers,NumberOfUsers,RegisteredUser`
A more succinct version using wildcards is:

		`Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName . | Select-Object -Property *user*`

#### Getting Available Disk Space

To see the disk space and free space for local drives, you can use the Win32_LogicalDisk WMI class. You need to see only instances with a DriveType of 3 — the value WMI uses for fixed hard disks.

```ps1
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" -ComputerName .

DeviceID DriveType ProviderName VolumeName Size         FreeSpace   PSComputerName
----    ---- --------- ------------ ---------- ----         ---------   --------------
C:       3                      Local Disk 203912880128 65541357568 .
Q:       3                      New Volume 122934034432 44298250240 .

Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3" -ComputerName . | Measure-Object -Property FreeSpace,Size -Sum | Select-Object -Property Property,Sum

Property           Sum
--------           ---
FreeSpace 109839607808
Size      326846914560
```

#### Getting Logon Session Information

You can get general information about logon sessions associated with users through the `Win32_LogonSession` WMI class:

		Get-CimInstance -ClassName Win32_LogonSession -ComputerName .

#### Getting the User Logged on to a Computer

You can display the user logged on to a particular computer system using Win32_ComputerSystem. This command returns only the user logged on to the system desktop:

		Get-CimInstance -ClassName Win32_ComputerSystem -Property UserName -ComputerName .

#### Getting Local Time from a Computer

You can retrieve the current local time on a specific computer by using the Win32_LocalTime WMI class.

```ps1
Get-CimInstance -ClassName Win32_LocalTime -ComputerName .

Day          : 15
DayOfWeek    : 4
Hour         : 12
Milliseconds :
Minute       : 11
Month        : 6
Quarter      : 2
Second       : 52
WeekInMonth  : 3
Year         : 2017
PSComputerName : .
```

#### Displaying Service Status

To view the status of all services on a specific computer, you can locally use the `Get-Service` cmdlet. For remote systems, you can use the `Win32_Service` WMI class. If you also use Select-Object to filter the results to Status, Name, and DisplayName, the output format will be almost identical to that from Get-Service:

		Get-CimInstance -ClassName Win32_Service -ComputerName . | Select-Object -Property Status,Name,DisplayName

To allow the complete display of names for the occasional services with extremely long names, you may want to use `Format-Table` with the `AutoSize` and `Wrap` parameters, to optimize column width and allow long names to wrap instead of being truncated:

		Get-CimInstance -ClassName Win32_Service -ComputerName . | Format-Table -Property Status,Name,DisplayName -AutoSize -Wrap


### Actions


#### Locking a Computer

[Was there supposed to be something here?]

#### Calling User32.dll functions

!!!Note This should (at least in the old windows I grew up with)- expose lots of useful methods.

The only way to lock a computer directly with the standard available tools is to call the `LockWorkstation()` function in `user32.dll`:

        rundll32.exe user32.dll,LockWorkStation


This command immediately locks the workstation. It uses `rundll32.exe`, which runs Windows DLLs (and saves their libraries for repeated use) to run `user32.dll`, a library of Windows management functions.

When you lock a workstation while Fast User Switching is enabled, such as on Windows XP, the computer displays the user logon screen rather than starting the current user's screensaver.

To shut down particular sessions on a Terminal Server, use the `tsshutdn.exe` command-line tool.

#### Logging Off the Current Session

You can use several different techniques to log off of a session on the local system. The simplest way is to use the **Remote Desktop/Terminal Services** command-line tool, `logoff.exe` (For details, at the Windows PowerShell prompt, type logoff /?). To log off the current active session, type logoff with no arguments.

You can also use the shutdown.exe tool with its logoff option:

        shutdown.exe -l
        shutdown /t=0

A third option is to use WMI. The **Win32_OperatingSystem** class has a **Win32Shutdown method**. Invoking the method with the **0** flag initiates logoff:

		(Get-WmiObject -Class Win32_OperatingSystem -ComputerName .).Win32Shutdown(0)

For more information, and to find other features of the Win32Shutdown method, see "Win32Shutdown Method of the Win32_OperatingSystem Class" in MSDN.

#### Shutting Down or Restarting a Computer

Shutting down and restarting computers are generally the same types of task. Tools that shut down a computer will generally restart it as well—and vice versa. There are two straightforward options for restarting a computer from Windows PowerShell. Use either `Tsshutdn.exe` or `Shutdown.exe` with appropriate arguments. You can get detailed usage information from `tsshutdn.exe /?` or `shutdown.exe /?`.

You can also perform shutdown and restart operations directly from Windows PowerShell as well.

To shut down the computer, use the `Stop-Computer` command

To restart the operating system, use the `Restart-Computer` command

To force an immediate restart, use the -Force parameter. `Restart-Computer -Force`



### Performing Networking Tasks

Because TCP/IP is the most commonly used network protocol, most low-level network protocol administration tasks involve TCP/IP. In this section, we use Windows PowerShell and WMI to do these tasks.

#### Listing IP Addresses for a Computer
To get all IP addresses in use on the local computer, use the following command:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true -ComputerName . | Format-Table -Property IPAddress

The output of this command differs from most property lists, because values are enclosed in braces:

        IPAddress
        ---------
        {192.168.1.80}
        {192.168.148.1}
        {192.168.171.1}
        {0.0.0.0}

To understand why the braces appear, use the `Get-Member` cmdlet to examine the IPAddress property:

        PS> Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true -ComputerName . | Get-Member -Name IPAddress


        TypeName: System.Management.ManagementObject#root\cimv2\Win32_NetworkAdapterConfiguration

        Name      MemberType Definition
        ----      ---------- ----------
        IPAddress Property   System.String[] IPAddress {get;}

The IPAddress property for each network adapter is actually an array. The braces in the definition indicate that IPAddress is not a *System.String* value, but an *array of System.String* values.

#### Listing IP Configuration Data

To display detailed IP configuration data for each network adapter, use the following command:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true -ComputerName .

The default display for the network adapter configuration object is a very reduced set of the available information. For in-depth inspection and troubleshooting, use `Select-Object` or a formatting cmdlet, such as `Format-List`, to specify the properties to be displayed.

If you are not interested in **IPX** or **WINS** properties—probably the case in a modern TCP/IP network—you can use the `ExcludeProperty` parameter of `Select-Object` to hide properties with names that begin with "WINS" or "IPX:"

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true -ComputerName . | Select-Object -Property [a-z]* -ExcludeProperty IPX*,WINS*

This command returns detailed information about *DHCP, DNS, routing*, and other minor IP configuration properties.

#### Pinging Computers

You can perform a simple ping against a computer using by `Win32_PingStatus`. The following command performs the ping, but returns lengthy output:

		Get-WmiObject -Class Win32_PingStatus -Filter "Address='127.0.0.1'" -ComputerName .

A more useful form for summary information a display of the Address, ResponseTime, and StatusCode properties, as generated by the following command. The Autosize parameter of Format-Table resizes the table columns so that they display properly in Windows PowerShell.

        PS> Get-WmiObject -Class Win32_PingStatus -Filter "Address='127.0.0.1'" -ComputerName . | Format-Table -Property Address,ResponseTime,StatusCode -Autosize

        Address   ResponseTime StatusCode
        -------   ------------ ----------
        127.0.0.1            0          0

A StatusCode of 0 indicates a successful ping.

You can use an array to ping multiple computers with a single command. Because there is more than one address, use the ForEach-Object to ping each address separately:

		'127.0.0.1','localhost','research.microsoft.com' | ForEach-Object -Process {Get-WmiObject -Class Win32_PingStatus -Filter ("Address='" + $_ + "'") -ComputerName .} | Select-Object -Property Address,ResponseTime,StatusCode

You can use the same command format to ping all of the computers on a subnet, such as a private network that uses network number 192.168.1.0 and a standard Class C subnet mask (255.255.255.0)., Only addresses in the range of 192.168.1.1 through 192.168.1.254 are legitimate local addresses (0 is always reserved for the network number and 255 is a subnet broadcast address).

To represent an array of the numbers from 1 through 254 in Windows PowerShell, use the statement 1..254. A complete subnet ping can be performed by generating the array and then adding the values onto a partial address in the ping statement:

		1..254| ForEach-Object -Process {Get-WmiObject -Class Win32_PingStatus -Filter ("Address='192.168.1." + $_ + "'") -ComputerName .} | Select-Object -Property Address,ResponseTime,StatusCode

Note that this technique for generating a range of addresses can be used elsewhere as well. You can generate a complete set of addresses in this way:

		$ips = 1..254 | ForEach-Object -Process {'192.168.1.' + $_}

#### Retrieving Network Adapter Properties

Earlier in this user's guide, we mentioned that you could retrieve general configuration properties by using `Win32_NetworkAdapterConfiguration`. Although not strictly TCP/IP information, network adapter information such as MAC addresses and adapter types can be useful for understanding what is going on with a computer. To get a summary of this information, use the following command:

		Get-WmiObject -Class Win32_NetworkAdapter -ComputerName .
        #also
        Get-NetAdapter


#### Assigning the DNS Domain for a Network Adapter

To assign the DNS domain for automatic name resolution, use the Win32_NetworkAdapterConfiguration SetDNSDomain method. Because you assign the DNS domain for each network adapter configuration independently, you need to use a ForEach-Object statement to assign the domain to each adapter:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true -ComputerName . | ForEach-Object -Process { $_. SetDNSDomain('fabrikam.com') }


The filtering statement `"IPEnabled=$true"` is necessary, because even on a network that uses only TCP/IP, several of the network adapter configurations on a computer are not true TCP/IP adapters; they are general software elements supporting RAS, PPTP, QoS, and other services for all adapters and thus do not have an address of their own.

You can filter the command by using the `Where-Object` cmdlet, instead of using the `Get-WmiObject` filter.

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -ComputerName . | Where-Object -FilterScript {$_.IPEnabled} | ForEach-Object -Process {$_.SetDNSDomain('fabrikam.com')}

#### Performing DHCP Configuration Tasks

Modifying DHCP details involves working with a set of network adapters, just as the DNS configuration does. There are several distinct actions you can perform by using WMI, and we will step through a few of the common ones.

#### Determining DHCP-Enabled Adapters

To find the DHCP-enabled adapters on a computer, use the following command:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" -ComputerName .

To exclude adapters with IP configuration problems, you can retrieve only IP-enabled adapters:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled=$true and DHCPEnabled=$true" -ComputerName .

#### Retrieving DHCP Properties

Because DHCP-related properties for an adapter generally begin with "DHCP," you can use the Property parameter of Format-Table to display only those properties:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" -ComputerName . | Format-Table -Property DHCP*

#### Enabling DHCP on Each Adapter

To enable DHCP on all adapters, use the following command:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=$true -ComputerName . | ForEach-Object -Process {$_.EnableDHCP()}

You can use the Filter statement `"IPEnabled=$true and DHCPEnabled=$false"` to avoid enabling DHCP where it is already enabled, but omitting this step will not cause errors.

#### Releasing and Renewing DHCP Leases on Specific Adapters

The `Win32_NetworkAdapterConfiguration` class has `ReleaseDHCPLease` and `RenewDHCPLease` methods. Both are used in the same way. The easiest way to filter adapters on a subnet is to choose only the adapter configurations that use the gateway for that subnet. For example, the following command releases all DHCP leases on adapters on the local computer that are obtaining DHCP leases from `192.168.1.254`:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled=$true and DHCPEnabled=$true" -ComputerName . | Where-Object -FilterScript {$_.DHCPServer -contains '192.168.1.254'} | ForEach-Object -Process {$_.ReleaseDHCPLease()}

The only change for renewing a DHCP lease is to use the `RenewDHCPLease` method instead of the `ReleaseDHCPLease` method:

		Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled=$true and DHCPEnabled=$true" -ComputerName . | Where-Object -FilterScript {$_.DHCPServer -contains '192.168.1.254'} | ForEach-Object -Process {$_.ReleaseDHCPLease()}

!!!Warning  When using these methods on a remote computer, be aware that you can lose access to the remote system if you are connected to it through the adapter with the released or renewed lease.

#### Releasing and Renewing DHCP Leases on All Adapters

You can perform global DHCP address releases or renewals on all adapters by using the `Win32_NetworkAdapterConfiguration` methods, `ReleaseDHCPLeaseAll` and `RenewDHCPLeaseAll`. However, the command must apply to the WMI class, rather than a particular adapter, because releasing and renewing leases globally is performed on the class, not on a specific adapter.

You can get a reference to a WMI class, instead of class instances, by listing all WMI classes and then selecting only the desired class by name. For example, the following command returns the `Win32_NetworkAdapterConfiguration` class:

		Get-WmiObject -List | Where-Object -FilterScript {$_.Name -eq 'Win32_NetworkAdapterConfiguration'}

You can treat the entire command as the class and then invoke the `ReleaseDHCPAdapterLease` method on it. In the following command, the parentheses surrounding the `Get-WmiObject` and `Where-Object` pipeline elements direct Windows PowerShell to evaluate them first:

		( Get-WmiObject -List | Where-Object -FilterScript {$_.Name -eq 'Win32_NetworkAdapterConfiguration'} ).ReleaseDHCPLeaseAll()

You can use the same command format to invoke the `RenewDHCPLeaseAll` method:

		( Get-WmiObject -List | Where-Object -FilterScript {$_.Name -eq 'Win32_NetworkAdapterConfiguration'} ).RenewDHCPLeaseAll()

### Creating a Network Share

To create a network share, use the Win32_Share Create method:

		(Get-WmiObject -List -ComputerName . | Where-Object -FilterScript {$_.Name -eq 'Win32_Share'}).Create('C:\temp','TempShare',0,25,'test share of the temp folder')

You can also create the share by using net share in Windows PowerShell:

		net share tempshare=c:\temp /users:25 /remark:"test share of the temp folder"

#### Removing a Network Share

You can remove a network share with Win32_Share, but the process is slightly different from creating a share, because you need to retrieve the specific share to be removed, rather than the Win32_Share class. The following statement deletes the share "TempShare":

		(Get-WmiObject -Class Win32_Share -ComputerName . -Filter "Name='TempShare'").Delete()

`Net share` works as well: `PS> net share tempshare /delete`

        tempshare was deleted successfully.

### Connecting a Windows Accessible Network Drive

The `New-PSDrive` cmdlets creates a Windows PowerShell drive, but drives created this way are available only to Windows PowerShell. To create a new networked drive, you can use the `WScript.Network` COM object. The following command maps the share `\\FPS01\users` to local drive B:

		(New-Object -ComObject WScript.Network).MapNetworkDrive('B:', '\\FPS01\users')

The net use command works as well:

		net use B: \\FPS01\users

Drives mapped with either WScript.Network or net use are immediately available to Windows PowerShell.



## Useful things to do

### Get Environment Vars

You can navigate to the environment like a directory.

```ps1
Set-Location Env:
Get-ChildItem

gci Env: #also works ENV: and env: but not Env (no colon)

#b
Get-Item -path Env:* | Get-Member
```
`$` is required when you get to directly referencing it `$Env:windir`


#### Append values to path (in Powershell)

To append ";c:\temp" to the value of the Path environment variable, use the following syntax:

```ps1
$Env:path += ";c:\temp"

Add-Content -Path $Profile.CurrentUserAllHosts -Value '$Env:Path += ";C:\Temp"'
```

Environment Variables That Store Preferences

`$Env:PSExecutionPolicyPreference` Stores the execution policy set for the current session. Note- this only exists if set explicitly for that session (either passed as a startup arg, or using explicit command `Set-ExecutionPolicy`)

` $Env:PSModulePath` on Windows the default is: `$HOME\Documents\WindowsPowerShell\Modules;$PSHOME\Modules`

and on Linux or Mac

`$HOME/.local/share/powershell/Modules:/usr/local/share/powershell/Modules:$PSHOME/Modules`


!!!Attention Attention: On _Windows-_ the _semicolon_ ( ` ; ` ) in the command separates the new path from the path that precedes it in the list, while On _Linux_ or MacOS, the colon ( ` : ` ) in the command separates the new path from the path that precedes it in the list.

For example, to add the *"C:\Program Files\Fabrikam\Modules" directory* to the value of the PSModulePath environment variable

        `$Env:PSModulePath += ";C:\Program Files\Fabrikam\Modules"`

On Linux or MacOS, to add the "/usr/local/Fabrikam/Modules" directory to the value of the PSModulePath environment variable, type:

        $Env:PSModulePath += ":/usr/local/Fabrikam/Modules"

### Search for files

Better than Windows Search

[More Info and Ideas](https://devblogs.microsoft.com/scripting/use-windows-powershell-to-search-for-files/)

`gci -force -recurse -ErrorAction SilentlyContinue -Include *.exe | Where-Object { $_.BaseName -like "RTools"}`

using comaprison operators:

Use comparison operators (-eq, -ne, -gt, -lt, -le, -ge) to compare values and test conditions. For example, you can compare two string values to determine whether they are equal.

The comparison operators also include operators that find or replace patterns in text. The (-match, -notmatch, -replace) operators use regular expressions, and (-like, -notlike) use wildcards *.

Containment comparison operators determine whether a test value appears in a reference set (`-in`,` -notin`, `-contains`, `-notcontains`).

### Loading Modules

[Online Module Browser](https://docs.microsoft.com/en-us/powershell/module/)
[Special Modules?](https://docs.microsoft.com/en-us/powershell/module/dataprotectionmanager/?view=systemcenter-ps-2016)
[Microsoft Modules](https://docs.microsoft.com/en-us/powershell/module/?view=win10-ps)
[https://www.powershellgallery.com/](https://www.powershellgallery.com/)

ImportSystemModules
`Get-InstalledModule` - Lists (Locally available Modules)\

`Import-Module [NAME]` - Will import the given module.

Some useful ones:
ISEScriptingGeek
ISEScriptAnalyzerAddOn
ISEModuleBrowserAddon

```powershell
Set-Alias immo Import-Module
immo ScriptBrowser
IseSteroids
ISEScriptAnalyzerAddOn
ISEModuleBrowserAddon
ScriptBrowser
```

Install-Package ISEModuleBrowserAddOn
Install-Package ISEScriptAnalyzerAddOn

> Find-Module -Name "*ISE*"  #REquires the "*"

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Find-Module                                        2.1.2      PowershellGet
Function        Get-InstalledModule                                2.1.2      PowerShellGet
Function        Install-Module                                     2.1.2      PowershellGet
Function        Publish-Module                                     2.1.2      PowershellGet
Function        Save-Module                                        2.1.2      PowershellGet
Function        Uninstall-Module                                   2.1.2      PowershellGet
Function        Update-Module                                      2.1.2      PowershellGet
Cmdlet          Get-Module                                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Import-Module                                      3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          New-Module                                         3.0.0.0    Microsoft.PowerShell.Core
Cmdlet          Remove-Module                                      3.0.0.0    Microsoft.PowerShell.Core
Export-ModuleMember
ImportSystemModules
InModuleScope
New-ModuleManifest
Test-ModuleManifest
Update-ModuleManifest

### Get Commands




Get-Command -Module ScriptBrowser | Select-Object -Property Name


Get-Command -Module ISEScriptingGeek | Select-Object -Property Name | Format-Wide -Column 2

1
Install-Module -Name ISEScriptingGeek -Force -Verbose

### Write Lines

Add-Content c:\scripts\test.txt "The End"
By default, data is appended after the last character. If you want to append the data on a new line in the text document, use 'n. are some other special characters that can be used with add-content cmdlet.

Here are some other special characters that can be used with the add-content cmdlet.

`0 -- Null
`a -- Alert
`b -- Backspace
`n -- New line
`r -- Carriage return
`t -- Horizontal tab
`' -- Single quote
`" -- Double quote


### Turn off the screen

`(Add-Type '[DllImport("user32.dll")] public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)`

or in Command prompt:

`powershell (Add-Type '[DllImport(\"user32.dll\")]^public static extern int SendMessage(int hWnd, int hMsg, int wParam, int lParam);' -Name a -Pas)::SendMessage(-1,0x0112,0xF170,2)`

### Get Module Properties

```powershell
#Example
Get-Module -Name ISESteroids | Get-Member -MemberType Property | Format-Table Name
#Just lists a bunch of useless fields
Get-Module -Name ISESteroids | Get-Member -MemberType Property | Out-Gridview

#Example
Get-Module -ListAvailable -All | Format-Table -Property Name, Moduletype, Path -Groupby Name

#Combining the two gives me the information of Path I wanted
Get-Module -Name ISESteroids | Format-Table -Property Name, Moduletype, Path -Groupby Name

```

### Get The Commands in a Module

- **Example 1: Get cmdlets, functions, and aliases** `PS C:\>Get-Command` This command gets the Windows PowerShell cmdlets, functions, and aliases that are installed on
the computer.

- **Example 2: Get commands in the current session** `Get-Command -ListImported` This command uses the ListImported parameter to get only the commands in the current session.

- **Example 3: Get cmdlets and display them in order** `Get-Command -Type Cmdlet | Sort-Object -Property Noun | Format-Table -GroupBy Noun` This command gets all of the cmdlets, sorts them alphabetically by the noun in the cmdlet name, and then displays them in noun-based groups. This display can help you find the cmdlets for a task.

- **Example 4: Get commands in a module** `Get-Command -Module Microsoft.PowerShell.Security, PSScheduledJob`  This command uses the Module parameter to get the commands in the Microsoft.PowerShell.Security and PSScheduledJob modules.

- **Example 5: Get information about a cmdlet** `Get-Command Get-AppLockerPolicy`  This command gets information about the Get-AppLockerPolicy cmdlet. It also imports the AppLocker module, which adds all of the commands in the AppLocker module to the current session.

  - When a module is imported automatically, the effect is the same as using the Import-Module cmdlet. The module can add commands, types and formatting files, and run scripts in the session.

- **Example 8: Get all commands of all types** `Get-Command *` This command gets all commands of all types on the local computer, including executable files in the paths of the Path environment variable ($env:path). It returns an ApplicationInfo object System.Management.Automation.ApplicationInfo) for each file, not a FileInfo object (System.IO.FileInfo)

- **Example 9: Get cmdlets by using a name** `Get-Command -ParameterName *Auth* -ParameterType AuthenticationMechanism` This command gets cmdlets that have a parameter whose name includes Auth and whose type is AuthenticationMechanism . You can use a command like this one to find cmdlets that let you specify the method that is used to authenticate the user. The ParameterType parameter distinguishes parameters that take an AuthenticationMechanism value from those that take an AuthenticationLevel parameter, even when they have similar names.

- **Example 10: Get an alias** `Get-Command dir` This example shows how to use the Get-Command cmdlet with an alias. Although it is typically used on cmdlets and functions, Get-Command also gets scripts, functions, aliases, workflows, and executable files.

```
CommandType     Name                                               ModuleName
-----------     ----                                               ----------
Alias           dir -> Get-ChildItem
```

- - The output of the command shows the special view of the Name property value for aliases. The view
shows the alias and the full command name.
- **Example 11: Get all instances of the Notepad command** `Get-Command Notepad -All | Format-Table CommandType, Name, Definition` This example uses the All parameter of the Get-Command cmdlet to show all instances of the "Notepad" command on the local computer. The All parameter is useful when there is more than one command with the same name in the session.

```
CommandType     Name           Definition
-----------     ----           ----------
Application     notepad.exe    C:\WINDOWS\system32\notepad.exe
Application     NOTEPAD.EXE    C:\WINDOWS\NOTEPAD.EXE
```

### Set the default output as verbose

By default Powershell doesn't show Verbose output.  This is in a preference variable.  It can be changed by changing the value of the variable `$VerbosePreference`.  Simply calling `$VerbosePreference` will get the current setting.  Must be one of: `[SilentlyContinue], Stop, Continue, Inquire, Ignore, Suspend`.

[More Information](https://blogs.technet.microsoft.com/heyscriptingguy/2014/07/30/use-powershell-to-write-verbose-output/)

It is not recommended to set this in your profile simply.

```powershell
$VerbosePreference = "Continue"  # "Silently Continue" [Default],
```

### Fix DICOM Errors

Need [Grant, Revoke, Get DCOM permissions using PowerShell](https://gallery.technet.microsoft.com/Grant-Revoke-Get-DCOM-22da5b96)
It can be installed via ScriptBrowser

```powershell
cd "C:\Users\andyt\Documents\WindowsPowerShell\Scripts\Grant-Revoke-Get-DCOM-22da5b96\DCOMPermissions"
Import-Module .\DCOMPermissions.psm1
Grant-DComPermission -ApplicationID "{4839DDB7-58C2-48F5-8283-E1D1807D0D7D}" -Account "SYSTEM" -Type Launch -Permissions LocalLaunch,LocalActivation -OverrideConfigurationPermissions
```

### Check if a directory exists and create it if not

THis was designed to work with VS-Code, it might not be universal


try{ Test-Path  -EA Stop ~\md; cd md\} catch {mkdir ~\md\; cd md\}

### Check if a file exists

PS O:\OneDrive\Programming\Powershell\DCOMPermissions> Test-Path -LiteralPath $DCOMFile
True

PS O:\OneDrive\Programming\Powershell\DCOMPermissions> Test-Path -LiteralPath $DCOMWrong
False


### Check if a process exists

```ps1
PS> test (get-Process |where {$_.name -eq “PowerShell”})
TRUE
PS> test (get-Process |where {$_.name -eq “NoSuchProcess”})
FALSE
```

### Customize the Windows PowerShell prompt

```powershell
PS C:\>
function prompt { 'PowerShell: ' + (get-location) + '> '}
PowerShell: C:\WINDOWS>
```

This example shows how to customize the Windows PowerShell prompt. The function that defines the prompt includes a Get-Location command, which is run whenever the prompt appears
in the console.

The format of the default Windows PowerShell prompt is defined by a special function named prompt. You can change the prompt in your console by creating a new function named
prompt.

To see the current prompt function, type the following command: `Get-Content Function:prompt`

The command begins with the function keyword followed by the function name, prompt. The function body appears within braces ( {} ).

This command defines a new prompt that begins with the string PowerShell: . To append the current location, it uses a Get-Location command, which runs when the prompt function is
called. The prompt ends with the string "> ".

### Get Files

Get the files in a directory

```ps1
C:\PS>Get-ChildItem -Attributes !Directory,!Directory+Hidden
C:\PS> dir -att !d,!d+h
```

These command get all files, including hidden files, in the current directory, but exclude subdirectories. The second command uses aliases and abbreviations, but has the same effect as
the first.

`get-childitem -name`   This command retrieves only the names of items in the current directory

### VHDs

```ps1
Set-Location -Path 'O:\Portable'
Get-VHD -Path .\PortableVHD.vhdx
Get-Command -Noun *VHD*

   6 $VHD = Get-VHD -Path .\PortableVHD.vhdx
   7 Resize-VHD -Path $VHD
   8 Get-Help Resize-VHD
   9 Get-Help Resize-VHD -examples
  10 Get-VHD -Path .\PortableVHD.vhdx
  11 1046495744 / 1024
  12 1021968 / 1024
  13 Get-Help Convert-VHD
  14 Resize-VHD -Path $VHD -SizeBytes 8GB
  15 $VHD = Get-VHD -Path .\PortableVHD.vhdx
  16 $VHD
  17 Resize-VHD -Path $VHD.Path -SizeBytes 8GB -Verbose -Debug
  18 $VHD
  19 Get-VHD -Path .\PortableVHD.vhdx
```



### Count Folder Items

(gl|gci|measure).Count  count folder items


### Copy all of a type somewhere else

gci -Recurse -File -Include "*.ttf" -Name | copy-item -Destination .\^


### Install Fonts

```ps1
param(
[Parameter(Mandatory=$true,Position=0)]
[ValidateNotNull()]
[array]$pcNames,
[Parameter(Mandatory=$true,Position=1)]
[ValidateNotNull()]
[string]$fontFolder
)
$padVal = 20
$pcLabel = "Connecting To".PadRight($padVal," ")
$installLabel = "Installing Font".PadRight($padVal," ")
$errorLabel = "Computer Unavailable".PadRight($padVal," ")
$openType = "(Open Type)"
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts"
$objShell = New-Object -ComObject Shell.Application
if(!(Test-Path $fontFolder))
{
    Write-Warning "$fontFolder - Not Found"
}
else
{
    $objFolder = $objShell.namespace($fontFolder)
    foreach ($pcName in $pcNames)
    {
        Try{
            Write-Output "$pcLabel : $pcName"
            $null = Test-Connection $pcName -Count 1 -ErrorAction Stop
            $destination = "\\",$pcname,"\c$\Windows\Fonts" -join ""
            foreach ($file in $objFolder.items())
            {
                $fileType = $($objFolder.getDetailsOf($file, 2))
                if(($fileType -eq "OpenType font file") -or ($fileType -eq "TrueType font file"))
                {
                    $fontName = $($objFolder.getDetailsOf($File, 21))
                    $regKeyName = $fontName,$openType -join " "
                    $regKeyValue = $file.Name
                    Write-Output "$installLabel : $regKeyValue"
                    Copy-Item $file.Path  $destination
                    Invoke-Command -ComputerName $pcName -ScriptBlock { $null = New-ItemProperty -Path $args[0] -Name $args[1] -Value $args[2] -PropertyType String -Force } -ArgumentList $regPath,$regKeyname,$regKeyValue
                }
            }
        }
        catch{
            Write-Warning "$errorLabel : $pcName"
        }
    }
}
```


## Displaying Markdown

[More Here](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/show-markdown?view=powershell-7)

Show-Markdown
Module: Microsoft.PowerShell.Utility

Shows a Markdown file or string in the console in a friendly way using VT100 escape sequences or in a browser using HTML.

```ps1
Show-Markdown
    [-Path] <String[]>
    [-UseBrowser]
    [<CommonParameters>]
PowerShell

Show-Markdown
    -InputObject <PSObject>
    [-UseBrowser]
    [<CommonParameters>]
PowerShell

Show-Markdown
    -LiteralPath <String[]>
    [-UseBrowser]
    [<CommonParameters>]
```


### Description
The Show-Markdown cmdlet is used to render Markdown in a human readable format either in a terminal or in a browser.

`Show-Markdown` can return a string that includes the VT100 escape sequences which the terminal renders (if it supports VT100 escape sequences). This is primarily used for viewing Markdown files in a terminal. You can also get this string via the ConvertFrom-Markdown by specifying the AsVT100EncodedString parameter.

`Show-Markdown` also has the **ability to open a browser and show you a rendered version of the Markdown.** It renders the Markdown by turning it into HTML and opening the HTML file in your default browser.

You can change how Show-Markdown renders Markdown in a terminal by using Set-MarkdownOption.

This cmdlet was introduced in PowerShell 6.1.


```ps1
#Example 1: Simple example specifying a path

Show-Markdown -Path ./README.md

#Example 2: Simple example specifying a string

@"
# Show-Markdown

## Markdown

You can now interact with Markdown via PowerShell!

*stars*
__underlines__
"@ | Show-Markdown

#Example 2: Opening Markdown in a browser

Show-Markdown -Path ./README.md -UseBrowser
```

### Parameters
- `-InputObject`
 - A Markdown string that will be shown in the terminal. If you do not pass in a supported format, Show-Markdown will emit an error.
    - Type: - [[*PSObject*]]
    - Position: - ***Named***
    - Default value: - **None**
    - Accept pipeline input: - **True**
    - Accept wildcard characters: - **False**
- `-LiteralPath` - Specifies the path to a Markdown file. Unlike the Path parameter, the value of LiteralPath is used exactly as it is typed. No characters are interpreted as wildcards. If the path includes escape characters, enclose it in single quotation marks. Single quotation marks tell PowerShell not to interpret any characters as escape sequences.
    - Type: - *String[]*
    - Aliases: - *PSPath, LP*
    - Position: - ***Named***
    - Default value: - **None**
    - Accept pipeline input: - **True**
    - Accept wildcard characters: - **False**
- `-Path` - Specifies the path to a Markdown file to be rendered.
    - Type: - *String[]*
    - Position: - *0*
    - Default value: - **None**
    - Accept pipeline input: - **True**
    - Accept wildcard characters: - **True**
- `-UseBrowser` - Compiles the Markdown input as HTML and opens it in your default browser.
    - Type: - *SwitchParameter*
    - Position: - ***Named***
    - Default value: - **False**
    - Accept pipeline input: - **False**
    - Accept wildcard characters: - **False**


###   Set-MarkdownOption

[Doc](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/set-markdownoption?view=powershell-7)


Module: Microsoft.PowerShell.Utility

Sets the colors and styles used for rendering Markdown content in the console.

#### Syntax

```ps1
Set-MarkdownOption
   [-Header1Color <String>]
   [-Header2Color <String>]
   [-Header3Color <String>]
   [-Header4Color <String>]
   [-Header5Color <String>]
   [-Header6Color <String>]
   [-Code <String>]
   [-ImageAltTextForegroundColor <String>]
   [-LinkForegroundColor <String>]
   [-ItalicsForegroundColor <String>]
   [-BoldForegroundColor <String>]
   [-PassThru]
   [<CommonParameters>]

Set-MarkdownOption
   [-PassThru]
   -Theme <String>
   [<CommonParameters>]

Set-MarkdownOption
   [-PassThru]
   [-InputObject] <PSObject>
   [<CommonParameters>]
```

#### Description

Sets the colors and styles used for rendering Markdown content in the console. These styles are defined using ANSI escape codes that change the color and style of the Markdown text being rendered.


For more information about Markdown, see the CommonMark website.

#### Note

The string values used in the settings are the characters that follow the Escape character ([char]0x1B) for the ANSI escape sequence. Do not include the Escape character in the string. For more information about ANSI escape codes work, see ANSI_escape_code.

#### Examples

```ps1
# Example 1 - Switch to the Light Theme
# This example selects the Light theme and displays the new configuration using the PassThru parameter.

Set-MarkdownOption -Theme Light -PassThru

Header1         : [7m
Header2         : [4;33m
Header3         : [4;34m
Header4         : [4;35m
Header5         : [4;36m
Header6         : [4;30m
Code            : [48;2;155;155;155;38;2;30;30;30m
Link            : [4;38;5;117m
Image           : [33m
EmphasisBold    : [1m
EmphasisItalics : [36m
# Example 2 - Customize the color and style settings
#This example changes the escape code for the Markdown headers. The default configuration for headers renders them as underlined text of various colors. This change removes the underline style.

$mdOptions = Get-MarkdownOption
$mdOptions.Header2 = '[93m'
$mdOptions.Header3 = '[94m'
$mdOptions.Header4 = '[95m'
$mdOptions.Header5 = '[96m'
$mdOptions.Header6 = '[97m'

Set-MarkdownOption -InputObject $mdOptions -PassThru

Header1         : [7m
Header2         : [93m
Header3         : [94m
Header4         : [95m
Header5         : [96m
Header6         : [97m
Code            : [48;2;155;155;155;38;2;30;30;31m
Link            : [4;38;5;117m
Image           : [33m
EmphasisBold    : [1m
EmphasisItalics : [36m
```

Parameters see link 
