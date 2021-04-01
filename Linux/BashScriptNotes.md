#! usr/bin/code

Last 1:03:00


# - Shell Scripting Intro

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


## LOGIC

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

#### String Comparison

| SYM  | Meaning                     | Example              |
| ---- | --------------------------- | -------------------- |
| `=`  | is equal to                 | `if` **[**`"$a" `[[=]]`  "$b"`**]** ^*^  |
| `==` | is equal to                 | `if` **[**`"$a" `[[==]]` "$b"`**]** |
| `!=` | is NOT equal to             | `if` **[**`"$a" `[[!=]]` "$b"`**]**  |
| `<`  | is less than^**^            | `if` **\[\[**`"$a" `[[>]]` "$b"`**\]\]** |
| `>`  | is greater than^**^         | `if` **\[\[**`"$a" `[[<]]` "$b"`**\]\]** |
| `-z` | string is null, zero length |  ??? `if \[\["$a" -z]]     ?               |

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



#### File Comparison

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

## Passing arguments to a BASH script

By default- arguments are stored in `$1`, `$2`, `$3`, `$4`

`$0` stores the actual file name.


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
