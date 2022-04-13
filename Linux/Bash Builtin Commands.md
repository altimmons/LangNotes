Bash Builtin Commands

This section describes builtin commands which are unique to or have been extended in Bash. Some of these commands are specified in the POSIX standard.


## ==alias==: 

    alias [-p] [name[=value] …]

    Without arguments or with the -p option, alias prints the list of aliases on the standard output in a form that allows them to be reused as input. If arguments are supplied, an alias is defined for each name whose value is given. If no value is given, the name and value of the alias is printed. Aliases are described in Aliases.
    

## ==bind==:

    bind [-m keymap] [-lpsvPSVX]
    bind [-m keymap] [-q function] [-u function] [-r keyseq]
    bind [-m keymap] -f filename
    bind [-m keymap] -x keyseq:shell-command
    bind [-m keymap] keyseq:function-name
    bind [-m keymap] keyseq:readline-command

    Display current Readline (see Command Line Editing) key and function bindings, bind a key sequence to a Readline function or macro, or set a Readline variable. Each non-option argument is a command as it would appear in a Readline initialization file (see Readline Init File), but each binding or command must be passed as a separate argument; e.g., ‘"\C-x\C-r":re-read-init-file’.

    Options, if supplied, have the following meanings:

    -m keymap

        Use keymap as the keymap to be affected by the subsequent bindings. Acceptable keymap names are emacs, emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move, vi-command, and vi-insert. vi is equivalent to vi-command (vi-move is also a synonym); emacs is equivalent to emacs-standard.
    -l

        List the names of all Readline functions.
    -p

        Display Readline function names and bindings in such a way that they can be used as input or in a Readline initialization file.
    -P

        List current Readline function names and bindings.
    -v

        Display Readline variable names and values in such a way that they can be used as input or in a Readline initialization file.
    -V

        List current Readline variable names and values.
    -s

        Display Readline key sequences bound to macros and the strings they output in such a way that they can be used as input or in a Readline initialization file.
    -S

        Display Readline key sequences bound to macros and the strings they output.
    -f filename

        Read key bindings from filename.
    -q function

        Query about which keys invoke the named function.
    -u function

        Unbind all keys bound to the named function.
    -r keyseq

        Remove any current binding for keyseq.
    -x keyseq:shell-command

        Cause shell-command to be executed whenever keyseq is entered. When shell-command is executed, the shell sets the READLINE_LINE variable to the contents of the Readline line buffer and the READLINE_POINT and READLINE_MARK variables to the current location of the insertion point and the saved insertion point (the mark), respectively. If the executed command changes the value of any of READLINE_LINE, READLINE_POINT, or READLINE_MARK, those new values will be reflected in the editing state.
    -X

        List all key sequences bound to shell commands and the associated commands in a format that can be reused as input. 

    The return status is zero unless an invalid option is supplied or an error occurs.

## ==builtin==:

    builtin [shell-builtin [args]]

    Run a shell builtin, passing it args, and return its exit status. This is useful when defining a shell function with the same name as a shell builtin, retaining the functionality of the builtin within the function. The return status is non-zero if shell-builtin is not a shell builtin command.

## ==caller==:

    caller [expr]

    Returns the context of any active subroutine call (a shell function or a script executed with the . or source builtins).

    Without expr, caller displays the line number and source filename of the current subroutine call. If a non-negative integer is supplied as expr, caller displays the line number, subroutine name, and source file corresponding to that position in the current execution call stack. This extra information may be used, for example, to print a stack trace. The current frame is frame 0.

    The return value is 0 unless the shell is not executing a subroutine call or expr does not correspond to a valid position in the call stack.

## ==command==:

    command [-pVv] command [arguments …]

    Runs command with arguments ignoring any shell function named command. Only shell builtin commands or commands found by searching the PATH are executed. If there is a shell function named ls, running ‘command ls’ within the function will execute the external command ls instead of calling the function recursively. The -p option means to use a default value for PATH that is guaranteed to find all of the standard utilities. The return status in this case is 127 if command cannot be found or an error occurred, and the exit status of command otherwise.

    If either the -V or -v option is supplied, a description of command is printed. The -v option causes a single word indicating the command or file name used to invoke command to be displayed; the -V option produces a more verbose description. In this case, the return status is zero if command is found, and non-zero if not.

## ==declare==:

    declare [-aAfFgiIlnrtux] [-p] [name[=value] …]

    Declare variables and give them attributes. If no names are given, then display the values of variables instead.

    The -p option will display the attributes and values of each name. When -p is used with name arguments, additional options, other than -f and -F, are ignored.

    When -p is supplied without name arguments, declare will display the attributes and values of all variables having the attributes specified by the additional options. If no other options are supplied with -p, declare will display the attributes and values of all shell variables. The -f option will restrict the display to shell functions.

    The -F option inhibits the display of function definitions; only the function name and attributes are printed. If the extdebug shell option is enabled using shopt (see The Shopt Builtin), the source file name and line number where each name is defined are displayed as well. -F implies -f.

    The -g option forces variables to be created or modified at the global scope, even when declare is executed in a shell function. It is ignored in all other cases.

    The -I option causes local variables to inherit the attributes (except the nameref attribute) and value of any existing variable with the same name at a surrounding scope. If there is no existing variable, the local variable is initially unset.

    The following options can be used to restrict output to variables with the specified attributes or to give variables attributes:

    -a

        Each name is an indexed array variable (see Arrays).
    -A

        Each name is an associative array variable (see Arrays).
    -f

        Use function names only.
    -i

        The variable is to be treated as an integer; arithmetic evaluation (see Shell Arithmetic) is performed when the variable is assigned a value.
    -l

        When the variable is assigned a value, all upper-case characters are converted to lower-case. The upper-case attribute is disabled.
    -n

        Give each name the nameref attribute, making it a name reference to another variable. That other variable is defined by the value of name. All references, assignments, and attribute modifications to name, except for those using or changing the -n attribute itself, are performed on the variable referenced by name’s value. The nameref attribute cannot be applied to array variables.
    -r

        Make names readonly. These names cannot then be assigned values by subsequent assignment statements or unset.
    -t

        Give each name the trace attribute. Traced functions inherit the DEBUG and RETURN traps from the calling shell. The trace attribute has no special meaning for variables.
    -u

        When the variable is assigned a value, all lower-case characters are converted to upper-case. The lower-case attribute is disabled.
    -x

        Mark each name for export to subsequent commands via the environment. 

    Using ‘+’ instead of ‘-’ turns off the attribute instead, with the exceptions that ‘+a’ and ‘+A’ may not be used to destroy array variables and ‘+r’ will not remove the readonly attribute. When used in a function, declare makes each name local, as with the local command, unless the -g option is used. If a variable name is followed by =value, the value of the variable is set to value.

    When using -a or -A and the compound assignment syntax to create array variables, additional attributes do not take effect until subsequent assignments.

    The return status is zero unless an invalid option is encountered, an attempt is made to define a function using ‘-f foo=bar’, an attempt is made to assign a value to a readonly variable, an attempt is made to assign a value to an array variable without using the compound assignment syntax (see Arrays), one of the names is not a valid shell variable name, an attempt is made to turn off readonly status for a readonly variable, an attempt is made to turn off array status for an array variable, or an attempt is made to display a non-existent function with -f.

## ==echo==:

    echo [-neE] [arg …]

    Output the args, separated by spaces, terminated with a newline. The return status is 0 unless a write error occurs. If -n is specified, the trailing newline is suppressed. If the -e option is given, interpretation of the following backslash-escaped characters is enabled. The -E option disables the interpretation of these escape characters, even on systems where they are interpreted by default. The xpg_echo shell option may be used to dynamically determine whether or not echo expands these escape characters by default. echo does not interpret -- to mean the end of options.

    echo interprets the following escape sequences:

    \a

        alert (bell) 
    \b

        backspace 
    \c

        suppress further output 
    \e
    \E

        escape 
    \f

        form feed 
    \n

        new line 
    \r

        carriage return 
    \t

        horizontal tab 
    \v

        vertical tab 
    \\

        backslash 
    \0nnn

        the eight-bit character whose value is the octal value nnn (zero to three octal digits) 
    \xHH

        the eight-bit character whose value is the hexadecimal value HH (one or two hex digits) 
    \uHHHH

        the Unicode (ISO/IEC 10646) character whose value is the hexadecimal value HHHH (one to four hex digits) 
    \UHHHHHHHH

        the Unicode (ISO/IEC 10646) character whose value is the hexadecimal value HHHHHHHH (one to eight hex digits) 


## ==enable==:

    enable [-a] [-dnps] [-f filename] [name …]

    Enable and disable builtin shell commands. Disabling a builtin allows a disk command which has the same name as a shell builtin to be executed without specifying a full pathname, even though the shell normally searches for builtins before disk commands. If -n is used, the names become disabled. Otherwise names are enabled. For example, to use the test binary found via $PATH instead of the shell builtin version, type ‘enable -n test’.

    If the -p option is supplied, or no name arguments appear, a list of shell builtins is printed. With no other arguments, the list consists of all enabled shell builtins. The -a option means to list each builtin with an indication of whether or not it is enabled.

    The -f option means to load the new builtin command name from shared object filename, on systems that support dynamic loading. The -d option will delete a builtin loaded with -f.

    If there are no options, a list of the shell builtins is displayed. The -s option restricts enable to the POSIX special builtins. If -s is used with -f, the new builtin becomes a special builtin (see Special Builtins).

    The return status is zero unless a name is not a shell builtin or there is an error loading a new builtin from a shared object.

## ==help==:

    help [-dms] [pattern]

    Display helpful information about builtin commands. If pattern is specified, help gives detailed help on all commands matching pattern, otherwise a list of the builtins is printed.

    Options, if supplied, have the following meanings:

    -d

        Display a short description of each pattern 
    -m

        Display the description of each pattern in a manpage-like format 
    -s

        Display only a short usage synopsis for each pattern 

    The return status is zero unless no command matches pattern.

## ==let==:

    let expression [expression …]

    The let builtin allows arithmetic to be performed on shell variables. Each expression is evaluated according to the rules given below in Shell Arithmetic. If the last expression evaluates to 0, let returns 1; otherwise 0 is returned.

## ==local==:

    local [option] name[=value] …

    For each argument, a local variable named name is created, and assigned value. The option can be any of the options accepted by declare. local can only be used within a function; it makes the variable name have a visible scope restricted to that function and its children. If name is ‘-’, the set of shell options is made local to the function in which local is invoked: shell options changed using the set builtin inside the function are restored to their original values when the function returns. The restore is effected as if a series of set commands were executed to restore the values that were in place before the function. The return status is zero unless local is used outside a function, an invalid name is supplied, or name is a readonly variable.

## ==logout==:

    logout [n]

    Exit a login shell, returning a status of n to the shell’s parent.

## ==mapfile==:

    mapfile [-d delim] [-n count] [-O origin] [-s count]
        [-t] [-u fd] [-C callback] [-c quantum] [array]

    Read lines from the standard input into the indexed array variable array, or from file descriptor fd if the -u option is supplied. The variable MAPFILE is the default array. Options, if supplied, have the following meanings:

    -d

        The first character of delim is used to terminate each input line, rather than newline. If delim is the empty string, mapfile will terminate a line when it reads a NUL character. 
    -n

        Copy at most count lines. If count is 0, all lines are copied. 
    -O

        Begin assigning to array at index origin. The default index is 0. 
    -s

        Discard the first count lines read. 
    -t

        Remove a trailing delim (default newline) from each line read. 
    -u

        Read lines from file descriptor fd instead of the standard input. 
    -C

        Evaluate callback each time quantum lines are read. The -c option specifies quantum. 
    -c

        Specify the number of lines read between each call to callback. 

    If -C is specified without -c, the default quantum is 5000. When callback is evaluated, it is supplied the index of the next array element to be assigned and the line to be assigned to that element as additional arguments. callback is evaluated after the line is read but before the array element is assigned.

    If not supplied with an explicit origin, mapfile will clear array before assigning to it.

    mapfile returns successfully unless an invalid option or option argument is supplied, array is invalid or unassignable, or array is not an indexed array.

## ==printf==:

    printf [-v var] format [arguments]

    Write the formatted arguments to the standard output under the control of the format. The -v option causes the output to be assigned to the variable var rather than being printed to the standard output.

    The format is a character string which contains three types of objects: plain characters, which are simply copied to standard output, character escape sequences, which are converted and copied to the standard output, and format specifications, each of which causes printing of the next successive argument. In addition to the standard printf(1) formats, printf interprets the following extensions:

    %b

        Causes printf to expand backslash escape sequences in the corresponding argument in the same way as echo -e (see Bash Builtins). 
    %q

        Causes printf to output the corresponding argument in a format that can be reused as shell input. 
    %(datefmt)T

        Causes printf to output the date-time string resulting from using datefmt as a format string for strftime(3). The corresponding argument is an integer representing the number of seconds since the epoch. Two special argument values may be used: -1 represents the current time, and -2 represents the time the shell was invoked. If no argument is specified, conversion behaves as if -1 had been given. This is an exception to the usual printf behavior. 

    The %b, %q, and %T directives all use the field width and precision arguments from the format specification and write that many bytes from (or use that wide a field for) the expanded argument, which usually contains more characters than the original.

    Arguments to non-string format specifiers are treated as C language constants, except that a leading plus or minus sign is allowed, and if the leading character is a single or double quote, the value is the ASCII value of the following character.

    The format is reused as necessary to consume all of the arguments. If the format requires more arguments than are supplied, the extra format specifications behave as if a zero value or null string, as appropriate, had been supplied. The return value is zero on success, non-zero on failure.

## ==read==:

    read [-ers] [-a aname] [-d delim] [-i text] [-n nchars]
        [-N nchars] [-p prompt] [-t timeout] [-u fd] [name …]

    One line is read from the standard input, or from the file descriptor fd supplied as an argument to the -u option, split into words as described above in Word Splitting, and the first word is assigned to the first name, the second word to the second name, and so on. If there are more words than names, the remaining words and their intervening delimiters are assigned to the last name. If there are fewer words read from the input stream than names, the remaining names are assigned empty values. The characters in the value of the IFS variable are used to split the line into words using the same rules the shell uses for expansion (described above in Word Splitting). The backslash character ‘\’ may be used to remove any special meaning for the next character read and for line continuation.

    Options, if supplied, have the following meanings:

    -a aname

        The words are assigned to sequential indices of the array variable aname, starting at 0. All elements are removed from aname before the assignment. Other name arguments are ignored.
    -d delim

        The first character of delim is used to terminate the input line, rather than newline. If delim is the empty string, read will terminate a line when it reads a NUL character.
    -e

        Readline (see Command Line Editing) is used to obtain the line. Readline uses the current (or default, if line editing was not previously active) editing settings, but uses Readline’s default filename completion.
    -i text

        If Readline is being used to read the line, text is placed into the editing buffer before editing begins.
    -n nchars

        read returns after reading nchars characters rather than waiting for a complete line of input, but honors a delimiter if fewer than nchars characters are read before the delimiter.
    -N nchars

        read returns after reading exactly nchars characters rather than waiting for a complete line of input, unless EOF is encountered or read times out. Delimiter characters encountered in the input are not treated specially and do not cause read to return until nchars characters are read. The result is not split on the characters in IFS; the intent is that the variable is assigned exactly the characters read (with the exception of backslash; see the -r option below).
    -p prompt

        Display prompt, without a trailing newline, before attempting to read any input. The prompt is displayed only if input is coming from a terminal.
    -r

        If this option is given, backslash does not act as an escape character. The backslash is considered to be part of the line. In particular, a backslash-newline pair may not then be used as a line continuation.
    -s

        Silent mode. If input is coming from a terminal, characters are not echoed.
    -t timeout

        Cause read to time out and return failure if a complete line of input (or a specified number of characters) is not read within timeout seconds. timeout may be a decimal number with a fractional portion following the decimal point. This option is only effective if read is reading input from a terminal, pipe, or other special file; it has no effect when reading from regular files. If read times out, read saves any partial input read into the specified variable name. If timeout is 0, read returns immediately, without trying to read any data. The exit status is 0 if input is available on the specified file descriptor, non-zero otherwise. The exit status is greater than 128 if the timeout is exceeded.
    -u fd

        Read input from file descriptor fd. 

    If no names are supplied, the line read, without the ending delimiter but otherwise unmodified, is assigned to the variable REPLY. The exit status is zero, unless end-of-file is encountered, read times out (in which case the status is greater than 128), a variable assignment error (such as assigning to a readonly variable) occurs, or an invalid file descriptor is supplied as the argument to -u.

## ==readarray==:

    readarray [-d delim] [-n count] [-O origin] [-s count]
        [-t] [-u fd] [-C callback] [-c quantum] [array]

    Read lines from the standard input into the indexed array variable array, or from file descriptor fd if the -u option is supplied.

    A synonym for mapfile.

## ==source==:

    source filename

    A synonym for . (see Bourne Shell Builtins).

## ==type==:

    type [-afptP] [name …]

    For each name, indicate how it would be interpreted if used as a command name.

    If the -t option is used, type prints a single word which is one of ‘alias’, ‘function’, ‘builtin’, ‘file’ or ‘keyword’, if name is an alias, shell function, shell builtin, disk file, or shell reserved word, respectively. If the name is not found, then nothing is printed, and type returns a failure status.

    If the -p option is used, type either returns the name of the disk file that would be executed, or nothing if -t would not return ‘file’.

    The -P option forces a path search for each name, even if -t would not return ‘file’.

    If a command is hashed, -p and -P print the hashed value, which is not necessarily the file that appears first in $PATH.

    If the -a option is used, type returns all of the places that contain an executable named file. This includes aliases and functions, if and only if the -p option is not also used.

    If the -f option is used, type does not attempt to find shell functions, as with the command builtin.

    The return status is zero if all of the names are found, non-zero if any are not found.

## ==typeset==:

    typeset [-afFgrxilnrtux] [-p] [name[=value] …]

    The typeset command is supplied for compatibility with the Korn shell. It is a synonym for the declare builtin command.

## ==ulimit==:

    ulimit [-HS] -a
    ulimit [-HS] [-bcdefiklmnpqrstuvxPRT] [limit]

    ulimit provides control over the resources available to processes started by the shell, on systems that allow such control. If an option is given, it is interpreted as follows:

    -S

        Change and report the soft limit associated with a resource.
    -H

        Change and report the hard limit associated with a resource.
    -a

        All current limits are reported; no limits are set.
    -b

        The maximum socket buffer size.
    -c

        The maximum size of core files created.
    -d

        The maximum size of a process’s data segment.
    -e

        The maximum scheduling priority ("nice").
    -f

        The maximum size of files written by the shell and its children.
    -i

        The maximum number of pending signals.
    -k

        The maximum number of kqueues that may be allocated.
    -l

        The maximum size that may be locked into memory.
    -m

        The maximum resident set size (many systems do not honor this limit).
    -n

        The maximum number of open file descriptors (most systems do not allow this value to be set).
    -p

        The pipe buffer size.
    -q

        The maximum number of bytes in POSIX message queues.
    -r

        The maximum real-time scheduling priority.
    -s

        The maximum stack size.
    -t

        The maximum amount of cpu time in seconds.
    -u

        The maximum number of processes available to a single user.
    -v

        The maximum amount of virtual memory available to the shell, and, on some systems, to its children.
    -x

        The maximum number of file locks.
    -P

        The maximum number of pseudoterminals.
    -R

        The maximum time a real-time process can run before blocking, in microseconds.
    -T

        The maximum number of threads. 

    If limit is given, and the -a option is not used, limit is the new value of the specified resource. The special limit values hard, soft, and unlimited stand for the current hard limit, the current soft limit, and no limit, respectively. A hard limit cannot be increased by a non-root user once it is set; a soft limit may be increased up to the value of the hard limit. Otherwise, the current value of the soft limit for the specified resource is printed, unless the -H option is supplied. When more than one resource is specified, the limit name and unit, if appropriate, are printed before the value. When setting new limits, if neither -H nor -S is supplied, both the hard and soft limits are set. If no option is given, then -f is assumed. Values are in 1024-byte increments, except for -t, which is in seconds; -R, which is in microseconds; -p, which is in units of 512-byte blocks; -P, -T, -b, -k, -n and -u, which are unscaled values; and, when in POSIX Mode (see Bash POSIX Mode), -c and -f, which are in 512-byte increments.

    The return status is zero unless an invalid option or argument is supplied, or an error occurs while setting a new limit.

## ==unalias==:

    unalias [-a] [name … ]

    Remove each name from the list of aliases. If -a is supplied, all aliases are removed. Aliases are described in Aliases. 



================================================================================================


[Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Expansions)

## The `Set` Builtin
> 
> This builtin is so complicated that it deserves its own section. `set` allows you to change the values of shell options and set the positional parameters, or to display the names and values of shell variables.
> 
### `set`
	 - set \[--abefhkmnptuvxBCEHPT\] \[-o option-name\] \[argument …\]
 set \[+abefhkmnptuvxBCEHPT\] \[+o option-name\] \[argument …\]
> 
> If no options or arguments are supplied, `set` displays the names and values of all shell variables and functions, sorted according to the current locale, in a format that may be reused as input for setting or resetting the currently-set variables. Read-only variables cannot be reset. In POSIX mode, only shell variables are listed.
> 
> When options are supplied, they set or unset shell attributes. Options, if specified, have the following meanings:
> 
- `-a` => Each variable or function that is created or modified is given the export attribute and marked for export to the environment of subsequent commands.
 
- `-b` => Cause the status of terminated background jobs to be reported immediately, rather than before printing the next primary prompt.
 
- `-e` => Exit immediately if a pipeline (see [Pipelines](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pipelines)), which may consist of a single simple command (see [Simple Commands](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Simple-Commands)), a list (see [Lists](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Lists)), or a compound command (see [Compound Commands](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Compound-Commands)) returns a non-zero status. The shell does not exit if the command that fails is part of the command list immediately following a `while` or `until` keyword, part of the test in an `if` statement, part of any command executed in a `&&` or `||` list except the command following the final `&&` or `||`, any command in a pipeline but the last, or if the command’s return status is being inverted with `!`. If a compound command other than a subshell returns a non-zero status because a command failed while \-e was being ignored, the shell does not exit. A trap on `ERR`, if set, is executed before the shell exits.
 
> This option applies to the shell environment and each subshell environment separately (see [Command Execution Environment](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Execution-Environment)), and may cause subshells to exit before executing all the commands in the subshell.
> 
> If a compound command or shell function executes in a context where \-e is being ignored, none of the commands executed within the compound command or function body will be affected by the \-e setting, even if \-e is set and a command returns a failure status. If a compound command or shell function sets \-e while executing in a context where \-e is ignored, that setting will not have any effect until the compound command or the command containing the function call completes.
> 
- `-f` => Disable filename expansion (globbing).
 
- `-h` => Locate and remember (hash) commands as they are looked up for execution. This option is enabled by default.
 
- `-k` => All arguments in the form of assignment statements are placed in the environment for a command, not just those that precede the command name.
 
- `-m` => Job control is enabled (see [Job Control](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Job-Control)). All processes run in a separate process group. When a background job completes, the shell prints a line containing its exit status.
 
- `-n` => Read commands but do not execute them. This may be used to check a script for syntax errors. This option is ignored by interactive shells.
 
- `-o option-name` => Set the option corresponding to option-name:
 
- `allexport` => Same as `-a`.
 
- `braceexpand` => Same as `-B`.
 
- `emacs` => Use an `emacs`\-style line editing interface (see [Command Line Editing](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Line-Editing)). This also affects the editing interface used for `read -e`.
 
- `errexit` => Same as `-e`.
 
- `errtrace` => Same as `-E`.
 
- `functrace` => Same as `-T`.
 
- `hashall` => Same as `-h`.
 
- `histexpand` => Same as `-H`.
 
- `history` => Enable command history, as described in [Bash History Facilities](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-History-Facilities). This option is on by default in interactive shells.
 
- `ignoreeof` => An interactive shell will not exit upon reading EOF.
 
- `keyword` => Same as `-k`.
 
- `monitor` => Same as `-m`.
 
- `noclobber` => Same as `-C`.
 
- `noexec` => Same as `-n`.
 
- `noglob` => Same as `-f`.
 
- `nolog` => Currently ignored.
 
- `notify` => Same as `-b`.
 
- `nounset` => Same as `-u`.
 
- `onecmd` => Same as `-t`.
 
- `physical` => Same as `-P`.
 
- `pipefail` => If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully. This option is disabled by default.
 
- `posix` => Change the behavior of Bash where the default operation differs from the POSIX standard to match the standard (see [Bash POSIX Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-POSIX-Mode)). This is intended to make Bash behave as a strict superset of that standard.
 
- `privileged` => Same as `-p`.
 
- `verbose` => Same as `-v`.
 
- `vi` => Use a `vi`\-style line editing interface. This also affects the editing interface used for `read -e`.
 
- `xtrace` => Same as `-x`.
 
- `-p` => Turn on privileged mode. In this mode, the `$BASH_ENV` and `$ENV` files are not processed, shell functions are not inherited from the environment, and the `SHELLOPTS`, `BASHOPTS`, `CDPATH` and `GLOBIGNORE` variables, if they appear in the environment, are ignored. If the shell is started with the effective user (group) id not equal to the real user (group) id, and the \-p option is not supplied, these actions are taken and the effective user id is set to the real user id. If the \-p option is supplied at startup, the effective user id is not reset. Turning this option off causes the effective user and group ids to be set to the real user and group ids.
 
- `-t` => Exit after reading and executing one command.
 
- `-u` => Treat unset variables and parameters other than the special parameters ‘@’ or ‘\*’ as an error when performing parameter expansion. An error message will be written to the standard error, and a non-interactive shell will exit.
 
- `-v` => Print shell input lines as they are read.
 
- `-x` => Print a trace of simple commands, `for` commands, `case` commands, `select` commands, and arithmetic `for` commands and their arguments or associated word lists after they are expanded and before they are executed. The value of the `PS4` variable is expanded and the resultant value is printed before the command and its expanded arguments.
 
- `-B` => The shell will perform brace expansion (see [Brace Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Brace-Expansion)). This option is on by default.
 
- `-C` => Prevent output redirection using ‘\>’, ‘\>&’, and ‘<>’ from overwriting existing files.
 
- `-E` => If set, any trap on `ERR` is inherited by shell functions, command substitutions, and commands executed in a subshell environment. The `ERR` trap is normally not inherited in such cases.
 
- `-H` => Enable ‘!’ style history substitution (see [History Interaction](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#History-Interaction)). This option is on by default for interactive shells.
 
- `-P` => If set, do not resolve symbolic links when performing commands such as `cd` which change the current directory. The physical directory is used instead. By default, Bash follows the logical chain of directories when performing commands which change the current directory.
 
> For example, if /usr/sys is a symbolic link to /usr/local/sys then:
> ~~~bash
> $ cd /usr/sys; echo $PWD
> /usr/sys
> $ cd ..; pwd
> /usr
> 
> If `set -P` is on, then:
> 
> $ cd /usr/sys; echo $PWD
> /usr/local/sys
> $ cd ..; pwd
> /usr/local
> ~~~

- `-T` => If set, any trap on `DEBUG` and `RETURN` are inherited by shell functions, command substitutions, and commands executed in a subshell environment. The `DEBUG` and `RETURN` traps are normally not inherited in such cases.
 
- `--` => If no arguments follow this option, then the positional parameters are unset. Otherwise, the positional parameters are set to the arguments, even if some of them begin with a ‘\-’.
 
- `-` => Signal the end of options, cause all remaining arguments to be assigned to the positional parameters. The \-x and \-v options are turned off. If there are no arguments, the positional parameters remain unchanged.
 
> Using ‘+’ rather than ‘\-’ causes these options to be turned off. The options can also be used upon invocation of the shell. The current set of options may be found in `$-`.
> 
> The remaining N arguments are positional parameters and are assigned, in order, to `$1`, `$2`, … `$N`. The special parameter `#` is set to N.
> 
> The return status is always zero unless an invalid option is supplied.
> 
> * * *
> 
> Previous: [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin), Up: [Modifying Shell Behavior](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Modifying-Shell-Behavior)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ## 4.3.2 The `Shopt` Builtin
> 
> This builtin allows you to change additional shell optional behavior.
> 
### `shopt`
	 - shopt \[-pqsu\] \[-o\] \[optname …\]
 
> Toggle the values of settings controlling optional shell behavior. The settings can be either those listed below, or, if the \-o option is used, those available with the \-o option to the `set` builtin command (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)). With no options, or with the \-p option, a list of all settable options is displayed, with an indication of whether or not each is set; if optnames are supplied, the output is restricted to those options. The \-p option causes output to be displayed in a form that may be reused as input. Other options have the following meanings:
> 
- `-s` => Enable (set) each optname.
 
- `-u` => Disable (unset) each optname.
 
- `-q` => Suppresses normal output; the return status indicates whether the optname is set or unset. If multiple optname arguments are given with \-q, the return status is zero if all optnames are enabled; non-zero otherwise.
 
- `-o` => Restricts the values of optname to be those defined for the \-o option to the `set` builtin (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)).
 
> If either \-s or \-u is used with no optname arguments, `shopt` shows only those options which are set or unset, respectively.
> 
> Unless otherwise noted, the `shopt` options are disabled (off) by default.
> 
> The return status when listing options is zero if all optnames are enabled, non-zero otherwise. When setting or unsetting options, the return status is zero unless an optname is not a valid shell option.
> 
#### The list of `shopt` options is:
> 
- `assoc_expand_once`
	 - If set, the shell suppresses multiple evaluation of associative array subscripts during arithmetic expression evaluation, while executing builtins that can perform variable assignments, and while executing builtins that perform array dereferencing.
 
- `autocd`
	 - If set, a command name that is the name of a directory is executed as if it were the argument to the `cd` command. This option is only used by interactive shells.
 
- `cdable_vars`
	 - If this is set, an argument to the `cd` builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.
 
- `cdspell`
	 - If set, minor errors in the spelling of a directory component in a `cd` command will be corrected. The errors checked for are transposed characters, a missing character, and a character too many. If a correction is found, the corrected path is printed, and the command proceeds. This option is only used by interactive shells.
 
- `checkhash`
	 - If this is set, Bash checks that a command found in the hash table exists before trying to execute it. If a hashed command no longer exists, a normal path search is performed.
 
- `checkjobs`
	 - If set, Bash lists the status of any stopped and running jobs before exiting an interactive shell. If any jobs are running, this causes the exit to be deferred until a second exit is attempted without an intervening command (see [Job Control](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Job-Control)). The shell always postpones exiting if any jobs are stopped.
 
- `checkwinsize`
	 - If set, Bash checks the window size after each external (non-builtin) command and, if necessary, updates the values of `LINES` and `COLUMNS`. This option is enabled by default.
 
- `cmdhist`
	 - If set, Bash attempts to save all lines of a multiple-line command in the same history entry. This allows easy re-editing of multi-line commands. This option is enabled by default, but only has an effect if command history is enabled (see [Bash History Facilities](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-History-Facilities)).
 
- `compat31`, `compat32`, `compat40`, `compat41`, `compat42`, `compat43`, `compat44`
      -  These control aspects of the shell’s compatibility mode (see [Shell Compatibility Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Compatibility-Mode)).

- `complete_fullquote`
	 - If set, Bash quotes all shell metacharacters in filenames and directory names when performing completion. If not set, Bash removes metacharacters such as the dollar sign from the set of characters that will be quoted in completed filenames when these metacharacters appear in shell variable references in words to be completed. This means that dollar signs in variable names that expand to directories will not be quoted; however, any dollar signs appearing in filenames will not be quoted, either. This is active only when bash is using backslashes to quote completed filenames. This variable is set by default, which is the default Bash behavior in versions through 4.2.
 
- `direxpand`
	 - If set, Bash replaces directory names with the results of word expansion when performing filename completion. This changes the contents of the readline editing buffer. If not set, Bash attempts to preserve what the user typed.
 
- `dirspell`
	 - If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
 
- `dotglob`
	 - If set, Bash includes filenames beginning with a ‘.’ in the results of filename expansion. The filenames ‘.’ and ‘..’ must always be matched explicitly, even if `dotglob` is set.
 
- `execfail`
	 - If this is set, a non-interactive shell will not exit if it cannot execute the file specified as an argument to the `exec` builtin command. An interactive shell does not exit if `exec` fails.
 
- `expand_aliases`
	 - If set, aliases are expanded as described below under Aliases, [Aliases](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases). This option is enabled by default for interactive shells.
 
- `extdebug`
	 - If set at shell invocation, or in a shell startup file, arrange to execute the debugger profile before the shell starts, identical to the \--debugger option. If set after invocation, behavior intended for use by debuggers is enabled:
 
> 1.  The \-F option to the `declare` builtin (see [Bash Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Builtins)) displays the source file name and line number corresponding to each function name supplied as an argument.
> 2.  If the command run by the `DEBUG` trap returns a non-zero value, the next command is skipped and not executed.
> 3.  If the command run by the `DEBUG` trap returns a value of 2, and the shell is executing in a subroutine (a shell function or a shell script executed by the `.` or `source` builtins), the shell simulates a call to `return`.
> 4.  `BASH_ARGC` and `BASH_ARGV` are updated as described in their descriptions (see [Bash Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Variables)).
> 5.  Function tracing is enabled: command substitution, shell functions, and subshells invoked with `( command )` inherit the `DEBUG` and `RETURN` traps.
> 6.  Error tracing is enabled: command substitution, shell functions, and subshells invoked with `( command )` inherit the `ERR` trap.
> 
- `extglob`
	 - If set, the extended pattern matching features described above (see [Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching)) are enabled.
 
- `extquote`
	 - If set, `$'string'` and `$"string"` quoting is performed within `${parameter}` expansions enclosed in double quotes. This option is enabled by default.
 
- `failglob`
	 - If set, patterns which fail to match filenames during filename expansion result in an expansion error.
 
- `force_fignore`
	 - If set, the suffixes specified by the `FIGNORE` shell variable cause words to be ignored when performing word completion even if the ignored words are the only possible completions. See [Bash Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Variables), for a description of `FIGNORE`. This option is enabled by default.
 
- `globasciiranges`
	 - If set, range expressions used in pattern matching bracket expressions (see [Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching)) behave as if in the traditional C locale when performing comparisons. That is, the current locale’s collating sequence is not taken into account, so ‘b’ will not collate between ‘A’ and ‘B’, and upper-case and lower-case ASCII characters will collate together.
 
- `globstar`
	 - If set, the pattern ‘\*\*’ used in a filename expansion context will match all files and zero or more directories and subdirectories. If the pattern is followed by a ‘/’, only directories and subdirectories match.
 
- `gnu_errfmt`
	 - If set, shell error messages are written in the standard GNU error message format.
 
- `histappend`
	 - If set, the history list is appended to the file named by the value of the `HISTFILE` variable when the shell exits, rather than overwriting the file.
 
- `histreedit`
	 - If set, and Readline is being used, a user is given the opportunity to re-edit a failed history substitution.
 
- `histverify`
	 - If set, and Readline is being used, the results of history substitution are not immediately passed to the shell parser. Instead, the resulting line is loaded into the Readline editing buffer, allowing further modification.
 
- `hostcomplete`
	 - If set, and Readline is being used, Bash will attempt to perform hostname completion when a word containing a ‘@’ is being completed (see [Commands For Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Commands-For-Completion)). This option is enabled by default.
 
- `huponexit`
	 - If set, Bash will send `SIGHUP` to all jobs when an interactive login shell exits (see [Signals](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Signals)).
 
- `inherit_errexit`
	 - If set, command substitution inherits the value of the `errexit` option, instead of unsetting it in the subshell environment. This option is enabled when POSIX mode is enabled.
 
- `interactive_comments`
	 - Allow a word beginning with ‘#’ to cause that word and all remaining characters on that line to be ignored in an interactive shell. This option is enabled by default.
 
- `lastpipe`
	 - If set, and job control is not active, the shell runs the last command of a pipeline not executed in the background in the current shell environment.
 
- `lithist`
	 - If enabled, and the `cmdhist` option is enabled, multi-line commands are saved to the history with embedded newlines rather than using semicolon separators where possible.
 
- `localvar_inherit`
	 - If set, local variables inherit the value and attributes of a variable of the same name that exists at a previous scope before any new value is assigned. The nameref attribute is not inherited.
 
- `localvar_unset`
	 - If set, calling `unset` on local variables in previous function scopes marks them so subsequent lookups find them unset until that function returns. This is identical to the behavior of unsetting local variables at the current function scope.
 
- `login_shell`
	 - The shell sets this option if it is started as a login shell (see [Invoking Bash](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Invoking-Bash)). The value may not be changed.
 
- `mailwarn`
	 - If set, and a file that Bash is checking for mail has been accessed since the last time it was checked, the message `"The mail in mailfile has been read"` is displayed.
 
- `no_empty_cmd_completion`
	 - If set, and Readline is being used, Bash will not attempt to search the `PATH` for possible completions when completion is attempted on an empty line.
 
- `nocaseglob`
	 - If set, Bash matches filenames in a case-insensitive fashion when performing filename expansion.
 
- `nocasematch`
	 - If set, Bash matches patterns in a case-insensitive fashion when performing matching while executing `case` or `[[` conditional commands, when performing pattern substitution word expansions, or when filtering possible completions as part of programmable completion.
 
- `nullglob`
	 - If set, Bash allows filename patterns which match no files to expand to a null string, rather than themselves.
 
- `progcomp`
	 - If set, the programmable completion facilities (see [Programmable Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Programmable-Completion)) are enabled. This option is enabled by default.
 
- `progcomp_alias`
	 - If set, and programmable completion is enabled, Bash treats a command name that doesn’t have any completions as a possible alias and attempts alias expansion. If it has an alias, Bash attempts programmable completion using the command word resulting from the expanded alias.
 
- `promptvars`
	 - If set, prompt strings undergo parameter expansion, command substitution, arithmetic expansion, and quote removal after being expanded as described below (see [Controlling the Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt)). This option is enabled by default.
 
- `restricted_shell`
	 - The shell sets this option if it is started in restricted mode (see [The Restricted Shell](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Restricted-Shell)). The value may not be changed. This is not reset when the startup files are executed, allowing the startup files to discover whether or not a shell is restricted.
 
- `shift_verbose`
	 - If this is set, the `shift` builtin prints an error message when the shift count exceeds the number of positional parameters.
 
- `sourcepath`
	 - If set, the `source` builtin uses the value of `PATH` to find the directory containing the file supplied as an argument. This option is enabled by default.
 
- `xpg_echo`
	 - If set, the `echo` builtin expands backslash-escape sequences by default.
 
> * * *
> 
> Previous: [Modifying Shell Behavior](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Modifying-Shell-Behavior), Up: [Shell Builtin Commands](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Builtin-Commands)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 4.4 Special Builtins
> 
> For historical reasons, the POSIX standard has classified several builtin commands as _special_. When Bash is executing in POSIX mode, the special builtins differ from other builtin commands in three respects:
> 
> 1.  Special builtins are found before shell functions during command lookup.
> 2.  If a special builtin returns an error status, a non-interactive shell exits.
> 3.  Assignment statements preceding the command stay in effect in the shell environment after the command completes.
> 
> When Bash is not executing in POSIX mode, these builtins behave no differently than the rest of the Bash builtin commands. The Bash POSIX mode is described in [Bash POSIX Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-POSIX-Mode).
> 
## These are the POSIX special builtins:
> 
### `break` 
### `:`
### `.`
### `continue` 
### `eval`
 
### `exec` 
### `exit`
### `export`
### `readonly`
### `return`
### `set`
### `shift`
### `trap`
### `unset`
> 
> * * *
> 
> Next: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features), Previous: [Shell Builtin Commands](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Builtin-Commands), Up: [Top](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Top)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ## 5 Shell Variables
> 
> • [Bourne Shell Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bourne-Shell-Variables)
> 
>   
> 
> Variables which Bash uses in the same way as the Bourne Shell.
> 
> • [Bash Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Variables)
> 
>   
> 
> List of variables that exist in Bash.
> 
> This chapter describes the shell variables that Bash uses. Bash automatically assigns default values to a number of variables.
> 
> * * *
> 
> Next: [Bash Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Variables), Up: [Shell Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Variables)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 5.1 Bourne Shell Variables
> 
> Bash uses certain shell variables in the same way as the Bourne shell. In some cases, Bash assigns a default value to the variable.
> 
#### `CDPATH`
	 - A colon-separated list of directories used as a search path for the `cd` builtin command.
 
#### `HOME`
	 - The current user’s home directory; the default for the `cd` builtin command. The value of this variable is also used by tilde expansion (see [Tilde Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Tilde-Expansion)).
 
#### `IFS`
	 - A list of characters that separate fields; used when the shell splits words as part of expansion.
 
#### `MAIL`
	 - If this parameter is set to a filename or directory name and the `MAILPATH` variable is not set, Bash informs the user of the arrival of mail in the specified file or Maildir-format directory.
 
#### `MAILPATH`
	 - A colon-separated list of filenames which the shell periodically checks for new mail. Each list entry can specify the message that is printed when new mail arrives in the mail file by separating the filename from the message with a ‘?’. When used in the text of the message, `$_` expands to the name of the current mail file.
 
#### `OPTARG`
	 - The value of the last option argument processed by the `getopts` builtin.
 
#### `OPTIND`
	 - The index of the last option argument processed by the `getopts` builtin.
 
#### `PATH`
	 - A colon-separated list of directories in which the shell looks for commands. A zero-length (null) directory name in the value of `PATH` indicates the current directory. A null directory name may appear as two adjacent colons, or as an initial or trailing colon.
 
#### `PS1`
	 - The primary prompt string. The default value is ‘\\s-\\v\\$ ’. See [Controlling the Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt), for the complete list of escape sequences that are expanded before `PS1` is displayed.
 
#### `PS2`
	 - The secondary prompt string. The default value is ‘\> ’. `PS2` is expanded in the same way as `PS1` before being displayed.
 
> * * *
> 
> Previous: [Bourne Shell Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bourne-Shell-Variables), Up: [Shell Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Variables)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 5.2 Bash Variables
> 
> These variables are set or used by Bash, but other shells do not normally treat them specially.
> 
> A few variables used by Bash are described in different chapters: variables for controlling the job control facilities (see [Job Control Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Job-Control-Variables)).


`_` 
`BASH` 
`BASHOPTS` 
`BASHPID` 
`BASH_ALIASES` 
`BASH_ARGC` 
`BASH_ARGV` 
`BASH_ARGV0` 
`BASH_CMDS` 
`BASH_COMMAND` 
`BASH_COMPAT` 
`BASH_ENV` 
`BASH_EXECUTION_STRING` 
`BASH_LINENO` 
`BASH_LOADABLES_PATH` 
`BASH_REMATCH` 
`BASH_SOURCE` 
`BASH_SUBSHELL` 
`BASH_VERSINFO` 
`BASH_VERSINFO[0]` 
`BASH_VERSINFO[1]` 
`BASH_VERSINFO[2]` 
`BASH_VERSINFO[3]` 
`BASH_VERSINFO[4]` 
`BASH_VERSINFO[5]` 
`BASH_VERSION` 
`BASH_XTRACEFD` 
`CHILD_MAX` 
`COLUMNS` 
`COMP_CWORD` 
`COMP_LINE` 
`COMP_POINT` 
`COMP_TYPE` 
`COMP_KEY` 
`COMP_WORDBREAKS` 
`COMP_WORDS` 
`COMPREPLY` 
`COPROC` 
`DIRSTACK` 
`EMACS` 
`ENV` 
`EPOCHREALTIME` 
`EPOCHSECONDS` 
`EUID` 
`EXECIGNORE` 
`FCEDIT` 
`FIGNORE` 
`FUNCNAME` 
`FUNCNEST` 
`GLOBIGNORE` 
`GROUPS` 
`histchars` 
`HISTCMD` 
`HISTCONTROL` 
`HISTFILE` 
`HISTFILESIZE` 
`HISTIGNORE` 
`HISTSIZE` 
`HISTTIMEFORMAT` 
`HOSTFILE` 
`HOSTNAME` 
`HOSTTYPE` 
`IGNOREEOF` 
`INPUTRC` 
`INSIDE_EMACS` 
`LANG` 
`LC_ALL` 
`LC_COLLATE` 
`LC_CTYPE` 
`LC_MESSAGES` 
`LC_NUMERIC` 
`LC_TIME` 
`LINENO` 
`LINES` 
`MACHTYPE` 
`MAILCHECK` 
`MAPFILE` 
`OLDPWD` 
`OPTERR` 
`OSTYPE` 
`PIPESTATUS` 
`POSIXLY_CORRECT` 
`PPID` 
`PROMPT_COMMAND` 
`PROMPT_DIRTRIM` 
`PS0` 
`PS3` 
`PS4` 
`PWD` 
`RANDOM` 
`READLINE_LINE` 
`READLINE_MARK` 
`READLINE_POINT` 
`REPLY` 
`SECONDS` 
`SHELL` 
`SHELLOPTS` 
`SHLVL` 
`SRANDOM` 
`TIMEFORMAT` 
`%%` 
`%[p][l]R` 
`%[p][l]U` 
`%[p][l]S` 
`%P` 
`TMOUT` 
`TMPDIR` 
`UID`  
#### `_`
	 - ($\_, an underscore.) At shell startup, set to the pathname used to invoke the shell or shell script being executed as passed in the environment or argument list. Subsequently, expands to the last argument to the previous simple command executed in the foreground, after expansion. Also set to the full pathname used to invoke each command executed and placed in the environment exported to that command. When checking mail, this parameter holds the name of the mail file.
 
#### `BASH`
	 - The full pathname used to execute the current instance of Bash.
 
#### `BASHOPTS`
	 - A colon-separated list of enabled shell options. Each word in the list is a valid argument for the \-s option to the `shopt` builtin command (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)). The options appearing in `BASHOPTS` are those reported as ‘on’ by ‘shopt’. If this variable is in the environment when Bash starts up, each shell option in the list will be enabled before reading any startup files. This variable is readonly.
 
#### `BASHPID`
	 - Expands to the process ID of the current Bash process. This differs from `$$` under certain circumstances, such as subshells that do not require Bash to be re-initialized. Assignments to `BASHPID` have no effect. If `BASHPID` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `BASH_ALIASES`
	 - An associative array variable whose members correspond to the internal list of aliases as maintained by the `alias` builtin. (see [Bourne Shell Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bourne-Shell-Builtins)). Elements added to this array appear in the alias list; however, unsetting array elements currently does not cause aliases to be removed from the alias list. If `BASH_ALIASES` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `BASH_ARGC`
	 - An array variable whose values are the number of parameters in each frame of the current bash execution call stack. The number of parameters to the current subroutine (shell function or script executed with `.` or `source`) is at the top of the stack. When a subroutine is executed, the number of parameters passed is pushed onto `BASH_ARGC`. The shell sets `BASH_ARGC` only when in extended debugging mode (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin) for a description of the `extdebug` option to the `shopt` builtin). Setting `extdebug` after the shell has started to execute a script, or referencing this variable when `extdebug` is not set, may result in inconsistent values.
 
#### `BASH_ARGV`
	 - An array variable containing all of the parameters in the current bash execution call stack. The final parameter of the last subroutine call is at the top of the stack; the first parameter of the initial call is at the bottom. When a subroutine is executed, the parameters supplied are pushed onto `BASH_ARGV`. The shell sets `BASH_ARGV` only when in extended debugging mode (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin) for a description of the `extdebug` option to the `shopt` builtin). Setting `extdebug` after the shell has started to execute a script, or referencing this variable when `extdebug` is not set, may result in inconsistent values.
 
#### `BASH_ARGV0`
	 - When referenced, this variable expands to the name of the shell or shell script (identical to `$0`; See [Special Parameters](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Special-Parameters), for the description of special parameter 0). Assignment to `BASH_ARGV0` causes the value assigned to also be assigned to `$0`. If `BASH_ARGV0` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `BASH_CMDS`
	 - An associative array variable whose members correspond to the internal hash table of commands as maintained by the `hash` builtin (see [Bourne Shell Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bourne-Shell-Builtins)). Elements added to this array appear in the hash table; however, unsetting array elements currently does not cause command names to be removed from the hash table. If `BASH_CMDS` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `BASH_COMMAND`
	 - The command currently being executed or about to be executed, unless the shell is executing a command as the result of a trap, in which case it is the command executing at the time of the trap. If `BASH_COMMAND` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `BASH_COMPAT`
	 - The value is used to set the shell’s compatibility level. See [Shell Compatibility Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Compatibility-Mode), for a description of the various compatibility levels and their effects. The value may be a decimal number (e.g., 4.2) or an integer (e.g., 42) corresponding to the desired compatibility level. If `BASH_COMPAT` is unset or set to the empty string, the compatibility level is set to the default for the current version. If `BASH_COMPAT` is set to a value that is not one of the valid compatibility levels, the shell prints an error message and sets the compatibility level to the default for the current version. The valid values correspond to the compatibility levels described below (see [Shell Compatibility Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Compatibility-Mode)). For example, 4.2 and 42 are valid values that correspond to the `compat42` `shopt` option and set the compatibility level to 42. The current version is also a valid value.
 
#### `BASH_ENV`
	 - If this variable is set when Bash is invoked to execute a shell script, its value is expanded and used as the name of a startup file to read before executing the script. See [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Startup-Files).
 
#### `BASH_EXECUTION_STRING`
	 - The command argument to the \-c invocation option.
 
#### `BASH_LINENO`
	 - An array variable whose members are the line numbers in source files where each corresponding member of FUNCNAME was invoked. `${BASH_LINENO[$i]}` is the line number in the source file (`${BASH_SOURCE[$i+1]}`) where `${FUNCNAME[$i]}` was called (or `${BASH_LINENO[$i-1]}` if referenced within another shell function). Use `LINENO` to obtain the current line number.
 
#### `BASH_LOADABLES_PATH`
	 - A colon-separated list of directories in which the shell looks for dynamically loadable builtins specified by the `enable` command.
 
#### `BASH_REMATCH`
	 - An array variable whose members are assigned by the ‘\=~’ binary operator to the `[[` conditional command (see [Conditional Constructs](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Conditional-Constructs)). The element with index 0 is the portion of the string matching the entire regular expression. The element with index n is the portion of the string matching the nth parenthesized subexpression.
 
#### `BASH_SOURCE`
	 - An array variable whose members are the source filenames where the corresponding shell function names in the `FUNCNAME` array variable are defined. The shell function `${FUNCNAME[$i]}` is defined in the file `${BASH_SOURCE[$i]}` and called from `${BASH_SOURCE[$i+1]}`
 
#### `BASH_SUBSHELL`
	 - Incremented by one within each subshell or subshell environment when the shell begins executing in that environment. The initial value is 0. If `BASH_SUBSHELL` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `BASH_VERSINFO`
	 - A readonly array variable (see [Arrays](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arrays)) whose members hold version information for this instance of Bash. The values assigned to the array members are as follows:
 
#### `BASH_VERSINFO[0]`
	 - The major version number (the release).
 
#### `BASH_VERSINFO[1]`
	 - The minor version number (the version).
 
#### `BASH_VERSINFO[2]`
	 - The patch level.
 
#### `BASH_VERSINFO[3]`
	 - The build version.
 
#### `BASH_VERSINFO[4]`
	 - The release status (e.g., beta1).
 
#### `BASH_VERSINFO[5]`
	 - The value of `MACHTYPE`.
 
#### `BASH_VERSION`
	 - The version number of the current instance of Bash.
 
#### `BASH_XTRACEFD`
	 - If set to an integer corresponding to a valid file descriptor, Bash will write the trace output generated when ‘set -x’ is enabled to that file descriptor. This allows tracing output to be separated from diagnostic and error messages. The file descriptor is closed when `BASH_XTRACEFD` is unset or assigned a new value. Unsetting `BASH_XTRACEFD` or assigning it the empty string causes the trace output to be sent to the standard error. Note that setting `BASH_XTRACEFD` to 2 (the standard error file descriptor) and then unsetting it will result in the standard error being closed.
 
#### `CHILD_MAX`
	 - Set the number of exited child status values for the shell to remember. Bash will not allow this value to be decreased below a POSIX\-mandated minimum, and there is a maximum value (currently 8192) that this may not exceed. The minimum value is system-dependent.
 
#### `COLUMNS`
	 - Used by the `select` command to determine the terminal width when printing selection lists. Automatically set if the `checkwinsize` option is enabled (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)), or in an interactive shell upon receipt of a `SIGWINCH`.
 
#### `COMP_CWORD`
	 - An index into `${COMP_WORDS}` of the word containing the current cursor position. This variable is available only in shell functions invoked by the programmable completion facilities (see [Programmable Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Programmable-Completion)).
 
#### `COMP_LINE`
	 - The current command line. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see [Programmable Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Programmable-Completion)).
 
#### `COMP_POINT`
	 - The index of the current cursor position relative to the beginning of the current command. If the current cursor position is at the end of the current command, the value of this variable is equal to `${#COMP_LINE}`. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see [Programmable Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Programmable-Completion)).
 
#### `COMP_TYPE`
	 - Set to an integer value corresponding to the type of completion attempted that caused a completion function to be called: TAB, for normal completion, ‘?’, for listing completions after successive tabs, ‘!’, for listing alternatives on partial word completion, ‘@’, to list completions if the word is not unmodified, or ‘%’, for menu completion. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see [Programmable Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Programmable-Completion)).
 
#### `COMP_KEY`
	 - The key (or final key of a key sequence) used to invoke the current completion function.
 
#### `COMP_WORDBREAKS`
	 - The set of characters that the Readline library treats as word separators when performing word completion. If `COMP_WORDBREAKS` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `COMP_WORDS`
	 - An array variable consisting of the individual words in the current command line. The line is split into words as Readline would split it, using `COMP_WORDBREAKS` as described above. This variable is available only in shell functions invoked by the programmable completion facilities (see [Programmable Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Programmable-Completion)).
 
#### `COMPREPLY`
	 - An array variable from which Bash reads the possible completions generated by a shell function invoked by the programmable completion facility (see [Programmable Completion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Programmable-Completion)). Each array element contains one possible completion.
 
#### `COPROC`
	 - An array variable created to hold the file descriptors for output from and input to an unnamed coprocess (see [Coprocesses](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Coprocesses)).
 
#### `DIRSTACK`
	 - An array variable containing the current contents of the directory stack. Directories appear in the stack in the order they are displayed by the `dirs` builtin. Assigning to members of this array variable may be used to modify directories already in the stack, but the `pushd` and `popd` builtins must be used to add and remove directories. Assignment to this variable will not change the current directory. If `DIRSTACK` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `EMACS`
	 - If Bash finds this variable in the environment when the shell starts with value ‘t’, it assumes that the shell is running in an Emacs shell buffer and disables line editing.
 
#### `ENV`
	 - Expanded and executed similarlty to `BASH_ENV` (see [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Startup-Files)) when an interactive shell is invoked in POSIX Mode (see [Bash POSIX Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-POSIX-Mode)).
 
#### `EPOCHREALTIME`
	 - Each time this parameter is referenced, it expands to the number of seconds since the Unix Epoch as a floating point value with micro-second granularity (see the documentation for the C library function time for the definition of Epoch). Assignments to `EPOCHREALTIME` are ignored. If `EPOCHREALTIME` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `EPOCHSECONDS`
	 - Each time this parameter is referenced, it expands to the number of seconds since the Unix Epoch (see the documentation for the C library function time for the definition of Epoch). Assignments to `EPOCHSECONDS` are ignored. If `EPOCHSECONDS` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `EUID`
	 - The numeric effective user id of the current user. This variable is readonly.
 
#### `EXECIGNORE`
	 - A colon-separated list of shell patterns (see [Pattern Matching](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pattern-Matching)) defining the list of filenames to be ignored by command search using `PATH`. Files whose full pathnames match one of these patterns are not considered executable files for the purposes of completion and command execution via `PATH` lookup. This does not affect the behavior of the `[`, `test`, and `[[` commands. Full pathnames in the command hash table are not subject to `EXECIGNORE`. Use this variable to ignore shared library files that have the executable bit set, but are not executable files. The pattern matching honors the setting of the `extglob` shell option.
 
#### `FCEDIT`
	 - The editor used as a default by the \-e option to the `fc` builtin command.
 
#### `FIGNORE`
	 - A colon-separated list of suffixes to ignore when performing filename completion. A filename whose suffix matches one of the entries in `FIGNORE` is excluded from the list of matched filenames. A sample value is ‘.o:~’
 
#### `FUNCNAME`
	 - An array variable containing the names of all shell functions currently in the execution call stack. The element with index 0 is the name of any currently-executing shell function. The bottom-most element (the one with the highest index) is `"main"`. This variable exists only when a shell function is executing. Assignments to `FUNCNAME` have no effect. If `FUNCNAME` is unset, it loses its special properties, even if it is subsequently reset.
 
> This variable can be used with `BASH_LINENO` and `BASH_SOURCE`. Each element of `FUNCNAME` has corresponding elements in `BASH_LINENO` and `BASH_SOURCE` to describe the call stack. For instance, `${FUNCNAME[$i]}` was called from the file `${BASH_SOURCE[$i+1]}` at line number `${BASH_LINENO[$i]}`. The `caller` builtin displays the current call stack using this information.
> 
#### `FUNCNEST`
	 - If set to a numeric value greater than 0, defines a maximum function nesting level. Function invocations that exceed this nesting level will cause the current command to abort.
 
#### `GLOBIGNORE`
	 - A colon-separated list of patterns defining the set of file names to be ignored by filename expansion. If a file name matched by a filename expansion pattern also matches one of the patterns in `GLOBIGNORE`, it is removed from the list of matches. The pattern matching honors the setting of the `extglob` shell option.
 
#### `GROUPS`
	 - An array variable containing the list of groups of which the current user is a member. Assignments to `GROUPS` have no effect. If `GROUPS` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `histchars`
	 - Up to three characters which control history expansion, quick substitution, and tokenization (see [History Interaction](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#History-Interaction)). The first character is the history expansion character, that is, the character which signifies the start of a history expansion, normally ‘!’. The second character is the character which signifies ‘quick substitution’ when seen as the first character on a line, normally ‘^’. The optional third character is the character which indicates that the remainder of the line is a comment when found as the first character of a word, usually ‘#’. The history comment character causes history substitution to be skipped for the remaining words on the line. It does not necessarily cause the shell parser to treat the rest of the line as a comment.
 
#### `HISTCMD`
	 - The history number, or index in the history list, of the current command. Assignments to `HISTCMD` are ignored. If `HISTCMD` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `HISTCONTROL`
	 - A colon-separated list of values controlling how commands are saved on the history list. If the list of values includes ‘ignorespace’, lines which begin with a space character are not saved in the history list. A value of ‘ignoredups’ causes lines which match the previous history entry to not be saved. A value of ‘ignoreboth’ is shorthand for ‘ignorespace’ and ‘ignoredups’. A value of ‘erasedups’ causes all previous lines matching the current line to be removed from the history list before that line is saved. Any value not in the above list is ignored. If `HISTCONTROL` is unset, or does not include a valid value, all lines read by the shell parser are saved on the history list, subject to the value of `HISTIGNORE`. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of `HISTCONTROL`.
 
#### `HISTFILE`
	 - The name of the file to which the command history is saved. The default value is ~/.bash\_history.
 
#### `HISTFILESIZE`
	 - The maximum number of lines contained in the history file. When this variable is assigned a value, the history file is truncated, if necessary, to contain no more than that number of lines by removing the oldest entries. The history file is also truncated to this size after writing it when a shell exits. If the value is 0, the history file is truncated to zero size. Non-numeric values and numeric values less than zero inhibit truncation. The shell sets the default value to the value of `HISTSIZE` after reading any startup files.
 
#### `HISTIGNORE`
	 - A colon-separated list of patterns used to decide which command lines should be saved on the history list. Each pattern is anchored at the beginning of the line and must match the complete line (no implicit ‘\*’ is appended). Each pattern is tested against the line after the checks specified by `HISTCONTROL` are applied. In addition to the normal shell pattern matching characters, ‘&’ matches the previous history line. ‘&’ may be escaped using a backslash; the backslash is removed before attempting a match. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of `HISTIGNORE`. The pattern matching honors the setting of the `extglob` shell option.
 
> `HISTIGNORE` subsumes the function of `HISTCONTROL`. A pattern of ‘&’ is identical to `ignoredups`, and a pattern of ‘\[ \]\*’ is identical to `ignorespace`. Combining these two patterns, separating them with a colon, provides the functionality of `ignoreboth`.
> 
#### `HISTSIZE`
	 - The maximum number of commands to remember on the history list. If the value is 0, commands are not saved in the history list. Numeric values less than zero result in every command being saved on the history list (there is no limit). The shell sets the default value to 500 after reading any startup files.
 
#### `HISTTIMEFORMAT`
	 - If this variable is set and not null, its value is used as a format string for strftime to print the time stamp associated with each history entry displayed by the `history` builtin. If this variable is set, time stamps are written to the history file so they may be preserved across shell sessions. This uses the history comment character to distinguish timestamps from other history lines.
 
#### `HOSTFILE`
	 - Contains the name of a file in the same format as /etc/hosts that should be read when the shell needs to complete a hostname. The list of possible hostname completions may be changed while the shell is running; the next time hostname completion is attempted after the value is changed, Bash adds the contents of the new file to the existing list. If `HOSTFILE` is set, but has no value, or does not name a readable file, Bash attempts to read /etc/hosts to obtain the list of possible hostname completions. When `HOSTFILE` is unset, the hostname list is cleared.
 
#### `HOSTNAME`
	 - The name of the current host.
 
#### `HOSTTYPE`
	 - A string describing the machine Bash is running on.
 
#### `IGNOREEOF`
	 - Controls the action of the shell on receipt of an `EOF` character as the sole input. If set, the value denotes the number of consecutive `EOF` characters that can be read as the first character on an input line before the shell will exit. If the variable exists but does not have a numeric value, or has no value, then the default is 10. If the variable does not exist, then `EOF` signifies the end of input to the shell. This is only in effect for interactive shells.
 
#### `INPUTRC`
	 - The name of the Readline initialization file, overriding the default of ~/.inputrc.
 
#### `INSIDE_EMACS`
	 - If Bash finds this variable in the environment when the shell starts, it assumes that the shell is running in an Emacs shell buffer and may disable line editing depending on the value of `TERM`.
 
#### `LANG`
	 - Used to determine the locale category for any category not specifically selected with a variable starting with `LC_`.
 
#### `LC_ALL`
	 - This variable overrides the value of `LANG` and any other `LC_` variable specifying a locale category.
 
#### `LC_COLLATE`
	 - This variable determines the collation order used when sorting the results of filename expansion, and determines the behavior of range expressions, equivalence classes, and collating sequences within filename expansion and pattern matching (see [Filename Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Filename-Expansion)).
 
#### `LC_CTYPE`
	 - This variable determines the interpretation of characters and the behavior of character classes within filename expansion and pattern matching (see [Filename Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Filename-Expansion)).
 
#### `LC_MESSAGES`
	 - This variable determines the locale used to translate double-quoted strings preceded by a ‘$’ (see [Locale Translation](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Locale-Translation)).
 
#### `LC_NUMERIC`
	 - This variable determines the locale category used for number formatting.
 
#### `LC_TIME`
	 - This variable determines the locale category used for data and time formatting.
 
#### `LINENO`
	 - The line number in the script or shell function currently executing. If `LINENO` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `LINES`
	 - Used by the `select` command to determine the column length for printing selection lists. Automatically set if the `checkwinsize` option is enabled (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)), or in an interactive shell upon receipt of a `SIGWINCH`.
 
#### `MACHTYPE`
	 - A string that fully describes the system type on which Bash is executing, in the standard GNU cpu-company-system format.
 
#### `MAILCHECK`
	 - How often (in seconds) that the shell should check for mail in the files specified in the `MAILPATH` or `MAIL` variables. The default is 60 seconds. When it is time to check for mail, the shell does so before displaying the primary prompt. If this variable is unset, or set to a value that is not a number greater than or equal to zero, the shell disables mail checking.
 
#### `MAPFILE`
	 - An array variable created to hold the text read by the `mapfile` builtin when no variable name is supplied.
 
#### `OLDPWD`
	 - The previous working directory as set by the `cd` builtin.
 
#### `OPTERR`
	 - If set to the value 1, Bash displays error messages generated by the `getopts` builtin command.
 
#### `OSTYPE`
	 - A string describing the operating system Bash is running on.
 
#### `PIPESTATUS`
	 - An array variable (see [Arrays](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arrays)) containing a list of exit status values from the processes in the most-recently-executed foreground pipeline (which may contain only a single command).
 
#### `POSIXLY_CORRECT`
	 - If this variable is in the environment when Bash starts, the shell enters POSIX mode (see [Bash POSIX Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-POSIX-Mode)) before reading the startup files, as if the \--posix invocation option had been supplied. If it is set while the shell is running, Bash enables POSIX mode, as if the command
 
            set -o posix
     had been executed. When the shell enters POSIX mode, it sets this variable if it was not already set.

#### `PPID`
	 - The process ID of the shell’s parent process. This variable is readonly.
 
#### `PROMPT_COMMAND`
	 - If this variable is set, and is an array, the value of each set element is interpreted as a command to execute before printing the primary prompt (`$PS1`). If this is set but not an array variable, its value is used as a command to execute instead.
 
#### `PROMPT_DIRTRIM`
	 - If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the `\w` and `\W` prompt string escapes (see [Controlling the Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt)). Characters removed are replaced with an ellipsis.
 
#### `PS0`
	 - The value of this parameter is expanded like `PS1` and displayed by interactive shells after reading a command and before the command is executed.
 
#### `PS3`
	 - The value of this variable is used as the prompt for the `select` command. If this variable is not set, the `select` command prompts with ‘#? ’
 
#### `PS4`
	 - The value of this parameter is expanded like PS1 and the expanded value is the prompt printed before the command line is echoed when the \-x option is set (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)). The first character of the expanded value is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is ‘\+ ’.
 
#### `PWD`
	 - The current working directory as set by the `cd` builtin.
 
#### `RANDOM`
	 - Each time this parameter is referenced, it expands to a random integer between 0 and 32767. Assigning a value to this variable seeds the random number generator. If `RANDOM` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `READLINE_LINE`
	 - The contents of the Readline line buffer, for use with ‘bind -x’ (see [Bash Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Builtins)).
 
#### `READLINE_MARK`
	 - The position of the mark (saved insertion point) in the Readline line buffer, for use with ‘bind -x’ (see [Bash Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Builtins)). The characters between the insertion point and the mark are often called the region.
 
#### `READLINE_POINT`
	 - The position of the insertion point in the Readline line buffer, for use with ‘bind -x’ (see [Bash Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Builtins)).
 
#### `REPLY`
	 - The default variable for the `read` builtin.
 
#### `SECONDS`
	 - This variable expands to the number of seconds since the shell was started. Assignment to this variable resets the count to the value assigned, and the expanded value becomes the value assigned plus the number of seconds since the assignment. The number of seconds at shell invocation and the current time is always determined by querying the system clock. If `SECONDS` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `SHELL`
	 - This environment variable expands to the full pathname to the shell. If it is not set when the shell starts, Bash assigns to it the full pathname of the current user’s login shell.
 
#### `SHELLOPTS`
	 - A colon-separated list of enabled shell options. Each word in the list is a valid argument for the \-o option to the `set` builtin command (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)). The options appearing in `SHELLOPTS` are those reported as ‘on’ by ‘set -o’. If this variable is in the environment when Bash starts up, each shell option in the list will be enabled before reading any startup files. This variable is readonly.
 
#### `SHLVL`
	 - Incremented by one each time a new instance of Bash is started. This is intended to be a count of how deeply your Bash shells are nested.
 
#### `SRANDOM`
	 - This variable expands to a 32-bit pseudo-random number each time it is referenced. The random number generator is not linear on systems that support /dev/urandom or `arc4random`, so each returned number has no relationship to the numbers preceding it. The random number generator cannot be seeded, so assignments to this variable have no effect. If `SRANDOM` is unset, it loses its special properties, even if it is subsequently reset.
 
#### `TIMEFORMAT`
	 - The value of this parameter is used as a format string specifying how the timing information for pipelines prefixed with the `time` reserved word should be displayed. The ‘%’ character introduces an escape sequence that is expanded to a time value or other information. The escape sequences and their meanings are as follows; the braces denote optional portions.
 
#### `%%`
	 - A literal ‘%’.
 
#### `%[p][l]R`
	 - The elapsed time in seconds.
 
#### `%[p][l]U`
	 - The number of CPU seconds spent in user mode.
 
#### `%[p][l]S`
	 - The number of CPU seconds spent in system mode.
 
#### `%P`
	 - The CPU percentage, computed as (%U + %S) / %R.
 
> The optional p is a digit specifying the precision, the number of fractional digits after a decimal point. A value of 0 causes no decimal point or fraction to be output. At most three places after the decimal point may be specified; values of p greater than 3 are changed to 3. If p is not specified, the value 3 is used.
> 
> The optional `l` specifies a longer format, including minutes, of the form MMmSS.FFs. The value of p determines whether or not the fraction is included.
> 
> If this variable is not set, Bash acts as if it had the value
> 
>     $'\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'
> 
> If the value is null, no timing information is displayed. A trailing newline is added when the format string is displayed.
> 
#### `TMOUT`
	 - If set to a value greater than zero, `TMOUT` is treated as the default timeout for the `read` builtin (see [Bash Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Builtins)). The `select` command (see [Conditional Constructs](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Conditional-Constructs)) terminates if input does not arrive after `TMOUT` seconds when input is coming from a terminal.
 
> In an interactive shell, the value is interpreted as the number of seconds to wait for a line of input after issuing the primary prompt. Bash terminates after waiting for that number of seconds if a complete line of input does not arrive.
> 
#### `TMPDIR`
	 - If set, Bash uses its value as the name of a directory in which Bash creates temporary files for the shell’s use.
 
#### `UID`
	 - The numeric real user id of the current user. This variable is readonly.
 
> * * *
> 
> Next: [Job Control](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Job-Control), Previous: [Shell Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Variables), Up: [Top](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Top)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ## 6 Bash Features
> 
> This chapter describes features unique to Bash.
> 
> • [Invoking Bash](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Invoking-Bash)
> 
>   
> 
> Command line options that you can give to Bash.
> 
> • [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Startup-Files)
> 
>   
> 
> When and how Bash executes scripts.
> 
> • [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells)
> 
>   
> 
> What an interactive shell is.
> 
> • [Bash Conditional Expressions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Conditional-Expressions)
> 
>   
> 
> Primitives used in composing expressions for the `test` builtin.
> 
> • [Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic)
> 
>   
> 
> Arithmetic on shell variables.
> 
> • [Aliases](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases)
> 
>   
> 
> Substituting one command for another.
> 
> • [Arrays](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arrays)
> 
>   
> 
> Array Variables.
> 
> • [The Directory Stack](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Directory-Stack)
> 
>   
> 
> History of visited directories.
> 
> • [Controlling the Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt)
> 
>   
> 
> Customizing the various prompt strings.
> 
> • [The Restricted Shell](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Restricted-Shell)
> 
>   
> 
> A more controlled mode of shell execution.
> 
> • [Bash POSIX Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-POSIX-Mode)
> 
>   
> 
> Making Bash behave more closely to what the POSIX standard specifies.
> 
> • [Shell Compatibility Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Compatibility-Mode)
> 
>   
> 
> How Bash supports behavior that was present in earlier versions and has changed.
> 
> * * *
> 
> Next: [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Startup-Files), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.1 Invoking Bash
> 
> bash \[long-opt\] \[-ir\] \[-abefhkmnptuvxdBCDHP\] \[-o option\]
>     \[-O shopt\_option\] \[argument …\]
> bash \[long-opt\] \[-abefhkmnptuvxdBCDHP\] \[-o option\]
>     \[-O shopt\_option\] -c string \[argument …\]
> bash \[long-opt\] -s \[-abefhkmnptuvxdBCDHP\] \[-o option\]
>     \[-O shopt\_option\] \[argument …\]
> 
> All of the single-character options used with the `set` builtin (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)) can be used as options when the shell is invoked. In addition, there are several multi-character options that you can use. These options must appear on the command line before the single-character options to be recognized.
> 
- `--debugger` => Arrange for the debugger profile to be executed before the shell starts. Turns on extended debugging mode (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin) for a description of the `extdebug` option to the `shopt` builtin).
 
- `--dump-po-strings` => A list of all double-quoted strings preceded by ‘$’ is printed on the standard output in the GNU `gettext` PO (portable object) file format. Equivalent to \-D except for the output format.
 
- `--dump-strings` => Equivalent to \-D.
 
- `--help` => Display a usage message on standard output and exit successfully.
 
- `--init-file filename` `--rcfile filename` => Execute commands from filename (instead of ~/.bashrc) in an interactive shell.

- `--login` => Equivalent to \-l.
 
- `--noediting` => Do not use the GNU Readline library (see [Command Line Editing](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Line-Editing)) to read command lines when the shell is interactive.
 
- `--noprofile` => Don’t load the system-wide startup file /etc/profile or any of the personal initialization files ~/.bash\_profile, ~/.bash\_login, or ~/.profile when Bash is invoked as a login shell.
 
- `--norc` => Don’t read the ~/.bashrc initialization file in an interactive shell. This is on by default if the shell is invoked as `sh`.
 
- `--posix` => Change the behavior of Bash where the default operation differs from the POSIX standard to match the standard. This is intended to make Bash behave as a strict superset of that standard. See [Bash POSIX Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-POSIX-Mode), for a description of the Bash POSIX mode.
 
- `--restricted` => Make the shell a restricted shell (see [The Restricted Shell](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Restricted-Shell)).
 
- `--verbose` => Equivalent to \-v. Print shell input lines as they’re read.
 
- `--version` => Show version information for this instance of Bash on the standard output and exit successfully.
 
> There are several single-character options that may be supplied at invocation which are not available with the `set` builtin.
> 
- `-c` => Read and execute commands from the first non-option argument command\_string, then exit. If there are arguments after the command\_string, the first argument is assigned to `$0` and any remaining arguments are assigned to the positional parameters. The assignment to `$0` sets the name of the shell, which is used in warning and error messages.
 
- `-i` => Force the shell to run interactively. Interactive shells are described in [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells).
 
- `-l` => Make this shell act as if it had been directly invoked by login. When the shell is interactive, this is equivalent to starting a login shell with ‘exec -l bash’. When the shell is not interactive, the login shell startup files will be executed. ‘exec bash -l’ or ‘exec bash --login’ will replace the current shell with a Bash login shell. See [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Startup-Files), for a description of the special behavior of a login shell.
 
- `-r` => Make the shell a restricted shell (see [The Restricted Shell](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Restricted-Shell)).
 
- `-s` => If this option is present, or if no arguments remain after option processing, then commands are read from the standard input. This option allows the positional parameters to be set when invoking an interactive shell or when reading input through a pipe.
 
- `-D` => A list of all double-quoted strings preceded by ‘$’ is printed on the standard output. These are the strings that are subject to language translation when the current locale is not `C` or `POSIX` (see [Locale Translation](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Locale-Translation)). This implies the \-n option; no commands will be executed.
 
- `[-+]O [shopt_option]` => shopt\_option is one of the shell options accepted by the `shopt` builtin (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)). If shopt\_option is present, \-O sets the value of that option; +O unsets it. If shopt\_option is not supplied, the names and values of the shell options accepted by `shopt` are printed on the standard output. If the invocation option is +O, the output is displayed in a format that may be reused as input.
 
- `--` => A `--` signals the end of options and disables further option processing. Any arguments after the `--` are treated as filenames and arguments.
 
> A _login_ shell is one whose first character of argument zero is ‘\-’, or one invoked with the \--login option.
> 
> An _interactive_ shell is one started without non-option arguments, unless \-s is specified, without specifying the \-c option, and whose input and output are both connected to terminals (as determined by `isatty(3)`), or one started with the \-i option. See [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells), for more information.
> 
> If arguments remain after option processing, and neither the \-c nor the \-s option has been supplied, the first argument is assumed to be the name of a file containing shell commands (see [Shell Scripts](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Scripts)). When Bash is invoked in this fashion, `$0` is set to the name of the file, and the positional parameters are set to the remaining arguments. Bash reads and executes commands from this file, then exits. Bash’s exit status is the exit status of the last command executed in the script. If no commands are executed, the exit status is 0.
> 
> * * *
> 
> Next: [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells), Previous: [Invoking Bash](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Invoking-Bash), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.2 Bash Startup Files
> 
> This section describes how Bash executes its startup files. If any of the files exist but cannot be read, Bash reports an error. Tildes are expanded in filenames as described above under Tilde Expansion (see [Tilde Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Tilde-Expansion)).
> 
> Interactive shells are described in [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells).
> 
> #### Invoked as an interactive login shell, or with \--login
> 
> When Bash is invoked as an interactive login shell, or as a non-interactive shell with the \--login option, it first reads and executes commands from the file /etc/profile, if that file exists. After reading that file, it looks for ~/.bash\_profile, ~/.bash\_login, and ~/.profile, in that order, and reads and executes commands from the first one that exists and is readable. The \--noprofile option may be used when the shell is started to inhibit this behavior.
> 
> When an interactive login shell exits, or a non-interactive login shell executes the `exit` builtin command, Bash reads and executes commands from the file ~/.bash\_logout, if it exists.
> 
> #### Invoked as an interactive non-login shell
> 
> When an interactive shell that is not a login shell is started, Bash reads and executes commands from ~/.bashrc, if that file exists. This may be inhibited by using the \--norc option. The \--rcfile file option will force Bash to read and execute commands from file instead of ~/.bashrc.
> 
> So, typically, your ~/.bash\_profile contains the line
> 
>     if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
> 
> after (or before) any login-specific initializations.
> 
> #### Invoked non-interactively
> 
> When Bash is started non-interactively, to run a shell script, for example, it looks for the variable `BASH_ENV` in the environment, expands its value if it appears there, and uses the expanded value as the name of a file to read and execute. Bash behaves as if the following command were executed:
> 
>     if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi
> 
> but the value of the `PATH` variable is not used to search for the filename.
> 
> As noted above, if a non-interactive shell is invoked with the \--login option, Bash attempts to read and execute commands from the login shell startup files.
> 
> #### Invoked with name `sh`
> 
> If Bash is invoked with the name `sh`, it tries to mimic the startup behavior of historical versions of `sh` as closely as possible, while conforming to the POSIX standard as well.
> 
> When invoked as an interactive login shell, or as a non-interactive shell with the \--login option, it first attempts to read and execute commands from /etc/profile and ~/.profile, in that order. The \--noprofile option may be used to inhibit this behavior. When invoked as an interactive shell with the name `sh`, Bash looks for the variable `ENV`, expands its value if it is defined, and uses the expanded value as the name of a file to read and execute. Since a shell invoked as `sh` does not attempt to read and execute commands from any other startup files, the \--rcfile option has no effect. A non-interactive shell invoked with the name `sh` does not attempt to read any other startup files.
> 
> When invoked as `sh`, Bash enters POSIX mode after the startup files are read.
> 
> #### Invoked in POSIX mode
> 
> When Bash is started in POSIX mode, as with the \--posix command line option, it follows the POSIX standard for startup files. In this mode, interactive shells expand the `ENV` variable and commands are read and executed from the file whose name is the expanded value. No other startup files are read.
> 
> #### Invoked by remote shell daemon
> 
> Bash attempts to determine when it is being run with its standard input connected to a network connection, as when executed by the remote shell daemon, usually `rshd`, or the secure shell daemon `sshd`. If Bash determines it is being run in this fashion, it reads and executes commands from ~/.bashrc, if that file exists and is readable. It will not do this if invoked as `sh`. The \--norc option may be used to inhibit this behavior, and the \--rcfile option may be used to force another file to be read, but neither `rshd` nor `sshd` generally invoke the shell with those options or allow them to be specified.
> 
> #### Invoked with unequal effective and real UID/GIDs
> 
> If Bash is started with the effective user (group) id not equal to the real user (group) id, and the \-p option is not supplied, no startup files are read, shell functions are not inherited from the environment, the `SHELLOPTS`, `BASHOPTS`, `CDPATH`, and `GLOBIGNORE` variables, if they appear in the environment, are ignored, and the effective user id is set to the real user id. If the \-p option is supplied at invocation, the startup behavior is the same, but the effective user id is not reset.
> 
> * * *
> 
> Next: [Bash Conditional Expressions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Conditional-Expressions), Previous: [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Startup-Files), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.3 Interactive Shells
> 
> • [What is an Interactive Shell?](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#What-is-an-Interactive-Shell_003f)
> 
>   
> 
> What determines whether a shell is Interactive.
> 
> • [Is this Shell Interactive?](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Is-this-Shell-Interactive_003f)
> 
>   
> 
> How to tell if a shell is interactive.
> 
> • [Interactive Shell Behavior](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shell-Behavior)
> 
>   
> 
> What changes in a interactive shell?
> 
> * * *
> 
> Next: [Is this Shell Interactive?](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Is-this-Shell-Interactive_003f), Up: [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> #### 6.3.1 What is an Interactive Shell?
> 
> An interactive shell is one started without non-option arguments, unless \-s is specified, without specifying the \-c option, and whose input and error output are both connected to terminals (as determined by `isatty(3)`), or one started with the \-i option.
> 
> An interactive shell generally reads from and writes to a user’s terminal.
> 
> The \-s invocation option may be used to set the positional parameters when an interactive shell is started.
> 
> * * *
> 
> Next: [Interactive Shell Behavior](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shell-Behavior), Previous: [What is an Interactive Shell?](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#What-is-an-Interactive-Shell_003f), Up: [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> #### 6.3.2 Is this Shell Interactive?
> 
> To determine within a startup script whether or not Bash is running interactively, test the value of the ‘\-’ special parameter. It contains `i` when the shell is interactive. For example:
> 
> case "$-" in
> \*i\*)	echo This shell is interactive ;;
> \*)	echo This shell is not interactive ;;
> esac
> 
> Alternatively, startup scripts may examine the variable `PS1`; it is unset in non-interactive shells, and set in interactive shells. Thus:
> 
> if \[ -z "$PS1" \]; then
>         echo This shell is not interactive
> else
>         echo This shell is interactive
> fi
> 
> * * *
> 
> Previous: [Is this Shell Interactive?](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Is-this-Shell-Interactive_003f), Up: [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> #### 6.3.3 Interactive Shell Behavior
> 
> When the shell is running interactively, it changes its behavior in several ways.
> 
> 1.  Startup files are read and executed as described in [Bash Startup Files](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Startup-Files).
> 2.  Job Control (see [Job Control](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Job-Control)) is enabled by default. When job control is in effect, Bash ignores the keyboard-generated job control signals `SIGTTIN`, `SIGTTOU`, and `SIGTSTP`.
> 3.  Bash expands and displays `PS1` before reading the first line of a command, and expands and displays `PS2` before reading the second and subsequent lines of a multi-line command. Bash expands and displays `PS0` after it reads a command but before executing it. See [Controlling the Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt), for a complete list of prompt string escape sequences.
> 4.  Bash executes the values of the set elements of the `PROMPT_COMMAND` array variable as commands before printing the primary prompt, `$PS1` (see [Bash Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Variables)).
> 5.  Readline (see [Command Line Editing](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Command-Line-Editing)) is used to read commands from the user’s terminal.
> 6.  Bash inspects the value of the `ignoreeof` option to `set -o` instead of exiting immediately when it receives an `EOF` on its standard input when reading a command (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)).
> 7.  Command history (see [Bash History Facilities](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-History-Facilities)) and history expansion (see [History Interaction](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#History-Interaction)) are enabled by default. Bash will save the command history to the file named by `$HISTFILE` when a shell with history enabled exits.
> 8.  Alias expansion (see [Aliases](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases)) is performed by default.
> 9.  In the absence of any traps, Bash ignores `SIGTERM` (see [Signals](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Signals)).
> 10.  In the absence of any traps, `SIGINT` is caught and handled (see [Signals](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Signals)). `SIGINT` will interrupt some shell builtins.
> 11.  An interactive login shell sends a `SIGHUP` to all jobs on exit if the `huponexit` shell option has been enabled (see [Signals](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Signals)).
> 12.  The \-n invocation option is ignored, and ‘set -n’ has no effect (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)).
> 13.  Bash will check for mail periodically, depending on the values of the `MAIL`, `MAILPATH`, and `MAILCHECK` shell variables (see [Bash Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Variables)).
> 14.  Expansion errors due to references to unbound shell variables after ‘set -u’ has been enabled will not cause the shell to exit (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)).
> 15.  The shell will not exit on expansion errors caused by var being unset or null in `${var:?word}` expansions (see [Shell Parameter Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion)).
> 16.  Redirection errors encountered by shell builtins will not cause the shell to exit.
> 17.  When running in POSIX mode, a special builtin returning an error status will not cause the shell to exit (see [Bash POSIX Mode](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-POSIX-Mode)).
> 18.  A failed `exec` will not cause the shell to exit (see [Bourne Shell Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bourne-Shell-Builtins)).
> 19.  Parser syntax errors will not cause the shell to exit.
> 20.  Simple spelling correction for directory arguments to the `cd` builtin is enabled by default (see the description of the `cdspell` option to the `shopt` builtin in [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)).
> 21.  The shell will check the value of the `TMOUT` variable and exit if a command is not read within the specified number of seconds after printing `$PS1` (see [Bash Variables](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Variables)).
> 
> * * *
> 
> Next: [Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic), Previous: [Interactive Shells](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Interactive-Shells), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.4 Bash Conditional Expressions
> 
> Conditional expressions are used by the `[[` compound command and the `test` and `[` builtin commands. The `test` and `[` commands determine their behavior based on the number of arguments; see the descriptions of those commands for any other command-specific actions.
> 
> Expressions may be unary or binary, and are formed from the following primaries. Unary expressions are often used to examine the status of a file. There are string operators and numeric comparison operators as well. Bash handles several filenames specially when they are used in expressions. If the operating system on which Bash is running provides these special files, Bash will use them; otherwise it will emulate them internally with this behavior: If the file argument to one of the primaries is of the form /dev/fd/N, then file descriptor N is checked. If the file argument to one of the primaries is one of /dev/stdin, /dev/stdout, or /dev/stderr, file descriptor 0, 1, or 2, respectively, is checked.
> 
> When used with `[[`, the ‘<’ and ‘\>’ operators sort lexicographically using the current locale. The `test` command uses ASCII ordering.
> 
> Unless otherwise specified, primaries that operate on files follow symbolic links and operate on the target of the link, rather than the link itself.
> 
- `-a file` => True if file exists.
 
- `-b file` => True if file exists and is a block special file.
 
- `-c file` => True if file exists and is a character special file.
 
- `-d file` => True if file exists and is a directory.
 
- `-e file` => True if file exists.
 
- `-f file` => True if file exists and is a regular file.
 
- `-g file` => True if file exists and its set-group-id bit is set.
 
- `-h file` => True if file exists and is a symbolic link.
 
- `-k file` => True if file exists and its "sticky" bit is set.
 
- `-p file` => True if file exists and is a named pipe (FIFO).
 
- `-r file` => True if file exists and is readable.
 
- `-s file` => True if file exists and has a size greater than zero.
 
- `-t fd` => True if file descriptor fd is open and refers to a terminal.
 
- `-u file` => True if file exists and its set-user-id bit is set.
 
- `-w file` => True if file exists and is writable.
 
- `-x file` => True if file exists and is executable.
 
- `-G file` => True if file exists and is owned by the effective group id.
 
- `-L file` => True if file exists and is a symbolic link.
 
- `-N file` => True if file exists and has been modified since it was last read.
 
- `-O file` => True if file exists and is owned by the effective user id.
 
- `-S file` => True if file exists and is a socket.
 
- `file1 -ef file2` => True if file1 and file2 refer to the same device and inode numbers.
 
- `file1 -nt file2` => True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not.
 
- `file1 -ot file2` => True if file1 is older than file2, or if file2 exists and file1 does not.
 
- `-o optname` => True if the shell option optname is enabled. The list of options appears in the description of the \-o option to the `set` builtin (see [The Set Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Set-Builtin)).
 
- `-v varname` => True if the shell variable varname is set (has been assigned a value).
 
- `-R varname` => True if the shell variable varname is set and is a name reference.
 
- `-z string` => True if the length of string is zero.
 
- `-n string` => `string`
 
> True if the length of string is non-zero.
> 
> `string1 == string2`
> 
> `string1 = string2`
> 
> True if the strings are equal. When used with the `[[` command, this performs pattern matching as described above (see [Conditional Constructs](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Conditional-Constructs)).
> 
> ‘\=’ should be used with the `test` command for POSIX conformance.
> 
> `string1 != string2`
> 
> True if the strings are not equal.
> 
> `string1 < string2`
> 
> True if string1 sorts before string2 lexicographically.
> 
> `string1 > string2`
> 
> True if string1 sorts after string2 lexicographically.
> 
- `arg1 OP arg2` => `OP` is one of ‘\-eq’, ‘\-ne’, ‘\-lt’, ‘\-le’, ‘\-gt’, or ‘\-ge’. These arithmetic binary operators return true if arg1 is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to arg2, respectively. Arg1 and arg2 may be positive or negative integers. When used with the `[[` command, Arg1 and Arg2 are evaluated as arithmetic expressions (see [Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic)).
 
> * * *
> 
> Next: [Aliases](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases), Previous: [Bash Conditional Expressions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Conditional-Expressions), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.5 Shell Arithmetic
> 
> The shell allows arithmetic expressions to be evaluated, as one of the shell expansions or by using the `((` compound command, the `let` builtin, or the \-i option to the `declare` builtin.
> 
> Evaluation is done in fixed-width integers with no check for overflow, though division by 0 is trapped and flagged as an error. The operators and their precedence, associativity, and values are the same as in the C language. The following list of operators is grouped into levels of equal-precedence operators. The levels are listed in order of decreasing precedence.
> 
- `id++ id--` => variable post-increment and post-decrement
 
- `++id --id` => variable pre-increment and pre-decrement
 
- `- +` => unary minus and plus
 
- `! ~` => logical and bitwise negation
 
- `**` => exponentiation
 
- `* / %` => multiplication, division, remainder
 
- `+ -` => addition, subtraction
 
> `<< >>`
> 
> left and right bitwise shifts
> 
> `<= >= < >`
> 
> comparison
> 
> `== !=`
> 
> equality and inequality
> 
> `&`
> 
> bitwise AND
> 
> `^`
> 
> bitwise exclusive OR
> 
> `|`
> 
> bitwise OR
> 
> `&&`
> 
> logical AND
> 
> `||`
> 
> logical OR
> 
> `expr ? expr : expr`
> 
> conditional operator
> 
> `= *= /= %= += -= <<= >>= &= ^= |=`
> 
> assignment
> 
> `expr1 , expr2`
> 
> comma
> 
> Shell variables are allowed as operands; parameter expansion is performed before the expression is evaluated. Within an expression, shell variables may also be referenced by name without using the parameter expansion syntax. A shell variable that is null or unset evaluates to 0 when referenced by name without using the parameter expansion syntax. The value of a variable is evaluated as an arithmetic expression when it is referenced, or when a variable which has been given the integer attribute using ‘declare -i’ is assigned a value. A null value evaluates to 0. A shell variable need not have its integer attribute turned on to be used in an expression.
> 
> Integer constants follow the C language definition, without suffixes or character constants. Constants with a leading 0 are interpreted as octal numbers. A leading ‘0x’ or ‘0X’ denotes hexadecimal. Otherwise, numbers take the form \[base`#`\]n, where the optional base is a decimal number between 2 and 64 representing the arithmetic base, and n is a number in that base. If base`#` is omitted, then base 10 is used. When specifying n, if a non-digit is required, the digits greater than 9 are represented by the lowercase letters, the uppercase letters, ‘@’, and ‘\_’, in that order. If base is less than or equal to 36, lowercase and uppercase letters may be used interchangeably to represent numbers between 10 and 35.
> 
> Operators are evaluated in order of precedence. Sub-expressions in parentheses are evaluated first and may override the precedence rules above.
> 
> * * *
> 
> Next: [Arrays](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arrays), Previous: [Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.6 Aliases
> 
> Aliases allow a string to be substituted for a word when it is used as the first word of a simple command. The shell maintains a list of aliases that may be set and unset with the `alias` and `unalias` builtin commands.
> 
> The first word of each simple command, if unquoted, is checked to see if it has an alias. If so, that word is replaced by the text of the alias. The characters ‘/’, ‘$’, ‘\`’, ‘\=’ and any of the shell metacharacters or quoting characters listed above may not appear in an alias name. The replacement text may contain any valid shell input, including shell metacharacters. The first word of the replacement text is tested for aliases, but a word that is identical to an alias being expanded is not expanded a second time. This means that one may alias `ls` to `"ls -F"`, for instance, and Bash does not try to recursively expand the replacement text. If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion.
> 
> Aliases are created and listed with the `alias` command, and removed with the `unalias` command.
> 
> There is no mechanism for using arguments in the replacement text, as in `csh`. If arguments are needed, a shell function should be used (see [Shell Functions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Functions)).
> 
> Aliases are not expanded when the shell is not interactive, unless the `expand_aliases` shell option is set using `shopt` (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)).
> 
> The rules concerning the definition and use of aliases are somewhat confusing. Bash always reads at least one complete line of input, and all lines that make up a compound command, before executing any of the commands on that line or the compound command. Aliases are expanded when a command is read, not when it is executed. Therefore, an alias definition appearing on the same line as another command does not take effect until the next line of input is read. The commands following the alias definition on that line are not affected by the new alias. This behavior is also an issue when functions are executed. Aliases are expanded when a function definition is read, not when the function is executed, because a function definition is itself a command. As a consequence, aliases defined in a function are not available until after that function is executed. To be safe, always put alias definitions on a separate line, and do not use `alias` in compound commands.
> 
> For almost every purpose, shell functions are preferred over aliases.
> 
> * * *
> 
> Next: [The Directory Stack](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Directory-Stack), Previous: [Aliases](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Aliases), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.7 Arrays
> 
> Bash provides one-dimensional indexed and associative array variables. Any variable may be used as an indexed array; the `declare` builtin will explicitly declare an array. There is no maximum limit on the size of an array, nor any requirement that members be indexed or assigned contiguously. Indexed arrays are referenced using integers (including arithmetic expressions (see [Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic))) and are zero-based; associative arrays use arbitrary strings. Unless otherwise noted, indexed array indices must be non-negative integers.
> 
> An indexed array is created automatically if any variable is assigned to using the syntax
> 
> name\[subscript\]=value
> 
> The subscript is treated as an arithmetic expression that must evaluate to a number. To explicitly declare an array, use
> 
> declare -a name
> 
> The syntax
> 
> declare -a name\[subscript\]
> 
> is also accepted; the subscript is ignored.
> 
> Associative arrays are created using
> 
> declare -A name
> 
> Attributes may be specified for an array variable using the `declare` and `readonly` builtins. Each attribute applies to all members of an array.
> 
> Arrays are assigned to using compound assignments of the form
> 
> name\=(value1 value2 … )
> 
> where each value may be of the form `[subscript]=`string. Indexed array assignments do not require anything but string. When assigning to indexed arrays, if the optional subscript is supplied, that index is assigned to; otherwise the index of the element assigned is the last index assigned to by the statement plus one. Indexing starts at zero.
> 
> Each value in the list undergoes all the shell expansions described above (see [Shell Expansions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Expansions)).
> 
> When assigning to an associative array, the words in a compound assignment may be either assignment statements, for which the subscript is required, or a list of words that is interpreted as a sequence of alternating keys and values: name\=(key1 value1 key2 value2 … ). These are treated identically to name\=( \[key1\]=value1 \[key2\]=value2 … ). The first word in the list determines how the remaining words are interpreted; all assignments in a list must be of the same type. When using key/value pairs, the keys may not be missing or empty; a final missing value is treated like the empty string.
> 
> This syntax is also accepted by the `declare` builtin. Individual array elements may be assigned to using the `name[subscript]=value` syntax introduced above.
> 
> When assigning to an indexed array, if name is subscripted by a negative number, that number is interpreted as relative to one greater than the maximum index of name, so negative indices count back from the end of the array, and an index of -1 references the last element.
> 
> Any element of an array may be referenced using `${name[subscript]}`. The braces are required to avoid conflicts with the shell’s filename expansion operators. If the subscript is ‘@’ or ‘\*’, the word expands to all members of the array name. These subscripts differ only when the word appears within double quotes. If the word is double-quoted, `${name[*]}` expands to a single word with the value of each array member separated by the first character of the `IFS` variable, and `${name[@]}` expands each element of name to a separate word. When there are no array members, `${name[@]}` expands to nothing. If the double-quoted expansion occurs within a word, the expansion of the first parameter is joined with the beginning part of the original word, and the expansion of the last parameter is joined with the last part of the original word. This is analogous to the expansion of the special parameters ‘@’ and ‘\*’. `${#name[subscript]}` expands to the length of `${name[subscript]}`. If subscript is ‘@’ or ‘\*’, the expansion is the number of elements in the array. If the subscript used to reference an element of an indexed array evaluates to a number less than zero, it is interpreted as relative to one greater than the maximum index of the array, so negative indices count back from the end of the array, and an index of -1 refers to the last element.
> 
> Referencing an array variable without a subscript is equivalent to referencing with a subscript of 0. Any reference to a variable using a valid subscript is legal, and `bash` will create an array if necessary.
> 
> An array variable is considered set if a subscript has been assigned a value. The null string is a valid value.
> 
> It is possible to obtain the keys (indices) of an array as well as the values. ${!name\[@\]} and ${!name\[\*\]} expand to the indices assigned in array variable name. The treatment when in double quotes is similar to the expansion of the special parameters ‘@’ and ‘\*’ within double quotes.
> 
> The `unset` builtin is used to destroy arrays. `unset name[subscript]` destroys the array element at index subscript. Negative subscripts to indexed arrays are interpreted as described above. Unsetting the last element of an array variable does not unset the variable. `unset name`, where name is an array, removes the entire array. A subscript of ‘\*’ or ‘@’ also removes the entire array.
> 
> When using a variable name with a subscript as an argument to a command, such as with `unset`, without using the word expansion syntax described above, the argument is subject to the shell’s filename expansion. If filename expansion is not desired, the argument should be quoted.
> 
> The `declare`, `local`, and `readonly` builtins each accept a \-a option to specify an indexed array and a \-A option to specify an associative array. If both options are supplied, \-A takes precedence. The `read` builtin accepts a \-a option to assign a list of words read from the standard input to an array, and can read values from the standard input into individual array elements. The `set` and `declare` builtins display array values in a way that allows them to be reused as input.
> 
> * * *
> 
> Next: [Controlling the Prompt](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Controlling-the-Prompt), Previous: [Arrays](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Arrays), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.8 The Directory Stack
> 
> • [Directory Stack Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Directory-Stack-Builtins)
> 
>   
> 
> Bash builtin commands to manipulate the directory stack.
> 
> The directory stack is a list of recently-visited directories. The `pushd` builtin adds directories to the stack as it changes the current directory, and the `popd` builtin removes specified directories from the stack and changes the current directory to the directory removed. The `dirs` builtin displays the contents of the directory stack. The current directory is always the "top" of the directory stack.
> 
> The contents of the directory stack are also visible as the value of the `DIRSTACK` shell variable.
> 
> * * *
> 
> Up: [The Directory Stack](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Directory-Stack)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> #### 6.8.1 Directory Stack Builtins
> 
#### `dirs`
	 - dirs \[-clpv\] \[+N | -N\]
 
> Display the list of currently remembered directories. Directories are added to the list with the `pushd` command; the `popd` command removes directories from the list. The current directory is always the first directory in the stack.
> 
- `-c` => Clears the directory stack by deleting all of the elements.
 
- `-l` => Produces a listing using full pathnames; the default listing format uses a tilde to denote the home directory.
 
- `-p` => Causes `dirs` to print the directory stack with one entry per line.
 
- `-v` => Causes `dirs` to print the directory stack with one entry per line, prefixing each entry with its index in the stack.
 
- `+N` => Displays the Nth directory (counting from the left of the list printed by `dirs` when invoked without options), starting with zero.
 
- `-N` => Displays the Nth directory (counting from the right of the list printed by `dirs` when invoked without options), starting with zero.
 
#### `popd`
	 - popd \[-n\] \[+N | -N\]
 
> When no arguments are given, `popd` removes the top directory from the stack and performs a `cd` to the new top directory. The elements are numbered from 0 starting at the first directory listed with `dirs`; that is, `popd` is equivalent to `popd +0`.
> 
- `-n` => Suppresses the normal change of directory when removing directories from the stack, so that only the stack is manipulated.
 
- `+N` => Removes the Nth directory (counting from the left of the list printed by `dirs`), starting with zero.
 
- `-N` => Removes the Nth directory (counting from the right of the list printed by `dirs`), starting with zero.
 
#### `pushd`
	 - pushd \[-n\] \[+N | \-N | dir\]
 
> Save the current directory on the top of the directory stack and then `cd` to dir. With no arguments, `pushd` exchanges the top two directories and makes the new top the current directory.
> 
- `-n` => Suppresses the normal change of directory when rotating or adding directories to the stack, so that only the stack is manipulated.
 
- `+N` => Brings the Nth directory (counting from the left of the list printed by `dirs`, starting with zero) to the top of the list by rotating the stack.
 
- `-N` => Brings the Nth directory (counting from the right of the list printed by `dirs`, starting with zero) to the top of the list by rotating the stack.
 
#### `dir`
	 - Makes dir be the top of the stack, making it the new current directory as if it had been supplied as an argument to the `cd` builtin.
 
> * * *
> 
> Next: [The Restricted Shell](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Restricted-Shell), Previous: [The Directory Stack](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Directory-Stack), Up: [Bash Features](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Features)   \[[Contents](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents "Table of contents")\]\[[Index](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Indexes "Index")\]
> 
> ### 6.9 Controlling the Prompt
> 
> Bash examines the value of the array variable `PROMPT_COMMAND` just before printing each primary prompt. If any elements in `PROMPT_COMMAND` are set and non-null, Bash executes each value, in numeric order, just as if it had been typed on the command line.
> 
> In addition, the following table describes the special characters which can appear in the prompt variables `PS0`, `PS1`, `PS2`, and `PS4`:
> 
> `\a`
> 
> A bell character.
> 
> `\d`
> 
> The date, in "Weekday Month Date" format (e.g., "Tue May 26").
> 
> `\D{format}`
> 
> The format is passed to `strftime`(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required.
> 
> `\e`
> 
> An escape character.
> 
> `\h`
> 
> The hostname, up to the first ‘.’.
> 
> `\H`
> 
> The hostname.
> 
> `\j`
> 
> The number of jobs currently managed by the shell.
> 
> `\l`
> 
> The basename of the shell’s terminal device name.
> 
> `\n`
> 
> A newline.
> 
> `\r`
> 
> A carriage return.
> 
> `\s`
> 
> The name of the shell, the basename of `$0` (the portion following the final slash).
> 
> `\t`
> 
> The time, in 24-hour HH:MM:SS format.
> 
> `\T`
> 
> The time, in 12-hour HH:MM:SS format.
> 
> `\@`
> 
> The time, in 12-hour am/pm format.
> 
> `\A`
> 
> The time, in 24-hour HH:MM format.
> 
> `\u`
> 
> The username of the current user.
> 
> `\v`
> 
> The version of Bash (e.g., 2.00)
> 
> `\V`
> 
> The release of Bash, version + patchlevel (e.g., 2.00.0)
> 
> `\w`
> 
> The current working directory, with `$HOME` abbreviated with a tilde (uses the `$PROMPT_DIRTRIM` variable).
> 
> `\W`
> 
> The basename of `$PWD`, with `$HOME` abbreviated with a tilde.
> 
> `\!`
> 
> The history number of this command.
> 
> `\#`
> 
> The command number of this command.
> 
> `\$`
> 
> If the effective uid is 0, `#`, otherwise `$`.
> 
> `\nnn`
> 
> The character whose ASCII code is the octal value nnn.
> 
> `\\`
> 
> A backslash.
> 
> `\[`
> 
> Begin a sequence of non-printing characters. This could be used to embed a terminal control sequence into the prompt.
> 
> `\]`
> 
> End a sequence of non-printing characters.
> 
> The command number and the history number are usually different: the history number of a command is its position in the history list, which may include commands restored from the history file (see [Bash History Facilities](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-History-Facilities)), while the command number is the position in the sequence of commands executed during the current shell session.
> 
> After the string is decoded, it is expanded via parameter expansion, command substitution, arithmetic expansion, and quote removal, subject to the value of the `promptvars` shell option (see [The Shopt Builtin](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#The-Shopt-Builtin)). This can have unwanted side effects if escaped portions of the string appear within command substitution or contain characters special to word expansion.


===========================================================================================
The Set Builtin

This builtin is so complicated that it deserves its own section. set allows you to change the values of shell options and set the positional parameters, or to display the names and values of shell variables.

set

    set [--abefhkmnptuvxBCEHPT] [-o option-name] [argument …]
    set [+abefhkmnptuvxBCEHPT] [+o option-name] [argument …]

    If no options or arguments are supplied, set displays the names and values of all shell variables and functions, sorted according to the current locale, in a format that may be reused as input for setting or resetting the currently-set variables. Read-only variables cannot be reset. In POSIX mode, only shell variables are listed.

    When options are supplied, they set or unset shell attributes. Options, if specified, have the following meanings:

    -a

        Each variable or function that is created or modified is given the export attribute and marked for export to the environment of subsequent commands.
    -b

        Cause the status of terminated background jobs to be reported immediately, rather than before printing the next primary prompt.
    -e

        Exit immediately if a pipeline (see Pipelines), which may consist of a single simple command (see Simple Commands), a list (see Lists), or a compound command (see Compound Commands) returns a non-zero status. The shell does not exit if the command that fails is part of the command list immediately following a while or until keyword, part of the test in an if statement, part of any command executed in a && or || list except the command following the final && or ||, any command in a pipeline but the last, or if the command’s return status is being inverted with !. If a compound command other than a subshell returns a non-zero status because a command failed while -e was being ignored, the shell does not exit. A trap on ERR, if set, is executed before the shell exits.

        This option applies to the shell environment and each subshell environment separately (see Command Execution Environment), and may cause subshells to exit before executing all the commands in the subshell.

        If a compound command or shell function executes in a context where -e is being ignored, none of the commands executed within the compound command or function body will be affected by the -e setting, even if -e is set and a command returns a failure status. If a compound command or shell function sets -e while executing in a context where -e is ignored, that setting will not have any effect until the compound command or the command containing the function call completes.
    -f

        Disable filename expansion (globbing).
    -h

        Locate and remember (hash) commands as they are looked up for execution. This option is enabled by default.
    -k

        All arguments in the form of assignment statements are placed in the environment for a command, not just those that precede the command name.
    -m

        Job control is enabled (see Job Control). All processes run in a separate process group. When a background job completes, the shell prints a line containing its exit status.
    -n

        Read commands but do not execute them. This may be used to check a script for syntax errors. This option is ignored by interactive shells.
    -o option-name

        Set the option corresponding to option-name:

        allexport

            Same as -a.
        braceexpand

            Same as -B.
        emacs

            Use an emacs-style line editing interface (see Command Line Editing). This also affects the editing interface used for read -e.
        errexit

            Same as -e.
        errtrace

            Same as -E.
        functrace

            Same as -T.
        hashall

            Same as -h.
        histexpand

            Same as -H.
        history

            Enable command history, as described in Bash History Facilities. This option is on by default in interactive shells.
        ignoreeof

            An interactive shell will not exit upon reading EOF.
        keyword

            Same as -k.
        monitor

            Same as -m.
        noclobber

            Same as -C.
        noexec

            Same as -n.
        noglob

            Same as -f.
        nolog

            Currently ignored.
        notify

            Same as -b.
        nounset

            Same as -u.
        onecmd

            Same as -t.
        physical

            Same as -P.
        pipefail

            If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully. This option is disabled by default.
        posix

            Change the behavior of Bash where the default operation differs from the POSIX standard to match the standard (see Bash POSIX Mode). This is intended to make Bash behave as a strict superset of that standard.
        privileged

            Same as -p.
        verbose

            Same as -v.
        vi

            Use a vi-style line editing interface. This also affects the editing interface used for read -e.
        xtrace

            Same as -x. 

    -p

        Turn on privileged mode. In this mode, the $BASH_ENV and $ENV files are not processed, shell functions are not inherited from the environment, and the SHELLOPTS, BASHOPTS, CDPATH and GLOBIGNORE variables, if they appear in the environment, are ignored. If the shell is started with the effective user (group) id not equal to the real user (group) id, and the -p option is not supplied, these actions are taken and the effective user id is set to the real user id. If the -p option is supplied at startup, the effective user id is not reset. Turning this option off causes the effective user and group ids to be set to the real user and group ids.
    -t

        Exit after reading and executing one command.
    -u

        Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error when performing parameter expansion. An error message will be written to the standard error, and a non-interactive shell will exit.
    -v

        Print shell input lines as they are read.
    -x

        Print a trace of simple commands, for commands, case commands, select commands, and arithmetic for commands and their arguments or associated word lists after they are expanded and before they are executed. The value of the PS4 variable is expanded and the resultant value is printed before the command and its expanded arguments.
    -B

        The shell will perform brace expansion (see Brace Expansion). This option is on by default.
    -C

        Prevent output redirection using ‘>’, ‘>&’, and ‘<>’ from overwriting existing files.
    -E

        If set, any trap on ERR is inherited by shell functions, command substitutions, and commands executed in a subshell environment. The ERR trap is normally not inherited in such cases.
    -H

        Enable ‘!’ style history substitution (see History Interaction). This option is on by default for interactive shells.
    -P

        If set, do not resolve symbolic links when performing commands such as cd which change the current directory. The physical directory is used instead. By default, Bash follows the logical chain of directories when performing commands which change the current directory.

        For example, if /usr/sys is a symbolic link to /usr/local/sys then:

        $ cd /usr/sys; echo $PWD
        /usr/sys
        $ cd ..; pwd
        /usr

        If set -P is on, then:

        $ cd /usr/sys; echo $PWD
        /usr/local/sys
        $ cd ..; pwd
        /usr/local

    -T

        If set, any trap on DEBUG and RETURN are inherited by shell functions, command substitutions, and commands executed in a subshell environment. The DEBUG and RETURN traps are normally not inherited in such cases.
    --

        If no arguments follow this option, then the positional parameters are unset. Otherwise, the positional parameters are set to the arguments, even if some of them begin with a ‘-’.
    -

        Signal the end of options, cause all remaining arguments to be assigned to the positional parameters. The -x and -v options are turned off. If there are no arguments, the positional parameters remain unchanged. 

    Using ‘+’ rather than ‘-’ causes these options to be turned off. The options can also be used upon invocation of the shell. The current set of options may be found in $-.

    The remaining N arguments are positional parameters and are assigned, in order, to $1, $2, … $N. The special parameter # is set to N.

    The return status is always zero unless an invalid option is supplied. 

Previous: The Set Builtin, Up: Modifying Shell Behavior   [Contents][Index]
4.3.2 The Shopt Builtin

This builtin allows you to change additional shell optional behavior.

shopt

    shopt [-pqsu] [-o] [optname …]

    Toggle the values of settings controlling optional shell behavior. The settings can be either those listed below, or, if the -o option is used, those available with the -o option to the set builtin command (see The Set Builtin). With no options, or with the -p option, a list of all settable options is displayed, with an indication of whether or not each is set; if optnames are supplied, the output is restricted to those options. The -p option causes output to be displayed in a form that may be reused as input. Other options have the following meanings:

    -s

        Enable (set) each optname.
    -u

        Disable (unset) each optname.
    -q

        Suppresses normal output; the return status indicates whether the optname is set or unset. If multiple optname arguments are given with -q, the return status is zero if all optnames are enabled; non-zero otherwise.
    -o

        Restricts the values of optname to be those defined for the -o option to the set builtin (see The Set Builtin). 

    If either -s or -u is used with no optname arguments, shopt shows only those options which are set or unset, respectively.

    Unless otherwise noted, the shopt options are disabled (off) by default.

    The return status when listing options is zero if all optnames are enabled, non-zero otherwise. When setting or unsetting options, the return status is zero unless an optname is not a valid shell option.

    The list of shopt options is:

    assoc_expand_once

        If set, the shell suppresses multiple evaluation of associative array subscripts during arithmetic expression evaluation, while executing builtins that can perform variable assignments, and while executing builtins that perform array dereferencing.
    autocd

        If set, a command name that is the name of a directory is executed as if it were the argument to the cd command. This option is only used by interactive shells.
    cdable_vars

        If this is set, an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to.
    cdspell

        If set, minor errors in the spelling of a directory component in a cd command will be corrected. The errors checked for are transposed characters, a missing character, and a character too many. If a correction is found, the corrected path is printed, and the command proceeds. This option is only used by interactive shells.
    checkhash

        If this is set, Bash checks that a command found in the hash table exists before trying to execute it. If a hashed command no longer exists, a normal path search is performed.
    checkjobs

        If set, Bash lists the status of any stopped and running jobs before exiting an interactive shell. If any jobs are running, this causes the exit to be deferred until a second exit is attempted without an intervening command (see Job Control). The shell always postpones exiting if any jobs are stopped.
    checkwinsize

        If set, Bash checks the window size after each external (non-builtin) command and, if necessary, updates the values of LINES and COLUMNS. This option is enabled by default.
    cmdhist

        If set, Bash attempts to save all lines of a multiple-line command in the same history entry. This allows easy re-editing of multi-line commands. This option is enabled by default, but only has an effect if command history is enabled (see Bash History Facilities).
    compat31
    compat32
    compat40
    compat41
    compat42
    compat43
    compat44

        These control aspects of the shell’s compatibility mode (see Shell Compatibility Mode).
    complete_fullquote

        If set, Bash quotes all shell metacharacters in filenames and directory names when performing completion. If not set, Bash removes metacharacters such as the dollar sign from the set of characters that will be quoted in completed filenames when these metacharacters appear in shell variable references in words to be completed. This means that dollar signs in variable names that expand to directories will not be quoted; however, any dollar signs appearing in filenames will not be quoted, either. This is active only when bash is using backslashes to quote completed filenames. This variable is set by default, which is the default Bash behavior in versions through 4.2.
    direxpand

        If set, Bash replaces directory names with the results of word expansion when performing filename completion. This changes the contents of the readline editing buffer. If not set, Bash attempts to preserve what the user typed.
    dirspell

        If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
    dotglob

        If set, Bash includes filenames beginning with a ‘.’ in the results of filename expansion. The filenames ‘.’ and ‘..’ must always be matched explicitly, even if dotglob is set.
    execfail

        If this is set, a non-interactive shell will not exit if it cannot execute the file specified as an argument to the exec builtin command. An interactive shell does not exit if exec fails.
    expand_aliases

        If set, aliases are expanded as described below under Aliases, Aliases. This option is enabled by default for interactive shells.
    extdebug

        If set at shell invocation, or in a shell startup file, arrange to execute the debugger profile before the shell starts, identical to the --debugger option. If set after invocation, behavior intended for use by debuggers is enabled:

            The -F option to the declare builtin (see Bash Builtins) displays the source file name and line number corresponding to each function name supplied as an argument.
            If the command run by the DEBUG trap returns a non-zero value, the next command is skipped and not executed.
            If the command run by the DEBUG trap returns a value of 2, and the shell is executing in a subroutine (a shell function or a shell script executed by the . or source builtins), the shell simulates a call to return.
            BASH_ARGC and BASH_ARGV are updated as described in their descriptions (see Bash Variables).
            Function tracing is enabled: command substitution, shell functions, and subshells invoked with ( command ) inherit the DEBUG and RETURN traps.
            Error tracing is enabled: command substitution, shell functions, and subshells invoked with ( command ) inherit the ERR trap. 

    extglob

        If set, the extended pattern matching features described above (see Pattern Matching) are enabled.
    extquote

        If set, $'string' and $"string" quoting is performed within ${parameter} expansions enclosed in double quotes. This option is enabled by default.
    failglob

        If set, patterns which fail to match filenames during filename expansion result in an expansion error.
    force_fignore

        If set, the suffixes specified by the FIGNORE shell variable cause words to be ignored when performing word completion even if the ignored words are the only possible completions. See Bash Variables, for a description of FIGNORE. This option is enabled by default.
    globasciiranges

        If set, range expressions used in pattern matching bracket expressions (see Pattern Matching) behave as if in the traditional C locale when performing comparisons. That is, the current locale’s collating sequence is not taken into account, so ‘b’ will not collate between ‘A’ and ‘B’, and upper-case and lower-case ASCII characters will collate together.
    globstar

        If set, the pattern ‘**’ used in a filename expansion context will match all files and zero or more directories and subdirectories. If the pattern is followed by a ‘/’, only directories and subdirectories match.
    gnu_errfmt

        If set, shell error messages are written in the standard GNU error message format.
    histappend

        If set, the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file.
    histreedit

        If set, and Readline is being used, a user is given the opportunity to re-edit a failed history substitution.
    histverify

        If set, and Readline is being used, the results of history substitution are not immediately passed to the shell parser. Instead, the resulting line is loaded into the Readline editing buffer, allowing further modification.
    hostcomplete

        If set, and Readline is being used, Bash will attempt to perform hostname completion when a word containing a ‘@’ is being completed (see Commands For Completion). This option is enabled by default.
    huponexit

        If set, Bash will send SIGHUP to all jobs when an interactive login shell exits (see Signals).
    inherit_errexit

        If set, command substitution inherits the value of the errexit option, instead of unsetting it in the subshell environment. This option is enabled when POSIX mode is enabled.
    interactive_comments

        Allow a word beginning with ‘#’ to cause that word and all remaining characters on that line to be ignored in an interactive shell. This option is enabled by default.
    lastpipe

        If set, and job control is not active, the shell runs the last command of a pipeline not executed in the background in the current shell environment.
    lithist

        If enabled, and the cmdhist option is enabled, multi-line commands are saved to the history with embedded newlines rather than using semicolon separators where possible.
    localvar_inherit

        If set, local variables inherit the value and attributes of a variable of the same name that exists at a previous scope before any new value is assigned. The nameref attribute is not inherited.
    localvar_unset

        If set, calling unset on local variables in previous function scopes marks them so subsequent lookups find them unset until that function returns. This is identical to the behavior of unsetting local variables at the current function scope.
    login_shell

        The shell sets this option if it is started as a login shell (see Invoking Bash). The value may not be changed.
    mailwarn

        If set, and a file that Bash is checking for mail has been accessed since the last time it was checked, the message "The mail in mailfile has been read" is displayed.
    no_empty_cmd_completion

        If set, and Readline is being used, Bash will not attempt to search the PATH for possible completions when completion is attempted on an empty line.
    nocaseglob

        If set, Bash matches filenames in a case-insensitive fashion when performing filename expansion.
    nocasematch

        If set, Bash matches patterns in a case-insensitive fashion when performing matching while executing case or [[ conditional commands, when performing pattern substitution word expansions, or when filtering possible completions as part of programmable completion.
    nullglob

        If set, Bash allows filename patterns which match no files to expand to a null string, rather than themselves.
    progcomp

        If set, the programmable completion facilities (see Programmable Completion) are enabled. This option is enabled by default.
    progcomp_alias

        If set, and programmable completion is enabled, Bash treats a command name that doesn’t have any completions as a possible alias and attempts alias expansion. If it has an alias, Bash attempts programmable completion using the command word resulting from the expanded alias.
    promptvars

        If set, prompt strings undergo parameter expansion, command substitution, arithmetic expansion, and quote removal after being expanded as described below (see Controlling the Prompt). This option is enabled by default.
    restricted_shell

        The shell sets this option if it is started in restricted mode (see The Restricted Shell). The value may not be changed. This is not reset when the startup files are executed, allowing the startup files to discover whether or not a shell is restricted.
    shift_verbose

        If this is set, the shift builtin prints an error message when the shift count exceeds the number of positional parameters.
    sourcepath

        If set, the source builtin uses the value of PATH to find the directory containing the file supplied as an argument. This option is enabled by default.
    xpg_echo

        If set, the echo builtin expands backslash-escape sequences by default.

Previous: Modifying Shell Behavior, Up: Shell Builtin Commands   [Contents][Index]
4.4 Special Builtins

For historical reasons, the POSIX standard has classified several builtin commands as special. When Bash is executing in POSIX mode, the special builtins differ from other builtin commands in three respects:

    Special builtins are found before shell functions during command lookup.
    If a special builtin returns an error status, a non-interactive shell exits.
    Assignment statements preceding the command stay in effect in the shell environment after the command completes. 

When Bash is not executing in POSIX mode, these builtins behave no differently than the rest of the Bash builtin commands. The Bash POSIX mode is described in Bash POSIX Mode.

These are the POSIX special builtins:

break : . continue eval exec exit export readonly return set
shift trap unset

Next: Bash Features, Previous: Shell Builtin Commands, Up: Top   [Contents][Index]
5 Shell Variables
• Bourne Shell Variables	  	Variables which Bash uses in the same way as the Bourne Shell.
• Bash Variables	  	List of variables that exist in Bash.

This chapter describes the shell variables that Bash uses. Bash automatically assigns default values to a number of variables.

Next: Bash Variables, Up: Shell Variables   [Contents][Index]
5.1 Bourne Shell Variables

Bash uses certain shell variables in the same way as the Bourne shell. In some cases, Bash assigns a default value to the variable.

CDPATH

    A colon-separated list of directories used as a search path for the cd builtin command.
HOME

    The current user’s home directory; the default for the cd builtin command. The value of this variable is also used by tilde expansion (see Tilde Expansion).
IFS

    A list of characters that separate fields; used when the shell splits words as part of expansion.
MAIL

    If this parameter is set to a filename or directory name and the MAILPATH variable is not set, Bash informs the user of the arrival of mail in the specified file or Maildir-format directory.
MAILPATH

    A colon-separated list of filenames which the shell periodically checks for new mail. Each list entry can specify the message that is printed when new mail arrives in the mail file by separating the filename from the message with a ‘?’. When used in the text of the message, $_ expands to the name of the current mail file.
OPTARG

    The value of the last option argument processed by the getopts builtin.
OPTIND

    The index of the last option argument processed by the getopts builtin.
PATH

    A colon-separated list of directories in which the shell looks for commands. A zero-length (null) directory name in the value of PATH indicates the current directory. A null directory name may appear as two adjacent colons, or as an initial or trailing colon.
PS1

    The primary prompt string. The default value is ‘\s-\v\$ ’. See Controlling the Prompt, for the complete list of escape sequences that are expanded before PS1 is displayed.
PS2

    The secondary prompt string. The default value is ‘> ’. PS2 is expanded in the same way as PS1 before being displayed.

Previous: Bourne Shell Variables, Up: Shell Variables   [Contents][Index]
5.2 Bash Variables

These variables are set or used by Bash, but other shells do not normally treat them specially.

A few variables used by Bash are described in different chapters: variables for controlling the job control facilities (see Job Control Variables).

_

    ($_, an underscore.) At shell startup, set to the pathname used to invoke the shell or shell script being executed as passed in the environment or argument list. Subsequently, expands to the last argument to the previous simple command executed in the foreground, after expansion. Also set to the full pathname used to invoke each command executed and placed in the environment exported to that command. When checking mail, this parameter holds the name of the mail file.
BASH

    The full pathname used to execute the current instance of Bash.
BASHOPTS

    A colon-separated list of enabled shell options. Each word in the list is a valid argument for the -s option to the shopt builtin command (see The Shopt Builtin). The options appearing in BASHOPTS are those reported as ‘on’ by ‘shopt’. If this variable is in the environment when Bash starts up, each shell option in the list will be enabled before reading any startup files. This variable is readonly.
BASHPID

    Expands to the process ID of the current Bash process. This differs from $$ under certain circumstances, such as subshells that do not require Bash to be re-initialized. Assignments to BASHPID have no effect. If BASHPID is unset, it loses its special properties, even if it is subsequently reset.
BASH_ALIASES

    An associative array variable whose members correspond to the internal list of aliases as maintained by the alias builtin. (see Bourne Shell Builtins). Elements added to this array appear in the alias list; however, unsetting array elements currently does not cause aliases to be removed from the alias list. If BASH_ALIASES is unset, it loses its special properties, even if it is subsequently reset.
BASH_ARGC

    An array variable whose values are the number of parameters in each frame of the current bash execution call stack. The number of parameters to the current subroutine (shell function or script executed with . or source) is at the top of the stack. When a subroutine is executed, the number of parameters passed is pushed onto BASH_ARGC. The shell sets BASH_ARGC only when in extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin). Setting extdebug after the shell has started to execute a script, or referencing this variable when extdebug is not set, may result in inconsistent values.
BASH_ARGV

    An array variable containing all of the parameters in the current bash execution call stack. The final parameter of the last subroutine call is at the top of the stack; the first parameter of the initial call is at the bottom. When a subroutine is executed, the parameters supplied are pushed onto BASH_ARGV. The shell sets BASH_ARGV only when in extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin). Setting extdebug after the shell has started to execute a script, or referencing this variable when extdebug is not set, may result in inconsistent values.
BASH_ARGV0

    When referenced, this variable expands to the name of the shell or shell script (identical to $0; See Special Parameters, for the description of special parameter 0). Assignment to BASH_ARGV0 causes the value assigned to also be assigned to $0. If BASH_ARGV0 is unset, it loses its special properties, even if it is subsequently reset.
BASH_CMDS

    An associative array variable whose members correspond to the internal hash table of commands as maintained by the hash builtin (see Bourne Shell Builtins). Elements added to this array appear in the hash table; however, unsetting array elements currently does not cause command names to be removed from the hash table. If BASH_CMDS is unset, it loses its special properties, even if it is subsequently reset.
BASH_COMMAND

    The command currently being executed or about to be executed, unless the shell is executing a command as the result of a trap, in which case it is the command executing at the time of the trap. If BASH_COMMAND is unset, it loses its special properties, even if it is subsequently reset.
BASH_COMPAT

    The value is used to set the shell’s compatibility level. See Shell Compatibility Mode, for a description of the various compatibility levels and their effects. The value may be a decimal number (e.g., 4.2) or an integer (e.g., 42) corresponding to the desired compatibility level. If BASH_COMPAT is unset or set to the empty string, the compatibility level is set to the default for the current version. If BASH_COMPAT is set to a value that is not one of the valid compatibility levels, the shell prints an error message and sets the compatibility level to the default for the current version. The valid values correspond to the compatibility levels described below (see Shell Compatibility Mode). For example, 4.2 and 42 are valid values that correspond to the compat42 shopt option and set the compatibility level to 42. The current version is also a valid value.
BASH_ENV

    If this variable is set when Bash is invoked to execute a shell script, its value is expanded and used as the name of a startup file to read before executing the script. See Bash Startup Files.
BASH_EXECUTION_STRING

    The command argument to the -c invocation option.
BASH_LINENO

    An array variable whose members are the line numbers in source files where each corresponding member of FUNCNAME was invoked. ${BASH_LINENO[$i]} is the line number in the source file (${BASH_SOURCE[$i+1]}) where ${FUNCNAME[$i]} was called (or ${BASH_LINENO[$i-1]} if referenced within another shell function). Use LINENO to obtain the current line number.
BASH_LOADABLES_PATH

    A colon-separated list of directories in which the shell looks for dynamically loadable builtins specified by the enable command.
BASH_REMATCH

    An array variable whose members are assigned by the ‘=~’ binary operator to the [[ conditional command (see Conditional Constructs). The element with index 0 is the portion of the string matching the entire regular expression. The element with index n is the portion of the string matching the nth parenthesized subexpression.
BASH_SOURCE

    An array variable whose members are the source filenames where the corresponding shell function names in the FUNCNAME array variable are defined. The shell function ${FUNCNAME[$i]} is defined in the file ${BASH_SOURCE[$i]} and called from ${BASH_SOURCE[$i+1]}
BASH_SUBSHELL

    Incremented by one within each subshell or subshell environment when the shell begins executing in that environment. The initial value is 0. If BASH_SUBSHELL is unset, it loses its special properties, even if it is subsequently reset.
BASH_VERSINFO

    A readonly array variable (see Arrays) whose members hold version information for this instance of Bash. The values assigned to the array members are as follows:

    BASH_VERSINFO[0]

        The major version number (the release).
    BASH_VERSINFO[1]

        The minor version number (the version).
    BASH_VERSINFO[2]

        The patch level.
    BASH_VERSINFO[3]

        The build version.
    BASH_VERSINFO[4]

        The release status (e.g., beta1).
    BASH_VERSINFO[5]

        The value of MACHTYPE. 

BASH_VERSION

    The version number of the current instance of Bash.
BASH_XTRACEFD

    If set to an integer corresponding to a valid file descriptor, Bash will write the trace output generated when ‘set -x’ is enabled to that file descriptor. This allows tracing output to be separated from diagnostic and error messages. The file descriptor is closed when BASH_XTRACEFD is unset or assigned a new value. Unsetting BASH_XTRACEFD or assigning it the empty string causes the trace output to be sent to the standard error. Note that setting BASH_XTRACEFD to 2 (the standard error file descriptor) and then unsetting it will result in the standard error being closed.
CHILD_MAX

    Set the number of exited child status values for the shell to remember. Bash will not allow this value to be decreased below a POSIX-mandated minimum, and there is a maximum value (currently 8192) that this may not exceed. The minimum value is system-dependent.
COLUMNS

    Used by the select command to determine the terminal width when printing selection lists. Automatically set if the checkwinsize option is enabled (see The Shopt Builtin), or in an interactive shell upon receipt of a SIGWINCH.
COMP_CWORD

    An index into ${COMP_WORDS} of the word containing the current cursor position. This variable is available only in shell functions invoked by the programmable completion facilities (see Programmable Completion).
COMP_LINE

    The current command line. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).
COMP_POINT

    The index of the current cursor position relative to the beginning of the current command. If the current cursor position is at the end of the current command, the value of this variable is equal to ${#COMP_LINE}. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).
COMP_TYPE

    Set to an integer value corresponding to the type of completion attempted that caused a completion function to be called: TAB, for normal completion, ‘?’, for listing completions after successive tabs, ‘!’, for listing alternatives on partial word completion, ‘@’, to list completions if the word is not unmodified, or ‘%’, for menu completion. This variable is available only in shell functions and external commands invoked by the programmable completion facilities (see Programmable Completion).
COMP_KEY

    The key (or final key of a key sequence) used to invoke the current completion function.
COMP_WORDBREAKS

    The set of characters that the Readline library treats as word separators when performing word completion. If COMP_WORDBREAKS is unset, it loses its special properties, even if it is subsequently reset.
COMP_WORDS

    An array variable consisting of the individual words in the current command line. The line is split into words as Readline would split it, using COMP_WORDBREAKS as described above. This variable is available only in shell functions invoked by the programmable completion facilities (see Programmable Completion).
COMPREPLY

    An array variable from which Bash reads the possible completions generated by a shell function invoked by the programmable completion facility (see Programmable Completion). Each array element contains one possible completion.
COPROC

    An array variable created to hold the file descriptors for output from and input to an unnamed coprocess (see Coprocesses).
DIRSTACK

    An array variable containing the current contents of the directory stack. Directories appear in the stack in the order they are displayed by the dirs builtin. Assigning to members of this array variable may be used to modify directories already in the stack, but the pushd and popd builtins must be used to add and remove directories. Assignment to this variable will not change the current directory. If DIRSTACK is unset, it loses its special properties, even if it is subsequently reset.
EMACS

    If Bash finds this variable in the environment when the shell starts with value ‘t’, it assumes that the shell is running in an Emacs shell buffer and disables line editing.
ENV

    Expanded and executed similarlty to BASH_ENV (see Bash Startup Files) when an interactive shell is invoked in POSIX Mode (see Bash POSIX Mode).
EPOCHREALTIME

    Each time this parameter is referenced, it expands to the number of seconds since the Unix Epoch as a floating point value with micro-second granularity (see the documentation for the C library function time for the definition of Epoch). Assignments to EPOCHREALTIME are ignored. If EPOCHREALTIME is unset, it loses its special properties, even if it is subsequently reset.
EPOCHSECONDS

    Each time this parameter is referenced, it expands to the number of seconds since the Unix Epoch (see the documentation for the C library function time for the definition of Epoch). Assignments to EPOCHSECONDS are ignored. If EPOCHSECONDS is unset, it loses its special properties, even if it is subsequently reset.
EUID

    The numeric effective user id of the current user. This variable is readonly.
EXECIGNORE

    A colon-separated list of shell patterns (see Pattern Matching) defining the list of filenames to be ignored by command search using PATH. Files whose full pathnames match one of these patterns are not considered executable files for the purposes of completion and command execution via PATH lookup. This does not affect the behavior of the [, test, and [[ commands. Full pathnames in the command hash table are not subject to EXECIGNORE. Use this variable to ignore shared library files that have the executable bit set, but are not executable files. The pattern matching honors the setting of the extglob shell option.
FCEDIT

    The editor used as a default by the -e option to the fc builtin command.
FIGNORE

    A colon-separated list of suffixes to ignore when performing filename completion. A filename whose suffix matches one of the entries in FIGNORE is excluded from the list of matched filenames. A sample value is ‘.o:~’
FUNCNAME

    An array variable containing the names of all shell functions currently in the execution call stack. The element with index 0 is the name of any currently-executing shell function. The bottom-most element (the one with the highest index) is "main". This variable exists only when a shell function is executing. Assignments to FUNCNAME have no effect. If FUNCNAME is unset, it loses its special properties, even if it is subsequently reset.

    This variable can be used with BASH_LINENO and BASH_SOURCE. Each element of FUNCNAME has corresponding elements in BASH_LINENO and BASH_SOURCE to describe the call stack. For instance, ${FUNCNAME[$i]} was called from the file ${BASH_SOURCE[$i+1]} at line number ${BASH_LINENO[$i]}. The caller builtin displays the current call stack using this information.
FUNCNEST

    If set to a numeric value greater than 0, defines a maximum function nesting level. Function invocations that exceed this nesting level will cause the current command to abort.
GLOBIGNORE

    A colon-separated list of patterns defining the set of file names to be ignored by filename expansion. If a file name matched by a filename expansion pattern also matches one of the patterns in GLOBIGNORE, it is removed from the list of matches. The pattern matching honors the setting of the extglob shell option.
GROUPS

    An array variable containing the list of groups of which the current user is a member. Assignments to GROUPS have no effect. If GROUPS is unset, it loses its special properties, even if it is subsequently reset.
histchars

    Up to three characters which control history expansion, quick substitution, and tokenization (see History Interaction). The first character is the history expansion character, that is, the character which signifies the start of a history expansion, normally ‘!’. The second character is the character which signifies ‘quick substitution’ when seen as the first character on a line, normally ‘^’. The optional third character is the character which indicates that the remainder of the line is a comment when found as the first character of a word, usually ‘#’. The history comment character causes history substitution to be skipped for the remaining words on the line. It does not necessarily cause the shell parser to treat the rest of the line as a comment.
HISTCMD

    The history number, or index in the history list, of the current command. Assignments to HISTCMD are ignored. If HISTCMD is unset, it loses its special properties, even if it is subsequently reset.
HISTCONTROL

    A colon-separated list of values controlling how commands are saved on the history list. If the list of values includes ‘ignorespace’, lines which begin with a space character are not saved in the history list. A value of ‘ignoredups’ causes lines which match the previous history entry to not be saved. A value of ‘ignoreboth’ is shorthand for ‘ignorespace’ and ‘ignoredups’. A value of ‘erasedups’ causes all previous lines matching the current line to be removed from the history list before that line is saved. Any value not in the above list is ignored. If HISTCONTROL is unset, or does not include a valid value, all lines read by the shell parser are saved on the history list, subject to the value of HISTIGNORE. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTCONTROL.
HISTFILE

    The name of the file to which the command history is saved. The default value is ~/.bash_history.
HISTFILESIZE

    The maximum number of lines contained in the history file. When this variable is assigned a value, the history file is truncated, if necessary, to contain no more than that number of lines by removing the oldest entries. The history file is also truncated to this size after writing it when a shell exits. If the value is 0, the history file is truncated to zero size. Non-numeric values and numeric values less than zero inhibit truncation. The shell sets the default value to the value of HISTSIZE after reading any startup files.
HISTIGNORE

    A colon-separated list of patterns used to decide which command lines should be saved on the history list. Each pattern is anchored at the beginning of the line and must match the complete line (no implicit ‘*’ is appended). Each pattern is tested against the line after the checks specified by HISTCONTROL are applied. In addition to the normal shell pattern matching characters, ‘&’ matches the previous history line. ‘&’ may be escaped using a backslash; the backslash is removed before attempting a match. The second and subsequent lines of a multi-line compound command are not tested, and are added to the history regardless of the value of HISTIGNORE. The pattern matching honors the setting of the extglob shell option.

    HISTIGNORE subsumes the function of HISTCONTROL. A pattern of ‘&’ is identical to ignoredups, and a pattern of ‘[ ]*’ is identical to ignorespace. Combining these two patterns, separating them with a colon, provides the functionality of ignoreboth.
HISTSIZE

    The maximum number of commands to remember on the history list. If the value is 0, commands are not saved in the history list. Numeric values less than zero result in every command being saved on the history list (there is no limit). The shell sets the default value to 500 after reading any startup files.
HISTTIMEFORMAT

    If this variable is set and not null, its value is used as a format string for strftime to print the time stamp associated with each history entry displayed by the history builtin. If this variable is set, time stamps are written to the history file so they may be preserved across shell sessions. This uses the history comment character to distinguish timestamps from other history lines.
HOSTFILE

    Contains the name of a file in the same format as /etc/hosts that should be read when the shell needs to complete a hostname. The list of possible hostname completions may be changed while the shell is running; the next time hostname completion is attempted after the value is changed, Bash adds the contents of the new file to the existing list. If HOSTFILE is set, but has no value, or does not name a readable file, Bash attempts to read /etc/hosts to obtain the list of possible hostname completions. When HOSTFILE is unset, the hostname list is cleared.
HOSTNAME

    The name of the current host.
HOSTTYPE

    A string describing the machine Bash is running on.
IGNOREEOF

    Controls the action of the shell on receipt of an EOF character as the sole input. If set, the value denotes the number of consecutive EOF characters that can be read as the first character on an input line before the shell will exit. If the variable exists but does not have a numeric value, or has no value, then the default is 10. If the variable does not exist, then EOF signifies the end of input to the shell. This is only in effect for interactive shells.
INPUTRC

    The name of the Readline initialization file, overriding the default of ~/.inputrc.
INSIDE_EMACS

    If Bash finds this variable in the environment when the shell starts, it assumes that the shell is running in an Emacs shell buffer and may disable line editing depending on the value of TERM.
LANG

    Used to determine the locale category for any category not specifically selected with a variable starting with LC_.
LC_ALL

    This variable overrides the value of LANG and any other LC_ variable specifying a locale category.
LC_COLLATE

    This variable determines the collation order used when sorting the results of filename expansion, and determines the behavior of range expressions, equivalence classes, and collating sequences within filename expansion and pattern matching (see Filename Expansion).
LC_CTYPE

    This variable determines the interpretation of characters and the behavior of character classes within filename expansion and pattern matching (see Filename Expansion).
LC_MESSAGES

    This variable determines the locale used to translate double-quoted strings preceded by a ‘$’ (see Locale Translation).
LC_NUMERIC

    This variable determines the locale category used for number formatting.
LC_TIME

    This variable determines the locale category used for data and time formatting.
LINENO

    The line number in the script or shell function currently executing. If LINENO is unset, it loses its special properties, even if it is subsequently reset.
LINES

    Used by the select command to determine the column length for printing selection lists. Automatically set if the checkwinsize option is enabled (see The Shopt Builtin), or in an interactive shell upon receipt of a SIGWINCH.
MACHTYPE

    A string that fully describes the system type on which Bash is executing, in the standard GNU cpu-company-system format.
MAILCHECK

    How often (in seconds) that the shell should check for mail in the files specified in the MAILPATH or MAIL variables. The default is 60 seconds. When it is time to check for mail, the shell does so before displaying the primary prompt. If this variable is unset, or set to a value that is not a number greater than or equal to zero, the shell disables mail checking.
MAPFILE

    An array variable created to hold the text read by the mapfile builtin when no variable name is supplied.
OLDPWD

    The previous working directory as set by the cd builtin.
OPTERR

    If set to the value 1, Bash displays error messages generated by the getopts builtin command.
OSTYPE

    A string describing the operating system Bash is running on.
PIPESTATUS

    An array variable (see Arrays) containing a list of exit status values from the processes in the most-recently-executed foreground pipeline (which may contain only a single command).
POSIXLY_CORRECT

    If this variable is in the environment when Bash starts, the shell enters POSIX mode (see Bash POSIX Mode) before reading the startup files, as if the --posix invocation option had been supplied. If it is set while the shell is running, Bash enables POSIX mode, as if the command

    set -o posix

    had been executed. When the shell enters POSIX mode, it sets this variable if it was not already set.
PPID

    The process ID of the shell’s parent process. This variable is readonly.
PROMPT_COMMAND

    If this variable is set, and is an array, the value of each set element is interpreted as a command to execute before printing the primary prompt ($PS1). If this is set but not an array variable, its value is used as a command to execute instead.
PROMPT_DIRTRIM

    If set to a number greater than zero, the value is used as the number of trailing directory components to retain when expanding the \w and \W prompt string escapes (see Controlling the Prompt). Characters removed are replaced with an ellipsis.
PS0

    The value of this parameter is expanded like PS1 and displayed by interactive shells after reading a command and before the command is executed.
PS3

    The value of this variable is used as the prompt for the select command. If this variable is not set, the select command prompts with ‘#? ’
PS4

    The value of this parameter is expanded like PS1 and the expanded value is the prompt printed before the command line is echoed when the -x option is set (see The Set Builtin). The first character of the expanded value is replicated multiple times, as necessary, to indicate multiple levels of indirection. The default is ‘+ ’.
PWD

    The current working directory as set by the cd builtin.
RANDOM

    Each time this parameter is referenced, it expands to a random integer between 0 and 32767. Assigning a value to this variable seeds the random number generator. If RANDOM is unset, it loses its special properties, even if it is subsequently reset.
READLINE_LINE

    The contents of the Readline line buffer, for use with ‘bind -x’ (see Bash Builtins).
READLINE_MARK

    The position of the mark (saved insertion point) in the Readline line buffer, for use with ‘bind -x’ (see Bash Builtins). The characters between the insertion point and the mark are often called the region.
READLINE_POINT

    The position of the insertion point in the Readline line buffer, for use with ‘bind -x’ (see Bash Builtins).
REPLY

    The default variable for the read builtin.
SECONDS

    This variable expands to the number of seconds since the shell was started. Assignment to this variable resets the count to the value assigned, and the expanded value becomes the value assigned plus the number of seconds since the assignment. The number of seconds at shell invocation and the current time is always determined by querying the system clock. If SECONDS is unset, it loses its special properties, even if it is subsequently reset.
SHELL

    This environment variable expands to the full pathname to the shell. If it is not set when the shell starts, Bash assigns to it the full pathname of the current user’s login shell.
SHELLOPTS

    A colon-separated list of enabled shell options. Each word in the list is a valid argument for the -o option to the set builtin command (see The Set Builtin). The options appearing in SHELLOPTS are those reported as ‘on’ by ‘set -o’. If this variable is in the environment when Bash starts up, each shell option in the list will be enabled before reading any startup files. This variable is readonly.
SHLVL

    Incremented by one each time a new instance of Bash is started. This is intended to be a count of how deeply your Bash shells are nested.
SRANDOM

    This variable expands to a 32-bit pseudo-random number each time it is referenced. The random number generator is not linear on systems that support /dev/urandom or arc4random, so each returned number has no relationship to the numbers preceding it. The random number generator cannot be seeded, so assignments to this variable have no effect. If SRANDOM is unset, it loses its special properties, even if it is subsequently reset.
TIMEFORMAT

    The value of this parameter is used as a format string specifying how the timing information for pipelines prefixed with the time reserved word should be displayed. The ‘%’ character introduces an escape sequence that is expanded to a time value or other information. The escape sequences and their meanings are as follows; the braces denote optional portions.

    %%

        A literal ‘%’.
    %[p][l]R

        The elapsed time in seconds.
    %[p][l]U

        The number of CPU seconds spent in user mode.
    %[p][l]S

        The number of CPU seconds spent in system mode.
    %P

        The CPU percentage, computed as (%U + %S) / %R. 

    The optional p is a digit specifying the precision, the number of fractional digits after a decimal point. A value of 0 causes no decimal point or fraction to be output. At most three places after the decimal point may be specified; values of p greater than 3 are changed to 3. If p is not specified, the value 3 is used.

    The optional l specifies a longer format, including minutes, of the form MMmSS.FFs. The value of p determines whether or not the fraction is included.

    If this variable is not set, Bash acts as if it had the value

    $'\nreal\t%3lR\nuser\t%3lU\nsys\t%3lS'

    If the value is null, no timing information is displayed. A trailing newline is added when the format string is displayed.
TMOUT

    If set to a value greater than zero, TMOUT is treated as the default timeout for the read builtin (see Bash Builtins). The select command (see Conditional Constructs) terminates if input does not arrive after TMOUT seconds when input is coming from a terminal.

    In an interactive shell, the value is interpreted as the number of seconds to wait for a line of input after issuing the primary prompt. Bash terminates after waiting for that number of seconds if a complete line of input does not arrive.
TMPDIR

    If set, Bash uses its value as the name of a directory in which Bash creates temporary files for the shell’s use.
UID

    The numeric real user id of the current user. This variable is readonly.

Next: Job Control, Previous: Shell Variables, Up: Top   [Contents][Index]
6 Bash Features

This chapter describes features unique to Bash.
• Invoking Bash	  	Command line options that you can give to Bash.
• Bash Startup Files	  	When and how Bash executes scripts.
• Interactive Shells	  	What an interactive shell is.
• Bash Conditional Expressions	  	Primitives used in composing expressions for the test builtin.
• Shell Arithmetic	  	Arithmetic on shell variables.
• Aliases	  	Substituting one command for another.
• Arrays	  	Array Variables.
• The Directory Stack	  	History of visited directories.
• Controlling the Prompt	  	Customizing the various prompt strings.
• The Restricted Shell	  	A more controlled mode of shell execution.
• Bash POSIX Mode	  	Making Bash behave more closely to what the POSIX standard specifies.
• Shell Compatibility Mode	  	How Bash supports behavior that was present in earlier versions and has changed.

Next: Bash Startup Files, Up: Bash Features   [Contents][Index]
6.1 Invoking Bash

bash [long-opt] [-ir] [-abefhkmnptuvxdBCDHP] [-o option]
    [-O shopt_option] [argument …]
bash [long-opt] [-abefhkmnptuvxdBCDHP] [-o option]
    [-O shopt_option] -c string [argument …]
bash [long-opt] -s [-abefhkmnptuvxdBCDHP] [-o option]
    [-O shopt_option] [argument …]

All of the single-character options used with the set builtin (see The Set Builtin) can be used as options when the shell is invoked. In addition, there are several multi-character options that you can use. These options must appear on the command line before the single-character options to be recognized.

--debugger

    Arrange for the debugger profile to be executed before the shell starts. Turns on extended debugging mode (see The Shopt Builtin for a description of the extdebug option to the shopt builtin).
--dump-po-strings

    A list of all double-quoted strings preceded by ‘$’ is printed on the standard output in the GNU gettext PO (portable object) file format. Equivalent to -D except for the output format.
--dump-strings

    Equivalent to -D.
--help

    Display a usage message on standard output and exit successfully.
--init-file filename
--rcfile filename

    Execute commands from filename (instead of ~/.bashrc) in an interactive shell.
--login

    Equivalent to -l.
--noediting

    Do not use the GNU Readline library (see Command Line Editing) to read command lines when the shell is interactive.
--noprofile

    Don’t load the system-wide startup file /etc/profile or any of the personal initialization files ~/.bash_profile, ~/.bash_login, or ~/.profile when Bash is invoked as a login shell.
--norc

    Don’t read the ~/.bashrc initialization file in an interactive shell. This is on by default if the shell is invoked as sh.
--posix

    Change the behavior of Bash where the default operation differs from the POSIX standard to match the standard. This is intended to make Bash behave as a strict superset of that standard. See Bash POSIX Mode, for a description of the Bash POSIX mode.
--restricted

    Make the shell a restricted shell (see The Restricted Shell).
--verbose

    Equivalent to -v. Print shell input lines as they’re read.
--version

    Show version information for this instance of Bash on the standard output and exit successfully. 

There are several single-character options that may be supplied at invocation which are not available with the set builtin.

-c

    Read and execute commands from the first non-option argument command_string, then exit. If there are arguments after the command_string, the first argument is assigned to $0 and any remaining arguments are assigned to the positional parameters. The assignment to $0 sets the name of the shell, which is used in warning and error messages.
-i

    Force the shell to run interactively. Interactive shells are described in Interactive Shells.
-l

    Make this shell act as if it had been directly invoked by login. When the shell is interactive, this is equivalent to starting a login shell with ‘exec -l bash’. When the shell is not interactive, the login shell startup files will be executed. ‘exec bash -l’ or ‘exec bash --login’ will replace the current shell with a Bash login shell. See Bash Startup Files, for a description of the special behavior of a login shell.
-r

    Make the shell a restricted shell (see The Restricted Shell).
-s

    If this option is present, or if no arguments remain after option processing, then commands are read from the standard input. This option allows the positional parameters to be set when invoking an interactive shell or when reading input through a pipe.
-D

    A list of all double-quoted strings preceded by ‘$’ is printed on the standard output. These are the strings that are subject to language translation when the current locale is not C or POSIX (see Locale Translation). This implies the -n option; no commands will be executed.
[-+]O [shopt_option]

    shopt_option is one of the shell options accepted by the shopt builtin (see The Shopt Builtin). If shopt_option is present, -O sets the value of that option; +O unsets it. If shopt_option is not supplied, the names and values of the shell options accepted by shopt are printed on the standard output. If the invocation option is +O, the output is displayed in a format that may be reused as input.
--

    A -- signals the end of options and disables further option processing. Any arguments after the -- are treated as filenames and arguments. 

A login shell is one whose first character of argument zero is ‘-’, or one invoked with the --login option.

An interactive shell is one started without non-option arguments, unless -s is specified, without specifying the -c option, and whose input and output are both connected to terminals (as determined by isatty(3)), or one started with the -i option. See Interactive Shells, for more information.

If arguments remain after option processing, and neither the -c nor the -s option has been supplied, the first argument is assumed to be the name of a file containing shell commands (see Shell Scripts). When Bash is invoked in this fashion, $0 is set to the name of the file, and the positional parameters are set to the remaining arguments. Bash reads and executes commands from this file, then exits. Bash’s exit status is the exit status of the last command executed in the script. If no commands are executed, the exit status is 0.

Next: Interactive Shells, Previous: Invoking Bash, Up: Bash Features   [Contents][Index]
6.2 Bash Startup Files

This section describes how Bash executes its startup files. If any of the files exist but cannot be read, Bash reports an error. Tildes are expanded in filenames as described above under Tilde Expansion (see Tilde Expansion).

Interactive shells are described in Interactive Shells.
Invoked as an interactive login shell, or with --login

When Bash is invoked as an interactive login shell, or as a non-interactive shell with the --login option, it first reads and executes commands from the file /etc/profile, if that file exists. After reading that file, it looks for ~/.bash_profile, ~/.bash_login, and ~/.profile, in that order, and reads and executes commands from the first one that exists and is readable. The --noprofile option may be used when the shell is started to inhibit this behavior.

When an interactive login shell exits, or a non-interactive login shell executes the exit builtin command, Bash reads and executes commands from the file ~/.bash_logout, if it exists.
Invoked as an interactive non-login shell

When an interactive shell that is not a login shell is started, Bash reads and executes commands from ~/.bashrc, if that file exists. This may be inhibited by using the --norc option. The --rcfile file option will force Bash to read and execute commands from file instead of ~/.bashrc.

So, typically, your ~/.bash_profile contains the line

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

after (or before) any login-specific initializations.
Invoked non-interactively

When Bash is started non-interactively, to run a shell script, for example, it looks for the variable BASH_ENV in the environment, expands its value if it appears there, and uses the expanded value as the name of a file to read and execute. Bash behaves as if the following command were executed:

if [ -n "$BASH_ENV" ]; then . "$BASH_ENV"; fi

but the value of the PATH variable is not used to search for the filename.

As noted above, if a non-interactive shell is invoked with the --login option, Bash attempts to read and execute commands from the login shell startup files.
Invoked with name sh

If Bash is invoked with the name sh, it tries to mimic the startup behavior of historical versions of sh as closely as possible, while conforming to the POSIX standard as well.

When invoked as an interactive login shell, or as a non-interactive shell with the --login option, it first attempts to read and execute commands from /etc/profile and ~/.profile, in that order. The --noprofile option may be used to inhibit this behavior. When invoked as an interactive shell with the name sh, Bash looks for the variable ENV, expands its value if it is defined, and uses the expanded value as the name of a file to read and execute. Since a shell invoked as sh does not attempt to read and execute commands from any other startup files, the --rcfile option has no effect. A non-interactive shell invoked with the name sh does not attempt to read any other startup files.

When invoked as sh, Bash enters POSIX mode after the startup files are read.
Invoked in POSIX mode

When Bash is started in POSIX mode, as with the --posix command line option, it follows the POSIX standard for startup files. In this mode, interactive shells expand the ENV variable and commands are read and executed from the file whose name is the expanded value. No other startup files are read.
Invoked by remote shell daemon

Bash attempts to determine when it is being run with its standard input connected to a network connection, as when executed by the remote shell daemon, usually rshd, or the secure shell daemon sshd. If Bash determines it is being run in this fashion, it reads and executes commands from ~/.bashrc, if that file exists and is readable. It will not do this if invoked as sh. The --norc option may be used to inhibit this behavior, and the --rcfile option may be used to force another file to be read, but neither rshd nor sshd generally invoke the shell with those options or allow them to be specified.
Invoked with unequal effective and real UID/GIDs

If Bash is started with the effective user (group) id not equal to the real user (group) id, and the -p option is not supplied, no startup files are read, shell functions are not inherited from the environment, the SHELLOPTS, BASHOPTS, CDPATH, and GLOBIGNORE variables, if they appear in the environment, are ignored, and the effective user id is set to the real user id. If the -p option is supplied at invocation, the startup behavior is the same, but the effective user id is not reset.

Next: Bash Conditional Expressions, Previous: Bash Startup Files, Up: Bash Features   [Contents][Index]
6.3 Interactive Shells
• What is an Interactive Shell?	  	What determines whether a shell is Interactive.
• Is this Shell Interactive?	  	How to tell if a shell is interactive.
• Interactive Shell Behavior	  	What changes in a interactive shell?

Next: Is this Shell Interactive?, Up: Interactive Shells   [Contents][Index]
6.3.1 What is an Interactive Shell?

An interactive shell is one started without non-option arguments, unless -s is specified, without specifying the -c option, and whose input and error output are both connected to terminals (as determined by isatty(3)), or one started with the -i option.

An interactive shell generally reads from and writes to a user’s terminal.

The -s invocation option may be used to set the positional parameters when an interactive shell is started.

Next: Interactive Shell Behavior, Previous: What is an Interactive Shell?, Up: Interactive Shells   [Contents][Index]
6.3.2 Is this Shell Interactive?

To determine within a startup script whether or not Bash is running interactively, test the value of the ‘-’ special parameter. It contains i when the shell is interactive. For example:

case "$-" in
*i*)	echo This shell is interactive ;;
*)	echo This shell is not interactive ;;
esac

Alternatively, startup scripts may examine the variable PS1; it is unset in non-interactive shells, and set in interactive shells. Thus:

if [ -z "$PS1" ]; then
        echo This shell is not interactive
else
        echo This shell is interactive
fi

Previous: Is this Shell Interactive?, Up: Interactive Shells   [Contents][Index]
6.3.3 Interactive Shell Behavior

When the shell is running interactively, it changes its behavior in several ways.

    Startup files are read and executed as described in Bash Startup Files.
    Job Control (see Job Control) is enabled by default. When job control is in effect, Bash ignores the keyboard-generated job control signals SIGTTIN, SIGTTOU, and SIGTSTP.
    Bash expands and displays PS1 before reading the first line of a command, and expands and displays PS2 before reading the second and subsequent lines of a multi-line command. Bash expands and displays PS0 after it reads a command but before executing it. See Controlling the Prompt, for a complete list of prompt string escape sequences.
    Bash executes the values of the set elements of the PROMPT_COMMAND array variable as commands before printing the primary prompt, $PS1 (see Bash Variables).
    Readline (see Command Line Editing) is used to read commands from the user’s terminal.
    Bash inspects the value of the ignoreeof option to set -o instead of exiting immediately when it receives an EOF on its standard input when reading a command (see The Set Builtin).
    Command history (see Bash History Facilities) and history expansion (see History Interaction) are enabled by default. Bash will save the command history to the file named by $HISTFILE when a shell with history enabled exits.
    Alias expansion (see Aliases) is performed by default.
    In the absence of any traps, Bash ignores SIGTERM (see Signals).
    In the absence of any traps, SIGINT is caught and handled (see Signals). SIGINT will interrupt some shell builtins.
    An interactive login shell sends a SIGHUP to all jobs on exit if the huponexit shell option has been enabled (see Signals).
    The -n invocation option is ignored, and ‘set -n’ has no effect (see The Set Builtin).
    Bash will check for mail periodically, depending on the values of the MAIL, MAILPATH, and MAILCHECK shell variables (see Bash Variables).
    Expansion errors due to references to unbound shell variables after ‘set -u’ has been enabled will not cause the shell to exit (see The Set Builtin).
    The shell will not exit on expansion errors caused by var being unset or null in ${var:?word} expansions (see Shell Parameter Expansion).
    Redirection errors encountered by shell builtins will not cause the shell to exit.
    When running in POSIX mode, a special builtin returning an error status will not cause the shell to exit (see Bash POSIX Mode).
    A failed exec will not cause the shell to exit (see Bourne Shell Builtins).
    Parser syntax errors will not cause the shell to exit.
    Simple spelling correction for directory arguments to the cd builtin is enabled by default (see the description of the cdspell option to the shopt builtin in The Shopt Builtin).
    The shell will check the value of the TMOUT variable and exit if a command is not read within the specified number of seconds after printing $PS1 (see Bash Variables). 

Next: Shell Arithmetic, Previous: Interactive Shells, Up: Bash Features   [Contents][Index]
6.4 Bash Conditional Expressions

Conditional expressions are used by the [[ compound command and the test and [ builtin commands. The test and [ commands determine their behavior based on the number of arguments; see the descriptions of those commands for any other command-specific actions.

Expressions may be unary or binary, and are formed from the following primaries. Unary expressions are often used to examine the status of a file. There are string operators and numeric comparison operators as well. Bash handles several filenames specially when they are used in expressions. If the operating system on which Bash is running provides these special files, Bash will use them; otherwise it will emulate them internally with this behavior: If the file argument to one of the primaries is of the form /dev/fd/N, then file descriptor N is checked. If the file argument to one of the primaries is one of /dev/stdin, /dev/stdout, or /dev/stderr, file descriptor 0, 1, or 2, respectively, is checked.

When used with [[, the ‘<’ and ‘>’ operators sort lexicographically using the current locale. The test command uses ASCII ordering.

Unless otherwise specified, primaries that operate on files follow symbolic links and operate on the target of the link, rather than the link itself.

-a file

    True if file exists.
-b file

    True if file exists and is a block special file.
-c file

    True if file exists and is a character special file.
-d file

    True if file exists and is a directory.
-e file

    True if file exists.
-f file

    True if file exists and is a regular file.
-g file

    True if file exists and its set-group-id bit is set.
-h file

    True if file exists and is a symbolic link.
-k file

    True if file exists and its "sticky" bit is set.
-p file

    True if file exists and is a named pipe (FIFO).
-r file

    True if file exists and is readable.
-s file

    True if file exists and has a size greater than zero.
-t fd

    True if file descriptor fd is open and refers to a terminal.
-u file

    True if file exists and its set-user-id bit is set.
-w file

    True if file exists and is writable.
-x file

    True if file exists and is executable.
-G file

    True if file exists and is owned by the effective group id.
-L file

    True if file exists and is a symbolic link.
-N file

    True if file exists and has been modified since it was last read.
-O file

    True if file exists and is owned by the effective user id.
-S file

    True if file exists and is a socket.
file1 -ef file2

    True if file1 and file2 refer to the same device and inode numbers.
file1 -nt file2

    True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not.
file1 -ot file2

    True if file1 is older than file2, or if file2 exists and file1 does not.
-o optname

    True if the shell option optname is enabled. The list of options appears in the description of the -o option to the set builtin (see The Set Builtin).
-v varname

    True if the shell variable varname is set (has been assigned a value).
-R varname

    True if the shell variable varname is set and is a name reference.
-z string

    True if the length of string is zero.
-n string
string

    True if the length of string is non-zero.
string1 == string2
string1 = string2

    True if the strings are equal. When used with the [[ command, this performs pattern matching as described above (see Conditional Constructs).

    ‘=’ should be used with the test command for POSIX conformance.
string1 != string2

    True if the strings are not equal.
string1 < string2

    True if string1 sorts before string2 lexicographically.
string1 > string2

    True if string1 sorts after string2 lexicographically.
arg1 OP arg2

    OP is one of ‘-eq’, ‘-ne’, ‘-lt’, ‘-le’, ‘-gt’, or ‘-ge’. These arithmetic binary operators return true if arg1 is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to arg2, respectively. Arg1 and arg2 may be positive or negative integers. When used with the [[ command, Arg1 and Arg2 are evaluated as arithmetic expressions (see Shell Arithmetic). 

Next: Aliases, Previous: Bash Conditional Expressions, Up: Bash Features   [Contents][Index]
6.5 Shell Arithmetic

The shell allows arithmetic expressions to be evaluated, as one of the shell expansions or by using the (( compound command, the let builtin, or the -i option to the declare builtin.

Evaluation is done in fixed-width integers with no check for overflow, though division by 0 is trapped and flagged as an error. The operators and their precedence, associativity, and values are the same as in the C language. The following list of operators is grouped into levels of equal-precedence operators. The levels are listed in order of decreasing precedence.

id++ id--

    variable post-increment and post-decrement
++id --id

    variable pre-increment and pre-decrement
- +

    unary minus and plus
! ~

    logical and bitwise negation
**

    exponentiation
* / %

    multiplication, division, remainder
+ -

    addition, subtraction
<< >>

    left and right bitwise shifts
<= >= < >

    comparison
== !=

    equality and inequality
&

    bitwise AND
^

    bitwise exclusive OR
|

    bitwise OR
&&

    logical AND
||

    logical OR
expr ? expr : expr

    conditional operator
= *= /= %= += -= <<= >>= &= ^= |=

    assignment
expr1 , expr2

    comma 

Shell variables are allowed as operands; parameter expansion is performed before the expression is evaluated. Within an expression, shell variables may also be referenced by name without using the parameter expansion syntax. A shell variable that is null or unset evaluates to 0 when referenced by name without using the parameter expansion syntax. The value of a variable is evaluated as an arithmetic expression when it is referenced, or when a variable which has been given the integer attribute using ‘declare -i’ is assigned a value. A null value evaluates to 0. A shell variable need not have its integer attribute turned on to be used in an expression.

Integer constants follow the C language definition, without suffixes or character constants. Constants with a leading 0 are interpreted as octal numbers. A leading ‘0x’ or ‘0X’ denotes hexadecimal. Otherwise, numbers take the form [base#]n, where the optional base is a decimal number between 2 and 64 representing the arithmetic base, and n is a number in that base. If base# is omitted, then base 10 is used. When specifying n, if a non-digit is required, the digits greater than 9 are represented by the lowercase letters, the uppercase letters, ‘@’, and ‘_’, in that order. If base is less than or equal to 36, lowercase and uppercase letters may be used interchangeably to represent numbers between 10 and 35.

Operators are evaluated in order of precedence. Sub-expressions in parentheses are evaluated first and may override the precedence rules above.

Next: Arrays, Previous: Shell Arithmetic, Up: Bash Features   [Contents][Index]
6.6 Aliases

Aliases allow a string to be substituted for a word when it is used as the first word of a simple command. The shell maintains a list of aliases that may be set and unset with the alias and unalias builtin commands.

The first word of each simple command, if unquoted, is checked to see if it has an alias. If so, that word is replaced by the text of the alias. The characters ‘/’, ‘$’, ‘`’, ‘=’ and any of the shell metacharacters or quoting characters listed above may not appear in an alias name. The replacement text may contain any valid shell input, including shell metacharacters. The first word of the replacement text is tested for aliases, but a word that is identical to an alias being expanded is not expanded a second time. This means that one may alias ls to "ls -F", for instance, and Bash does not try to recursively expand the replacement text. If the last character of the alias value is a blank, then the next command word following the alias is also checked for alias expansion.

Aliases are created and listed with the alias command, and removed with the unalias command.

There is no mechanism for using arguments in the replacement text, as in csh. If arguments are needed, a shell function should be used (see Shell Functions).

Aliases are not expanded when the shell is not interactive, unless the expand_aliases shell option is set using shopt (see The Shopt Builtin).

The rules concerning the definition and use of aliases are somewhat confusing. Bash always reads at least one complete line of input, and all lines that make up a compound command, before executing any of the commands on that line or the compound command. Aliases are expanded when a command is read, not when it is executed. Therefore, an alias definition appearing on the same line as another command does not take effect until the next line of input is read. The commands following the alias definition on that line are not affected by the new alias. This behavior is also an issue when functions are executed. Aliases are expanded when a function definition is read, not when the function is executed, because a function definition is itself a command. As a consequence, aliases defined in a function are not available until after that function is executed. To be safe, always put alias definitions on a separate line, and do not use alias in compound commands.

For almost every purpose, shell functions are preferred over aliases.

Next: The Directory Stack, Previous: Aliases, Up: Bash Features   [Contents][Index]
6.7 Arrays

Bash provides one-dimensional indexed and associative array variables. Any variable may be used as an indexed array; the declare builtin will explicitly declare an array. There is no maximum limit on the size of an array, nor any requirement that members be indexed or assigned contiguously. Indexed arrays are referenced using integers (including arithmetic expressions (see Shell Arithmetic)) and are zero-based; associative arrays use arbitrary strings. Unless otherwise noted, indexed array indices must be non-negative integers.

An indexed array is created automatically if any variable is assigned to using the syntax

name[subscript]=value

The subscript is treated as an arithmetic expression that must evaluate to a number. To explicitly declare an array, use

declare -a name

The syntax

declare -a name[subscript]

is also accepted; the subscript is ignored.

Associative arrays are created using

declare -A name

Attributes may be specified for an array variable using the declare and readonly builtins. Each attribute applies to all members of an array.

Arrays are assigned to using compound assignments of the form

name=(value1 value2 … )

where each value may be of the form [subscript]=string. Indexed array assignments do not require anything but string. When assigning to indexed arrays, if the optional subscript is supplied, that index is assigned to; otherwise the index of the element assigned is the last index assigned to by the statement plus one. Indexing starts at zero.

Each value in the list undergoes all the shell expansions described above (see Shell Expansions).

When assigning to an associative array, the words in a compound assignment may be either assignment statements, for which the subscript is required, or a list of words that is interpreted as a sequence of alternating keys and values: name=(key1 value1 key2 value2 … ). These are treated identically to name=( [key1]=value1 [key2]=value2 … ). The first word in the list determines how the remaining words are interpreted; all assignments in a list must be of the same type. When using key/value pairs, the keys may not be missing or empty; a final missing value is treated like the empty string.

This syntax is also accepted by the declare builtin. Individual array elements may be assigned to using the name[subscript]=value syntax introduced above.

When assigning to an indexed array, if name is subscripted by a negative number, that number is interpreted as relative to one greater than the maximum index of name, so negative indices count back from the end of the array, and an index of -1 references the last element.

Any element of an array may be referenced using ${name[subscript]}. The braces are required to avoid conflicts with the shell’s filename expansion operators. If the subscript is ‘@’ or ‘*’, the word expands to all members of the array name. These subscripts differ only when the word appears within double quotes. If the word is double-quoted, ${name[*]} expands to a single word with the value of each array member separated by the first character of the IFS variable, and ${name[@]} expands each element of name to a separate word. When there are no array members, ${name[@]} expands to nothing. If the double-quoted expansion occurs within a word, the expansion of the first parameter is joined with the beginning part of the original word, and the expansion of the last parameter is joined with the last part of the original word. This is analogous to the expansion of the special parameters ‘@’ and ‘*’. ${#name[subscript]} expands to the length of ${name[subscript]}. If subscript is ‘@’ or ‘*’, the expansion is the number of elements in the array. If the subscript used to reference an element of an indexed array evaluates to a number less than zero, it is interpreted as relative to one greater than the maximum index of the array, so negative indices count back from the end of the array, and an index of -1 refers to the last element.

Referencing an array variable without a subscript is equivalent to referencing with a subscript of 0. Any reference to a variable using a valid subscript is legal, and bash will create an array if necessary.

An array variable is considered set if a subscript has been assigned a value. The null string is a valid value.

It is possible to obtain the keys (indices) of an array as well as the values. ${!name[@]} and ${!name[*]} expand to the indices assigned in array variable name. The treatment when in double quotes is similar to the expansion of the special parameters ‘@’ and ‘*’ within double quotes.

The unset builtin is used to destroy arrays. unset name[subscript] destroys the array element at index subscript. Negative subscripts to indexed arrays are interpreted as described above. Unsetting the last element of an array variable does not unset the variable. unset name, where name is an array, removes the entire array. A subscript of ‘*’ or ‘@’ also removes the entire array.

When using a variable name with a subscript as an argument to a command, such as with unset, without using the word expansion syntax described above, the argument is subject to the shell’s filename expansion. If filename expansion is not desired, the argument should be quoted.

The declare, local, and readonly builtins each accept a -a option to specify an indexed array and a -A option to specify an associative array. If both options are supplied, -A takes precedence. The read builtin accepts a -a option to assign a list of words read from the standard input to an array, and can read values from the standard input into individual array elements. The set and declare builtins display array values in a way that allows them to be reused as input.

Next: Controlling the Prompt, Previous: Arrays, Up: Bash Features   [Contents][Index]
6.8 The Directory Stack
• Directory Stack Builtins	  	Bash builtin commands to manipulate the directory stack.

The directory stack is a list of recently-visited directories. The pushd builtin adds directories to the stack as it changes the current directory, and the popd builtin removes specified directories from the stack and changes the current directory to the directory removed. The dirs builtin displays the contents of the directory stack. The current directory is always the "top" of the directory stack.

The contents of the directory stack are also visible as the value of the DIRSTACK shell variable.

Up: The Directory Stack   [Contents][Index]
6.8.1 Directory Stack Builtins

dirs

    dirs [-clpv] [+N | -N]

    Display the list of currently remembered directories. Directories are added to the list with the pushd command; the popd command removes directories from the list. The current directory is always the first directory in the stack.

    -c

        Clears the directory stack by deleting all of the elements. 
    -l

        Produces a listing using full pathnames; the default listing format uses a tilde to denote the home directory. 
    -p

        Causes dirs to print the directory stack with one entry per line. 
    -v

        Causes dirs to print the directory stack with one entry per line, prefixing each entry with its index in the stack. 
    +N

        Displays the Nth directory (counting from the left of the list printed by dirs when invoked without options), starting with zero. 
    -N

        Displays the Nth directory (counting from the right of the list printed by dirs when invoked without options), starting with zero. 

popd

    popd [-n] [+N | -N]

    When no arguments are given, popd removes the top directory from the stack and performs a cd to the new top directory. The elements are numbered from 0 starting at the first directory listed with dirs; that is, popd is equivalent to popd +0.

    -n

        Suppresses the normal change of directory when removing directories from the stack, so that only the stack is manipulated. 
    +N

        Removes the Nth directory (counting from the left of the list printed by dirs), starting with zero. 
    -N

        Removes the Nth directory (counting from the right of the list printed by dirs), starting with zero. 

pushd

    pushd [-n] [+N | -N | dir]

    Save the current directory on the top of the directory stack and then cd to dir. With no arguments, pushd exchanges the top two directories and makes the new top the current directory.

    -n

        Suppresses the normal change of directory when rotating or adding directories to the stack, so that only the stack is manipulated. 
    +N

        Brings the Nth directory (counting from the left of the list printed by dirs, starting with zero) to the top of the list by rotating the stack. 
    -N

        Brings the Nth directory (counting from the right of the list printed by dirs, starting with zero) to the top of the list by rotating the stack. 
    dir

        Makes dir be the top of the stack, making it the new current directory as if it had been supplied as an argument to the cd builtin. 

Next: The Restricted Shell, Previous: The Directory Stack, Up: Bash Features   [Contents][Index]
6.9 Controlling the Prompt

Bash examines the value of the array variable PROMPT_COMMAND just before printing each primary prompt. If any elements in PROMPT_COMMAND are set and non-null, Bash executes each value, in numeric order, just as if it had been typed on the command line.

In addition, the following table describes the special characters which can appear in the prompt variables PS0, PS1, PS2, and PS4:

\a

    A bell character. 
\d

    The date, in "Weekday Month Date" format (e.g., "Tue May 26"). 
\D{format}

    The format is passed to strftime(3) and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required. 
\e

    An escape character. 
\h

    The hostname, up to the first ‘.’. 
\H

    The hostname. 
\j

    The number of jobs currently managed by the shell. 
\l

    The basename of the shell’s terminal device name. 
\n

    A newline. 
\r

    A carriage return. 
\s

    The name of the shell, the basename of $0 (the portion following the final slash). 
\t

    The time, in 24-hour HH:MM:SS format. 
\T

    The time, in 12-hour HH:MM:SS format. 
\@

    The time, in 12-hour am/pm format. 
\A

    The time, in 24-hour HH:MM format. 
\u

    The username of the current user. 
\v

    The version of Bash (e.g., 2.00) 
\V

    The release of Bash, version + patchlevel (e.g., 2.00.0) 
\w

    The current working directory, with $HOME abbreviated with a tilde (uses the $PROMPT_DIRTRIM variable). 
\W

    The basename of $PWD, with $HOME abbreviated with a tilde. 
\!

    The history number of this command. 
\#

    The command number of this command. 
\$

    If the effective uid is 0, #, otherwise $. 
\nnn

    The character whose ASCII code is the octal value nnn. 
\\

    A backslash. 
\[

    Begin a sequence of non-printing characters. This could be used to embed a terminal control sequence into the prompt. 
\]

    End a sequence of non-printing characters. 

The command number and the history number are usually different: the history number of a command is its position in the history list, which may include commands restored from the history file (see Bash History Facilities), while the command number is the position in the sequence of commands executed during the current shell session.

After the string is decoded, it is expanded via parameter expansion, command substitution, arithmetic expansion, and quote removal, subject to the value of the promptvars shell option (see The Shopt Builtin). This can have unwanted side effects if escaped portions of the string appear within command substitution or contain characters special to word expansion. 