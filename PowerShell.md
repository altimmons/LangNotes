# PowerShell

## Settings

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
        $                              Env:                                                                                                                                                            
        ?                              True                                                                                                                                                            
        ^                              gci                                                                                                                                                             
        args                           {}                                                                                                                                                              
        ConfirmPreference              High                                                                                                                                                            
        ConsoleFileName                                                                                                                                                                                
        DebugPreference                SilentlyContinue                                                                                                                                                
        Error                          {Cannot find path 'O:\Portable\Env' because it does not exist., Cannot find path 'O:\Portable\Variable' because it does not exist., System.Management.Automat...
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

## Ref:

[Getting Started with Powershell](https://docs.microsoft.com/en-us/powershell/scripting/powershell-scripting)



## Basics

The Program is stored in C:\Windows\System32\WindowsPowerShell\v1.0

[C:\Windows\System32\WindowsPowerShell\v1.0](C:\)




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

### Comments

Comments are marked with `#`.

Block comments start with `<#` and end with `#>`.

### Data Types

Encountered so far

[String] 
[String[]]
[Int32]
[DateTime]
[Boolean]
[Switch]

Plus there are Objects

#### Boolean

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

## Commands

### Get-Help

`Get-Help [ModuleName] -examples -online`

### Set-Alias

Create a bit of shorthand for yourself

```powershell
Set-Alias immo import-module
>immo ISESteroids
```

### Get-Member

Investigate whats in an object

`Get-member`

### Output (Print)

`Write-Host`

`Write-Debug`

`Read-Host -Prompt` -this can't do formatting unfortunately

## Useful things to do

### Loading Modules

`Get-InstalledModule` - Lists (Locally available Modules)\

`Import-Module [NAME]` - Will import the given module.

Some useful ones:

```powershell
Set-Alias immo Import-Module
immo ScriptBrowser
IseSteroids
ISEScriptAnalyzer ?
ISEModuleBrowser ?
```

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

## Writing Scripts

### Passing Values into scripts

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
 param( [int]$Price, [int]$Tax )
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

Don't add brackets around the function parameters:

```powershell
$result = Add-Numbers (5, 10) --Wrong!
$result = Add-Numbers 5 10    --Right
```

### Loops in PS

#### ForEach-Object

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

ForEach-Object has two aliases, ForEach and %, and also supports shorthand syntax beginning in PowerShell 3.0. The following three examples are identical in function.

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

#### For Loop

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
```

#### While, Do-While, Do-Until

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

### Comparing Objects

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



