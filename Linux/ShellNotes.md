# Linux Notes

## Tips, Tutorials and Documentation

[All Man topics Alphabetically](http://man7.org/linux/man-pages/dir_all_alphabetic.html)


https://tldp.org/LDP/abs/html/tabexpansion.html  Adding your own expansions. http://freshmeat.net/projects/bashcompletion


Links from [SS64](https://ss64.com/links/bash.html)

- [The Linix Documentation Project](http://tldp.org/) & [Linux man pages online](http://man7.org/linux/man-pages/index.html).
- [Explain Shell](https://explainshell.com/) - Enter an Ubuntu (bash) command-line to see the help text that matches each argument.
- [Shell Check](https://www.shellcheck.net/) - Find bugs in your shell scripts.
- [Shell Check](https://github.com/koalaman/shellcheck) - Static analysis tool - alerts for many common beginner's syntax errors.
- [Command Linefu](https://www.commandlinefu.com/commands/browse/sort-by-votes)- head to head voting on best one line bash tricks. Lots of gold.
- [Debian documentation](https://www.debian.org/doc/)
- [The Linux Cookbook](http://www.dsl.org/cookbook/cookbook_toc.html) - Tips and Techniques.
- [Google Shell Style guide](https://google.github.io/styleguide/shell.xml) - some short, sensible advice on coding style.
- [Hyperpolyglot](http://hyperpolyglot.org/shell) - Comparison of bash vs cmd vs PowerShell.
- [Linux Shell Scripting Tutorial](https://bash.cyberciti.biz/guide/Main_Page) - LSST
- [Unix/Linux/BSD Toolbox](http://cb.vu/unixtoolbox.xhtml) - Concise summary of commands.
- [Administration shell scripts](https://www.comp.eonworks.com/scripts/scripts.html) - Dawid Michalczyk.
- [grymoire.com](http://www.grymoire.com/Unix/) - home for UNIX wizards.
- [Introduction to text manipulation on UNIX-based systems](https://www.ibm.com/developerworks/aix/library/au-unixtext/index.html#25.Resources|outline)
- [LWN](https://lwn.net/) - Linux Weekly News
- [UbuntuForums](https://ubuntuforums.org/forumdisplay.php?f=100) - HowTo guides and forum
- [Introduction to the Ubuntu terminal](https://help.ubuntu.com/community/UsingTheTerminal)
- [UNIX FAQ](http://www.faqs.org/faqs/unix-faq/shell/)
- [TCP and UDP port numbers](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers) - wikipedia
- [JustLinux](http://forums.justlinux.com/) - Forum.
- [System76](https://system76.com/desktops) - OSHWA certified open source hardware
- [Source](https://www.youtube.com/channel/UCs6nmQViDpUw0nuIx9c_WvA)
- [DEBIAN DOC](https://www.debian.org/doc/manuals/debian-reference/ch01.en.html#_the_shell_prompt)
### Bash

- Greg Wooledge [Bash Guide](https://mywiki.wooledge.org/BashGuide) and [FAQ](https://mywiki.wooledge.org/BashFAQ)
- [Bash Guide for beginners](http://tldp.org/LDP/Bash-Beginners-Guide/html/index.html) - Machtelt Garrels.
- [GNU Bash Manual](https://www.gnu.org/manual/) - gzip archives.
- [Documentation and Examples](http://www.bashcookbook.com/bashinfo/) - bash cook book.
- [bash tips](https://www.ukuug.org/events/linux2003/papers/bash_tips/) - Configure the bash terminal.
- [Bash pitfalls](http://mywiki.wooledge.org/BashPitfalls) - GreyCat's wiki.

- [Bash Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#SEC_Contents)

[VIM](https://linuxize.com/post/vim-find-replace/)

[Bash Beginners Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html)


[The Advanced Bash Scripting Guide](https://tldp.org/LDP/abs/html/index.html)

Shell Fmt

[mvdan/sh: A shell parser, formatter, and interpreter with bash support; includes shfmt](https://github.com/mvdan/sh)

> ### Related projects
> 
> The following editor integrations wrap `shfmt`:
> 
>-    [format-shell](https://atom.io/packages/format-shell) - Atom plugin
>-    [intellij-shellcript](https://www.jetbrains.com/help/idea/shell-scripts.html) - Intellij Jetbrains `shell script` plugin
>-    [micro](https://micro-editor.github.io/) - Editor with a built-in plugin
>-    [shell-format](https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format) - VS Code plugin
>-    [shfmt.el](https://github.com/purcell/emacs-shfmt/) - Emacs package
>-    [Sublime-Pretty-Shell](https://github.com/aerobounce/Sublime-Pretty-Shell) - Sublime Text 3 plugin
>-    [vim-shfmt](https://github.com/z0mbix/vim-shfmt) - Vim plugin
> 
> Other noteworthy integrations include:
> 
>-    Alternative docker image by [PeterDaveHello](https://github.com/PeterDaveHello/dockerized-shfmt/)
>-    [modd](https://github.com/cortesi/modd) - A developer tool that responds to filesystem changes
>-    [prettier-plugin-sh](https://github.com/rx-ts/prettier/tree/master/packages/sh) - [Prettier](https://prettier.io) plugin using [mvdan-sh](https://www.npmjs.com/package/mvdan-sh)
>-    [sh-checker](https://github.com/luizm/action-sh-checker) - A GitHub Action that performs static analysis for shell scripts
>-    [mdformat-shfmt](https://github.com/hukkinj1/mdformat-shfmt) - [mdformat](https://github.com/executablebooks/mdformat) plugin to format shell scripts embedded in Markdown with shf


## WSL (Windows Subsystem Linux)

---

sudo gedit /var/lib/polkit-1/localauthority/10-vendor.d/com.ubuntu.desktop.pkla


---
General Notes:

Options- options may be either traditional POSIX one letter options, or GNU -style long options. POSIX options start with a single "-", while long options start with "--". Long options are provided for both GNU -specific features and for POSIX -mandated features.
---

[[TOC]]

---
## Shortcuts
- [[ctrl+c]] - Halts the current command
- [[ctrl+z]] - Stops the current command, resume with fg in the  foreground or bg in the background
- [[ctrl+d]] - Logout the current session, similar to exit
        - also is the EOF command 
- [[ctrl+w]] - Erases one word in the current line
- [[ctrl+u]] - Erases the whole line
- [[ctrl+r]] - Type to bring up a recent command
- [[!!]] - Repeats the last command
- [[exit]] - Logout the current session

- [[Esc]] + [[?]] or [[Ctrl]] + [[x]] + [[?]]
        `~` - user name completion
        `@` - complete machine name
        `$` - complete Environment Name
        `!` - command name or file name **same as [[Tab]]**
- [[Ctrl]] + [[Alt]] + [[T]] or [[Super]] + [[T]] to open **Terminal**
- [[Ctrl]] + [[Shift]] + [[T]] - open a new terminal tab
- [[CTRL]] + [[r]] - Reverse Search
- [[CTRL]] + [[d]] - EOF - indicates EOF
- [[CTRL]] + [[z]] - put current thread in the *background* or _stop_
     - `fg` bring it back
     - or `jobs` then
     - `fg` *NAME*
     - `fg` *NUMBER*
- [[CTRL]] + [[a]] - Beginning of line
- [[CTRL]] +  [[e]] - End of Line
- [[CTRL]] + [[k]] - Cut whats in front of the cursor
- [[CTRL]] + [[w]] - Cuts the entire line
- [[CTRL]] + [[Y]] - Paste
- [[ALT]] + [[F1]]-[[F6]] - Virtual Terminals
- [[F7]] - usually **X-window** (try [[ALT]][[F7]] or [[CTRL]][[ALT]][[F7]])
- [[CTRL]] + [[ALT]] + ([[F1]]-[[F6]]) - to change from within x-window

### screen

- `screen` starts a cli window manager- useful when connected via SSH (a single terminal window)

- `screen`
[[CTRL]] + [[A]], [[C]] - new virtual term

[[CTRL]] + [[N]] - Next
[[CTRL]] + [[P]] - Previous
[[CTRL]] + [[A]] - Last


### terminals

Debian uses 6 virtual character terminals.  By default you use 1 (VT1). TO get there use [[Ctrl]] + [[Alt]] + [[F1]]

[[F1]] - [[F6]] are the 6 character terminals.  1 has the Xwindow host on it.

From a character terminal [[Alt]] + [[F#]] will switch, but from a GUI [[ALT]] + [[CTRL]] + [[F#]] is required.

Login is on [[Ctrl]]+[[Alt]]+[[F1]].  Gui is on [[Alt]][[F7]]

### chvt

can also use the command `chvt` as in `chvt 2`

## Shutting Down

[[CTRL]]+[[D]] exits the terminal (logs out).

normal multiuser mode from the commandline - `shutdown -h now`

single-user mode from the commandline  `poweroff -i -f`

[[CTRL]] + [[ALT]] + [[DEL]] can shut down **if** `/etc/inittab` contains "ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -h now"

## help

- `man` *TOPIC* - opens the man page viewer ([LESS](#less)) to view doc.


- `man -K KEYWORD` - searched the man database, line by line for keyword match.]

- `man -f COMMAND`

        man SECTION# COMMAND
        man 2 time

But to get section number - use `apropos`KEYWORD

- `info` *COMMAND* - only works for some - more detailed than :

- `whatis` *COMMAND* - which provides a one-line answer.

All this must be built with ROOT as `makewhatis` (SLOW)

## Quick Summary

### File Commands

- `ls` - Directory listing
- `ls -al` - Formatted listing with hidden files
- `ls -lt` - Sorting the Formatted listing by time modification
- `cd` *dir* - Change directory to dir
- `cd` - Change to home directory
- `pwd` - Show current working directory
- `mkdir` *dir* - Creating a directory dir
- `cat >file` - Places the standard input into the file
- `more` *file* - Output the contents of the file
- `head` *file* - Output the first 10 lines of the file
- `tail` *file* - Output the last 10 lines of the file
- `tail -f` *file* - Output the contents of file as it grows,starting with the last 10 lines
- `touch` *file* - Create or update file
- `rm` *file* - Deleting the file
- `rm -r` *dir* - Deleting the directory
- `rm -f` *file* - Force to remove the file
- `rm -rf` *dir* - Force to remove the directory dir
- `cp` *file1 file2* - Copy the contents of file1 to file2
- `cp -r` *dir1 dir2* - Copy dir1 to dir2;create dir2 if not present
- `mv` *file1 file2* - Rename or move file1 to file2,if file2 is an existing directory
- `ln -s` *file link* - Create symbolic link link to file

### Process management

- `ps` - To display the currently working processes
- `top` - Display all running process
- `kill` *pid* - Kill the process with given pid
- `killall` *proc* - Kill all the process named proc
- `pkill` *pattern* - Will kill all processes matching the pattern
- `bg` - List stopped or background jobs,resume a stopped job in the background
- `fg` - Brings the most recent job to foreground
- `fg` *#* - Brings job n to the foreground

### File permission

- `chmod` _[octal]_  *file* - Change the permission of file to octal,which can be found separately for user,group,world by adding,
   - [4]-read(r)
   - [2]-write(w)
   - [1]-execute(x)

### Searching

- `grep pattern` *file* - Search for pattern in file
- `grep -r pattern` *dir* - Search recursively for pattern in dir
- _[command]_ `| grep` *pattern*` - Search pattern in the output of a command
- `locate` *file* - Find all instances of file
- `find . -name` *filename* - Searches in the current directory (represented by a period) and below it, for files and directories with names starting with filename
- `pgrep` *pattern* - Searches for all the named processes , that matches with the pattern and, by default, returns their ID
System Info
- `date` - Show the current date and time
- `cal` - Show this month's calender
- `uptime` - Show current uptime
- `w` - Display who is on line
- `whoami` - Who you are logged in as
- `finger user` - Display information about user
- `uname -a` - Show kernel information
- `cat /proc/cpuinfo` - Cpu information
- `cat proc/meminfo` - Memory information
- `man command` - Show the manual for command
- `df` - Show the disk usage
- `du` - Show directory space usage
- `free` - Show memory and swap usage
- `whereis app` - Show possible locations of app
- `which app` - Show which applications will be run by default

### Compression

- `tar cf file.tar` *file* - Create tar named file.tar containing file
- `tar xf file.tar` - Extract the files from file.tar
- `tar czf file.tar.gz files` - Create a tar with Gzip compression
- `tar xzf file.tar.gz` - Extract a tar using Gzip
- `tar cjf` *file.tar.bz2* - Create tar with Bzip2 compression
- `tar xjf` *file.tar.bz2* - Extract a tar using Bzip2
- `gzip` *file* - Compresses file and renames it to file.gz
- `gzip -d file.gz` - Decompresses file.gz back to file

### Network

- `ping host` - Ping host and output results
- `whois domain` - Get whois information for domains
- `dig domain` - Get DNS information for domain
- `dig -x host` - Reverse lookup host
- `wget` *file* - Download file
- `wget -c` *file* - Continue a stopped download

## Shortcuts

- [[ctrl+c]] - Halts the current command
- [[ctrl+z]] - Stops the current command, resume with fg in the  foreground or bg in the background
- [[ctrl+d]] - Logout the current session, similar to exit
- [[ctrl+w]] - Erases one word in the current line
- [[ctrl+u]] - Erases the whole line
- [[ctrl+r]] - Type to bring up a recent command
- [[!!]] - Repeats the last command
- [[exit]] - Logout the current session

### Typical help commands

(internally)
- `-?`
- `-h`
- `--h`
- `--help`

_____
Reserved Words

>        if	then	elif	else	fi	time
>        for	in	until	while	do	done
>        case	esac	coproc	select	function
>        {	}	[[	]]	!


## Looping Constructs

**until** `until test-commands; do consequent-commands; done`

**while**  `while test-commands; do consequent-commands; done`

**for**  `for name [ [in [words …] ] ; ] do commands; done`

**for** - `for (( expr1 ; expr2 ; expr3 )) ; do commands ; done`

**if**

    if test-commands; then
      consequent-commands;
    [elif more-test-commands; then
      more-consequents;]
    [else alternate-consequents;]
    fi

case

    The syntax of the case command is:

    case word in
        [ [(] pattern [| pattern]…) command-list ;;]…
    esac

Each clause must be terminated with `;;`, `;&`, or `;;&`. 
It’s a common idiom to use `*` as the final pattern to define the default case, matches all

        echo -n "Enter the name of an animal: "
        read ANIMAL
        echo -n "The $ANIMAL has "
        case $ANIMAL in
        horse | dog | cat) echo -n "four";;
        man | kangaroo ) echo -n "two";;
        *) echo -n "an unknown number of";;
        esac
        echo " leg



>-  `;;` no subsequent matches are attempted after the first pattern match.
>-  `;&` in place of `;;` causes execution to continue with the command-list associated with the next clause, if any.
>-  `;;&` in place of `;;` causes the shell to test the patterns in the next clause, if any, and execute any associated command-list on a successful match, continuing the case statement execution as if the pattern list had not matched.

>-  **return status** is zero if no pattern is matched. Otherwise, the return status is the exit status of the command-list executed.

> *_select_* - The select construct allows the easy generation of menus. It has almost the same syntax as the for command:

    select name [in words …]; do commands; done

                select fname in *;
                do
                        echo you picked $fname \($REPLY\)
                        break;
                done
[Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pipelines)

> _`((…))`_ -  (( expression ))
> 
> The arithmetic expression is evaluated according to the rules described below (see [Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic)). 
> If the value of the expression is non-zero, the return status is 0; otherwise the return status is 1.


`let "expression"` -exactly equivalent to above.


> See [Bash Builtins](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Bash-Builtins), for a full description of the `let` builtin.


`[[…]]`    _*[[ expression ]]*_   Return a status of 0 or 1 depending on the evaluation of the conditional expression expression. Expressions are composed of the primaries described below in Bash Conditional Expressions. Word splitting and filename expansion are not performed on the words between the [[ and ]]; tilde expansion, parameter and variable expansion, arithmetic expansion, command substitution, process substitution, and quote removal are performed. Conditional operators such as `-f` must be unquoted to be recognized as primaries. 


`[[ $line =~ [[:space:]]*(a)?b ]]` will match a line (stored in the shell variable line) if there is a sequence of characters anywhere in the value consisting of any number, including zero, of characters in the space character class, zero or one instances of `a`, then a #:



____
### Expressions


Expressions may be combined using the following operators, listed in decreasing order of precedence:

`( expression )` Returns the value of expression. This may be used to override the normal precedence of operators.

`! expression `   True if expression is false.

`expression1 && expression2` - True if both expression1 and expression2 are true.

`expression1 || expression2`  -      True if either expression1 or expression2 is true. 


The `&&` and `||` operators do not evaluate expression2 if the value of expression1 is sufficient to determine the return value of the entire conditional expression. 
hen commands are grouped, redirections may be applied to the entire command list. For example, the output of all the commands in the list may be redirected to a single stream.



- `()` -   ( list )  -  Placing a list of commands between parentheses causes a subshell environment to be created (see Command Execution Environment), and each of the commands in list to be executed in that subshell. Since the list is executed in a subshell, variable assignments do not remain in effect after the subshell completes.

- `{}` -  { list; }   Placing a list of commands between curly braces causes the list to be executed in the current shell context. No subshell is created. The semicolon (or newline) following list is required. 

In addition to the creation of a subshell, there is a subtle difference between these two constructs due to historical reasons. The braces are reserved words, so they must be separated from the list by blanks or other shell metacharacters. The parentheses are operators, and are recognized as separate tokens by the shell even if they are not separated from the list by whitespace.

The exit status of both of these constructs is the exit status of list.

[Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Pipelines)
((^) *(file(\d)*|fd)*
(?:flag-*\S+)


____

### Operators


>-  `id++ id--` - variable post-increment and post-decrement
> 
>-  `++id --id` - variable pre-increment and pre-decrement
> 
>-  `- +` - unary minus and plus
> 
>-  `! ~` - logical and bitwise negation
> 
>-  `**` - exponentiation
> 
>-  `* / %` - multiplication, division, remainder
> 
>-  `+ -` - addition, subtraction
> 
>-  `<< >>` - left and right bitwise shifts
> 
>-  `<= >= < >` - comparison
> 
>-  `== !=` - equality and inequality
> 
>-  `&` - bitwise AND
> 
>-  `^` - bitwise exclusive OR
> 
>-  `|` - bitwise OR
> 
>-  `&&` - logical AND
> 
>-  `||` - logical OR
> 
>-  `expr ? expr : expr` - conditional operator
> 
>-  `= *= /= %= += -= <<= >>= &= ^= |=` - assignment
> 
>-  `expr1 , expr2` - comma


____

### Conditionals

>-  `-a`  *_[file]_* - True if file exists.
> 
>-  `-b`  *_[file]_* - True if file exists and is a block special file.
> 
>-  `-c`  *_[file]_* - True if file exists and is a character special file.
> 
>-  `-d`  *_[file]_* - True if file exists and is a directory.
> 
>-  `-e`  *_[file]_* - True if file exists.
> 
>-  `-f`  *_[file]_* - True if file exists and is a regular file.
> 
>-  `-g`  *_[file]_* - True if file exists and its set-group-id bit is set.
> 
>-  `-h`  *_[file]_* - True if file exists and is a symbolic link.
> 
>-  `-k`  *_[file]_* - True if file exists and its "sticky" bit is set.
> 
>-  `-p`  *_[file]_* - True if file exists and is a named pipe (FIFO).
> 
>-  `-r`  *_[file]_* - True if file exists and is readable.
> 
>-  `-s`  *_[file]_* - True if file exists and has a size greater than zero.
> 
>-  `-t`  *_[fd]_*   - True if file descriptor fd is open and refers to a terminal.
> 
>-  `-u`  *_[file]_* - True if file exists and its set-user-id bit is set.
> 
>-  `-w`  *_[file]_* - True if file exists and is writable.
> 
>-  `-x`  *_[file]_* - True if file exists and is executable.
> 
>-  `-G`  *_[file]_* - True if file exists and is owned by the effective group id.
> 
>-  `-L`  *_[file]_* - True if file exists and is a symbolic link.
> 
>-  `-N`  *_[file]_* - True if file exists and has been modified since it was last read.
> 
>-  `-O`  *_[file]_* - True if file exists and is owned by the effective user id.
> 
>-  `-S`  *_[file]_* - True if file exists and is a socket.
> 
>-   *_[file1]_* -ef *_[file2]_* - True if file1 and file2 refer to the same device and inode numbers.
> 
>-   *_[file1]_* -nt *_[file2]_* - True if file1 is newer (according to modification date) than file2, or if file1 exists and file2 does not.
> 
>-   *_[file1]_* -ot *_[file2]_* - True if file1 is older than file2, or if file2 exists and file1 does not.
> 
>-  `-o`  *optname* -  True if the shell option optname is enabled. The list of options appears in the description of the -o option to the set builtin (see The Set Builtin).
> 
>-  `-v`  *varname* -  True if the shell variable varname is set (has been assigned a value).
> 
>-  `-R`  *varname* - True if the shell variable varname is set and is a name reference.
> 
>-  `-z`  *string*  -  True if the length of string is zero.
> 
>-  `-n`  *string*  ||  *string* -   True if the length of string is non-zero.
> 
>-   *string1* == *string2* ||  *string1* = *string2* - True if the strings are equal. When used with the [[ command, this performs pattern matching as described above (see Conditional Constructs).
> 
> `=` should be used with the test command for POSIX conformance.
> 
>-   *string1* != *string2* -  True if the strings are not equal.
> 
>-   *string1* < *string2* -  True if string1 sorts before string2 lexicographically.
> 
>-   *string1* > *string2* - True if string1 sorts after string2 lexicographically.
> 
>-  *arg1* `OP` *arg2* - OP is one of `-eq`, `-ne`, `-lt`, `-le`, `-gt`, or `-ge`. 

!!!note These arithmetic binary operators return true if arg1 is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to arg2, respectively. Arg1 and arg2 may be positive or negative integers. When used with the [[ command, Arg1 and Arg2 are evaluated as arithmetic expressions (see Shell Arithmetic).

____

### Functions

> Functions are declared using this syntax:
> 
>       fname () compound-command [ redirections ]
> 
> or
>               
>       function fname [()] compound-command [ redirections ]
> 
> This defines a shell function named fname. The reserved word `function` is optional. If the `function` reserved word is supplied, the parentheses are optional. The body of the function is the compound command compound-command 

(see [Compound Commands](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Compound-Commands)).

## Quick Look

!!!attention Overview

    - `/` - root
    - `~` - home
    - `..` - one step up in tree
    - `.` - cwd
    - `<`, `>` - pipe stream
    - `2>` redirects StdErr (instead of StdOut)
            make someFile 2> /dev/null

    squelches error output
    - `&>` - Redirects both stderr and stdout to another destination.
            make &> /dev/null
    - `>>` - append stream
    - `<<` - starts std input to take in information.  Exit with [[CTRL]] + [[D]].
        - `<<WORD` - Starts StdInput until *WORD* is typed.  The result is sent without word. e.g.:
                    $echo <<WORLD
                    $HELLO WORLD
                    >HELLO
    - `|` pipe character
        - e.g. `set | less`
        - e.g. `cat file1.txt file2.txt | less`
    - `|&` - pipe char- only this pipes stdout  AND stderr.
    - `tee` - sends output to a file AND StdOut. Like a `Y` or `T` exchange.
            ls /home/user | tee my_directories.txt
    - `&&` combines commands
            - on error does not continue
            - logical and, works on the basis of return code being 0.
    - `||` - logical or
            - e.g. `ls || pwd`
            - if the first command is successful, the second command does not execute.  Only executes if prior command failed.
    - `;` line break, combines commands,
            - e.g `ls ; cal ; date`
            - on error - continues
    - `!` - bang character.
            - `!n` = execute the nth prior command
                    e.g. `!2`
            - `!!` - last command
            - `!-n` - execute the command n times before
                    - `!-1` == `!!`
            - `!STRING` - executes the last command starting with 'STRING'
                    - e.g `!cd` runs the last command starting with 'cd'
            - `!?STRING?` - executes the last command containing
            - `COMMAND !*` - executes "COMMAND" with the last command's arguments
            - `!:^` -== `!:0` - first arg
            - `!:$` - last arg
            - `!:2-3` the second and third arg.
            - `!-2:3-$` combining the two.
    Starting with ! accesses history
            COM1 -Opt1 -Opt2 -Opt3
            COM2 !* == COM2 -Opt1 -Opt2 -Opt3



Starting with @ accesses Partameters [Positional Parameters](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Positional-Parameters)


[Shell Expansions](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Expansions)


### `$` Positional Access

!!!tip `$` Parameter Recall
    >- `$N`
    >- `${N}`
    >- `*` - `$*` -  Expands to the positional parameters, starting from one. When the expansion is not within double quotes, each positional parameter expands to a separate word.
    >-  `@` - (`$@`)Expands to the positional parameters, starting from one. I
    > 
    >-  `#` - ($#) Expands to the number of positional parameters in decimal.
    > 
    >-  `?` -    ($?) Expands to the exit status of the most recently executed foreground pipeline.
    > 
    >-  `-` - ($-, a hyphen.) Expands to the current option flags as specified upon invocation, by the set builtin command, or those set by the shell itself (such as the -i option).
    > 
    >-  `$` - ($$) Expands to the process ID of the shell. In a () subshell, it expands to the process ID of the invoking shell, not the subshell.
    > 
    >-  `!` - ($!) Expands to the process ID of the job most recently placed into the background, whether executed as an asynchronous command or using the bg builtin (see Job Control Builtins).
    >-  `0` - ($0) Expands to the name of the shell or shell script. This is set at shell initialization. If Bash is invoked with a file of commands (see Shell Scripts), $0 is set to the name of that file.
    > 
    you can void the "closing the terminal kills all spawned programs" issue by launching the program with the


### Brace Expansion

[Bash Reference Manual](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Expansions)

Patterns to be brace expanded take the form of an ==optional preamble,== followed by either ==a series of comma-separated strings or a sequence expression between a pair of braces,== followed by an ==optional postscript.== The preamble is prefixed to each string contained within the braces, and the postscript is then appended to each resulting string, expanding left to right. 

bash$ echo a{d,c,b}e
ade ace abe

!!!tip A sequence expression takes the form `{x..y[..incr]}`, where x and y are either integers or single characters, and `incr`, an optional increment, is an integer. 
    - When integers are supplied, the expression expands to each number between x and y, inclusive.
    - Supplied integers may be prefixed with ‘0’ to force each term to have the same width
    - When either x or y begins with a zero, the shell attempts to force all generated terms to contain the same number of digits, zero-padding where necessary.
    - When characters are supplied, the expression expands to each character lexicographically between x and y, **inclusive,** using the default C locale.
    - x and y must be of the same type.
    - When the increment is supplied, it is used as the difference between each term. The default increment is 1 or -1 as appropriate.
    - Brace expansion is performed before any other expansions, and any characters special to other expansions are preserved in the result. 
    - Any incorrectly formed brace expansion is left unchanged.

!!!faq Similarity with `Parameter Expansion`:
    -   A `{` or ‘`,`’ may be quoted with a backslash [[\]] to prevent its being considered part of a brace expression. To avoid conflicts with parameter expansion, the string ‘[[${]]’ is not considered eligible for brace expansion, and inhibits brace expansion until the closing ‘[[}]]’. 
____
### `~` Tilde Expavnsion

Accesses the directory stack

!!!example `~` Tilde Expavnsion
    If the characters following the tilde in the tilde-prefix consist of a number N, optionally prefixed by a `+` or a `-`, the tilde-prefix is replaced with the corresponding element from the directory stack, as it would be displayed by the dirs builtin invoked with the characters following tilde in the tilde-prefix as an argument (see The Directory Stack). If the tilde-prefix, sans the tilde, consists of a number without a leading `+` or `-`, `+` is assumed. 

    >- [[`~`]] - The value of `$HOME`
    >- [[`~/foo`]] - `$HOME/foo`
    >- [[`~fred/foo`]] - The subdirectory *foo* of the home directory of the user **fred**
    >- [[`~+/foo`]] - `$PWD/foo`
    >- [[`~-/foo`]] - `${OLDPWD-'~-'}/foo`
    >- [[`~N`]] -  The string that would be displayed by `‘dirs +N’`
    >- [[`~+N`]] - The string that would be displayed by `‘dirs +N’`
    >- [[`~-N`]] - The string that would be displayed by `‘dirs -N’` 



!!!!!Attention Attention: Important `&`
- `&` suffix so that it runs as a background process and then issuing `disown %1` in bash or whatever job number the program is. Then you can safely close the terminal. So, it could be something like: `sudo my-program &;disown %1;exit;`

[Source](https://stackoverflow.com/questions/3371294/how-can-i-recall-the-argument-of-the-previous-bash-command)



The shell command [[!]] recalls an old command from the history buffer.
[[!1]] - this starts from the beginning of the history.  In this case- there are 1500 entries, and this is the very first.
[[!2]] etc
[[!-1]] - start from the most recent.

`cat .zsh_history | wc -l`
running [[!$]] gives the last arguement `-l`  juist like reg-ex
running [[!^]] gives the first arguments - here .zsh_history.  Note the command isnt included.

`!2^` gives another item- .zshrc.  Its adjacent alphabeticallty but thats it...
`!-1^` try to get the negatives of the value. Running `!5` without the hat, it does whats show above.   `zsh: no such word in event`
`!^3` just puts the number at the end of the `!^` value.

`$_` the last argument.  Similar to `!$`.  


[[Alt]]+[[.]] ALT and period, Allegedly does as well but not working on the current machine I am on. 
[[Esc]]+[[.]] Esc + period is also supposed to do the same.

For items other than the first or last `!^` vs `!$` & `$_` you can do `!:1` to get a specific one.  Starts numbering after the command.

`!:0` works as expected, annd gives the first word in the last command.

`!!:0` - this actually does the same thing.

Can even do ranges!
`!:0-3`

`!:^-$` the values `^` and `$` are just variables, and can be substituted.

More advanced stuff

`!pattern` - most recent command matching pattern

`!!:s/find/replace` - last command, substitute find with replace

you can also `^find^replace`.

`!*` - all arguments from the previous command (after the program/built-in/script). e.g.: ls *.tmp *.cache rm !* 

You can even combine the two methods- running the commands vertically, and the arguments horizontally.
`!-2:3` - the command run 2 cmds prev. and the 3 argument.

[[CTRL]]+[[R]] Does a reverse search.



Just as [[M]]0[[.]] **(meta-dot** or **esc-dot** or **alt-dot)** is the readline function yank-last-arg, M-C-y (meta-control-y or esc-ctrl-y or ctrl-alt-y) is the readline function yank-nth-arg. Without specifying n, it yanks the first argument of the previous command.

To specify an argument, press Escape and a number or hold Alt and press a number. You can do Alt--to begin specifying a negative number then release Alt and press the digit (this will count from the end of the list of arguments.


$ echo a b c d e f g
a b c d e f g

[[Alt]][[CTRL]][[Y]]

-gives 'a' to show but we arent done

[[Alt]]+[[3]] [[Alt]]+[[Ctrl]]+[[Y]]
[[Alt]]+( [[-]]+[[2]] )  [[Alt]]+[[Ctrl]]+[[Y]]

^My ->M3->^My-> M- +2 -> M^y

where M is ALT and ^ is CTRL.


(^    )([A-Za-z0-9, _ -,+\#.-\!]+)(:)
\t- [[`$2`]]  $3  


!^      first argument
!$      last argument
!*      all arguments
!:2     second argument

!:2-3   second to third arguments
!:2-$   second to last arguments
!:2*    second to last arguments
!:2-    second to next to last arguments

!:0     the command
!!      repeat the previous line

$ man  -P 'less -p ^HISTORY\ EXPANSION' bash
<...>


-----

#### Word Designators

!!!cite [Using History Interactively](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Using-History-Interactively)

Word designators are used to **select desired words** from the event.

A [[:]] separates the event specification from the word designator.

It may be omitted if the word designator begins with a [[^]], [[$]], [[*]], [[-]],
or [[%]].  

Words are numbered from the beginning of the line, with the
first word being denoted by [[0]] (zero).  

Words are inserted into the current line separated by single spaces.

Here are the word designators:

>- [[0]] *(zero)* The zeroth word.  For the shell, this is the command word.
>- [[n]]      The nth word.
>- [[^]]      The first argument.  That is, word 1.
>- [[$]]      The last argument.
>- [[%]]      The word matched by the most recent `?string?` search.
>- [[x-y]]    A range of words; `-y` abbreviates `0-y`.
>- [[*]]      All of the words but the zeroth.
>   >- This is a synonym for `1-$`.
>   >- It is not an error to use `*` if there is just one word in the event; the empty string is returned in that case.
>- [[x*]]     Abbreviates `x-$`.
>- [[x-]]     Abbreviates `x-$` like `x*`, but omits the last word.

If [[`x`]] is missing, it defaults to 0.

   If a word designator is supplied without an event specification, the previous command is used as the event.

!!!example Example: 
    recall -A [[`:`]] separates the event specification from the **word designator** unless the **word designator** begins with a [[`^`]], [[`$`]], [[`*`]], [[`-`]], or [[`%`]].
    
    For example,

    - `!!` - designates the preceding command. When you type this, the preceding command is repeated in toto.

    - `!!:$` - designates the last argument of the preceding command. This may be shortened to !$.

    - `!fi:2` - designates the second argument of the most recent command starting with the letters fi.


----

### 9.3.1 Event Designators

An event designator is a reference to a command line entry in the history list. Unless the reference is absolute, events are relative to the current position in the history list.

- [[`!`]] - Start a history substitution, except when followed by a space, tab, the end of the line, [[`=`]] or [[`(`]] 
                - (when the extglob shell option is enabled using the shopt builtin).

- [[`!n`]] - Refer to command line n.

- [[`!-n`]] - Refer to the command n lines back.

- [[`!!`]] - Refer to the previous command. This is a synonym for [[`!-1`]].

- [[`!string`]] - Refer to the most recent command preceding the current position in the history list starting with string.

- [[`!?string[?]`]] - Refer to the most recent command preceding the current position in the history list containing string. The trailing [[`?`]] may be omitted if the string is followed immediately by a newline. If string is missing, the string from the most recent search is used; it is an error if there is no previous search string.

- [[`^string1^string2^`]] - Quick Substitution. Repeat the last command, replacing string1 with string2. Equivalent to !!:s^string1^string2^.

- [[`!#`]] - The entire command line typed so far.


9.3.3 Modifiers

After the optional word designator, you can add a sequence of one or more of the following modifiers, each preceded by a [[`:`]]. These modify, or edit, the word or words selected from the history event.

>- [[`h`]] - Remove a trailing pathname component, leaving only the head.
>- [[`t`]] - Remove all leading pathname components, leaving the tail.
>- [[`r`]] - Remove a trailing suffix of the form [[`.suffix`]], leaving the basename.
>- [[`e`]] - Remove all but the trailing suffix.
>- [[`p`]] - Print the new command but do not execute it.
>- [[`q`]] - Quote the substituted words, escaping further substitutions.
>- [[`x`]] - Quote the substituted words as with [[`q`]], but break into words at spaces, tabs, and newlines. The [[`q`]] and [[`x`]] modifiers are mutually exclusive; the last one supplied is used.
>- [[`s/old/new/`]] - Substitute new for the first occurrence of old in the event line. Any character may be used as the delimiter in place of [[`/`]]. The delimiter may be quoted in old and new with a single backslash. If [[`&`]] appears in new, it is replaced by old. A single backslash will quote the [[`&`]]. If old is null, it is set to the last old substituted, or, if no previous history substitutions took place, the last string in a !?string[?] search. If new is is null, each matching old is deleted. The final delimiter is optional if it is the last character on the input line.
>- [[`&`]] - Repeat the previous substitution.
>- [[`a`]] | [[`g`]]  - Cause changes to be applied over the entire event line. Used in conjunction with [[`s`]], as in gs/old/new/, or with [[`&`]].
>- [[`G`]] - Apply the following [[`s`]] or [[`&`]] modifier once to each word in the event.
----

Tested on Ubuntu 18.04
To insert previous arguments:

    [[`Alt+.`]] [[Alt]]+[[.]]: insert last argument from last command.
    [[`Alt+#+.`]] [[Alt]]+[[#]]+[[.]]: insert #nth last argument from last command.
[[`Alt+-`]] , `#` , `Alt+.` **bash:** [[Alt]]+[[-]] , [[#]] , [[Alt]]+[[.]]
`Alt+-#+.` ** zsh:** [[Alt]]+[[-]]+ [[#]]{style="color:black; } +[[.]]
         insert #nth first argument from last command. 

In Linux you can repeat commands to go back in history
Example:

Last command is:

mv foo bar

`Alt+0+.` [[Alt]]+[[0]]+[[.]]: insert first argument of last command = mv
`Alt+2+.` [[Alt]]+[[2]]+[[.]]: insert last 2nd argument of last command = foo
    up , [[Ctrl]]+[[w]]: last command without the last word = mv foo

General shortcuts


`Ctrl+w`
    [[Ctrl]]+[[w]]: removes last word from cursor
`Alt+d`
    [[Alt]]+[[d]]: removes next word from cursor
`Ctrl+k`
    [[Ctrl]]+[[k]]: cuts everything after cursor
`Ctrl+u`, zsh: `Alt+w`
    [[Ctrl]]+[[u]], zsh: [[Alt]]+[[w]]: cuts everything before cursor
    zsh: [[Ctrl]]+[[u]]: cuts the entire command (In bash you can combine [[Ctrl]]+[[u]] , [[Ctrl]]+[[k]])
`Ctrl+k`
`Ctrl+u`
`Ctrl+y`
    [[Ctrl]]+[[y]]: paste characters previously cut with [[Ctrl]]+[[u]] and [[Ctrl]]+[[k]]
`Ctrl+_`
    [[Ctrl]]+[[_]]: undo last edit (very useful when exceeding [[Ctrl]]+[[w]])
`Ctrl+left`
    [[Ctrl]]+[[left]]: move to last word
`Ctrl+right`
    [[Ctrl]]+[[right]]: move to next word
`home or Ctrl+a`
    home or [[Ctrl]]+[[a]]: move to start of line
`end or Ctrl+e`
    end or [[Ctrl]]+[[e]]: move to end of li





## Substitution

[Ref](https://stackoverflow.com/questions/4009412/how-to-use-arguments-from-previous-command)



Also, there is hats substitution shortcut in the command line:

                echo Hello, world!
                ^Hello^Bye
                Bye, world!

to substitute the previous command's first matched string, meaning:

        Hello, world! Hello, people!
        ^Hello^Bye

would result in:

        Bye, world! Hello, people!      

The above is just a shortcut for:

        !:s/Hello/Bye

event-level(*) substitution for the first found (matched) string in the previous command, while prefixing the first part with the g switch will apply to the whole line globally:

        echo Hello, world! Hello, people!

        !:gs/Hello/Bye

        Bye, world! Bye, people!

 Return true if a bash variable is unset or set to the empty string: if \[ -z ${my\_variable+x} \];

> !!!faq How to check if bash variable defined in script - [nixCraft](https://www.cyberciti.biz/faq/see-check-if-bash-variable-defined-in-script-on-linux-unix-macos/) 
     >    To find out if a bash variable is defined:
    > 
    > 1.  Return true if a bash variable is unset or set to the empty string: `if [ -z ${my_variable+x} ];`
    > 2.  Also try: `[ -z ${my_bash_var+y} ] && echo "\$my_bash_var not defined"`
    > 3.  Determine if a bash variable is set or not : `[[ ! -z ${PURGEIMAGE+z} ]] && echo "Set" || echo "Not defined"`
    > 4.  Return true if the variable is set on **Bash version 4.2+**:` [ -v $VAR ] && echo "Bash \$VAR NOT set"`
    > 
    >  if command syntax and example to see if bash variable named `PURGEIMAGE` set or not
    > 
    > The syntax is simple:
    >
    > ```sh
    > if [ -z ${PURGEIMAGE+x} ];
    > then
    >     echo "We need to only purge URL from Clodudfront CDN ..."
    > else
    >     echo "We need to purge images and URL from Cloudfront CDN ..."
    > fi
    >``` 
    >
    >
    > OR use the [test command](https://bash.cyberciti.biz/guide/Test_command "See Linux/Unix test command examples for more info")
    > 
    >```sh
    > if test -z ${PURGEIMAGE+y}
    > then
    >     echo "We need to only purge URL from Clodudfront CDN ..."
    > else
    >     echo "We need to purge images and URL from Cloudfront CDN ..."
    > fi
    >```
    >
    > ### How does ${my_variable+x} syntax works?
    > 
    > Let us print commands and their arguments as script is executed by using the [set command](https://bash.cyberciti.biz/guide/Set_command "See Linux/Unix set command examples for more info"):
    > 
    > ```sh
    > set -x
    > ./script
    > PURGEIMAGE\=whatever ./script
    > export PURGEIMAGE\=whatever
    > ./script
    > unset PURGEIMAGE
    > ./script
    > set +x
    > ```
    >- The `${my_variable+x}` is a bash parameter expansion.
    >     
    >- It evaluates to nothing if my_variable is unset.
    >     
    >- Otherwise it substitutes the string `x`.
    >     
    >- You can use any string and not limited to `x`. For instance, I can use foobar as follows:
    >     
    >     
    >```sh
    >     # instead of 'x' we used 'foobar'
    >     # but 'x' seems like a good practice 
    >     if [ -z ${PURGEIMAGE+foobar} ];
    >     then
    >         echo "We need to only purge URL from Clodudfront CDN ..."
    >     else
    >         echo "We need to purge images and URL from Cloudfront CDN ..."
    >     fi
    > ```   
    > 
    > Another option to see if bash shell variable is set or not
    > 
    > can try the control operators. The syntax is:
    > 
    > ```sh
    > [ -z ${var+foo} ] && echo "\${var} not defined"
    > [ -z ${var+foo} ] && echo "\${var} not defined" || echo "\${var} is defined"
    >```
    >
    > ==If portability is not your concern try `[[` syntax==
    > 
    > The following are bash specific option, and you need bash version 4.x+. I would avoid these examples due to portability issues if I were you, but I provide them below as they are in bash man pages.
    > 
    > ```sh
    > [[ -z ${var+z} ]] && echo "\${var} not defined" 
    > [[ -z ${var+z} ]] && echo "\${var} not defined" || echo "\${var} is defined"
    > ```
    > 
    > _Checking if a variable is set in Bash or not_
    > 
    > The -v VAR returns true if the shell variable VAR is set:
    > 
    > ```sh
    > [[ -v ${var} ]] && echo "\${var} not defined" 
    > [[ -v ${var} ]] && echo "\${var} not defined" || echo "\${var} is defined"
    > [ -v ${var} ] && echo "\${var} not defined" || echo "\${var} is defined"
    > ```
    >
    > !!!example Example
    >       This example was in my zshrc from powerline.
    >      ```sh
    >     if [[ -r "${XDG_CACHE_HOME:-$ZSH_CUSTOM/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    >      source "${XDG_CACHE_HOME:-$ZSH_CUSTOM/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    >     fi
    >     
    >     #another example. Looking for better.
    >     
    >     set variable identifying the chroot you work in (used in the prompt below)
    >     if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    >     debian_chroot=$(cat /etc/debian_chroot)
    >     fi
    >    ```
        





### environmental and shell variables

running `export` displays them.

Here are some common environmental variables that you will come across:

>- `SHELL`: This describes the shell--in most cases, this will be **bash** but other values can be set if you prefer other options.
>- `TERM`: This specifies the type of terminal to emulate when running the shell. Different hardware terminals can be emulated based on requirements.
>- `USER`: The current logged in **user.**
>- `PWD`: The *current working directory.*
>- `OLDPWD`: The *previous working directory.* This is kept by the shell in order to switch back by running `cd -`.
>- `LS_COLORS`: This defines color codes that are used to optionally add colored output to the ls command.
>- `MAIL`: The path to the current user's mailbox.
>- **`PATH`**: A list of directories that the system will check when looking for commands. When a user types in a command, the system will check directories in this order for the executable.
>- `LANG`: The current language and localization settings, including character encoding.
>- `HOME`: The current user's home directory.
`_`: The most recent previously executed command.
In addition to these environmental variables, some shell variables that you'll often see are:

>- `BASHOPTS`: The list of options that were used when bash was executed. This can be useful for finding out if the shell environment will operate in the way you want it to.
>- `BASH_VERSION`: The version of bash being executed, in human-readable form.
>- `BASH_VERSINFO`: The version of bash, in machine-readable output.
>- `COLUMNS`: The number of columns wide that are being used to draw output on the screen.
>- `DIRSTACK`: The stack of directories that are available with the pushd and popd commands.
>- `HISTFILESIZE`: Number of lines of command history stored to a file.
>- `HISTSIZE`: Number of lines of command history allowed in memory.
>- `HOSTNAME`: The hostname of the computer at this time.
>- `IFS`: The internal field separator to separate input on the command line. By default, this is a space.
>- `PS1`: The primary command prompt definition. This is used to define what your prompt looks like when you -start a shell session. The PS2 is used to declare secondary prompts for when a command spans multiple lines.
>- `SHELLOPTS`: Shell options that can be set with the set option.
>- `UID`: The UID of the current user.


-----
### Shell parameter Substitution

[Shell Parameter Expansion](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Parameter-Expansion)

!!!Tip Tip: A lot more here. Check out the link above.


!!!Note Todo clean this up.
   
${parameter:-word}

    If parameter is unset or null, the expansion of word is substituted. Otherwise, the value of parameter is substituted.

${parameter:=word}

    If parameter is unset or null, the expansion of word is assigned to parameter. The value of parameter is then substituted. Positional parameters and special parameters may not be assigned to in this way.

${parameter:?word}

    If parameter is null or unset, the expansion of word (or a message to that effect if word is not present) is written to the standard error and the shell, if it is not interactive, exits. Otherwise, the value of parameter is substituted.

${parameter:+word}

    If parameter is null or unset, nothing is substituted, otherwise the expansion of word is substituted.

${parameter:offset}
${parameter:offset:length}

    This is referred to as Substring Expansion. It expands to up to length characters of the value of parameter starting at the character specified by offset. If parameter is `@`, an indexed array subscripted by `@` or `*`, or an associative array name, the results differ as described below. 
    
    See here.
[Shell Arithmetic](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Shell-Arithmetic)

${!prefix*}
${!prefix@}

    Expands to the names of variables whose names begin with prefix, separated by the first character of the IFS special variable. When `@` is used and the expansion appears within double quotes, each variable name expands to a separate word.

${!name[@]}
${!name[*]}

    If name is an array variable, expands to the list of array indices (keys) assigned in name. If name is not an array, expands to 0 if name is set and null otherwise. When `@` is used and the expansion appears within double quotes, each key expands to a separate word.

${#parameter}

    The length in characters of the expanded value of parameter is substituted. If parameter is `*` or `@`, the value substituted is the number of positional parameters. If parameter is an array name subscripted by `*` or `@`, the value substituted is the number of elements in the array. If parameter is an indexed array name subscripted by a negative number, that number is interpreted as relative to one greater than the maximum index of parameter, so negative indices count back from the end of the array, and an index of -1 references the last element.

${parameter#word}
${parameter##word}

    The word is expanded to produce a pattern and matched according to the rules described below (see Pattern Matching). If the pattern matches the beginning of the expanded value of parameter, then the result of the expansion is the expanded value of parameter with the shortest matching pattern (the `#` case) or the longest matching pattern (the `##` case) deleted. If parameter is `@` or `*`, the pattern removal operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@` or `*`, the pattern removal operation is applied to each member of the array in turn, and the expansion is the resultant list.

${parameter%word}
${parameter%%word}

    The word is expanded to produce a pattern and matched according to the rules described below (see Pattern Matching). If the pattern matches a trailing portion of the expanded value of parameter, then the result of the expansion is the value of parameter with the shortest matching pattern (the `%` case) or the longest matching pattern (the `%%` case) deleted. If parameter is `@` or `*`, the pattern removal operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@` or `*`, the pattern removal operation is applied to each member of the array in turn, and the expansion is the resultant list.

${parameter/pattern/string}

    The pattern is expanded to produce a pattern just as in filename expansion. Parameter is expanded and the longest match of pattern against its value is replaced with string. The match is performed according to the rules described below (see Pattern Matching). If pattern begins with `/`, all matches of pattern are replaced with string. Normally only the first match is replaced. If pattern begins with `#`, it must match at the beginning of the expanded value of parameter. If pattern begins with `%`, it must match at the end of the expanded value of parameter. If string is null, matches of pattern are deleted and the / following pattern may be omitted. If the nocasematch shell option (see the description of shopt in The Shopt Builtin) is enabled, the match is performed without regard to the case of alphabetic characters. If parameter is `@` or `*`, the substitution operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@` or `*`, the substitution operation is applied to each member of the array in turn, and the expansion is the resultant list.

${parameter^pattern}
${parameter^^pattern}
${parameter,pattern}
${parameter,,pattern}

    This expansion modifies the case of alphabetic characters in parameter. The pattern is expanded to produce a pattern just as in filename expansion. Each character in the expanded value of parameter is tested against pattern, and, if it matches the pattern, its case is converted. The pattern should not attempt to match more than one character. The `^` operator converts lowercase letters matching pattern to uppercase; the `,` operator converts matching uppercase letters to lowercase. The `^^` and `,,` expansions convert each matched character in the expanded value; the `^` and `,` expansions match and convert only the first character in the expanded value. If pattern is omitted, it is treated like a `?`, which matches every character. If parameter is `@` or `*`, the case modification operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@` or `*`, the case modification operation is applied to each member of the array in turn, and the expansion is the resultant list.

${parameter@operator}

    The expansion is either a transformation of the value of parameter or information about parameter itself, depending on the value of operator. Each operator is a single letter:

- `U` - The expansion is a string that is the value of parameter with lowercase alphabetic characters converted to uppercase. 

- `u` - The expansion is a string that is the value of parameter with the first character converted to uppercase, if it is alphabetic. 

- `L` - The expansion is a string that is the value of parameter with uppercase alphabetic characters converted to lowercase. 

- `Q` - The expansion is a string that is the value of parameter quoted in a format that can be reused as input. 

- `E` - The expansion is a string that is the value of parameter with backslash escape sequences expanded as with the $'…' quoting mechanism. 

- `P` - The expansion is a string that is the result of expanding the value of parameter as if it were a prompt string (see Controlling the Prompt). 

- `A` - The expansion is a string in the form of an assignment statement or declare command that, if evaluated, will recreate parameter with its attributes and value. 

- `K` - Produces a possibly-quoted version of the value of parameter, except that it prints the values of indexed and associative arrays as a sequence of quoted key-value pairs (see Arrays). 

- `a` - The expansion is a string consisting of flag values representing parameter’s attributes. 




____
### Command Subsitution


Two methods:

!!!note: [[`]] (Backtick)
                command_1 `command_2 −options`
        This will execute "command_2" and it's output will become the input to "command_1".

!!!note: [[$]] (Dollar Sign)
                command_1 $(command_2 -options)
        Same as above

The _pipe_ command `|`- will do the same thing:

                cat file1.txt file2.txt | less

Command substitution allows the output of a command to replace the command itself. Command substitution occurs when a command is enclosed as follows:

      $(command)
   or
      `command`

Bash performs the expansion by executing command in a subshell environment and replacing the command substitution with the standard output of the command, with any trailing newlines deleted. 

____
### Arithmetic Expansion

Arithmetic expansion allows the evaluation of an arithmetic expression and the substitution of the result. The format for arithmetic expansion is:

         $(( expression ))


___
### Process Substitution

Process substitution allows a process’s input or output to be referred to using a filename. It takes the form of

      <(list)
or
      >(list)

The process list is run asynchronously, and its input or output appears as a filename. This filename is passed as an argument to the current command as the result of the expansion
 
____
### Syntax

#### `{}` vs `()`

`{varname}` seems used to dereference a variable

`signal=$(nmcli device wifi | grep * | awk '{print $6}')`

note the `$()` around the expression

There is no dollar sign required in front of ${print $6}

in this case `$6` is the variable that stores the 6th result of awk.

`echo $signal` and ``echo ${signal}` produce the same output




----

## Paths

An "_absolute path_" is easily recognised from the leading forward slash- `/boot/grub`

A _"relative path"_ doesn't have a preceding slash


## Filesystem


- `/` - **Root**
   - `bin` - **Binary** - biinaries are stored here, like *ls* and other things a regular single user might use.
   - `sbin` - System Binaries -- binary tools a system administrator might use.
   - `boot` - boot related files
   - `dev` - devices- devoces are mounted here. along with their drivers.
      - `sda`
      - `sdb` ... etc- hard disk mounting.
   - `etc` - Et cetera - "edit to configure" mneumonic- system wide settings- not per user settings
   - `home`
   - `lib`
      -`lib32`, `lib64` - libraries required for bin
   - `media` - Media directory, used to be called `mnt`  or in general most OS'es manage media for you by mounting devices (typically removable devices) while the user can use mount.  Things like USB sticks, external drives are found in `media` or `mnt`;
   - `opt` - contains manually installed software from vendors resides.  Usually user installed software doesnt go here.  But User created software can go here.
   - `proc` - process - Psudofiles that contain info on system processes or resources. Each Process has its own "pseudofile".  These are not actual files.  CPU information is in here.
   - `root` - Root User Home Folder- not a typical user directory.  Files stored here require root access.  This was to make sure that if user directories were on another directory, it wouldnt be lost.
   - `run` - variable- TempFS file system- like a temp directory.  It is stored in Ram and lost when the computer reboots.
   - `snap` -Snap Package directory- where Ubuntu stores the Snap packages.
   - `srv` - Service Directory- usually empty, but if computer is a webserver- then website or FTP files are stored here.
   - `sys` - System Files- contains Kernal pseudofiles.  It is not permanent.  Allows very low level access to kernal- for things like updating Video Card Settings.
   - `tmp` - Temporary- this is for applications to use during a session- things like temproray copies of a Document in progress.  A crashed program may lose access to the folder and it can begin to fill.  Might need to be cleared by Root user in Single User Mode.
   - `usr` - User or Unix System Resources - holds applications installed by the user.  These must be considered  non-essential.
      - `bin` - binaries
      - `sbin`- administration binaries
      - `lib` - libraries., also `lib32` and `lib64`
      - `src` Source - where programs installed from source are stored.
      - `local` - to indicate machine local users--
         - `bin` - binaries
         - `sbin`- administration binaries
         - `lib` - libraries., also `lib32` and `lib64`
         - `src` Source - where programs installed from source are stored.
      - `share` - The site for larger program installs.
         - `bin` - binaries
         - `sbin`- administration binaries
         - `lib` - libraries., also `lib32` and `lib64`
         - `src` Source - where programs installed from source are stored.
         - `local` - to indicate machine local users--
            - `bin` - binaries
            - `sbin`- administration binaries
            - `lib` - libraries., also `lib32` and `lib64`
            - `src` Source - where programs installed from source are stored.
   - `var` - Variable -this folder contains files that are expected to grow in size
      - `log` - contains log files
      - `crash` contains information on crashes.
      - `spool` contains printer documents
      - `cache` contains cached folders
   - `home` - links variably to each users home directory.
      - `.cache` - stores program cache
      - `.config` - Application (user specific) configuration settings.  Desktop settings, etc.
      - `.themes` - Desktop Themes.
      - `.*` - hidden files for programs.



|           | shareable         | unshareable   |
| --------- | ----------------- | ------------- |
| static    | /usr              | /etc          |
|           | /opt              | /boot         |
| --------- | ----------------- | ------------- |
| variable  | /var/mail         | /var/run      |
|           | /var/spool/news   | /var/lock     |

- `Shareable` files are defined as those that can be stored on one host and
used on others.
- `Unshareable` files are those that are not shareable. For example, the files in user home directories are shareable whereas device lock files are not.
- `Static` files include binaries, libraries, documentation files and other files that do not change without system administrator intervention.
- `Variable` files are defined as files that are not static.


### `/` - Root

You cannot add to the root a sub-directory.

| Directory | Description                                       |
| --------- | ------------------------------------------------- |
| **bin**   | Essential command binaries                        |
| **boot**  | Static files of the boot loader                   |
| **dev**   | Device files                                      |
| **etc**   | Host-specific system configuration                |
| **lib**   | Essential shared libraries and kernel modules     |
| **media** | Mount point for removeable media                  |
| **mnt**   | Mount point for mounting a filesystem temporarily |
| **opt**   | Add-on application software packages              |
| **sbin**  | Essential system binaries                         |
| **srv**   | Data for services provided by this system         |
| **tmp**   | Temporary files                                   |
| **usr**   | Secondary hierarchy                               |
| **var**   | Variable data                                     |

Each directory listed above is specified in detail in separate subsections below. `/usr` and `/var` each have a complete section in this document due to the complexity of those directories.

The following directories, or symbolic links to directories, must be in / , if the corresponding subsystem is installed:

| Directory     | Description                                     |
| ------------- | ----------------------------------------------- |
| **home**      | User home directories^**^                       |
| **lib<qual>** | Alternate format essential shared libraries^**^ |
| **root**      | Home directory for the root user^**^            |

**-(optional)

Each directory listed above is specified in detail in separate subsections below.

### /bin

contains commands that may be used by both the system administrator and by users, but which are required when no other filesystems are mounted

| Command      | Description                                           |
| ------------ | ----------------------------------------------------- |
| **cat**      | Utility to concatenate files to standard output       |
| **chgrp**    | Utility to change file group ownership                |
| **chmod**    | Utility to change file access permissions             |
| **chown**    | Utility to change file owner and group                |
| **cp**       | Utility to copy files and directories                 |
| **date**     | Utility to print or set the system data and time      |
| **dd**       | Utility to convert and copy a file                    |
| **df**       | Utility to report filesystem disk space usage         |
| **dmesg**    | Utility to print or control the kernel message buffer |
| **echo**     | Utility to display a line of text                     |
| **false**    | Utility to do nothing, unsuccessfully                 |
| **hostname** | Utility to show or set the system’s host name         |
| **kill**     | Utility to send signals to processes                  |
| **ln**       | Utility to make links between files                   |
| **login**    | Utility to begin a session on the system              |
| **ls**       | Utility to list directory contents                    |
| **mkdir**    | Utility to make directories                           |
| **mknod**    | Utility to make block or character special files      |
| **more**     | Utility to page through text                          |
| **mount**    | Utility to mount a filesystem                         |
| **mv**       | Utility to move/rename files                          |
| **ps**       | Utility to report process status                      |
| **pwd**      | Utility to print name of current working directory    |
| **rm**       | Utility to remove files or directories                |
| **rmdir**    | Utility to remove empty directories                   |
| **sed**      | The `sed` stream editor                               |
| **sh**       | The Bourne command shell                              |
| **stty**     | Utility to change and print terminal line settings    |
| **su**       | Utility to change user ID                             |
| **sync**     | Utility to flush filesystem buffers                   |
| **true**     | Utility to do nothing, successfully                   |
| **umount**   | Utility to unmount file systems                       |
| **uname**    | Utility to print system information                   |

#### Specific Options
The following programs, or symbolic links to programs, must be in `/bin` if the corresponding subsystem is installed:

| Command     | Description                               |
| ----------- | ----------------------------------------- |
| **csh**     | The C shell (optional)                    |
| **ed**      | The `ed` editor (optional)                |
| **tar**     | The tar archiving utility (optional)      |
| **cpio**    | The cpio archiving utility (optional)     |
| **gzip**    | The GNU compression utility (optional)    |
| **gunzip**  | The GNU uncompression utility (optional)  |
| **zcat**    | The GNU uncompression utility (optional)  |
| **netstat** | The network statistics utility (optional) |
| **ping**    | The ICMP network test utility (optional)  |

### /boot

This directory contains everything required for the boot process except configuration files not needed at boot time and the map installer.
stores data that is used before the kernel begins executing user-mode
programs. This may include saved master boot sectors and sector map files.

The operating system kernel must be located in either / or /boot

### /dev

`/dev` must contain a command named `MAKEDEV` , which can create devices as needed. It may also contain a `MAKEDEV.local` for any local devices.

### /etc

Host-specific system configuration - The /etc hierarchy contains configuration files. A "configuration file" is a local file used to control the operation
of a program; it must be static and cannot be an executable binary.

No binaries may be located under /etc

| Command  | Description                                      |
| -------- | ------------------------------------------------ |
| **opt**  | Configuration for /opt                           |
| **X11**  | Configuration for the X Window system (optional) |
| **sgml** | Configuration for SGML (optional)                |
| **xml**  | Configuration for XML (optional)                 |

opt
Configuration for /opt

The following files, or symbolic links to files, must be in `/etc` if the
corresponding subsystem is installed (it is recommended that files be
stored in subdirectories of `/etc/` rather than directly in /etc:

- `csh.login` - Systemwide initialization file for C shell logins (optional)
- `exports` - NFS filesystem access control list (optional)
- `fstab` - Static information about filesystems (optional)
- `ftpusers` - FTP daemon user access control list (optional)
- `gateways` - File which lists gateways for routed (optional)
- `gettydefs` - Speed and terminal settings used by getty (optional)
- `group` - User group file (optional)
- `host.conf` - Resolver configuration file (optional)
- `hosts` - Static information about host names (optional)
- `hosts.allow` - Host access file for TCP wrappers (optional)
- `hosts.deny` - Host access file for TCP wrappers (optional)
- `hosts.equiv` - List of trusted hosts for rlogin, rsh, rcp (optional)
- `hosts.lpd` - List of trusted hosts for lpd (optional)
- `inetd.conf` - Configuration file for inetd (optional)
- `inittab` - Configuration file for init (optional)
- `issue` - Pre−login message and identification file (optional)
- `ld.so.conf` - List of extra directories to search for shared libraries
(optional)
- `motd` - Post−login message of the day file (optional)
- `mtab` - Dynamic information about filesystems (optional)
- `mtools.conf` -  Configuration file for mtools (optional)
- `networks` - Static information about network names (optional)
- `passwd` - The password file (optional)
- `printcap` - The lpd printer capability database (optional)
- `profile` - Systemwide initialization file for sh shell logins (optional)
- `protocols` - IP protocol listing (optional)
- `resolv.conf` -  Resolver configuration file (optional)`
- `rpc` - RPC protocol listing (optional)
- `securetty` - TTY access control for root login (optional)
- `services` - Port names for network services (optional)

---

### important directories

- `/etc/group` - a list of the groups on the system
- `/var/log` - a directory of the system logs.
- `/etc/apt/sources.list` - a list of sources for apt-get
- `/dev/null` - pipe output to get no output.
- `/etc/shells` - contains a list of available shells
- `/etc/init.d/` - contains the service startup scripts for systemd.
- `/etc/systemd/system` -  contains specification files for the services started in init.d. - Like which services that service daemon will want and whether it will continue running or not.

## important files

- `/etc/systemd/logind.conf`- sets systemd params related to suspend and power
        - After making the change to `logind.conf`, run `systemctl restart systemd-logind.service`
        -Doc for [Hybrid Syspend](https://wiki.debian.org/SystemdSuspendSedation)
        -/etc/systemd/system/suspend-sedation.service contains the amount of time to suspend until hibernate.


## Config Files

CPU Settings and Power Settings - `/etc/default/tlp`
Kernal Settings - `/boot/config-#.#.#-#-generic`
Apt Sources - `/etc/apt/sources.list`
Apt Settings - `/etc/apt/apt.conf`




## alias
- `alias`- creates a new command alias.

Global user aliases `/etc/profile.d/alias.sh`

        alias ls='ls --color=auto -la'
        alias lsd='ls -d */'
        alias lsg='cat /etc/group'
        alias cp='cp -vi'
        alias rm='rm -i'
        alias mv='mv -i'

## installing software

| Distribution(s) | Stable Command                     |
| --------------- | ---------------------------------- |
| Ubuntu, Debian  | sudo apt-get install -y powershell |
| CentOS, RedHat  | sudo yum install -y powershell     |
| Fedora          | sudo dnf install -y powershell     |

### dpkg

!!!note Note- The dpkg -i command fails with unmet dependencies. The next command, `apt-get install -f` resolves these issues then finishes configuring the PowerShell package.


### wget

- Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

### curl

### snap

#### installing Snapd

[Instructions](https://docs.snapcraft.io/installing-snapd)
qwd

                # Install PowerShell
                sudo snap install powershell --classic
                # Install PowerShell
                sudo snap install powershell-preview --classic

### apt (et. al.)

CentOS - Yum, Dnf
Debuan - Apt

        sudo apt-get
        sudo nano /etc/apt/sources.list
        sudo apt-get install php5-cli
        sudo apt-get install php5
        php5 -

        sudo apt-get remove powershell
        sudo apt-get install -y powershell
        sudo apt-get install -y powershell
        apt-get install -f #to fix unmet dependencies

### APT Sources

is stored in `/etc/apt/sources.list`

#### upgrade distribution

`sudo apt-get dist-upgrade`

#### Purge

`sudo apt-get purge wolfram-engine`

`sudo apt-get autoremove`

`sudo apt-get update`

`sudo apt-get upgrade`

### Apt-Setting

- Version preferences file `/etc/apt/preferences` - This is where you would specify "pinning", i.e. a preference to get certain packages from a separate source or from a different version of a distribution. Configuration Item: Dir::Etc::Preferences. Fragments: `/etc/apt/preferences.d/`
- Storage area for retrieved package files - `/var/cache/apt/archives/`Configuration Item:
- Dir::Cache::Archives.
- Storage area for package files in transit. - `/var/cache/apt/archives/partial/` - Configuration Item: Dir::Cache::Archives (partial will be implicitly appended)
- Storage area for state information in transit - `/var/lib/apt/lists/partial/` Configuration Item: Dir::State::Lists (partial will be implicitly appended)
- Storage area for state information for each package resource specified in sources.list(5) - `/var/lib/apt/lists/` - Configuration Item: Dir::State::Lists.

### Removing Software

        sudo apt-get remove php5

This only removes the files, not the config files or dependencies.

                sudo apt-get remove --purge php5

Removes the dependencies as well.

                sudo apt-get autoremove

Removes the unused orphans.

### Repositories

                #Enable the "universe" repositories
                sudo add-apt-repository universe

### Installing ATOM

example from a repository

        $ sudo add-apt-repository ppa:webupd8team/atom
        $ sudo apt-get update
        $ sudo apt-get install atom

### Installing Linus Fedora

Download the Fedora.iso
https://getfedora.org/en/workstation/download/
Open Virtual Box


---


## pwd

- `pwd` print working dir


## tree

>-  `tree` prints an ASCII file tree
> 
>       tree −option(s) /optional/directory/to/list
> 
>-  `-a` - **a**ll
>-  `-d` - **d**irectories only
>-  `-L #` - max **L**evels
>-  `P` - **P**attern - lists all files that match a Pattern
>-  `I` - lists all files that *do not* match a Pattern
>-  `-p` - print **p**ermissions for each file (a la ls -a)
>-  `-s` - print the **s**ize of each file (in bytes)
>-  `-h` - print the size of each file (in **h**uman readable format)
> 
## find

- `find` seaches for files, using wildcards or regex.

                find / −name file

This would look for a file named "file" and start at the root directory (it will search all directories
including those that are mounted filesystems).

>-  `−name` -seach name-  case sensitive
>-  `−iname`- find name regardless of case.
>-  `−regex`- to find according to a regexp (case
> sensitive)
>-  `−iregex` to find according to a regexp (case insensitive).
>-  `−exec`- executes a command on the files it

finds (such as moving or removing it or anything else...).

!!!example: For example if you wanted to remove everything it finds then you would use
                find -name *.doc  −exec rm −f

!!! example: To use the −exec option:
      - use `find` to find something,
      - then add the `−exec` option to the end, then:
      - `command_to_be_executed`
         - This is the tool you want to execute on the files find locates.
      - then `'{}'` or `\{\}` (curly brackets) for a placeholder variable.
         - The *curly brackets* "{}" are used to represent the current file found, then continue to sub `{}` for each additional file.     The brackets need protection by backslashes (`\`) or single−quotation marks (`'`), to stop bash expanding
      - then the *arguments*
      - then `';'` or `\;`
         - This is the symbol used by find to signal the end of the commands. It's usually protected by a backslash (\) or quotes to stop bash from trying to expand it.

                  find / −name '*.doc' −exec cp '{}' /tmp/ ';'

      The above command would find any files with the extension '`.doc`' and copy them to your `/tmp` directory.
- `−path`- exclude the particular folder
!!!note: you cannot have a '/' (forward slash) on the end)
- `−prune` - exclude the subdirectories.

!!!example example:
         find / −path '/mnt/win_c' −prune −o −name "string" −print
      This example will search your entire directory tree (everything that is mounted under it) excluding `/mnt/win_c` and all of the subdirectories under `/mnt/win_c`. When using the `−path` option you can use wildcards.

## slocate

- `slocate` outputs a list of all files on the system that match the **pattern,** giving their _full path name_ (it
doesn't have to be an exact match, anything which contains the word is shown).

!!!: Replaces locate
      **Secure locate** (`slocate`) is a replacement for `locate`, both have identical syntax. On most
      distributions `locate` is an `alias` to `slocate`.

Syntax:

      slocate STRING


!!!warning This won't work unless you run either `updatedb` *(as _root_)* or `slocate −u` *(as _root_)* for `slocate` to work.

## whereis

- `whereis` locates the **binary,** **source,** and **manual** page for a particular program, it uses _exact matches_ only,
- if you only know part of the name use `slocate`.

Command syntax:
      whereis program_name


## which

Virtually the same as `whereis`, except it *only finds the executable* (the physical program).
- It **only** looks in the `PATH` (environment variable) of a users shell.
- Use the `−a` option to list all occurances of the particular program_name in your path (so if there is more than one you can see it).

Command syntax:
      which program_name

----

## clear

>-  `clear` - scrolls N lines

## cd

unlike Windows, requires a space after command - `cd ..`

>-  `cd..` produces an error.-> `alias cd..="cd ..`
> 
>-  `cd!` - goes back to the previous directory- like an *undo* for `cd`. (WRONG?)
> 
>-  `cd -` - goes to PWD.  (Go back)

## ls

lists the files in a location

>-  `-l` - long
>-  `-a` - show hidden
>-  `-d`- directories
>-  `-F`- append symbols, such as **"*"** to executables
>-  `-S` - sort by file/dir size
>-  `-R` - show Dir structure
>-  "*.html" - show only html files
>-  `--color=auto` - shows ls in color.

        alias ls=ls --color=auto -la

can be added to bash.rc

                ls -d */
                alias lsd='ls -d */'

Shows directories that are sub directories of current.  If not already present, the second command can be added tp add the `lsd`

- `l`, `la`, and `ll` also work on some systems for `ls`, `-a` and `l`


## cat

>-  `cat` - concatenate- displays, compines, and creates text files.
> 
>-  `cat` (no flags)- allows input - echo whatever is typed. `Cat` will open a simple editor.

        cat list1.txt list2.txt

Concatenates the two files to StdOut.

>-  `-b` adds the line # to non-blank lines
>-  `-n` adds the line # to all lines
>-  `-s` removes multiple consecutive blank lines
>-  `-E` adds $ to each line break

        cat > text.txt

Opens a simple editor, and saves whatever is typed to *text.txt*, [[Ctrl]] + [[d]] exits.

Using `>>` appends.

        cat >> text.txt

        cat list1.txt list2.txt >> out.txt

combines list1 and list2, and then appends the result to out.txt.

        cat list1.txt list2.txt > list2.txt

Produces an error.  The correct way is:

        $cat list1.txt >> list2.txt

## mkdir

- `mkdir` creates a directory.

        mkdir image
        mkdir image/plus
                will produce an error
        mkdir -p image/plus
        mkdir -p image/{john,tom,bob}

- `-p`, `--parents` -  produces the entire path

## rmdir

- `rmdir` - Remove an _empty_ directory **only**. If you want to remove a directory with files in it type "`rm −R directory`" (see [`rm` below](#rm))

*`rmdir` a/b/c/d/e* - only removes `e`
*`rmdir` -p a/b/c/d/e* - removes the entire tree.

>-  `-p`, `--parents` -  produces the entire path
>-  `-v`, `--verbose` - produces the verbose output
>-  `-i`, `--interactive` - interactive

## rm

- `rm` - removes files and directories.

Command syntax:

      rm −options file_or_folder

only need to give a parent dir.

>-  `-p`, `--parents` -  produces the entire path
>-  `-v`, `--verbose` - produces the **v**erbose output
>-  `-i`, `--interactive` - **i**nteractive
>-  `-r`, `-R` - Remove **r**ecursively - to remove everything in sub-directories
>-  `-f` - **f**orce

!!!tip Disabling Aliases (per execution)
      On some systems such as Mandrake an `alias` will send `rm` to `rm −i` (prompting you for every file you wish to delete). To override this use: `\rm −R directory`
      - using the `\` disables the alias for this run only

## cp

`cp` -opts source dest

Command syntax:

      cp −options file_or_files new_location

>-  `-i`, `--interactive` - interactive
>-  `-v`, `--verbose` - produces the verbose output
>-  `-R` - recursive copying
>-  `-u` - only copy if source is newer than the destination or dest doesn't exist.
>-  `-n` - no clobber (over-ridden by i)

if destination doesnt exist, its created.

        cp ../file1.txt ../file2.txt .

   Copies file1 and file2 in parent dir to current dir

        cp file1.txt file2.txt dir1

   Copies file1 and 2 to dir1

      cp file1 file2

Simply copy file1 to file2 (in the same directory).

      cp /tmp/file1 ~/file2 /mnt/win_c

Where the last option is the directory to be copied to. The above example copies two files from different areas of the file system to `/mnt/win_c`

      cp −R directory_and_or_files new_location

This command will copy directories (and all subdirectories) and/or files to *new_location*

!!!: Can be used with wild cards (`*`) to copy multiple files

Note: `cp -nr ./../operator-mono-lig-master/ligature/ ./ligature/` does not do the same as `cp -nr ./../operator-mono-lig-master/ligature/* ./ligature/*` since the first tries to copy the directory, finds it and stops (and does not recurse into the contents)


## mv

`mv` - moves and *renames*

mv -opts src dest

mv file1.txt dir1/

>-  `-v`, `--verbose` - produces the verbose output
>-  `-i`, `--interactive` - interactive

!!!sample: Rename example:
         mv filename1 filename2
      Renames *filename1* to *filename2.*

!!!source: For example typing:
         mv /etc/configuration.txt /home/joe/backupconfig
   This would move the file *"configuration.txt"* to `/home/joe/` and rename it *"backupconfig"*

### rename

[See the related Bash Scripts](#Remamimg_Examples)

`rename` is a **perl** script which can be used to mass rename files according to a regular expression.

An example for renaming all ".JPG" files to ".jpg" is:

      rename 's/\.JPG$/.jpg/' *.JPG

#### Finding rename

You can get rename from various places.  **CPAN Search Site,** _Rename Script Version 1.4_


### mmv

`mmv` is a mass move/copy/renaming tool that uses standard wildcards to perform its functions.


However mmv supports some standard wildcards.
According to the manual the ";" wildcard is useful for matching files at any depth in the directory tree
(ie it will go below the current directory, recursively).

!!!example `mmv *.JPG \#1.jpg`
The first pattern matches anything with a "`.JPG`" and renames each file (the "`#1`" matches the first wildcard) to "`.jpg`".
Each time you use a `\(wildcard)` you can use a `#x` to get that wildcard. Where `x` is a positive number
starting at 1.

[MMV Site](http://linux.maruhn.com/sec/mmv.html)

Also Available:

- mcp (mass copy),
- mad (mass append contents of source file to target name),
- mln (mass link to a source file).

!!!hint A Java alternative to **_mmv_** which runs on both GNU/Linux and Windows is available, [_**Esomaniac**_](http://www.esomaniac.de/)

## ln

`ln` - Create a link to a file. There are two types of links:

_Hard links_

**Hard links** are considered pointers to a file (the number is listed by typing `ls −l`). Each
**hard−link** is a reference to a file.
*The file itself only goes away when all hard−links are deleted.* If you delete the original file and there are hard links to it the original file will remain.

**hard−links** can only exist on the same file−system.

!!!Example
         ln target_name link_name
   Will create a **"hard link"** to `target_name` called `link_name`, you need to delete both of these to remove the file.

_Symbolic links_

**Symbolic links** are created by typing "`ln −s`".

When you remove the original file the symbolic
link becomes broken,
- a symbolic link is similar to a windows "short−cut".
- The advantage of symbolic links is that the target can be to something on another file−system,
- while hard−links can only exist on the same file−system.

!!!example
         ln −s target_name link_name
   This creates a symbolic link to "`target_name`" called "`link_name`", if you delete the original
   file the symbolic link won't work (it becomes a broken link).

## shred

`shred` -- Securely remove a file by overwriting it first.

!!!example
         shred −n 2 −z −v /dev/hda1
      - `-n 2` -- overwrite 2 times with random data
      - `-z` -- (then) - overwrite zeros
      - `-v` -- **v**erbose - show progress
   to partition /dev/hda1

!!!warning Shredding files doesn't work with all filesystems
      Please note (please see the manual and
      info pages for more information) shred does not work correctly on log−structured or journaled filesystems, such as **JFS, ReiserFS, XFS, Ext3** and *many other modern filesystems*

      !!!info Alternatives to using shred
         shred has its disadvantages when run on a filesystem. First of all since it has to be installed you cannot run shred on your operating systems filesystem, you also cannot use shred on a windows machine easily since you cannot install shred on this machine.

         You may like to try alternatives such as the _DBAN project_ that create self−booting ~~floppy disks~~ that can completely erase a machines hard disk.

      !!!info k


## less

- `less` - a simple text viewer.

   see [`nano`](#nano)

- [[Up]] and [[Down]] to move lines up and down.
- [[Space]] -> page down
- [[p]] + [[Shift]]  ([[P]]) - PageUp
- [[g]] + [[Shift]] ([[G]]) - End
- [[g]] -> Top
- [[/]] - forward slash searches forward

        $/book

   Searches forward  for 'book'

- [[n]] - next
- [[?]] - search backwards
- [[q]] - quit

## touch

`touch` - used to change the time stamp or create a new empty file

        $touch file6.txt

Creates `file6.txt`

!!!example `touch` Examples
         touch −t 05070915 my_report.txt[3]
      This command would change the timestamp on my_report.txt so that it would look like you created it at 9:15.
      - The first four digits stand for May 7th (0507), in MM−DD (American style)
      - the last four (0915) the time, 9:15 in the morning.

      Instead of using plain numbers to change the time, you can use options similar to that of the `date` tool.

         touch −d '5 May 2000' some_file.txt
      You can also use `−−date=` instead of `−d`.

      Also have a look at the [date command](#date) for examples on using `−d` and `−−date=` (the syntax for the date part is exactly the same when using `−d` or `−−date`).

Looking at Privledges

        $ touch test.sh
        $ ls -l *.sh
        >>- rw-rw-r-- 1 user user 0 Tod 00 00:00 test.sh

    `touch` creates priviledges that are rw for user and group, and r for others, but not at all execute, in the case of an *.sh (shell script file)

## split

Command syntax:
      split −options file

`split` -Splits files into several smaller files.

- `−b ##`- split into *##* bytes,
- `−k ##` for ## kilobytes,
- `−m ##` - for ## megabytes.

You can use it to split text files and any other files... you can use cat to re−combine the files.
This may be useful if you have to transfer something to floppy disks or you wish to divide text files
into certain sizes.

      split −options file

This will split the input file into *1000 lines of input each (the default...),* and output (, with the input name _file,_ into "`fileaa,fileab,fileac`...etc." until the there is no more of the file left to split.

## nano

`nano` - file editor

- [[Ctrl]] + [[o]] - save (out)
- [[Ctrl]] + [[x]] - exit
- [[Ctrl]] + [[k]] - cut
- [[Ctrl]] + [[u]] - uncut (paste)

## sudo

Do a command as administrator

sudo -i - login as root
sudo -s - login as root as well.  [$] changes to [#] to indicate superuser mode.

## set

`set -x` - print each command (de-alias) before running
`set +x` - to turn off.

`set bell-style none`

`xset -b` (xwindows)

## history

        history n - lists the last n commands
        history

## script

`script` - write a log of bash to file.

## top

Check which programs are using memory or cpu

        $top

Gives a table of all the processes and processes (PID).

[[s]] to change the update time in seconds.Default update **s**peed is 3 seconds.

[[i]] - toggle filter idle processes

[[k]] - **kill** the command - by entering process id.

[[q]] - **quit** the top program

## echo

`echo` repeats whatever follows.

`echo *text*` == `echo "*text*"` - the double quotes are not necessary but are good form.

`-e` - allows the use of escaped text using backslash.

    \t - tab
    \n - new line
    \c - Dont do new line

!!!example: Will expand a command but not execute it- can be used to see what will be executed.
                echo rm -R *

### Using variables

        $myvar="Andy"
        $echo $myvar

note no spaces in the declaration statement.

        x=10
        echo "the value of x is $x"

### escaping text

Use the `-e` flag

        $echo -e 'some \text'
        some    ext

`-e` - allows the use of escaped text using backslash.

    \t - tab
    \n - new line
    \c - Dont do new line

?Unsure of the significance of single quotes in the example above

### Controlling the Prompt

Bash examines the value of the array variable PROMPT_COMMAND just before printing each primary prompt. If any elements in PROMPT_COMMAND are set and non-null, Bash executes each value, in numeric order, just as if it had been typed on the command line.

In addition, the following table describes the special characters which can appear in the prompt variables PS0, PS1, PS2, and PS4: 

- `\a` - A bell character. 

- `\d` - The date, in "Weekday Month Date" format (e.g., "Tue May 26"). 

- `\D{format}` - The format is passed to `strftime(3)` and the result is inserted into the prompt string; an empty format results in a locale-specific time representation. The braces are required. 

- `\e` - An escape character. 

- `\h` - The hostname, up to the first ‘.’. 

- `\H` - The hostname. 

- `\j` - The number of jobs currently managed by the shell. 

- `\l` - The basename of the shell’s terminal device name. 

- `\n` - A newline. 

- `\r` - A carriage return. 

- `\s` - The name of the shell, the basename of `$0` (the portion following the final slash). 

- `\t` - The time, in 24-hour HH:MM:SS format. 

- `\T` - The time, in 12-hour HH:MM:SS format. 

- `\@` - The time, in 12-hour am/pm format. 

- `\A` - The time, in 24-hour HH:MM format. 

- `\u` - The username of the current user. 

- `\v` - The version of Bash (e.g., 2.00) 

- `\V` - The release of Bash, version + patchlevel (e.g., 2.00.0) 

- `\w` - The current working directory, with `$HOME` abbreviated with a tilde (uses the `$PROMPT_DIRTRIM` variable). 

- `\W` - The basename of $PWD, with $HOME abbreviated with a tilde. 

- `\!` - The history number of this command. 

- `\#` - The command number of this command. 

- `\$` - If the effective uid is 0, #, otherwise $. 

- `\nnn` - The character whose ASCII code is the octal value nnn. 

- `\` - A backslash. 

- `[` - Begin a sequence of non-printing characters. This could be used to embed a terminal control sequence into the prompt. 

- `]` - End a sequence of non-printing characters. 



### Keep the cursor on the same line

Use `\C`, requires `-e` to allow escaped chars

echo -e "Enter the File Name : \c"

## File permissions

Basically its {`d`/`-`}(`u`ser)`rwx`(`g`roup)`rwx`( `o`thers)`rwx` w/ `-` turning it off.
Access Levels
- None (-)
- read (r)
- write (w)
- execute (x)

You can see these by using the ls -l Unix command.

0123456789

`drwxr-xr-x`

`-rwxr-xr-x`

`-rwxrwxrwx`

The first character represents the entry type.  The entry type for a directory is 'd'.

All files have a hyphen (-) as their entry type.  The remaining nine characters indicate the permissions themselves in 3 groups of three.

1 through 3 show user (u) permissions;
4 through 6 are group (g) permissions;
7 through 9 are other (o) permissions (users who are not the owner and are not members of the group own the file/directory, a.k.a. "the world").

can also take away the read and write permissions by doing the following:

chmod o-rw /home/yourusername

### CHMOD

`chmod o+x filename` - chmod changes the permissions, `o` is for other's group (the third), `+` adds the permission, and `x` adds the execute permission

to give the world permission to read and write to your home directory, then you would use the command `chmod o+rw /home/youruserna`

other examples

- `chmod g+x filename` (add group execute perm.)
- `chmod g-wx filename` (remove group write and exec.)
- `chmod ug=rwx filename` (change user and group to read, write and execute)
- `chmod ugo-rwx` or `chmod a-rwx` remove read write exec from all three groups.
- `chmod u+rw,g=rw,o+r filename` commma to chain multiple commands.
- `chmod +x filename` gives the execute permission to everyone

```sh
ls -l

-rwxrwxrwx 1
```

- first char is the type `-` = normal file, `d` = directory, `b` = binary, `c` = character special file.
- first group of 3 is user
- second group of three is the group
- third is the others permissions.
- this is followed by a number- the number of symbolic links to a file.

### directory permissions

        mkdir dir
        ls -ld dir
        touch dir/{file1,file2,file3}
        ls dir/
            file1 file2 file3
        chmod u-w dir
        cd dir/
        touch file4
            **error
        chmod u+w dir
        chmod u-r dir

with out read permissions - then the user cannot even see the file.

`ls` produces an error.

    chmod u=rw,u-x dir

`ls -l dir` will show the names of the file but no other info. `ls dir/` produces errors but shows the folders.  THe first command just produces '?' in the responses.

### Octal file permissions.

numerical representation of permissions

| users | group | others |
| ----- | ----- | ------ |
| r w x | r w x | r w x  |
| + + + | + - + | + + -  |
| 1 1 1 | 1 0 1 | 1 1 0  |
| 4 2 1 | 4 0 1 | 4 2 0  |
| 7     | 5     | 6      |

0 - [---] - 000
1 - [--x] - 001
2 - [-w-] - 010
3 - [-wx] - 011
4 - [r--] - 100
5 - [r-x] - 101
6 - [rw-] - 110
7 - [rwx] - 111

- `chmod 000 filename` this gives no permission to anyone
- `chmod 755 filename` user has r/w/x but group and others have only rx.

0-7- in 3 separate digits, one for each of the 3 groups.

chmod ABC -filename

## kill

*kill* command kills processes.

        kill -KILL *pid*

forces the process to exit- powerful

        kill -9 *pid*

this executes a sigkill

        ps -ux

Lists all the running processes.

## ps

list the processes

- `ps -ux` show the user's processes

- `ps -aux` show ALL user's processes

- `ps -U *username*` - show a specific users processes

- `ps -C *process name*` - lists all the instances of a process given a name

## which

used to return the path name of a command,

        which ls

gives the location of the ls program.

In Bash scripting you may need to use the full location of a comman- eg /bin/ls

        which alias
        which firefox

## whatis

Gets the 'one line' descrption from the man pages.

        whatis firefox
        whatis cat

## whereis

        whereis - locate the binary, source, and manual page files for a command

                OPTIONS
                -b     Search for binaries.

                -m     Search for manuals.

                -s     Search for sources.

                -u     Only show the command names that have unusual entries.  A command is said to be unusual if it does not have just one entry of each explicitly requested type.  Thus 'whereis -m -u *' asks for those files in the  current
                        directory which have no documentation file, or more than one.

                -B [list] - Limit the places where whereis searches for binaries, by a whitespace-separated list of directories.

                -M [list] - Limit the places where whereis searches for manuals and documentation in Info format, by a whitespace-separated list of directories.

                -S [list] - Limit the places where whereis searches for sources, by a whitespace-separated list of directories.

examples:

`whereis -bm ls tr -m gcc` - searches for "ls" and "tr" binaries and man pages, and for "gcc" man pages only.   The search restrictions (options -b, -m and -s) are cumulative and apply to the subsequent name patterns on the command line.

`whereis -m ls -M /usr/share/man/man1 -f cal` - searches for "ls" man pages in all default paths, but for "cal" in the `/usr/share/man/man1` directory only. The options -B, -M and -S reset search paths for the subsequent name patterns.


---
---

## Bash Scripting

`nano myscript.sh` opens a new file named myscript in the nano editor.

First line is usually a **hashbang**

        $which bash
        /bin/bash

The first line gives the location of the bash.

        1- #! /bin/bash
        2- ls -l

        $./myscript.sh
            **permission denied
        $chmod +x

Trying to run initially is not allowed, but adding the execute permissions allows it to run

        #! /bin/bash

        STRING="Hello World"
        echo $STRING

### Remamimg Examples

Bash scripting is one way to rename files. You can develop a set of instructions (a script) to rename
files. Scripts are useful if you don't have mmv or rename...
One way to this is shown below:

```bash
for i in *.JPG;
do mv $i `basename $i JPG`jpg;
done;
```
The first line says find everything with the ".JPG" extension (capitals only, because the UNIX system is case sensitive).

The second line uses basename (type man basename for more details) with the '$i' argument. The '`$i`' is a string containing the name of the file that matches.

The next portion of the line removes the *JPG* extension from the end and adds the *jpg* extention to each file.

The command `mv` is run on the output.

An alternative is:

```bash
for i in *.JPG;
do mv $i ${i%%.JPG}.jpg;
done
```

The above script renames files using a built−in bash function. For more information on bash scripting
you may like to see the [_advanced bash scripting guide,_ authored by Mendel Cooper.](http://www.tldp.org/LDP/abs/html/)

---
---

## Administration

### System

#### time

If you are looking for how to change the time please refer to [date](#date)

`time` is a utility to **measure the amount of time it takes a program to execute.**

It also measures CPU usage and displays statistics.

Use `time −v` (verbose mode) to display even more detailed statistics about the particular program.

!!!Example usage:
      time program_name options

#### /proc

The files under the `/proc` **(process information pseudo file−system)** show various information about
the system. Consider it a window to the information that the kernel uses.


!!!example Examples:
      1. Displays information about the CPU.

               cat /proc/cpuinfo

      2. View information about what kernel−modules are loaded on your system.

               less /proc/modules

#### dmesg

Command syntax:

      f −options /dev/hdx

`dmesg` can be used to print (or control) the " **kernel ring buffer".**

`dmesg` is generally used to print the
contents of your _bootup messages_ displayed by the kernel. This is often useful when debugging problems.

Simply type:

      dmesg
      df

Displays information about the space on mounted file−systems.

- `−h` - have df list the space in a 'human readable' format.

The latter part is optional, you can simply use `df` with or without options to list space on all file−systems.


#### who

`who` - Displays information on which users are logged into the system including the time they logged in.

Command syntax:

      who

#### w

`w` - Displays information on who is logged into the system **and what they are doing (ie. the processes they are running)**. It's similar to `who` but displays slightly different information.

Command syntax:

      w

!!!note The `w` command
      The `w` command displays the output of the `uptime` command when you run this command. You could use the `w` command instead of `uptime`.

#### users

`users` - Very similar to `who` except it **only prints out the user names** who are currently logged in. *(Doesn't need or take any options).*

Command syntax:

      users

#### last

`last` - Displays records of when various users have logged in or out.

This includes information on when the
computer was rebooted.

Command syntax:

      last

#### lastlog

`lastlog` - Displays a **list of users and what day/time they logged into the system.**

Command syntax:

      lastlog

#### whoami

`whoami` - Tells the user who they are currently logged in as, this is normally the usename they logged in with
**but can be changed with commands like [su](#su)).**

*whoami* does not need or take any options.

Command syntax:

      whoami

#### uptime

`uptime` - Print how long the computer has been "up", how long the computer has been running.

It also displays the number of users and the processor load (how hard the CPU has been working...).

Command syntax:

      uptime

See also: [`w`](#w)

#### uname

`uname` is used to print _information on the system_ such as **OS type, kernel version et cetera.**

Command syntax:

      uname −options

- `−a`- print all the available information.
- `−m`- print only information related to the machine itself.
- `−n`- print only the machine hostname.
- `−r`- print the release number of the current kernel.
- `−s`- print the operating system name
- `−p`- print the processor type.

#### xargs

`xargs` - is a command used to run other commands as many times as necessary, this way it prevents any kind of overload... When you run a command then add a "| xargs command2". The results of command1 will be passed to
command2, possibly on a line−by−line basis or something similar.

!!!Example Examples:
            ls | xargs grep work
      The first command will list the files in the current directory. For each line of output of `ls`, `xargs` will run `grep` on that particular line and look for the string *"work".* The output have the each time `grep` is executed on a new line, the output would look like:

            file_name: results_of_grep

      If grep didn't find the word then there would be no output

      If it had an error then it will output the error.

      Obviously this isn't very useful (you could just do):

               grep 'word' *


xargs also takes various options:
- `−nx`- will group the first x commands together
- `−lx`- xargs will execute the command for every x number of lines of input
- `−p`- prompt whether or not to execute this particular string
- `−t`- (**t**ell) be verbose, echo each command before performing it
- `−i`- will use substitution similar to `find`'s `−exec` option, it will execute certain commands on something.

!!!examples More Examples:
            s dir1 | xargs −i mv dir1/'{}' dir2/'{}'

      The `{}` would be substituted for the current input (in this example the current `file/directory`) listed within the directory.

      The above command would move every file listed in `dir1` to `dir2`. Obviously this command won't be too useful, it would be easier to go to `dir1` and `type mv * ../dir2`

      Here is a more useful example:

            \ls *.wav | xargs −i lame −h '{}' '{}'.mp3

      This would find all wave files within the current directory and convert them to `mp3` files *(encoded with lame)* and append a `".mp3"` to the end of the filename, unfortunately it doesn't remove the `.wav`and so its not too useful...but it works.

### useradd

    creates a new user

-m - create a home directory for the new user
-s - assings the user to use which default shell- usually followed by the path to the shell `/bin/bash` etc.
-g - which group to assign the user to. `users` is typical
-c - add comments to the user.
-G -assign the user defined group (see man)

`sudo useradd mark -m -s /bin/bash -g users -c "some comments"`

this creates a user without a password.  But cannot login

### passwd

`sudo passwd mark` changes the passwd for mark

`sudo passwd` changes the current user password

`passwd` changes the root password

### userdel

Remove a user from a system

list the users:

        ls /home/

remove a user `sudo userdel username`

removes the username and password, but wont delete a users home directory.

To delete home directory as well

`sudo userdel -r tom`

removes the user directory as well.  May throw an errow with "mailspool"

or `sudo rm -r /home/tom/`

---

### group management

#### groups

`groups` - lists the groups the current user is connected to.

#### see all the groups

`cat /etc/group`

lists all the groups that are available to the groups and shows the users that are attached to the group.

#### groupadd

`groupadd` - adds a group to the end of the groups file

        sudo groupadd Java
        sudo groupadd Cpp
        sudo groupadd Database

 adds a group to the end of the `/etc/group`

## groupdel

`groupdel` - deletes a group

        sudo groupdel Cppp
        cat /etc/group

## Group assignment

Add to the group

        sudo  gpasswd -a username groupname

Remove from the group

        sudo gpasswd -d username groupname

## Bash.rc

bash.rc is a script that is executed each time a terminal that is opened.

        cd ~
        ls -a
        nano bash.rc
        gedit bash.rc

Used for setting alias, setting up environment variables, or listing Git repositories.

### environment variables

The environment is implemented as strings that represent key-value pairs. If multiple values are passed, they are typically separated by colon (:) characters. Each pair will generally look something like this:

      KEY=value1:value2:...

If the value contains significant white-space, quotations are used:

      KEY="value with spaces"

The keys in these scenarios are variables. They can be one of two types, **environmental variables** or **shell variables.**

**Environmental variables** are variables that are defined for the _current shell_ and _are inherited_ by any child shells or processes. **Environmental variables** are used to _pass information_ into processes that are spawned from the shell.

**Shell variables** are variables that are **contained exclusively within the shell** in which they were set or defined. They are often used to keep track of _ephemeral data,_ like the _current working directory._

   !!!note note: By convention, these types of variables are usually defined using _all capital letters._
         This helps users distinguish environmental variables within other contexts.

### env or printenv

`env` or `printenv` will print the environment variables.

The difference between the two commands is only apparent in their more specific functionality. For instance, with `printenv`, you can *request the values of individual variables:*

        printenv SHELL

On the other hand, `env` let's you modify the environment that programs run in by passing a set of variable definitions into a command like this:

        env VAR1="blahblah" command_to_run command_options

### set

The `set` command can be used for this. `set` without any additional parameters,  will list all **shell variables, environmental variables, local variables, and shell functions:**

This is usually a huge list. You probably want to pipe it into a pager program

        set | less

We can clean up the output by specifying that set should *operate in POSIX mode,* which won't print the shell functions. We can execute this in a sub-shell so that it does not change our current environment:

        (set -o posix; set)

This will list all of the environmental and shell variables that are defined.

        comm -23 <(set -o posix; set | sort) <(env | sort)

This will likely still include a few environmental variables, due to the fact that the set command outputs quoted values, while the printenv and env commands do not quote the values of strings.

!!!question - Unsure how this command works...

#### Common Environmental and Shell Variables

Some environmental and shell variables are very useful and are referenced fairly often.
Here are some common environmental variables that you will come across:

- `SHELL`: This describes the shell--in most cases, this will be **bash** but other values can be set if you prefer other options.
- `TERM`: This specifies the type of terminal to emulate when running the shell. Different hardware terminals can be emulated based on requirements.
- `USER`: The current logged in **user.**
- `PWD`: The *current working directory.*
- `OLDPWD`: The *previous working directory.* This is kept by the shell in order to switch back by running `cd -`.
- `LS_COLORS`: This defines color codes that are used to optionally add colored output to the ls command.
- `MAIL`: The path to the current user's mailbox.
- **`PATH`**: A list of directories that the system will check when looking for commands. When a user types in a command, the system will check directories in this order for the executable.
- `LANG`: The current language and localization settings, including character encoding.
- `HOME`: The current user's home directory.
`_`: The most recent previously executed command.
In addition to these environmental variables, some shell variables that you'll often see are:

-`BASHOPTS`: The list of options that were used when bash was executed. This can be useful for finding out if the shell environment will operate in the way you want it to.
-`BASH_VERSION`: The version of bash being executed, in human-readable form.
-`BASH_VERSINFO`: The version of bash, in machine-readable output.
-`COLUMNS`: The number of columns wide that are being used to draw output on the screen.
-`DIRSTACK`: The stack of directories that are available with the pushd and popd commands.
-`HISTFILESIZE`: Number of lines of command history stored to a file.
-`HISTSIZE`: Number of lines of command history allowed in memory.
-`HOSTNAME`: The hostname of the computer at this time.
-`IFS`: The internal field separator to separate input on the command line. By default, this is a space.
-`PS1`: The primary command prompt definition. This is used to define what your prompt looks like when you -start a shell session. The PS2 is used to declare secondary prompts for when a command spans multiple lines.
-`SHELLOPTS`: Shell options that can be set with the set option.
-`UID`: The UID of the current user.


## df

`df` - lists the amount of free disk space on the system.

- `-h` - human readable - puts units after the numbers.

## du

`du` is used to display the disk space used by file or directories.

        cd ~/Downloads
        du
        du -sh /etc/
        sudo du -sh /etc/ **for permission errors


lists all the space taken up by the current directory.


- `-h` - human readable - puts units after the numbers.
- `-s` - **summary** - does not list all the files in a directory.
- `-k` - **k**ilobytes
- `-m` - **m**egabytes
- `-s` - **s**ummarizes each arg (prints totals)
- `-c` - **c**umulative total after completion

Command syntax:

      du −options file_directory_or_files

Examtple:

      du −hs *

This command will list the size of all files in the current directory and the size of subdirectories in human−readable sizes.

If given file permission errors- can use:

        sudo du -sh

To list the space used by the file.

## free

- `free` lists the  memory statistics **(total, free, used, cached, swap).** and swap space used and free.

- `-b` - byte
- `-k` - kilobytes
- `-m` - megabytes
- `-g` - gigabytes
- `-tera` - terabytes.
- `-h` - human readable - puts units after the numbers.
- `-t` - option to display totals of
everything

!!!example Examples:
         free -h
         free −tm

      The **first** will disp mem values in closest human unit.

      The **secomd** will display the memory usage including totals in megabytes

## watch

- `watch` can run linux commands at a regular interval

        watch free -m

Runs `free` every 2.0 seconds (by default)

[[Ctrl]] + [[c]] to exit

        watch -n 1 free -m
        watch -n 0.5 free -m
        watch -df

Runs `free` every 1.0 seconds, 0.5 seconds.

## head

- `head` can be used to output the first part of a file- by default, will print the first 10 lines.

        cd /va/log
        head dmesg

Shows the first 10 lines of the dmesg file.  See [Tail](##tail) for flags

## tail

- `tail` - likewise shows the last (10) lines of a file.

- `-n#` - e.g. '-n3' shows the last 3 lines.
- `-#` - also e.g. '-3' shows the last 3 lines.
- `-f` - **f**ollow - updates the tail/head display as it changes.

        tail -5 -f dmesg

Shows the last 5 lines of dmesg.

        head dmesg kern.log
        tail -3 dmesg kern.log

will show multiple logs sequentially.
## file

- `file` - Attempts to find out what type of file it is, for example it may say it's: **binary,** an **image** file (e.g. **jpeg,** **bmp** etc.), **ASCII text,** **C header** file and many other kinds of files.

Command syntax:

      file file_name

- `-z` - decompress (look inside zipped files)
- `-Z` - decompress (look inside zipped files) but dont give compression info
- `-p` - **p**reserve access time
- `-l` - **l**ist match strength
- `-d` - prints **d**ebug messaging to stderr.
- `-b` - brief output

## stat

- `stat` - Tells you detailed information about a file, including inode number creation/access date. Also has
many advanced options and uses.

For simple use type:

      stat file

## dd

Command syntax:

      dd if=/dev/xxx of=/dev/xxx bs=xxxx count=x

- `dd` - Copies data on a very low level and can be used to create copies of disks and many other things (for example CD image files).

dd can also perform conversions on files and vary the block size used when writing the file.

Command syntax, note the block size and count are optional and you can use files instead of devices...

!!!Warning The command dd is used to work on a very low level.
   It can be used to overwrite important information such as your master−boot record or various important sections
   of your hard−disk. Please be careful when using it (especially when working with devices instead of files)




## find

- `find` command is used to find a folder.

        find /dir -name filename
        find /home/alt -name test.sh
        find /home/alt -name test.*
        find /home/alt -name *.txt
        find /home/alt -name file1*

Accepts wildcards `*`.

        find / -name dmesg

Start in root and look for file dmesg.  This will give a bunch permission denied errors. Use `sudo` to avoid this:

        sudo find / -name dmesg

- `-name` - searches by name
- `-mtime #` - searches by number of days prior. e.g.

        find ~ -mtime 1
        find ~ -mtime -1
        find ~ -mtime +1

First two are equivalent, last one is 1 day in the future.


## wc

- `wc` gives the number of lines/words/characters in a file
ca
        wc test.txt

- `-c` - gives the number of characters
- `-l` - gives the number of lines
- `-w` - gives the number of words
- `-L` - gives the length of the Longest line.

## cal

- `cal` command gives a conventially formatted calendar on the command line.

- `ncal` - gives the transposed version of cal.  (weekday on the rows.)

- `cal 2019` -- gives the whole year
- `cal 3` - gives the calendar for march (cur year)
- `cal -3` - gives the last mo, current and next month.
- `cal -1` - is the essential default.

## date

- `date` command displays or sets the date

        date
        date -s "11/20/2003 12:48:00"
        date +%d%h%y
        date +%d-%h-%y
        date +%d/%h/%y


- `-s`, `--set` **s**ets the date.
- `-d STRING` **d**isplay the time specified by STRING, not *now.*
- `-u`, `--utc` - display UTC

- `+%m` - Specifies the month number
- `+%h` - Specifies the abbreviated month (Jan-Dec)
- `+%B` - Specifies the full month name
- `+%d` - Specifies the day o the month
- `+%y` - Specifies the fyear
- `+%H,+%M,+%S` - Specifies the hour, minute, second
- `+%D` - Specifies the date as **mm/dd/yy**
- `+%T` - Specifies the time as **hh:mm:ss**

can also output in iso8601, rfc2822, rfc-3339 and other formats.  See `man` pages.

---

## awk

gawk - pattern scanning and processing language - is the GNU Project's implementation of the AWK programming language.

This is useful for grabbing columns of tabular data.

```sh
space_free=$( df -h | awk '{ print $5 }' | sort -n | tail -n 1 | sed 's/%//' )
#breaking it down
df -h # drive free space - human readable values (tabular data)
awk '{ print $5 }' # gets the 5th column
sort -n #sort descending order
tail -n 1 # get the last one
sed 's/%//'

```

As each input record is read, gawk splits the record into fields, using the value of the FS variable as the field separator. If FS is a single character, fields are separated by that character. If FS is the null string, then each individual character becomes a separate field. Otherwise, FS is expected to be a full regular expression. In the special case that FS is a single space, fields are separated by runs of spaces and/or tabs and/or newlines.

!!!Example:  The Following code gets the wifi networks available, then pipes it to `grep` which finds the active one marked by an asterisk, then uses the default pattern matching, where each spaced field gives another value.

                local signal=$(nmcli device wifi | grep * | awk '{print $8}')

        The first two commands give:

                *       Timmons               Infra  1     130 Mbit/s  44      ▂▄__  WPA2

        Thus awk '{print $8}` prints the 8th field.

Awk can get very complex

                Usage: awk [POSIX or GNU style options] -f progfile [--] file ...
                Usage: awk [POSIX or GNU style options] [--] 'program' file ...
                POSIX options:		GNU long options: (standard)
                        -f progfile		--file=progfile
                        -F fs			--field-separator=fs
                        -v var=val		--assign=var=val
                Short options:		GNU long options: (extensions)
                        -b			--characters-as-bytes
                        -c			--traditional
                        -C			--copyright
                        -d[file]		--dump-variables[=file]
                        -D[file]		--debug[=file]
                        -e 'program-text'	--source='program-text'
                        -E file			--exec=file
                        -g			--gen-pot
                        -h			--help
                        -i includefile		--include=includefile
                        -l library		--load=library
                        -L[fatal|invalid]	--lint[=fatal|invalid]
                        -M			--bignum
                        -N			--use-lc-numeric
                        -n			--non-decimal-data
                        -o[file]		--pretty-print[=file]
                        -O			--optimize
                        -p[file]		--profile[=file]
                        -P			--posix
                        -r			--re-interval
                        -s			--no-optimize
                        -S			--sandbox
                        -t			--lint-old
                        -V			--version

## Less

Less is used to view man,  its like linux notepad.

[Less Doc](https://linux.die.net/man/1/less)
[SS64 Brief Notes](https://ss64.com/bash/less.html)

| frwrd/down/next | back/up/prev |    | action                                                           |
|-----------------|--------------|----|------------------------------------------------------------------|
| g   <           | G   >        |    | TO beginning or End                                              |
| f {space}       | b            | *  | move one window                                                  |
| z               | w            | ** | move (N1) lines (Nominally 1 window), #z sets N1                 |
| d               | u            | ** | move (N2) lines (Nominally 1/2 window), #d/u sets N2             |
| e j {Enter}     | y k          | *  | move one *(N) line                                               |
| {R arrow}       | {L arrow}    |    | Scroll Sideways                                                  |
| /pattern        | ?pattern     |    | Start a search                                                   |
| n               | N            |    | Go to the next found item                                        |
| M{letter}       | m{letter}    |    | Mark position (A...B...C.etc.) at bottom / top of page. ***      |
| '$              | '^           |    | (Mark syntax) Go to End/Beginn.                                  |
| t               | T            | *  | Go to the next (*Nth) Tag                                        |
| {  (  [         | ]  )  }      | *  | Find the next (*Nth) open/close bracket. Search is rev for Open. |
| :n              | :p           | *  | Examine the next (*Nth) file from command line ****              |


(*) the command can be preceded by an integer to repeat the command N times.  E.g. `5e` moves forward 5 lines.
(**) the command can be preceeded by a number and repeated N times, and also this value is remembered for future commands.  `d` moves forward "1/2 window", but `10d` moves forward 10 lines, and all future presses of `d` by itself will then move 10 lines.  Half height and full height store separate values of N.  You can then type `3z` and have the window advance move just 3 lines, it doesnt have to be more.  Paired commands share a value.

#### Marking

(***) M{letter} marks the bottom and `m` marks at the top.  You can go to a marker by pressing single quote `'` and the desired letter.  `''` (Double single quote) goes back a mark (also `[Ctrl]x, [Ctrl]x`).  Deleta a mark with `[Esc]M<letter>`

Upper case and lower case are distinct.  Some are predefined.

#### Searching

`F` - to the end, `[Esc]F` advances towards end but stops if search string is found. You can also search adjacent files.  See help.

supposedly typing /pattern or ?pattern kicks off a search but it didnt work.  Can be (Needs to be?) preceeded by `!` Non, `*` search multiple files `@` start at first (/) or last (?) file, `[Ctrl]K` highlight only, `[Ctrl]R` Dont use regular expressions.
`/pattern` - Search forward, `?pattern` search back, `n` - next find, `N` Previous.  `&pattern` to show only matching lines.

Maybe its not working bc it expects a regexp.

#### Moving files

`e:` will change to another file.  So will `[Ctrl]X,[Ctrl]V`

`:x` goes to the first file, and `:d` deletes the current file.  `:f` and `=` print the cile name.

`p(%)` or rather `p##` goes to the `##%` point in a file. p50 goes to the halfway point
`r` - rerun screen



`R arrow` - scroll right
`L arrow` - scroll left
`h` open help

#### Options

Miscellaneous Commands:
  -flag           Toggle a command line option [see OPTIONS below].
  --name          Toggle a command line option, by name.
  _flag           Display the setting of a command line option.
  __name          Display the setting of an option, by name.
  +cmd        Execute the less cmd each time a new file is examined.

  !command    Execute the shell command with $SHELL.
  |Xcommand   Pipe file between current pos & mark X to shell command.
  v           Edit the current file with $VISUAL or $EDITOR.
  V           Print version number of "less".
  [flag]^P (CONTROL-P)  Suppress change message

OPTIONS:
Most options can be changed either on the command line, or from within less by using the - or -- command.
Options can be given in one of two forms: either a single character preceded by a -, or a name preceeded by --.

| Short             | Long                                      | Breif Description

                    FINDING
 `-a`                `--search-skip-screen`                       Forward search, skips current screen.
 `-g`                `--hilite-search`                            Highlight only last match for searches.
 -G                 --HILITE-SEARCH                            Don't highlight any matches for searches.
` -#g                                                          `Opens at a particular line number
 -h[n]              --max-back-scroll=n                        Backward scroll limit.
 -I, -I             --ignore-case,  --IGNORE-CASE              Ignore case in searches.
                                                               Ignore case in searches and in search patterns.
 -j[n]              --jump-target=n                            Screen position of target lines.
 -p[pattern]        --pattern=pattern                          Start at pattern (from command line).
 -t[tag]            --tag=tag                                  Find a tag.
 -T[tagsfile]       --tag-file=tagsfile                        Use an alternate tags file.
 -y[n]              --max-forw-scroll=n                        Forward scroll limit.
                    DISPLAY
 -c                 --clear-screen                             Repaint by scrolling/clearing.
 -C                 --CLEAR-SCREEN                             Repaint by scrolling/clearing.
 -D[xcolor]         --color=xcolor                             Set screen colors. (MS-DOS only)
 -m, -M             --long-prompt, --LONG-PROMPT               Set prompt style.
 -n, -N             --line-numbers,                            Use line numbers.
                    --LINE-NUMBERS
 -P[prompt]         --prompt=prompt                            Define new prompt.
 -r, -R             --raw-control-chars,  --RAW-CONTROL-CHARS  Output "raw" control characters.
 -s                 --squeeze-blank-lines                      Squeeze multiple blank lines.
 -S                 --chop-long-lines                          Chop long lines

 -w, -W             --hilite-unread, --HILITE-UNREAD           Highlight first new line after forward-screen
 -[z]n              --window=n                                 Set size of window.
 -~                 --tilde                                    Don't display tildes after end of file.
                    FILE OPTIONS:
 -bn                --buffers=n                                Number of buffers.
 -B                 --auto-buffers                             Don't automatically allocate buffers for pipes.
 -f                 --force                                    Force open non-regular files.
 -k[filename]       --lesskey-file=filename                    Use a lesskey file.
 -o[filename] , -O  --log-file=filename                        Copy to log file (standard input only).
 -Ofilename         --LOG-FILE=filename                        Copy to log file (unconditionally overwrite).
                    MISC OPTIONS:
 -?                 --help                                     Display help (from command line).
 -d                 --dumb                                     Dumb terminal.
 -e, -E             --quit-at-eof, --QUIT-AT-EOF               Quit at end of file.
 -F                 --quit-if-one-screen
 -J                 --status-column                            Show Status Column on Left
 -K                 --quit-on-intr
 -q, -Q             --quiet or --silent                        Quiet the terminal bell.
 -u, -U             --underline-special, --UNDERLINE-SPECIAL   Change handling of backspaces.
 -V                 --version                                  Display the version number of "less".
 -xn,...            --tabs=n,...                              Set tab stops
 -X                 --no-init                                  Don't use termcap init/deinit strings.
 -" [c[c]], -dqcc   --quotes=[c[c]]                            Set shell quote characters.
 -L                 --no-lessopen                              Ignore the LESSOPEN environment variable

 -#                 --shift                                    Specifies the default number of positions to scroll horizontally
                    --no-keypad                                Disables sending the keypad initialization and deinitialization strings to the terminal
                    --follow-name
 --                                                            marks the end of option arguments. Any arguments following this are interpreted as filenames.
 +                                                            | The remainder of that option is taken to be an initial command

## Network Config

### ifconfig

- `ifconfig` - (Interface Config)-

usually primary is `eth0` - esp for \wired connections.

Link encap - connection method
HWaddr - MAC Address
inet addr - IP Address
Broadcast IP -
Subnet Mask
ipV6 Addr:

Then RX Packets/TX Packets and errors.

to get a specific interface

                ifconfig eth0

#### Turn on or off a specific interface

                sudo ifconfig eth0 down
                sudo ifconfig eth0 up

                Then this disables/enables the interface.
---

### NetworkManager

Seems to have replaced ifconfig

see `man NetworkConfig` or `man nmcli`, or `man nmcli-examples`

`NetworkManager --print-config`

gives the following config statement:
`/etc/NetworkManager/NetworkManager.conf (lib: 10-dns-resolved.conf, 20-connectivity-pop.conf, 20-connectivity-ubuntu.conf, no-mac-addr-change.conf) (etc: 10-globally-managed-devices.conf, default-wifi-powersave-on.conf)`

Reviewing this-

it appears `Network Manager` calls `/etc/NetworkManager/dispatcher.d/99tlp-rdw-nm` -> which has a few basic scripts and loads two readonly libraries.

Theses are "/usr/share/tlp/tlp-functions &&  tlp-rf-func"

`tlp-functions` has a bunch of constants in it.

It has **CONFFILE**=`/etc/default/tlp`

!!!important - this file actually contains file saving values- such as default off times. tlp - Parameters for power saving

        `/etc/default/tlp`

 - See full explanation: http://linrunner.de/en/tlp/docs/tlp-configuration.html

`nmcli c show "Andrew's iPhone"` has many intersting values

GENERAL.CON-PATH:                       /org/freedesktop/NetworkManager/Settings/4

but this fixed it:

`nmcli -p c delete "Andrew's iPhone"`



### nmcli

OPTIONS
>-  `-a`, `--ask` - ask for missing parameters
>-  `-c`, `--colors` auto|yes|no - whether to use colors in output
>-  `-e`, `--escape` yes|no - escape columns separators in values
>-  `-f`, `--fields` <field,...>|all|common - specify fields to output
>-  `-g`, `--get-values` <field,...>|all|common  shortcut for `-m tabular -t -f`
>-  `-h`, `--help` - print this help
>-  `-m`, `--mode` tabular|multiline - output mode
>-  `-o`, `--overview` - overview mode
>-  `-p`, `--pretty` - pretty output
>-  `-s`, `--show-secrets` - allow displaying passwords
>-  `-t`, `--terse` - terse output
>-  `-v`, `--version` - show program version
>-  `-w`, `--wait` <seconds> - set timeout waiting for finishing operations

OBJECT
- g[eneral] - NetworkManager's general status and operations
- n[etworking] - overall networking control
- r[adio] - NetworkManager radio switches
- c[onnection] - NetworkManager's connections
- d[evice] - devices managed by NetworkManager
- a[gent] - NetworkManager secret agent or polkit agent
- m[onitor] - monitor NetworkManager changest


To see examples `man nmcli-examples`

```bash

nmcli device wifi list


nmcli device wifi
IN-USE  SSID                  MODE   CHAN  RATE        SIGNAL  BARS  SECURITY
        Timmons               Infra  9     195 Mbit/s  100     ▂▄▆█  WPA1
        Timmons               Infra  1     130 Mbit/s  67      ▂▄▆_  WPA2
*       Timmons               Infra  149   405 Mbit/s  65      ▂▄▆_  WPA1
        NewThermostat_654394  Infra  6     65 Mbit/s   60      ▂▄▆_  --
```

nmcli -o g
STATE                   CONNECTIVITY  WIFI-HW  WIFI     WWAN-HW  WWAN
connected (local only)  limited       enabled  enabled  enabled  enabled

`nmcli c --help` -  show connection help
`nmcli c show` - shows all connections
`nmcli c show "Andrew iPhone"` - shows all the paramters

#### Example 2. Showing general information and properties for a Wi-Fi interface

$ nmcli -p -f general,wifi-properties device show wlan0

#### Example 3. Listing NetworkManager polkit permissions

$ nmcli general permissions

#### Example 4. Listing NetworkManager log level and domains

$ nmcli general logging

#### Example 5. Changing NetworkManager logging

$ nmcli g log level DEBUG domains CORE,ETHER,IP
$ nmcli g log level INFO domains DEFAULT

#### Example 6. Activating a VPN connection profile requiring interactive
       password input

$ nmcli --ask con up my-vpn-con

#### Example 7. Adding a bonding master and two slave connection profiles

$ nmcli con add type bond ifname mybond0 mode active-backup
$ nmcli con add type ethernet ifname eth1 master mybond0
$ nmcli con add type ethernet ifname eth2 master mybond0

#### Example 8. Adding a team master and two slave connection profiles

$ nmcli con add type team con-name Team1 ifname Team1 config team1-master-json.conf
$ nmcli con add type ethernet con-name Team1-slave1 ifname em1 master Team1
$ nmcli con add type ethernet con-name Team1-slave2 ifname em2 master Team1

The team configuration for the master is read from `team1-master-json.conf file`. Later, you can change the configuration with modify command (`nmcli con modify Team1 team.config team1-master-another-json.conf`).

You will activate the whole setup by activating both slaves:

$ nmcli con up Team1-slave1
$ nmcli con up Team1-slave2

#### Example 9. Adding a bridge and two slave profiles

$ nmcli con add type bridge con-name TowerBridge ifname TowerBridge
$ nmcli con add type ethernet con-name br-slave-1 ifname ens3 master TowerBridge
$ nmcli con add type ethernet con-name br-slave-2 ifname ens4 master TowerBridge
$ nmcli con modify TowerBridge bridge.stp no

#### Example 10. Adding an ethernet connection profile with manual IP
       configuration

```sh
$ nmcli con add con-name my-con-em1 ifname em1 type ethernet \
ip4 192.168.100.100/24 gw4 192.168.100.1 ip4 1.2.3.4 ip6 abbe::ca
fe
$ nmcli con mod my-con-em1 ipv4.dns "8.8.8.8 8.8.4.4"
$ nmcli con mod my-con-em1 +ipv4.dns 1.2.3.4
$ nmcli con mod my-con-em1 ipv6.dns "2001:4860:4860::8888 2001:4860:4860::8844"
$ nmcli -p con show my-con-em1
```

#### Example 14. nmcli usage in a NetworkManager dispatcher script to make Ethernet and Wi-Fi mutually exclusive

```sh
#!/bin/bash
export LC_ALL=C

enable_disable_wifi ()
{
result=$(nmcli dev | grep "ethernet" | grep -w "connected")
if [ -n "$result" ]; then
        nmcli radio wifi off
else
        nmcli radio wifi on
fi
}

if [ "$2" = "up" ]; then
enable_disable_wifi
fi

if [ "$2" = "down" ]; then
enable_disable_wifi
fi

```

### TLP

Power options

see `/etc/default/tlp` and ``

!!!tip Hint use `tlp-stat -p` to show the active driver and available governors.
# Important: powersave for intel_pstate and ondemand for acpi- power efficient for *almost all* workloads and therefore kernal  and most distributions have chosen them as defaults. If you want to change,you should know what you're doing! You *must* disable your distribution's governor settings or conflicts will occur.
#CPU_SCALING_GOVERNOR_ON_AC=powersave
#CPU_SCALING_GOVERNOR_ON_BAT=powersave

## Other

### tar

>-  `tar` -  stands for **Tape Archiving**
> 
>-  `-c` - **c**reate
>-  `-v` - **v**erbose
>-  `-f` - **f**ile
>-  `-x` - e**x**tract
>-  `-z` - **z**ip file (gz)


To create:

                mkdir test
                touch test/{f1,f2,f3,f4}
                tar -cvf test.tar test

To Extract

                tar -xvf test.tar

To create tar.gz (`z` flag must come after `c` flag)

                tar -cvfz test.tar.gz test

To Extract a tar.gz

                tar -xzvf test.tar.gz

#### Main operation mode:

>-  _`-A`,_ `--catenate`, `--concatenate`- **append** tar files to an archive
>-  _`-c`,_ `--create` - **create** a new archive
>-  `-d`, `--diff`, `--compare` - find differences between archive and file system
>-  `--delete` - delete from the archive (not on mag tapes!)
>-  _`-r`,_ `--append` - **append** files to the end of an archive
>-  _`-t`,_ `--list` - **list** the contents of an archive
>-  `--test-label` - test the archive volume label and exit
>-  `-u`, `--update` - only append files newer than copy in archive
>-  _`-x`,_ `--extract`, `--get` - **extract** files from an archive
> 
#### Compression options:

>-   `-a,` `--auto-compress` - use archive suffix to determine the compression program
>-   `-I,` `--use-compress-program=PROG` filter through PROG (must accept `-d)`
>-   `-j,` `--bzip2` - filter the archive through bzip2
>-   `-J,` `--xz` - filter the archive through xz
>-  `--lzip` - filter the archive through lzip
>-  `--lzma` - filter the archive through xz
>-  `--lzop` - filter the archive through lzop
>-  `--no-auto-compress` - do not use archive suffix to determine the compression program
>-   `-z,` `--gzip,` `--gunzip,` `--ungzip`   filter the archive through gzip
>-  `--zstd` - filter the archive through zstd
>-   `-Z,` `--compress,` `--uncompress`   filter the archive through compress

### xz

Compress or decompress FILEs in the .xz format.

>-  `-z,` ``--compress`` - force compression
>-  `-d`, `--decompress` - force decompression
>-  `-t`, `--test` - test compressed file integrity
>-  `-l`, `--list` - list information about .xz files
>-  `-k`, `--keep` - keep (don't delete) input files
>-  `-f`, `--force` - force overwrite of output file and (de)compress links
>-  `-c`, `--stdout` - write to standard output and don't delete input files
>-  `-0` ... `-9` - compression preset; default is 6; take compressor *and* decompressor memory usage into account before using 7-9!
>-  `-e`, `--extreme` - try to improve compression ratio by using more CPU time; does not affect decompressor memory requirements
>-  `-T`, `--threads=NUM` - use at most NUM threads; the default is 1; set to 0 to use as many threads as there are processor cores
>-  `-q`, `--quiet` - suppress warnings; specify twice to suppress errors too
>-  `-v`, `--verbose` - be verbose; specify twice for even more verbose
>-  `-h`, `--help` - display this short help and exit
>-  `-H`, `--long-help` - display the long help (lists also the advanced options)
>-  `-V`, `--version` - display the version number and exit

With no FILE, or when FILE is -, read standard input.

        xz -d pygobject-3.32.2.tar.xz
        xz -d FILENAME

!!!note Note you can think of `awk` (gawk) and `grep` as manipulating tabular data- awk gets the columns, grep gets the rows.


## grep

`grep` - is used to search text in a file.'

   Full Documentation
       A [complete manual](https://www.gnu.org/software/grep/manual/) is avail‐
       able.  If the info and grep programs are  properly  installed  at  your
       site, it can be shown with the command

              info grep

example `nmcli device wifi` prints out the wifi networks.  Piping `grep *` to it finds the line that starts with an asterisk- which is the one that is connected.

another- `ls -l | grep "\.txt$"` runs `ls -l` then pipes it to grep- which will print the lines using the regex `\.txt$`

Command Syntax

                grep -opts "PATTERN" FILE

Case sensitive by default.  Replacing `FILE` with `-` uses StdInput.

A pattern can use `*`, `?`, and `[...]` as wildcards, and `\` to quote a wildcard or backslash character liqterally.


!!!example Example:
                man grep > file.txt
                (1) grep "options" file.txt
                (2) grep "some options" file.txt
                (3) grep "some options" file1.txt file2.txt file3.txt file4.txt
                (4) grep "some options" ./*
                (5) grep "some options" *
                (6) grep -nv "options" file.txt
                (7) grep "word" -
                (8) gzip -cd foo.gz | grep --label=foo -H something

        All the lines containing 'options' are printed.  As the second example shows, the result can search for a phrase - not just a word. THe third example demonstrates searching multiple folders. Examples (4) and (5) demonstrate using wildcards to search multiple folders at once. (6)- gives an example showing line numbers and inverting the results (lines that do NOT contain "options"). (7) is an example of searching StdIn using grep. (`-`)

The  colors are  defined  by  the  environment  variable  GREP_COLORS.

        --color[=WHEN] {never|always|auto}


>-  `-i` - Case **i**nsensitive
>-  `-n` - Prints the line **n**umber]
>-  `-v` - In**v**erts the search criteria
>-  `--help` - help
>-  `-c` - **C**ount the number of matching lines (`-v` = or non-matching)
>-  `-l` - just list the files that contain a match
>-  `-L` - list the files that Do not contain a match.
>-  `-m #` - a max count after which to stop
>-  `-H` - print the file name (default with more than one file) in which match was found
>-  `-h` - DON'T print the file name in which match was found
>-  `-a` - treat binary file as if it were ASCII
>-  `-r` - recurse through each file if input arrives at a directory.  Same as `-d recurse`
>-  `-R` - Same as above- but follow Symbolic links
> 
> 
>-  `-A #` - Number of lines to show AFTER a match
>-  `-B #` - Number of lines to show BEFORE a match
>-  `-C #` - Number of lines to show CENTERING a match
> 
>-  `-D ACTION`{read|skip} - how to treat devices
>-  `-d ACTION`{read|skip|recurse} - how to treat directories `-d recurse` == `-r`
> 
>-  `--exclude=GLOB` - exclude files that match the GLOB.  Only uses the basename
>-  `--include=GLOB` - only include files that match the GLOB.  Only uses the basename
>-  `--exclude-from=FILE` - exclude files that match the GLOBs giben in FILE.  Only uses the basename, same as above, but reads a file.
>-  `--exclude-dir=GLOB` - exclude dirs that match the GLOB.
> 
> the variant programs `egrep`, `fgrep` and `rgrep` are the same as `grep -E`, `grep -F`, and `grep -r`,
> 
>-  `-E`, `--extended-regexp` Interpret  PATTERNS  as  _extended regular expressions (EREs)_
>-  `-F`, `--fixed-strings`- Interpret PATTERNS as _fixed strings,_ not regular expressions.
>-  `-G`, `--basic-regexp` - Interpret PATTERNS  as  _basic  regular  expressions  (BREs)_        - **This is the default.**
>-  `-P`, `--perl-regexp` - Interpret   PATTERNS   as  _Perl-compatible  regular  expressions (PCREs)._
>-  This option is experimental _

 grep understands three different versions of regular expression syntax:  **“basic”  (BRE),**  **“extended” (ERE)** and **“perl” (PCRE).**  In GNU grep there is no difference in available functionality between basic and  extended syntaxes.  In other implementations, basic regular expressions are less powerful.

The  following  description  applies  to  extended  regular expressions;  differences  for basic regular expressions are summarized afterwards.

Perl-compatible  regular  expressions   give   additional functionality,  and are documented in pcresyntax(3) and pcrepattern(3), but work only if PCRE is available in the system.

## sed

   sed - stream editor for filtering and transforming text

                SYNOPSIS - sed [OPTION]... {script-only-if-no-other-script} [input-file]...

                DESCRIPTION - Sed  is a stream editor.  A stream editor is used to perform basic text transformations on an input stream (a file or input from a pipeline).  While in some ways similar to an editor which permits scripted edits (such as ed), sed works by making only one pass over the input(s), and is consequently more efficient.  But it is sed's ability to filter text in a pipeline which particularly distinguishes it from other types of editors.

>-  `-n`, `--quiet`, `--silent` - suppress automatic printing of pattern space
>-  `--debug` - annotate program execution
>-  `-e [script]`, `--expression=script` - add the script to the commands to be executed
>-  `-f [script-file]`, `--file=script-file` - add the contents of script-file to the commands to be executed
>-  `--follow-symlinks` - follow symlinks when processing in place
>-  `-i[SUFFIX]`, `--in-place[=SUFFIX]` - edit files in place (makes backup if SUFFIX supplied)
>-  `-l` N, `--line-length=N` - specify the desired line-wrap length for the `l' command
>-  `--posix` - disable all GNU extensions.
>-  `-E`, `-r`, `--regexp-extended` - use extended regular expressions in the script (for portability use `POSIX -E`).
>-  `-s`, `--separate` - consider files as separate rather than as a single, continuous long stream.
>-  `--sandbox` - operate in sandbox mode (disable e/r/w commands).
>-  `-u`, `--unbuffered` - load minimal amounts of data from the input files and flush the output buffers more often
>-  `-z`, `--null-data` - separate lines by NUL characters


If no `-e`, `--expression`, `-f`, or `--file` option is given, then the first non-option argument is taken as the sed script to interpret.  All remaining arguments are names of input files; if no input files are specified,  then  the standard input is read.

[GNU sed home page](https://www.gnu.org/software/sed/)

`ls -l | sed -e "s/[aeio]/u/g` -first the command ls -l is executed, and it's output, instead of being printed, is sent (piped) to the sed program, which in turn, prints what it has to. Which is using regex finds "a, e, i, or o" and replaces with "u"

An example for cleaning dates

```sh
#!/bin/bash
# A date is the first command line argument
clean_date=$( echo $1 | sed 's/[ /:\^#]/-/g' )
echo $clean_date
```



## RegEx (Linux)

- `.` (dot) - any char
- `[]` a range of possible chars for a single match
        - `^` invert the range (NOT e.g `[^0-9]`)
        - predefined ranges:
                - `[:alnum:]` -  alphanumeric
                - `[:alpha:]` - alpjhabetic
                - `[:cntrl:]` - ?Control characters
                - `[:digit:]` - digits
                - `[:graph:]` - ?
                - `[:lower:]` - lowercase
                - `[:print:]` - ?
                - `[:punct:]` - punctuation
                - `[:space:]` - white space
                - `[:upper:]` - upper case
                - `[:xdigit:]` -

!!!note Note: (Note that the brackets in these class names are part of the symbolic names, and must be  included in  addition  to the brackets delimiting the bracket expression.)
                        [^[:alnum:]-$#]
                        ([:alpha:]*) #//wrong- still needs brackets.

!!!note Note: Most meta-characters lose their special meaning inside bracket  expressions.
    - To  include  a  literal  [[`]`]] (closing square bracket) place  it **first** in the list.
    - To include a literal [[^]] (caret) place it **anywhere but first.**
    - To include a literal [[-]] (hypen/dash) place it **last.**


!!!warning Interesting Note on Locales (source _man grep_ *"Character Classes...")*
         For example, in the default C locale, [a-d] is equivalent to [abcd].  Many locales sort characters in dictionary   order,  and  in  these  locales  [a-d]  is  typically  notequivalent to [abcd]; it might be equivalent to [aBbCcDd], for example.

>-  `?` - The preceding item is optional and matched at most once.
>-  `*` - The preceding item will be matched zero or more times.
>-  `+` - The preceding item will be matched one or more times.
>-  `{n}` - The preceding item is matched exactly n times.
>-  `{n,}` - The preceding item is matched n or more times.
>-  `{,m}` - The  preceding  item  is matched at most m times.  This is a GNU
> extension.
>-  `{n,m}` - The preceding item is matched at least n  times,  but  not  more
> than m times.
>-  `$` anchors at the end of the line
>-  `^` anchors at the beginning of the line.


## netstat

`netstat` - see who is connected

>-  `-a` - see all connections
>-  `-t` - see TCP connections
>-  `-u` - see UDP connections
>-  `-x` - see UNIX ports of connections
>-  `-n` - see numeric ports of connections
>-  `-c` - see continuously updated connections
>-  [[CTRL]] + [[C]] to quit.
>-  `-l` - see listening connections
>-  `-s` - see statistics on the connections
>-  `-p` - see PID of each connection
>-  `-lt` - see listening TCP connections
>-  `-ie` - interface extended
>   - same as `ifconfig`

            netstat -a | less` ([[q]] to quit)
            netstat -an | grep ';80'

## SSH

ssh- secure shell- remote administration of Linux Machines.

Check if `ssh` is installed

        ssh

Check if `ssh-server` is installed (locally)

        ssh localhost

On error- install

        sudo apt-get install openssh-server
        sudo service ssh status
        (on success)->        ssh localhost
        yes-> ubuntu pwd

Configuration file for SSH :  `sudo gedit /etc/ssh/sshd_config`

- Can change SSH port (default 22)

## SCP

    `scp` - secure copy - used for backing up files remotely

Command Usage

            scp username hostIP filename
            scp                                                  ifconfing (on dest computer)
                get ip, username

            On source:

            scp hello.sh USERNAME@IP.AD.DR.ESS:/home/USERDIR
                then asked for password (remote)

Transfer multiple files over scp

    mkdir test123
    touch test13/{f1.txt,f2.txt,f3.txt}
    ls test123/
    scp -r test123 USERNAME@192.168.1.40:/home/USERNAME
        requests USERNAME's password


from the dest back to source.

        scp USERNANE@192.168.1.200:/home/DESTUSER/scala-2.12.3.deb /home/test/Desktop
        **Reests password for remote server

Above:
         scp -r RemoteUser@RemoteIP:Remote/Path/To/File.txt /Local/Path

- `-P #` - give a port name
- `-i PATH/TO/KEYS` -  public private key storage.
- `-r` - recursive

## wget

                wget -q https://packages.microsoft.com/config/ubuntu/14.04/packages-microsoft-prod.deb


## dpkg

                sudo dpkg -i packages-microsoft-prod.deb

## interesting commands

print all the colors

`for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"`


### basename

`basename` Print NAME with any leading directory components removed. If specified, also remove a trailing SUFFIX.

                Usage:          basename NAME [SUFFIX]
                or:                     basename OPTION... NAME...

                Mandatory arguments to long options are mandatory for short options too.
                -a, --multiple       support multiple arguments and treat each as a NAME
                -s, --suffix=SUFFIX  remove a trailing SUFFIX; implies -a
                -z, --zero           end each output line with NUL, not newline
                --help     display this help and exit
                --version  output version information and exit

                Examples:
                        basename /usr/bin/sort          -> "sort"
                        basename include/stdio.h .h     -> "stdio"
                        basename -s .h include/stdio.h  -> "stdio"
                        basename -a any/str1 any/str2   -> "str1" followed by "str2"

other example:

```sh
    for d in ./ligature/*/ ; do
        build_font $(basename $d)
    done

for value in $1/*.html
do
cp $value $1/$( basename -s .html $value ).php
done

```
### wc

`wc` word count -- print newline, word, and byte counts for each file

Synopsis
wc [OPTION]... [FILE]...
wc [OPTION]... --files0-from=F
Description

Print newline, word, and byte counts for each FILE, and a total line if more than one FILE is specified. With no FILE, or when FILE is -, read standard input.

`-c`,3 `--bytes`
print the byte counts
`-m`, `--chars`
print the character counts
`-l`, `--lines`
print the newline counts
`--files0-from=F`
read input from the files specified by NUL-terminated names in file F; If F is `-` then read names from standard input
`-L`, `--max-line-length`
print the length of the longest line
`-w`, `--words`
print the word counts
`--help`
display this help and exit
`--version`
output version information and exit


## ls tools

`lsmod` - print the available kernal modules.

See also `insmod` `rmmod` `modprobe`

`lsblk` -List the block devices (eg hard drives)

`lsusb` - list usb devices
`lspci` - list the pci devices
`lscpu` - get cpu info



### tlp-status

Power status

`tlp-rdw` = tlp -radio device wizard

# tlp - Parameters for power saving
# See full explanation: http://linrunner.de/en/tlp/docs/tlp-configuration.html

see `/etc/defaults/tlp/` for system settings

this suggests the following tools:

`hdparm`- get/set hard disk parameters
`ethtool` - a very low level detailed ethernet adapter tool
`iwconfig` - a lowlevel wireless config tool- to change mode, freq, channel, bitrate, power, txpower, modulation etc.
`iw` - show / manipulate wireless devices and their configuration
modprobe - Add and remove modules from the Linux Kernel
logger - enter messages into the system log
udevadm - udev management tool. t controls the
       runtime behavior of systemd-udevd, requests kernel events, manages the event
       queue, and provides simple debugging mechanisms.
udev - Dynamic device management
nmcli - command-line tool for controlling NetworkManager
NetworkManager - network management daemon
dbus-send - Send a message to a message bus see [here]( http://www.freedesktop.org/software/dbus/) for big picture (man)
systemd, init - systemd system and service manager
flock - manage locks from shell scripts


## GNU CoreUtils (list)
>-  `arch`
>-  `base64`
>-  `basename`
>-  `cat`
>-  `chcon`
>-  `chgrp`
>-  `chmod`
>-  `chown`
>-  `chroot`
>-  `cksum`
>-  `comm`
>-  `cp`
>-  `csplit`
>-  `cut`
>-  `date`
>-  `dd`
>-  `df`
>-  `dir`
>-  `dircolors`
>-  `dirname`
>-  `du`
>-  `echo`
>-  `env`
>-  `expand`
>-  `expr`
>-  `factor`
>-  `false`
>-  `flock`
>-  `fmt`
>-  `fold`
>-  `groups`
>-  `head`
>-  `hostid`
>-  `id`
>-  `install`
>-  `join`
>-  `link`
>-  `ln`
>-  `logname`
>-  `ls`
>-  `md5sum`
>-  `mkdir`
>-  `mkfifo`
>-  `mknod`
>-  `mktemp`
>-  `mv`
>-  `nice`
>-  `nl`
>-  `nohup`
>-  `nproc`
>-  `numfmt`
>-  `od`
>-  `paste`
>-  `pathchk`
>-  `pinky`
>-  `pr`
>-  `printenv`
>-  `printf`
>-  `ptx`
>-  `pwd`
>-  `readlink`
>-  `realpath`
>-  `rm`
>-  `rmdir`
>-  `runcon`
>-  `sha*sum`
>-  `seq`
>-  `shred`
>-  `sleep`
>-  `sort`
>-  `split`
>-  `stat`
>-  `stty`
>-  `sum`
>-  `sync`
>-  `tac`
>-  `tail`
>-  `tee`
>-  `test`
>-  `timeout`
>-  `touch`
>-  `tr`
>-  `true`
>-  `truncate`
>-  `tsort`
>-  `tty`
>-  `uname`
>-  `unexpand`
>-  `uniq`
>-  `unlink`
>-  `users`
>-  `vdir`
>-  `wc`
>-  `who`
>-  `whoami`
>-  `yes`

Other GNU Programs

cpio a tool for creating and extracting archives, or copying
files from one place to another.  It handles a number of cpio formats as well as reading and writing tar files.

dc GNU Reverse Polish Desktop calculator.

`findutils` - contains `find` and `xargs`- `locate` has been split off.

`gawk` - awk

`gnupg` gnu pgp application

`gnuplot` commandline based plot app

`grep` see main article


Debian Utils

`add-shell`
`installkernel`
`ischroot`
`remove-shell`
`run-parts`
`savelog`
`tempfile`
`which`

`fdisk`, `sfdisk`, `cfdisk` - partitioning utilities
`file` - file type guesser
`info` - the doc format for debian
`install-info` - utility creates the index of all installed documentation in info format and makes it available to info readers.
`ping` (`iputils-ping`) - sends ICMP ECHO_REQUEST packets to a host in order to test if the host is reachable via the network.
`tracepath` (`iputils-tracepath`) -  tracepath utility is similar to the traceroute utility, but also attempts to discover the MTU of the path.


## Interesting Installed Programs (3rd Party)

atop - full screen top like viewer
chkservice - is an ncurses-based tool for managing systemd units from the terminal.
`htop` - like top but with scrolling
`hwdata` -hardware id and config data
`hwinfo` - hardware detection tool from SuSE
`iotop` - does for I/O usage what top(1) does for CPU usage
`powertop` - diagnose issues with power consumption and power management
`powertop-1.13` - finds the software component(s) that make your laptop use more power than necessary while it is idle
        despite the common name `powertop` these are different programs...
`lnav` - ncurses-based log file viewer
clex
cpufrequtils
iptstate
irqtop
itop
kernaltop
ncdu
nethogs
qtop
tig
vifm
vim
yacpi
btscanner
mutter

| package  | description                                                                |
| -------- | -------------------------------------------------------------------------- |
| mc       | A text-mode full-screen file manager                                       |
| sudo     | A program to allow limited root privileges to users                        |
| vim      | Unix text editor Vi IMproved, a programmers text editor (standard version) |
| vim-tiny | Unix text editor Vi IMproved, a programmers text editor (compact version)  |
| emacs25  | GNU project Emacs, the Lisp based extensible text editor                   |
| w3m      | Text-mode WWW browsers                                                     |
| gpm      | The Unix style cut-and-paste on the text console (daemon)                  |

attr- file system attributes
        - getfattr
        - setfattr
configure-debian
fd (fd-musl) -  runs a simplified find command


catdoc - reads msword files and outputs it as standard text
xls2csv - converts xls file to csv files
catppt - extracts textual info from ppt files.
`potrace` is a utility for tracing a bitmap, which means, transforming a bitmap into a smooth, scalable image (BMP-> EPS)

catfish - searching tool

changetrack -  monitors for changes in files.  Allows reconstructing what changed if the computer stops working.

cheese - web cam camera app

cherrytree - binary note taking app

bspwm -  binary space partitioning window manager
compiz - linux desktop visual effects

`gip` - ip address calculator
`iproute2` suite is a collection of utilities for networking and
traffic control.
`iptables` is the userspace command line program used to configure the Linux packet filtering ruleset.
`Nmap` - utility for network exploration or security auditing. Supports ping scanning, many port
scanning techniques, version detection (determine service protocols and application versions listening behind ports), and TCP/IP fingerprinting (remote host OS or device identification). Nmap also offers flexible target and port specification, decoy/stealth scanning, sunRPC scanning, and more.

glade -  develop GTK+ user interfaces

`hdparm` - low level HDD tools

`inxi` system info script for getting support- summarizes system hardware

  `inxi -Fxxxz`

  Provides a summary of the system, often for sharing on forums and such.

  - `-F` is "all",  each x is a verbosity level
  - `-H` will provide help
  - `-A` audio
  - `-C` cpu
  - `-D`, -Dd Disk / optical
  - `-G` graphics
  - `-m` memory
  - `-M`
  - `-N` network
  - `-Nn` advanced network
  - `-P`
  - `-R`
  - `-S` system

  `inxi -G`- Show the graphics info


`irqbalance` - Daemon to balance interrupts across multiple CPUs, better performance and IO balance on SMP systems (systems with multi-core processors), as interrupts will typically only be serviced by the first core.
`lspci` & `setpci` (`pciutils`) - This package contains various utilities for inspecting and setting of devices connected to the PCI bus.
`procps` -provides command line and full screen utilities for browsing `procfs`, a "pseudo" file system dynamically generated by the kernel to provide information about the status of entries in its process table (such as whether the process is running, stopped, or a "zombie").
        - `free`
        - `kill`
        - `pkill`
        - `pgrep`
        - `pmap`
        - `ps`
        - `pwdx`
        - `skill`
        - `slabtop`
        - `snice`
        - `sysctl`
        - `tload`
        - `top`
        - `uptime`
        - `vmstat`
        - `w`
        - `watch`
        -`psmisc` - This package contains miscellaneous utilities that use the proc FS:
                - `fuser` - identifies processes that are using files or sockets.
                - `killall` - kills processes by name (e.g. "killall -HUP named").
                - `peekfd` - shows the data traveling over a file descriptor.
                - `pstree` - shows currently running processes as a tree.
                - `prtstat` - print the contents of /proc/<pid>/stat





`powerdevil` -  allows you to define your all power settings.



`j4-dmenu-desktop` is a replacement for i3-dmenu-desktop. start an application using dmenu.
`plank` - simple dock


`jq` is like sed for JSON data – you can use it to slice and filter and map and transform  data with the same ease that sed, awk, grep and friends let you play with text.

`KDialog` allows you to display dialog boxes from shell scripts.

## Core Utils

`initramfs` - init ram fileystem - makes linux kernal bootable
`Plymouth`-  provide an attractive graphical animation in place of the text messages that normally get shown during boot.
`pm-utils` - This package provides simple shell command line tools to suspend and
hibernate your computer.
`rfkill` -  for accessing the Linux rfkill device interface, used to enable and disable wireless networking devices (WLAN, Bluetooth and mobile broadband).
`rtkit` - RealtimeKit is a D-Bus system service that changes the scheduling policy of user processes/threads to `SCHED_RR` (i.e. realtime scheduling mode) on request.
`sensible-utils` -  used by programs to sensibly select and spawn an appropriate browser, editor, or pager. The specific utilities included are: `sensible-browser`, `sensible-editor` and `sensible-pager`
`tasksel`, a simple interface for users who want to configure their system to perform a specific task.
`ufw` - Uncomplicated FireWall is a front-end for iptables, to make managing a Netfilter firewall easier. It provides a command line interface with syntax similar to OpenBSD's Packet Filter. It is particularly well-suited as a host-based firewall.


        readonly TPACPIBAT=$LIBDIR/tpacpi-bat # LIBDIR is initialized by main program

        readonly TPACPIDIR=/sys/devices/platform/thinkpad_acpi
        readonly SMAPIDIR=/sys/devices/platform/smapi
        readonly ACPIBATDIR=/sys/class/power_supply

        readonly RE_TPSMAPI_ONLY='^(Edge( 13.*)?|G41|R[56][012][eip]?|R[45]00|SL[45]10|T23|T[346][0123][p]?|T[45][01]0[s]?|W[57]0[01]|X[346][012][s]?( Tablet)?|X1[02]0e|X[23]0[01][s]?( Tablet)?|Z6[01][mpt])$'
        readonly RE_TPACPI_ONLY='^(13.*|(Edge )?E[1345][234567][05][ps]?|Helix.*|L[45][34567]0|P[75][01][s]?|S2|(Edge )?S[245][345][01]*|T[45][34567][01][psu]?|W5[345][01][s]?|X1 Carbon.*|X2[34567]0[s]?( Tablet)?|.*Yoga.*)$'
        readonly RE_TPSMAPI_AND_TPACPI='^(X1|X220[s]?( Tablet)?|T[45]20[s]?|W520)$'
        readonly RE_TP_NONE='^(L[45]20|SL[345]00|X121e)$'

        readonly NETD=/sys/class/net
        readonly BLUETOOTHD=/sys/class/bluetooth
        readonly PCID=/sys/bus/pci/devices
        readonly PCIDRV=/sys/bus/pci/drivers
        readonly I915D='/sys/module/i915*/parameters'
        readonly RADD=/sys/module/radeon
        readonly DMID=/sys/class/dmi/id/
        readonly CPU_BOOST_ALL_CTRL=/sys/devices/system/cpu/cpufreq/boost
        readonly INTEL_PSTATED=/sys/devices/system/cpu/intel_pstate
        readonly CPU_MIN_PERF_PCT=$INTEL_PSTATED/min_perf_pct
        readonly CPU_MAX_PERF_PCT=$INTEL_PSTATED/max_perf_pct
        readonly CPU_TURBO_PSTATE=$INTEL_PSTATED/no_turbo
        readonly AHCID=$PCID'/*/ata*'
        readonly BLOCKD='/sys/block/sd*'

        readonly USBD=/sys/bus/usb/devices/
        readonly USB_TIMEOUT=2
        readonly USB_TIMEOUT_MS=2000
        readonly USB_WWAN_VENDORS="0bdb 05c6 1199"
        readonly USB_DONE=usb_done

        readonly DOCKGLOB="/sys/devices/platform/dock.?"

        readonly MOD_MSR="msr"
        readonly MOD_TEMP="coretemp"
        readonly MOD_TPSMAPI="tp_smapi"
        readonly MOD_TPACPI="acpi_call"

        readonly PWRRUNFILE=$RUNDIR/last_pwr
        readonly LOCKFILE=$RUNDIR/lock
        readonly LOCKTIMEOUT=2

        readonly RDW_NM_LOCK="rdw_nm"
        readonly RDW_DOCK_LOCK="rdw_dock"
        readonly RDW_LOCKTIME=2


        readonly STATEDIR="/var/lib/tlp"
        readonly RFSTATEFILE=$STATEDIR/rfkill-saved
        readonly BAYSTATEFILE=$STATEDIR/bay-saved

        readonly DISK_NOP_WORDS="_ keep"
        readonly DEFAULT_DISK_DEVICES="sda"
        readonly DEFAULT_DISK_IO_SCHEDULER="cfq"
        readonly DEFAULT_PM_DRIVER_BLACKLIST="amdgpu nouveau nvidia radeon"

## Interesting commands

`find /usr -xdev -maxdepth 10 -regex '.*system76.*' -print`

` $ watch 'tail FILE | sort | uniq -c | sort -gr'`

`exo-preferred-applications`




## Historu Commands

[History Commands](https://tldp.org/LDP/abs/html/histcommands.html)


The Bash shell provides command-line tools for editing and manipulating a user's _command history_. This is primarily a convenience, a means of saving keystrokes.

Bash history commands:

        1.  **history**

        2.  **fc**


        bash$ **history**
        1  mount /mnt/cdrom
        2  cd /mnt/cdrom
        3  ls
        ...

Internal variables associated with Bash history commands:

        1.  $HISTCMD

        2.  $HISTCONTROL

        3.  $HISTIGNORE

        4.  $HISTFILE

        5.  $HISTFILESIZE

        6.  $HISTSIZE

        7.  $HISTTIMEFORMAT (Bash, ver. 3.0 or later)

        8.  !!

        9.  !$

        10.  !#

        11.  !N

        12.  !-N

        13.  !STRING

        14.  !?STRING?

        15.  ^STRING^string^


Unfortunately, the Bash history tools find no use in scripting.


```sh

#!/bin/bash
# history.sh
# A (vain) attempt to use the 'history' command in a script.

history                      # No output.

var=$(history); echo "$var"  # $var is empty.

#  History commands are, by default, disabled within a script.
#  However, as dhw points out,
#+ set -o history
#+ enables the history mechanism.

set -o history
var=$(history); echo "$var"   # 1  var=$(history)

bash$ **./history.sh**
(no output)
```

[Advancing in the Bash Shell – ${me:-whatever}](http://samrowe.com/wordpress/advancing-in-the-bash-shell/)



> 
> Here’s an example of history output:
> 
> [View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)
> 
> 1.  190 ps -axu | grep htt
>     
> 2.  191 /www/bin/apachectl start
>     
> 3.  192 vi /usr/local/lib/php.ini
>     
> 4.  193 cat /www/logs/error\_log
>     
> 5.  194 ps -auxw | grep http
>     
> 6.  195 pwd
>     
> 

!! tells bash "repeat the last command I entered." 


!xyz will allow you to run the last command beginning with xyz that you typed. 

> ### :p isn’t just an emoticon
> 
> If you need to be very sure of the command you’re targeting, :p can be a huge help.

 !xyz:p will print the command that would be executed rather than executing it. :p is also clever enough to add the printed command to your history list as the last command executed (even though it didn’t execute it) so that, if you decide that you like what was printed, a !! is all you need to make it happen,


> Bash provides a couple of methods for searching the command history. Both are useful in different situations. The first method is to simply type

 `history`, find the number of the command you want and then type
 
`!N` where "N" is the number of the command you’d like to execute. (`:p` works here too.)

 The other method is a tad more complex but also adds flexibilty. 
 
 `^r` ([[ctrl]]-[[r]]) followed by whatever you type will search the command history for that string. The bonus here is that you’re able to edit the command line you’ve searched for before you send it down the line.
 
> ### Bang dollar-sign
> 
`!$` is the "end" of the previous command. Consider the following example: We start by looking for a word in a file
> 
>       1.  $ grep -i joe /some/long/directory/structure/user-lists/list-15
>     
> 
> if joe is in that userlist, we want to remove him from it. We can either fire up vi with that long directory tree as the argument, or as simply as
> 
> 1.  $ vi !$
>     
> Which bash expands to:
        
        > 1.  $ vi /some/long/directory/structure/user-lists/list-15


> A word of caution: `!$` expands to the end word of the previous command. 

Another thing to keep in mind when using !$ is that if the previous command had no agruments, `!$` will expand to the previous command rather than the most recent argument.

 This can be handy if, for example, you forget to type vi and you just type the filename. A simple `vi !$ `and you’re in.

Similar to `!$` is `!*`. `!*` is _all_ of the arguments to the previous command rather than just the last one. As usual, this is useful in many situations. Here’s a simple example:

>$ vi cd /stuff #(oops!)

[exit vi twice]

$ !*

Which bash expands to:

  $ cd /stuff
>     

### Circumflex hats


Have you ever typed a command, hit return and a micro-second later realized that you made a typo? Back when I still used the more pager I was always typing:

1.  $ mroe filename


Luckily, the folks who wrote bash weren’t the greatest typists either. In bash, you can fix typos in the previous command with a circumflex (^) or "hat." Consider the following:

$ vi /etc/Somefile.conf #(oops!)

 $ ^f^F

Which bash turns into:

  $ vi /etc/SomeFile.conf


What happened there? The name of the file that I was trying to edit was /etc/SomeFile.conf (note the capital "F.") I typed a lower-case "f" and vi saw my error as a request for a new file. Once I closed out of vi I was able to fix my mistake with the following formula: `^error^correction`. Also notice that it only changed the first instance of "f" and not the second.

If you need a global replacement, you’ll need to use a different kind of history modifier that’s discussed in the Word Modifiers section below.

Hats needn’t be only used for errors… Let’s say you have a few redundant commands that can’t be handled with a wildcard, hats will work great for you. For example:

$ dd if\=kern.flp of\=/dev/fd0

 $ ^kern^mfsroot

Which bash turns into:

 $ dd if\=mfsroot.flp of\=/dev/fd0


# stopped editing here:

### A few handy movement commands

Sometimes a mistake is noticed before the enter key is pressed. We’ve already talked about terminals that don’t translate cursor-keys properly, so how do you fix a mistake? To make matters worse, sometimes the backspace key gets mapped to `^H` or even worse something like `^[[~`. Now how do you fix your mistake before hitting the enter key?

Once again, bash comes through for us. Here are some of the movement keystrokes that I use most often:

-   ^w erase word
-   ^u erase from here to beginning of the line (I use this ALL the time.)
-   ^a move the cursor to the beginning of the line
-   ^e move the curor to the end of the line

There are more of course, but those are the ones you simply can’t live without. For those who don’t know the ^N notation means ctrl+N, don’t confuse it with hats mentioned above.

### tab-tab

One of my favorite features of bash is tab-completion. Tab-completion works in a couple of ways, it can complete filenames in the current directory or in your $PATH. Like the !commands above, you just need to give bash enough of the filename to make it unique and hit the tab key — bash will do the rest for you. Let’s say you have a file in your home directory called ransom.note, consider the following:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ mor[tab] ran[tab]


Will expand to

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ more ransom.note


Let’s say you also have a file named _random_ in your home directory. ran above is no longer enough to be unique, but you’re in luck. If you hit tab twice, bash will print the list of matching files to the screen so that you can see what you need to add to make your shortcut unique.

### Aliases

Using aliases is sort of like creating your own commands. You decide what you want to type _and_ what happens when you type that. Aliases can live in a few of different places, ~/.bashrc ~/.bash\_profile ~/.profile and ~/.aliases are some, but not all. In fact, you’re not really limited to keeping them all in one place. Those different files behave differently based upon what kind of shell you’re running, but that’s beyond the scope of this document. For the purposes of this discussion, we’ll settle on ~/.bash\_profile (used for login shells.)

In that file, usually at the bottom, I assemble my aliases. Here’s some examples:

-   alias ud=’aptitude update && aptitude dist-upgrade’
-   alias ls=’ls –color=auto’
-   alias mroe=’less’
-   alias H=’kill -HUP’
-   alias ssh=’ssh -AX’
-   alias webshare=’python -c “import SimpleHTTPServer;SimpleHTTPServer.test()”‘

The bottom one will probably wrap, but it provides a great example of why aliases are great. A whole string of commands has been reduced to something short and easy to remember.

### Brace Expansion

Everyone has done one of the following to make a quick backup of a file:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ cp filename filename-old

2.  $ cp filename-old filename


These seem fairly straightforward, what could possibly make them more efficient? Let’s look at an example:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ cp filename{,-old}

2.  $ cp filename{-old,}

3.  $ cp filename{-v1,-v2}


In the first two examples, I’m doing exactly the same thing as I did in the previous set of examples, but with far less typing. The first example takes a file named filename and copies it to filename-old The second example takes a file named filename-old and copies it to simply filename.

The third example might give us a clearer picture of what’s actually occuring in the first two. In the third example, I’m copying a file called filename-v1 to a file called filename-v2 The curly brace ({) in this context, tells bash that "brace expansion" is taking place. The _preamble_ (in our case filename,) is prepended to each of the strings in the comma-separated _list_ found within the curly braces, creating a new word for each string. So the third example above expands to:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ cp filename-v1 filename-v2


Brace expansion can take place anywhere in your command string, can occur multiple times in a line and even be nested. Brace expansion expressions are evaluated left to right. Some examples:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ touch a{1,2,3}b

2.  $ touch {p2,pv,av,}p

3.  $ ls /usr/{,local/}{,s}bin/jojo


The first example will create three files called a1b, a2b and a3b In this case, the preamble is prepended and the _postscript_ is appended to each string within the curly braces. The second example contains no preamble, so the postscript is appended to each string as before, creating p2p, pvp, avp and simply p The last string in the second example is empty, so p is appended to nothing and becomes just p The third example shows multiple brace expansions on the same line and expands to this:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ ls /usr/bin/jojo /usr/sbin/jojo /usr/local/bin/jojo /usr/local/sbin/jojo


The following example is an example of nested brace expansion.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ apt-get remove --purge ppp{,config,oe{,conf}}


The shell will expand it to:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ apt-get remove --purge ppp pppconfig pppoe pppoeconf


The preamble, "ppp" will be prepended to, (left to right,) nothing ({,), config, then a second expansion will take place and a new preamble, "oe" will be prepended to, first nothing ({,), and then conf which will then each be appended to the original preamble.

For more on brace expansion, including examples of nesting, read the bash man page.

### Word Modifiers

In the first installment of Advancing in the Bash Shell, we learned about :p which is used to print a command, but not execute it. :p is an example of a "word modifier" and it has several siblings. Here’s a shortened list from the bash man page:

h

Remove a trailing file name component, leaving only the head.

t

Remove all leading file name components, leaving the tail.

r

Remove a trailing suffix of the form .xxx, leaving the basename.

e

Remove all but the trailing suffix.

Let’s say I’m reading a file nested deeply in a directory structure. When I finish editing the file, I realize that there are some other operations I want to do in that directory and that they would be more easily accomplished if I were _in_ that directory. I can use :h to help get me there.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ links /usr/local/share/doc/3dm/3DM\_help.html

2.  $ cd !$:h

3.  $ links !-2$:t


Our old friend !$ is back and is being modified by :h. The second command tells bash to cd to !$ or _the last argument of the previous command_, modifying it with :h which trims off the file name portion of the string, leaving just the directory.

The third command looks pretty crazy, but it is acutally quite simple. !-2 means _the command **N**_(in this case 2) _commands ago_. $ means _the last argument of that command_ and the :t means modify that argument to remove the path from it. So, all told: run links using the last argument of the command preceding the most recent one, trimming the path from that argument, or links 3DM\_help.html. No big deal, right?

In our next example, we’ve downloaded a tar ball from the Internet. We check to see if it is going to create a directory for its files and find out that it will not. Rather than clutter up the current directory, we’ll make a directory for it.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ wget [http://www.example.com/path/to/jubby.tgz](http://www.example.com/path/to/jubby.tgz)

2.  $ tar tzvf jubby.tgz

3.  [output]

4.  $ mkdir !$:r


The third command will create a directory called ‘jubby’.

Word modifiers can be stacked as well. In the next example, we’ll download a file to /tmp, and then create a directory for the contents of that tar file in /usr/local/src.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ cd /tmp

2.  $ wget [http://www.example.com/path/KickassApplicationSuite.tar.gz](http://www.example.com/path/KickassApplicationSuite.tar.gz)

3.  $ cd /usr/local/src/

4.  $ mkdir !-2$:t:r:r

5.  {creates directory called 'KickassApplicationSuite'}

6.  $ cd !$

7.  $ tar xvzf /tmp/!-4$:t


The first three commands are fairly common and use no substitution. The fourth command, however, seems like gibberish. We know !-2 means _the command prior to the most recent one_ and that $ indicates the last argument of that command. We even know that :t will strip off the path portion of that argument (in this case, even the "http://".) We even know that :r will remove the file-extension to that argument, but here we call it twice, because there are two extensions (.gz is removed by the first :r and .tar is removed by the second.) We then cd into that directory (!$, again, is the argument to the previous command, in this case the argument to mkdir, which is ‘KickassApplicationSuite’.) We then untar the file. !-4$ is the last argument to the command four commands ago, which is then modified by :t to remove the path, because we added the path as /tmp/. So the last command becomes tar xvzf /tmp/KickassApplicationSuite.tar.gz.

There’s even a word modifier for substitution. :s can be used similarly to circumflex hats to do simple line substitution.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ vi /etc/X11/XF86config

2.  $ !!:s/config/Config-4/


We know that !! means the previous command string. :s modifies the previous command, substituting the first argument to :s with the second argument to :s. My example used / to delimit the two arguments, but any non-whitespace character can be used. It’s also important to note that, just like circumflex hat substitution, the substitution will only take place on the first instance of the string to be substituted. If you want to affect every instance of the substitution string, you must use the :g word modifier along with :s.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ mroe file1 ; mroe file2

2.  $ !!:gs/mroe/more


The second command substitutes (:s) more for all (:g) instances of mroe. Hint: :g can be used with circumflex hats too!

The final word modifer we’ll look at in this tutorial is &. & means _repeat the previous substitution._ Let’s say we’re examining file attributes with the ls command.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ ls -lh myfile otherfile anotherfile

2.  $ !!:s/myfile/myfile.old/


Seems simple enough. :s steps in and changes myfile to myfile.old so we end up with ls -lh myfile.old myfile2 myfile3. & is just a shortcut that we can use to represent the first argument to :s The following example is equivalent to the example above:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ ls -lh myfile otherfile anotherfile

2.  $ !!:s/myfile/&.old/


& is a bit of a tricky one, as it has different contexts in the shell. Remember that this use of & is as a word modifier.

### Bash Functions

Earlier, we learned a bit about aliases. Aliases are simple, static, substitutions. This isn’t to say that one can’t have a very advanced and complex alias, but rather to say that no matter how complex the alias, the shell is simply substituting _^x_ for _^y_. Shell functions are like aliases, but they have the ability to contain logic and positional arguments, making them quite powerful.

What is a positional argument? I’m glad you asked. A positional argument is an argument whose _position_ is important. For example, in the following function the directory containing the data to be copied _must_ come first and the destination directory _must_ come second.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  function treecp { tar cf - "${1}" | (cd "${2}" ; tar xpf -) ; };


It’s certainly possible (and easy) to write functions that can accept their arguments in any order, but in many cases, it just doesn’t make sense to do so. Imagine if cp could take its arguments in any order and you had to use switches to designate which file was which!

Let’s look at the example function above. To let bash know that you’re declaring a function, you start your function with the word function. The first argument to function is the name of the function you want to declare. In this case, treecp. The next character, {, as above, indicates a list to the shell. The list, in this case, is a list of commands. After the curly brace, the logic of the function is defined until the function is closed with a semi-colon followed by a closing curly brace (}.)

The logic of this function is fairly simple, once you understand the two variables that it is using. "${1}" is _the first argument to a given command_. "${2}" is the second, and so on.These are positional arguments. Their number indicates their position. You might think that, "${0}" is the name of the command itself, but it’s actually the name of the current "environment". In a shell script, it will be the name of the shell script. In your interactive shell, it’ll be the shell name with arguments. If you want the name of the function you’re in, you can use ${FUNCNAME}.

So, in order to use our treecp function, we must supply it with two arguments, the source tree and the destination tree:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ treecp dmr ~/public\_html


dmr becomes "${1}", and ~/public\_html is expanded to /home/whomever/public\_html which then becomes "${2}".

What happens if the user forgets to add either or both arguments? How can the function know that it shouldn’t continue? The function, as above, doesn’t. It’ll just continue on its merry way no matter how few arguments it receives. Let’s add some logic to make sure things are as we expect them before proceeding.

Before we can do that, we need to learn about another variable that is set, (like "${1}",) when a command is run. The "${#}" variable is equal to the number of arguments given to a command. For example:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ function myfunc { echo "${#}" ; } ;

2.  $ myfunc foo bar taco jojo

3.  [output is '4']

4.  $ myfunc *

5.  [output is the same as 'ls | wc -l']

6.  $ myfunc

7.  [output is '0']


So now that we can discover how many arguments were passed to our command, (in this case a function,) we can determine if we’ve received the two arguments necessary to make our command work. There’s still a chance that these arguments are garbage, containing typos or directories that don’t exist, but unfortunately the function can’t think for you. :)

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  function treecp {

2.  if [ "${#}" != 2 ] ; then

3.  echo "Usage: treecp source destination";

4.  return 1;

5.  else

6.  tar cf - "${1}" | (cd "${2}" ; tar xpf -) ;

7.  fi ;

8.  };


I’ve made use of the [ (aka test) application to see if the number of arugments is other than the expected two. If there are more or less than two arguments, the function willl echo a usage statement and set the value of "${?}" to 1. "${?}" is called a _return code_. I’ll discuss return codes in a little bit. If there _are_ two arguments, the command runs using the first argument as an argument to tar cf – and the second command as an argument to cd. For more information on [ read its man page (man [.)

Ok, so positional parameters are fun, but what if I don’t care about placement and I need to pass _all_ arguments to a command within my function? "${*}" is just what you’re looking for.

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  $ function n { echo "${*}" >> ~/notes; };

2.  $ n do the dumb things I gotta do, touch the puppet head.


No matter how many words are passed to n they’ll all end up concatenated to the end of notes in my home directory. Be careful to avoid shell-special characters when entering notes in this manner!

Above, we designated 1 as a return code for an error state. There are no rules about what number should be returned in what case, but there are some commonly used return codes that you may want to use or at least be aware of. 0 (zero) is commonly used to denote successful completion of a task. 1 (one), (or any non-zero number,) is commonly used to denote an error state.

If an function or shell script is quite complex, the author may choose to use any number of error codes to mean different things went wrong. For example, return code _28_ might mean your script was unable to create a file in a certain directory, whereas return code _29_ might mean that the script received an error code from wget when it tried to download a file. Return codes are more helpful to logic than to people. Don’t forget to include good error messages for the humans trying to figure out what’s going wrong.

The following is an example of checking a return code:

[View Raw Code](http://samrowe.com/wordpress/advancing-in-the-bash-shell/#)[?](http://www.oriontransfer.co.nz/software/jquery-syntax)

1.  function err {

2.  grep "${*}" /usr/include/*/errno.h;

3.  if [ "${?}" != 0 ] ; then

4.  echo "Not found."

5.  fi

6.  };


grep will return non-zero if no match was found. We then call test again (as [) to see if the return code from grep was other than zero. If [‘s expression evaluates to true, in this case if a non-zero number was returned, the command after then will be run. If grep returns 0, it will output the files/lines that match the expression passed to it, [‘s expression will evaluate false and the command after then will **not** run.

This is just the tip of the bash iceberg. If you’re interested in learning more about the programming aspects of Bash, don’t miss Mike G’s [BASH Programming – Introduction HOW-TO](http://en.tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html). [Greg’s Bash Wiki](http://mywiki.wooledge.org/BashFAQ) are also an excellent resources.

I hope this tutorial has been useful to you. The most difficult hurdle here is not the learning curve, but simply becoming accustomed to using these built-ins. Just like learning vi, once you get good with these, you’ll be amazed you ever lived without them.