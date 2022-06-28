# Quick summar notes only

[Source](https://faculty.ucr.edu/~tgirke/Documents/UNIX/linux_manual.html#SHELL)


## Help

### Online help
-  [SuperMan Pages](http://linuxcommand.org/superman_pages.php)
- [ Linux Documentation Project (LDP)](http://tldp.org/index.html)



Resources to do - [Source]( http://samrowe.com/wordpress/advancing-in-the-bash-shell/)


    

### UNIX HELP
- `man` - general help
- `man wc` - manual on program 'word count' wc
- `wc --help` - short help on wc
- `info wc` - more detailed information system (GNU)
- `apropos wc` - retrieves pages where wc appears


## Tools
-   open [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)

-   [Setup for graphics emulation](http://kansas.ucr.edu/gcg/gcg_simple.html)

-   [WinSCP for file exchange](http://winscp.sourceforge.net/eng/)


WGET (file download from the www)
- `wget ftp://ftp.ncbi.nih....` - file download from www; add option '-r' to download entire directories
SCP (secure copy between machines)
General syntax
- `scp source target` - Use form 'userid@machine_name' if your local and remote user ids are differnt. If they are the same you can use only 'machine_name'.

Examples
Copy file from Server to Local Machine (type from local machine prompt):
- `scp user@remote_host:file.name .` - '.' copies to pwd, you can specify here any directory, use wildcards to copy many files at once.
Copy file from Local Machine to Server:
- `scp file.name user@remote_host:~/dir/newfile.name` - Copy entire directory from Server to Local Machine (type from local machine prompt):
- `scp -r user@remote_host:directory/ ~/dir` - Copy entire directory from Local Machine to Server (type from local machine prompt):
- `scp -r directory/ user@remote_host:directory/` - Copy between two remote hosts (e.g. from bioinfo to cache):
similar as above, just be logged in one of the remote hosts:
-  `scp -r directory/ user@remote_host:directory/`

NICE FTP

- `open ncftp`
- `ncftp> open ftp.ncbi.nih.gov`
- `ncftp> cd /blast/executables`
- `ncftp> get blast.linux.tar.Z (skip extension: @)`
- `ncftp> bye`


### Unix Tools

- [Fuzzy Finder](https://github.com/junegunn/fzf)


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

Accesses the **directory stack**

!!!example `~` Tilde Expavnsion
    If the characters following the tilde in the tilde-prefix consist of **a number N,** optionally prefixed by a `+` or a `-`, the tilde-prefix is replaced with the corresponding element from the directory stack, as it would be displayed by the dirs builtin invoked with the characters following tilde in the tilde-prefix as an argument (see The Directory Stack). If the tilde-prefix, sans the tilde, consists of a number without a leading `+` or `-`, `+` is assumed. 

    >- [[`~`]] - The value of `$HOME`
    >- [[`~/foo`]] - `$HOME/foo`
    >- [[`~fred/foo`]] - The subdirectory *foo* of the home directory of the user **fred**
    >- [[`~+/foo`]] - `$PWD/foo`
    >- [[`~-/foo`]] - `${OLDPWD-'~-'}/foo`
    >- [[`~N`]] -  The string that would be displayed by `‘dirs +N’`
    >- [[`~+N`]] - The string that would be displayed by `‘dirs +N’`
    >- [[`~-N`]] - The string that would be displayed by `‘dirs -N’` 



-----

#### Word Designators

!!!cite [Using History Interactively](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html#Using-History-Interactively)

Uses the `!` (bang symbol)

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

    - `!!` - designates the preceding command. When you type this, the preceding command is repeated in total.

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

### Keyboard Shortcuts for Substitutions

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


### Disown `&` and Redirection

!!!!!Attention Attention: Important `&`
- `&` suffix so that it runs as a background process and then issuing `disown %1` in bash or whatever job number the program is. Then you can safely close the terminal. So, it could be something like: `sudo my-program &;disown %1;exit;`

### `!` Bang Substitution

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



## Basics

`ssh <user_name>@<host name(IP)>`

- `.` - refers to pwd
- `~/` - refers to user's home directory
- `history` - shows all commands you have used recently
- `!<number>` - starts an old command by providing its ID number
- `up(down)_key` - scrolls through command history
- `<incomplete path/file_name> TAB` - completes path/file_name
- `<incomplete command> SHIFT&TAB` - completes command
- `Ctrl a` - cursor to beginning of command line
- `Ctrl e` - cursor to end of command line
- `Ctrl d` - delete character under cursor
- `Ctrl k` - delete line from cursor, content goes into kill buffer
- `Ctrl y` - paste content from Ctrl k
- `Ctrl + w`  erase word
-  `Ctrl u` erase from here to beginning of the line 
- `Ctrl z`  send to background
- [[Ctrl]] + [[r]] (`^r) enters history search mode.
- `^` correct the last line   `^error^correction`
        	1. $ vi /etc/Somefile.conf #(oops!) 
	        2. $ ^f^F 
            # Which bash turns into:
        	3. $ vi /etc/SomeFile.conf
`&` as in `./script.sh &` send to bg
`fg <#>` reenter job (#)
`bg <#>` background job (#)
`job` list jobs


## Cmd line
`!!` -repeat the last line (entirely)
`!xyz` - Repeats the last line that started with xyz
`!xyz:p` using `:p`  at the end prints the history command rather than executing it/
`history` gets a list of the history
`!N` brings the Nth entry in history.
    - `!-2` - two commands ago
    - `!2` - the second command.
`!$` is the "end" of the previous command eg the last argument.
`!*` is all of the arguments to the previous command rather than just the last one. 

### Brace Expansion
Uses curly braces `{}` to expand items.
`cp filename{,-old} ` --> `cp filename filename-old`
cp filename{-old,}  --> cp filename-old, filename
`cp filename{-v1,-v2}` --> cp filename{-v1,-v2} 
`touch a{1,2,3}b`  -->  create three files called a1b, a2b and a3b
`touch {p2,pv,av,}p ` , creating p2p, pvp, avp and simply p
`ls /usr/{,local/}{,s}bin/jojo `
        $ ls /usr/bin/jojo /usr/sbin/jojo /usr/local/bin/jojo /usr/local/sbin/jojo

` apt-get remove --purge ppp{,config,oe{,conf}}` 
            . $ apt-get remove --purge ppp pppconfig pppoe pppoeconf 

### Colon notation:

- `:p` print the command
- `:s`Substitution similar to `^x^X`
    - modifies the previous command, substituting the first argument to :s with the second argument to :s
        - `:g` If you want to affect every instance of the substitution string, you must use the :g word modifier along with :s.

                    1. $ mroe file1 ; mroe file2 
                    $ !!:gs/mroe/more 
        - `&` calls back the first arg to `:s`'

                1. $ ls -lh myfile otherfile anotherfile 
                  $ !!:s/myfile/&.old/ 

- `:h` Remove a trailing file name component, leaving only the head.
- `:t` - Remove all leading file name components, leaving the tail.
- `:r` - Remove a trailing suffix of the form .xxx, leaving the basename.
- `:e` - Remove all but the trailing suffix. 


Examples:

	1. $ wget http://www.example.com/path/to/jubby.tgz 
	2. $ tar tzvf jubby.tgz 
	3. [output] 
$ mkdir !$:r 
Take the last command argument, jubby.tgz, strip the .tgz. and make a directory/


	    1. $ links /usr/local/share/doc/3dm/3DM_help.html 
        2. $ cd !$:h  
        #cd to !$ or the last argument of the previous command, :h  trims off the file name portion of the string, leaving just the directory.
         $ links !-2$:t  
         # run links using the last argument of the command preceding the most recent one, trimming the path from that argument, or links 3DM_help.html. N


	1. $ cd /tmp 
	2. $ wget http://www.example.com/path/KickassApplicationSuite.tar.gz 
	3. $ cd /usr/local/src/ 
	4. $ mkdir !-2$:t:r:r 
	5. {creates directory called 'KickassApplicationSuite'} 
	6. $ cd !$ 
$ tar xvzf /tmp/!-4$:t 


### Functions and Braces

{0} - current env
{1} first positional
{2}     second positional
{N} 
{FUNCNAME} returns the function name thats running
{#} the number of args received.
{?} the current return code that will be returned if you exit now.
{*} all arguments.
### Orientation

- `pwd` - present working directory
- `ls` - content of pwd
- `ll` - similar as ls, but provides additional info on files and `rectories
- `ll -a` - includes hidden files (.name) as well
- `ll -R` - lists subdirectories recursively
- `ll -t` - lists files in chronological order
- `stat <file_name>` - provides all attributes of a file
- `whoami` - shows as who you are logged in
- `hostname` - shows on which machine you are
- `who` - shows who is logged into system
- `w` - shows which users are logged into system and what they are doing


## Files and directories

- `mkdir <dir_name>` - creates specified directory
- `cd <dir_name>` - switches into specified directory
- `cd ..` - moves one directory up
- `cd ../../` - moves two directories up (and so on)
- `cd` - brings you to highest level of your home directory
- `rmdir <dir_name>` - removes empty directory
- `rm <file_name>` - removes file name
- `rm -r <dir_name>` - removes directory including its content, but asks for confirmation, 'f' argument turns confirmation off
- `mv <name1> <name2>` - renames directories or files
- `mv <name> <path>` - moves file/directory as specified in path
- `cp <name> <path>` - copy file/directory as specified in path (-r to include content in directories)

### find

`find /mnt/user -empty -type d -maxdepth 1 -delete`

!!!
Usage: find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]

default path is the current directory; default expression is -print
expression may consist of: operators, options, tests, and actions:
operators (decreasing precedence; -and is implicit where no 
others are given):
      ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2      
positional options (always true): -daystart -follow -regextype

normal options (always true, specified before other expressions):
      -depth --help -maxdepth LEVELS -mindepth LEVELS -mount -noleaf
      --version -xdev -ignore_readdir_race -noignore_readdir_race
tests (N can be +N or -N or N): -amin N -anewer FILE -atime 
N -cmin N
      -cnewer FILE -ctime N -empty -false -fstype TYPE -gid 
N -group NAME
      -ilname PATTERN -iname PATTERN -inum N -iwholename PATTERN -iregex PATTERN
      -links N -lname PATTERN -mmin N -mtime N -name PATTERN -newer FILE
      -nouser -nogroup -path PATTERN -perm [-/]MODE -regex PATTERN
      -readable -writable -executable
      -wholename PATTERN -size N[bcwkMG] -true -type [bcdpflsD] -uid N
      -used N -user NAME -xtype [bcdpfls]      -context CONTEXT

actions: -delete -print0 -printf FORMAT -fprintf FILE FORMAT -print
      -fprint0 FILE -fprint FILE -ls -fls FILE -prune -quit 
      -exec COMMAND ; -exec COMMAND {} + -ok COMMAND ;      
      -execdir COMMAND ; -execdir COMMAND {} + -okdir COMMAND ;

Valid arguments for -D:
exec, help, opt, rates, search, stat, time, tree
Use '-D help' for a description of the options, or see find(1)

Please see also the documentation at http://www.gnu.org/software/findutils/.
You can report (and track progress on fixing) bugs in the "find"
program via the GNU findutils bug-reporting page at
https://savannah.gnu.org/bugs/?group=findutils or, if       
you have no web access, by sending email to <bug-findutils@gnu.org>.
### ARCHIVING AND COMPRESSING

Archiving and compressing
- `tar -cvf my_file.tar mydir/` - Builds tar archive of files or directories. For directories, execute command in parent directory. Don't use absolute path.
- `tar -czvf my_file.tgz mydir/` - Builds tar archive with compression of files or directories. For directories, execute command in parent directory. Don't use absolute path.
Viewing Archives
- `tar -tvf my_file.tar`
- `tar -tzvf my_file.tgz`
Extracting
- `tar -xvf my_file.tar`
- `tar -xzvf my_file.tgz`
- `gunzip my_file.tar.gz` - or unzip my_file.zip, uncompress my_file.Z, or bunzip2 for file.tar.bz2
- `find -name '*.zip' | xargs -n 1 unzip` - this command usually works for unziping many files that were compressed under Windows
try also:
- `tar zxf blast.linux.tar.Z`
- `tar xvzf file.tgz`
options:
f: use archive file
p: preserve permissions
v: list files processed
x: exclude files listed in FILE
z: filter the archive through gzip

## Shell

When you log into UNIX/LINUX the system starts a program called SHELL. It provides you with a working environment and interface to the operating system. Usually there are many different shell programs installed.
- `finger <user_name>` - shows which shell you are using
- `chsh -l` - gives list of shell programs available on your system (does not work on all UNIX variants)
- `<shell_name>` - switches to different shell

### STDIN, STDOUT, STDERR, REDIRECTORS, OPERATORS & WILDCARDS (more on this @ LINUX HOWTOs)

By default, many UNIX commands read from standard input (STDIN) and send their output to standard out (STDOUT). You can redirect them by using the following commands:
- `file*` - * is wildcard to specify many files
- `ls > file` - prints ls output into specified file
- `command < my_file` - uses file after '<' as STDIN
- `command >> my_file` - appends output of one command to file
- `command | tee my_file` - writes STDOUT to file and prints it to screen; alternative way to do this:
- `command > my_file; cat my_file`
- `command > /dev/null` - turns off progress info of applications by redirecting their output to /dev/null
- `grep my_pattern my_file | wc` - Pipes (|) output of 'grep' into 'wc'
- `grep my_pattern my_non_existing_file 2 > my_stderr` - prints STDERR to file

- Useful shell commands
- `cat <file1> <file2> > <cat.out>` - concatenate files in output file 'cat.out'
- `paste <file1> <file2> > <paste.out>` - merges lines of files and separates them by tabs (useful for tables)
- `cmp <file1> <file2>` - tells you whether two files are identical
- `diff <fileA> <fileB>` - finds differences between two files
- `head -<number> <file>` - prints first lines of a file
- `tail -<number> <file>` - prints last lines of a file
- `split -l <number> <file>` - splits lines of file into many smaller ones
- `csplit -f out fasta_batch "%^>%" "/^>/" "{*}"` - splits fasta batch file into many files at '>'
- `sort <file>` - sorts single file, many files and can merge (-m) them, -b ignores leading white space, ...
- `sort -k 2,2 -k 3,3n input_file > output_file` - sorts in table column 2 alphabetically and column 3 numerically, '-k' for column, '-n' for numeric
- `sort input_file | uniq > output_file` - uniq command removes duplicates and creates file/table with unique lines/fields
- `join -1 1 -2 1 <table1> <table2>` - joins two tables based on specified column numbers (-1 file1, 1: col1; -2: file2, col2). It assumes that join fields are sorted. If that is not the case, use the next command:
- `sort table1 > table1a; sort table2 > table2a; join -a 1 -t "`echo -e '\t'`" table1a table2a > table3` - '-a <table>' prints all lines of specified table! Default prints only all lines the two tables have in common. '-t "`echo -e '\t'`" ->' forces join to use tabs as field separator in its output. Default is space(s)!!!
- `cat my_table | cut -d , -f1-3` - cut command prints only specified sections of a table, -d specifies here comma as column separator (tab is default), -f specifies column numbers.
- `grep and egrep` - see chapter 4

### Advanced Commands

- `cp filename{-v1,-v2}`- Uses brace expansion to add the endings to filename- eg filename-v1, filename-v2
`touch a{1,2,3}b `- a1b, a2b and a3b
- `touch {p2,pv,av,}p` = p2p, pvp, avp and simply p (the ending comma)
 - `ls /usr/{,local/}{,s}bin/jojo` =  *"ls /usr/bin/jojo /usr/sbin/jojo /usr/local/bin/jojo /usr/local/sbin/jojo"*
- ` apt-get remove --purge ppp{,config,oe{,conf}}` => `apt-get remove --purge ppp pppconfig pppoe pppoeconf `

## Find

### Finding files, directories and applications
- `find -name "*pattern*"` - searches for *pattern* in and below current directory
- `find /usr/local -name "*blast*"` - finds file names *blast* in specfied directory
- `find /usr/local -iname "*blast*"` - same as above, but case insensitive
additional useful arguments: -user <user name>, -group <group name>, -ctime <number of days ago changed>
- `find ~ -type f -mtime -2` - finds all files you have modified in the last two days
- `locate <pattern>` - finds files and dirs that are written into update file
- `which <application_name>` - location of application
- `whereis <application_name>` - searches for executeables in set of directories
- `dpkg -l | grep mypattern` - find Debian packages and refine search with grep pattern


### Finding things in files
- `grep pattern file` - provides lines in 'file' where pattern 'appears', if pattern is shell function use single-quotes: '>'
- `grep -H pattern` - -H prints out file name in front of pattern
- `grep 'pattern' file | wc` - pipes lines with pattern into word count wc (see chapter 8); wc arguments: -c: show only bytes, -w: show only words, -l: show only lines; help on regular expressions: $ man 7 regex or man perlre
- `find /home/my_dir -name '*.txt' | xargs grep -c ^.*` - counts line numbers on many files and records each count along with individual file name; find and xargs are used to circumvent the Linux wildcard limit to apply this function on thousands of files.

!!!Note: FZF
    Love FZF -
    [Fuzzy Finder](https://github.com/junegunn/fzf)
    
### Alternatives

alternatives --list


#### Create:

Requires elevation

Create an alternative for the original by providing:

-  **location** for the "generic" symlink, usually on path probably, and the fle name
-  *name* for the alternative - e.g. these are the "pyton_opts". *not the file name that is run, below that is `em`*
-  **binary** to be executed when these symlinks are called
-  **priority** level to indicate which alternative is preferred
    - **(higher is more , eg, a 2 runs over a 1, a 99 always runs)**
    
  alternatives **--(action-** install) **(location** of generic link) (ref_name)(target binary) (Priority num)

`sudo alternatives --install /usr/bin/em uemacs /opt/em-legacy/em2 1`

#### Inspect

Requires elevation

`sudo alternatives --config uemacs` - where uemacs is the generic name here as an example.  For example py or python for python3.8

#### Remove 

` sudo alternatives --remove-all uemacs`

or to remove one, use the `--config` and then using the `Command` field which holds the path:
`sudo alternatives --remove uemacs /opt/em-legacy/em2`


## Admin


## ENVIRONMENT VARIABLES

environment variables and should be defined in /etc or $HOME/.profile. like EDITOR and CC

- `xhost user@host` - adds X permissions for user on server.
- `echo DISPLAY` - shows current display settings
- `export (setenv) DISPLAY=<local_IP>:0` - change environment variable
- `unsetenv DISPLAY` - removes display variable
- `$PATH` - list of directories that the shell will search when you type a command
- You can edit your default DISPLAY setting for your account by adding it to file .bash_profile.
- `printenv` |  `env` | `export` - prints all environment variables
    - 

Here are some common environmental variables that you will come across:

### Common Ones

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

`passwd` Changing password:

### Ownership

- '+' causes the permissions selected to be added
- '-' causes them to be removed
- '=' causes them to be the only permissions 
- octal bits `ugo`
    - users
    - group
    - others
- values are 3 bits, 
   -  4 read,
   -  2 write, 
   - 1 execute.

- `ls -al` - shows something like this for each file/dir: drwxrwxrwx
- d: directory
- rwx: read write execute

- `chmod ug+rx my_file` To assign write and execute permissions to user and group:

- `chmod ugo-rwx my_file` To remove all permissions from all three user groups:
that the file has.
Example for number system:
- `chmod +rx public_html/`
 $ chmod 755 public_html/



#### Change ownership

- `chown <user> <file or dir>` - changes user ownership
- `chgrp <group> <file or dir>` - changes group ownership
- `chown <user>:<group> <file or dir>` - changes user & group ownership




- `chown apache:developers test.php` -  Change ownership of test.php to “apache” and the “developers” group.
- `chmod u+rw,g+rw,o+r test.php` Change the mode of test.php to allow owner
(u) and users in the group (g) to read and write (+rw) it, and the rest of the world (o) to just read (+r) it.
- `chmod g+rw test.php` Allow users in the group of test.php to read
and write it
 - `chmod g+s /var/www/html` -  Special command to make sure that all files created in /var/www/html are owned by the group that own /var/
- `chmod 755 somescript`  Allow the owner of somescript to read,
write and execute it, and the rest of the world to just read and execute it. 

`chmod +x somefile` Allow execution of somefile


## System
- `df` - disk space
- `free` - memory info
- `uname -a` - shows tech info about machine
- `bc` - command-line calculator (to exit type 'quit')
- `wget ftp://ftp.ncbi.nih....` - file download from web
- `/sbin/ifconfig` - give IP and other network info
- `ln -s original_filename new_filename` - creates symbolic link to file or directory
- `du -sh` - displays disk space usage of current directory
- `du -sh *` - displays disk space usage of individual files/directories
- `du -s * | sort -nr` - shows disk space used by different directories/files sorted by size
`free` - free memory
`vmstat 3`  Every three seconds, show statistics about the system, like utilization, memory in use,
etc.
`ps xauw` -list system processes


- `ps` - shows processes running by user
- `ps -e` - shows all processes on system; try also '-a' and '-x' arguments
- `ps aux | grep <user_name>` - shows all processes of one user
- `top` - view top consumers of memory and CPU
- `mtop` - displays multicomputer/CPU processes
- `Ctrl z <enter> bg or fg <enter>` - suspends a process to bring into back- or foreground
- `Ctrl c` - stops an initiated process
- `kill <ps_ID>` - Kills specified job; if this doesn't do it, add -9 as argument. Also, type <%1> then <CTRL C>.
- `renice -n <priority_value>` - change priority value, which range from 1-19, the higher the value the lower the priority, default is 10

## Mounting drives

Mount/unmount usb/floppy/cdrom
        $ mount /media/usb
        $ umount /media/usb
        $ mount /media/cdrom
        $ eject /media/cdrom
        $ mount /media/floppy

### Mount on WSL

```sh
sudo mkdir /mnt/n
sudo mount -t drvfs n: /mnt/n
```

Where N:\ is the drive to be accessible.


For network storage, assume networked storage is already showing in Windows under \\server\share and we want to access this network storage from WSL as `/mnt/share`.

    mkdir /mnt/share
    mount -t drvfs '\\server\share' /mnt/share

## Apt Installing Packages

Check whether your application is available at: http://www.debian.org/intro/about, then you type (no download):
- `apt-cache search phylip` - searches for application "phylip" from command line
- `apt-cache show phylip` - provides description of program
- `apt-get install phylip` - example for phylip install, manuals can be found in /usr/doc/phylip/, use zless or lynx to read documentation (don't unzip).
- `apt-get update` - do once a month do update Debian packages
- `apt-get upgrade -u` - to upgrade after update from above
- `dpkg -i` - install data package from local package file (e.g. after download)
- `aptitude` - Debian package manageing interface (Ctrl-t opens menues)
- `aptitude search vim` - search for packages on system and in Debian depositories

## Systemctl  

Syntax  (sudo) systemctl `<action>` **service**...
    - status
    - start
    - enable
    - stop
    - restart
    - disable
    - mask
    - unmask

- `systemctl status httpd` - Show information about httpd, including process ID, child processes, time since startup, what man pages are available, the most recent log messages, and more
- `systemctl start httpd mariadb` Start the httpd and mariadb services. Instead of ‘start’, you can also use **stop** or **restart,** for obvious use cases
- `systemctl enable httpd mariadb` Enable the **httpd** and **mariadb** services to start at next boot. You can also use `disable`, `mask` or `unmask`.

## Journalctl

- `journalctl -f -l` Show and keep open (`-f`) the system log, allowing you to see new messages scrolling by. The `-l` flag prevents truncating of long lines.
- `journalctl -f -l -u httpd -u mariadb` Same as above, but only for log messages from the **httpd** and **mariadb** services.
- `journalctl -f -l -u httpd -u mariadb --since -300` - same as above, only for log messages that are less than 300 seconds (5 minutes) old


## NMCLI

`nmcli d` Show the status of all network interfaces
`nmcli d show eth0` Show details of network interface eth0;
alternatively you can use `ip a s eth0`
`nmcli d connect eth0` Bring up the network interface eth0. You
can use ‘disconnect’ to bring the interface


- `curl http://www.someapp.org/test.php` or `curl http://10.0.0.10/test.php` download target
- `someapp.org or 10.0.0.10, respectively
- `curl http://localhost:80/someapp/api` 
-v 
-v -F “arg1=foo” -F “arg2=bar”
Fetch sent and received HTTPS POST
status, API response payload from the local
host
host www.someapp.org Use the ‘host’ command to test DNS name
resolution; you might need to run ‘yum -y
install bind-utils’ for this command to work.


## VIM

- VIM
    - BASICS
        - `vim my_file_name` - open/create file with vim
        - `i` - INSERT MODE
        - `ESC` - NORMAL (NON-EDITING) MODE
        - `:` - commands start with ':'
        - `:w` - save command; if you are in editing mode you have to hit ESC first!!
        - `:q` - quit file, don't save
        - `:q!` - exits WITHOUT saving any changes you have made
        - `:wq` - save and quit
        - `R` - replace MODE
        - `r` - replace only one character under cursor
        - `q:` - history of commands (from NORMAL MODE!), to reexecute one of them, select and hit enter!
        - `:w new_filename` - saves into new file
        - `:#,#w new_filename` - saves specific lines (#,#) to new file
        $ :# go to specified line number
    -    HELP
        $ Useful list of vim commands: Vim Commands Cheat Sheet, VimCard, Vim Basics
        - `vimtutor` - open vim tutorial from shell
        - `:help` - opens help within vim, hit :q to get back to your file
        - `:help <topic>` - opens help on specified topic
        - `|help_topic| CTRL-]` - when you are in help this command opens help topic specified between |...|, CTRL-t brings you back to last topic
        - `:help <topic> CTRL-D` - gives list of help topics that contain key word
        - `: <up-down keys>` - like in shell you get recent commands!!!!
    - MOVING AROUND IN FILE
        - `$` - moves cursor to end of line
        - `A` - same as $, but switches to insert mode
        - `0 (zero)` - moves cursor to beginning of line
        - `CTRL-g` - shows at status line filename and the line you are on
        - `SHIFT-G` - brings you to bottom of file, type line number (isn't displayed) then SHIFT-G # brings you to specified line#
        DISPLAY
    - WRAPPING AND LINE NUMBERS
        - `:set nowrap` - no word wrapping, :set wrap # back to wrapping
        - `:set number` - shows line numbers, :set nonumber # back to no-number mode
    - WORKING WITH MANY FILES & SPLITTING WINDOWS
        - `vim *.txt` - opens many files at once; ':n' switches between files
        - `:wall or :qall` - write or quit all open files
        - `vim -o *.txt` - opens many files at once and displays them with horizontal split, '-O' does vertical split
        - `:args *.txt` - places all the relevant files in the argument list $ :all # splits all files in the argument list (buffer) horizontally $ CTRL-w # switch between windows
        - `:split` - shows same file in two windows
        - `:split <file-to-open>` - opens second file in new window
        - `:vsplit` - splits windows vertically, very useful for tables, ":set scrollbind" let's you scroll all open windows symultaneously
        - `:close` - closes current window
        - `:only` - closes all windows except current one
    - SPELL CHECKING & Dictionary
        - `aspell -c <file>` - shell command
        - `aspell -l <my_file>` - shell command
        - `:! dict <word>` - meaning of word
        - `:! wn 'word' -over` - synonyms of word
    - PRINTING FILE
        - `:ha` - prints entire file
        - `:#,#ha` - prints specified lines: #,#
    - MERGING/INSERTING FILES
        - `:r <filename>` - inserts content of specified file after cursor
    - UNDO/REDO
        - `u` - undo last command
        - `U` - undo all changes on current line
        - `CTRL-R` - redo one change which was undone
    - DELETION/CUT (switch to NORMAL mode)
        - `x` - deletes what is under cursor
        - `dw` - deletes from curser to end of word including the space
        - `de` - deletes from curser to end of word NOT including the space
        - `cw` - deletes rest of word and lets you then insert, hit ESC to continue with NORMAL mode
        - `c$` - deletes rest of line and lets you then insert, hit ESC to continue with with NORMAL mode
        - `d$` - deletes from cursor to the end of the line
        - `dd` - deletes entire line
        - `2dd` - deletes next two lines, continues: 3dd, 4dd and so on.
        PUT (PASTE)
        - `p` - uses what was deleted/cut and pastes it behind cursor
        COPY & PASTE
        - `yy` - copies line, for copying several lines do 2yy, 3yy and so on
        - `p` - pastes clipboard behind cursor
    - SEARCH IN FILE (most regular expressions work)
        - `/my_pattern` - searches for my_pattern downwards, type n for next match
        - `?my_pattern` - seraches for my_pattern upwards, type n for next match
        - `:set ic` - switches to ignore case search (case insensitive)
        - `:set hls` - switches to highlight search (highlights search hits)
    - REPLACE WITH REGULAR EXPRESSIONS (great intro: A Tao of Regular Expressions)
        - `:s/old_pat/new_pat/` - replaces first occurence in a line
        - `:s/old_pat/new_pat/g` - replaces all occurence in a line
        - `:s/old_pat/new_pat/gc` - add 'c' to ask for confirmation
        - `:#,#s/old_pat/new_pat/g` - replaces all occurence between line numbers: #,#
        - `:%s/old_pat/new_pat/g` - replaces all occurence in file
        - `:%s/\(pattern1\)\(pattern2\)/\1test\2/g` - regular expression to insert, you need here '\' in front of parentheses (<# Perl)
        - `:%s/\(pattern.*\)/\1 my_tag/g` - appends something to line containing pattern (<# .+ from Perl is .* in VIM)
        - `:%s/\(pattern\)\(.*\)/\1/g` - removes everything in lines after pattern
        - `:%s/\(At\dg\d\d\d\d\d\.\d\)\(.*\)/\1\t\2/g` - inserts tabs between At1g12345.1 and Description
        - `:%s/\n/new_pattern/g` - Replaces return signs
        - `:%s/pattern/\r/g` - Replace pattern with return signs!!
        - `:%s/\(\n\)/\1\1/g` - insert additional return signs
        - `:%s/\(^At\dg\d\d\d\d\d.\d\t.\{-}\t.\{-}\t.\{-}\t.\{-}\t\).\{-}\t/\1/g` - replaces content between 5th and 6th tab (5th column), '{-}' turns off 'greedy' behavior
        - `:#,#s/\( \{-} \|\.\|\n\)/\1/g` - performs simple word count in specified range of text
        - `:%s/\(E\{6,\}\)/<font color="green">\1<\/font>/g` - highlight pattern in html colors, here highlighting of >= 6 occurences of Es
        - `:%s/\([A-Z]\)/\l\1/g` - change uppercase to lowercase, '%s/\([A-Z]\)/\u\1/g' does the opposite
        - `:g/my_pattern/ s/\([A-Z]\)/\l\1/g | copy $` - uses 'global' command to apply replace function only on those lines that match a certain pattern. The 'copy $' command after the pipe '|' prints all matching lines at the end of the file.
        - `:args *.txt | all | argdo %s/\old_pat/new_pat/ge | update` - Command 'args' places all relevant files in the argument list (buffer); 'all' displays each file in separate split window; command 'argdo' applies replacement to all files in argument list (buffer); flag 'e' is necessary to avoid stop at error messages for files with no matches; command 'update' saves all changes to files that were updated.
    - MATCHING PARENTHESES SEARCH
        - place curser on (, [ or { and type % # curser moves to matching parentheses
    - HTML EDITING
        -Convert text file to html format:
        - `:runtime! syntax/2html.vim` - run this command with open file in Vim
        SHELL COMMAND IN VIM
        - `:!<SHELL_COMMAND> <ENTER>` - executes any shell command, hit <enter> to return
        - `:sh` - switches window to shell, 'exit' switches back to vim
        USING VIM AS TABLE EDITOR
        - `v` - starts visual mode for selecting characters
        - `V` - starts visual mode for selecting lines
        - `CTRL-V` - starts visual mode for selecting blocks (use CTRL-q in gVim under Windows). This allows column-wise selections and operations like inserting and deleting columns. To restrict substitude commands to a column, one can select it and switch to the command-line by typing ':'. After this the substitution sytax for a selected block looks like this: '<,'>s///.
        - `:set scrollbind` - starts simultaneous scrolling of 'vsplitted' files. To set to horizontal binding of files, use command ':set scrollopt=hor' (after first one). Run all these commands before the ':split' command.
        - `:AlignCtrl I= \t then :%Align` - This allows to align tables by column separators (here '\t') when the Align utility from Charles Campbell's is installed.
        To sort table rows by selected lines or block, perform the visual select and then hit F3 key. The rest is interactive. To enable this function one has to include in the .vimrc file from Gerald Lai the Vim sort script.
    - MODIFY VIM SETTINGS (in file .vimrc)
        - see last chapter of vimtutor (start from shell)
        - useful .vimrc sample
        - when vim starts to respond very slowly then one may need to delete the .viminf* files in home directory

## Script Ex

- `for i in *.input; do mv $i ${i/name\.old/name\.new}; done` - renames file name.old to name.new
- To test things first, insert 'echo' between 'do mv' (above).
- `for i in *.input; do ./application $i; done` - runs application in loops on many input files
- `for i in *.input; do fastacmd -d /data/../database_name -i $i > $i.out; done` - runs fastacmd in loops on many *.input files and creates *.out files
- `for i in *.pep; do target99 -db /usr/../database_name -seed $i -out $i; done` - runs SAM's target99 on many input files
- `for j in 0 1 2 3 4 5 6 7 8 9; do grep -iH <my_pattern> *$j.seq; done` - searches in > 10,000 files for pattern and prints occurences together with file names.
- `for i in *.pep; do echo -e "$i\n\n17\n33\n\n\n" | ./tmpred $i > $i.out; done` - example of how to run an interactive application (tmpred) that asks for file name input/output
- `for i in *.fasta1; do blast2 -p blastp -i $i -j ${i/_*fasta1/_*fasta2} >> my_out_file; done` - runs BLAST2 for all *.fasa1/*.fasta2 file pairs in the order specified by file names and writes results into one file. This example uses two variables in a for loop. The content of the second variable gets specified in each loop by a replace function.
- `for i in *.fasta; do for j in *.fasta; do blast2 -p blastp -F F -i $i -j $j >> my_out_file; done; done;` - runs BLAST2 in all-against-all mode and writes results into one file; '-F F' turns low-complexity filter off

### PERL
- `perl -p -i -w -e 's/pattern1/pattern2/g' input_file` - replace something (e.g. return signs) in file using regular expressions; use $1 to backreference to pattern placed in parentheses
    '-p' lets perl know to write program; '-i.bak' creates backup file *.bak, only -i doesn't; '-w' turns on warnings; '-e' executeable code follows
- `perl -ne 'print if (/my_pattern1/ ? ($c=1) : (--$c > 0)) ; print if (/my_pattern2/ ? ($d = 1) : (--$d > 0))' my_infile > my_outfile` - parses lines that contain pattern1 and pattern2

following lines after pattern can be specified in '$c=1' and '$d=1'; for OR function use this syntax: '/(pattern1|pattern2)/'


## GNUUtils



-   [2 Common options](https://www.gnu.org/software/coreutils/manual/coreutils.html#Common-options)
    -   [2.6 `chown`, `chgrp`, `chroot`, `id`: Disambiguating user names and IDs](https://www.gnu.org/software/coreutils/manual/coreutils.html#Disambiguating-names-and-IDs)
    -   [2.14 `coreutils`: Multi-call program](https://www.gnu.org/software/coreutils/manual/coreutils.html#Multi_002dcall-invocation)
-   [3 Output of entire files](https://www.gnu.org/software/coreutils/manual/coreutils.html#Output-of-entire-files)
    -   [3.1 `cat`: Concatenate and write files](https://www.gnu.org/software/coreutils/manual/coreutils.html#cat-invocation)
    -   [3.2 `tac`: Concatenate and write files in reverse](https://www.gnu.org/software/coreutils/manual/coreutils.html#tac-invocation)
    -   [3.3 `nl`: Number lines and write files](https://www.gnu.org/software/coreutils/manual/coreutils.html#nl-invocation)
    -   [3.4 `od`: Write files in octal or other formats](https://www.gnu.org/software/coreutils/manual/coreutils.html#od-invocation)
    -   [3.5 `base32`: Transform data into printable data](https://www.gnu.org/software/coreutils/manual/coreutils.html#base32-invocation)
    -   [3.6 `base64`: Transform data into printable data](https://www.gnu.org/software/coreutils/manual/coreutils.html#base64-invocation)
    -   [3.7 `basenc`: Transform data into printable data](https://www.gnu.org/software/coreutils/manual/coreutils.html#basenc-invocation)
-   [4 Formatting file contents](https://www.gnu.org/software/coreutils/manual/coreutils.html#Formatting-file-contents)
    -   [4.1 `fmt`: Reformat paragraph text](https://www.gnu.org/software/coreutils/manual/coreutils.html#fmt-invocation)
    -   [4.2 `pr`: Paginate or columnate files for printing](https://www.gnu.org/software/coreutils/manual/coreutils.html#pr-invocation)
    -   [4.3 `fold`: Wrap input lines to fit in specified width](https://www.gnu.org/software/coreutils/manual/coreutils.html#fold-invocation)
-   [5 Output of parts of files](https://www.gnu.org/software/coreutils/manual/coreutils.html#Output-of-parts-of-files)
    -   [5.1 `head`: Output the first part of files](https://www.gnu.org/software/coreutils/manual/coreutils.html#head-invocation)
    -   [5.2 `tail`: Output the last part of files](https://www.gnu.org/software/coreutils/manual/coreutils.html#tail-invocation)
    -   [5.3 `split`: Split a file into pieces.](https://www.gnu.org/software/coreutils/manual/coreutils.html#split-invocation)
    -   [5.4 `csplit`: Split a file into context-determined pieces](https://www.gnu.org/software/coreutils/manual/coreutils.html#csplit-invocation)
-   [6 Summarizing files](https://www.gnu.org/software/coreutils/manual/coreutils.html#Summarizing-files)
    -   [6.1 `wc`: Print newline, word, and byte counts](https://www.gnu.org/software/coreutils/manual/coreutils.html#wc-invocation)
    -   [6.2 `sum`: Print checksum and block counts](https://www.gnu.org/software/coreutils/manual/coreutils.html#sum-invocation)
    -   [6.3 `cksum`: Print CRC checksum and byte counts](https://www.gnu.org/software/coreutils/manual/coreutils.html#cksum-invocation)
    -   [6.4 `b2sum`: Print or check BLAKE2 digests](https://www.gnu.org/software/coreutils/manual/coreutils.html#b2sum-invocation)
    -   [6.5 `md5sum`: Print or check MD5 digests](https://www.gnu.org/software/coreutils/manual/coreutils.html#md5sum-invocation)
    -   [6.6 `sha1sum`: Print or check SHA-1 digests](https://www.gnu.org/software/coreutils/manual/coreutils.html#sha1sum-invocation)
    -   [6.7 `sha2` utilities: Print or check SHA-2 digests](https://www.gnu.org/software/coreutils/manual/coreutils.html#sha2-utilities)
-   [7 Operating on sorted files](https://www.gnu.org/software/coreutils/manual/coreutils.html#Operating-on-sorted-files)
    -   [7.1 `sort`: Sort text files](https://www.gnu.org/software/coreutils/manual/coreutils.html#sort-invocation)
    -   [7.2 `shuf`: Shuffling text](https://www.gnu.org/software/coreutils/manual/coreutils.html#shuf-invocation)
    -   [7.3 `uniq`: Uniquify files](https://www.gnu.org/software/coreutils/manual/coreutils.html#uniq-invocation)
    -   [7.4 `comm`: Compare two sorted files line by line](https://www.gnu.org/software/coreutils/manual/coreutils.html#comm-invocation)
    -   [7.5 `ptx`: Produce permuted indexes](https://www.gnu.org/software/coreutils/manual/coreutils.html#ptx-invocation)
    -   [7.6 `tsort`: Topological sort](https://www.gnu.org/software/coreutils/manual/coreutils.html#tsort-invocation)
-   [8 Operating on fields](https://www.gnu.org/software/coreutils/manual/coreutils.html#Operating-on-fields)
    -   [8.1 `cut`: Print selected parts of lines](https://www.gnu.org/software/coreutils/manual/coreutils.html#cut-invocation)
    -   [8.2 `paste`: Merge lines of files](https://www.gnu.org/software/coreutils/manual/coreutils.html#paste-invocation)
    -   [8.3 `join`: Join lines on a common field](https://www.gnu.org/software/coreutils/manual/coreutils.html#join-invocation)
-   [9 Operating on characters](https://www.gnu.org/software/coreutils/manual/coreutils.html#Operating-on-characters)
    -   [9.1 `tr`: Translate, squeeze, and/or delete characters](https://www.gnu.org/software/coreutils/manual/coreutils.html#tr-invocation)
    -   [9.2 `expand`: Convert tabs to spaces](https://www.gnu.org/software/coreutils/manual/coreutils.html#expand-invocation)
    -   [9.3 `unexpand`: Convert spaces to tabs](https://www.gnu.org/software/coreutils/manual/coreutils.html#unexpand-invocation)
-   [10 Directory listing](https://www.gnu.org/software/coreutils/manual/coreutils.html#Directory-listing)
    -   [10.1 `ls`: List directory contents](https://www.gnu.org/software/coreutils/manual/coreutils.html#ls-invocation)
    -   [10.2 `dir`: Briefly list directory contents](https://www.gnu.org/software/coreutils/manual/coreutils.html#dir-invocation)
    -   [10.3 `vdir`: Verbosely list directory contents](https://www.gnu.org/software/coreutils/manual/coreutils.html#vdir-invocation)
    -   [10.4 `dircolors`: Color setup for `ls`](https://www.gnu.org/software/coreutils/manual/coreutils.html#dircolors-invocation)
-   [11 Basic operations](https://www.gnu.org/software/coreutils/manual/coreutils.html#Basic-operations)
    -   [11.1 `cp`: Copy files and directories](https://www.gnu.org/software/coreutils/manual/coreutils.html#cp-invocation)
    -   [11.2 `dd`: Convert and copy a file](https://www.gnu.org/software/coreutils/manual/coreutils.html#dd-invocation)
    -   [11.3 `install`: Copy files and set attributes](https://www.gnu.org/software/coreutils/manual/coreutils.html#install-invocation)
    -   [11.4 `mv`: Move (rename) files](https://www.gnu.org/software/coreutils/manual/coreutils.html#mv-invocation)
    -   [11.5 `rm`: Remove files or directories](https://www.gnu.org/software/coreutils/manual/coreutils.html#rm-invocation)
    -   [11.6 `shred`: Remove files more securely](https://www.gnu.org/software/coreutils/manual/coreutils.html#shred-invocation)
-   [12 Special file types](https://www.gnu.org/software/coreutils/manual/coreutils.html#Special-file-types)
    -   [12.1 `link`: Make a hard link via the link syscall](https://www.gnu.org/software/coreutils/manual/coreutils.html#link-invocation)
    -   [12.2 `ln`: Make links between files](https://www.gnu.org/software/coreutils/manual/coreutils.html#ln-invocation)
    -   [12.3 `mkdir`: Make directories](https://www.gnu.org/software/coreutils/manual/coreutils.html#mkdir-invocation)
    -   [12.4 `mkfifo`: Make FIFOs (named pipes)](https://www.gnu.org/software/coreutils/manual/coreutils.html#mkfifo-invocation)
    -   [12.5 `mknod`: Make block or character special files](https://www.gnu.org/software/coreutils/manual/coreutils.html#mknod-invocation)
    -   [12.6 `readlink`: Print value of a symlink or canonical file name](https://www.gnu.org/software/coreutils/manual/coreutils.html#readlink-invocation)
    -   [12.7 `rmdir`: Remove empty directories](https://www.gnu.org/software/coreutils/manual/coreutils.html#rmdir-invocation)
    -   [12.8 `unlink`: Remove files via the unlink syscall](https://www.gnu.org/software/coreutils/manual/coreutils.html#unlink-invocation)
-   [13 Changing file attributes](https://www.gnu.org/software/coreutils/manual/coreutils.html#Changing-file-attributes)
    -   [13.1 `chown`: Change file owner and group](https://www.gnu.org/software/coreutils/manual/coreutils.html#chown-invocation)
    -   [13.2 `chgrp`: Change group ownership](https://www.gnu.org/software/coreutils/manual/coreutils.html#chgrp-invocation)
    -   [13.3 `chmod`: Change access permissions](https://www.gnu.org/software/coreutils/manual/coreutils.html#chmod-invocation)
    -   [13.4 `touch`: Change file timestamps](https://www.gnu.org/software/coreutils/manual/coreutils.html#touch-invocation)
-   [14 Disk usage](https://www.gnu.org/software/coreutils/manual/coreutils.html#Disk-usage)
    -   [14.1 `df`: Report file system disk space usage](https://www.gnu.org/software/coreutils/manual/coreutils.html#df-invocation)
    -   [14.2 `du`: Estimate file space usage](https://www.gnu.org/software/coreutils/manual/coreutils.html#du-invocation)
    -   [14.3 `stat`: Report file or file system status](https://www.gnu.org/software/coreutils/manual/coreutils.html#stat-invocation)
    -   [14.4 `sync`: Synchronize cached writes to persistent storage](https://www.gnu.org/software/coreutils/manual/coreutils.html#sync-invocation)
    -   [14.5 `truncate`: Shrink or extend the size of a file](https://www.gnu.org/software/coreutils/manual/coreutils.html#truncate-invocation)
-   [15 Printing text](https://www.gnu.org/software/coreutils/manual/coreutils.html#Printing-text)
    -   [15.1 `echo`: Print a line of text](https://www.gnu.org/software/coreutils/manual/coreutils.html#echo-invocation)
    -   [15.2 `printf`: Format and print data](https://www.gnu.org/software/coreutils/manual/coreutils.html#printf-invocation)
    -   [15.3 `yes`: Print a string until interrupted](https://www.gnu.org/software/coreutils/manual/coreutils.html#yes-invocation)
-   [16 Conditions](https://www.gnu.org/software/coreutils/manual/coreutils.html#Conditions)
    -   [16.1 `false`: Do nothing, unsuccessfully](https://www.gnu.org/software/coreutils/manual/coreutils.html#false-invocation)
    -   [16.2 `true`: Do nothing, successfully](https://www.gnu.org/software/coreutils/manual/coreutils.html#true-invocation)
    -   [16.3 `test`: Check file types and compare values](https://www.gnu.org/software/coreutils/manual/coreutils.html#test-invocation)
    -   [16.4 `expr`: Evaluate expressions](https://www.gnu.org/software/coreutils/manual/coreutils.html#expr-invocation)
-   [17 Redirection](https://www.gnu.org/software/coreutils/manual/coreutils.html#Redirection)
    -   [17.1 `tee`: Redirect output to multiple files or processes](https://www.gnu.org/software/coreutils/manual/coreutils.html#tee-invocation)
-   [18 File name manipulation](https://www.gnu.org/software/coreutils/manual/coreutils.html#File-name-manipulation)
    -   [18.1 `basename`: Strip directory and suffix from a file name](https://www.gnu.org/software/coreutils/manual/coreutils.html#basename-invocation)
    -   [18.2 `dirname`: Strip last file name component](https://www.gnu.org/software/coreutils/manual/coreutils.html#dirname-invocation)
    -   [18.3 `pathchk`: Check file name validity and portability](https://www.gnu.org/software/coreutils/manual/coreutils.html#pathchk-invocation)
    -   [18.4 `mktemp`: Create temporary file or directory](https://www.gnu.org/software/coreutils/manual/coreutils.html#mktemp-invocation)
    -   [18.5 `realpath`: Print the resolved file name.](https://www.gnu.org/software/coreutils/manual/coreutils.html#realpath-invocation)
-   [19 Working context](https://www.gnu.org/software/coreutils/manual/coreutils.html#Working-context)
    -   [19.1 `pwd`: Print working directory](https://www.gnu.org/software/coreutils/manual/coreutils.html#pwd-invocation)
    -   [19.2 `stty`: Print or change terminal characteristics](https://www.gnu.org/software/coreutils/manual/coreutils.html#stty-invocation)
    -   [19.3 `printenv`: Print all or some environment variables](https://www.gnu.org/software/coreutils/manual/coreutils.html#printenv-invocation)
    -   [19.4 `tty`: Print file name of terminal on standard input](https://www.gnu.org/software/coreutils/manual/coreutils.html#tty-invocation)
-   [20 User information](https://www.gnu.org/software/coreutils/manual/coreutils.html#User-information)
    -   [20.1 `id`: Print user identity](https://www.gnu.org/software/coreutils/manual/coreutils.html#id-invocation)
    -   [20.2 `logname`: Print current login name](https://www.gnu.org/software/coreutils/manual/coreutils.html#logname-invocation)
    -   [20.3 `whoami`: Print effective user ID](https://www.gnu.org/software/coreutils/manual/coreutils.html#whoami-invocation)
    -   [20.4 `groups`: Print group names a user is in](https://www.gnu.org/software/coreutils/manual/coreutils.html#groups-invocation)
    -   [20.5 `users`: Print login names of users currently logged in](https://www.gnu.org/software/coreutils/manual/coreutils.html#users-invocation)
    -   [20.6 `who`: Print who is currently logged in](https://www.gnu.org/software/coreutils/manual/coreutils.html#who-invocation)
-   [21 System context](https://www.gnu.org/software/coreutils/manual/coreutils.html#System-context)
    -   [21.1 `date`: Print or set system date and time](https://www.gnu.org/software/coreutils/manual/coreutils.html#date-invocation)
    -   [21.2 `arch`: Print machine hardware name](https://www.gnu.org/software/coreutils/manual/coreutils.html#arch-invocation)
    -   [21.3 `nproc`: Print the number of available processors](https://www.gnu.org/software/coreutils/manual/coreutils.html#nproc-invocation)
    -   [21.4 `uname`: Print system information](https://www.gnu.org/software/coreutils/manual/coreutils.html#uname-invocation)
    -   [21.5 `hostname`: Print or set system name](https://www.gnu.org/software/coreutils/manual/coreutils.html#hostname-invocation)
    -   [21.6 `hostid`: Print numeric host identifier](https://www.gnu.org/software/coreutils/manual/coreutils.html#hostid-invocation)
    -   [21.7 `uptime`: Print system uptime and load](https://www.gnu.org/software/coreutils/manual/coreutils.html#uptime-invocation)
-   [22 SELinux context](https://www.gnu.org/software/coreutils/manual/coreutils.html#SELinux-context)
    -   [22.1 `chcon`: Change SELinux context of file](https://www.gnu.org/software/coreutils/manual/coreutils.html#chcon-invocation)
    -   [22.2 `runcon`: Run a command in specified SELinux context](https://www.gnu.org/software/coreutils/manual/coreutils.html#runcon-invocation)
-   [23 Modified command invocation](https://www.gnu.org/software/coreutils/manual/coreutils.html#Modified-command-invocation)
    -   [23.1 `chroot`: Run a command with a different root directory](https://www.gnu.org/software/coreutils/manual/coreutils.html#chroot-invocation)
    -   [23.2 `env`: Run a command in a modified environment](https://www.gnu.org/software/coreutils/manual/coreutils.html#env-invocation)
    -   [23.3 `nice`: Run a command with modified niceness](https://www.gnu.org/software/coreutils/manual/coreutils.html#nice-invocation)
    -   [23.4 `nohup`: Run a command immune to hangups](https://www.gnu.org/software/coreutils/manual/coreutils.html#nohup-invocation)
    -   [23.5 `stdbuf`: Run a command with modified I/O stream buffering](https://www.gnu.org/software/coreutils/manual/coreutils.html#stdbuf-invocation)
    -   [23.6 `timeout`: Run a command with a time limit](https://www.gnu.org/software/coreutils/manual/coreutils.html#timeout-invocation)
-   [24 Process control](https://www.gnu.org/software/coreutils/manual/coreutils.html#Process-control)
    -   [24.1 `kill`: Send a signal to processes](https://www.gnu.org/software/coreutils/manual/coreutils.html#kill-invocation)
-   [25 Delaying](https://www.gnu.org/software/coreutils/manual/coreutils.html#Delaying)
    -   [25.1 `sleep`: Delay for a specified time](https://www.gnu.org/software/coreutils/manual/coreutils.html#sleep-invocation)
-   [26 Numeric operations](https://www.gnu.org/software/coreutils/manual/coreutils.html#Numeric-operations)
    -   [26.1 `factor`: Print prime factors](https://www.gnu.org/software/coreutils/manual/coreutils.html#factor-invocation)
    -   [26.2 `numfmt`: Reformat numbers](https://www.gnu.org/software/coreutils/manual/coreutils.html#numfmt-invocation)
    -   [26.3 `seq`: Print numeric sequences](https://www.gnu.org/software/coreutils/manual/coreutils.html#seq-invocation)
-   [27 File permissions](https://www.gnu.org/software/coreutils/manual/coreutils.html#File-permissions)
-   [28 File timestamps](https://www.gnu.org/software/coreutils/manual/coreutils.html#File-timestamps)
-   [29 Date input formats](https://www.gnu.org/software/coreutils/manual/coreutils.html#Date-input-formats)
    -   [29.11 Authors of `parse_datetime`](https://www.gnu.org/software/coreutils/manual/coreutils.html#Authors-of-parse_005fdatetime)
-   [31 Opening the Software Toolbox](https://www.gnu.org/software/coreutils/manual/coreutils.html#Opening-the-software-toolbox)
    -   [The `who` Command](https://www.gnu.org/software/coreutils/manual/coreutils.html#The-who-command)
    -   [The `cut` Command](https://www.gnu.org/software/coreutils/manual/coreutils.html#The-cut-command)
    -   [The `sort` Command](https://www.gnu.org/software/coreutils/manual/coreutils.html#The-sort-command)
    -   [The `uniq` Command](https://www.gnu.org/software/coreutils/manual/coreutils.html#The-uniq-command)
-   [Appendix A GNU Free Documentation License](https://www.gnu.org/software/coreutils/manual/coreutils.html#GNU-Free-Documentation-License)
-   [Index](https://www.gnu.org/software/coreutils/manual/coreutils.html#Concept-index)


## Logic  

| `-b file ` | true if the file is a block special file  |
| `-c file ` | true if the file is a character special file  |
| `-d file ` | true if the file is a directory  |
| `-e file ` | true if the file exists  |
| `-f file ` | true if the file is an ordinary file  |
| `-g file ` | true if setgid attribute is ON(system attribute  on Windows)  |
| `-h file ` | true if file is a symbolic link  |
| `-k file ` | true if the save text attribute of the file is ON(archive attribute  on Windows)  |
| `-L file ` | true if file is a symbolic link  |
| `-n string ` | true if the length of string is greater than zero  |
| `-p file ` | true if the file is a FIFO (named pipe)  |
| `-r file ` | true if the file is readable  |
| `-s file ` | true if the size of the file is non-zero  |
| `-t fd ` | true if the numeric file descriptor fd is open and associated with a terminal  |
| `-u file ` | true if the setuid attribute is ON(hidden attribute on Windows)  |
| `-w file ` | true if the file is writable  |
| -x file  | true if the file is executable.  |
| -z string  | true if the length of the string is zero |

*1 If the specified file does not exist, test checks each extension in the PATHEXT environment variable (in the order listed) to see if a file exists with the specified name plus that extension. If such a file does exist and it is executable, -x returns true.


Integer COmparison

| -eq | number1 -eq number2  | true if number1 and number2 are equal |

Both number1 and number2 must be integers

| -ge | number1 -ge number2  | true if number1 is greater than or equal to number2 |
| -gt | number -gt number  | true if number1 is greater than number2 |
| -le | number1 -le number2  | true if the first number1 is less than or equal to number2 |
| -lt | number1 -lt number2  | true if number1 is less than number2 |
| -ne | number1 -ne number2  | true if number1 is not equal to number2 |
| -nt | file1 -nt file2  | true if file1 is newer than file2 *^2^|
| -ot | file1 -ot file2  | true if file1 is older than file2 |
| -ef | file1 -ef file2  | true if file1 has the same device and i-node number as file2 |

Note:
A nonexistent file is considered to be older than any existing file. In turn, no existing file is older than a nonexistent file. Two nonexistent files are considered the same age.

Using `[[ ]]`

string `==` pattern 
string `=` pattern - true if string matches pattern
string `!=` pattern  - true if string does not match pattern.
string1 < string2 true if string1 comes before string2 alphabetically.
string1 > string2 - true if string1 comes after string2 alphabetically.

The following operators allow you to combine other operators:

expr1 -a expr2 (test and [ commands) 
expr1 && expr2 ([[ command) 
logical AND; true if both expr1 and expr2 are true

expr1 -o expr2 (test and [ commands) 
expr1 || expr2 ([[ command) 
logical OR; true if either expr1 or expr2 is true

`! expr ` logical negation; true if expr is false

`( expr ) ` binding; true if expr is true

The precedence of the operators, in descending order, is:

parenthesized expressions
unary operators
comparison operators
logical AND
logical OR

The following operators handle string comparisons for the test and [ commands:

string 
true if string is not a null string

string1 = string2 
true if string1 and string2 are identical

string1 != string2 
true if string1 and string2 are not identical
Note:If the specified file does not exist, test checks each extension in the PATHEXT environment variable (in the order listed) to see if a file exists with the specified name plus that extension. If such a file does exist and it is executable, -x returns true.


## Networking


Important commnds
- ip
- route
- ifconfig
- ping
 

Unorganized Commansa from History TODO

 ```sh
 ping 169.254.0.1
 ping -I 169.254.0.2 169.254.0.1
 ping -I eth4 169.254.0.1

 ping -c 4 -d -I eth4 169.254.0.2

 ip addr show
 ip -c route show


 ip route del 169.254.0.0/16 metric 105 dev br5
 route del default dev eth4
 ip -c route show to match 169.254.0.1
 ip -c route show to match 169.254.0.2
 ip -c route delete help
 ip route show
 ip route del
 ip route del -net 0/0 dev eth4
 ip route del  0/0 dev eth4                                                                          


 ip -c route del default dev br5
 ip -c route delete 169.254.0.0/16 dev br5
 ip -c route delete 169.254.0.0/16 gw 169.254.99.20 dev br5
 ip -c route delete 169.254.0.0/16 via 169.254.99.20 dev br5
 ip -c route delete gw 169.254.99.20 dev br5
 ip -c route delete 169.254.99.20 dev br5
ip rule show
 ip route get 169.254.0.1
 ip route get 192.168.1.25
 ip route get 8.8.8.8

 ifconfig 

 ip route show
 route 
 route help
 route del
 route add
 route add -host 169.254.0.1 metric 1 dev eth4
 route add -net 169.254.0.1/24 metric 1 dev eth4
 route add -net 169.254.0.0/24 metric 1 dev eth4                                                        
 route del 169.254.0.0/16 dev br5

 iptables -nvL
 iptables -nvL -t nat

 ```

 ### SPLIT $PATH into parts


 IFS=: read -r -a patharr <<<"$PATH"

 IFS=: read -r -a patharr <<<"$PATH"
printf %s\\n "${patharr[@]}"

for dir in "${patharr[@]}"; do
    echo "$dir"
done