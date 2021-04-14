#! usr/bin/code

----
----
# - Shell Scripting Intro
----
----

## Resources

[Bash Beginners Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html)


- `/etc/shells` - contains a list of available shells

```bash
        alt@andylaptop-popos:~$ cat /etc/shells
        # /etc/shells: valid login shells
        /bin/sh
        /bin/bash
        /bin/rbash
        /bin/dash
        bin/zsh
        /usr/bin/zsh
        /bin/zsh-static
        alt@andylaptop-popos:~$ which bash
        /bin/bash
```

Editors
- code .
- vim
- nano
- gedit
- atom

## Shebang or Hashbang

A script does not require `*.sh` to run, but it helps the editor know how to interpret it.

```bash
alt@andylaptop-popos:~$ which bash
/bin/bash

#<-Inside File
#! /bin/bash
<-Start File->
```


## Path Vars:

        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

From the above command- `${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}`

Seems to suggest that we go to ZSH_CUSTOM but if it doesnt exist, the latter.


## Permissions


Looking at Privledges

        $ touch test.sh
        $ ls -l *.sh
        >> -rw-rw-r-- 1 user user 0 Tod 00 00:00 test.sh

`touch` creates priviledges that are rw for user and group, and r for others, but not at all execute, in the case of an *.sh (shell script file)

`chmod +x test.sh`

Adds +x to all   == -rwxrwxr-x

## Comments

`#` marks a comment line

## Variables


### Special Vars (Summary of Below)

`$(uname)` returns the system script is on- works at least on Linux and MacOS

`$0` - script name

`$1`-`$99`- params

`$#` or `$@`

`$REPLY` - stores the response of the `read` command

`${#Var}` gives the length of a var

### System

Generally Indicated by all caps.

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

Some examples:

```bash
echo Our Shell Name is $BASH
echo Our Shell Version is $BASH_VERSION
echo Our home directory is $HOME

name=Mark
10val=10
echo The name is $name
>Mark
echo value $10val
>value 0val

val=10
echo value is $val
# Variables cannot start with a number.
```

#### Preserving Whitespace (Quoted Variables)

 The quoted variable preserves whitespace. Unquoted, however, it removes tabs and newlines.

        echo $a
        echo "$a"

### Command Substitution

Two methods:

!!!note: [[`]] (Backtick)
                command_1 `command_2 −options`
        This will execute "command_2" and it's output will become the input to "command_1".

!!!note: [[$]] (Dollar Sign)
                command_1 $(command_2 -options)
        Same as above

The _pipe_ command `|`- will do the same thing:

                cat file1.txt file2.txt | less

#### Syntax

##### `{}` vs `()`

`{varname}` seems used to dereference a variable

`signal=$(nmcli device wifi | grep \* | awk '{print $6}')`

note the `$()` around the expression

There is no dollar sign required in front of ${print $6}

in this case `$6` is the variable that stores the 6th result of awk.

`echo $signal` and ``echo ${signal}` produce the same output


Is done using `$()` or ``` \`func\` ``` (back quotes)

```sh
textfile_listing=`ls *.txt`
# Variable contains names of all *.txt files in current working directory.
echo $textfile_listing

textfile_listing2=$(ls *.txt)   # The alternative form of command substitution.
echo $textfile_listing2
# Same result.
```

Command substitution may result in word splitting.

```sh
COMMAND `echo a b`     # 2 args: a and b
COMMAND "`echo a b`"   # 1 arg: "a b"
COMMAND `echo`         # no arg
COMMAND "`echo`"       # one empty arg
```

Where COMMAND is any command

An interesting example

```sh
old_tty_setting=$(stty -g)   # Save old terminal setting.
echo "Hit a key "
stty -icanon -echo           # Disable "canonical" mode for terminal.
                             # Also, disable *local* echo.
key=$(dd bs=1 count=1 2> /dev/null)   # Using 'dd' to get a keypress.
stty "$old_tty_setting"      # Restore old setting.
echo "You hit ${#key} key."  # ${#variable} = number of characters in $variable
#
# Hit any key except RETURN, and the output is "You hit 1 key."
# Hit RETURN, and it's "You hit 0 key."
```
Command substitution even permits setting a variable to the contents of a file, using either redirection or the cat command.


```sh
variable1=`<file1`      #  Set "variable1" to contents of "file1".
variable2=`cat file2`   #  Set "variable2" to contents of "file2".
                        #  This, however, forks a new process,
                        #+ so the line of code executes slower than the above version.

#  Note that the variables may contain embedded whitespace,
#+ or even (horrors), control characters.

#  It is not necessary to explicitly assign a variable.
echo "` <$0`"           # Echoes the script itself to stdout.
```

if [ -e "/proc/ide/${disk[$device]}/media" ] ; then
             hdmedia=`cat /proc/ide/${disk[$device]}/media`
...
fi

output=$(sed -n /"$1"/p $file)

Using vars within a command

```sh
#ALL THESE WAYS DONT WORK
myvar="this is a test"
echo $myvar
echo $myvar | awk {'print $3'}
var=$myvar | awk {'print $3'}
var="$myvar | awk {'print $3'}"
var='$myvar | awk {'print $3'}'
var=( $myvar | awk {'print $3'} )
var=(( $myvar | awk {'print $3'} ))
var={ $myvar | awk {'print $3'} }
var=${ $myvar | awk {'print $3'} }
var=$( $myvar | awk {'print $3'} )
var=[ $myvar | awk {'print $3'} ]
var=$( myvar | awk {'print $3'} )
var=$( $myvar | awk {'print $3'} )
var=$(( myvar | awk {'print $3'} ))
var=$(( $myvar | awk {'print $3'} ))
var=$( $myvar | awk {'print $3'} )
var=$( $myvar )
var=$myvar | awk {'print $3'}
echo $myvar | awk {'print $3'}
var=echo $myvar | awk {'print $3'}
var=`$myvar | awk {'print $3'}`
var="`$myvar | awk {'print $3'}`"
var= ${ [$myvar] | awk {'print $3'} }
var= $[[$myvar] | awk {'print $3'} ]
[$myvar] | awk {'print $3'}
[$myvar] > awk {'print $3'}
var= $("$myvar" | awk {'print $3')
var= $("echo $myvar" | awk {'print $3')
echo $myvar | awk {'print $3'}
var="echo $myvar | awk {'print $3'}"
 var=$("echo $myvar" | awk {'print $3'})


##THESE DO WORK
var=$(echo $myvar | awk {'print $3'})
var='echo $myvar | awk {'print $3'}'
var=$(echo "$myvar" | awk {'print $3'})
```

This finally worked from [here](https://unix.stackexchange.com/questions/163810/grep-on-a-variable)

using [Here Strings](http://linux.die.net/abs-guide/x15683.h)

```sh
restwo=$(grep 'Installed'<<<"$res")
```

Another example: appears inside a function but uses the hash mark to signify

We had to assign all the input values to the variable message first as `${#@}` would tell us how many command line arguments there were instead of the number of characters combined.

input_length=${#message}

```sh
message=$@
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
```


#### System variable (Environment Var)

`export ZSH="/home/alt/.oh-my-zsh"`

Reference (substitute) with `$` eg

`source $ZSH/oh-my-zsh.sh`

## Getting User input

`read` - used to get User input

```bash
echo "Enter name : "
read name
echo "Entered name : $name"
```
        read VAR
        $VAR

        read name1 name2 name3
        echo $name1
        echo $name2
        echo $name3

### Leave the input on the same line

                read -p 'username : ' user_var
                echo "username : $user_var"

                read -sp 'password : ' pass_var
                echo "password : $pass_var"

### Read as an array

                echo "Enter names : "
                read -a names
                echo "Names : ${names[0]}, ${names[1]}

### Read without var

                read
                echo "Result $REPLY"

By default the result of `read` goes into `$REPLY`

____

## Passing arguments to a BASH script

By default- arguments are stored in `$1`, `$2`, `$3`, `$4`

`$0` stores the actual file name.

`$test.sh Mark Tom John` passing the variables from the command line.

Can also store args as an array:

                args=("$@")

This will tell bash to store the arguments as an array

                echo ${args[0]} ${args[1]} ${args[2]}

                echo $@

This prints each of the items in an array.

                echo $#

This prints the number of items in the array

`$@` - combine to array, or extract
`$#` -  count the size of an array

  Passing values to a function is the same.


Can also use Zennity


## Heredoc

<!-- Todo look up more on this for now just an example: -->

[Commands · zsh-users/antigen Wiki](https://github.com/zsh-users/antigen/wiki/Commands)

> The easiest way to do this, is using the heredoc syntax.
> 
>     antigen bundles <<EOBUNDLES
>       # Guess what to install when running an unknown command.
>       command-not-found
>     
>       # The heroku tool helper plugin.
>       heroku
>     EOBUNDLES
>     
> 
> This is equivalent to
> 
>     antigen bundle command-not-found
>     antigen bundle heroku
>     
> 
> Of course, as you can see, from the lines piped to `antigen bundles`, empty lines and those starting with a `#` are ignored. The rest are passed to `antigen bundle` without any quoting rules ~~applied.~~


Heres a quick description as my attempt to use it failed.


[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> In Linux, **here document (also commonly referred to as heredoc) refers to a special block of code that contains multi-line strings that will be redirected to a command**. On the other hand, **here string is a simpler version of heredoc, offering somewhat similar functionality, albeit not as powerful as the latter**.



```sh

ssh -T baeldung@example.com "touch log1.txt"
ssh -T baeldung@example.com "touch log2.txt"

#becomes:

ssh -T baeldung@host.com << EOF
touch log1.txt
touch log2.txt
EOF

cat <<-EOF
    This message is indented
        This message is double indented
EOF


```

Note the last example above- the `-EOF` the `-` suppresses tabs so that we can tab things over for readability but wont pass it into output.

However, white spaces will not be suppressed even with the dash prefix.

also, `cat` works to print output of multiple lines to the stdout but `echo` does not.


The delimiter token can be any value as long as it is unique enough that it won’t appear within the content


### Disable a block of code



[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> 3.7. Disable Block of Code Using Here Document[](https://www.baeldung.com/linux/heredoc-herestring#7-disable-block-of-code-using-here-document)
> 
>instead of adding a prefix every line of the code with a ‘#’ to make them into comments,  we can do it much more efficiently using **heredoc** with the dummy command `‘:’.` For example, we can disable several lines of code in our shell script:
> 
>     #!/bin/bash
>     # disable-with-heredoc.sh
>     
>     : <<'DISABLED'
>     echo "This line will not show up in the console.
>     echo "Neither will this line.
>     DISABLED
>     
>     echo "This line will be printed to the console



In the case that we want to escape all the special characters, we can either quote the delimiter token or prefix the delimiter token with a backslash.

The three different ways of escaping all the special characters are:

`'EOF'` `"EOF"` `\EOF`

```sh
    cat <<'EOF'
    Some Special Characters: $ \ `
    EOF

    cat <<"EOF"
    Some Special Characters: $ \ `
    EOF

    cat <<\EOF
    Some Special Characters: $ \ `
    EOF
```

### Substitutions


[Here Document With Parameter Substitution](https://www.baeldung.com/linux/heredoc-herestring#3-here-document-with-parameter-substitution)
> 
> We can also parameterize a heredoc by using variables, thereby making it dynamic. For example, we can change the output of a heredoc based on the value of a parameter:
> 
>```sh
>   cat <<EOF
>     Hello ${USER}
>     EOF
> 
>```
> The output will then be customized based on the value of the variable _USER_.


[Here Document With Command Substitution](https://www.baeldung.com/linux/heredoc-herestring#4-here-document-with-command-substitution)

> In addition to parameters, heredoc also supports ==command substitution== in its content. For example, let’s say we want to customize the output such that it always print the current date and time:
> 
>```sh
>     cat <<EOF
>     Hello! It is currently: $(date)
>     EOF
>```
>
> Now, whenever we run the command above, the output will always have the current date and time.
> 

[Passing Arguments to Function With Here Document](https://www.baeldung.com/linux/heredoc-herestring#5-passing-arguments-to-function-with-here-document)
> 
> We can also make use of heredoc to pass arguments to a function that otherwise requires interactive user input. For example, let’s consider the following function:
> 
>```sh
>     LoginToModule()
>     {
>         read -p "Username: " username
>         read -p "Passphrase: " passphrase
>         echo "Obtained input ${username} and ${passphrase}"
>     }
>```
> 
> When invoked, the function will wait for the user’s input to capture the value for variable _username_ and _passphrase_:
> 
>```sh
>     LoginToModule
>     Username: baeldung
>     Passphrase: secret
>     Obtained input baeldung and secret
>```
> 
> Other than supplying the input interactively, we can construct a heredoc to pass the values:
> 
>```sh
>     LoginToModule <<EOF
>     adminuser
>     adminpassphrase
>     EOF
>```


Another example of the last case comes 
From: [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/Bash-Beginners-Guide.html#sect_08_01)

> Although we talk about a _here document_, it is supposed to be a construct within the same script. This is an example that installs a package automatically, eventhough you should normally confirm:
> 
> #!/bin/bash
>  
> # This script installs packages automatically, using yum.
>  
> if \[ $# -lt 1 \]; then
>         echo "Usage: $0 package."
>         exit 1
> fi
>  
> yum install $1 << CONFIRM
> y
> CONFIRM
____
## HereString  “<<<” 

 much simpler version of heredoc. For that reason, here string does not need a delimiter token. It is usually preferred whenever we need a quick way to redirect some strings into a command.

[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> 4.1. Syntax[](https://www.baeldung.com/linux/heredoc-herestring#1-syntax-1)
> 
> To construct a here string, we use “<<<” operator to redirect a string into a command. Concretely, the syntax is:
> 
>     COMMAND <<< $VAR
> 
> What it essentially does is expanding the variable _VAR_ and redirect the output string to the _COMMAND._

[Here Document And Here String | Baeldung on Linux](https://www.baeldung.com/linux/heredoc-herestring)

> To escape special characters like $, \\, and \`, we can enclose the string with the single quote instead of the double quote:
> 
>     cat <<< 'Display special characters: $ ` \'
____


## LOGIC


### `[[` `[` `{` `(())`


**testing variables**

`if [ condition ]`
`if [[ condition ]]`

The double bracket, which is a shell **keyword,** enables additional functionality. For example, you can use `&&` and `||` instead of `-a` and `-o` and there's a regular expression matching operator `=~`.

Because `[[ ]]` is a keyword, must have spaces around it.


Also, in a simple test, double square brackets seem to evaluate quite a lot quicker than single ones. [From: ](https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-brackets-parentheses-curly-braces)



        $ time for ((i=0; i<10000000; i++)); do [[ "$i" = 1000 ]]; done

        real    0m24.548s
        user    0m24.337s
        sys 0m0.036s
        $ time for ((i=0; i<10000000; i++)); do [ "$i" = 1000 ]; done

        real    0m33.478s
        user    0m33.478s
        sys 0m0.000s

_**Braces**_        

The braces, in addition to delimiting a variable name are used for parameter expansion so you can do things like:

#### Truncate the contents of a variable

        $ var="abcde"; echo ${var%d*}
        abc


Note the `%` and the wildcard `*`

#### Make substitutions similar to sed

        $ var="abcde"; echo ${var/de/12}
        abc12


#### Use a default value


        $ default="hello"; unset var; echo ${var:-$default}
        hell
        
and several more

Also, brace expansions create lists of strings which are typically iterated over in loops:

$ echo f{oo,ee,a}d
food feed fad

$ mv error.log{,.OLD}
(error.log is renamed to error.log.OLD because the brace expression
expands to "mv error.log error.log.OLD")

$ for num in {000..2}; do echo "$num"; done
000
001
002

$ echo {00..8..2}
00 02 04 06 08

$ echo {D..T..4}
D H L P T
Note that the leading zero and increment features weren't available before Bash 4.

Thanks to gboffi for reminding me about brace expansions.


`false` and `true` are built in programs in sh.

```sh
$> type false && type true
        false is a shell builtin
        true is a shell builtin
```

You can set vars to equal them though

DEBUG=false
 if $DEBUG; then echo true; else echo false; fi

have to be careful with these vars though-  a non-empty string evaluates to true

`d="false"` will evaluate to true


```sh

 $DEBUG=false 
  if $DEBUG; then echo true; else echo false; fi

  ### Bad assignment - doesnt work = 
true
 DEBUG=false   #correct way
  if $DEBUG; then echo true; else echo false; fi 
false
 DEBUG=true   
  if $DEBUG; then echo true; else echo false; fi   
true
```

### IF

```sh
if [ condition ]
then
    statement
else
    statement
elif [ condition ]
then
    statement
fi #just one fi for elif

#Note Semicolon position
if [ $val -gt 5 ] ; then echo true; else echo false ; fi
```


There should be spaces before and after the brackets

        if _[_-f $file_name_]_

#### ELSE

```bash
#! /bin/bash

word=a

if [ $word == "b" ]
then
    echo "condition is True"
else
    echo "condition is False"
fi
>>>conition is False


if [[ $word == "b" ]]
then
    echo "condition b is True"
elif
    echo "condition is False"
fi
>>>conition is False
```

!!!warning - You must have a space around the brackets- e.g.:
        if [ $word == "b" ]

    not:

        if [ $word == "b"]

    or you will get

        >>./xxx.sh: line 14: [: missing `]'


### Comparison operators

#### integer comparators

| SYM       | Meaning               | Example           |
| --------- | --------------------- | ----------------- |
| ***-eq*** | equal                 | **[**`"$a" `[[-eq]]` "$b"`**]** |
| ***-ne*** | not-equal             | **[**`"$a" `[[-ne]]` "$b"`**]** |
| ***-gt*** | greater than          | **[**`"$a" `[[-gt]]` "$b"`**]** |
| ***-ge*** | greater than or equal | **[**`"$a" `[[-ge]]` "$b"`**]** |
| ***-lt*** | less than             | **[**`"$a" `[[-lt]]` "$b"`**]** |
| ***-le*** | less than or equal    | **[**`"$a" `[[-le]]` "$b"`**]** |
| ***`<`*** | less than             | **((**`"$a" `[[<]]`"$b"`**))**  |
| ***<=***  | less than or equal to | **((**`"$a"`[[<=]]`"$b"`**))**  |
| ***>***   | greater than          | **((**`"$a"`[[>]]`"$b"`**))**   |
| ***>=***  | less than or equal to | **((**`"$a"`[[>=]]`"$b"`**))**  |




```bash
#! /bin/bash

count=10

if [ $count -eq 10]
then
    echo "condition is True"
fi
>>>conition is True
```

#### String Comparison

| SYM  | Meaning                     | Example                                  |
| ---- | --------------------------- | ---------------------------------------- |
| `=`  | is equal to                 | `if` **[**`"$a" `[[=]]`  "$b"`**]** ^*^  |
| `==` | is equal to                 | `if` **[**`"$a" `[[==]]` "$b"`**]**      |
| `!=` | is NOT equal to             | `if` **[**`"$a" `[[!=]]` "$b"`**]**      |
| `<`  | is less than^**^            | `if` **\[\[**`"$a" `[[>]]` "$b"`**\]\]** |
| `>`  | is greater than^**^         | `if` **\[\[**`"$a" `[[<]]` "$b"`**\]\]** |
| `-z` | string is null, zero length | ??? `if \[\["$a" -z]]     ?              |

note the **null** operator - `-z`

*- in the example he used '[[' not '['
** -in ASCII alphabetic order

(There don't seem to be `<=` & `>=` for STRINGS)

```bash
#! /bin/bash

word=abc

if [ $word == "abc"]
then
    echo "condition is True"
fi
>>>conition is True
```

!!!warning Warning- Using `<, >, <=, >=` with strings and integers:
    integers - use **Double Parentheses** **(( ))**

        if (("$a"<"$b"))

    Strings- still abnormal- use **Double Square Brackets** **`[[`** and   **`]]`**

        if [["$a" > "$b"]]

    ? Most other comparisons use single brackets around the conditional.

        if ["$a" = "$b"]

    Although another example used

        if ["$a" = "$b"]

The test command takes one of the following syntax forms:

!!! Note 
    test EXPRESSION
    [ EXPRESSION ]
    [[ EXPRESSION ]]
    Copy
    If you want your script to be portable, you should prefer using the old test **[ command, which is available on all POSIX shells.** The new **upgraded version of the test command [[ (double brackets)** is supported on most modern systems using Bash, Zsh, and Ksh as a default shell.


Check if File Exists

#### File Comparison

| SYM      | Meaning                          | Example                     |
| -------- | -------------------------------- | --------------------------- |
| ***-e*** | File Exists                      | `if [ `[[-e]]` $file_name]` |
| ***-f*** | Is this a regular file & exist   | `[ -f $file_name]`          |
| ***-d*** | Does the Directory exist         | `[ -d $file_name]`          |
| ***-b*** | Is it a *block*/binary file      | `[ -b $file_name]`          |
| ***-c*** | Is it a *charcter* file          | `[ -c $file_name]`          |
| ***-s*** | Is it an *empty* file            | `[ -s $file_name]`          |
| ***-r*** | Do I have *read* permission      | `[ -r $file_name]`          |
| ***-w*** | Do I have *write* permission     | `[ -w $file_name]`          |
| ***-x*** | Do I have *execution* permission | `[ -x $file_name]`          |
 
 -g set group ID flag_ is set.

 -h symbolic link

[More](https://tldp.org/LDP/abs/html/fto.html)



<!-- ^(-\p{L}) (filename|file_descriptor|string)\t((Return )*([tT]rue)( if)*)(.*?)(\2)(.*)$   - [[`$1`]] `$2` - $4 **$5** $6 $7 *$8* $9-->
[ Expression ]	Meaning
- [[`-b`]] `filename` - Return **true** if *filename* is a _block special file._

- [[`-c`]] `filename` - Return **true** if *filename* exists and is a _character special file._

- [[`-d`]] `filename` - Return **true** *filename* exists and is a _directory._

- [[`-e`]] `filename` - Return **true** *filename* exists (regardless of type).

- [[`-f`]] `filename` - Return **true** *filename* exists and is a _regular file._

- [[`-g`]] `filename` - Return **true** *filename* exists and its _set group ID flag_ is set.

- [[`-h`]] `filename` - Return **true** *filename* exists and is a _symbolic link._ 
        This operator is retained for compatibility with previous versions of this program. Do not rely on its existence; use -L instead.

- [[`-k`]] `filename` - Return **true** *filename* exists and _its sticky bit is set._

- [[`-n`]]` filename` - Return true the length of string is nonzero.

- [[`-p`]] `filename` - Return **true** *filename* is _a named pipe (FIFO)._

- [[`-r`]] `filename` - Return **true** *filename* _exists and is readable._

- [[`-s`]] `filename` - Return **true** *filename* exists and has a size greater than zero.

- [[`-t`]] `file_descriptor` - Return **true** the filename whose file descriptor number is *file_descriptor* is open and is associated with a terminal.

- [[`-u`]] `filename` - Return **true** *filename* exists and its _set user ID flag_ is set.

- [[`-w`]] `filename` - Return **true** *filename* exists _and is writable._ 

    - True indicates only that the write flag is on. The file is not writable on a read-only file system even if this test indicates true.

- [[`-x`]] `filename` - Return **true** *filename* exists and 

    -  True indicates only that the execute flag is on. If file is a directory, true indicates that file can be searched.

- [[`-z`]] `string` - Return **true** the length of *string* is zero.

- [[`-L`]] `filename` - Return **true** *filename* exists and is a symbolic link.

- [[`-O`]] `filename` - Return **true** *filename* exists and its owner matches the effective user id of this process.

- [[`-G`]] `filename` - Return **true** *filename* exists and its group matches the effective group id of this process.

- [[`-S`]] `filename` - Return **true** *filename* exists and is a socket.

`file1` [[-nt ]]`file2`	True if file1 exists and is newer than file2.
`file1` [[-ot]] `file2`	True if file1 exists and is older than file2.
`file1` [[-ef]] `file2`	True if file1 and file2 exist and refer to the same file.


!!!!!Tip Tip: Testing if it exists on path:

    I used this to test if a program existed on path:
    

    ```sh
    if [[ -x $(which cp) ]]; then
    echo "$FILE exists."
        fi
    ```


Note echo uses the `-e` flag to allow escaped characters, `\c` keeps the cursor on the same line.

As a comparator `-e` checks if the file exists

```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -e $file_name]
then
   echo "$file_name found"
   if [ -r $file_name]
        echo "Cant Read"
   if [ -w $file_name]
        echo "Cant Write"
else
   echo "$file_name not found"
fi
```
Two types of files- a character file, or block file.

Character files are most with some text in it.  Block files are typically pictures, videos, music

```bash
#! /bin/bash
echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name]
then
    if [ -w $file_name]
    then
        echo -e "Enter some text data.  To exit press Ctrl + d"
        cat >> $file_name #Appends to the file
    else
        echo "The file does not have write permission"
    fi # Need a fi for each if.
else
    echo "$file_name does not exist"
fi
```

#### AND, OR

`&&`, `-a` and | or `||` `-o`

!!!warning Warning - pay special attention to the subtle format differences below

```bash
if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
if [ "$age" -gt 18 -a "$age" -lt 30 ]
if [[ "$age" -gt 18 && "$age" -lt 30 ]] # note the double brackets
#the above 3 are equivalento
then
    echo "valid age"
else
    echo "age not valid"
fi


if [ "$age" -gt 18 ] || [ "$age" -lt 30 ]
if [ "$age" -gt 18 -o "$age" -lt 30 ]
if [[ [ "$age" -gt 18 || "$age" -lt 30 ]] # note the double brackets
```



### CASE

Note the odd syntax here

Importantly - CASE MATCHES PATTERNS - not necessarily explicit values- see the example below

```bash
case <variable> in #line break after in
<pattern 1>) # terminated by a close parentheses...
    <commands> #bidy
;;              # terminated by a DOUBLE Semicolon
<pattern 2>)
<other commands>
;;
esac


case expression in
    pattern1 )
        statements ;;
    pattern2 )
        statements ;;
    ...
esac #case backwards
```

Double semicolon is important because one ';' is the same as a line break as in the FOR loop.  It can be on the same line or a separate one.


```bash
vehicle=$1 #first arg

case $vehicle in
    "car" )
        echo "car is $100" ;;
    "van" )
        echo " " ;;
    "bicycle" )
        echo " " ;;
    "truck" )
        echo " " ;;
    * ) # default case
        echo "unknown vehicle" ;;
esac

#!/bin/bash
# case example
case $1 in
    start)
        echo starting
        ;;
    stop)
        echo stoping
        ;;
    restart)
        echo restarting
        ;;
    *)
        echo don\'t know
        ;;
esac

```

Note that the value is matched by patterns- [1-5]* as in 15%

```sh
#more complicated

#!/bin/bash
# Print a message about disk useage.
space_free=$( df -h | awk '{ print $5 }' | sort -n | tail -n 1 | sed 's/%//' )
case $space_free in
[1-5]*)
echo Plenty of disk space available
;;
[6-7]*)
echo There could be a problem in the near future
;;
8*)
echo Maybe we should look at clearing out old files
;;
9*)
echo We could have a serious problem on our hands soon
;;
*)
echo Something is not quite right here
;;
esac
```

From a much more elaborate script (not sure if this is standard or clever) its used for param parsing--


#### Parameter parsing

An elaborate shell parsing example

```sh
#at the top

# Default values for option variables:
quiet=false
mode="copy"
clean=false
extension="otf"
patches=("Complete")
compat=()
installpath="user"

#then usage(){ } and version(){}

# Parse options
optspec=":qvhclLCsSUwOTAM-:"
while getopts "$optspec" optchar; do
  case "${optchar}" in

    # Short options
    q) quiet=true;;
    v) version; exit 0;;
    h) usage; exit 0;;
    c) mode="copy";;
    l) mode="link";;
    L) mode="list";;
    C) clean=true;;
    s) compat=( "${compat[@]}" "Nerd Font*Mono" );;
    w) compat=( "${compat[@]}" "Windows Compatible" );;
    O) extension="otf";;
    T) extension="ttf";;
    A) patches=("Complete");;
    M) patches=();;
    S) installpath="system";;
    U) installpath="user";;

    -)
      case "${OPTARG}" in
        # Long options
        quiet) quiet=true;;
        version) version; exit 0;;
        help) usage; exit 0;;
        copy) mode="copy";;
        link) mode="link";;
        list) mode="list";;
        clean) clean=true;;
        use-single-width-glyphs) compat=( "${compat[@]}" "Nerd Font*Mono" );;
        windows) compat=( "${compat[@]}" "Windows Compatible" );;
        otf) extension="otf";;
        ttf) extension="ttf";;
        complete) patches=("Complete");;
        minimal) patches=();;
        install-to-system-path) installpath="system";;
        install-to-user-path) installpath="user";;
        *)
          case "${OPTARG}" in
            # Long options that define variations
            fontawesome | fontlinux | octicons | pomicons)
              # If the user has picked one of these options,
              # we need to unset `Complete`
              delete=("Complete")
              patches=( "${patches[@]/${delete[0]}}" )
              case "${OPTARG}" in
                fontawesome) patches=( "${patches[@]}" "Font Awesome" );;
                fontlinux) patches=( "${patches[@]}" "Font Linux" );;
                octicons) patches=( "${patches[@]}" "Octicons" );;
                pomicons) patches=( "${patches[@]}" "Pomicons" );;
              esac;;
            *)
              echo "Unknown option --${OPTARG}" >&2
              usage >&2;
              exit 1
              ;;
          esac;;
      esac;;

    *)
      echo "Unknown option -${OPTARG}" >&2
      usage >&2
      exit 1
      ;;

  esac
done
shift $((OPTIND-1))


```


### FOR LOOP

```sh
for d in ./ligature/*/
do
    echo $d
done

for n in 1 2 3 4 5 ; do echo $n ; done
```

```sh
#!/bin/bash
# Basic for loop
names='Stan Kyle Cartman'
for name in $names
do
echo $name
done
echo All done

```

```sh
# loop through a directory

for f in *; do
    if [ -d "$f" ]; then
        # $f is a directory
        echo 'something'; else
        echo "someting else";
    fi
done

for f in /usr/bin/*; do
    echo ${f};
done

#### RANGES

While there is the numerical example above, thats more an array than a range-  alternatively you can say:

```sh
#!/bin/bash
# Basic range in for loop
for value in {1..5}
do
echo $value
done
echo All done
```

!!!warning Important: It's important when specifying a range like this that there are no spaces present between the curly brackets { }. If there are then it will not be seen as a range but as a list of items.

It is also possible to specify a value to increase or decrease by each time. You do this by adding another two dots ( .. ) and the value to step by

```sh
#!/bin/bash
# Basic range with steps for loop
for value in {10..0..2}
do
echo $value
done
echo "All done"
```

One of the more useful applications of for loops is in the processing of a set of files. To do this we may use wildcards. Let's say we want to convert a series of .html files over to .php files.

```sh

# Make a php copy of any html files
for value in $1/*.html
do
cp $value $1/$( basename -s .html $value ).php
done
```

### DO WHILE LOOP

Two types, though they are essentially the same.  The example is given- it could be said

"Leave the towel on the line until it's dry."

Meanwhile, we could have said "Leave the towel on the line while it is not dry." Or: "Leave the towel on the line while it is wet."

use whichever is most clear.

#### WHILE

an example:

```sh
#!/bin/bash
# Basic while loop
counter=1
while [ $counter -le 10 ]
do
echo $counter
((counter++))
done
echo "All done"
```

#### UNTIL LOOP

```sh
#!/bin/bash
# Basic until loop
counter=1
until [ $counter -gt 10 ]
do
echo $counter
((counter++))
done
echo All done
```

### BREAK and CONTINUE

break - exiting a loop can be done with `break`.  This exits the loop and continues the code at the end of the loop

```sh
#!/bin/bash
# Make a backup set of files
for value in $1/*
    do
    used=$( df $1 | tail -1 | awk '{ print $5 }' | sed 's/%//' )
    if [ $used -gt 90 ]
        then
        echo Low disk space 1>&2
        break
    fi
    cp $value $1/backup/
done
```

The `continue` statement tells Bash to stop running through this iteration of the loop and begin the next iteration.

```sh
#!/bin/bash
# Make a backup set of files
for value in $1/*
    do
    if [ ! -r $value ]
        then
        echo $value not readable 1>&2
        continue
    fi
    cp $value $1/backup/
done
```

### SELECT

When invoked it will take all the items in list (similar to other loops this is a space separated set of items) and present them on the screen with a number before each item. A prompt will be printed after this allowing the user to select a number. When they select a number and hit enter the corresponding item will be assigned to the variable var and the commands between do and done are run. Once finished a prompt will be displayed again so the user may select another option.

select var in <list>
do
<commands>
done

- No error checking is done. If the user enters something other than a number or a number not corresponding to an item then var becomes null (empty)
- If the user hits enter without entering any data then the list of options will be displayed again.
- The loop will end when an EOF signal is entered or the break statement is issued.
- You may change the system variable PS3 to change the prompt that is displayed.

```sh
#!/bin/bash
# A simple menu system
names='Kyle Cartman Stan Quit'
PS3='Select character: '
select name in $names
do
if [ $name == 'Quit' ]
then
break
fi
echo Hello $name
done
echo Bye
```


## Math

Sym | action
-|-
[[+]] | add
[[-]] | sub
[[*]] | mult
[[/]] | div
[[%]] | mod

To cause BASH to operate- use double bracket.  Echo and values, just wont work.

```zsh
num1=20
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

echo $(expr num1 + num2 )
echo $(expr num1 - num2 )
echo $(expr num1 \* num2 )
echo $(expr num1 / num2 )
echo $(expr num1 % num2 )
```

!!!Note:  Note the required escapment of `*` in expr
        echo $(expr num1 \* num2 )


`expr` - does not work with float.

### bc (basic calculator)

It is a language in itself for basic cal`culations. See `man bc`

        echo "20.5+5"|bc
        echo "20.5-5"|bc
        echo "20.5*5"|bc
        echo "20.5/5"|bc ## Error returns 4.
        echo "scale=2;20.5/5"|bc ##correct
        echo "20.5%5"|bc

`scale` gives the num of decimal points.

        echo "$num1+num2"|bc

-l - calls the math library

        echo "scale=2;sqrt($num1)" | bc -l
        echo "scale=2;$num1^3
        SS" | bc -l
        echo "scale=2;sqrt($num1)" | bc -l



## if statement

                if [condition]
                then
                    statement
                fi

There should be spaces before and after the brackets

        if _[_-f $file_name_]_

## Comparison operators

### integer comparators

| SYM       | Meaning               | Example           |
| --------- | --------------------- | ----------------- |
| ***-eq*** | equal                 | **[**`"$a" `[[-eq]]` "$b"`**]** |
| ***-ne*** | not-equal             | **[**`"$a" `[[-ne]]` "$b"`**]** |
| ***-gt*** | greater than          | **[**`"$a" `[[-gt]]` "$b"`**]** |
| ***-ge*** | greater than or equal | **[**`"$a" `[[-ge]]` "$b"`**]** |
| ***-lt*** | less than             | **[**`"$a" `[[-lt]]` "$b"`**]** |
| ***-le*** | less than or equal    | **[**`"$a" `[[-le]]` "$b"`**]** |
| ***<***   | less than             | **((**`"$a" `[[<]]`"$b"`**))**   |
| ***<=***  | less than or equal to | **((**`"$a"`[[<=]]`"$b"`**))**  |
| ***>***   | greater than          | **((**`"$a"`[[>]]`"$b"`**))**   |
| ***>=***  | less than or equal to | **((**`"$a"`[[>=]]`"$b"`**))**  |




```bash
#! /bin/bash

count=10

if [ $count -eq 10]
then
    echo "condition is True"
fi
>>>conition is True
```

### String Comparison

| SYM  | Meaning                     | Example              |
| ---- | --------------------------- | -------------------- |
| `=`  | is equal to                 | `if` **[**`"$a" `[[=]]`  "$b"`**]** ^*^  |
| `==` | is equal to                 | `if` **[**`"$a" `[[==]]` "$b"`**]** |
| `!=` | is NOT equal to             | `if` **[**`"$a" `[[!=]]` "$b"`**]**  |
| `<`  | is less than^**^            | `if` **\[\[**`"$a" `[[>]]` "$b"`**\]\]** |
| `>`  | is greater than^**^         | `if` **\[\[**`"$a" `[[<]]` "$b"`**\]\]** |
| `-z` | string is null, zero length |  ??? `if \[\["$a" -z]]     ?               |
*- in the example he used '[[' not '['
** -in ASCII alphabetic order

(There don't seem to be `<=` & `>=` for STRINGS)

```bash
#! /bin/bash

word=abc

if [ $word == "abc"]
then
    echo "condition is True"
fi
>>>conition is True
```

!!!warning Warning- Using `<, >, <=, >=` with strings and integers:
    integers - use **Double Parentheses** **(( ))**

        if (("$a"<"$b"))

    Strings- still abnormal- use **Double Square Brackets** **`[[`** and   **`]]`**

        if [["$a" > "$b"]]

    ? Most other comparisons use single brackets around the conditional.

        if ["$a" = "$b"]

    Although another example used

        if ["$a" = "$b"]

### else

```bash
#! /bin/bash

word=a

if [ $word == "b"]
then
    echo "condition is True"
else
    echo "condition is False"
fi
>>>conition is False


if [[ $word == "b"]]
then
    echo "condition b is True"
elif
    echo "condition is False"
fi
>>>conition is False
```

### File Comparison

| SYM  | Meaning                     | Example              |
| ---- | --------------------------- | -------------------- |
|***-e***| File Exists| `if [ `[[-e]]` $file_name]`
|***-f***| Is this a regular file & exist | `[ -f $file_name]`|
|***-d***| Does the Directory exist | `[ -d $file_name]`|
|***-b***| Is it a *block*/binary file | `[ -b $file_name]`|
|***-c***| Is it a *charcter* file | `[ -c $file_name]`|
|***-s***| Is it an *empty* file | `[ -s $file_name]`|
|***-r***| Do I have *read* permission | `[ -r $file_name]`|
|***-w***| Do I have *write* permission | `[ -w $file_name]`|
|***-x***| Do I have *execution* permission | `[ -x $file_name]`|



As a comparator `-e` checks if the file exists
```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -e $file_name]
then
   echo "$file_name found"
   if [ -r $file_name]
        echo "Cant Read"
   if [ -w $file_name]
        echo "Cant Write"
else
   echo "$file_name not found"
fi
```

Note:  echo uses the `-e` flag to allow escaped characters, `\c` keeps the cursor on the same line.

Two types of files- a character file, or block file.

Character files are most with some text in it.  Block files are typically pictures, videos, music

```bash
#! /bin/bash

echo -e "Enter the name of the file : \c"
read file_name

if [ -f $file_name]
then
    if [ -w $file_name]
    then
        echo -e "Enter some text data.  To exit press Ctrl + d"
        cat >> $file_name #Appends to the file
    else
        echo "The file does not have write permission"
    fi # Need a fi for each if.
else
    echo "$file_name does not exist"
fi
```

## AND, OR

`&&`, `-a`

```bash
if [ "$age" -gt 18 ] && [ "$age" -lt 30 ]
if [ "$age" -gt 18 -a "$age" -lt 30 ]
if [[ "$age" -gt 18 && "$age" -lt 30 ]] # note the double brackets
#the above 3 are equivalento
then
    echo "valid age"
else
    echo "age not valid"
fi


if [ "$age" -gt 18 ] || [ "$age" -lt 30 ]
if [ "$age" -gt 18 -o "$age" -lt 30 ]
if [[ [ "$age" -gt 18 || "$age" -lt 30 ]] # note the double brackets
```


## Math

Sym | action
-|-
[[+]] | add
[[-]] | sub
[[*]] | mult
[[/]] | div
[[%]] | mod

To cause BASH to operate- use double bracket.  Echo and values, just wont work.

```zsh
num1=20
num2=5

echo $(( num1 + num2 ))
echo $(( num1 - num2 ))
echo $(( num1 * num2 ))
echo $(( num1 / num2 ))
echo $(( num1 % num2 ))

echo $(expr num1 + num2 )
echo $(expr num1 - num2 )
echo $(expr num1 \* num2 )
echo $(expr num1 / num2 )
echo $(expr num1 % num2 )
```

!!!Note:  Note the required escapment of `*` in expr
        echo $(expr num1 \* num2 )


`expr` - does not work with float.

## bc (basic calculator)

It is a language in itself for basic cal`culations. See `man bc`

        echo "20.5+5"|bc
        echo "20.5-5"|bc
        echo "20.5*5"|bc
        echo "20.5/5"|bc ## Error returns 4.
        echo "scale=2;20.5/5"|bc ##correct
        echo "20.5%5"|bc

`scale` g;45ives the num of decimal points.

        echo "$num1+num2"|bc

-l - calls the math library

        echo "scale=2;sqrt($num1)" | bc -l
        echo "scale=2;$num1^3
        SS" | bc -l
        echo "scale=2;sqrt($num1)" | bc -l



### case

```bash

case expression in
    pattern1 )
        statements ;;
    pattern2 )
        statements ;;
    ...
esac #case backwards
```

```bash
vehicle=$1 #first arg

case $vehicle in
    "car" )
        echo "car is $100" ;;
    "van" )
        echo " " ;;
    "bicycle" )
        echo " " ;;
    "truck" )
        echo " " ;;
    * ) # default case
        echo "unknown vehicle" ;;
esac
```

## Environment Variables

`export ZSH="/home/alt/.oh-my-zsh"`


## Functions

[Source](https://linuxize.com/post/bash-functions/)

Has the general form

funcName () {

    #optional
    return [intValue]
}

Both of these ways are used as well

$name=function($param){return '';};

function name($param){return "${param}";};



You dont really pass or return values, they aren't true functions with divisions.

```sh
#!/bin/bash

var1='A'
var2='B'

my_function () {
  local var1='C'
  var2='D'
  echo "Inside function: var1: $var1, var2: $var2"
}

echo "Before executing function: var1: $var1, var2: $var2"

my_function

echo "After executing function: var1: $var1, var2: $var2"

>>Before executing function: var1: A, var2: B
>>Inside function: var1: C, var2: D
>>After executing function: var1: A, var2: D
```

!!! Note: Note - From the output above, we can conclude that:

    - If you set a local variables inside the function body with a same name as an existing global variable it will have precedence over the global variable.
    - Global variables can be changed from within the function.

Bash functions don’t allow you to return a value when called. When a bash function completes, its return value is the status of last statement executed in the function, 0 for success and non-zero decimal number in the 1 - 255 range for failure.


```sh
#!/bin/bash

my_function () {
  echo "some result"
  return 55
}

my_function
echo $?

###output
>>some result
>>55
```

The simplest option is to assign the result of the function to a global variable:

```sh
#!/bin/bash

my_function () {
  func_result="some result"
}

my_function
echo $func_result

#output
>> some result
```

Another, better option to return a value from a function is to send the value to stdout using echo or printf like shown below:

```sh
#!/bin/bash

my_function () {
  local func_result="some result"
  echo "$func_result"
}

func_result="$(my_function)"
echo $func_result

#output
>> some result
```

So basically, you set a returned valie with `func_result="$(my_function)"`

### Passing Values

Use the Parameter References `$1` `$2` etc.

longer answer:

To pass any number of arguments to the bash function simply put them right after the function’s name, separated by a space.

It is a best practice to double quote the arguments to avoid misparsing of an argument with spaces in it.

!!!Note: Parameters:

    - The passed parameters are `$1`, `$2`, `$3` … `$n`, corresponding to the position of the parameter after the function’s name.

    - The `$0` variable is reserved for the function’s name.

    - The `$#` variable holds the   number of positional parameters/arguments passed to the function.

    - The `$*` or `$@` variable holds all positional parameters/arguments passed to the function.

        #!/bin/bash

        greeting () {
        echo "Hello $1"
        }

        greeting "Joe"

        #Output
        >>Hello Joe


## Multiline Quotes

Based on this script from [Nerd-Fonts](https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh)- they do a multi line quote as follows:

 generally -

```sh
usage () {
    cat << EOF
    text
    text
    text
EOF
}
```

and explicitly

```sh
  cat << EOF
Usage: ./install.sh [-q -v -h] [[--copy | --link] --clean | --list]
                    [--use-single-width-glyphs] [--windows] [--otf | --ttf]
                    [--install-to-user-path | --install-to-system-path ]
                    [--complete | --minimal | <patches>] [FONT...]
General options:
  -q, --quiet                   Suppress output.
  -h, --help                    Display this help and exit.
[...]
EOF
}
```

```sh
version() {
  echo "Nerd Fonts installer -- Version $__ScriptVersion"
}
```

## Expansion
[Parameter-Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion)

[Parameter-Expansion-Flags](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags)
[14 Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Expansion)


[zsh: Table of Contents](http://zsh.sourceforge.net/Doc/Release/zsh_toc.html)

[14 Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Expansion)

-   [14.1 History Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#History-Expansion)
    -   [14.1.1 Overview](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Overview)
    -   [14.1.2 Event Designators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Event-Designators)
    -   [14.1.3 Word Designators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Word-Designators)
    -   [14.1.4 Modifiers](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Modifiers)
-   [14.2 Process Substitution](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Process-Substitution)
-   [14.3 Parameter Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion)
    -   [14.3.1 Parameter Expansion Flags](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Parameter-Expansion-Flags)
    -   [14.3.2 Rules](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Rules)
    -   [14.3.3 Examples](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Examples-1)
-   [14.4 Command Substitution](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Command-Substitution)
-   [14.5 Arithmetic Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Arithmetic-Expansion)
-   [14.6 Brace Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Brace-Expansion)
-   [14.7 Filename Expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Filename-Expansion)
    -   [14.7.1 Dynamic named directories](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Dynamic-named-directories)
    -   [14.7.2 Static named directories](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Static-named-directories)
    -   [14.7.3 ‘=’ expansion](http://zsh.sourceforge.net/Doc/Release/Expansion.html#g_t_0060_003d_0027-expansion)
    -   [14.7.4 Notes](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Notes)
-   [14.8 Filename Generation](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Filename-Generation)
    -   [14.8.1 Glob Operators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Operators)
    -   [14.8.2 ksh-like Glob Operators](http://zsh.sourceforge.net/Doc/Release/Expansion.html#ksh_002dlike-Glob-Operators)
    -   [14.8.3 Precedence](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Precedence)
    -   [14.8.4 Globbing Flags](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Globbing-Flags)
    -   [14.8.5 Approximate Matching](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Approximate-Matching)
    -   [14.8.6 Recursive Globbing](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Recursive-Globbing)
    -   [14.8.7 Glob Qualifiers](http://zsh.sourceforge.net/Doc/Release/Expansion.html#Glob-Qualifiers)


## Process Substitution

Process substitution is supported on systems that support named pipes (FIFOs) or the /dev/fd method ofnaming open files. It takes the form of

        <(LIST)
or
        >(LIST)

The process LIST is run with its input or output connected to a FIFO or some file in `/dev/fd`. The name ofthis file is passed as an argument to the current command as the result of the expansion. If the "`>(LIST)`" formis used, writing to the file will provide input for LIST. If the "`<(LIST)`" form is used, the file passed as anargument should be read to obtain the output of LIST. Note that no space may appear between the < or >signs and the left parenthesis, otherwise the construct would be interpreted as a redirection.When available, process substitution is performed simultaneously with parameter and variable expansion,command substitution, and arithmetic expansion


## Interface

### TPUT

used for printing in specific places on the terminal window

tput cols - gives number of columns
tput lines - gives number of rows
- clear - clears the page
- cup - places the cursor at a coordinate
- bold - makes the text bold
- sgr0 - will turn bold off (and any other changes we may have made).
- `cup $( tput lines ) 0` places the cursor at the coordinate

```sh
#!/bin/bash
# Print message in center of terminal
cols=$( tput cols )
rows=$( tput lines )
message=$@
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col  #tput cup places the cursor
tput bold
echo $@
tput sgr0
tput cup $( tput lines ) 0

```
