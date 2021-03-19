# C programming

## Setup

Linux needs 

sudo apt-get install linux-libc-dev gcc-multilib cmake cmake-doc gcc clang


Variables defined with `=` are recursively expanded variables. Variables defined with `:=` or `::=` are simply expanded variables; these definitions can contain variable references which will be expanded before the definition is made. See The Two Flavors of Variables.

The shell assignment operator `!=` can be used to execute a shell script and set a variable to its output. This operator first evaluates the right-hand side, then passes that result to the shell for execution. If the result of the execution ends in a newline, that one newline is removed; all other newlines are replaced by spaces. The resulting string is then placed into the named recursively-expanded variable. 


## Make

[Great SOurce](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html#Text-Functions)
[Funtions](https://www.gnu.org/software/make/manual/html_node/Functions.html)

[File Name Functions](https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html#File-Name-Functions)

### Make Implicit Variables

[Implicit Vars](https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html#Implicit-Variables)

- `AR` - Archive-maintaining program; default `ar`.
- `AS` - Program for compiling assembly files; default `as`.
- `CC` - Program for compiling C programs; default `cc`.
- `CXX` - Program for compiling C++ programs; default `g++`.
- `CPP` - Program for running the C preprocessor, with results to standard output; default ‘$(CC) -E’.
- `FC` - Program for compiling or preprocessing Fortran and Ratfor programs; default `f77`.
- `M2C` - Program to use to compile Modula-2 source code; default `m2c`.
- `PC` - Program for compiling Pascal programs; default `pc`.
- `CO` - Program for extracting a file from RCS; default `co`.
- `GET` - Program for extracting a file from SCCS; default `get`.
- `LEX` - Program to use to turn Lex grammars into source code; default `lex`.
- `YACC` - Program to use to turn Yacc grammars into source code; default `yacc`.
- `LINT` - Program to use to run lint on source code; default `lint`.
- `MAKEINFO` - Program to convert a Texinfo source file into an Info file; default `makeinfo`.
- `TEX` - Program to make TeX DVI files from TeX source; default `tex`.
- `TEXI2DVI` - Program to make TeX DVI files from Texinfo source; default `texi2dvi`.
- `WEAVE` - Program to translate Web into TeX; default `weave`.
- `CWEAVE` - Program to translate C Web into TeX; default `cweave`.
- `TANGLE` - Program to translate Web into Pascal; default `tangle`.
- `CTANGLE` - Program to translate C Web into C; default `ctangle`.
- `RM` - Command to remove a file; default ‘rm -f’. 

Here is a table of variables whose values are additional arguments for the programs above. The default values for all of these is the empty string, unless otherwise noted.

- `ARFLAGS` - Flags to give the archive-maintaining program; default `rv`.
- `ASFLAGS` - Extra flags to give to the assembler (when explicitly invoked on a `.s` or `.S` file).
- `CFLAGS` - Extra flags to give to the C compiler.
- `CXXFLAGS` - Extra flags to give to the C++ compiler.
- `COFLAGS` - Extra flags to give to the RCS co program.
- `CPPFLAGS` - Extra flags to give to the C preprocessor and programs that use it (the C and Fortran compilers).
- `FFLAGS` - Extra flags to give to the Fortran compiler.
- `GFLAGS` - Extra flags to give to the SCCS get program.
- `LDFLAGS` - Extra flags to give to compilers when they are supposed to invoke the linker, `ld`, such as -L. Libraries (-lfoo) should be added to the LDLIBS variable instead.
- `LDLIBS` - Library flags or names given to compilers when they are supposed to invoke the linker, `ld`. LOADLIBES is a deprecated (but still supported) alternative to LDLIBS. Non-library linker flags, such as -L, should go in the LDFLAGS variable.
- `LFLAGS` - Extra flags to give to Lex.
- `YFLAGS` - Extra flags to give to Yacc.
- `PFLAGS` - Extra flags to give to the Pascal compiler.
- `RFLAGS` - Extra flags to give to the Fortran compiler for Ratfor programs.
- `LINTFLAGS` - Extra flags to give to lint. 

#### Synttax

        targets : prerequisites
                recipe
                …

        or like this:

        targets : prerequisites ; recipe
                recipe
                …

TARGET: REQUIREMENTS

### Automatic Variables

`$@` is the name of whichever target caused the rule’s recipe to be run.  It is the TARGET

$? all prerequisites newer than target The names of all the prerequisites that are newer than the target, with spaces between them. If the target does not exist, all prerequisites will be included. 

$^ all prerequisites.The names of all the prerequisites, with spaces between them. For prerequisites which are archive members, only the named member is used (see Archives). 

`$<` is the automatic variable that holds the name of the FIRST prerequisite and 

`$@` is the automatic variable that holds the name of the target;

$@ The file name of the target of the rule. If the target is an archive member, then `$@` is the name of the archive file. In a pattern rule that has multiple targets (see Introduction to Pattern Rules), `$@` is the name of whichever target caused the rule’s recipe to be run. 

`$%`
    The target member name, when the target is an archive member. 

`$<` The name of the first prerequisite. 

`$?` -The names of all the prerequisites that are newer than the target

`$^` The names of all the prerequisites, with spaces between them

`$*`
- `` - The stem with which an implicit rule matches
`$+`
This is like `$^`, but prerequisites listed more than once are duplicated in the order they were listed in the makefile. 
`$|`
The names of all the order-only prerequisites, with spaces between them.


`$*`
[Automatic Variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)

### More Automatic Variables


``$(@D)``   The directory part of the file name of the target, with the trailing slash removed. If the value of `$@` is dir/foo.o then `$(@D)` is dir. This value is . if `$@` does not contain a slash.
``$(@F)` `    The file-within-directory part of the file name of the target. If the value of `$@` is dir/foo.o then `$(@F)` is foo.o. `$(@F)` is equivalent to ‘$(notdir $@)’.
``$(*D)``$(*F)`` The directory part and the file-within-directory part of the stem; dir and foo in this example.
``$(%D)``$(%F)`` The directory part and the file-within-directory part of the target archive member name. This makes sense only for archive member targets of the form archive(member) and is useful only when member may contain a directory name. (See Archive Members as Targets.)
``$(<D)``$(<F)`` The directory part and the file-within-directory part of the first prerequisite.
``$(^D)``$(^F)`` - Lists of the directory parts and the file-within-directory parts of all prerequisites.
``$(+D)` `$(+F)`` - Lists of the directory parts and the file-within-directory parts of all prerequisites, including multiple instances of duplicated prerequisites.
``$(?D)` `$(?F)`` - Lists of the directory parts and the file-within-directory parts of all prerequisites that are newer than the target. 

In an explicit rule, there is no stem; so `$*` cannot be determined in that way. Instead, if the target name ends with a recognized suffix (see Old-Fashioned Suffix Rules), `$*` is set to the target name minus the suffix.

### Make Functions:



#### eval Function

The eval function is very special: it allows you to define new makefile constructs that are not constant; which are the result of evaluating other variables and functions. The argument to the eval function is expanded, then the results of that expansion are parsed as makefile syntax. The expanded results can define new make variables, targets, implicit or explicit rules, etc. 


```sh
PROGRAMS    = server client

server_OBJS = server.o server_priv.o server_access.o
server_LIBS = priv protocol

client_OBJS = client.o client_api.o client_mem.o
client_LIBS = protocol

# Everything after this is generic
.PHONY: all
all: $(PROGRAMS)

define PROGRAM_template =
 $(1): $$($(1)_OBJS) $$($(1)_LIBS:%=-l%)
 ALL_OBJS   += $$($(1)_OBJS)
endef

$(foreach prog,$(PROGRAMS),$(eval $(call PROGRAM_template,$(prog))))

$(PROGRAMS):
        $(LINK.o) $^ $(LDLIBS) -o $@

clean:
        rm -f $(ALL_OBJS) $(PROGRAMS)
```

####  origin Function

The `origin` function is unlike most other functions in that it does not operate on the values of variables; it tells you something about a variable. Specifically, it tells you where it came from.

The syntax of the origin function is:

`$(origin variable)`


- **undefined** - if variable was never defined.
- **default** - if variable has a default definition, as is usual with CC and so on. See Variables Used by Implicit Rules. Note that if you have redefined a default variable, the origin function will return the origin of the later definition.
- **environment** - if variable was inherited from the environment provided to make.
- **environment override** - if variable was inherited from the environment provided to make, and is overriding a setting for variable in the makefile as a result of the `-e` option (see [Summary of Options).](https://www.gnu.org/software/make/manual/make.html#Options-Summary)
- **file** - if variable was defined in a makefile.
- **command line** - if variable was defined on the command line.
- **override** - if variable was defined with an override directive in a makefile (see [The override Directive).](https://www.gnu.org/software/make/manual/make.html#Override-Directive)
- **automatic** - if variable is an automatic variable defined for the execution of the recipe for each rule (see [Automatic Variables).](https://www.gnu.org/software/make/manual/make.html#Automatic-Variables) 

#### flavor Function

The flavor function, like the origin function, does not operate on the values of variables but rather it tells you something about a variable. Specifically, it tells you the flavor of a variable (see The Two Flavors of Variables).

The syntax of the flavor function is: And will return one of the three:

`$(flavor variable)`

- **undefined** - if variable was never defined.
- **recursive** - if variable is a recursively expanded variable.
- **simple** - if variable is a simply expanded variable.

Simple assigned using `:=` or `::=` and means you cant expand a var within a var.  Recursive is just `=` and lets you.

#### shell Function

The shell function is unlike any other function other than the wildcard function (see The Function wildcard) in that it communicates with the world outside of make.

The shell function performs the same function that backquotes (```) perform in most shells: it does command expansion. This means that it takes as an argument a shell command and evaluates to the output of the command. The only processing make does on the result is to convert each newline (or carriage-return / newline pair) to a single space. If there is a trailing (carriage-return and) newline it will simply be removed. 

After the shell function or `!=` assignment operator is used, its exit status is placed in the .SHELLSTATUS variable.

Here are some examples of the use of the shell function:

        contents := $(shell cat foo)

sets contents to the contents of the file foo, with a space (rather than a newline) separating each line.

        files := $(shell echo *.c)

## 'Standard' Targets


- **all** - Make all the top-level targets the makefile knows about.
- **clean** - Delete all files that are normally created by running make.
- **mostlyclean**, **distclean**, **realclean** - Like `clean`, but may refrain from deleting a few files that people normally don’t want to recompile. For example, the `mostlyclean` target for GCC does not delete libgcc.a, because recompiling it is rarely necessary and takes a lot of time.
- **clobber** - Any of these targets might be defined to delete more files than `clean` does. For example, this would delete configuration files or links that you would normally create as preparation for compilation, even if the makefile itself cannot create these files.
- **install** - Copy the executable file into a directory that users typically search for commands; copy any auxiliary files that the executable uses into the directories where it will look for them.
- **print** - Print listings of the source files that have changed.
- **tar** - Create a tar file of the source files.
- **shar** - Create a shell archive (shar file) of the source files.
- **dist** - Create a distribution file of the source files. This might be a tar file, or a shar file, or a compressed version of one of the above, or even more than one of the above.
- **TAGS** - Update a tags table for this program.
check
- **test** - Perform self tests on the program this makefile builds. 

## Modifiers to Make

The makefile tells make how to tell whether a target is up to date, and how to update each target. But updating the targets is not always what you want. Certain options specify other activities for make.

        -B, --always-make                                 						Unconditionally make all targets.
        -C DIRECTORY, --directory=DIRECTORY 			 Change to DIRECTORY before doing anything.
        -d                          														Print lots of debugging information.
        --debug[=FLAGS]             											Print various types of debugging information.
        -e, --environment-overrides 										  Environment variables override makefiles.
        -E STRING, --eval=STRING    									Evaluate STRING as a makefile statement.
        -f FILE, --file=FILE, --makefile=FILE      Read FILE as a makefile.
        -i, --ignore-errors         Ignore errors from recipes.
        -I DIRECTORY, --include-dir=DIRECTORY   Search DIRECTORY for included makefiles.
        -j [N], --jobs[=N]          Allow N jobs at once; infinite jobs with no arg.
        -k, --keep-going            Keep going when some targets can't be made.
        -l [N], --load-average[=N], --max-load[=N]                               Don't start multiple jobs unless load is below N.
        -L, --check-symlink-times   Use the latest mtime between symlinks and target.
        -n, --just-print, --dry-run, --recon                               Don't actually run any recipe; just print them.
        -o FILE, --old-file=FILE, --assume-old=FILE                               Consider FILE to be very old and don't remake it.
        -O[TYPE], --output-sync[=TYPE]                               Synchronize output of parallel jobs by TYPE.
        -p, --print-data-base       Print make's internal database.
        -q, --question              Run no recipe; exit status says if up to date.
        -r, --no-builtin-rules      Disable the built-in implicit rules.
        -R, --no-builtin-variables  Disable the built-in variable settings.
        -s, --silent, --quiet       Don't echo recipes.
        --no-silent                 Echo recipes (disable --silent mode).
        -S, --no-keep-going, --stop                                Turns off -k.
        -t, --touch                 Touch targets instead of remaking them.
        --trace                     Print tracing information.
        -v, --version               Print the version number of make and exit.
        -w, --print-directory       Print the current directory.
        --no-print-directory        Turn off -w, even if it was turned on implicitly.
        -W FILE, --what-if=FILE, --new-file=FILE, --assume-new=FILE                                Consider FILE to be infinitely new.
        --warn-undefined-variables  Warn when an undefined variable is referenced.

`-B`, `--always-make` Consider all targets out-of-date.

`-C` [dir]`--directory=[dir]`

`-f [file]’, `--file=[file]`,  `--makefile=[file]` - specify another file to use.

`-s` - run silently.

`-d` Print debugging information in addition to normal processing. The debugging information says which files are being considered for remaking, which file-times are being compared and with what results, which files actually need to be remade, which implicit rules are considered and which are applied

`--debug[=options]` a (all) | b (basic) | v (verbose) | i (implicit) | j (jobs) | m (makefile) | n (none)

`-e`,  `--environment-overrides`   Give variables taken from the environment precedence over variables from makefiles. 

`-E` [string] `--eval=`[string] - Evaluate string as makefile syntax. This is a command-line version of the eval function (see Eval Function). The evaluation is performed after the default rules and variables have been defined, but before any makefiles are read.

`-h`, `--help` to see make specific help. Remind you of the options that make understands and then exit.

`-i` `--ignore-errors`, Ignore all errors in recipes executed to remake files. See Errors in Recipes.

`-I` [dir], `--include-dir`=[dir] Specifies a directory dir to search for included makefiles. See Including Other Makefiles. If several `-I` options are used to specify several directories, the directories are searched in the order specified.

`-k`  `--keep-going` Continue as much as possible after an error. 

`-L` `--check-symlink-times` On systems that support symbolic links, this option causes make to consider the timestamps on any symbolic links in addition to the timestamp on the file referenced by those links. 

`-n`  `--just-print` , `--dry-run` ,`--recon`  - With the `-n` flag, make prints the recipe that it would normally execute but usually does not execute it. “No-op”. Causes make to print the recipes that are needed to make the targets up to date, but not actually execute them. Note that some recipes are still executed, even with this flag (see How the MAKE Variable Works). Also any recipes needed to update included makefiles are still executed (see How Makefiles Are Remade).

`-O[type]` `--output-sync[=type]` -    Ensure that the complete output from each recipe is printed in one uninterrupted sequence. 

`-o` [file]’ `--old-file=[file]` `--assume-old=[file]`     Do not remake the file file even if it is older than its prerequisites, and do not remake anything on account of changes in file. Essentially the file is treated as very old and its rules are ignored. See Avoiding Recompilation of Some Files.

`-p` `--print-data-base` Print the data base (rules and variable values) that results from reading the makefiles; then execute as usual or as otherwise specified. This also prints the version information given by the `-v` switch (see below). 

`-q`, `--question` “Question”. Silently check whether the targets are up to date, but do not execute recipes; the exit code shows whether any updates are needed.  `0` is up to date 1 is not.

`-s` , `--silent` `--quiet` Silent operation; do not print the recipes as they are executed. See Recipe Echoing.

`-S` `--no-keep-going` `--stop` Cancel the effect of the `-k` option. This is never necessary except in a recursive make where `-k` might be inherited from the top-level make via MAKEFLAGS (see Recursive Use of make) or if you set `-k` in MAKEFLAGS in your environment.

`-t`, `--touch` With the `-t` flag, make ignores the recipes in the rules and uses (in effect) the command touch for each target that needs to be remade. 

    “Touch”. Marks targets as up to date without actually changing them. In other words, make pretends to update the targets but does not really change their contents; instead only their modified times are updated.

`-v` `--version` Print the version of the make program plus a copyright, a list of authors, and a notice that there is no warranty; then exit.

`-w` `--print-directory` Print a message containing the working directory both before and after executing the makefile. This may be useful for tracking down errors from complicated nests of recursive make commands.

`--no-print-directory` Disable printing of the working directory under -w. This option is useful when -w is turned on automatically, but you do not want to see the extra messages. 

`-W` [file] `--what-if`=[file] “What if”. `--assume-new=[file]`,`--new-file=[file]` Each `-W` flag is followed by a file name. The given files’ modification times are recorded by make as being the present time, although the actual modification times remain the same. 

`--warn-undefined-variables`    Issue a warning message whenever make sees a reference to an undefined variable. This can be helpful when you are trying to debug makefiles which use variables in complex ways. 


___

```
foo : foo.c -lcurses
        cc $^ -o $@
```
`lcurses` is a library curses.c, and will check library for curses.a and if older replaces it.


```sh
ci all install tags clean bare promote depend ci locked:
    -X=`pwd`; \
    for i in $(SUBS); \
    do echo '<<<' $$i '>>>'; cd $$X/$$i; make $@; done
```

The initial "-" is actually not part of the shell script, but when placed before command lines, will cause the error status of the command to be ignored. From there, the rest is shell script

X= current directory

for i in a list of subs.  do {
    echo '<<< $$i >>>' ? (Maybe literally prints
    then we do cd Root/$sub and make $@ )
}

```make

%.o : %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@
	touch $@
	echo "Compiled"

% : %.o
	$(CC) $(LDFLAGS) n.o $(LOADLIBES) $(LDLIBS) && .\$@


   test: $(SRC)
	cc -c $< 
# 	cc $(SRC:.c=.o) -o $(SRC:.c=)
# 	$(ROOT)$(SRC:.c=)
```


If
the compile fails because it cannot find a #include file, you need a -I to
fix it.
Extra: Here's how to use the unix "find" command to find your
#include file. This example searches the /usr/include directory for all
the include files with the pattern "inet" in them...
nick% find /usr/include -name '*inet*'
/usr/include/arpa/inet.h
/usr/include/netinet
/usr/include/netinet6



`gcc -g  conv_to_fahr.o1` -L/home/andyt/homework1_2/lib  `-o conv_to_fahr`


/usr/bin/ld: conv_to_fahr.o: in function `main':
/home/andyt/homework1_2/src/bin/conv_to_fahr/conv_to_fahr.c:27: undefined reference to `digit_check'
/usr/bin/ld: /home/andyt/homework1_2/src/bin/conv_to_fahr/conv_to_fahr.c:40: undefined reference to `convert_to_fahr'
collect2: error: ld returned 1 exit status

`gcc -g  conv_to_fahr.o  `-l:libgetarg.a -l:libtemp_conv.a `-o conv_to_fahr`

    /usr/bin/ld: cannot find -l:libgetarg.a
    /usr/bin/ld: cannot find -l:libtemp_conv.a
    collect2: error: ld returned 1 exit status

<!--  -->

To create library object files for foo.c and hello.c, simply invoke libtool with the standard compilation command as arguments (see Compile mode):

        >$ libtool --mode=compile gcc -g -O -c foo.c
            gcc -g -O -c foo.c -o foo.o
        >$ libtool --mode=compile gcc -g -O -c hello.c
            gcc -g -O -c hello.c -o hello.o
        >$

Without libtool, the programmer would invoke the ar command to create a static library:

burger$ ar cru libhello.a hello.o foo.o

`ar` is just an archive program.  Like `tar` is just `tape archive` so this doesnt 'do' anything.

Then `ranlib` adds a file table.

gcc -v conv_to_fahr.o ../../../lib/temp_conv.a ../../../lib/getarg.a -o conv_to_fahr

  -E                       Preprocess only; do not compile, assemble or link.
  -S                       Compile only; do not assemble or link.
  -c                       Compile and assemble, but do not link.
  -o <file>                Place the output into <file>.
  -pie                     Create a dynamically linked position independent
                           executable.
  -shared                  Create a shared library.
    -Xassembler <arg>        Pass <arg> on to the assembler.
  -Xpreprocessor <arg>     Pass <arg> on to the preprocessor.
  -Xlinker <arg>           Pass <arg> on to the linker.
  -print-search-dirs       Display the directories in the compiler's search path.
  -print-libgcc-file-name  Display the name of the compiler's companion library.
  -print-file-name=<lib>   Display the full path to library <lib>.
  -print-prog-name=<prog>  Display the full path to compiler component <prog>.
  -print-multiarch         Display the target's normalized GNU triplet, used as
                           a component in the library path.
  -print-multi-directory   Display the root directory for versions of libgcc.
  -print-multi-lib         Display the mapping between command line options and
                           multiple library search directories.
  -print-multi-os-directory Display the relative path to OS libraries.
  -print-sysroot           Display the target libraries directory.
  -print-sysroot-headers-suffix Display the sysroot suffix used to find headers.

You are overwriting your object file runexp.o by running this command :

 gcc -o runexp.o scd.o data_proc.o -lm -fopenmp
In fact, the -o is for the output file. You need to run :

gcc -o runexp.out runexp.o scd.o data_proc.o -lm -fopenmp
## Basic Struct

```c
#include <stdio.h>

int main(int argc, char *argv[]){
    

    return 0;
}
```

`int main(int argc, char **argv){` This also works


## printing

`puts()` = print.

```c
#include <stdio.h>

int main(int argc, char **argv){
    static char *intro = "Please enter your value?";
    puts(intro);

    return 0;
}
```


## Errors:

        warning: implicit declaration of function ‘atof’ [-Wimplicit-function-declaration]
   20 |     cent = atof(buf);


Found: [[SOLVED] C language programming problem.](https://www.linuxquestions.org/questions/programming-9/c-language-programming-problem-4175616238/)

        What's in your local.h?

        your.c:1:19: fatal error: local.h: No such file or directory

        http://www.tutorialspoint.com/c_stan...ction_atof.htm

        $ cat > local.h
        #include <stdio.h>
        #include <stdlib.h>
        #include <string.h>
        $ gcc your.c
        $ ./a.out
        String value = 9899.89, Float value = 9899.889648

created `local.h`, added all `#include <xxx>` to it.  Ran gcc -c local.h to get a precompiled header.


## Types


Some common primitive system data types

- `comp_t` - compressed clock ticks (not defined by POSIX.1; see Section 8.14)
- `dev_t` - device numbers (major and minor) (Section 4.24)
- `fd_set` - file descriptor sets (Section 14.4.1)
- `fpos_t` - file position (Section 5.10)
- `gid_t` - numeric group IDs
- `ino_t` - i-node numbers (Section 4.14)
- `mode_t` - file type, file creation mode (Section 4.5)
- `nlink_t` - link counts for directory entries (Section 4.14)
- `off_t` - file sizes and offsets (signed) (lseek, Section 3.6)
- `pid_t` - process IDs and process group IDs (signed) (Sections 8.2 and 9.4)
- `pthread_t` - thread IDs (Section 11.3)
- `ptrdiff_t` - result of subtracting two pointers (signed)
- `rlim_t` - resource limits (Section 7.11)
- `sig_atomic_t` - data type that can be accessed atomically (Section 10.15)
- `sigset_t` - signal set (Section 10.11)
- `size_t` - sizes of objects (such as strings) (unsigned) (Section 3.7)
- `ssize_t` - functions that return a count of bytes (signed) (read, write, Section 3.7)
- `time_t` - counter of seconds of calendar time (Section 1.10)
- `uid_t` - numeric user IDs
- `wchar_t` - can represent all distinct character codes
Figure 2.21 ]



| specifier                                       | Replaced by                                                            | Example                  |
| ----------------------------------------------- | ---------------------------------------------------------------------- | ------------------------ |
| %a                                              | Abbreviated weekday name *                                             | Thu                      |
| %A                                              | Full weekday name *                                                   | Thursday                 |
| %b                                              | Abbreviated month name *                                               | Aug                      |
| %B                                              | Full month name *                                                      | August                   |
| %c                                              | Date and time representation *                                         | Thu Aug 23 14:55:02 2001 |
| %C                                              | Year divided by 100 and truncated to integer (00-99)                   | 20                       |
| %d                                              | Day of the month, zero-padded (01-31)                                  | 23                       |
| %D                                              | Short MM/DD/YY date, equivalent to %m/%d/%y                            | 08/23/01                 |
| %e                                              | Day of the month, space-padded ( 1-31)                                 | 23                       |
| %F                                              | Short YYYY-MM-DD date, equivalent to %Y-%m-%d                          | 2001-08-23               |
| %g                                              | Week-based year, last two digits (00-99)                               | 01                       |
| %G                                              | Week-based year                                                        | 2001                     |
| %h                                              | Abbreviated month name * (same as %b)                                  | Aug                      |
| %H                                              | Hour in 24h format (00-23)                                             | 14                       |
| %I                                              | Hour in 12h format (01-12)                                             | 02                       |
| %j                                              | Day of the year (001-366)                                              | 235                      |
| %m                                              | Month as a decimal number (01-12)                                      | 08                       |
| %M                                              | Minute (00-59)                                                         | 55                       |
| %n                                              | New-line character ('\\n')                                             |                          |
| %p                                              | AM or PM designation                                                   | PM                       |
| %r                                              | 12-hour clock time *                                                   | 02:55:02 pm              |
| %R                                              | 24-hour HH:MM time, equivalent to %H:%M                                | 14:55                    |
| %S                                              | Second (00-61)                                                         | 02                       |
| %t                                              | Horizontal-tab character ('\\t')                                       |                          |
| %T                                              | ISO 8601 time format (HH:MM:SS), equivalent to %H:%M:%S                | 14:55:02                 |
| %u                                              | ISO 8601 weekday as number with Monday as 1 (1-7)                      | 4                        |
| %U                                              | Week number with the first Sunday as the first day of week one (00-53) | 33                       |
| %V                                              | ISO 8601 week number (01-53)                                           | 34                       |
| %w                                              | Weekday as a decimal number with Sunday as 0 (0-6)                     | 4                        |
| %W                                              | Week number with the first Monday as the first day of week one (00-53) | 34                       |
| %x                                              | Date representation *                                                  | 08/23/01                 |
| %X                                              | Time representation *                                                  | 14:55:02                 |
| %y                                              | Year, last two digits (00-99)                                          | 01                       |
| %Y                                              | Year                                                                   | 2001                     |
| %z                                              | ISO 8601 offset from UTC in timezone (1 minute=1, 1 hour=100)          |                          |
| If timezone cannot be determined, no characters | +100                                                                   |                          |
| %Z                                              | Timezone name or abbreviation *                                        |                          |
| If timezone cannot be determined, no characters | CDT                                                                    |                          |
| %%                                              | A % sign                                                               | %                        |specifier	Replaced by	Example


strftime ctime

size_t strftime (char* ptr, size_t maxsize, const char* format,
                 const struct tm* timeptr );

- `ptr` - Pointer to the destination array where the resulting C string is copied.maxsize
    Maximum number of characters to be copied to ptr, including the terminating null-character.
- `format` - C string containing any combination of regular characters and special format specifiers. These format specifiers are replaced by the function to the corresponding values to represent the time specified in timeptr. They all begin with a percentage (%) sign, and are:
- `%a` - (**Thu**) - Abbreviated weekday name *
- `%A` - (**Thursday**) - Full weekday name * 
- `%b` - (**Aug**) - Abbreviated month name *
- `%B` - (**August**) - Full month name *
- `%c` - (**Thu Aug 23 14:55:02 2001**) - Date and time representation *
- `%C` - (**20**) - Year divided by 100 and truncated to integer (00-99)
- `%d` - (**23**) - Day of the month, zero-padded (01-31)
- `%D` - (**08/23/01**) - Short MM/DD/YY date, equivalent to %m/%d/%y
- `%e` - (**23**) - Day of the month, space-padded ( 1-31)
- `%F` - (**2001-08-23**) - Short YYYY-MM-DD date, equivalent to %Y-%m-%d
- `%g` - (**01**) - Week-based year, last two digits (00-99)
- `%G` - (**2001**) - Week-based year
- `%h` - (**Aug**) - Abbreviated month name * (same as %b)
- `%H` - (**14**) - Hour in 24h format (00-23)
- `%I` - (**02**) - Hour in 12h format (01-12)
- `%j` - (**235**) - Day of the year (001-366)
- `%m` - (**08**) - Month as a decimal number (01-12)
- `%M` - (**55**) - Minute (00-59)
- `%n` - (**\n**) - New-line character
- `%p` - (**PM**) - AM or PM designation
- `%r` - (**02:55:02 pm**) - 12-hour clock time *
- `%R` - (**14:55**) - 24-hour HH:MM time, equivalent to %H:%M
- `%S` - (**02**) - Second (00-61)
- `%t` - (**\t**) - Horizontal-tab character 
- `%T` - (**14:55:02**) - ISO 8601 time format (HH:MM:SS), equivalent to %H:%M:%S
- `%u` - (**4**) - ISO 8601 weekday as number with Monday as 1 (1-7)
- `%U` - (**33**) - Week number with the first Sunday as the first day of week one (00-53)
- `%V` - (**34**) - ISO 8601 week number (01-53)
- `%w` - (**4**) - Weekday as a decimal number with Sunday as 0 (0-6)
- `%W` - (**34**) - Week number with the first Monday as the first day of week one (00-53)
- `%x` - (**08/23/01**) - Date representation *
- `%X` - (**14:55:02**) - Time representation *
- `%y` - (**01**) - Year, last two digits (00-99)
- `%Y` - (**2001**) - Year
- `%z` - (**(1 minute=1, 1 hour=100)**) - ISO 8601 offset from UTC in timezone 
- `%Z` - (** ***) - Timezone name or abbreviation
- `%%` - (**%**) - A % sign


- `` -     struct tm {        int tm_sec;         /* seconds,  range 0 to 59          */
        int tm_min;         /* minutes, range 0 to 59           */
        int tm_hour;        /* hours, range 0 to 23             */
        int tm_mday;        /* day of the month, range 1 to 31  */
        int tm_mon;         /* month, range 0 to 11             */
        int tm_year;        /* The number of years since 1900   */
        int tm_wday;        /* day of the week, range 0 to 6    */
        int tm_yday;        /* day in the year, range 0 to 365  */
        int tm_isdst;       /* daylight saving time             */
        };




## Strings

They suck in C

```C
xxxxx myName() {
  return "Flavio";
}
```

he tricky thing is defining the return value type.

Strings in C are arrays of char elements, so we can’t really return a string - we must return a pointer to the first element of the string.

This is why we need to use const char*:

```c
const char* myName() {
  return "Flavio";
}
```

This works  

        #include <stdio.h>

        const char* myName() {
            return "Flavio";
        }

        int main(void) {
            printf("%s", myName());
            const char * result = MyName();
        }


Note the use of const, because from the function I’m returning a string literal, a string defined in double quotes, which is a constant.


```c

#include <stdio.h>

//this fails
const char* myName() {
  char name[6] = "Flavio"; 
  return name;
}

//this works
const char* myName() {
  char *name = "Flavio";
  return name;
}

int main(void) {
  printf("%s", myName());
}

```


|

List of Unix, Linux System Calls

 |
| [accept](http://www.tutorialspoint.com/unix_system_calls/accept.htm)\
[access](http://www.tutorialspoint.com/unix_system_calls/access.htm)\
[acct](http://www.tutorialspoint.com/unix_system_calls/acct.htm)\
[add_key](http://www.tutorialspoint.com/unix_system_calls/add_key.htm)\
[adjtimex](http://www.tutorialspoint.com/unix_system_calls/adjtimex.htm)\
[afs_syscall](http://www.tutorialspoint.com/unix_system_calls/afs_syscall.htm)\
[alarm](http://www.tutorialspoint.com/unix_system_calls/alarm.htm)\
[alloc_hugepages](http://www.tutorialspoint.com/unix_system_calls/alloc_hugepages.htm)\
[arch_prctl](http://www.tutorialspoint.com/unix_system_calls/arch_prctl.htm)\
[bdflush](http://www.tutorialspoint.com/unix_system_calls/bdflush.htm)\
[bind](http://www.tutorialspoint.com/unix_system_calls/bind.htm)\
[break](http://www.tutorialspoint.com/unix_system_calls/break.htm)\
[brk](http://www.tutorialspoint.com/unix_system_calls/brk.htm)\
[cacheflush](http://www.tutorialspoint.com/unix_system_calls/cacheflush.htm)\
[chdir](http://www.tutorialspoint.com/unix_system_calls/chdir.htm)\
[chmod](http://www.tutorialspoint.com/unix_system_calls/chmod.htm)\
[chown](http://www.tutorialspoint.com/unix_system_calls/chown.htm)\
[chroot](http://www.tutorialspoint.com/unix_system_calls/chroot.htm)\
[clone2](http://www.tutorialspoint.com/unix_system_calls/clone2.htm)\
[clone](http://www.tutorialspoint.com/unix_system_calls/clone.htm)\
[close](http://www.tutorialspoint.com/unix_system_calls/close.htm)\
[connect](http://www.tutorialspoint.com/unix_system_calls/connect.htm)\
[create_module](http://www.tutorialspoint.com/unix_system_calls/create_module.htm)\
[creat](http://www.tutorialspoint.com/unix_system_calls/creat.htm)\
[dup2](http://www.tutorialspoint.com/unix_system_calls/dup2.htm)\
[dup](http://www.tutorialspoint.com/unix_system_calls/dup.htm)\
[epoll_create](http://www.tutorialspoint.com/unix_system_calls/epoll_create.htm)\
[epoll_ctl](http://www.tutorialspoint.com/unix_system_calls/epoll_ctl.htm)\
[epoll_wait](http://www.tutorialspoint.com/unix_system_calls/epoll_wait.htm)\
[execve](http://www.tutorialspoint.com/unix_system_calls/execve.htm)\
[exit_group](http://www.tutorialspoint.com/unix_system_calls/exit_group.htm)\
[_exit](http://www.tutorialspoint.com/unix_system_calls/_exit.htm)\
[exit](http://www.tutorialspoint.com/unix_system_calls/exit.htm)\
[_Exit](http://www.tutorialspoint.com/unix_system_calls/_Exit.htm)\
[faccessat](http://www.tutorialspoint.com/unix_system_calls/faccessat.htm)\
[fattch](http://www.tutorialspoint.com/unix_system_calls/fattch.htm)\
[fchdir](http://www.tutorialspoint.com/unix_system_calls/fchdir.htm)\
[fchmodat](http://www.tutorialspoint.com/unix_system_calls/fchmodat.htm)\
[fchmod](http://www.tutorialspoint.com/unix_system_calls/fchmod.htm)\
[fchownat](http://www.tutorialspoint.com/unix_system_calls/fchownat.htm)\
[fchown](http://www.tutorialspoint.com/unix_system_calls/fchown.htm)\
[fcntl](http://www.tutorialspoint.com/unix_system_calls/fcntl.htm)\
[fdatasync](http://www.tutorialspoint.com/unix_system_calls/fdatasync.htm)\
[fdetach](http://www.tutorialspoint.com/unix_system_calls/fdetach.htm)\
[flock](http://www.tutorialspoint.com/unix_system_calls/flock.htm)\
[fork](http://www.tutorialspoint.com/unix_system_calls/fork.htm)\
[free_hugepages](http://www.tutorialspoint.com/unix_system_calls/free_hugepages.htm)\
[fstatat](http://www.tutorialspoint.com/unix_system_calls/fstatat.htm)\
[fstatfs](http://www.tutorialspoint.com/unix_system_calls/fstatfs.htm)\
[fstat](http://www.tutorialspoint.com/unix_system_calls/fstat.htm)\
[fstatvfs](http://www.tutorialspoint.com/unix_system_calls/fstatvfs.htm)\
[fsync](http://www.tutorialspoint.com/unix_system_calls/fsync.htm)\
[ftruncate](http://www.tutorialspoint.com/unix_system_calls/ftruncate.htm)\
[futex](http://www.tutorialspoint.com/unix_system_calls/futex.htm)\
[futimesat](http://www.tutorialspoint.com/unix_system_calls/futimesat.htm)\
[getcontext](http://www.tutorialspoint.com/unix_system_calls/getcontext.htm)\
[getcwd](http://www.tutorialspoint.com/unix_system_calls/getcwd.htm)\
[getdents](http://www.tutorialspoint.com/unix_system_calls/getdents.htm)\
[getdomainname](http://www.tutorialspoint.com/unix_system_calls/getdomainname.htm)\
[getdtablesize](http://www.tutorialspoint.com/unix_system_calls/getdtablesize.htm)\
[getegid](http://www.tutorialspoint.com/unix_system_calls/getegid.htm)\
[geteuid](http://www.tutorialspoint.com/unix_system_calls/geteuid.htm)\
[getgid](http://www.tutorialspoint.com/unix_system_calls/getgid.htm)\
[getgroups](http://www.tutorialspoint.com/unix_system_calls/getgroups.htm)\
[gethostid](http://www.tutorialspoint.com/unix_system_calls/gethostid.htm)\
[gethostname](http://www.tutorialspoint.com/unix_system_calls/gethostname.htm)\
[getitimer](http://www.tutorialspoint.com/unix_system_calls/getitimer.htm)\
[get_kernel_syms](http://www.tutorialspoint.com/unix_system_calls/get_kernel_syms.htm)\
[get_mempolicy](http://www.tutorialspoint.com/unix_system_calls/get_mempolicy.htm)\
[getmsg](http://www.tutorialspoint.com/unix_system_calls/getmsg.htm)\
[getpagesize](http://www.tutorialspoint.com/unix_system_calls/getpagesize.htm)\
[getpeername](http://www.tutorialspoint.com/unix_system_calls/getpeername.htm)\
[getpgid](http://www.tutorialspoint.com/unix_system_calls/getpgid.htm)\
[getpgrp](http://www.tutorialspoint.com/unix_system_calls/getpgrp.htm)\
[getpid](http://www.tutorialspoint.com/unix_system_calls/getpid.htm)\
[getpmsg](http://www.tutorialspoint.com/unix_system_calls/getpmsg.htm)\
[getppid](http://www.tutorialspoint.com/unix_system_calls/getppid.htm)\
[getpriority](http://www.tutorialspoint.com/unix_system_calls/getpriority.htm)\
[getresgid](http://www.tutorialspoint.com/unix_system_calls/getresgid.htm)\
[getresuid](http://www.tutorialspoint.com/unix_system_calls/getresuid.htm)\
[getrlimit](http://www.tutorialspoint.com/unix_system_calls/getrlimit.htm)\
[get_robust_list](http://www.tutorialspoint.com/unix_system_calls/get_robust_list.htm)\
[getrusage](http://www.tutorialspoint.com/unix_system_calls/getrusage.htm)\
[getsid](http://www.tutorialspoint.com/unix_system_calls/getsid.htm)\
[getsockname](http://www.tutorialspoint.com/unix_system_calls/getsockname.htm)\
[getsockopt](http://www.tutorialspoint.com/unix_system_calls/getsockopt.htm)\
[get_thread_area](http://www.tutorialspoint.com/unix_system_calls/get_thread_area.htm)\
[gettid](http://www.tutorialspoint.com/unix_system_calls/gettid.htm)\
[gettimeofday](http://www.tutorialspoint.com/unix_system_calls/gettimeofday.htm)\
[getuid](http://www.tutorialspoint.com/unix_system_calls/getuid.htm)\
[getunwind](http://www.tutorialspoint.com/unix_system_calls/getunwind.htm)\
[gtty](http://www.tutorialspoint.com/unix_system_calls/gtty.htm)\
[idle](http://www.tutorialspoint.com/unix_system_calls/idle.htm)\
[inb](http://www.tutorialspoint.com/unix_system_calls/inb.htm)\
[inb_p](http://www.tutorialspoint.com/unix_system_calls/inb_p.htm)\
[init_module](http://www.tutorialspoint.com/unix_system_calls/init_module.htm)\
[inl](http://www.tutorialspoint.com/unix_system_calls/inl.htm)\
[inl_p](http://www.tutorialspoint.com/unix_system_calls/inl_p.htm)\
[inotify_add_watch](http://www.tutorialspoint.com/unix_system_calls/inotify_add_watch.htm)\
[inotify_init](http://www.tutorialspoint.com/unix_system_calls/inotify_init.htm)\
[inotify_rm_watch](http://www.tutorialspoint.com/unix_system_calls/inotify_rm_watch.htm)\
[insb](http://www.tutorialspoint.com/unix_system_calls/insb.htm)\
[insl](http://www.tutorialspoint.com/unix_system_calls/insl.htm)\
[insw](http://www.tutorialspoint.com/unix_system_calls/insw.htm)\
[intro](http://www.tutorialspoint.com/unix_system_calls/intro.htm)\
[inw](http://www.tutorialspoint.com/unix_system_calls/inw.htm)\
[inw_p](http://www.tutorialspoint.com/unix_system_calls/inw_p.htm)\
[io_cancel](http://www.tutorialspoint.com/unix_system_calls/io_cancel.htm)\
[ioctl](http://www.tutorialspoint.com/unix_system_calls/ioctl.htm)\
[ioctl_list](http://www.tutorialspoint.com/unix_system_calls/ioctl_list.htm)\
[io_destroy](http://www.tutorialspoint.com/unix_system_calls/io_destroy.htm)\
[io_getevents](http://www.tutorialspoint.com/unix_system_calls/io_getevents.htm)\
[ioperm](http://www.tutorialspoint.com/unix_system_calls/ioperm.htm)\
[iopl](http://www.tutorialspoint.com/unix_system_calls/iopl.htm)\
 | [ioprio_get](http://www.tutorialspoint.com/unix_system_calls/ioprio_get.htm)\
[ioprio_set](http://www.tutorialspoint.com/unix_system_calls/ioprio_set.htm)\
[io_setup](http://www.tutorialspoint.com/unix_system_calls/io_setup.htm)\
[io_submit](http://www.tutorialspoint.com/unix_system_calls/io_submit.htm)\
[ipc](http://www.tutorialspoint.com/unix_system_calls/ipc.htm)\
[isastream](http://www.tutorialspoint.com/unix_system_calls/isastream.htm)\
[kexec_load](http://www.tutorialspoint.com/unix_system_calls/kexec_load.htm)\
[keyctl](http://www.tutorialspoint.com/unix_system_calls/keyctl.htm)\
[kill](http://www.tutorialspoint.com/unix_system_calls/kill.htm)\
[killpg](http://www.tutorialspoint.com/unix_system_calls/killpg.htm)\
[lchown](http://www.tutorialspoint.com/unix_system_calls/lchown.htm)\
[linkat](http://www.tutorialspoint.com/unix_system_calls/linkat.htm)\
[link](http://www.tutorialspoint.com/unix_system_calls/link.htm)\
[listen](http://www.tutorialspoint.com/unix_system_calls/listen.htm)\
[_llseek](http://www.tutorialspoint.com/unix_system_calls/_llseek.htm)\
[llseek](http://www.tutorialspoint.com/unix_system_calls/llseek.htm)\
[lock](http://www.tutorialspoint.com/unix_system_calls/lock.htm)\
[lookup_dcookie](http://www.tutorialspoint.com/unix_system_calls/lookup_dcookie.htm)\
[lseek](http://www.tutorialspoint.com/unix_system_calls/lseek.htm)\
[lstat](http://www.tutorialspoint.com/unix_system_calls/lstat.htm)\
[madvise](http://www.tutorialspoint.com/unix_system_calls/madvise.htm)\
[mincore](http://www.tutorialspoint.com/unix_system_calls/mincore.htm)\
[mkdirat](http://www.tutorialspoint.com/unix_system_calls/mkdirat.htm)\
[mkdir](http://www.tutorialspoint.com/unix_system_calls/mkdir.htm)\
[mknodat](http://www.tutorialspoint.com/unix_system_calls/mknodat.htm)\
[mknod](http://www.tutorialspoint.com/unix_system_calls/mknod.htm)\
[mlockall](http://www.tutorialspoint.com/unix_system_calls/mlockall.htm)\
[mlock](http://www.tutorialspoint.com/unix_system_calls/mlock.htm)\
[mmap2](http://www.tutorialspoint.com/unix_system_calls/mmap2.htm)\
[mmap](http://www.tutorialspoint.com/unix_system_calls/mmap.htm)\
[modify_ldt](http://www.tutorialspoint.com/unix_system_calls/modify_ldt.htm)\
[mount](http://www.tutorialspoint.com/unix_system_calls/mount.htm)\
[move_pages](http://www.tutorialspoint.com/unix_system_calls/move_pages.htm)\
[mprotect](http://www.tutorialspoint.com/unix_system_calls/mprotect.htm)\
[mpx](http://www.tutorialspoint.com/unix_system_calls/mpx.htm)\
[mq_getsetattr](http://www.tutorialspoint.com/unix_system_calls/mq_getsetattr.htm)\
[mremap](http://www.tutorialspoint.com/unix_system_calls/mremap.htm)\
[msgctl](http://www.tutorialspoint.com/unix_system_calls/msgctl.htm)\
[msgget](http://www.tutorialspoint.com/unix_system_calls/msgget.htm)\
[msgop](http://www.tutorialspoint.com/unix_system_calls/msgop.htm)\
[msgrcv](http://www.tutorialspoint.com/unix_system_calls/msgrcv.htm)\
[msgsnd](http://www.tutorialspoint.com/unix_system_calls/msgsnd.htm)\
[msync](http://www.tutorialspoint.com/unix_system_calls/msync.htm)\
[multiplexer](http://www.tutorialspoint.com/unix_system_calls/multiplexer.htm)\
[munlockall](http://www.tutorialspoint.com/unix_system_calls/munlockall.htm)\
[munlock](http://www.tutorialspoint.com/unix_system_calls/munlock.htm)\
[munmap](http://www.tutorialspoint.com/unix_system_calls/munmap.htm)\
[nanosleep](http://www.tutorialspoint.com/unix_system_calls/nanosleep.htm)\
[_newselect](http://www.tutorialspoint.com/unix_system_calls/_newselect.htm)\
[nfsservctl](http://www.tutorialspoint.com/unix_system_calls/nfsservctl.htm)\
[nice](http://www.tutorialspoint.com/unix_system_calls/nice.htm)\
[obsolete](http://www.tutorialspoint.com/unix_system_calls/obsolete.htm)\
[oldfstat](http://www.tutorialspoint.com/unix_system_calls/oldfstat.htm)\
[oldlstat](http://www.tutorialspoint.com/unix_system_calls/oldlstat.htm)\
[oldolduname](http://www.tutorialspoint.com/unix_system_calls/oldolduname.htm)\
[oldstat](http://www.tutorialspoint.com/unix_system_calls/oldstat.htm)\
[olduname](http://www.tutorialspoint.com/unix_system_calls/olduname.htm)\
[openat](http://www.tutorialspoint.com/unix_system_calls/openat.htm)\
[open](http://www.tutorialspoint.com/unix_system_calls/open.htm)\
[outb](http://www.tutorialspoint.com/unix_system_calls/outb.htm)\
[outb_p](http://www.tutorialspoint.com/unix_system_calls/outb_p.htm)\
[outl](http://www.tutorialspoint.com/unix_system_calls/outl.htm)\
[outl_p](http://www.tutorialspoint.com/unix_system_calls/outl_p.htm)\
[outsb](http://www.tutorialspoint.com/unix_system_calls/outsb.htm)\
[outsl](http://www.tutorialspoint.com/unix_system_calls/outsl.htm)\
[outsw](http://www.tutorialspoint.com/unix_system_calls/outsw.htm)\
[outw](http://www.tutorialspoint.com/unix_system_calls/outw.htm)\
[outw_p](http://www.tutorialspoint.com/unix_system_calls/outw_p.htm)\
[path_resolution](http://www.tutorialspoint.com/unix_system_calls/path_resolution.htm)\
[pause](http://www.tutorialspoint.com/unix_system_calls/pause.htm)\
[perfmonctl](http://www.tutorialspoint.com/unix_system_calls/perfmonctl.htm)\
[personality](http://www.tutorialspoint.com/unix_system_calls/personality.htm)\
[pipe](http://www.tutorialspoint.com/unix_system_calls/pipe.htm)\
[pivot_root](http://www.tutorialspoint.com/unix_system_calls/pivot_root.htm)\
[poll](http://www.tutorialspoint.com/unix_system_calls/poll.htm)\
[posix_fadvise](http://www.tutorialspoint.com/unix_system_calls/posix_fadvise.htm)\
[ppoll](http://www.tutorialspoint.com/unix_system_calls/ppoll.htm)\
[prctl](http://www.tutorialspoint.com/unix_system_calls/prctl.htm)\
[pread](http://www.tutorialspoint.com/unix_system_calls/pread.htm)\
[prof](http://www.tutorialspoint.com/unix_system_calls/prof.htm)\
[pselect](http://www.tutorialspoint.com/unix_system_calls/pselect.htm)\
[ptrace](http://www.tutorialspoint.com/unix_system_calls/ptrace.htm)\
[putmsg](http://www.tutorialspoint.com/unix_system_calls/putmsg.htm)\
[putpmsg](http://www.tutorialspoint.com/unix_system_calls/putpmsg.htm)\
[pwrite](http://www.tutorialspoint.com/unix_system_calls/pwrite.htm)\
[query_module](http://www.tutorialspoint.com/unix_system_calls/query_module.htm)\
[quotactl](http://www.tutorialspoint.com/unix_system_calls/quotactl.htm)\
[readahead](http://www.tutorialspoint.com/unix_system_calls/readahead.htm)\
[readdir](http://www.tutorialspoint.com/unix_system_calls/readdir.htm)\
[read](http://www.tutorialspoint.com/unix_system_calls/read.htm)\
[readlinkat](http://www.tutorialspoint.com/unix_system_calls/readlinkat.htm)\
[readlink](http://www.tutorialspoint.com/unix_system_calls/readlink.htm)\
[readv](http://www.tutorialspoint.com/unix_system_calls/readv.htm)\
[reboot](http://www.tutorialspoint.com/unix_system_calls/reboot.htm)\
[recvfrom](http://www.tutorialspoint.com/unix_system_calls/recvfrom.htm)\
[recv](http://www.tutorialspoint.com/unix_system_calls/recv.htm)\
[recvmsg](http://www.tutorialspoint.com/unix_system_calls/recvmsg.htm)\
[remap_file_pages](http://www.tutorialspoint.com/unix_system_calls/remap_file_pages.htm)\
[renameat](http://www.tutorialspoint.com/unix_system_calls/renameat.htm)\
[rename](http://www.tutorialspoint.com/unix_system_calls/rename.htm)\
[request_key](http://www.tutorialspoint.com/unix_system_calls/request_key.htm)\
[restart_syscall](http://www.tutorialspoint.com/unix_system_calls/restart_syscall.htm)\
[rmdir](http://www.tutorialspoint.com/unix_system_calls/rmdir.htm)\
[rtas](http://www.tutorialspoint.com/unix_system_calls/rtas.htm)\
[rt_sigaction](http://www.tutorialspoint.com/unix_system_calls/rt_sigaction.htm)\
[rt_sigpending](http://www.tutorialspoint.com/unix_system_calls/rt_sigpending.htm)\
[rt_sigprocmask](http://www.tutorialspoint.com/unix_system_calls/rt_sigprocmask.htm)\
[rt_sigqueueinfo](http://www.tutorialspoint.com/unix_system_calls/rt_sigqueueinfo.htm)\
[rt_sigreturn](http://www.tutorialspoint.com/unix_system_calls/rt_sigreturn.htm)\
[rt_sigsuspend](http://www.tutorialspoint.com/unix_system_calls/rt_sigsuspend.htm)\
[rt_sigtimedwait](http://www.tutorialspoint.com/unix_system_calls/rt_sigtimedwait.htm)\
[sbrk](http://www.tutorialspoint.com/unix_system_calls/sbrk.htm)\
[sched_getaffinity](http://www.tutorialspoint.com/unix_system_calls/sched_getaffinity.htm)\
[sched_getparam](http://www.tutorialspoint.com/unix_system_calls/sched_getparam.htm)\
[sched_get_priority_max](http://www.tutorialspoint.com/unix_system_calls/sched_get_priority_max.htm)\
[sched_get_priority_min](http://www.tutorialspoint.com/unix_system_calls/sched_get_priority_min.htm)\
[sched_getscheduler](http://www.tutorialspoint.com/unix_system_calls/sched_getscheduler.htm)\
[sched_rr_get_interval](http://www.tutorialspoint.com/unix_system_calls/sched_rr_get_interval.htm)\
[sched_setaffinity](http://www.tutorialspoint.com/unix_system_calls/sched_setaffinity.htm)\
[sched_setparam](http://www.tutorialspoint.com/unix_system_calls/sched_setparam.htm)\
[sched_setscheduler](http://www.tutorialspoint.com/unix_system_calls/sched_setscheduler.htm)\
[sched_yield](http://www.tutorialspoint.com/unix_system_calls/sched_yield.htm)\
 | [security](http://www.tutorialspoint.com/unix_system_calls/security.htm)\
[select](http://www.tutorialspoint.com/unix_system_calls/select.htm)\
[select_tut](http://www.tutorialspoint.com/unix_system_calls/select_tut.htm)\
[semctl](http://www.tutorialspoint.com/unix_system_calls/semctl.htm)\
[semget](http://www.tutorialspoint.com/unix_system_calls/semget.htm)\
[semop](http://www.tutorialspoint.com/unix_system_calls/semop.htm)\
[semtimedop](http://www.tutorialspoint.com/unix_system_calls/semtimedop.htm)\
[sendfile](http://www.tutorialspoint.com/unix_system_calls/sendfile.htm)\
[send](http://www.tutorialspoint.com/unix_system_calls/send.htm)\
[sendmsg](http://www.tutorialspoint.com/unix_system_calls/sendmsg.htm)\
[sendto](http://www.tutorialspoint.com/unix_system_calls/sendto.htm)\
[setcontext](http://www.tutorialspoint.com/unix_system_calls/setcontext.htm)\
[setdomainname](http://www.tutorialspoint.com/unix_system_calls/setdomainname.htm)\
[setegid](http://www.tutorialspoint.com/unix_system_calls/setegid.htm)\
[seteuid](http://www.tutorialspoint.com/unix_system_calls/seteuid.htm)\
[setfsgid](http://www.tutorialspoint.com/unix_system_calls/setfsgid.htm)\
[setfsuid](http://www.tutorialspoint.com/unix_system_calls/setfsuid.htm)\
[setgid](http://www.tutorialspoint.com/unix_system_calls/setgid.htm)\
[setgroups](http://www.tutorialspoint.com/unix_system_calls/setgroups.htm)\
[sethostid](http://www.tutorialspoint.com/unix_system_calls/sethostid.htm)\
[sethostname](http://www.tutorialspoint.com/unix_system_calls/sethostname.htm)\
[setitimer](http://www.tutorialspoint.com/unix_system_calls/setitimer.htm)\
[setpgid](http://www.tutorialspoint.com/unix_system_calls/setpgid.htm)\
[setpgrp](http://www.tutorialspoint.com/unix_system_calls/setpgrp.htm)\
[setpriority](http://www.tutorialspoint.com/unix_system_calls/setpriority.htm)\
[setregid](http://www.tutorialspoint.com/unix_system_calls/setregid.htm)\
[setresgid](http://www.tutorialspoint.com/unix_system_calls/setresgid.htm)\
[setresuid](http://www.tutorialspoint.com/unix_system_calls/setresuid.htm)\
[setreuid](http://www.tutorialspoint.com/unix_system_calls/setreuid.htm)\
[setrlimit](http://www.tutorialspoint.com/unix_system_calls/setrlimit.htm)\
[set_robust_list](http://www.tutorialspoint.com/unix_system_calls/set_robust_list.htm)\
[setsid](http://www.tutorialspoint.com/unix_system_calls/setsid.htm)\
[setsockopt](http://www.tutorialspoint.com/unix_system_calls/setsockopt.htm)\
[set_thread_area](http://www.tutorialspoint.com/unix_system_calls/set_thread_area.htm)\
[set_tid_address](http://www.tutorialspoint.com/unix_system_calls/set_tid_address.htm)\
[settimeofday](http://www.tutorialspoint.com/unix_system_calls/settimeofday.htm)\
[setuid](http://www.tutorialspoint.com/unix_system_calls/setuid.htm)\
[setup](http://www.tutorialspoint.com/unix_system_calls/setup.htm)\
[sgetmask](http://www.tutorialspoint.com/unix_system_calls/sgetmask.htm)\
[shmat](http://www.tutorialspoint.com/unix_system_calls/shmat.htm)\
[shmctl](http://www.tutorialspoint.com/unix_system_calls/shmctl.htm)\
[shmdt](http://www.tutorialspoint.com/unix_system_calls/shmdt.htm)\
[shmget](http://www.tutorialspoint.com/unix_system_calls/shmget.htm)\
[shmop](http://www.tutorialspoint.com/unix_system_calls/shmop.htm)\
[shutdown](http://www.tutorialspoint.com/unix_system_calls/shutdown.htm)\
[sigaction](http://www.tutorialspoint.com/unix_system_calls/sigaction.htm)\
[sigaltstack](http://www.tutorialspoint.com/unix_system_calls/sigaltstack.htm)\
[signal](http://www.tutorialspoint.com/unix_system_calls/signal.htm)\
[sigpending](http://www.tutorialspoint.com/unix_system_calls/sigpending.htm)\
[sigprocmask](http://www.tutorialspoint.com/unix_system_calls/sigprocmask.htm)\
[sigqueue](http://www.tutorialspoint.com/unix_system_calls/sigqueue.htm)\
[sigreturn](http://www.tutorialspoint.com/unix_system_calls/sigreturn.htm)\
[sigsuspend](http://www.tutorialspoint.com/unix_system_calls/sigsuspend.htm)\
[sigtimedwait](http://www.tutorialspoint.com/unix_system_calls/sigtimedwait.htm)\
[sigwaitinfo](http://www.tutorialspoint.com/unix_system_calls/sigwaitinfo.htm)\
[socketcall](http://www.tutorialspoint.com/unix_system_calls/socketcall.htm)\
[socket](http://www.tutorialspoint.com/unix_system_calls/socket.htm)\
[socketpair](http://www.tutorialspoint.com/unix_system_calls/socketpair.htm)\
[splice](http://www.tutorialspoint.com/unix_system_calls/splice.htm)\
[spu_create](http://www.tutorialspoint.com/unix_system_calls/spu_create.htm)\
[spufs](http://www.tutorialspoint.com/unix_system_calls/spufs.htm)\
[spu_run](http://www.tutorialspoint.com/unix_system_calls/spu_run.htm)\
[ssetmask](http://www.tutorialspoint.com/unix_system_calls/ssetmask.htm)\
[statfs64](http://www.tutorialspoint.com/unix_system_calls/statfs64.htm)\
[statfs](http://www.tutorialspoint.com/unix_system_calls/statfs.htm)\
[stat](http://www.tutorialspoint.com/unix_system_calls/stat.htm)\
[statvfs](http://www.tutorialspoint.com/unix_system_calls/statvfs.htm)\
[stime](http://www.tutorialspoint.com/unix_system_calls/stime.htm)\
[stty](http://www.tutorialspoint.com/unix_system_calls/stty.htm)\
[swapcontext](http://www.tutorialspoint.com/unix_system_calls/swapcontext.htm)\
[swapoff](http://www.tutorialspoint.com/unix_system_calls/swapoff.htm)\
[swapon](http://www.tutorialspoint.com/unix_system_calls/swapon.htm)\
[symlinkat](http://www.tutorialspoint.com/unix_system_calls/symlinkat.htm)\
[symlink](http://www.tutorialspoint.com/unix_system_calls/symlink.htm)\
[sync_file_range](http://www.tutorialspoint.com/unix_system_calls/sync_file_range.htm)\
[sync](http://www.tutorialspoint.com/unix_system_calls/sync.htm)\
[_syscall](http://www.tutorialspoint.com/unix_system_calls/_syscall.htm)\
[syscall](http://www.tutorialspoint.com/unix_system_calls/syscall.htm)\
[syscalls](http://www.tutorialspoint.com/unix_system_calls/syscalls.htm)\
[_sysctl](http://www.tutorialspoint.com/unix_system_calls/_sysctl.htm)\
[sysctl](http://www.tutorialspoint.com/unix_system_calls/sysctl.htm)\
[sysfs](http://www.tutorialspoint.com/unix_system_calls/sysfs.htm)\
[sysinfo](http://www.tutorialspoint.com/unix_system_calls/sysinfo.htm)\
[syslog](http://www.tutorialspoint.com/unix_system_calls/syslog.htm)\
[tee](http://www.tutorialspoint.com/unix_system_calls/tee.htm)\
[tgkill](http://www.tutorialspoint.com/unix_system_calls/tgkill.htm)\
[time](http://www.tutorialspoint.com/unix_system_calls/time.htm)\
[timer_create](http://www.tutorialspoint.com/unix_system_calls/timer_create.htm)\
[timer_delete](http://www.tutorialspoint.com/unix_system_calls/timer_delete.htm)\
[timer_getoverrun](http://www.tutorialspoint.com/unix_system_calls/timer_getoverrun.htm)\
[timer_gettime](http://www.tutorialspoint.com/unix_system_calls/timer_gettime.htm)\
[timer_settime](http://www.tutorialspoint.com/unix_system_calls/timer_settime.htm)\
[times](http://www.tutorialspoint.com/unix_system_calls/times.htm)\
[tkill](http://www.tutorialspoint.com/unix_system_calls/tkill.htm)\
[truncate](http://www.tutorialspoint.com/unix_system_calls/truncate.htm)\
[tux](http://www.tutorialspoint.com/unix_system_calls/tux.htm)\
[umask](http://www.tutorialspoint.com/unix_system_calls/umask.htm)\
[umount2](http://www.tutorialspoint.com/unix_system_calls/umount2.htm)\
[umount](http://www.tutorialspoint.com/unix_system_calls/umount.htm)\
[uname](http://www.tutorialspoint.com/unix_system_calls/uname.htm)\
[undocumented](http://www.tutorialspoint.com/unix_system_calls/undocumented.htm)\
[unimplemented](http://www.tutorialspoint.com/unix_system_calls/unimplemented.htm)\
[unlinkat](http://www.tutorialspoint.com/unix_system_calls/unlinkat.htm)\
[unlink](http://www.tutorialspoint.com/unix_system_calls/unlink.htm)\
[unshare](http://www.tutorialspoint.com/unix_system_calls/unshare.htm)\
[uselib](http://www.tutorialspoint.com/unix_system_calls/uselib.htm)\
[ustat](http://www.tutorialspoint.com/unix_system_calls/ustat.htm)\
[utime](http://www.tutorialspoint.com/unix_system_calls/utime.htm)\
[utimes](http://www.tutorialspoint.com/unix_system_calls/utimes.htm)\
[vfork](http://www.tutorialspoint.com/unix_system_calls/vfork.htm)\
[vhangup](http://www.tutorialspoint.com/unix_system_calls/vhangup.htm)\
[vm86](http://www.tutorialspoint.com/unix_system_calls/vm86.htm)\
[vm86old](http://www.tutorialspoint.com/unix_system_calls/vm86old.htm)\
[vmsplice](http://www.tutorialspoint.com/unix_system_calls/vmsplice.htm)\
[vserver](http://www.tutorialspoint.com/unix_system_calls/vserver.htm)\
[wait3](http://www.tutorialspoint.com/unix_system_calls/wait3.htm)\
[wait4](http://www.tutorialspoint.com/unix_system_calls/wait4.htm)\
[wait](http://www.tutorialspoint.com/unix_system_calls/wait.htm)\
[waitid](http://www.tutorialspoint.com/unix_system_calls/waitid.htm)\
[waitpid](http://www.tutorialspoint.com/unix_system_calls/waitpid.htm)\
[write](http://www.tutorialspoint.com/unix_system_calls/write.htm)\
[writev](http://www.tutorialspoint.com/unix_system_calls/writev.htm) |


this chapter, we will discuss in detail about special variable in Unix. In one of our previous chapters, we understood how to be careful when we use certain nonalphanumeric characters in variable names. This is because those characters are used in the names of special Unix variables. These variables are reserved for specific functions.

For example, the $ character represents the process ID number, or PID, of the current shell −

$echo $$


The above command writes the PID of the current shell −

29949

The following table shows a number of special variables that you can use in your shell scripts −
Sr.No. 	Variable & Description
1 	

$0

The filename of the current script.
2 	

$n

These variables correspond to the arguments with which a script was invoked. Here n is a positive decimal number corresponding to the position of an argument (the first argument is $1, the second argument is $2, and so on).
3 	

$#

The number of arguments supplied to a script.
4 	

$*

All the arguments are double quoted. If a script receives two arguments, $* is equivalent to $1 $2.
5 	

$@

All the arguments are individually double quoted. If a script receives two arguments, $@ is equivalent to $1 $2.
6 	

$?

The exit status of the last command executed.
7 	

$$

The process number of the current shell. For shell scripts, this is the process ID under which they are executing.
8 	

$!

The process number of the last background command.



## Variable Arguments

A function may accept a varying number of additional arguments without corresponding parameter declarations by including a comma and three dots (,...) after its regular named parameters:

return_type function_name ( parameter_declarations , ... );
To access these additional arguments the macros va_start, va_arg and va_end, declared in this header, can be used:

    First, va_start initializes the list of variable arguments as a va_list.
    Subsequent executions of va_arg yield the values of the additional arguments in the same order as passed to the function.
    Finally, va_end shall be executed before the function returns.

- `va_list` - Type to hold information about variable arguments (type )

Macro functions

- `va_start` - Initialize a variable argument list (macro )
- `va_arg` - Retrieve next argument (macro )
- `va_end` - End using variable argument list (macro )
- `va_copy` - Copy variable argument list (macro 

```C
    /* vsprintf example */
#include <stdio.h>
#include <stdarg.h>

void PrintFError ( const char * format, ... )
{
  char buffer[256];
  va_list args;
  va_start (args, format);
  vsprintf (buffer,format, args);
  perror (buffer);
  va_end (args);
}

int main ()
{
  FILE * pFile;
  char szFileName[]="myfile.txt";

  pFile = fopen (szFileName,"r");
  if (pFile == NULL)
    PrintFError ("Error opening '%s'",szFileName);
  else
  {
    // file successfully open
    fclose (pFile);
  }
  return 0;
}
```


## Strings


function
<cstring>
strcat

char * strcat ( char * destination, const char * source );

Concatenate strings
Appends a copy of the source string to the destination string. The terminating null character in destination is overwritten by the first character of source, and a null-character is included at the end of the new string formed by the concatenation of both in destination.

```c
/* strcat example */
#include <stdio.h>
#include <string.h>

int main ()
{
  char str[80];
  strcpy (str,"these ");
  strcat (str,"strings ");
  strcat (str,"are ");
  strcat (str,"concatenated.");
  puts (str);
  return 0;
}


```


function
<cstring>
strncat

char * strncat ( char * destination, const char * source, size_t num );

Append characters from string
Appends the first num characters of source to destination, plus a terminating null-character.

If the length of the C string in source is less than num, only the content up to the terminating null-character is copied.


- `destination` - Pointer to the destination array, which should contain a C string, and be large enough to contain the concatenated resulting string, including the additional null-character.source
    C string to be appended.
- `num` - Maximum number of characters to be appended.    size_t is an unsigned integral type. 
- `` - Example


	

/* strncat example */
#include <stdio.h>
#include <string.h>

int main ()
{
  char str1[20];
  char str2[20];
  strcpy (str1,"To be ");
  strcpy (str2,"or not to be");
  strncat (str1, str2, 6);
  puts (str1);
  return 0;
}


[Cstdio](http://www.cplusplus.com/reference/cstdio/)



Functions
Operations on files:

- `remove` - Remove file (function )
- `rename` - Rename file (function )
- `tmpfile` - Open a temporary file (function )
- `tmpnam` - Generate temporary filename (function )

File access:

- `fclose` - Close file (function )
- `fflush` - Flush stream (function )
- `fopen` - Open file (function )
- `freopen` - Reopen stream with different file or mode (function )
- `setbuf` - Set stream buffer (function )
- `setvbuf` - Change stream buffering (function )

Formatted input/output:

- `fprintf` - Write formatted data to stream (function )
- `fscanf` - Read formatted data from stream (function )
- `printf` - Print formatted data to stdout (function )
- `scanf` - Read formatted data from stdin (function )
- `snprintf` - Write formatted output to sized buffer (function )
- `sprintf` - Write formatted data to string (function )
- `sscanf` - Read formatted data from string (function )
- `vfprintf` - Write formatted data from variable argument list to stream (function )
- `vfscanf` - Read formatted data from stream into variable argument list (function )
- `vprintf` - Print formatted data from variable argument list to stdout (function )
- `vscanf` - Read formatted data into variable argument list (function )
- `vsnprintf` - Write formatted data from variable argument list to sized buffer (function )
- `vsprintf` - Write formatted data from variable argument list to string (function )
- `vsscanf` - Read formatted data from string into variable argument list (function )

Character input/output:

- `fgetc` - Get character from stream (function )
- `fgets` - Get string from stream (function )
- `fputc` - Write character to stream (function )
- `fputs` - Write string to stream (function )
- `getc` - Get character from stream (function )
- `getchar` - Get character from stdin (function )
- `gets` - Get string from stdin (function )
- `putc` - Write character to stream (function )
- `putchar` - Write character to stdout (function )
- `puts` - Write string to stdout (function )
- `ungetc` - Unget character from stream (function )

Direct input/output:

- `fread` - Read block of data from stream (function )
- `fwrite` - Write block of data to stream (function )

File positioning:

- `fgetpos` - Get current position in stream (function )
- `fseek` - Reposition stream position indicator (function )
- `fsetpos` - Set position indicator of stream (function )
- `ftell` - Get current position in stream (function )
- `rewind` - Set position of stream to the beginning (function )

Error-handling:

- `clearerr` - Clear error indicators (function )
- `feof` - Check end-of-file indicator (function )
- `ferror` - Check error indicator (function )
- `perror` - Print error message (function )

Macros

- `BUFSIZ` - Buffer size (constant )
- `EOF` - End-of-File (constant )
- `FILENAME_MAX` - Maximum length of file names (constant )
- `FOPEN_MAX` - Potential limit of simultaneous open streams (constant )
- `L_tmpnam` - Minimum length for temporary file name (constant )
- `NULL` - Null pointer (macro )
- `TMP_MAX` - Number of temporary files (constant )
Additionally: _IOFBF, _IOLBF, _IONBF (used with setvbuf)
and SEEK_CUR, SEEK_END and SEEK_SET (used with fseek).

Types

- `FILE` - Object containing information to control a stream (type )
- `fpos_t` - Object containing information to specify a position within a file (type )
- `size_t` - Unsigned integral type (type )



[Wide characters](http://www.cplusplus.com/reference/cwchar/)



<cwchar> (wchar.h)
This header file defines several functions to work with C wide strings.

Functions
Input/Output: (mostly wide versions of <cstdio> functions)

- `fgetwc` - Get wide character from stream (function )
- `fgetws` - Get wide string from stream (function )
- `fputwc` - Write wide character to stream (function )
- `fputws` - Write wide string to stream (function )
- `fwide` - Stream orientation (function )
- `fwprintf` - Write formatted data to stream (function )
- `fwscanf` - Read formatted data from stream (function )
- `getwc` - Get wide character from stream (function )
- `getwchar` - Get wide character from stdin (function )
- `putwc` - Write wide character to stream (function )
- `putwchar` - Write wide character to stdout (function )
- `swprintf` - Write formatted data to wide string (function )
- `swscanf` - Read formatted data from string (function )
- `ungetwc` - Unget wide character from stream (function )
- `vfwprintf` - Write formatted data from variable argument list to stream (function )
- `vfwscanf` - Read formatted data from stream into variable argument list (function )
- `vswprintf` - Write formatted data from variable argument list to sized buffer (function )
- `vswscanf` - Read formatted data from wide string into variable argument list (function )
- `vwprintf` - Print formatted data from variable argument list to stdout (function )
- `vwscanf` - Read formatted data into variable argument list (function )
- `wprintf` - Print formatted data to stdout (function )
- `wscanf` - Read formatted data from stdin (function )

General utilities: (wide versions of <cstdlib> functions)

- `wcstod` - Convert wide string to double (function )
- `wcstof` - Convert wide string to float (function )
- `wcstol` - Convert wide string to long integer (function )
- `wcstold` - Convert wide string to long double (function )
- `wcstoll` - Convert wide string to long long integer (function )
- `wcstoul` - Convert wide string to unsigned long integer (function )
- `wcstoull` - Convert wide string to unsigned long long integer (function )

Character/string conversion: (mostly extended versions of <cstdlib> functions)

- `btowc` - Convert single byte character to wide character (function )
- `mbrlen` - Get length of multibyte character (function )
- `mbrtowc` - Convert multibyte sequence to wide character (function )
- `mbsinit` - Check if initial conversion state (function )
- `mbsrtowcs` - Convert multibyte string to wide-character string (function )
- `wcrtomb` - Convert wide character to multibyte sequence (function )
- `wctob` - Convert wide character to single byte (function )
- `wcsrtombs` - Convert wide-character string to multibyte string (function )

Strings: (wide versions of <cstring> functions)

- `wcscat` - Concatenate wide strings (function )
- `wcschr` - Locate first occurrence of character in wide string (function )
- `wcscmp` - Compare two strings (function )
- `wcscoll` - Compare two wide strings using locale (function )
- `wcscpy` - Copy wide string (function )
- `wcscspn` - Get span until character in wide string (function )
- `wcslen` - Get wide string length (function )
- `wcsncat` - Append characters from wide string (function )
- `wcsncmp` - Compare characters of two wide strings (function )
- `wcsncpy` - Copy characters from wide string (function )
- `wcspbrk` - Locate characters in wide string (function )
- `wcsrchr` - Locate last occurrence of character in wide string (function )
- `wcsspn` - Get span of character set in wide string (function )
- `wcsstr` - Locate substring of wide string (function )
- `wcstok` - Split wide string into tokens (function )
- `wcsxfrm` - Transform wide string using locale (function )
- `wmemchr` - Locate character in block of wide characters (function )
- `wmemcmp` - Compare two blocks of wide characters (function )
- `wmemcpy` - Copy block of wide characters (function )
- `wmemmove` - Move block of wide characters (function )
- `wmemset` - Fill array of wide characters (function )

Time: (a wide version of a <ctime> function)

- `wcsftime` - Format time as wide string (function )

Types

- `mbstate_t` - Multibyte conversion state (type )
- `size_t` - Unsigned integral type (type )
struct tm
    Time structure (type )

- `wchar_t` - Wide character (type )
- `wint_t` - Wide int type (type )

Macro constants

- `NULL` - Null pointer (macro )
- `WCHAR_MAX` - Maximum value of wchar_t (constant )
- `WCHAR_MIN` - Minimum value of wchar_t (constant )
- `WEOF` - Wide end-of-file (constant )



## Thread and other functions

pthread_create2;