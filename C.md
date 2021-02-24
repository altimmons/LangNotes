# C programming

## Setup

Linux needs 

sudo apt-get install linux-libc-dev gcc-multilib cmake cmake-doc gcc clang


Variables defined with ‘=’ are recursively expanded variables. Variables defined with ‘:=’ or ‘::=’ are simply expanded variables; these definitions can contain variable references which will be expanded before the definition is made. See The Two Flavors of Variables.

The shell assignment operator ‘!=’ can be used to execute a shell script and set a variable to its output. This operator first evaluates the right-hand side, then passes that result to the shell for execution. If the result of the execution ends in a newline, that one newline is removed; all other newlines are replaced by spaces. The resulting string is then placed into the named recursively-expanded variable. 


## Make

[Great SOurce](https://www.gnu.org/software/make/manual/html_node/Text-Functions.html#Text-Functions)
[Funtions](https://www.gnu.org/software/make/manual/html_node/Functions.html)

[File Name Functions](https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html#File-Name-Functions)

### Make Implicit Variables

[Implicit Vars](https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html#Implicit-Variables)

- `AR` - Archive-maintaining program; default ‘ar’.
- `AS` - Program for compiling assembly files; default ‘as’.
- `CC` - Program for compiling C programs; default ‘cc’.
- `CXX` - Program for compiling C++ programs; default ‘g++’.
- `CPP` - Program for running the C preprocessor, with results to standard output; default ‘$(CC) -E’.
- `FC` - Program for compiling or preprocessing Fortran and Ratfor programs; default ‘f77’.
- `M2C` - Program to use to compile Modula-2 source code; default ‘m2c’.
- `PC` - Program for compiling Pascal programs; default ‘pc’.
- `CO` - Program for extracting a file from RCS; default ‘co’.
- `GET` - Program for extracting a file from SCCS; default ‘get’.
- `LEX` - Program to use to turn Lex grammars into source code; default ‘lex’.
- `YACC` - Program to use to turn Yacc grammars into source code; default ‘yacc’.
- `LINT` - Program to use to run lint on source code; default ‘lint’.
- `MAKEINFO` - Program to convert a Texinfo source file into an Info file; default ‘makeinfo’.
- `TEX` - Program to make TeX DVI files from TeX source; default ‘tex’.
- `TEXI2DVI` - Program to make TeX DVI files from Texinfo source; default ‘texi2dvi’.
- `WEAVE` - Program to translate Web into TeX; default ‘weave’.
- `CWEAVE` - Program to translate C Web into TeX; default ‘cweave’.
- `TANGLE` - Program to translate Web into Pascal; default ‘tangle’.
- `CTANGLE` - Program to translate C Web into C; default ‘ctangle’.
- `RM` - Command to remove a file; default ‘rm -f’. 

Here is a table of variables whose values are additional arguments for the programs above. The default values for all of these is the empty string, unless otherwise noted.

- `ARFLAGS` - Flags to give the archive-maintaining program; default ‘rv’.
- `ASFLAGS` - Extra flags to give to the assembler (when explicitly invoked on a ‘.s’ or ‘.S’ file).
- `CFLAGS` - Extra flags to give to the C compiler.
- `CXXFLAGS` - Extra flags to give to the C++ compiler.
- `COFLAGS` - Extra flags to give to the RCS co program.
- `CPPFLAGS` - Extra flags to give to the C preprocessor and programs that use it (the C and Fortran compilers).
- `FFLAGS` - Extra flags to give to the Fortran compiler.
- `GFLAGS` - Extra flags to give to the SCCS get program.
- `LDFLAGS` - Extra flags to give to compilers when they are supposed to invoke the linker, ‘ld’, such as -L. Libraries (-lfoo) should be added to the LDLIBS variable instead.
- `LDLIBS` - Library flags or names given to compilers when they are supposed to invoke the linker, ‘ld’. LOADLIBES is a deprecated (but still supported) alternative to LDLIBS. Non-library linker flags, such as -L, should go in the LDFLAGS variable.
- `LFLAGS` - Extra flags to give to Lex.
- `YFLAGS` - Extra flags to give to Yacc.
- `PFLAGS` - Extra flags to give to the Pascal compiler.
- `RFLAGS` - Extra flags to give to the Fortran compiler for Ratfor programs.
- `LINTFLAGS` - Extra flags to give to lint. 



        targets : prerequisites
                recipe
                …

        or like this:

        targets : prerequisites ; recipe
                recipe
                …


TARGET: REQUIREMENTAS

‘$@’ is the name of whichever target caused the rule’s recipe to be run.  It is the TARGET

$? all prerequisites newer than target The names of all the prerequisites that are newer than the target, with spaces between them. If the target does not exist, all prerequisites will be included. 

$^ all prerequisites.The names of all the prerequisites, with spaces between them. For prerequisites which are archive members, only the named member is used (see Archives). 

‘$<’ is the automatic variable that holds the name of the FIRST prerequisite and 

‘$@’ is the automatic variable that holds the name of the target;

$@ The file name of the target of the rule. If the target is an archive member, then ‘$@’ is the name of the archive file. In a pattern rule that has multiple targets (see Introduction to Pattern Rules), ‘$@’ is the name of whichever target caused the rule’s recipe to be run. 

`$%`
    The target member name, when the target is an archive member. 

`$<` The name of the first prerequisite. 

`$?` -The names of all the prerequisites that are newer than the target

`$^` The names of all the prerequisites, with spaces between them

`$*`

    The stem with which an implicit rule matches

`$+`
This is like ‘$^’, but prerequisites listed more than once are duplicated in the order they were listed in the makefile. 
`$|`
The names of all the order-only prerequisites, with spaces between them.


`$*`
[Automatic Variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)


‘$(@D)’   The directory part of the file name of the target, with the trailing slash removed. If the value of ‘$@’ is dir/foo.o then ‘$(@D)’ is dir. This value is . if ‘$@’ does not contain a slash.
‘$(@F)’     The file-within-directory part of the file name of the target. If the value of ‘$@’ is dir/foo.o then ‘$(@F)’ is foo.o. ‘$(@F)’ is equivalent to ‘$(notdir $@)’.
‘$(*D)’‘$(*F)’
    The directory part and the file-within-directory part of the stem; dir and foo in this example.
‘$(%D)’‘$(%F)’
    The directory part and the file-within-directory part of the target archive member name. This makes sense only for archive member targets of the form archive(member) and is useful only when member may contain a directory name. (See Archive Members as Targets.)
‘$(<D)’‘$(<F)’

    The directory part and the file-within-directory part of the first prerequisite.
‘$(^D)’‘$(^F)’
    Lists of the directory parts and the file-within-directory parts of all prerequisites.
‘$(+D)’ ‘$(+F)’    Lists of the directory parts and the file-within-directory parts of all prerequisites, including multiple instances of duplicated prerequisites.
‘$(?D)’ ‘$(?F)’
    Lists of the directory parts and the file-within-directory parts of all prerequisites that are newer than the target. 

In an explicit rule, there is no stem; so ‘$*’ cannot be determined in that way. Instead, if the target name ends with a recognized suffix (see Old-Fashioned Suffix Rules), ‘$*’ is set to the target name minus the suffix.

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