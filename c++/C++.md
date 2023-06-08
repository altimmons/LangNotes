# C ++ Notes


## Links

[Reference](https://en.cppreference.com/w/)
[Try this tutorial](https://msdn.microsoft.com/en-us/library/bb384843.aspx)
[Dr. GUI](https://msdn.microsoft.com/en-us/library/aa302304.aspx)
[C Language Reference | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/c-language/c-language-reference?view=vs-2017)
[C++ Language Reference | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/cpp-language-reference?view=vs-2019)

[Good General reference](http://www.cplusplus.com/)

 - [Tutorial](http://www.cplusplus.com/doc/tutorial/)
 
[C++ FAQ](https://isocpp.org/wiki/faq)

[C++ Data Types - Tutorialspoint](https://www.tutorialspoint.com/cplusplus/cpp_data_types.htm)

[Cmake Doc](https://cmake.org/cmake/help/v3.17/manual/cmake.1.html#)

[Make Doc](https://www.gnu.org/software/make/manual/html_node/index.html/)



## Books and Documents


[CMake Lists Doc](https://cmake.org/cmake/help/v3.17/manual/cmake-commands.7.html#project-commands)

 is here:




[Online Version](https://opdhsblobprod01.blob.core.windows.net/contents/8ee155eb21834b65814ae67f4da97bf3/8a2d83eae325cb9ced5cf9b5440121d2?sv=2018-03-28&sr=b&si=ReadPolicy&sig=ncjVyNMLSFw6EZOSxzVH5ilP%2FJoMlR0v3KQBwhAoF%2Fo%3D&st=2021-03-12T19%3A32%3A54Z&se=2021-03-13T19%3A42%3A54Z)




[Download PDF](https://docs.microsoft.com/en-us/cpp/opbuildpdf/78c042cb37288b66b693d2509bf4a82d/cpp/toc.pdf?branch=live&view=msvc-160)

[A Dump of all the microsoft Documentation]("file:///O:/OneDrive/Textbooks/Comput~1/C++/C++ Language Ref- MS Doc Dump.pdf")



## Compiler Options Here

[MSVSC Compiler Options](https://docs.microsoft.com/en-us/cpp/build/reference/compiler-options-listed-alphabetically?view=msvc-160)


GCC

[Good Summary Here](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/gcc/Option-Summary.html#Option-Summary)




Commands starting with -f affect the language -the 'dialect'

e.g. `-fconstexpr-depth=n` `-fconcepts`

Suppressing or requestign errors is with `-W` e.g.

`-Wall` `-Wpendantic`
`-g` (and many `-f` too) affect debugging (or debug building more)
     e.g. `-gpubnames` `-gcolumn-info`

`-O` controls optimization- it has specific [levels](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/gcc/Optimize-Options.html#Optimize-Options)

    `-O, -O1, -O2, -O3,-Os` (opt for small size), `-Ofast` `-O0` (default, no optimization make debugging work as expected.) and `-Og` some optimization but debugging still works.


### Preprossesor Flags


`-D`**name**[ *=def*] Defines symbol name to the preprocessor.

`-E`  - Runs only the preprocessor on the C++ source files and sends the result to stdout. Does not compile.
`-H`  - Prints the path names of included files.
`-P`  - Only preprocesses source; outputs to .i file.
`-U` **name** - Deletes initial definition of preprocessor symbol name.
`-xM` - Outputs makefile dependency information.
`-xM1` - Generates dependency information but excludes /usr/include.

    -D name

    Predefine name as a macro, with definition 1.
-D name=definition

    The contents of definition are tokenized and processed as if they appeared during translation phase three in a ‘#define’ directive. In particular, the definition is truncated by embedded newline characters.

    If you are invoking the preprocessor from a shell or shell-like program you may need to use the shell’s quoting syntax to protect characters such as spaces that have a meaning in the shell syntax.

    If you wish to define a function-like macro on the command line, write its argument list with surrounding parentheses before the equals sign (if any). Parentheses are meaningful to most shells, so you should quote the option. With sh and csh, -D'name(args…)=definition' works.

    -D and -U options are processed in the order they are given on the command line. All -imacros file and -include file options are processed after all -D and -U options.
-U name

    Cancel any previous definition of name, either built in or provided with a -D option.
-include file

    Process file as if #include "file" appeared as the first line of the primary source file. However, the first directory searched for file is the preprocessor’s working directory instead of the directory containing the main source file. If not found there, it is searched for in the remainder of the #include "…" search chain as normal.

    If multiple -include options are given, the files are included in the order they appear on the command line.
-imacros file

    Exactly like -include, except that any output produced by scanning file is thrown away. Macros it defines remain defined. This allows you to acquire all the macros from a header without also processing its declarations.

    All files specified by -imacros are processed before all files specified by -include.
-undef

    Do not predefine any system-specific or GCC-specific macros. The standard predefined macros remain defined.
-pthread

    Define additional macros required for using the POSIX threads library. You should use this option consistently for both compilation and linking. This option is supported on GNU/Linux targets, most other Unix derivatives, and also on x86 Cygwin and MinGW targets.
-M

    Instead of outputting the result of preprocessing, output a rule suitable for make describing the dependencies of the main source file. The preprocessor outputs one make rule containing the object file name for that source file, a colon, and the names of all the included files, including those coming from -include or -imacros command-line options. 

`-d<letters>`  debugging dumps

-l Library files

-fuse-ld=bfd

    Use the bfd linker instead of the default linker.
-fuse-ld=gold

    Use the gold linker instead of the default linker.
-llibrary
-l library
-lobjc
-pthread
-static
-shared

## Make 

See `C` Notes

Also see [here](https://www.gnu.org/software/make/manual/make.html)





## CMake

[Reasonable High Level Overview](https://cmake.org/cmake/help/v3.17/manual/cmake-buildsystem.7.html#target-properties)



add_subdirectory-Users must explicitly build targets in the subdirectory. This is meant for use when the subdirectory contains a separate part of the project that is useful but not necessary, such as a set of examples. Typically the subdirectory should contain its own project() command



`add_dependencies()`  Makes a top-level `<target> `depend on other top-level targets to ensure that they build before `<target>` does. A top-level target is one created by one of the add_executable(), add_library(), or add_custom_target() commands (but not targets generated by CMake like install).

Dependencies added to an imported target or an interface library are followed transitively in its place since the target itself does not build.'


[Generator Expressions e.g. COmparisons and Logic](https://cmake.org/cmake/help/latest/manual/cmake-generator-expressions.7.html?highlight=strequal#genex:STREQUAL)

Generator Expressions are like functions.


[cmake-buildsystem(7) — CMake 3.17.5 Documentation](https://cmake.org/cmake/help/v3.17/manual/cmake-buildsystem.7.html)

Executables and libraries are defined using the add_executable() and add_library() commands. The resulting binary files have appropriate PREFIX, SUFFIX and extensions for the platform targeted. Dependencies between binary targets are expressed using the target_link_libraries() command:

        add_library(archive archive.cpp zip.cpp lzma.cpp)
        add_executable(zipapp zipapp.cpp)
        target_link_libraries(zipapp archive)

archive is defined as a STATIC library – an archive containing objects compiled from archive.cpp, zip.cpp, and lzma.cpp. zipapp is defined as an executable formed by compiling and linking zipapp.cpp. When linking the zipapp executable, the archive static library is linked in.
Binary Executables

The add_executable() command defines an executable target:

        add_executable(mytool mytool.cpp)

y default, the add_library() command defines a STATIC library, unless a type is specified. A type may be specified when using the command:

        add_library(archive SHARED archive.cpp zip.cpp lzma.cpp)

        add_library(archive STATIC archive.cpp zip.cpp lzma.cpp)

The BUILD_SHARED_LIBS variable may be enabled to change the behavior of add_library() to build shared libraries by default.

In the context of the buildsystem definition as a whole, it is largely irrelevant whether particular libraries are SHARED or STATIC – the commands, dependency specifications and other APIs work similarly regardless of the library type. The MODULE library type is dissimilar in that it is generally not linked to – it is not used in the right-hand-side of the target_link_libraries() command. It is a type which is loaded as a plugin using runtime techniques. If the library does not export any unmanaged symbols (e.g. Windows resource DLL, C++/CLI DLL), it is required that the library not be a SHARED library because CMake expects SHARED libraries to export at least one symbol.

        add_library(archive MODULE 7z.cpp)

###  Property Origin Debugging

Because build specifications can be determined by dependencies, the lack of locality of code which creates a target and code which is responsible for setting build specifications may make the code more difficult to reason about. cmake(1) provides a debugging facility to print the origin of the contents of properties which may be determined by dependencies. The properties which can be debugged are listed in the CMAKE_DEBUG_TARGET_PROPERTIES variable documentation:

set(CMAKE_DEBUG_TARGET_PROPERTIES
  INCLUDE_DIRECTORIES
  COMPILE_DEFINITIONS
  POSITION_INDEPENDENT_CODE
  CONTAINER_SIZE_REQUIRED
  LIB_VERSION
)

```

# set(CMAKE_DEBUG_TARGET_PROPERTIES
# SOURCES
#   INCLUDE_DIRECTORIES
#   COMPILE_DEFINITIONS
#   COMPILE_OPTIONS
#   LINK_DIRECTORIES
#   LINK_OPTIONS
#   POSITION_INDEPENDENT_CODE
#   CONTAINER_SIZE_REQUIRED
#   LIB_VERSION
# )
```

!!!Note Adding these flags could look bad
    This will dump extra info into output- but the IDE interprets this as errors (red squiggles) when it gets feedback on each line.  Seems to work fine anyway.


### Interesting Command

`@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."`



## Archetypical Program


```c++
// this is a format
#include <iostream>

/* Another comment format */

using namespace std;

int main(int argc, char* argv[]){
    cout << "Groovy Baby!" << "\n";
    
    }


```


header files no longer contain *.h




## Multiple Files

### Initial Prototype

```c++
//#main.cpp

#include <iostream.h>
using namespace std;

void greetings(); //program func prototype

int main(){
   greetings();
   return 0;

}

void greetings(){ //program function definition
   cout << "Hello World!" << endl;
   return;
}
```

### Brokenout to multiple files

To separate files:

#### header

```c++
//#greet.h
#ifndef GREET_H
#define GREET_H
//if not defined, define GREET_H- prevents multiple definitions
//only done in the header file.

#include <iostream.h>
using namespace std;

//include the prototype
void greetings(); //program func prototype

#endif
```

Header file includes:

- prototypes
- global constants
- template code
- struct defs
- class defs
- ifndef and def

do not `#include` a *.cpp, only `#include *.h`

!!!Important Important: Must not declare variables in .h files.  Throws tons of mysterious errors

    See [Stack Overflow on the Topic](https://stackoverflow.com/questions/58724828/when-defining-a-variable-as-static-why-can-it-be-defined-multiple-times)
    
> my_global.h
> 
> #ifndef MY_GLOBAL_H
> #define MY_GLOBAL_H
> 
> static int my_global_with_static[]={10, 20, 30, 40};
> 
> extern int my_global_with_extern[4];
> 
> void
> show_array(const char *title,
> const int *array,
> int count);
> 
> void
> another_function(void);
> 
> #endif
> 
> my_global.c
> 
> ```cpp
> #include "my_global.h"
> 
> #include <stdio.h>
> 
> int my_global_with_extern[4]={1, 2, 3, 4};
> 
> void
> show_array(const char *title,
> const int *array,
> int count)
> {
> printf("%s:\n", title);
> printf("  at %p:", (void *)array);
> for(int i=0; i<count; ++i)
> {
> printf("  %d", array[i]);
> }
> printf("\n");
> }
> 
> void
> another_function(void)
> {
> show_array("my_global_with_static from another translation unit",
> my_global_with_static, 4);
> show_array("my_global_with_extern from another translation unit",
> my_global_with_extern, 4);
> }
> ```


> prog.c
> 
> ```cpp
> #include "my_global.h"
> 
> #include <stdio.h>
> 
> int
> main(void)
> {
> show_array("my_global_with_static from main translation unit",
> my_global_with_static, 4);
> show_array("my_global_with_extern from main translation unit",
> my_global_with_extern, 4);
> another_function();
> return 0;
> }
> ```
> When running this program, I obtain this result
> 
>   my_global_with_static from main translation unit:
>       at 0x5630507e10a0:  10  20  30  40
>   my_global_with_extern from main translation unit:
>       at 0x5630507e1200:  1  2  3  4
>   my_global_with_static from another translation unit:
>       at 0x5630507e11c0:  10  20  30  40
>   my_global_with_extern from another translation unit:
>       at 0x5630507e1200:  1  2  3  4

We can see that my_global_with_extern is the exact same array when considered from the main translation unit or from another one; indeed not only the values are the same but this array is visible at the same address (0x5630507e1200 during this run).

On the other hand, my_global_with_static looks the same in both translation units (the values are identical) but consists actually in two distinct arrays with their own memory location in each translation unit (0x5630507e10a0 and 0x5630507e11c0 in this run).

**The extern keyword means that we are only declaring the variable.**

#### Implementation

```c++
//#greet.cpp
#include "greet.h" //use quotes for files found in cur dir


void greetings(){ //program function definition
   cout << "Hello World!" << endl;
   return;
}
```

`#include "greet.h" //use quotes for files found in cur dir` includes the header file for itself which releases the necessity of ordering the files in a particular order.

`#include <iostream.h>` is in the header, so not required for being included into **greet.cpp**

#### Main Revised

```c++
//#main.cpp

#include <iostream.h>
//add the include
#include "greet.h" //use quotes for files found in cur dir

using namespace std;

//// void greetings(); //program func prototype
//=> moves to .h

int main(){
   greetings();
   return 0;

}

//// void greetings(){ //program function definition
////    cout << "Hello World!" << endl;
////    return;
//// }
```
## Compilation

Sinle File:
`g++ -W -Wall -s -pendantic-errors proq.cpp -o my_proq`

To multiple files:
`g++ -W -Wall -s -pendantic-errors treeFarm.cpp treeFarmFunctions.cpp -o my_proq`
`g++ -W -Wall -s -pendantic-errors *.cpp  -o my_proq`

### Search Path

This seems to give me a fair amount of trouble- so this is focused here:


By default, the preprocessor looks for header files included by the **quote form** of the directive `#include` "file" first relative to the directory of the current file, and then in a preconfigured list of standard system directories. For example, if `/usr/include/sys/stat.h` contains `#include "types.h"`, GCC looks for` types.h` first in `/usr/include/sys`, then in its usual search path.

For the angle-bracket form #include `<file>`, the preprocessor’s default behavior is to look only in the standard system directories. The exact search directory list depends on the target system, how GCC is configured, and where it is installed. You can find the default search directory list for your version of CPP by invoking it with the -v option. For example,

!!!Tip Use the following command if files are not being found - the `-v` opt.
        `cpp -v /dev/null -o /dev/null`

        Note that you can also prevent the preprocessor from searching any of the default system header directories with the -nostdinc option. This is useful when you are compiling an operating system kernel or some other program that does not use the standard C library facilities, or the standard C library itself. 

There are a number of command-line options you can use to add additional directories to the search path. The most commonly-used option is `-Idir`, which causes *dir* to be searched after the current directory (for the quote form of the directive) and ahead of the standard system directories. You can specify multiple `-I` options on the command line, in which case the directories are searched in left-to-right order.

If you need separate control over the search paths for **the quote and angle-bracket forms** of the `‘#include`’ directive, you can use the `-iquote` and/or `-isystem` options instead of `-I.` See Invocation, for a detailed description of these options, as well as others that are less generally useful. 

### Include

[Include](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/cpp/Search-Path.html#Search-Path)


The ‘#include’ directive works by directing the C preprocessor to scan the specified file as input before continuing with the rest of the current file. The output from the preprocessor contains the output already generated, followed by the output resulting from the included file, followed by the output that comes from the text after the ‘#include’ directive. For example, if you have a header file header.h as follows,

        char *test (void);

and a main program called program.c that uses the header file, like this,

        int x;
        #include "header.h"

        int
        main (void)
        {
        puts (test ());
        }

the compiler will see the same token stream as it would if program.c read

        int x;
    *-> char *test (void);

        int
        main (void)
        {
        puts (test ());
        }

 Any fragment of a C program can be included from another file. The include file could even contain the beginning of a statement that is concluded in the containing file, or the end of a statement that was started in the including file. However, an included file must consist of complete tokens. Comments and string literals which have not been closed by the end of an included file are invalid. For error recovery, they are considered to end at the end of the file. 


## Pre-Processor 

[MSFT Preprocessor reference](https://docs.microsoft.com/en-us/cpp/preprocessor/c-cpp-preprocessor-reference?view=msvc-160)

[GCC Preprocessor Doc](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/gcc/Preprocessor-Options.html#Preprocessor-Options)

[C-Oreoricessir](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/cpp/)




### Pragmas:

[Pragma directives and the __pragma keyword | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/preprocessor/pragma-directives-and-the-pragma-keyword?view=vs-2017)

The Microsoft C and C++ compilers recognize the following pragmas:
Table 1



- alloc_text
- auto_inline
- bss_seg
- check_stack
- code_seg
- comment
- component
- conform 1
- const_seg
- data_seg
- deprecated
- detect_mismatch
- fenv_access
- float_control
- fp_contract
- function
- hdrstop
- include_alias
- init_seg 1
- inline_depth
- inline_recursion
- intrinsic
- loop 1
- make_public
- managed
- message
- omp
- once
- optimize
- pack
- pointers_to_members 1
- pop_macro
- push_macro
- region, endregion
- runtime_checks
- section
- setlocale
- strict_gs_check
- unmanaged
- vtordisp 1
- warning

### Compiler Pre-Defined Macros

[Predefined macros | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/preprocessor/predefined-macros?view=vs-2017)
Standard predefined macros


The compiler supports these predefined macros specified by the ISO C99 and ISO C++17 standards.

    __cplusplus Defined as an integer literal value when the translation unit is compiled as C++. Otherwise, undefined.

    __DATE__ The compilation date of the current source file. The date is a constant length string literal of the form Mmm dd yyyy. The month name Mmm is the same as the abbreviated month name generated by the C Runtime Library (CRT) asctime function. The first character of date dd is a space if the value is less than 10. This macro is always defined.

    __FILE__ The name of the current source file. __FILE__ expands to a character string literal. To ensure that the full path to the file is displayed, use /FC (Full Path of Source Code File in Diagnostics). This macro is always defined.

    __LINE__ Defined as the integer line number in the current source file. The value of the __LINE__ macro can be changed by using a #line directive. This macro is always defined.

    __STDC__ Defined as 1 only when compiled as C and if the /Za compiler option is specified. Otherwise, undefined.

    __STDC_HOSTED__ Defined as 1 if the implementation is a hosted implementation, one that supports the entire required standard library. Otherwise, defined as 0.

    __STDCPP_THREADS__ Defined as 1 if and only if a program can have more than one thread of execution, and compiled as C++. Otherwise, undefined.

    __TIME__ The time of translation of the preprocessed translation unit. The time is a character string literal of the form hh:mm:ss, the same as the time returned by the CRT asctime function. This macro is always defined.

(Microsoft-specific predefined macros)[https://docs.microsoft.com/en-us/cpp/preprocessor/predefined-macros?view=vs-2017#microsoft-specific-predefined-macros]


### C++ Std Lib Predefined Macros

[Gnu Doc on C++ Macros](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/libstdc++/manual/manual/using_macros.html)

Below are the macros which users may check for library version information.


!!!Note- I dont make an effort to really define these here.  See the link above.

`_GLIBCXX_RELEASE`

`__GLIBCXX__` 

`__GNUC__` 

`_GLIBCXX_USE_DEPRECATED`   Defined by default. Not configurable. ABI-changing.

`_GLIBCXX_USE_CXX11_ABI`    Defined to the value 1 by default. Configurable via `--disable-libstdcxx-dual-abi` and/or `--with-default-libstdcxx-abi`. ABI-changing.

`_GLIBCXX_CONCEPT_CHECKS`    Undefined by default. Configurable via `--enable-concept-checks`. 

`_GLIBCXX_ASSERTIONS`    Undefined by default

`_GLIBCXX_DEBUG`    Undefined by default. When defined, compiles user code using the debug mode. When defined, `_GLIBCXX_ASSERTIONS` is defined automatically, so all the assertions enabled by that macro are also enabled in debug mode. 

`_GLIBCXX_DEBUG_PEDANTIC` -     Undefined by default. When defined while compiling with the debug mode, makes the debug mode extremely picky by making the use of libstdc++ extensions and libstdc++-specific behavior into errors.

`_GLIBCXX_PARALLEL`    Undefined by default. When defined, compiles user code using the parallel mode. 

`_GLIBCXX_PARALLEL_ASSERTIONS`   Undefined by default, but when any parallel mode header is included this macro will be defined to a non-zero value if `_GLIBCXX_ASSERTIONS` has a non-zero value, otherwise to zero. When defined to a non-zero value, it enables extra error checking and assertions in the parallel mode. 

`_GLIBCXX_PROFILE `   Undefined by default. When defined, compiles user code using the profile mode. 

`__STDCPP_WANT_MATH_SPEC_FUNCS__`  Undefined by default. When defined to a non-zero integer constant, enables support for ISO/IEC 29124 Special Math Functions. 



### Preprocessor operators

[Preprocessor operators | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/preprocessor/preprocessor-operators?view=vs-2017)
 
[See also](https://docs.microsoft.com/en-us/cpp/preprocessor/preprocessor-operators?view=vs-2017#see-also)
 
 Four preprocessor-specific operators are used in the context of the `#define` directive The stringizing, charizing, and token-pasting operators are discussed in the next three sections. For information on the `defined` operator, see [The #if, #elif, #else, and #endif directives](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-if-hash-elif-hash-else-and-hash-endif-directives-c-cpp?view=vs-2017).
 
 
 `#` [Stringizing operator (#)](https://docs.microsoft.com/en-us/cpp/preprocessor/stringizing-operator-hash?view=vs-2017) 
  - Causes the corresponding actual argument to be enclosed in double quotation marks
 
 `#@` [Charizing operator (#@)](https://docs.microsoft.com/en-us/cpp/preprocessor/charizing-operator-hash-at?view=vs-2017)
 
  - Causes the corresponding argument to be enclosed in single quotation marks and to be treated as a character (Microsoft-specific)
 
 `##` [Token-pasting operator (##)](https://docs.microsoft.com/en-us/cpp/preprocessor/token-pasting-operator-hash-hash?view=vs-2017)
  - allows tokens used as actual arguments to be concatenated to form other tokens
 
 `defined` [defined operator](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-if-hash-elif-hash-else-and-hash-endif-directives-c-cpp?view=vs-2017)
 
 Simplifies the writing of compound expressions in certain macro directives

### Preprocessor directives

[Preprocessor directives | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/preprocessor/preprocessor-directives?view=vs-2017)

The preprocessor recognizes the following directives:


- #define 
[#define](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-define-directive-c-cpp?view=vs-2019) 

- #error
- #import
- #undef
- #elif
- #if
- #include
- #using
- #else
- #ifdef
- #line
- #endif
- #ifndef
- #pragma

[Preprocessor directives | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/preprocessor/preprocessor-directives?view=vs-2019)


[#error](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-error-directive-c-cpp?view=vs-2019) 
[#import](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-import-directive-cpp?view=vs-2019) 
[#undef](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-undef-directive-c-cpp?view=vs-2019) 
[#elif](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-if-hash-elif-hash-else-and-hash-endif-directives-c-cpp?view=vs-2019) 
[#if](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-if-hash-elif-hash-else-and-hash-endif-directives-c-cpp?view=vs-2019)
[#include](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-include-directive-c-cpp?view=vs-2019)
[#using](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-using-directive-cpp?view=vs-2019) 
[#else](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-if-hash-elif-hash-else-and-hash-endif-directives-c-cpp?view=vs-2019) 
[#ifdef](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-ifdef-and-hash-ifndef-directives-c-cpp?view=vs-2019) 
[#line](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-line-directive-c-cpp?view=vs-2019) 
[#endif](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-if-hash-elif-hash-else-and-hash-endif-directives-c-cpp?view=vs-2019)
[#ifndef](https://docs.microsoft.com/en-us/cpp/preprocessor/hash-ifdef-and-hash-ifndef-directives-c-cpp?view=vs-2019) 
[#pragma](https://docs.microsoft.com/en-us/cpp/preprocessor/pragma-directives-and-the-pragma-keyword?view=vs-2019)

### #if, #elif, #else, and #endif directives 

conditional :
    if-part elif-partsopt else-partopt endif-line

if-part :
    if-line text

if-line :
    #if constant-expression
    #ifdef identifier
    #ifndef identifier

elif-parts :
    elif-line text
    elif-parts elif-line text

elif-line :
    #elif constant-expression

else-part :
    else-line text

else-line :
    #else

endif-line :
    #endif
    
Each #if directive in a source file must be matched by a closing #endif directive. Any number of #elif directives can appear between the #if and #endif directives, but at most one #else directive is allowed. The #else directive, if present, must be the last directive before #endif.

The #if, #elif, #else, and #endif directives can nest in the text portions of other #if directives. Each nested #else, #elif, or #endif directive belongs to the closest preceding #if directive.

All conditional-compilation directives, such as #if and #ifdef, must match a closing #endif directive before the end of file. Otherwise, an error message is generated. When conditional-compilation directives are contained in include files, they must satisfy the same conditions: There must be no unmatched conditional-compilation directives at the end of the include file.

Macro replacement is done within the part of the line that follows an #elif command, so a macro call can be used in the constant-expression.


The preprocessor selects a single text item by evaluating the constant expression following each #if or #elif directive until it finds a true (nonzero) constant expression. It selects all text (including other preprocessor directives beginning with #) up to its associated #elif, #else, or #endif.

If all occurrences of constant-expression are false, or if no #elif directives appear, the preprocessor selects the text block after the #else clause. When there's no #else clause, and all instances of constant-expression in the #if block are false, no text block is selected.

The constant-expression is an integer constant expression with these additional restrictions:

    Expressions must have integral type and can include only integer constants, character constants, and the defined operator.

    The expression can't use sizeof or a type-cast operator.

    The target environment may be unable to represent all ranges of integers.

    The translation represents type int the same way as type long, and unsigned int the same way as unsigned long.

    The translator can translate character constants to a set of code values different from the set for the target environment. To determine the properties of the target environment, use an app built for that environment to check the values of the LIMITS.H macros.

    The expression must not query the environment, and must remain insulated from implementation details on the target computer.

___

## Standard Libraries


### Links

[GNU Std Lib Doc](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/libstdc++/manual/)


[Microsoft Doc](https://docs.microsoft.com/en-us/cpp/standard-library/cpp-standard-library-overview?view=msvc-160)


### Reference Lists
___

- [Language Support
   - *\<cstddef\>*
   - *\<cstdlib\>*
   - *\<version\>*
   - *\<limits\>*
   - *\<climits\>*
   - *\<cfloat\>*
   - *\<cstdint\>*
   - *\<new\>*
   - *\<typeinfo\>*
   - *\<source_location\>*
   - *\<exception\>*
   - *\<initializer_list\>*
   - *\<compare\>*
   - *\<coroutine\>*
   - *\<csignal\>*
   - *\<csetjmp\>*
   - *\<cstdarg\>*
- Concepts
   - *\<concepts\>*
- Diagnostics
   - *\<stdexcept\>*
   - *\<cassert\>*
   - *\<cerrno\>*
   - *\<system_error\>*
- General utilities
   - *\<utility\>*
   - *\<memory\>*
   - *\<memory_resource\>*
   - *\<scoped_allocator\>*
   - *\<bitset\>*
   - *\<tuple\>*
   - *\<optional\>*
   - *\<any\>*
   - *\<variant\>*
   - *\<type_traits\>*
   - *\<ratio\>*
   - *\<chrono\>*
   - *\<typeindex\>*
   - *\<functional\>*
   - *\<stacktrace\>*
   - *\<ctime\>*
- Strings
   - *\<string\>*
   - *\<string_view\>*
   - *\<cstring\>*
   - *\<charconv\>*
   - *\<format\>*
   - *\<cctype\>*
   - *\<cwctype\>*
   - *\<cwchar\>*
   - *\<cuchar\>*
- Localization
   - *\<locale\>*
   - *\<codecvt\>*
   - *\<clocale\>*
- Containers
   - *\<span\>*
   - *\<array\>*
   - *\<vector\>*
   - *\<deque\>*
   - *\<forward_list\>*
   - *\<list\>*
   - *\<map\>*
   - *\<set\>*
   - *\<queue\>*
   - *\<unordered_map\>*
   - *\<unordered_set\>*
   - *\<stack\>*
- Iterators
   - *\<iterator\>*
- Ranges
   - *\<ranges\>*
- Algorithms
   - *\<algorithm\>*
   - *\<execution\>*
- Numerics
   - *\<complex\>*
   - *\<random\>*
   - *\<valarray\>*
   - *\<numeric\>*
   - *\<bit\>*
   - *\<numbers\>*
   - *\<cfenv\>*
   - *\<cmath\>*
- Input/Output
   - *\<iosfwd\>*
   - *\<ios\>*
   - *\<iomanip\>*
   - *\<streambuf\>*
   - *\<istream\>*
   - *\<ostream\>*
   - *\<iostream\>*
   - *\<sstream\>*
   - *\<fstream\>*
   - *\<syncstream\>*
   - *\<cstdio\>*
   - *\<cinttypes\>*
   - *\<strstream\>*
- Regular expressions
   - *\<regex\>*
- Filesystem support
   - *\<filesystem\>*
- Thread support
   - *\<thread\>*
   - *\<atomic\>*
   - *\<mutex\>*
   - *\<shared_mutex\>*
   - *\<condition_variable\>*
   - *\<future\>*
   - *\<stop_token\>*
   - *\<semaphore\>*
   - *\<latch\>*
   - *\<barrier\>*
- C compatibility
   - *\<ciso646\>*
   - *\<cstdalign\>*
   - *\<cstdbool\>*
   - *\<ccomplex\>*
   - *\<ctgmath\>*
   - *\<stdatomic.h\>*

s
Atomics and threading library

		<atomic>
		    Atomic (header)
		
		<condition_variable>
		    Condition variable (header)
		
		<future>
		    Future (header)
		
		<mutex>
		    Mutex (header)
		
		<thread>
		    Thread (header)

 
____
### C++ Library



> ### Miscellaneous headers

> - _*[\<algorithm\>](http://www.cplusplus.com/reference/algorithm/)*_ - Standard Template Library: Algorithms (library )
> - _*[\<chrono\>](http://www.cplusplus.com/reference/chrono/)*_ - Time library (header)
> - _*[\<codecvt\>](http://www.cplusplus.com/reference/codecvt/)*_ - Unicode conversion facets (header)
> - _*[\<complex\>](http://www.cplusplus.com/reference/complex/)*_ - Complex numbers library (header)
> - _*[\<exception\>](http://www.cplusplus.com/reference/exception/)*_ - Standard exceptions (header)
> - _*[\<functional\>](http://www.cplusplus.com/reference/functional/)*_ - Function objects (header)
> - _*[\<initializer_list\>](http://www.cplusplus.com/reference/initializer_list/)*_ - Initializer list (header)
> - _*[\<iterator\>](http://www.cplusplus.com/reference/iterator/)*_ - Iterator definitions (header)
> - _*[\<limits\>](http://www.cplusplus.com/reference/limits/)*_ - Numeric limits (header)
> - _*[\<locale\>](http://www.cplusplus.com/reference/locale/)*_ - Localization library (header)
> - _*[\<memory\>](http://www.cplusplus.com/reference/memory/)*_ - Memory elements (header)
> - _*[\<new\>](http://www.cplusplus.com/reference/new/)*_ - Dynamic memory (header)
> - _*[\<numeric\>](http://www.cplusplus.com/reference/numeric/)*_ - Generalized numeric operations (header)
> - _*[\<random\>](http://www.cplusplus.com/reference/random/)*_ - Random (header)
> - _*[\<ratio\>](http://www.cplusplus.com/reference/ratio/)*_ - Ratio header (header)
> - _*[\<regex\>](http://www.cplusplus.com/reference/regex/)*_ - Regular Expressions (header)
> - _*[\<stdexcept\>](http://www.cplusplus.com/reference/stdexcept/)*_ - Exception classes (header)
> - _*[\<string\>](http://www.cplusplus.com/reference/string/)*_ - Strings (header)
> - _*[\<system_error\>](http://www.cplusplus.com/reference/system_error/)*_ - System errors (header)
> - _*[\<tuple\>](http://www.cplusplus.com/reference/tuple/)*_ - Tuple library (header)
> - _*[\<typeindex\>](http://www.cplusplus.com/reference/typeindex/)*_ - Type index (header)
> - _*[\<typeinfo\>](http://www.cplusplus.com/reference/typeinfo/)*_ - Type information (header)
> - _*[\<type_traits\>](http://www.cplusplus.com/reference/type_traits/)*_ - type_traits (header)
> - _*[\<utility\>](http://www.cplusplus.com/reference/utility/)*_ - Utility components (header)
> - _*[\<valarray\>](http://www.cplusplus.com/reference/valarray/)*_ - Library for arrays of numeric values (header)
> ### Atomics and threading library
> 
> - _*[\<atomic\>](http://www.cplusplus.com/reference/atomic/)*_ - Atomic (header)
> - _*[\<condition_variable\>](http://www.cplusplus.com/reference/condition_variable/)*_ - Condition variable (header)
> - _*[\<future\>](http://www.cplusplus.com/reference/future/)*_ - Future (header)
> - _*[\<mutex\>](http://www.cplusplus.com/reference/mutex/)*_ - Mutex (header)
> - _*[\<thread\>](http://www.cplusplus.com/reference/thread/)*_ - Thread (header)
> ### Containers
> 
> - _*[\<array\>](http://www.cplusplus.com/reference/array/)*_ - Array header (header)
> - _*[\<bitset\>](http://www.cplusplus.com/reference/bitset/)*_ - Bitset header (header)
> - _*[\<deque\>](http://www.cplusplus.com/reference/deque/)*_ - Deque header (header)
> - _*[\<forward_list\>](http://www.cplusplus.com/reference/forward_list/)*_ - Forward list (header)
> - _*[\<list\>](http://www.cplusplus.com/reference/list/)*_ - List header (header)
> - _*[\<map\>](http://www.cplusplus.com/reference/map/)*_ - Map header (header)
> - _*[\<queue\>](http://www.cplusplus.com/reference/queue/)*_ - Queue header (header)
> - _*[\<set\>](http://www.cplusplus.com/reference/set/)*_ - Set header (header)
> - _*[\<stack\>](http://www.cplusplus.com/reference/stack/)*_ - Stack header (header)
> - _*[\<unordered_map\>](http://www.cplusplus.com/reference/unordered_map/)*_ - Unordered map header (header)
> - _*[\<unordered_set\>](http://www.cplusplus.com/reference/unordered_set/)*_ - Unordered set header (header)
> 


### C Library
The C library is updated in C++ under the following names.  (Usually dropping the `.h` and prepending with `c`.)
The elements of the C language library are also included as a subset of the C++ Standard library. These cover many aspects, from general utility functions and macros to input/output functions and dynamic memory management functions:
> 
> - *\<cassert\>*- **(assert.h)** - *C Diagnostics Library (header)*
> - *\<cctype\>*- **(ctype.h)** - *Character handling functions (header)*
> - *\<cerrno\>*- **(errno.h)** - *C Errors (header)*
> - *\<cfenv\>*- **(fenv.h)** - *Floating-point environment (header)*
> - *\<cfloat\>*- **(float.h)** - *Characteristics of floating-point types (header)*
> - *\<cinttypes\>*- **(inttypes.h)** - *C integer types (header)*
> - *\<ciso646\>*- **(iso646.h)** - *ISO 646 Alternative operator spellings (header)*
> - *\<climits\>*- **(limits.h)** - *Sizes of integral types (header)*
> - *\<clocale\>*- **(locale.h)** - *C localization library (header)*
> - *\<cmath\>*- **(math.h)** - *C numerics library (header)*
> - *\<csetjmp\>*- **(setjmp.h)** - *Non local jumps (header)*
> - *\<csignal\>*- **(signal.h)** - *C library to handle signals (header)*
> - *\<cstdarg\>*- **(stdarg.h)** - *Variable arguments handling (header)*
> - *\<cstdbool\>*- **(stdbool.h)** - *Boolean type (header)*
> - *\<cstddef\>*- **(stddef.h)** - *C Standard definitions (header)*
> - *\<cstdint\>*- **(stdint.h)** - *Integer types (header)*
> - *\<cstdio\>*- **(stdio.h)** - *C library to perform Input/Output operations (header)*
> - *\<cstdlib\>*- **(stdlib.h)** - *C Standard General Utilities Library (header)*
> - *\<cstring\>*- **(string.h)** - *C Strings (header)*
> - *\<ctgmath\>*- **(tgmath.h)** - *Type-generic math (header)*
> - *\<ctime\>*- **(time.h)** - *C Time Library (header)*
> - *\<cuchar\>*- **(uchar.h)** - *Unicode characters (header)*
> - *\<cwchar\>*- **(wchar.h)** - *Wide characters (header)*
> - *\<cwctype\>*- **(wctype.h)** - *Wide character type (header)*


- *\<algorithm\>*- Standard Template Library: Algorithms (library )
- *\<chrono\>*- Time library (header)
- *\<codecvt\>*- Unicode conversion facets (header)
- *\<complex\>*- Complex numbers library (header)
- *\<exception\>*- Standard exceptions (header)
- *\<functional\>*- Function objects (header)
- *\<initializer_list\>*- Initializer list (header)
- *\<iterator\>*- Iterator definitions (header)
- *\<limits\>*- Numeric limits (header)
- *\<locale\>*- Localization library (header)
- *\<memory\>*- Memory elements (header)
- *\<new\>*- Dynamic memory (header)
- *\<numeric\>*- Generalized numeric operations (header)
- *\<random\>*- Random (header)
- *\<ratio\>*- Ratio header (header)
- *\<regex\>*- Regular Expressions (header)
- *\<stdexcept\>*- Exception classes (header)
- *\<string\>*- Strings (header)
- *\<system_error\>*- System errors (header)
- *\<tuple\>*- Tuple library (header)
- *\<typeindex\>*- Type index (header)
- *\<typeinfo\>*- Type information (header)
- *\<type_traits\>*- type_traits (header)
- *\<utility\>*- Utility components (header)
- *\<valarray\>*- Library for arrays of numeric values (header)

**Containers**
> 
> - *\<array\>* - **Array header**
> - *\<bitset\>* - **Bitset header**
> - *\<deque\>* - **Deque header**
> - *\<forward_list\>* - **Forward list**
> - *\<list\>* - **List header**
> - *\<map\>* - **Map header**
> - *\<queue\>* - **Queue header**
> - *\<set\>* - **Set header**
> - *\<stack\>* - **Stack header**
> - *\<unordered_map\>* - **Unordered map header**
> - *\<unordered_set\>* - **Unordered set header**
> - *\<vector\>* - **Vector header**

## Archetypical Program


```c++
// this is a format
#include <iostream>

/* Another comment format */

using namespace std;

int main(){
    cout << "Groovy Baby!" << "\n";
    
    return 0;
    }

int main()
{
    int x;        // This is a C++ style comment

    // Each comment line is preceded by slashes
    // This is another comment line

    /* C++ also supports C-Style comments */

    return 0;
}

```

header files no longer contain *.h

```c++
#include <cstdlib>    // was *\<stdlib.h\>*
#include <cstring>    // was *\<string.h\>*
                      // char* functions from C
#include <string>     // C++ string class
```



### Header Files

[Header files (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/header-files-cpp?view=msvc-160)


Because a header file might potentially be included by multiple files, it cannot contain definitions that might produce multiple definitions of the same name. The following are not allowed, or are considered very bad practice:

- built-in type definitions at namespace or global scope
- non-inline function definitions
- non-const variable definitions
- aggregate definitions
- unnamed namespaces
- using directives
#### Include Guards

Typically, header files have an include guard or a #pragma once directive to ensure that they are not inserted multiple times into a single .cpp file.


```C++ 
    // my_class.h
#ifndef MY_CLASS_H // include guard
#define MY_CLASS_H

namespace N
{
    class my_class
    {
    public:
        void do_something();
    };
}

#endif /* MY_CLASS_H */
```


## include
!!!Warning:  Note: If you are using the Microsoft Visual C++ IDE, you will notice that by default, all source files start as follows:
      `#include "stdafx.h"`
    In a VC++ project, by default, every source file should start with this line, and your own include files must follow this. If you place your own include file before `stdafx.h`, they will appear to have no effect and you will get all kinds of compilation errors. This situation involves the concept of precompiled header files, which is outside the scope of this book. Consult the Microsoft documentation on precompiled header files to learn the details.


### Modules 


In C++20, modules are introduced as an improved alternative to header files.

[Modules Link](https://docs.microsoft.com/en-us/cpp/cpp/modules-cpp?view=msvc-160)



## Namespaces


A **namespace** is a declarative region that provides a scope to the identifiers (the names of types, functions, variables, etc) inside it. 

Namespaces are used to organize code into logical groups and to prevent name collisions that can occur especially when your code base includes multiple libraries. All identifiers at namespace scope are visible to one another without qualification. 

This is similar to Java Packages, though less clearly defined.


Accessing other namespaces:

1) fully qualified name for each identifier,

    std::vector<std::string> vec;,

2)  With a [Using Declaration](https://docs.microsoft.com/en-us/cpp/cpp/using-declaration?view=msvc-160)




```c++

// using_declaration1.cpp
#include <stdio.h>
class B {
public:
   void f(char) {      printf_s("In B::f()\n");   }
   void g(char) {      printf_s("In B::g()\n");   }
};

class D : B {
public:
   using B::f;    // B::f(char) is now visible as D::f(char)
   using B::g;    // B::g(char) is now visible as D::g(char)
   void f(int) {      printf_s("In D::f()\n");      f('c'); }
        // Invokes B::f(char) instead of recursing

   void g(int) {
      printf_s("In D::g()\n");
g('c');     // Invokes B::g(char) instead of recursing
   }
};

int main() {
   D myD;
   myD.f(1);
   myD.g('a');
}

```

## Attributes: 

[[noreturn]] Specifies that a function never returns; in other words it always throws an exception. The compiler can adjust its compilation rules for [[noreturn]] entities.

[[carries_dependency]] Specifies that the function propagates data dependency ordering with respect to thread synchronization. The attribute can be applied to one or more parameters, to specify that the passed-in argument carries a dependency into the function body. The attribute can be applied to the function itself, to specify that the return value carries a dependency out of the function. The compiler can use this information to generate more efficient code.

[[deprecated]] Visual Studio 2015 and later: Specifies that a function is not intended to be used, and might not exist in future versions of a library interface. The compiler can use this to generate an informational message when client code attempts to call the function. Can be applied to declaration of a class, a typedef-name, a variable, a non-static data member, a function, a namespace, an enumeration, an enumerator, or a template specialization.

[[fallthrough]] Visual Studio 2017 and later: (available with /std:c++17) The [[fallthrough]] attribute can be used in the context of switch statements as a hint to the compiler (or anyone reading the code) that the fallthrough behavior is intended. The Microsoft C++ compiler currently does not warn on fallthrough behavior, so this attribute has no effect compiler behavior.

[[nodiscard]] Visual Studio 2017 version 15.3 and later: (available with /std:c++17) Specifies that a function's return value is not intended to be discarded. Raises warning C4834, as shown in this example:

```C++ 
    [[nodiscard]]
int foo(int i) { return i * i; }

int main()
{
    foo(42); //warning C4834: discarding return value of function with 'nodiscard' attribute
    return 0;
}
```



[[maybe_unused]] Visual Studio 2017 version 15.3 and later: (available with /std:c++17) Specifies that a variable, function, class, typedef, non-static data member, enum, or template specialization may intentionally not be used. The compiler does not warn when an entity marked [[maybe_unused]] is not used. An entity that is declared without the attribute can later be redeclared with the attribute and vice versa. An entity is considered marked after its first declaration that is marked is analyzed, and for the remainder of translation of the current translation unit.## C++ Operators

### Operator Precedence

[C++ built-in operators, precedence, and associativity | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/cpp-built-in-operators-precedence-and-associativity?view=msvc-160)

- Group 1 precedence, no associativity 		
    - `::` - Scope resolution  -
- Group 2 precedence, left to right associativity 		
    - `. or ->` - Member selection (object or pointer)  -
    - `[]` - Array subscript  -
    - `()` - Function call  -
    - `++` - Postfix increment  -
    - `--` - Postfix decrement  -
    - `typeid` - Type name  -
    - `const_cast` - Constant type conversion  -
    - `dynamic_cast` - Dynamic type conversion  -
    - `reinterpret_cast` - Reinterpreted type conversion  -
    - `static_cast` - Static type conversion  -
- Group 3 precedence, right to left associativity 		
    - `sizeof` - Size of object or type  -
    - `++` - Prefix increment  -
    - `--` - Prefix decrement  -
    - `~` -[l] - One's complement  -
    - `!` -[t] - Logical not  -
    - `-` - Unary negation  -
    - `+` - Unary plus  -
    - `&` - Address-of  -
    - `*` - Indirection  -
    - `new` - Create object  -
    - `delete` - Destroy object  -
    - `()` - Cast  -
- Group 4 precedence, left to right associativity 		
    - `.* or ->*` - Pointer-to-member (objects or pointers)  -
- Group 5 precedence, left to right associativity 		
    - `*` - Multiplication  -
    - `/` - Division  -
    - `%` - Modulus  -
- Group 6 precedence, left to right associativity 		
    - `+` - Addition  -
    - `-` - Subtraction  -
- Group 7 precedence, left to right associativity 		
    - `<<` - Left shift  -
    - `>>` - Right shift  -
- Group 8 precedence, left to right associativity 		
    - `<` - Less than  -
    - `>` - Greater than  -
    - `<=` - Less than or equal to  -
    - `>=` - Greater than or equal to  -
- Group 9 precedence, left to right associativity 		
    - `==` - Equality  -
    - `!=` -[q] - Inequality  -
- Group 10 precedence left to right associativity 		
    - `&` -[d] - Bitwise AND  -
- Group 11 precedence, left to right associativity 		
    - `^` -[r] - Bitwise exclusive OR  -
- Group 12 precedence, left to right associativity 		
    - `|` -[r] - Bitwise inclusive OR  -
- Group 13 precedence, left to right associativity 		
    - `&&` -[d] - Logical AND  -
- Group 14 precedence, left to right associativity 		
    - `||` -[r] - Logical OR  -
- Group 15 precedence, right to left associativity 		
    - `? :` - Conditional  -
    - `=` - Assignment  -
    - `*=` - Multiplication assignment  -
    - `/=` - Division assignment  -
    - `%=` - Modulus assignment  -
    - `+=` - Addition assignment  -
    - `-=` - Subtraction assignment  -
    - `<<=` - Left-shift assignment  -
    - `>>=` - Right-shift assignment  -
    - `&=` -[q] - Bitwise AND assignment  -
    - `|=` -[q] - Bitwise inclusive OR assignment  -
    - `^=` -[q] - Bitwise exclusive OR assignment  -
    - `throw` - throw expression  -
- Group 16 precedence, left to right associativity 		
    - `,` - Comma  -

You can also just use keywords instead of chars to make more readable program

| Operator    | Operator Keyword | Description                     |
| ----------- | ---------------- | ------------------------------- |
| Logical    |                  |                                 |
| &&          | and              | logical AND                     |
| \|\|        | or               | logical OR                      |
| !           | not              | logical NOT                     |
| Inequality |                  |                                 |
| !=          | not_eq           | inequality                      |
| Bitwise    |                  |                                 |
| &           | bitand           | bitwise AND                     |
| \|          | bitor            | bitwise OR                      |
| ^           | xor              | bitwise exclusive OR            |
| ~           | compl            | bitwise complement              |
| Bitwise Op  |                  |                                 |
| &=          | and_eq           | bitwise AND assignment          |
| \|=         | or_eq            | bitwise inclusive OR assignment |
| ^=          | xor_eq           | bitwise exclusive OR assignment |


```c++
// Program to demonstrate "and" operator keyword
//
// Some compilers require inclusion of special header files

#include    <iostream>
#include    <iso646.h>        // Required for Visual C++ 6.0
using namespace std;

int main()
{
    int x = 8;
    int y;

    cout << "Enter an integer: ";
    cin >> y;

    if ( (x > 0) && (y > 0) )   cout << "Both greater than 0 \n";

    if ( (x > 0) and (y > 0 ) ) cout << "Same thing \n";

    return 0;
}
```

### ISO 646 Alternative operator spellings

`<ciso646>` (iso646.h)

This header defines eleven macro constants with alternative spellings for those C++ operators not supported by the ISO646 standard character set:

- **macro** :  - `operator`
- **and** :  - `&&`
- **and_eq** :  - `&=`
- **bitand** :  - `&`
- **bitor** :  - `|`
- **compl** :  - `~`
- **not** :  - `!`
- **not_eq** :  - `!=`
- **or** :  - `||`
- **or_eq** :  - `|=`
- **xor** :  - `^`
- **xor_eq** :  - `^=`

In C++, reserved words exist with the same names as these macros and are treated as aliases of their respective operator. Therefore the inclusion of this header has no effect in C++, and is not necessary in order to use the alternative names.


### Random Number Generator

[Random](https://en.cppreference.com/w/cpp/numeric/random)



```C++
#include <random>

std::random_device rd;  //Will be used to obtain a seed for the random number engine
std::mt19937 gen(rd()); //Standard mersenne_twister_engine seeded with rd()
std::uniform_int_distribution<> distrib(1, 6);

for (int n=0; n<10; ++n)
//Use `distrib` to transform the random unsigned int generated by gen into an int in [1, 6]
    std::cout << distrib(gen) << ' ';
std::cout << '\n';

```

#### Rand


```C++
    std::srand(std::time(nullptr)); // use current time as seed for random generator
    int random_variable = std::rand();
    std::cout << "Random value on [0 " << RAND_MAX << "]: " 
              << random_variable << '\n';
 
    // roll 6-sided dice 20 times
    for (int n=0; n != 20; ++n) {
        int x = 7;
        while(x > 6) 
            x = 1 + std::rand()/((RAND_MAX + 1u)/6);  // Note: 1+rand()%6 is biased
        std::cout << x << ' ';
**```**

### Operator Precedence

[Operator Pref](http://en.cppreference.com/w/cpp/language/operator_precedence)


### C numerics library

[<cmath> (math.h) - C++ Reference](https://www.cplusplus.com/reference/cmath/)

<cmath> (math.h)
Header <cmath> declares a set of functions to compute common mathematical operations and transformations:

Functions

Trigonometric functions

- `cos` - Compute cosine (function )
- `sin` - Compute sine (function )
- `tan` - Compute tangent (function )
- `acos` - Compute arc cosine (function )
- `asin` - Compute arc sine (function )
- `atan` - Compute arc tangent (function )
- `atan2` - Compute arc tangent with two parameters (function )

Hyperbolic functions

- `cosh` - Compute hyperbolic cosine (function )
- `sinh` - Compute hyperbolic sine (function )
- `tanh` - Compute hyperbolic tangent (function )
- `acosh` - Compute area hyperbolic cosine (function )
- `asinh` - Compute area hyperbolic sine (function )
- `atanh` - Compute area hyperbolic tangent (function )

Exponential and logarithmic functions

- `exp` - Compute exponential function (function )
- `frexp` - Get significand and exponent (function )
- `ldexp` - Generate value from significand and exponent (function )
- `log` - Compute natural logarithm (function )
- `log10` - Compute common logarithm (function )
- `modf` - Break into fractional and integral parts (function )
- `exp2` - Compute binary exponential function (function )
- `expm1` - Compute exponential minus one (function )
- `ilogb` - Integer binary logarithm (function )
- `log1p` - Compute logarithm plus one (function )
- `log2` - Compute binary logarithm (function )
- `logb` - Compute floating-point base logarithm (function )
- `scalbn` - Scale significand using floating-point base exponent (function )
- `scalbln` - Scale significand using floating-point base exponent (long) (function )

Power functions

- `pow` - Raise to power (function )
- `sqrt` - Compute square root (function )
- `cbrt` - Compute cubic root (function )
- `hypot` - Compute hypotenuse (function )

Error and gamma functions

- `erf` - Compute error function (function )
- `erfc` - Compute complementary error function (function )
- `tgamma` - Compute gamma function (function )
- `lgamma` - Compute log-gamma function (function )

Rounding and remainder functions

- `ceil` - Round up value (function )
- `floor` - Round down value (function )
- `fmod` - Compute remainder of division (function )
- `trunc` - Truncate value (function )
- `round` - Round to nearest (function )
- `lround` - Round to nearest and cast to long integer (function )
- `llround` - Round to nearest and cast to long long integer (function )
- `rint` - Round to integral value (function )
- `lrint` - Round and cast to long integer (function )
- `llrint` - Round and cast to long long integer (function )
- `nearbyint` - Round to nearby integral value (function )
- `remainder` - Compute remainder (IEC 60559) (function )
- `remquo` - Compute remainder and quotient (function )

Floating-point manipulation functions

- `copysign` - Copy sign (function )
- `nan` - Generate quiet NaN (function )
- `nextafter` - Next representable value (function )
- `nexttoward` - Next representable value toward precise value (function )

Minimum, maximum, difference functions

- `fdim` - Positive difference (function )
- `fmax` - Maximum value (function )
- `fmin` - Minimum value (function )

Other functions

- `fabs` - Compute absolute value (function )
- `abs` - Compute absolute value (function )
- `fma` - Multiply-add (function )

Macros / Functions
These are implemented as macros in C and as functions in C++:
Classification macro / functions

- `fpclassify` - Classify floating-point value (macro/function )
- `isfinite` - Is finite value (macro )
- `isinf` - Is infinity (macro/function )
- `isnan` - Is Not-A-Number (macro/function )
- `isnormal` - Is normal (macro/function )
- `signbit` - Sign bit (macro/function )

Comparison macro / functions

- `isgreater` - Is greater (macro )
- `isgreaterequal` - Is greater or equal (macro )
- `isless` - Is less (macro )
- `islessequal` - Is less or equal (macro )
- `islessgreater` - Is less or greater (macro )
- `isunordered` - Is unordered (macro )

Macro constants

- `math_errhandling` - Error handling (macro )
- `INFINITY` - Infinity (constant )
- `NAN` - Not-A-Number (constant )
- `HUGE_VAL` - Huge value (constant )
- `HUGE_VALF` - Huge float value
- `HUGE_VALL` - Huge long double value (constant )

This header also defines the following macro constants (since C99/C++11):
macro	type	description
`MATH_ERRNO`
`MATH_ERREXCEPT`	int	Bitmask value with the possible values math_errhandling can take.
`FP_FAST_FMA`
`FP_FAST_FMAF`: **int** - Each, if defined, identifies for which type fma is at least as efficient as x*y+z.
`FP_INFINITE`
`FP_NAN`
`FP_NORMAL`
`FP_SUBNORMAL`: **int** - The possible values returned by fpclassify.
`FP_ILOGB0`: **int** - Special values the ilogb function may return.

Types

- `double_t` - Floating-point type (type )
- `float_t` - Floating-point type (type )


## Stdin and Std Out

`<<` insertion operator 
`>>` extraction operator

These can be chained.

C++ uses the standard input stream cin and the standard output stream cout

`#include <cstdlib>`
`#include <iostream>`


An example of stdin and out vs. C.

```c++
#include    <iostream>    // Header file defining standard C++ I/O 
#include    <stdio.h>        // Old C language header now deprecated
using namespace std;
int main()
{
    int x = 0;

    /* The old C way */

    printf( "Please enter an integer: " );
    scanf( "%d", &x );
    printf( "You entered %d \n", x );

    // The C++ way

    cout << "Please enter an integer: ";
    cin >> x;
    cout << "You entered " << x << endl;
    cout << "x plus 2 is ";
    cout << x + 2 << endl;
    
    return 0;
}
```

```c++
// Program Input:    10    20
//        30
//
// Program Output:    You entered: 10 20 30

#include    <iostream>
using namespace std;
int main()
{
    int x, y, z;

    cout << "enter 3 integers: ";
    cin >> x >> y >> z;        // whitespace delimits numeric input objects

    cout << "You entered: " << x << " " << y << " " << z << endl;

    return 0;
}
```

### Stream Manipulators

`#include <iomanip>`

Stream manipulators may be parameterized or non-parameterized
Must include the header file iomanip to use parameterized manipulators

showpoint
noshowpoint
setw(n)
boolalpha
setprecision(3) 
scientific
fixed


```c++
#include    <iostream>
#include    <iomanip>        // Required for parameterized manipulators
#define    dbln    "\n\n"    // Symbolic constant prints 2 newlines

using    namespace    std;

int main()
{
    float v = 2.19512567f;
    float c = 4.f;
    
    cout << v << endl;
    cout << c << dbln;

    cout << showpoint << v << endl;    // showpoint forces dec & 0's
    cout << c << dbln;

    cout << noshowpoint << c << dbln;    // reinstate default

    cout << setw(10) << v << endl;    // set field width to 10
    cout << c << dbln;

    return 0;
}

// Program to illustrate stream manipulators
//
// Program Output:    2.19513
//        4
//
//        2.19513
//        4.00000
//
//        4
//
//           2.19513
//        4



#include    <iostream>
#include    <iomanip>
#define    dbln    "\n\n"
using    namespace    std;

int main()
{
    bool    b = true;
    float    f = 3.14159f;

    cout << b << endl;
    cout << boolalpha << b << dbln;

    cout << f << endl;
    cout << scientific << setprecision(3) << f << endl;
    cout << fixed << f << dbln;

    return 0;
}

// Program to demonstrate stream manipulators
//
// Program Output:    1
//        true
//
//        3.14159
//        3.142e+000
//        3.142
```

## Types

<!-- ToDo- need to understand this better -->

### LValues and Rvalues

[Value Categories: Lvalues and Rvalues (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/lvalues-and-rvalues-visual-cpp?view=msvc-160)

> -   A _glvalue_ is an expression whose evaluation determines the identity of an object, bit-field, or function.
> -   A _prvalue_ is an expression whose evaluation initializes an object or a bit-field, or computes the value of the operand of an operator, as specified by the context in which it appears.
> -   An _xvalue_ is a glvalue that denotes an object or bit-field whose resources can be reused (usually because it is near the end of its lifetime). Example: Certain kinds of expressions involving rvalue references (8.3.2) yield xvalues, such as a call to a function whose return type is an rvalue reference or a cast to an rvalue reference type.
> -   An _lvalue_ is a glvalue that is not an xvalue.
> -   An _rvalue_ is a prvalue or an xvalue.

[Value Categories: Lvalues and Rvalues (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/lvalues-and-rvalues-visual-cpp?view=msvc-160)

![](https://docs.microsoft.com/en-us/cpp/cpp/media/value_categories.png?view=msvc-160)

### C Standard definitions

`<cstddef>` (stddef.h)
This header defines several types implicitly generated or used by certain language expressions.

Types

ptrdiff_t
    Result of pointer subtraction (type )

size_t
    Unsigned integral type (type )

max_align_t
    Type with widest scalar alignment (type )

nullptr_t
    Null pointer type (C++) (type )


In C, this header also includes the declaration of the wchar_t type (wide character type), which in C++ is a language keyword that identifies a distinct fundamental type (no header inclusion required in C++).

Macro functions

offsetof
    Return member offset (macro )


Macro constants

NULL
    Null pointer (macro )



### Variable arguments handling

`<cstdarg>` (stdarg.h)

This header defines macros to access the individual arguments of a list of unnamed arguments whose number and types are not known to the called function.

A function may accept a varying number of additional arguments without corresponding parameter declarations by including a comma and three dots (,...) after its regular named parameters:

return_type function_name ( parameter_declarations , ... );
To access these additional arguments the macros va_start, va_arg and va_end, declared in this header, can be used:

    First, va_start initializes the list of variable arguments as a va_list.
    Subsequent executions of va_arg yield the values of the additional arguments in the same order as passed to the function.
    Finally, va_end shall be executed before the function returns.


Types

- `va_list`- Type to hold information about variable arguments (type )


Macro functions

- `va_start`- Initialize a variable argument list (macro )
- `va_arg`- Retrieve next argument (macro )
- `va_end`- End using variable argument list (macro )
- `va_copy`- Copy variable argument list (macro )



![](https://docs.microsoft.com/en-us/cpp/cpp/media/built-intypesizes.png?view=msvc-160)

[Built-in types (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/fundamental-types-cpp?view=msvc-160)

[Data Type Ranges | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/data-type-ranges?view=msvc-160)

short - 2bytes -32,000-32000
unsigned short - 64000
int - could be 2 or 4 bytes (short or long)
long 4 bytes 2^32
float
double
long doubles
chars `' '` (Single quotes)
string `" "` (Double quotes)
bool 

`[<cstdint>` (stdint.h) - C++ Reference](https://www.cplusplus.com/reference/cstdint/)

/todo edit
```
signed type	unsigned type	description
intmax_t	uintmax_t	Integer type with the maximum width supported.
int8_t	uint8_t	Integer type with a width of exactly 8, 16, 32, or 64 bits.
For signed types, negative values are represented using 2's complement.
No padding bits.
Optional: These typedefs are not defined if no types with such characteristics exist.*
int16_t	uint16_t
int32_t	uint32_t
int64_t	uint64_t
int_least8_t	uint_least8_t	Integer type with a minimum of 8, 16, 32, or 64 bits.
No other integer type exists with lesser size and at least the specified width.
int_least16_t	uint_least16_t
int_least32_t	uint_least32_t
int_least64_t	uint_least64_t
int_fast8_t	uint_fast8_t	Integer type with a minimum of 8, 16, 32, or 64 bits.
At least as fast as any other integer type with at least the specified width.
int_fast16_t	uint_fast16_t
int_fast32_t	uint_fast32_t
int_fast64_t	uint_fast64_t
intptr_t	uintptr_t	Integer type capable of holding a value converted from a void pointer and then be converted back to that type with a value that compares equal to the original pointer.
Optional: These typedefs may not be defined in some library implementations.*


header
<cstdint> (stdint.h)
Integer types
This header defines a set of integral type aliases with specific width requirements, along with macros specifying their limits and macro functions to create values of these types.

Types
The following are typedefs of fundamental integral types or extended integral types.

signed type	unsigned type	description
intmax_t	uintmax_t	Integer type with the maximum width supported.
int8_t	uint8_t	Integer type with a width of exactly 8, 16, 32, or 64 bits.
For signed types, negative values are represented using 2's complement.
No padding bits.
Optional: These typedefs are not defined if no types with such characteristics exist.*
int16_t	uint16_t
int32_t	uint32_t
int64_t	uint64_t
int_least8_t	uint_least8_t	Integer type with a minimum of 8, 16, 32, or 64 bits.
No other integer type exists with lesser size and at least the specified width.
int_least16_t	uint_least16_t
int_least32_t	uint_least32_t
int_least64_t	uint_least64_t
int_fast8_t	uint_fast8_t	Integer type with a minimum of 8, 16, 32, or 64 bits.
At least as fast as any other integer type with at least the specified width.
int_fast16_t	uint_fast16_t
int_fast32_t	uint_fast32_t
int_fast64_t	uint_fast64_t
intptr_t	uintptr_t	Integer type capable of holding a value converted from a void pointer and then be converted back to that type with a value that compares equal to the original pointer.
Optional: These typedefs may not be defined in some library implementations.*

Some of these typedefs may denote the same types. Therefore, function overloads should not rely on these being different.

* Notice that some types are optional (and thus, with no portability guarantees). A particular library implementation may also define additional types with other widths supported by its system. In any case, if either the signed or the unsigned version is defined, both the signed and unsigned versions are defined.

Macros

Limits of cstdint types
Macro	description	defined as
INTMAX_MIN	Minimum value of intmax_t	-(263-1), or lower
INTMAX_MAX	Maximum value of intmax_t	263-1, or higher
UINTMAX_MAX	Maximum value of uintmax_t	264-1, or higher
INTN_MIN	Minimum value of exact-width signed type	Exactly -2(N-1)
INTN_MAX	Maximum value of exact-width signed type	Exactly 2(N-1)-1
UINTN_MAX	Maximum value of exact-width unsigned type	Exactly 2N-1
INT_LEASTN_MIN	Minimum value of minimum-width signed type	-(2(N-1)-1), or lower
INT_LEASTN_MAX	Maximum value of minimum-width signed type	2(N-1)-1, or higher
UINT_LEASTN_MAX	Maximum value of minimum-width unsigned type	2N-1, or higher
INT_FASTN_MIN	Minimum value of fastest minimum-width signed type	-(2(N-1)-1), or lower
INT_FASTN_MAX	Maximum value of fastest minimum-width signed type	2(N-1)-1, or higher
UINT_FASTN_MAX	Maximum value of fastest minimum-width unsigned type	2N-1, or higher
INTPTR_MIN	Minimum value of intptr_t	-(215-1), or lower
INTPTR_MAX	Maximum value of intptr_t	215-1, or higher
UINTPTR_MAX	Maximum value of uintptr_t	216-1, or higher
Where N is one in 8, 16, 32, 64, or any other type width supported by the library.

Only the macros corresponding to types supported by the library are defined.

Limits of other types
Limits of other standard integral types:
Macro	description	defined as
SIZE_MAX	Maximum value of size_t	264-1, or higher
PTRDIFF_MIN	Minimum value of ptrdiff_t	-(216-1), or lower
PTRDIFF_MAX	Maximum value of ptrdiff_t	216-1, or higher
SIG_ATOMIC_MIN	Minimum value of sig_atomic_t	if sig_atomic_t is signed: -127, or lower
if sig_atomic_t is unsigned: 0
SIG_ATOMIC_MAX	Maximum value of sig_atomic_t	if sig_atomic_t is signed: 127, or higher
if sig_atomic_t is unsigned: 255, or higher
WCHAR_MIN	Minimum value of wchar_t	if wchar_t is signed: -127, or lower
if wchar_t is unsigned: 0
WCHAR_MAX	Maximum value of wchar_t	if wchar_t is signed: 127, or higher
if wchar_t is unsigned: 255, or higher
WINT_MIN	Minimum value of wint_t	if wint_t is signed: -32767, or lower
if wint_t is unsigned: 0
WINT_MAX	Maximum value of wint_t	if wint_t is signed: 32767, or higher
if wint_t is unsigned: 65535, or higher

Function-like macros
These function-like macros expand to integer constants suitable to initialize objects of the types above:
Macro	description
INTMAX_C	expands to a value of type intmax_t
UINTMAX_C	expands to a value of type uintmax_t
INTN_C	expands to a value of type int_leastN_t
UINTN_C	expands to a value of type uint_leastN_t

For example:

 

	

INTMAX_C(2012)  // expands to 2012LL or similar 
```

**character** - `char` - Used to hold a single character of information.  Always requires a single byte of storage.

**integer** - `int` - Used to hold a signed whole number quantity.

**short integer** - `short` - Used to hold a signed whole number quantity.  Typically only requires half the storage requirements of a signed integer.

**long integer** - `long` - Used to hold a signed whole number quantity.  Typically requires twice as much storage as a normal signed integer.

**unsigned integer** - `unsigned` - Used to hold non-negative whole number quantities.

**floating point** - `float` - Used to hold signed numbers with fractional components.


**double precision** - `double` - Used to hold signed numbers with fractional components.  Typically requires twice the storage as a float.


**extended precision** - `long double` - Extended precision for floating point types.  Implemented as part of ISO/ANSI standard.

**boolean** - `bool` - Used to hold literal values true and false.

**constant** - `const` - Used to hold a constant value that cannot be changed during program execution.



**long long integer** - `long long` - Range is at least the same as long, but varies with compiler.

**unsigned long long integer** - `unsigned long long` - Extended range unsigned integer.

**16-bit character** - `char16_t` - A single 16-bit character.


**32-bit character** - `char32_t` - A single 32-bit character.


**automatic** - `auto` - The compiler will decide the type automatically.


**decltype** - `decltype( expr )` - The compiler determines the type of the expression expr. Useful for use with templates.


bool types can be used to create state variables that indicate truth or falsity
bool variables can be assigned the literal values true and false
The default value of a bool type is false




### Typedefs

[Typedef Doc](https://docs.microsoft.com/en-us/cpp/cpp/aliases-and-typedefs-cpp?view=msvc-160)

A typedef declaration introduces a name that, within its scope, becomes a synonym for the type given by the type-declaration portion of the declaration.

You can use typedef declarations to construct shorter or more meaningful names for types already defined by the language or for types that you have declared. Typedef names allow you to encapsulate implementation details that may change.

___
### Type Aliases 

You can use an alias declaration to declare a name to use as a synonym for a previously declared type.    An alias does not introduce a new type and cannot change the meaning of an existing type name.

[See here](https://docs.microsoft.com/en-us/cpp/cpp/aliases-and-typedefs-cpp?view=msvc-160)

        using identifier = type;

Very sumilar to TypeDef:

```c++
// C++11
using counter = long;

// C++03 equivalent:
// typedef long counter;

//Something more useful would be a type alias like this one for std::ios_base::fmtflags:
```

Aliases also work with function pointers, but are much more readable than the equivalent typedef:

```C++

// C++11
using func = void(*)(int);

// C++03 equivalent:
// typedef void (*func)(int);

// func can be assigned to a function pointer value
void actual_function(int arg) { /* some code */ }
func fptr = &actual_function;
```

A limitation of the typedef mechanism is that it doesn't work with templates. However, the type alias syntax in C++11 enables the creation of alias templates:

```C++

template<typename T> using ptr = T*;

// the name 'ptr<T>' is now an alias for pointer to T
ptr<int> ptr_int;
```
___
### Type Inference & Alternative Function Syntax 

C++ 11

Compiler deduces type at compile time

`auto` keyword.

```c++
auto x = 99;         

auto value = myFunc();


// Alternative Function Syntax … most useful when using
// templates


//function myfunc takes an int and returns an int, using below.  

//is this a lambda
auto myFunc( int x ) -> int
{
    return 2*x;
}


// Ask the compiler to figure out return type … most useful
// when using templates

auto myFunc( float v1, float v2 )
{
    return v1 * v2;
}

```
?{6,:{CLIPBOARD}}

### typeid()


[typeid Operator | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/typeid-operator?view=msvc-160)

> The **`typeid`** operator allows the type of an object to be determined at run time.
> 
> The result of **`typeid`** is a `const type_info&`. The value is a reference to a `type_info` object that represents either the _type-id_ or the type of the _expression_, depending on which form of **`typeid`** is used. For more information, see [type\_info Class](https://docs.microsoft.com/en-us/cpp/cpp/type-info-class?view=msvc-160).
___
### Conversion

<!-- Todo  -->
[Standard conversions | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/standard-conversions?view=msvc-160)

The cast operator `()` are lower precedence than the `static_cast`, `dynamic_cast` etc types, (2 vs 3.)


#### Cast Operator 


[Cast Operator: () | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/cast-operator-parens?view=msvc-160)

> Cast Operator: ()


unary-expression ( type-name ) cast-expression

A type cast provides a method for explicit conversion of the type of an object in a specific situation.


Any unary expression is considered a cast expression.

The compiler treats cast-expression as type type-name after a type cast has been made. Casts can be used to convert objects of any scalar type to or from any other scalar type. Explicit type casts are constrained by the same rules that determine the effects of implicit conversions. Additional restraints on casts may result from the actual sizes or representation of specific types.



```cpp
// expre_CastOperator.cpp
// compile with: /EHsc
// Demonstrate cast operator
#include <iostream>

using namespace std;

int main()
{
    double x = 3.1;
    int i;
    cout << "x = " << x << endl;
    i = (int)x;   // assign i the integer part of x
    cout << "i = " << i << endl;
}
```



#### User Defined Casts


```cpp
int main()
{
    const char *kStr = "Excitinggg";
    CountedAnsiString myStr(kStr, 8);

    const char *pRaw = myStr.GetRawBytes();
    printf_s("RawBytes truncated to 10 chars:   %.10s\n", pRaw);

    const char *pCast = myStr; // or (const char *)myStr;
    printf_s("Casted Bytes:   %s\n", pCast);

    puts("Note that the cast changed the raw internal string");
    printf_s("Raw Bytes after cast:   %s\n", pRaw);
}
```



### [Casting Operators | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/casting-operators?view=msvc-160)



> There are several casting operators specific to the C++ language. These operators are intended to remove some of the ambiguity and danger inherent in old style C language casts. These operators are:
> 
> -   [dynamic\_cast](https://docs.microsoft.com/en-us/cpp/cpp/dynamic-cast-operator?view=msvc-160) Used for conversion of polymorphic types.
>     
>> This type of conversion is called an "upcast" because it moves a pointer up a class hierarchy, from a derived class to a class it is derived from. An upcast is an implicit conversion.
>> 
>> If `type-id` is void\*, a run-time check is made to determine the actual type of `expression`. The result is a pointer to the complete object pointed to by `expression`. F
>
> -   [static\_cast](https://docs.microsoft.com/en-us/cpp/cpp/static-cast-operator?view=msvc-160) Used for conversion of nonpolymorphic types.

>> The **`static_cast`** operator can be used for operations such as converting a pointer to a base class to a pointer to a derived class. Such conversions are not always safe.
>> 
>> In general you use **`static_cast`** when you want to convert numeric data types such as enums to ints or ints to floats, and you are certain of the data types involved in the conversion. 


>     
> -   [const\_cast](https://docs.microsoft.com/en-us/cpp/cpp/const-cast-operator?view=msvc-160) Used to remove the **`const`**, **`volatile`**, and **`__unaligned`** attributes.
>     
> -   [reinterpret\_cast](https://docs.microsoft.com/en-us/cpp/cpp/reinterpret-cast-operator?view=msvc-160) Used for simple reinterpretation of bits.
>     
> -   [safe\_cast](https://docs.microsoft.com/en-us/cpp/extensions/safe-cast-cpp-component-extensions?view=msvc-160) Used in C++/CLI to produce verifiable MSIL.
>     
> 
> Use **`const_cast`** and **`reinterpret_cast`** as a last resort, since these operators present the same dangers as old style casts. However, they are still necessary in order to completely replace old style casts.

#### Static Casting vs. Dynamic Casting


[Source: static_cast Operator | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/static-cast-operator?view=msvc-160)

>The **`static_cast`** operator can be used for operations such as converting a pointer to a base class to a pointer to a derived class. Such conversions are not always safe.
> 
> In general you use **`static_cast`** when you want to convert numeric data types such as enums to ints or ints to floats, and you are certain of the data types involved in the conversion. 

>**`static_cast`** conversions are not as safe as **`dynamic_cast`** conversions, because **`static_cast`** does no run-time type check, while **`dynamic_cast`** does.

> A **`dynamic_cast`** to an ambiguous pointer will fail, while a **`static_cast`** returns as if nothing were wrong; this can be dangerous.

 Although **`dynamic_cast`** conversions are safer, **`dynamic_cast`** only works on _pointers or references,_ and the run-time type check is an overhead. For more information, see [dynamic\_cast Operator](https://docs.microsoft.com/en-us/cpp/cpp/dynamic-cast-operator?view=msvc-160).
> 
> In the example that follows, the line `D* pd2 = static_cast<D*>(pb);` is not safe because `D` can have fields and methods that are not in `B`. However, the line `B* pb2 = static_cast<B*>(pd);` is a safe conversion because `D` always contains all of `B`.



```cpp
// static_cast_Operator.cpp
// compile with: /LD
class B {};

class D : public B {};

void f(B* pb, D* pd) {
   D* pd2 = static_cast<D*>(pb);   // Not safe, D can have fields
                                   // and methods that are not in B.

   B* pb2 = static_cast<B*>(pd);   // Safe conversion, D always
                                   // contains all of B.
}
```

[static_cast Operator | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/static-cast-operator?view=msvc-160)

> The **`dynamic_cast`** and **`static_cast`** operators move a pointer throughout a class hierarchy. However, **`static_cast`** relies exclusively on the information provided in the cast statement and can therefore be unsafe. For example:



```cpp
// static_cast_Operator_2.cpp
// compile with: /LD /GR
class B {
public:
   virtual void Test(){}
};
class D : public B {};

void f(B* pb) {
   D* pd1 = dynamic_cast<D*>(pb);
   D* pd2 = static_cast<D*>(pb);    
}
```
If pb really points to an object of type D, then pd1 and pd2 will get the same value. They will also get the same value if pb == 0.

If pb points to an object of type B and not to the complete D class, then dynamic_cast will know enough to return zero. However, static_cast relies on the programmer's assertion that pb points to an object of type D and simply returns a pointer to that supposed D object.

#### Static Casts

[static_cast Operator | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/static-cast-operator?view=msvc-160)


The static_cast operator can also be used to perform any implicit conversion, including **standard conversions** and **user-defined conversions.** For example:

> The **`static_cast`** operator can explicitly convert an integral value to an enumeration type. If the value of the integral type does not fall within the range of enumeration values, the resulting enumeration value is undefined.
> 
> The **`static_cast`** operator converts a null pointer value to the null pointer value of the destination type.
> 
> Any expression can be explicitly converted to type void by the **`static_cast`** operator. The destination void type can optionally include the **`const`**, **`volatile`**, or **`__unaligned`** attribute.
> 
> The **`static_cast`** operator cannot cast away the **`const`**, **`volatile`**, or **`__unaligned`** attributes. See [const\_cast Operator](https://docs.microsoft.com/en-us/cpp/cpp/const-cast-operator?view=msvc-160) for information on removing these attributes.


```cpp
// static_cast_Operator_3.cpp
// compile with: /LD /GR
typedef unsigned char BYTE;

void f() {
   char ch;
   int i = 65;
   float f = 2.5;
   double dbl;

   ch = static_cast<char>(i);   // int to char
   dbl = static_cast<double>(f);   // float to double
   i = static_cast<BYTE>(ch);
}
```

#### Dynamic Casts

!!!Note Only works on Pointers
>   The type-id must be a pointer or a reference to a previously defined class type or a "pointer to void". The type of expression must be a pointer if type-id is a pointer, or an l-value if type-id is a reference.



```cpp
// dynamic_cast_1.cpp
// compile with: /c
class B { };
class C : public B { };
class D : public C { };

void f(D* pd) {
   C* pc = dynamic_cast<C*>(pd);   // ok: C is a direct base class
                                   // pc points to C subobject of pd
   B* pb = dynamic_cast<B*>(pd);   // ok: B is an indirect base class
                                   // pb points to B subobject of pd
}
```


This type of conversion is called an "upcast" because it moves a pointer up a class hierarchy, from a derived class to a class it is derived from. An upcast is an implicit conversion.

If type-id is void*, a run-time check is made to determine the actual type of expression. The result is a pointer to the complete object pointed to by expression. For example:

```cpp
// dynamic_cast_2.cpp
// compile with: /c /GR
class A {virtual void f();};
class B {virtual void f();};

void f() {
   A* pa = new A;
   B* pb = new B;
   void* pv = dynamic_cast<void*>(pa);
   // pv now points to an object of type A

   pv = dynamic_cast<void*>(pb);
   // pv now points to an object of type B
}
```

If type-id is not void*, a run-time check is made to see if the object pointed to by expression can be converted to the type pointed to by type-id.

If the type of expression is a base class of the type of type-id, a run-time check is made to see if expression actually points to a complete object of the type of type-id. If this is true, the result is a pointer to a complete object of the type of type-id. For example:



```cpp
// dynamic_cast_3.cpp
// compile with: /c /GR
class B {virtual void f();};
class D : public B {virtual void f();};

void f() {
   B* pb = new D;   // unclear but ok
   B* pb2 = new B;

   D* pd = dynamic_cast<D*>(pb);   // ok: pb actually points to a D
   D* pd2 = dynamic_cast<D*>(pb2);   // pb2 points to a B not a D
}
```

This type of conversion is called a "downcast" because it moves a pointer down a class hierarchy, from a given class to a class derived from it.

In cases of multiple inheritance, possibilities for ambiguity are introduced. Consider the class hierarchy shown in the following figure.

For CLR types, dynamic_cast results in either a no-op if the conversion can be performed implicitly, or an MSIL isinst instruction, which performs a dynamic check and returns nullptr if the conversion fails.

The following sample uses dynamic_cast to determine if a class is an instance of particular type:


```cpp
// dynamic_cast_7.cpp
// compile with: /c /GR
class A {virtual void f();};
class B {virtual void f();};

void f() {
   A* pa = new A;
   B* pb = dynamic_cast<B*>(pa);   // fails at runtime, not safe;
   // B not derived from A
}
```

[dynamic_cast Operator | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/dynamic-cast-operator?view=msvc-160)

> The value of a failed cast to pointer type is the null pointer. A failed cast to reference type throws a [bad\_cast Exception](https://docs.microsoft.com/en-us/cpp/cpp/bad-cast-exception?view=msvc-160). If `expression` does not point to or reference a valid object, a `__non_rtti_object` exception is thrown.

#### Const Casts

[const_cast Operator](https://docs.microsoft.com/en-us/cpp/cpp/const-cast-operator?view=msvc-160)

>     const_cast <type-id> (expression)
>     
> A pointer to any object type or a pointer to a data member can be explicitly converted to a type that is identical except for the **`const`**, **`volatile`**, and **`__unaligned`** qualifiers. For pointers and references, the result will refer to the original object. For pointers to data members, the result will refer to the same member as the original (uncast) pointer to data member. Depending on the type of the referenced object, a write operation through the resulting pointer, reference, or pointer to data member might produce undefined behavior.
> 
> You cannot use the **`const_cast`** operator to directly override a constant variable's constant status.
> 
> The **`const_cast`** operator converts a null pointer value to the null pointer value of the destination type.


```cpp
// expre_const_cast_Operator.cpp
// compile with: /EHsc
#include <iostream>

using namespace std;
class CCTest {
public:
   void setNumber( int );
   void printNumber() const;
private:
   int number;
};

void CCTest::setNumber( int num ) { number = num; }

void CCTest::printNumber() const {
   cout << "\nBefore: " << number;
   const_cast< CCTest * >( this )->number--;
   cout << "\nAfter: " << number;
}

int main() {
   CCTest X;
   X.setNumber( 8 );
   X.printNumber();
}
```

> On the line containing the **`const_cast`**, the data type of the **`this`** pointer is `const CCTest *`. The **`const_cast`** operator changes the data type of the **`this`** pointer to `CCTest *`, allowing the member `number` to be modified. The cast lasts only for the remainder of the statement in which it appears.

#### Reinterpret Casts

        reinterpret_cast < type-id > ( expression )

[reinterpret_cast Operator](https://docs.microsoft.com/en-us/cpp/cpp/reinterpret-cast-operator?view=msvc-160)

> The **`reinterpret_cast`** operator can be used for conversions such as **`char*`** to **`int*`**, or `One_class*` to `Unrelated_class*`, which are inherently unsafe.
> 
> The result of a **`reinterpret_cast`** cannot safely be used for anything other than being cast back to its original type. Other uses are, at best, nonportable.
> 
> The **`reinterpret_cast`** operator cannot cast away the **`const`**, **`volatile`**, or **`__unaligned`** attributes. See [const\_cast Operator](https://docs.microsoft.com/en-us/cpp/cpp/const-cast-operator?view=msvc-160) for information on removing these attributes.
> 
> The **`reinterpret_cast`** operator converts a null pointer value to the null pointer value of the destination type.
> 
> One practical use of **`reinterpret_cast`** is in a hash function, which maps a value to an index in such a way that two distinct values rarely end up with the same index.

> The **`reinterpret_cast`** allows the pointer to be treated as an integral type. The result is then bit-shifted and XORed with itself to produce a unique index (unique to a high degree of probability). The index is then truncated by a standard C-style cast to the return type of the function.


```cpp
#include <iostream>
using namespace std;

// Returns a hash code based on an address
unsigned short Hash( void *p ) {
   unsigned int val = reinterpret_cast<unsigned int>( p );
   return ( unsigned short )( val ^ (val >> 16));
}

using namespace std;
int main() {
   int a[20];
   for ( int i = 0; i < 20; i++ )
      cout << Hash( a + i ) << endl;
}

Output:
64641
64645
64889
64893
64881
64885
64873
```




#### Safe Casts

MSFT Only

[Safe Casts](https://docs.microsoft.com/en-us/cpp/extensions/safe-cast-cpp-component-extensions?view=msvc-160)



<!-- Todo -->

#### Run Time informatioon

<!-- Todp -->
Two ways I have seen:

`reinterpret_cast<const char *> `

and

```c++
char c = 'x';
int i = (int) c
```

##### Static Cast vs Dynamic




___
## Symbols, Operators, and Keywords
___




### Reserved Keywords
[Keywords (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/keywords-cpp?view=msvc-160)

- alignas
- alignof
- and b
- and_eq b
- asm a
- auto
- bitand b
- bitor b
- bool
- break
- case
- catch
- char
- char8_t c
- char16_t
- char32_t
- class
- compl b
- concept c
- const
- const_cast
- consteval c
- constexpr
- constinit c
- continue
- co_await c
- co_return c
- co_yield c
- decltype
- default
- delete
- do
- double
- dynamic_cast
- else
- enum
- explicit
- export c
- extern
- false
- float
- for
- friend
- goto
- if
- inline
- int
- long
- mutable
- namespace
- new
- noexcept
- not b
- not_eq b
- nullptr
- operator
- or b
- or_eq b
- private
- protected
- public
- register reinterpret_cast
- requires c
- return
- short
- signed
- sizeof
- static
- static_assert
- static_cast
- struct
- switch
- template
- this
- thread_local
- throw
- true
- try
- typedef
- typeid
- typename
- union
- unsigned
- using declaration
- using directive
- virtual
- void
- volatile
- wchar_t
- while
- xor b
- xor_eq b


###

## Pointers
___

Some good links:
 
- [FAQ Lite](https://isocpp.org/wiki/faq/references#refs-vs-ptrs)

- [When do we pass by ref or pointer](https://www.geeksforgeeks.org/when-do-we-pass-arguments-by-reference-or-pointer/)

- [Pointers vs Ref (src for most of below)](https://www.geeksforgeeks.org/pointers-vs-references-cpp/)

- [See more](https://www.geeksforgeeks.org/pointers-and-references-in-c/?ref=rp)

- [And more- good](https://www.geeksforgeeks.org/pointers-in-c-and-c-set-1-introduction-arithmetic-and-array/)

![Image](https://www.geeksforgeeks.org/wp-content/uploads/How-Pointer-Works-In-C.png)




```c++
int i = 3; 
int *ptr = &i; // A pointer to variable i (or stores addr of i)
int &ref = i; // A reference (or alias) for i.

int *p = &a;    
//OR
int *p;  p = &a;

int &p=a;  //it is correct
   but
int &p; p=a;   // it is incorrect as we should declare and initialize references at single step.
```

4. Reassignment: A pointer can be re-assigned. This property is useful for implementation of data structures like linked list, tree, etc. See the following examples: 


```c++
int a = 5;
int b = 6;
int *p;
p =  &a;
p = &b;
```

But the converse is not true:


```c++
int a = 5;
int b = 6;
int &p = a;
int &p = b;  //At this line it will show error as "multiple declaration is not allowed".
//However it is valid statement,
int &q=p;
```

6. Memory Address: A **pointer has its own memory address and size on the stack** whereas a **reference shares the same memory address** (with the original variable) but also takes up some space on the stack.

```c++
   int &p = a;
   cout << &p << endl << &a;
```
7. NULL value: Pointer can be assigned NULL directly, whereas reference cannot. The constraints associated with references (no NULL, no reassignment) ensure that the underlying operations do not run into exception situation.

8. Indirection: You can have pointers to pointers offering extra levels of indirection. Whereas references only offer one level of indirection.I.e, 

In Pointers, you can have pointers to pointers etc, but references cannot because they are teh same as the object.

```c++
int a = 10;
int *p;
int **q;  //it is valid.
p = &a;
q = &p;
a & p(*) & q(**) * p(*) * a

Whereas in references,

int &p = a;
int &&q = p; //it is reference to reference, so it is an error.
```



### Passing Objects

The best way is to provide the myGLCD object as a parameter to the constructor:

```c++
touchButton::touchButton(UTFT &glcddev, int x, int y, int xs, int ys, char myuse) {
  x1 = x;
  y1 = y;
  xsize = xs;
  ysize = ys;
  use = myuse;
  glcd = &glcddev;
}
```

Then in your header you provide a:
```c++
private: 
  UTFT *glcd;
Your library code then uses the glcd pointer to the object:

**glcd->drawRoundedRectangle(...);**
``` 

Note the use of `->` since glcd is a pointer to the object (as created by the & operator when it was assigned in the constructor).


### Function Pointers

<!-- To Do- Mentioned in the Microsoft  Doc on Type aliases -->

takes the general form:  Let HelloWorld be a simple parameterless func.

    auto func_name = &HelloWorld;

Dont need the `&` because its implicit

    auto func_name = HelloWorld;

What type is auto?

    void(*func_name)(param typename)

eg 

    void(*myFunc)(int)

This is complicated, which is why people use the `auto`.  Can also use `using` or `typedef`


    typedef void(*func_name)(param typename) HelloWorldFunction;

    typedef void(*HelloWorldFunction) 
    
?- I think he means:

     typedef void(*HelloWorld)(<T>) HelloWorldFunction

No the way he had it compiles?


    typedef void (*HelloWorldFunction);

    HelloWorldFunction func = HelloWorld;

if HelloWorld now takes an int param:

    typedef void (*HelloWorldFunction)(int);

    HelloWorldFunction func = HelloWorld;

    func(8)
    func(2)

```C++
// C++11
using func = void(*)(int);


// C++03 equivalent:
// typedef void (*func)(int);

// func can be assigned to a function pointer value
void actual_function(int arg) { /* some code */ }
func fptr = &actual_function;
```

### Unique_Ptr

In the [memory header file](https://en.cppreference.com/w/cpp/header/memory).

There are a lot of powerful methods in there.

See heap initialzation for usage.  It seems passing it you have to call release.

```C++
	static std::unique_ptr<const Card, std::default_delete<const Card>> cardFactory(face_e face, suit_e suit);
    //without calling release
    	const Card* cardFactory(face_e face, suit_e suit);
        //calling release
    //here:
auto thisCard = std::make_unique<const Card>(face, suit).release();
return thisCard;
```


 `unique_ptr` (C++11) - smart pointer with unique object ownership semantics 
     
`shared_ptr` (C++11) smart pointer with shared object ownership semantics
`weak_ptr` - (C++11) weak reference to an object managed by std::shared_ptr
~~`auto_ptr` - (removed in C++17) smart pointer with strict object ownership semantics~~

## Functors

Function Objects

 Arithmetic operations
- ==plus== - function object implementing x + y
- ==minus== - function object implementing x - y
- ==multiplies== - function object implementing x * y
- ==divides== - function object implementing x / y
- ==modulus== - function object implementing x % y
- ==negate== - function object implementing -x
Comparisons
- ==equal_to== - function object implementing x == y
- ==not_equal_to== - function object implementing x != y
- ==greater== - function object implementing x > y
- ==less== - function object implementing x < y
- ==greater_equal== - function object implementing x >= y
- ==less_equal== - function object implementing x <= y
Logical operations
- ==logical_and== - function object implementing x && y
- ==logical_or== - function object implementing x || y
- ==logical_not== - function object implementing !x
Bitwise operations
- ==bit_and== - function object implementing x & y
- ==bit_or== - function object implementing x | y
- ==bit_xor== - function object implementing x ^ y
- ==bit_not== - function object implementing ~x


[All_of, any_of, None_of]([std::all_of, std::any_of, std::none_of - cppreference.com](https://en.cppreference.com/w/cpp/algorithm/all_any_none_of))


```
if (all_of(v.begin(), v.end(), isEven))cout<< "All are even"




```


### STL  Standard Template Libraries

https://www.geeksforgeeks.org/the-c-standard-template-library-stl/
___
## Enums

```c++
enum PieceType(PieceTypeKing, PieceTypeQueen, PieceTypeRook);
```

Creates an enum, just carries the numerical int value of position. 
You can also specify values-


```c++
enum PieceType(PieceTypeKing = 2, PieceTypeQueen, PieceTypeRook=10, PieceTypeKnight);
```

The values following will just be incremented.  e.g. King = 2, Q=3 R=10, K=11.

### Strongly Typed Enums

The above always has the value given underneath.  This allows you (perhaps inappropriately) to compare two unrelated *enums*.

To prevent that- use strongly typed ones.

this is the type safe version.


```c++
enum class PieceType
{
   King=1,
   Queen,
   Rook,
   Pawn
};
```

For an enum class, the enumeration value names are not automatically exported to the enclosing scope, which means that you always have to use the scope resolution operator:


`PieceType piece = PieceType::King;`

These do not have underlying integer values, assigning numbers like above is an error.

`if(PieceType::Queen==1){} //error`


```c++
enum class PieceType : unsigned long
{
   King = 1,
   Queen,
   Rook = 10,
   Pawn
};
```

### Iterable Enums



[How to iterate over enums](https://stackoverflow.com/questions/261963/how-can-i-iterate-over-an-enum)


Iterable Enums

```c++
num Foo {
  One,
  Two,
  Three,
  Last
};

for ( int fooInt = One; fooInt != Last; fooInt++ )
{
   Foo foo = static_cast<Foo>(fooInt);
   // ...
}
``` 

This relies on the underlying int type of loosely typed enums


```c++
#include <iostream>
#include <algorithm>

namespace MyEnum
{
  enum Type
  {
    a = 100,
    b = 220,
    c = -1
  };

  static const Type All[] = { a, b, c };
}

void fun( const MyEnum::Type e )
{
  std::cout << e << std::endl;
}

int main()
{
  // all
  for ( const auto e : MyEnum::All )
    fun( e );

  // some
  for ( const auto e : { MyEnum::a, MyEnum::b } )
    fun( e );

  // all
  std::for_each( std::begin( MyEnum::All ), std::end( MyEnum::All ), fun );

  return 0;
}
```

____



## Variables

- Variable names must begin with a letter or an underscore…remaining characters in a may be letters, digits or underscores
   - Avoid beginning names with single or double underscores
- Upper & lowercase letters are distinct
- All characters in a variable name are significant
- Must be declared, can be anywhere.

```c++
#include    <iostream>
using namespace std;
int main()
{
    int a;        // value of a is undefined
    int b = 10;
    cout << b << endl;
    int z = 99;    // can't do this in C language, but OK in C++
    cout << z << endl;

    for( int j = 0; j < 3; j++ )        // scope of j is for loop
    {
        cout << "j is " << j << endl;
    }

    return 0;
}
```


### Specifications and Modifications

These are the broad class of keywords that go before a type. 

e.g. `<something> int c = 0;`

Such as `const int c` and `volatile int c`.

Briefly these classes are:

- Storage Class
    - extern
    - static
    - thread_local
- Linkage Class
    - static

___
#### Storage Class

These are declarations that refer to the ' lifetime, linkage, and memory location of objects'

One of `extern`, `static`, `thread_local`

 Automatic objects and variables have no linkage; they are not visible to code outside the block. Memory is allocated for them automatically when execution enters the block and de-allocated when the block is exited.

___

#### extern 

Objects and variables declared as extern declare an object that is defined in another translation unit or in an enclosing scope as having external linkage. For more information, 

[Storage classes (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/storage-classes-cpp?view=msvc-160#static)

> see [`extern`](https://docs.microsoft.com/en-us/cpp/cpp/extern-cpp?view=msvc-160) and [Translation units and linkage](https://docs.microsoft.com/en-us/cpp/cpp/program-and-linkage-cpp?view=msvc-160).
____
#### static

[Storage classes (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/storage-classes-cpp?view=msvc-160#static)

The static keyword can be used to declare variables and functions at global scope, namespace scope, and class scope. Static variables can also be declared at local scope.

Static duration means the object is created at start, and remains until end.

 [External linkage](#static) means that the name of the variable is visible from outside the file in which the variable is declared.

 By default, an object or variable that is *defined in the global namespace has _static_ duration and external linkage.* 

     Conversely, internal linkage means that the name is not visible outside the file in which the variable is declared. 
 
 The static keyword can be used in the following situations.


[Storage classes (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/storage-classes-cpp?view=msvc-160#static)

> -   When you declare a variable or function at file scope (global and/or namespace scope), the **`static`** keyword specifies that the variable or function has internal linkage. When you declare a variable, the variable has static duration and the compiler initializes it to 0 unless you specify another value.
>       !Note- Contradictory?
>     
> -   When you declare a **variable in a function,** the **`static`** keyword specifies that the variable _retains its state between calls to that function._
>     
> -   When you declare a **data member** in a class declaration, the **`static`** keyword specifies that _one copy of the member is shared by all instances_ of the class. A static data member must be defined at file scope. An integral data member that you declare as **`const static`** can have an initializer.
>     
> -   When you declare a **member function** in a class declaration, the **`static`** keyword specifies that the function is shared by all instances of the class. A static member function cannot access an instance member because the function does not have an implicit **`this`** pointer. 
>       
>       - To access an instance member, declare the function with a parameter that is an instance pointer or reference.
>     
> -   You cannot declare the members of a union as static. However, a globally declared anonymous union must be explicitly declared **`static`**.

____

#### thread_local

A variable declared with the thread_local specifier is accessible only on the thread on which it is created. The variable is created when the thread is created, and destroyed when the thread is destroyed. Each thread has its own copy of the variable. On Windows, thread_local is functionally equivalent to the Microsoft-specific `__declspec( thread )` attribute.

the `thread_local` specifier may be combined with `static` or `extern`.

___

### Linkage Class

A free *function* is a _function_ that is defined at global or namespace scope. **Non-const global variables and free functions by default have external linkage;** they are visible from any translation unit in the program. Therefore, no other global object can have that name.

The *following* objects have internal linkage by default:

    const objects
    constexpr objects
    typedefs
    static objects in namespace scope


#### static

[See Here](https://docs.microsoft.com/en-us/cpp/cpp/program-and-linkage-cpp?view=msvc-160)



You can force a global name to have internal linkage by explicitly declaring it as static. This limits its visibility to the same translation unit in which it is declared. In this context, static means something different than when applied to local variables.

#### extern

To give a const object external linkage, declare it as extern and assign it a value:


        extern const int value = 42;

___
### Initialization


[Initializers | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/initializers?view=msvc-160)

int valueX; // this could be anything, whatever happens to be in the reused memory function
Copy Initialization: `int valueX = 0; `
Direct Initialization: `int valueX(0);`
Uniform Initialization (aka Brace Initialization): `int valueX{0};`
   - Zero Initialization: `int valueX{}` - initializes to zero or empty depending on value.

int valueX[0] returns a pointer, because this is actually a c-style array.

Using bracket assignment- it will warn about truncation.

eg `int x = 3.14` - x = 3

```c++
int hamburgers = {16};    // set hamburgers to 16
int hotdogs {3};        // set hotdogs to 3
int mustard {};        // set mustard to 0
int relish = {};        // set relish to 0
int ketchup(1);        // set ketchup to 1

long double x = 3.14159;
int a{x}, b = {x};        // truncation error
int c(x), d = x;        // ok – but will truncate.  Using these assingment methods wont have checking.
int a =3;
int b{3};
int c = {3};
int d(3);
```

Uniform initialization (using `{}`) calls the default initializer for each item.  Especially for `0` initialization.  Primitive int and non float chars are 0, all floating pt values 0.0, and pointer values are `nullptr`

It prevents narrowing.

```c++
void func(int i){/* */}

int x = 3.14 //auto narrows to 3.
func(3.14); //passes 3 automatically
//these may result in a compiler error for narrowing.

int x{3.14} //error
int x = {3.14} //error
func{(3.14)} //error

```
___
### Type Qualifierrs

Type qualifiers give one of two properties to an identifier. The const type qualifier declares an object to be nonmodifiable. The volatile type qualifier declares an item whose value can legitimately be changed by something beyond the control of the program in which it appears, such as a concurrently executing thread.

Const - wont change
Volatile - could change from outside the prog. control
Restrict
___

#### const

The following are legal const and volatile declarations:


```C
//note this is C code.
int const *p_ci;      // Pointer to constant int
int const (*p_ci);   // Pointer to constant int
int *const cp_i;     // Constant pointer to int
int (*const cp_i);   // Constant pointer to int
int volatile vint;     // Volatile integer
```



    The const keyword can be used to modify any fundamental or aggregate type, or a pointer to an object of any type, or a typedef. If an item is declared with only the const type qualifier, its type is taken to be const int. A const variable can be initialized or can be placed in a read-only region of storage. The const keyword is useful for declaring pointers to const since this requires the function not to change the pointer in any way.

    The compiler assumes that, at any point in the program, a volatile variable can be accessed by an unknown process that uses or modifies its value. Regardless of the optimizations specified on the command line, the code for each assignment to or reference of a volatile variable must be generated even if it appears to have no effect.

### constexpr


[constexpr (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/constexpr-cpp?view=msvc-160)


### volitile

[volatile (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/volatile-cpp?view=msvc-160)

interprets the volatile keyword differently depending on the target architecture. 

You can use the volatile qualifier to provide access to memory locations that are used by asynchronous processes such as interrupt handlers.

When volatile is used on a variable that also has the __restrict keyword, volatile takes precedence.

### restrict __restrict

!!!Warning This may be microsoft specific

[`__restrict` | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/extension-restrict?view=msvc-160)

Says **that no other pointer in the current scope refers to the same memory location.** That is, only the pointer or a value derived from it (such as pointer + 1) is used to access the object during the lifetime of the pointer. This helps the compiler produce more optimized code.

Like the __declspec ( restrict ) modifier, the __restrict keyword (two leading underscores '_') indicates that a symbol isn't aliased in the current scope. The __restrict keyword differs from the __declspec (restrict) modifier in the following ways:

    The __restrict keyword is valid only on variables, and __declspec (restrict) is only valid on function declarations and definitions.

    __restrict is similar to restrict for C starting in C99, but __restrict can be used in both C++ and C programs.

### List Initialization

There is a difference with Copy `=` and Direct Initilization in C++17

#### Direct List Initialization

`T obj {arg1, arg2, ...}`

```c++
auto a {11}; //int

auto b {11, 22}; //Error - no list one element allowed
```

#### Copy List Initialization

`T obj = {arg1, arg2, ...}`

```c++
auto a = {11}; //initilizer list<int>

auto b = {11, 22}; //initilizer list<int>
auto c = {11, 22.2} //ERROR must be same type
```

### Scoping

`static` keyword- allocates memory in .data segment at compile time, is loaded at execution and remains in memory for the duration.

//to do week 2

`inline` 

`extern` - used to declare an object without defining it.  States that it is defined elsewhere in the Linkage units- e.g. in another file.

      `extern int n;` - ok 
      `extern int n = 0;` not ok.

      To define you need:

      `extern const int n = 0`
#### namespaces

### Casting

`static_cast<T>(v);`

see main article in Types [Conversion](#Conversion)

Assigning a value to increasing precision is ok

eg. a float -> double

to force a cast to lower precision (e.g. double assigned to int)





```c++
int intVal;
double dbVal1, dbVal2;
intVal = dbVal1 + dbVal2; //Causes error
intval = static_cast<int>(dbVal1 + dbVal2);
```

### Type Promotion

int integer
float flt

flt + integer = float 
flt - integer = float 
flt * integer = float 
flt / integer = float 
int / float = int
float % int = error
int % float = error **

Only int % int is allowed.


### auto 

The auto initialization expression can take several forms:

- Universal initialization syntax, such as auto a { 42 };.
- Assignment syntax, such as auto b = 0;.
- Universal assignment syntax, which combines the two previous forms, such as auto c = { 3.14156 };.
- Direct initialization, or constructor-style syntax, such as auto d( 1.41421f );.

[auto (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/auto-cpp?view=msvc-160)

The auto keyword directs the compiler to use the initialization expression of a declared variable, or lambda expression parameter, to deduce its type.

We recommend that you use the auto keyword for most situations—unless you really want a conversion—because it provides these benefits:

    Robustness: If the expression’s type is changed—this includes when a function return type is changed—it just works.

    Performance: You’re guaranteed that there will be no conversion.

    Usability: You don't have to worry about type name spelling difficulties and typos.

    Efficiency: Your coding can be more efficient.


```C++ 
    int j = 0;  // Variable j is explicitly type int.
auto k = 0; // Variable k is implicitly type int because 0 is an integer.

```

    The following declarations are equivalent, but the second declaration is simpler than the first. One of the most compelling reasons to use the auto keyword is simplicity.

```C++ 
map<int,list<string>>::iterator i = m.begin();
auto i = m.begin();
```
The following code fragment declares the type of variables iter and elem when the for and range for loops start.

```C++

// cl /EHsc /nologo /W4
#include <deque>
using namespace std;

int main()
{
    deque<double> dqDoubleData(10, 0.1);

    for (auto iter = dqDoubleData.begin(); iter != dqDoubleData.end(); ++iter)
    { /* ... */ }

    // prefer range-for loops with the following information in mind
    // (this applies to any range-for with auto, not just deque)

    for (auto elem : dqDoubleData) // COPIES elements, not much better than the previous examples
    { /* ... */ }

    for (auto& elem : dqDoubleData) // observes and/or modifies elements IN-PLACE
    { /* ... */ }

    for (const auto& elem : dqDoubleData) // observes elements IN-PLACE
    { /* ... */ }
}
```




### deceltype


Trailing Return Types

You can use `auto`, together with the `decltype` type specifier, to help write template libraries. Use `auto` and `decltype` to declare a template function whose return type depends on the types of its template arguments. Or, use auto and `decltype` to declare a template function that wraps a call to another function, and then returns whatever is the return type of that other function. For more information, see [`decltype`.](https://docs.microsoft.com/en-us/cpp/cpp/decltype-cpp?view=msvc-160)


## Constants

- Literal constants are values that appear in a program (e.g. 33, 12.99, 'A', "Hello")
- Literal constants are not addressable - Can't directly address memory where value is stored
- Every literal constant has an associated type

Literal integer constants are treated as signed values of type int


      34        // decimal notation
      036        // octal
      0x14        // hexadecimal
      128L        // long (could also use l )
      128U        // unsigned (could also use u )
      14UL        // long unsigned
      14LL        // long long*
      128ULL        // unsigned long long*
      3.14159F    // float (could also use f )
      0.0        // double (default type)
      7.435L        // extended precision
      4e2        // scientific notation 
      2.35E-2    // scientific notation

f = F = float.

Printable literal character constants written with character inside single quotes


      'G'        // letter G
      ','        // literal comma
      ' '        // literal blank
      '5'        // literal 5

Nonprintable characters, the single & double quote marks, and the backslash are represented using escape sequences

      \n        // newline
      \b    // backspace
      \t        // horizontal tab        
      \v    // vertical tab
      \r        // carriage return    
      \f    // formfeed
      \a        // alert (bell)        
      \\    // backslash
      \'        // single quote        
      \"    // double quote

Can also use \xxx where xxx is a sequence of up to 3 octal digits

        \0    // null            
      \7    // bell
        \14    // newline        
      \062    // '2'


Can be used to transform a variable into an addressable constant
Must be initialized in its declaration


const float pi = 3.14159;    // pi is a constant
const int c;        // ERROR!! must be initialized in declaration
pi = 22.3;        // ERROR!! can't change value


### String Literals

String literals consist of zero or more characters enclosed in double quotes. Compiler adds terminating null character
Treated as an array of constant (const) characters
Nonprintable characters are represented by their escape sequences
        ""            // null string
        "A"            // not same as char literal 'A'
        "Hello"        // String literal
        "Hello \t World"    // Embedded escape sequence
        "Multiple line \    // Can extend for several lines
        literal"        // using a backslash as the 
                    // last character on a line

### Boolean literals

      true, false


## Complex Types


arrays, structures (type struct), unions (type union), and enumerators (type enum) are legacy types from C
C++ structures can have functions as well as data types as members
The class type will be discussed later in this course


### Arrays

[Array Deep Dive (good)](https://stackoverflow.com/questions/4810664/how-do-i-use-arrays-in-c/4810668#4810668)



Zero indexed.

C++ you must give a size to the array.  This size cannot be a variable, it must be a constant, or a constant expression (*constexpr*)


```c++
int myArray[3];
myArray[0]=0;
myArray[1]=0;
myArray[2]=0;
```
This is declaring by initializer list:

`int[] array = {1,2,3,4}` you can set each val to zero like:

`int array[3] = {0};` further this is equivalent to 

`int array[3]={}` eg. you dont need to state zero. Also, note that, 

`int arr[3] = {2}` does not set each to 2, but sets the first to 2 and the rest to zero.  Also, this 

`int arr[]={2}` creates an array of length = 1 and value arr[0] = 2. (e.g size will be deduced from given values.


#### Assignment

For no particular reason, arrays cannot be assigned to one another. Use std::copy instead:


```c++
#include <algorithm>

// ...

int a[8] = {2, 3, 5, 7, 11, 13, 17, 19};
int b[8];
std::copy(a + 0, a + 8, b);
//(<start>, <end- exclusive>, <dest>)
```

**passing arrays**

```c++
void myFunction(int *param) { ..}

void myFunction(int param[10]) {

void myFunction(int param[], d) {

```
`int arg[]` is adjusted to be `int* arg` (**Decomposed:** see below) when passed to a function.


!!! Caution  Caution: Be careful of the above types: That is a pointer to ints, not an int.
      `int array[3] = {0};`

A template solution- which at this time I dont undersand

[Here](https://stackoverflow.com/questions/968001/determine-size-of-array-if-passed-to-function)




```c++
    template <typename T, int N>
    void func(T (&a) [N]) {
        for (int i = 0; i < N; ++i) a[i] = T(); // reset all elements
    }
int x[10];
func(x);
```


**Array-to-pointer decay** The only "connection" between T[n] and T[m] is that both types can implicitly be converted to T*, and the result of this conversion is a pointer to the first element of the array. That is, anywhere a T* is required, you can provide a T[n], and the compiler will silently provide that pointer: This conversion is known as "array-to-pointer decay", and it is a major source of confusion. The size of the array is lost in this process, since it is no longer part of the type (T*).

The compiler will silently generate a pointer to the first element of an array whenever it is deemed useful, that is, whenever an operation would fail on an array but succeed on a pointer


**size** -  get the size with

      unsigned int arraySize = std::size(myArray)

This only works in C++ 17++ (and not for me... in 20+...) so you can use the trick:

       unsigned int arraySize = = sizeof(myArray) / sizeof(myArray[0])
   
This is a hack that finds the whole size, divided by 1 element, which should equal # elements.



```c++
#include <type_traits>

static_assert(!std::is_same<int[8], float[8]>::value, "distinct element type");
static_assert(!std::is_same<int[8],   int[9]>::value, "distinct size");

static_assert(!std::is_same<int[8], int*>::value, "an array is not a pointer");
```
Note that the size is part of the type, that is, array types of different size are incompatible types that have absolutely nothing to do with each other. sizeof(T[n]) is equivalent to n * sizeof(T).

`static_assert(!std::is_same<int*, int(*)[8]>::value, "distinct element type");`


One important context in which an array does not decay into a pointer to its first element is when the `&` operator is applied to it. The `&` operator yields a pointer to the entire array, not just a pointer to its first element. Although in that case the values (the addresses) are the same, a pointer to the first element of an array and a pointer to the entire array are completely distinct types:

The same situation arises in classes and is maybe more obvious. A pointer to an object and a pointer to its first data member have the same value (the same address), yet they are completely distinct types.

If you are unfamiliar with the C declarator syntax, the parenthesis in the type int(*)[8] are essential:

    `int(*)[8]` is a pointer to an array of 8 integers.
    `int*[8]` is an array of 8 pointers, each element of type int*.

note i tried putting these in C++ and they werenet liked.

Actually the syntax looks like this: (the 2nd item)


```c++
int array_of_arrays[6][7];
int (*pointer_to_array)[7] = array_of_arrays;

int* array_of_pointers[6];
int** pointer_to_pointer = array_of_pointers;
```



In adding to an array:


Since the syntax `*(x+i)` is a bit clumsy, C++ provides the alternative syntax `x[i]`:

```c++
int x[8]={};
x+3 ; //has no meaning but it decomposes into a pointer, and adds 3 to the pointer. giving the 3rd element.

std::cout << 3[x] << ", " << 7[x] << std::endl; //Due to the fact that addition is commutative, these are the same.
```

For length of n- an array will let you compute pointers to 0...nth items.  However, the nth item is nonexistant and would throw and error dereferenced.


```c++
std::sort(x + 0, x + n);
std::sort(&x[0], &x[0] + n);
std::sort(&x[0], &x[n]); //error- this is equivalent to &*(x+n), and the sub-expression *(x+n) 
```
An Array name is a special pointer, its a fixed pointer.  You can add to the array.

`pos = array + 1;`

However you cannot reassign the array or start of the array.

`array +=1; //error`
### Arrays of pointers

You can overcome the restriction of fixed width by introducing another level of indirection.
Named arrays of pointers

Here is a named array of five pointers which are initialized with anonymous arrays of different lengths:


```c++
int* triangle[5];
for (int i = 0; i < 5; ++i)
{
    triangle[i] = new int[5 - i];
}

// ...

for (int i = 0; i < 5; ++i)
{
    delete[] triangle[i];
}
```
```c++
int array[8] = {};
int(*) ptr_to_array[8] = &array
```

### Multidimensional arrays


Programmers often confuse multidimensional arrays with arrays of pointers.

Most programmers are familiar with named multidimensional arrays, but many are unaware of the fact that multidimensional array can also be created anonymously. Multidimensional arrays are often referred to as **"arrays of arrays"** or **"true multidimensional arrays".**


When using named multidimensional arrays, all dimensions must be known at compile time:


```c++

int H = read_int();
int W = read_int();

int connect_four[6][7];   // okay

int connect_four[H][7];   // ISO C++ forbids variable length array
int connect_four[6][W];   // ISO C++ forbids variable length array
int connect_four[H][W];   // ISO C++ forbids variable length array
```




#### Designated Initializer:

 This initializer is used when we want to initialize a range with the same value. This is used only with GCC compilers.

    [ first . . . last ] = value;

    int num[5]={ [0 . . . 4 ] = 3 };               // num = { 3, 3, 3, 3, 3}

 We may also ignore the size of array:

            int num[  ]={ [0 . . . 4 ] = 3 };               // num = { 3, 3, 3, 3, 3}


#### Macro Initializers

  Macros: For initializing a huge array with the same value we can use macros.

  ```C
  #include<stdio.h>

  #define x1 1
  #define x2 x1, x1
  #define x4 x2, x2
  #define x8 x4, x4
  #define x16 x8, x8
  #define x32 x16, x16

  int main(void)
  {
  // array declaration
  int num[] = { x32, x8, x4, x1};
  int size = sizeof(num)/ sizeof(int);    // 32+8+4+1= 45

  printf("The size of the array is %d\n", size);
  printf("The value of element in the array at index 5 is %d ", 
                                      num[4]);

  return 0;

  }
  ```
### structure

  [See the main article on Structs](#Structs)

  You define struct names at the end when its a type def.  This is really an anonymous structure, with a typedef assingment.  As in 

  typedef int ittybittyint;

  ```c++
    #include <string>

      typedef struct {
          string valueName;
          long long value;
      } values;
  ```

  ____
### class

  [See the main article on Classes](#Classes)
### union
  <!-- Todo -->
____
### enumerator

   [See Enumbs section](#Enums)



47-84, 114-134


### void * type

A pointer to 'anything'


[c - What does void* mean and how to use it? - Stack Overflow](https://stackoverflow.com/questions/11626786/what-does-void-mean-and-how-to-use-it)

A pointer to void is a "generic" pointer type. A `void *` can be converted to any other pointer type without an explicit cast. _You cannot dereference a `void *` or do pointer arithmetic with it; you_ must convert it to a pointer to a complete data type first.

void * is often used in places where you need to be able to work with different pointer types in the same code. One commonly cited example is the library function qsort:

void qsort(void *base, size_t nmemb, size_t size, 
           int (*compar)(const void *, const void *));

base is the address of an array, nmemb is the number of elements in the array, size is the size of each element, and compar is a pointer to a function that compares two elements of the array. It gets called like so:

```c++
int iArr[10];
double dArr[30];
long lArr[50];
...
qsort(iArr, sizeof iArr/sizeof iArr[0], sizeof iArr[0], compareInt);
qsort(dArr, sizeof dArr/sizeof dArr[0], sizeof dArr[0], compareDouble);
qsort(lArr, sizeof lArr/sizeof lArr[0], sizeof lArr[0], compareLong);
```
The array expressions iArr, dArr, and lArr are implicitly converted from array types to pointer types in the function call, and each is implicitly converted from "pointer to int/double/long" to "pointer to void".

The comparison functions would look something like:


```C++
int compareInt(const void *lhs, const void *rhs)
{
  const int *x = lhs;  // convert void * to int * by assignment
  const int *y = rhs;

  if (*x > *y) return 1;
  if (*x == *y) return 0;
  return -1;
}

```


By accepting void *, qsort can work with arrays of any type.

The disadvantage of using `void *` is that you throw type safety out the window and into oncoming traffic. There's nothing to protect you from using the wrong comparison routine:

`qsort(dArr, sizeof dArr/sizeof dArr[0], sizeof dArr[0], compareInt);`

compareInt is expecting its arguments to be pointing to ints, but is actually working with doubles. There's no way to catch this problem at compile time; you'll just wind up with a missorted array. 

, in socket functions, you have

send(void * pData, int nLength)

this means you can call it in many ways, for example

```c
char * data = "blah";
send(data, strlen(data));

POINT p;
p.x = 1;
p.y = 2;
send(&p, sizeof(POINT));
```


Also as a pointer to a function:

```C
#include <stdio.h> 
// A normal function with an int parameter 
// and void return type 
void fun(int a) 
{ 
    printf("Value of a is %d\n", a); 
} 
  
int main() 
{ 
    // fun_ptr is a pointer to function fun()  
    void (*fun_ptr)(int) = &fun; 
  
    /* The above line is equivalent of following two 
       void (*fun_ptr)(int); 
       fun_ptr = &fun;  
    */
  
    // Invoking fun() using fun_ptr 
    (*fun_ptr)(10); 
  
    return 0; 
} 
```

`void (*fun_ptr)(int) = &fun;`
`void (*fun_ptr)(int); `
` fun_ptr = &fun;` 


### C builtin Types


- `cc_t` - Type used for terminal special characters.
- `clock_t` - Integer or real-floating type used for processor times, 
  - as defined in the ISO C standard.
- `clockid_t` - Used for clock ID type in some timer functions.
- `dev_t` - Integer type used for device numbers.
- `DIR` - Type representing a directory stream.
- `div_t` - Structure type returned by the div() function.
- `FILE` - Structure containing information about a file.
- `glob_t` - Structure type used in pathname pattern matching.
- `fpos_t` - Type containing all information needed to specify uniquely every file position 
- `gid_t` - Integer type used for group IDs.
- `iconv_t` - Type used for conversion descriptors.
- `id_t` - Integer type used as a general identifier;
  -  can be used to contain at least the largest of a pid_t, uid_t, or gid_t.
- `ino_t` - Unsigned integer type used for file serial numbers.
- `key_t` - Arithmetic type used for XSI interprocess communication.
- `ldiv_t` - Structure type returned by the ldiv() function.
- `mode_t` - Integer type used for file attributes.
- `mqd_t` - Used for message queue descriptors.
- `nfds_t` - Integer type used for the number of file descriptors.
- `nlink_t` - Integer type used for link counts.
- `off_t` - Signed integer type used for file sizes.
- `pid_t` - Signed integer type used for process and process group IDs.
- `pthread_attr_t` - Used to identify a thread attribute object.
- `pthread_cond_t` - Used for condition variables.
- `pthread_condattr_t` - Used to identify a condition attribute object.
- `pthread_key_t` - Used for thread-specific data keys.
- `pthread_mutex_t` - Used for mutexes.
- `pthread_mutexattr_t` - Used to identify a mutex attribute object.
- `pthread_once_t` - Used for dynamic package initialization.
- `pthread_rwlock_t` - Used for read-write locks.
- `pthread_rwlockattr_t` - Used for read-write lock attributes.
- `pthread_t` - Used to identify a thread.
- `ptrdiff_t` - Signed integer type of the result of subtracting two pointers.
- `regex_t` - Structure type used in regular expression matching.
- `regmatch_t` - Structure type used in regular expression matching.
- `rlim_t` - Unsigned integer type used for limit values, 
  - which objects of type int and off_t can be cast without loss of value.
- `sem_t` - Type used in performing semaphore operations.
- `sig_atomic_t` - Possibly volatile-qualified integer type of an object 
  - can be accessed as an atomic entity, even in the presence of asynchronous interrupts.
- `sigset_t` - Integer or structure type of an object used to represent sets of signals.
- `size_t` - Unsigned integer type used for size of objects.
- `speed_t` - Type used for terminal baud rates.
- `ssize_t` - Signed integer type used for a count of bytes or an error indication.
- `suseconds_t` - Signed integer type used for time in microseconds.
- `tcflag_t` - Type used for terminal modes.
- `time_t` - Integer type used for time in seconds, as defined in the ISO C standard.
- `timer_t` - Used for timer ID returned by the timer_create() function.
- `uid_t` - Integer type used for user IDs.
- `va_list` - Type used for traversing variable argument lists.
- `wchar_t` - Integer type for largest extended character set 
  - specified by the supported locales.
  - range of values can represent distinct codes for all members of char set
- `wctype_t` - Scalar type which represents a character class descriptor.
- `wint_t` - Integer type capable of storing any valid value of wchar_t or WEOF.
- `wordexp_t` - Structure type used in word expansion.


### Strings

See Strings (below)


## Strings


char arrays in C


Wide char - string literals (e.g. Unicode)

Given by L"string"

The wide-character-string literal L"hello" becomes an array of six integers of type **wchar_t.**

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

Unlike normal pointers, we do not allocate de-allocate memory using function pointers.

 
A function’s name can also be used to get functions’ address. For example, in the below program, we have removed address operator ‘&’ in assignment. We have also changed function call by removing *, the program still works.


```C++
#include <stdio.h> 
// A normal function with an int parameter 
// and void return type 
void fun(int a) 
{ 
    printf("Value of a is %d\n", a); 
} 
  
int main() 
{  
    void (*fun_ptr)(int) = fun;  // & removed 
  
    fun_ptr(10);  // * removed 
  
    return 0; 
}
```



### String Literals 

Wide char - string literals (e.g. Unicode)

Given by L"string"

The wide-character-string literal L"hello" becomes an array of six integers of type **wchar_t.**

### Wide Chars

[Wide characters](http://www.cplusplus.com/reference/cwchar/)

The run-time library routines for translating between multibyte and wide characters include **mbstowcs,** **mbtowc,** **wcstombs,** and **wctomb.**

____
### String class


`std::string_view` - C++17 - you can replace `std::string_view` with `const std::string&`. String_view is just a wrapper for a pointer and a length.

**Class templates**

- `basic_string` - Generic string class (class template )

- `char_traits` - Character traits (class template )


Class instantiations

- `string` - String class (class )

- `u16string` - String of 16-bit characters (class )

- `u32string` - String of 32-bit characters (class )

- `wstring` - Wide string (class )


Functions
Convert from strings

- `stoi` - Convert string to integer (function template )

- `stol` - Convert string to long int (function template )

- `stoul` - Convert string to unsigned integer (function template )

- `stoll` - Convert string to long long (function template )

- `stoull` - Convert string to unsigned long long (function template )

- `stof` - Convert string to float (function template )

- `stod` - Convert string to double (function template )

- `stold` - Convert string to long double (function template )


Convert to strings

- `to_string` - Convert numerical value to string (function )

- `to_wstring` - Convert numerical value to wide string (function )


Range access

- `begin` - Iterator to beginning (function template )

- `end` - Iterator to end (function template )

___

#### Class toString() method

[c++ - Is there a standard way to convert a class to a string - Stack Overflow](https://stackoverflow.com/questions/33357480/is-there-a-standard-way-to-convert-a-class-to-a-string)

```C++ 
    template <typename T>
std::string to_string( const T& value )
{
  std::ostringstream ss;
  ss << value;
  return ss.str();
}
 
 ```
 
see also:

[Overloading the << Operator for Your Own Classes | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/standard-library/overloading-the-output-operator-for-your-own-classes?view=msvc-160)

> The `write` function example showed the use of a `Date` structure. A date is an ideal candidate for a C++ class in which the data members (month, day, and year) are hidden from view. An output stream is the logical destination for displaying such a structure. This code displays a date using the `cout` object:
> 
>``` C++
> 
>     Date dt(1, 2, 92);
>     
>     cout <<dt;
>     
>```
 
> To get `cout` to accept a `Date` object after the insertion operator, overload the insertion operator to recognize an `ostream` object on the left and a `Date` on the right. The overloaded `<<` operator function must then be declared as a friend of class `Date` so it can access the private data within a `Date` object.
> 
>``` C++
> 
>     // overload_date.cpp
>     // compile with: /EHsc
>     #include <iostream>
>     using namespace std;
>     
>     class Date
>     {
>         int mo, da, yr;
>     public:
>         Date(int m, int d, int y)
>         {
>             mo = m; da = d; yr = y;
>         }
>         friend ostream& operator<<(ostream& os, const Date& dt);
>     };
>     
>     ostream& operator<<(ostream& os, const Date& dt)
>     {
>         os << dt.mo << '/' << dt.da << '/' << dt.yr;
>         return os;
>     }
>     
>     int main()
>     {
>         Date dt(5, 6, 92);
>         cout << dt;
>     }
>```    
> 
> Output
> 
> `5/6/92`

 
or operator overloading
 
```C++ 
template <typename T>
std::ostream& operator << ( std::ostream& outs, const point <T> & p )
{
  return outs << "(" << p.x << "," << p.y << ")";
}
 
//another
 
template <typename T>
std::string to_string(const T& value) {
  std::ostringstream os;
  os << value;
  return os.str();
}
 
int main()
{
  point p (2,-7);
  std::cout << "I have a point at " << p << ".\n";
  my_fn_which_takes_a_string( to_string(p) );
```



____
### String Stream

[StringStream](https://stackoverflow.com/questions/2462951/c-equivalent-of-stringbuffer-stringbuilder)



```c++
#include <string>
#include <iosteam.h>
cout << "HELLO WORLD"
cin>>readVal

#include <sstream>
std::stringstream ss;
ss << "my data " << 42;
std::string myString( ss.str() );
//or  return ss.str();
```

uses `cout` `cin`  and `<<` `>>`

printf and fprintf and scanf are available in **_<cstdio>_** / <stdio.h>



endl

//38
//39


### string manipulator

 std::setprecision(2);

- std::fixed
- std::strcat(str, str2);

- Defined in header *\<ios\>*
   - `boolalpha`
   - `noboolalpha`
      - switches between textual and numeric representation of booleans
   - `showbase`
   - `noshowbase`
      - controls whether prefix is used to indicate numeric base
   - `showpoint`
   - `noshowpoint`
      - controls whether decimal point is always included in floating-point representation
   - `showpos`
   - `noshowpos`
      - controls whether the + sign used with non-negative numbers
   - `skipws`
   - `noskipws`
      - controls whether leading whitespace is skipped on input
   - `uppercase`
   - `nouppercase`
      - controls whether uppercase characters are used with some output formats
   - `unitbuf`
   - `nounitbuf`
   - controls whether output is flushed after each operation
   - `internal`
   - `left`
   - `right`
      - sets the placement of fill characters
   - `dec`
   - `hex`
   - `oct`
      - changes the base used for integer I/O
   - `fixed`
   - `scientific`
   - `hexfloat` **(C++11)**
   - `defaultfloat` **(C++11)**
      - changes formatting used for floating-point I/O
- Defined in header *\<istream\>*
   - `ws` - consumes whitespace
- Defined in header *\<ostream\>*
   - `ends`  outputs '\0'
   - `flush` flushes the output stream
   - `endl` - outputs '\n' and flushes the output stream
   - `emit_on_flush` **(C++20)**
   - `no_emit_on_flush` **(C++20)**
      - controls whether a stream's basic_syncbuf emits on flush
   - `flush_emit` **(C++20)** - flushes a stream and emits the content if it is using a basic_syncbuf
- Defined in header *\<iomanip\>*
   - `resetiosflags` - clears the specified ios_base flags
   - `setiosflags`   - sets the specified ios_base flags
   - `setbase`- changes the base used for integer I/O
   - `setfill`- changes the fill character
   - `setprecision`- changes floating-point precision
   - `setw`- changes the width of the next input/output field
   - `get_money`- **(C++11)**- parses a monetary value
   - `put_money`- **(C++11)**- formats and outputs a monetary value
   - `get_time`- **(C++11)**- parses a date/time value of specified format
   - `put_time`- **(C++11)**- formats and outputs a date/time value according to the specified format
   - `quoted` - **(C++14)** - inserts and extracts quoted strings with embedded spaces
```c++
//40
// Program to read and display a line of input
//
// Program Input:    That's better
//
// Program Output:    You entered: That's better

#include    <iostream>
using namespace std;
int main()
{
    char line[81];
    char c;
    int i = 0;

    cin >> noskipws;        // use manipulator to recognize whitespace

    cout << "Please enter a line of text: ";

    while ( ( cin >> c ) && ( c != '\n' ) )
        line[i++] = c;

    line[i] = '\0';

    cout << "\n\nYou entered: " << line << endl;
    return 0;
}
```

#### Some good examples on the topic and a link

[Using Insertion Operators and Controlling Format | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/standard-library/using-insertion-operators-and-controlling-format?view=msvc-160)

> Output streams default to right-aligned text. To left-align the names in the previous example and right-align the numbers, replace the **`for`** loop as follows:
> 
> C++
> 
>     for (int i = 0; i <4; i++)
>         cout << setiosflags(ios::left)
>              << setw(6) << names[i]
>              << resetiosflags(ios::left)
>              << setw(10) << values[i] << endl;
>     

Output

    Zoot 1.23 
    Jimmy 35.36 
    Al 653.7 
    Stan 4358.24


```cpp
for (int i = 0; i <4; i++)
    cout << setiosflags(ios::left)
         << setw(6)
         << names[i]
         << resetiosflags(ios::left)
         << setw(10)
         << setprecision(1)
         << values[i]
         << endl;
```


    Zoot          1
    Jimmy     4e+01
    Al        7e+02
    Stan      4e+03


## Containers

![](https://media.geeksforgeeks.org/wp-content/uploads/20191111161536/Screenshot-from-2019-11-11-16-13-18.png)

![](https://media.geeksforgeeks.org/wp-content/uploads/20191111161627/Screenshot-from-2019-11-11-16-15-07.png)


 associative containers (map, set, etc): 

!!!Warning : The size() operation is O(n) time
    >    One implication of linear time size(): you should never write
    >
    >>    if (L.size() == 0)
    >>        ...
    >    
    >
    > Instead, you should write
    >>
    >>    if (L.empty())
    >>      ...
    >
    > [Source](https://gcc.gnu.org/onlinedocs/gcc-7.5.0/libstdc++/manual/manual/containers.html#sequences.list.size)
    
    Unordered Associative
         std::unordered_set and std::unordered_map 
 std::unordered_multiset and std::unordered_multimap 

[C++ Standard Library Containers | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/standard-library/stl-containers?view=msvc-160)


Vector Array, Deque, List, Forward_list (Singly linked list)
> Sequence Containers
> 
> Sequence containers ==maintain the ordering of inserted elements that you specify.==
> 
> A `vector` container behaves like an array, but can automatically grow as required. It is random access and contiguously stored, and length is highly flexible. For these reasons and more, `vector` is the preferred sequence container for most applications. When in doubt as to what kind of sequence container to use, start by using a vector! For more information, see [vector Class](https://docs.microsoft.com/en-us/cpp/standard-library/vector-class?view=msvc-160).
> 
> An `array` container has some of the strengths of `vector`, but the length isn't as flexible. For more information, see [array Class](https://docs.microsoft.com/en-us/cpp/standard-library/array-class-stl?view=msvc-160).
> 
> A `deque` (double-ended queue) container allows for fast insertions and deletions at the beginning and end of the container. It shares the random-access and flexible-length advantages of `vector`, but isn't contiguous. For more information, see [deque Class](https://docs.microsoft.com/en-us/cpp/standard-library/deque-class?view=msvc-160).
> 
> A `list` container is a doubly linked list that enables bidirectional access, fast insertions, and fast deletions anywhere in the container, but you can't randomly access an element in the container. For more information, see [list Class](https://docs.microsoft.com/en-us/cpp/standard-library/list-class?view=msvc-160).
> 
> A `forward_list` container is a singly linked list—the forward-access version of `list`. For more information, see [forward\_list Class](https://docs.microsoft.com/en-us/cpp/standard-library/forward-list-class?view=msvc-160).
> 
>  [Associative Containers](https://docs.microsoft.com/en-us/cpp/standard-library/stl-containers?view=msvc-160#associative-containers)
> 
> In associative containers, elements are inserted in a ==pre-defined order—for example, as sorted ascending. Unordered== associative containers are also available. The associative containers can be grouped into two subsets: ==maps== and ==sets.==
> 
> A `map`, sometimes referred to as a dictionary, consists of a key/value pair. The key is used to order the sequence, and the value is associated with that key. For example, a `map` might contain keys that represent every unique word in a text and corresponding values that represent the number of times that each word appears in the text. The unordered version of `map` is `unordered_map`. For more information, see [map Class](https://docs.microsoft.com/en-us/cpp/standard-library/map-class?view=msvc-160) and [unordered\_map Class](https://docs.microsoft.com/en-us/cpp/standard-library/unordered-map-class?view=msvc-160).
> 
> A `set` is just an ascending container of unique elements—the value is also the key. The unordered version of `set` is `unordered_set`. For more information, see [set Class](https://docs.microsoft.com/en-us/cpp/standard-library/set-class?view=msvc-160) and [unordered\_set Class](https://docs.microsoft.com/en-us/cpp/standard-library/unordered-set-class?view=msvc-160).
> 
> Both `map` and `set` only allow one instance of a key or element to be inserted into the container. If multiple instances of elements are required, use `multimap` or `multiset`. The unordered versions are `unordered_multimap` and `unordered_multiset`. For more information, see [multimap Class](https://docs.microsoft.com/en-us/cpp/standard-library/multimap-class?view=msvc-160), [unordered\_multimap Class](https://docs.microsoft.com/en-us/cpp/standard-library/unordered-multimap-class?view=msvc-160), [multiset Class](https://docs.microsoft.com/en-us/cpp/standard-library/multiset-class?view=msvc-160), and [unordered\_multiset Class](https://docs.microsoft.com/en-us/cpp/standard-library/unordered-multiset-class?view=msvc-160).
> 
> Ordered maps and sets support bi-directional iterators, and their unordered counterparts support forward iterators. For more information, see [Iterators](https://docs.microsoft.com/en-us/cpp/standard-library/iterators?view=msvc-160).

 
Queue, Priority Queue, Stack

 [C++ Standard Library Containers | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/standard-library/stl-containers?view=msvc-160)

> Container Adapters
> 
> A container adapter is a variation of a sequence or associative container that restricts the interface for simplicity and clarity. Container adapters don't support iterators.
> 
> A `queue` container follows FIFO (first in, first out) semantics. The first element _pushed_—that is, inserted into the queue—is the first to be _popped_—that is, removed from the queue. For more information, see [queue Class](https://docs.microsoft.com/en-us/cpp/standard-library/queue-class?view=msvc-160).
> 
> A `priority_queue` container is organized such that the element that has the highest value is always first in the queue. For more information, see [priority\_queue Class](https://docs.microsoft.com/en-us/cpp/standard-library/priority-queue-class?view=msvc-160).
> 
> A `stack` container follows LIFO (last in, first out) semantics. The last element pushed on the stack is the first element popped. For more information, see [stack Class](https://docs.microsoft.com/en-us/cpp/standard-library/stack-class?view=msvc-160).
> 
> Because container adapters don't support iterators, they can't be used with the C++ Standard Library algorithms. For more information, see [Algorithms](https://docs.microsoft.com/en-us/cpp/standard-library/algorithms?view=msvc-160).




### Vectors




[MSFT Vectors](https://docs.microsoft.com/en-us/cpp/standard-library/vector?view=msvc-160)

 !!!Note Note:
    The <vector> library also uses the #include <initializer_list> statement.
    /
    [See Initializer Lists for examples](#Initializer Lists)

[Vector Doc](https://www.cplusplus.com/reference/vector/vector/)  
> 
> (1) **empty container constructor (default constructor)** - Constructs an [empty](https://www.cplusplus.com/vector::empty) container, with no elements.
> 
> explicit vector (const allocator_type& alloc = allocator_type());
> 
> (2) **fill constructor**
> 
> Constructs a container with *n* elements. Each element is a copy of *val* (if provided).
> 
>     explicit vector (size_type n);
>   vector (size_type n, const value_type& val,
>      const allocator_type& alloc = allocator_type());
> 
> (3) **range constructor** --> Constructs a container with as many elements as the range `[first,last)`, with each element *emplace-constructed* from its corresponding element in that range, in the same order.
> 
> template <class InputIterator>
> vector (InputIterator first, InputIterator last,
> const allocator_type& alloc = allocator_type());
> 
> (4) **copy constructor (and** copying with allocator) --> Constructs a container with a copy of each of the elements in *x*, in the same order.
>                                                                                   
> vector (const vector& x);
> vector (const vector& x, const allocator_type& alloc);
> 
> 
> (5) **move constructor** (and moving with allocator) - Constructs a container that acquires the elements of *x*.
> - If *alloc* is specified and is different from *x*'s allocator, the elements are moved.Otherwise, no elements are constructed (their ownership is directly transferred).
> - *x* is left in an unspecified but valid state.
> 
> vector (vector&& x);
> vector (vector&& x, const allocator_type& alloc);
> 
> **(6) initializer list constructor** --> Constructs a container with a copy of each of the elements in *il*, in the same order.
> 
> vector (initializer_list<value_type> il,
> const allocator_type& alloc = allocator_type());

**Member functions**
____
-`(constructor)` - Construct vector (public member function )
-`(destructor)` - Vector destructor (public member function )
-`operator=` - Assign content (public member function )

Iterators:
-`begin` - Return iterator to beginning (public member function )
-`end` - Return iterator to end (public member function )
-`rbegin` - Return reverse iterator to reverse beginning (public member function )
-`rend` - Return reverse iterator to reverse end (public member function )
-`cbegin ` - Return const_iterator to beginning (public member function )
-`cend ` - Return const_iterator to end (public member function )
-`crbegin ` - Return const_reverse_iterator to reverse beginning (public member function )
-`crend ` - Return const_reverse_iterator to reverse end (public member function )

Capacity:
-`size` - Return size (public member function )
-`max_size` - Return maximum size (public member function )
-`resize` - Change size (public member function )
-`capacity` - Return size of allocated storage capacity (public member function )
-`empty` - Test whether vector is empty (public member function )
-`reserve` - Request a change in capacity (public member function )
-`shrink_to_fit ` - Shrink to fit (public member function )

Element access:
-`operator[]` - Access element (public member function )
-`at` - Access element (public member function )
-`front` - Access first element (public member function )
-`back` - Access last element (public member function )
-`data ` - Access data (public member function )

Modifiers:
-`assign` - Assign vector content (public member function )
-`push_back` - Add element at the end (public member function )
-`pop_back` - Delete last element (public member function )
-`insert` - Insert elements (public member function )
-`erase` - Erase elements (public member function )
-`swap` - Swap content (public member function )
-`clear` - Clear content (public member function )
-`emplace ` - Construct and insert element (public member function )
-`emplace_back ` - Construct and insert element at the end (public member function )

Allocator:
-`get_allocator` - Get allocator (public member function )

Non-member function overloads
-`relational operators` - Relational operators for vector (function template )
-`swap` - Exchange contents of vectors (function template )



#### Assign


1. range (1)-

        template <class InputIterator>
        void assign (InputIterator first, InputIterator last);

2. fill (2)-

        void assign (size_type n, const value_type& val);

3. initializer list (3)- 

        void assign (initializer_list<value_type> il);


```C++ 
    // vector assign
#include <iostream>
#include <vector>

int main ()
{
  std::vector<int> first;
  std::vector<int> second;
  std::vector<int> third;

//this is constructor 2- the fill version
  first.assign (7,100);  // 7 ints with a value of 100 

  std::vector<int>::iterator it;
  it=first.begin()+1;

  second.assign (it,first.end()-1); // the 5 central values of first

  int myints[] = {1776,7,4};
  third.assign (myints,myints+3);   // assigning from array.

  std::cout << "Size of first: " << int (first.size()) << '\n';
  std::cout << "Size of second: " << int (second.size()) << '\n';
  std::cout << "Size of third: " << int (third.size()) << '\n';
  return 0;
}
```


#### push_back
```c++
vector<double> mSequence;
std::vector<std::string> myVec = {"String 1", "String 2", "String 3"};
std::vector<std::string> myVec;
myVec.push_back("String 1");
myVec.push_back("String 2");
myVec.push_back("String 3");
mSequence.assign(args);
```


std::swap() swaps the values of two vectors.  

vector::swap() swaps two entire vectors. 


```c++
vector<int> v1 = {1, 2, 3}; 
vector<int> v2 = {4, 5, 6};

v1.swap(v2); 
vector<int> v1 = {1, 2, 3}; 
vector<int> v2 = {4, 5, 6}; 
// swapping the above two vectors 
// by traversing and swapping each element 
for(int i=0; i<3; i++) 
{ 
    swap(v1[i], v2[i]); 
} 

```

## Mixing Input Types

//41


---
---
## Control
---
- Iteration constructs
   - for
   - while
   - do-while
   - 'enhanced' for (C++ 11)
- Decision constructs
   - if-else
   - switch
   - conditional
- Other constructs
   - goto
   - break - used with switch.
   - continue - can be high risk

!!! question continue - said hed make a comment if used.

The articles on statements describe the following C++ keywords:

break
case
catch
continue
default
do

else
__except
__finally
for
goto

if
__if_exists
__if_not_exists
__leave
return

switch
throw
__try
try
while

[Overview of C++ Statements | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/overview-of-cpp-statements?view=msvc-160)

### labeled-statement


      identifier :  statement
      case constant-expression :  statement
      default :  statement

  There are three types of labeled statements. All use a colon to separate some type of label from the statement. The case and default labels are specific to case statements.



  ```cpp
  #include <iostream>
  using namespace std;

  void test_label(int x) {

      if (x == 1){
          goto label1;
      }
      goto label2;

  label1:
      cout << "in label1" << endl;
      return;

  label2:
      cout << "in label2" << endl;
      return;
  }

  int main() {
      test_label(1);  // in label1
      test_label(2);  // in label2
  }
  ```

#### The goto statement

  identifier label  declares a label. Only a goto statement can transfer control to an identifier label. 

  A label cannot appear by itself but must always be attached to a statement. If a label is needed by itself, place a null statement after the label.

  The label has function scope and cannot be redeclared within the function. However, the same name can be used as a label in different functions.



  ```cpp
  // labels_with_goto.cpp
  // compile with: /EHsc
  #include <iostream>
  int main() {
    using namespace std;
    goto Test2;

    cout << "testing" << endl;

    Test2:
        cerr << "At Test2 label." << endl;
  }

  //Output: At Test2 label.
  ```

  These latter two are specific to switch statements and arent really all that meaningful when talking of labels.

#### The case statement

  Labels that appear after the case keyword cannot also appear outside a switch statement. (This restriction also applies to the default keyword.) The following code fragment shows the correct use of case labels:



  > ```cpp
  > // Sample Microsoft Windows message processing loop.
  > switch( msg )
  > {
  > case WM_TIMER:    // Process timer event.
  > SetClassWord( hWnd, GCW_HICON, ahIcon[nIcon++] );
  > ShowWindow( hWnd, SW_SHOWNA );
  > nIcon %= 14;
  > Yield();
  > break;
  > 
  > case WM_PAINT:
  > // Obtain a handle to the device context.
  > // BeginPaint will send WM_ERASEBKGND if appropriate.
  > 
  > memset( &ps, 0x00, sizeof(PAINTSTRUCT) );
  > hDC = BeginPaint( hWnd, &ps );
  > 
  > // Inform Windows that painting is complete.
  > 
  > EndPaint( hWnd, &ps );
  > break;
  > 
  > case WM_CLOSE:
  > // Close this window and all child windows.
  > 
  > KillTimer( hWnd, TIMER1 );
  > DestroyWindow( hWnd );
  > if ( hWnd == hWndMain )
  > PostQuitMessage( 0 );  // Quit the application.
  > break;
  > 
  > default:
  > // This choice is taken for all messages not specifically
  > //  covered by a case statement.
  > 
  > return DefWindowProc( hWnd, Message, wParam, lParam );
  > break;
  > }
  > ```

#### default statement

 `default:`



### expression-statement

 #### Null statement

  The only non obvious addition here:


  The "null statement" is an expression statement with the expression missing. It is useful when the syntax of the language calls for a statement but no expression evaluation. It consists of a semicolon.

  Null statements are commonly used as placeholders in iteration statements or as statements on which to place labels at the end of compound statements or functions.

  The following code fragment shows how to copy one string to another and incorporates the null statement:

  
  ```cpp
    // null_statement.cpp
  char *myStrCpy( char *Dest, const char *Source )
  {
      char *DestStart = Dest;

      // Assign value pointed to by Source to
      // Dest until the end-of-string 0 is
      // encountered.
      while( *Dest++ = *Source++ )
          ;   // Null statement.

      return DestStart;
  }

  int main()
  {
  }
  ```
  
  
### compound-statement
### selection-statement

 #### if 

todo

 #### switch

 

        selection-statement:
            switch ( init-statementoptC++17 condition ) statement

        init-statement:
            expression-statement
            simple-declaration

        condition:
            expression
            attribute-specifier-seqopt decl-specifier-seq declarator brace-or-equal-initializer

        labeled-statement:
            case constant-expression : statement
            default : statement

None of the constants match the constants in the case labels; a default label is present. 	Control is transferred to the default label.

None of the constants match the constants in the case labels; no default label is present. 	Control is transferred to the statement after the switch statement.


Example below is a simple case. also illustrates `[[fallthrough]]`


    ```cpp
    int main()
    {
        int n = 5;
        switch (n)
        {

        case 1:
            a();
            break;
        case 2:
            b();
            d();
            [[fallthrough]]; // I meant to do this!
        case 3:
            c();
            break;
        default:
            d();
            break;
        }

        return 0;
    }
    ```

 `[[fallthrough]]` doesnt seem to be appropriate (error) in 

        case 1:
        case 2:
            <expr>

situations.  Must need an expression


 #### __if_exists

 !!!Warning Warning Microsoft Specific?

 [__if_exists Statement | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/if-exists-statement?view=msvc-160)

> Syntax
> 
>     __if_exists ( identifier ) {
>     statements
>     };
>     
> 
>  [Parameters](https://docs.microsoft.com/en-us/cpp/cpp/if-exists-statement?view=msvc-160#parameters)
> 
> _identifier_  -  The identifier whose existence you want to test.
> 
> _statements_  - > One or more statements to execute if _identifier_ exists.
> 
>  [Remarks](https://docs.microsoft.com/en-us/cpp/cpp/if-exists-statement?view=msvc-160#remarks)
> 
> Caution
> 
To achieve the most reliable results, use the **`__if_exists`** statement under the following constraints.

-   Apply the **`__if_exists`** statement to only simple types, not templates.

-   Apply the **`__if_exists`** statement to identifiers both inside or outside a class. Do not apply the **`__if_exists`** statement to local variables.

-   Use the **`__if_exists`** statement only in the body of a function. Outside of the body of a function, the **`__if_exists`** statement can test only fully defined types.

-   When you test for overloaded functions, you cannot test for a specific form of the overload.

>     
> 
> The complement to the **`__if_exists`** statement is the [\_\_if\_not\_exists](https://docs.microsoft.com/en-us/cpp/cpp/if-not-exists-statement?view=msvc-160) statement.
> 
> [Example](https://docs.microsoft.com/en-us/cpp/cpp/if-exists-statement?view=msvc-160#example)
> 
> Notice that this example uses templates, which is not advised.
> 
> ```C++
> 
>     // the__if_exists_statement.cpp
>     // compile with: /EHsc
>     #include <iostream>
>     
>     template<typename T>
>     class X : public T {
>     public:
>        void Dump() {
>           std::cout << "In X<T>::Dump()" << std::endl;
>     
>           __if_exists(T::Dump) {
>              T::Dump();
>           }
>     
>           __if_not_exists(T::Dump) {
>              std::cout << "T::Dump does not exist" << std::endl;
>           }
>        }
>     };
>     
>     class A {
>     public:
>        void Dump() {
>           std::cout << "In A::Dump()" << std::endl;
>        }
>     };
>     
>     class B {};
>     
>     bool g_bFlag = true;
>     
>     class C {
>     public:
>        void f(int);
>        void f(double);
>     };
>     
>     int main() {
>        X<A> x1;
>        X<B> x2;
>     
>        x1.Dump();
>        x2.Dump();
>     
>        __if_exists(::g_bFlag) {
>           std::cout << "g_bFlag = " << g_bFlag << std::endl;
>        }
>     
>        __if_exists(C::f) {
>           std::cout << "C::f exists" << std::endl;
>        }
>     
>        return 0;
>     }
>     
> ```
> [Output](https://docs.microsoft.com/en-us/cpp/cpp/if-exists-statement?view=msvc-160#output)
> 
> 
>       In X<T>::Dump() 
>       In A::Dump()
>       In X<T>::Dump()
>       T::Dump does not exist
>       g_bFlag = 1 C::f exists
> 

#### __if_not_exists

 !!!Warning Warning Microsoft Specific?

See Above

        __if_not_exists ( identifier ) {
             statements
        };

### iteration-statement
### jump-statement
### declaration-statement
### try-throw-catch


## Functions


Abstract Methods are methods for which
code definitions are not provided:
• Serve as building blocks for common behavior and
programmer interfaces
• Implemented as pure virtual functions in C++

• A pure virtual function is a virtual function with
no definition in the base class
• Pure virtual functions are commonly used in the
definition of abstract classes
• The syntax for declaring a pure virtual function is:
virtual return_type func_name( … parms … ) = 0;

The use of virtual functions allows programmers to
override inherited functions and to access the overridden
functions using base class pointers
• Virtual functions are declared by preceding the function
declaration with the keyword virtual
• The virtual keyword is only needed in the base class
declaration…it can be repeated in derived classes, but this
is not necessary
• If a derived class does not override a virtual function
definition, then the definitionin the most immediate base
class will be used


Virtual functions must be class member
functions---they cannot be friend functions
• Constructor functions cannot be virtual
• Destructor functions can be virtual
• The prototype for a virtual function must
match the base class prototype exactly, or it
will be considered as an overloaded
function by the compiler

Virtual functions may be accessed using the
‘.’ operator, just like any other member
function
• Virtual functions may also be accessed by
using base class pointers…the overridden
version of a function will be called in this
case (assuming that it exists)
8
• Concrete Methods are methods for which
code definitions are supplied
5

- Two basic types of functions
   - Ordinary functions --- like in C
   - Class member functions --- used in O-O programs
- A function definition (i.e., its code) or a function prototype must appear in the code before the function is invoked
- Normal practice is to use function prototypes
- Functions may have arguments & may return a value

//46

Functions need to appear before they are used, so a protoype has to occur.

```c++
#include    <iostream>
using namespace std;


//function prototypes
void print_message();        // A function prototype
float product( int , float ); // Another prototype

            void main()
            {
                float k = 13.54f;
                float num = 43.77f;

                print_message();        // Invoking functions
                cout << product( k , num );
            }

            // Function definitions

void print_message()
            {
                cout << "Where's the Beef?" << " \n";
            }

            float product ( int c , float f )
            {
                return ( c * f );
            }
```

Typically placed at top of source file or "included" via a pre-processor directive

When placed outside of a function scope is from point of placement to end of source file

When placed inside a function scope is from point of placement to end of function

```c++

#include    <iostream>
using namespace std;

void myfunc();        // Scope is source file
void message();

void main()
{
    message();
    myfunc();
}

void myfunc()
{
    int afunc();    // Scope is myfunc()

    message();
    cout << afunc();
}

int afunc() { return 99; }

void message() { cout << "HELLO \n"; }

```

### Passing Arguments and Returning

//49

//50


https://en.wikibooks.org/wiki/C%2B%2B_Programming/Classes/Member_Functions
### Using const With Function Arguments

If a value passed as a function argument should not be altered in the function, the argument should be declared as `const`

The C++ compiler will not allow const arguments to be modified by a function


Syntax for declaring pointer to a constant is:
        onst type* pointer_name;
• What’s pointed to can’t change, but the
pointer can point to something else
• The pointer can point to a constant or nonconstant
object, but cannot change the value
stored in the address pointed to

```c++
// Function taking const argument

void myfunc( int arg1, const int arg2 )
{
    arg1 = 2*arg1;        // OK
    arg2 += arg1;        // ERROR --- can't change arg2
}
```


contrast with : 
Constant Pointers
• Constant pointers are declared with the
following syntax
type* const pointer_name = &variable;
• A constant pointer must be initialized in its
declaration & the initial address cannot be
changed, but the value in the address can
• A constant pointer cannot point to a
constant object


### Factory Methods 

p1002 in book

The implementation approach used in this example is called an abstract factory because the type
of object created depends on which concrete derived class of the factory class is being used. A similar
pattern can be implemented in a single class instead of a class hierarchy. In that case, a single
create() method takes a type or string parameter from which it decides which object to create. For
example, a CarFactory class could provide a requestCar() method that takes a string representing
the type of car to build, and constructs the appropriate car.
___

____

### Structs Classes Unions

| param             | Structures | Classes    | Unions                    |
| ----------------- | ---------- | ---------- | ------------------------- |
| class key         | is struct  | is class   | is union                  |
| Default access    | is public  | is private | is public                 |
| usage constraints | No         | No         | only one member at a time |

_____
## Structs

        [template-spec] struct [ms-decl-spec] [tag [: base-list ]]
        {
            member-list
        } [declarators];
        [struct] tag declarators;                       

    *template-spec*\
Optional template specifications. For more information, refer to [Template Specifications](https://docs.microsoft.com/en-us/cpp/cpp/templates-cpp?view=msvc-160).

*struct*\
The **`struct`** keyword.

==*ms-decl-spec*==
     Microsoft (MSVC) Specific
Optional storage-class specification. For more information, refer to the [__declspec](https://docs.microsoft.com/en-us/cpp/cpp/declspec?view=msvc-160) keyword.

*tag*\
The type name given to the structure. The tag becomes a reserved word within the scope of the structure. The tag is optional. If omitted, an anonymous structure is defined. For more information, see [Anonymous Class Types](https://docs.microsoft.com/en-us/cpp/cpp/anonymous-class-types?view=msvc-160).

*base-list*\
Optional list of classes or structures this structure will derive its members from. See [Base Classes](https://docs.microsoft.com/en-us/cpp/cpp/base-classes?view=msvc-160) for more information. Each base class or structure name can be preceded by an access specifier ([public](https://docs.microsoft.com/en-us/cpp/cpp/public-cpp?view=msvc-160), [private](https://docs.microsoft.com/en-us/cpp/cpp/private-cpp?view=msvc-160), [protected](https://docs.microsoft.com/en-us/cpp/cpp/protected-cpp?view=msvc-160)) and the [virtual](https://docs.microsoft.com/en-us/cpp/cpp/virtual-cpp?view=msvc-160) keyword. See the member-access table in [Controlling Access to Class Members](https://docs.microsoft.com/en-us/cpp/cpp/member-access-control-cpp?view=msvc-160) for more information.

*member-list*\
List of structure members. Refer to [Class Member Overview](https://docs.microsoft.com/en-us/cpp/cpp/class-member-overview?view=msvc-160) for more information. The only difference here is that **`struct`** is used in place of **`class`**.

*declarators*\
Declarator list specifying the names of the structure. Declarator lists declare one or more instances of the structure type. Declarators may include initializer lists if all data members of the structure are **`public`**. Initializer lists are common in structures because data members are **`public`** by default. See [Overview of Declarators](https://docs.microsoft.com/en-us/cpp/cpp/declarations-and-definitions-cpp?view=msvc-160) for more information.

```cpp


#include <iostream>
using namespace std;

struct PERSON {   // Declare PERSON struct type
    int age;   // Declare member types
    long ss;
    float weight;
    char name[25];
} family_member;   // Define object of type PERSON

struct CELL {   // Declare CELL bit field
    unsigned short character  : 8;  // 00000000 ????????
    unsigned short foreground : 3;  // 00000??? 00000000
    unsigned short intensity  : 1;  // 0000?000 00000000
    unsigned short background : 3;  // 0???0000 00000000
    unsigned short blink      : 1;  // ?0000000 00000000
} screen[25][80];       // Array of bit fields

int main() {
    struct PERSON sister;   // C style structure declaration
    PERSON brother;   // C++ style structure declaration
    sister.age = 13;   // assign values to members
    brother.age = 7;
    cout << "sister.age = " << sister.age << '\n';
    cout << "brother.age = " << brother.age << '\n';

    CELL my_cell;
    my_cell.character = 1;
    cout << "my_cell.character = " << my_cell.character;
}
// Output:
// sister.age = 13
// brother.age = 7
// my_cell.character = 1


```


Binds types into a new type.  Structs are the same as classes, but all items are public.

```c++
struct Car{

   int year;
   int miles;
   std::string make;
   int getValue() const;
}

struct SpreadsheetCell
{
      void setValue(double inValue);
      double getValue() const;
   private: //can have methods and private members
      double mValue;
};



// Has a constructor
struct TempData2
{
    TempData2(double minimum, double maximum, double cur, int id, time_t t) :
       stationId{id}, timeSet{t}, current{cur}, maxTemp{maximum}, minTemp{minimum} {}
    int stationId;
    time_t timeSet;
    double current;
    double maxTemp;
    double minTemp;
};


//initialize nested values.
struct example {
    struct addr_t {
       uint32_t port;
    } addr;
    union {
       uint8_t a8[4];
       uint16_t a16[2];
    } in_u;
};
struct example ex = { // start of initializer list for struct example
                     { // start of initializer list for ex.addr
                        80 // initialized struct's only member
                     }, // end of initializer list for ex.addr
                     { // start of initializer-list for ex.in_u
                        {127,0,0,1} // initializes first element of the union
                     } };
```

If the nested initializer does not begin with an opening brace, only enough initializers from the list are taken to account for the elements or members of the member array, struct or union; any remaining initializers are left to initialize the next struct member:

```c++
struct example ex = {80, 127, 0, 0, 1}; // 80 initializes ex.addr.port
                                        // 127 initializes ex.in_u.a8[0]
                                        // 0 initializes ex.in_u.a8[1]
                                        // 0 initializes ex.in_u.a8[2]
                                        // 1 initializes ex.in_u.a8[3]
```
You declare a car by just defining it: `Car car;`

Then access each value with the `.` operator.

### typedef

Using `typedef` on a `struct` defines it for external linkage.

 
`typedef struct { /* ... */ } S;`

### Templates


[Templates (C++) | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/templates-cpp?view=msvc-160)

Templates are actually a type of struct.


```cpp
template <class T> T f(T t);// Overload f for all types
template <class T> class X {// Class with type parameter T
  X(T t); };                // A constructor
template <class T> X<T>::X(T t) {}
                            // Definition of constructor
X<int> x(3);                // An object of type "X of int"
template <class T, class U=T, int n=0>
                            // Template with default parameters
```


Some interesting template examples:
https://gcc.gnu.org/onlinedocs/gcc-7.5.0/libstdc++/manual/manual/containers_and_c.html

> The result is that if all your algorithm calls look like
> 
> std::transform(beginof(foo), endof(foo), beginof(foo), SomeFunction);
> 
> 
> then the type of foo can change from an array of ints to a vector of ints to a deque of ints and back again, without ever changing any client code.

```cpp

	std::transform(beginof(foo), endof(foo), beginof(foo), SomeFunction);
	
	// beginof
	template<typename T>
	inline typename vector<T>::iterator
	beginof(vector<T> &v)
	{ return v.begin(); }

	template<typename T, unsigned int sz>
	inline T*
	beginof(T (&array)[sz]) { return array; }

// endof
	template<typename T>
	inline typename vector<T>::iterator
	endof(vector<T> &v)
	{ return v.end(); }

	template<typename T, unsigned int sz>
	inline T*
	endof(T (&array)[sz]) { return array + sz; }

// lengthof
	template<typename T>
	inline typename vector<T>::size_type
	lengthof(vector<T> &v)
	{ return v.size(); }

	template<typename T, unsigned int sz>
	inline unsigned int
	lengthof(T (&)[sz]) { return sz; }
};

```



#### Useful Structures:

!!!Example Snippet: Get the index of an enum.  Basically casting an enum class back to int

    ```C++ 
    template <typename Enumeration>
	 static auto indexof(Enumeration const value)
	-> typename std::underlying_type<Enumeration>::type
	{
		return static_cast<typename std::underlying_type<Enumeration>::type>(value);
	}

    ```
    
!!!Example : another supposed to replicate toString()
    ```C++ 
        template <typename T>
        std::string to_string( const T& value )
        {
            std::ostringstream ss;
            ss << value;
            return ss.str();
        }
    ```
    
_____
## Unions

### Unions and bit fields 

to do.
    
    
## Classes 
---
https://www.learncpp.com/cpp-tutorial/const-class-objects-and-member-functions/

Abstract Classes are classes that are never instantiated
• Don’t contain enough properties and/or behavior to be useful on their own
• Used as building blocks for more useful classes---one way of reusing code
• Compilers enforce prevention of instantiation


Concrete Classes are classes that are instantiated


Const classes:


Similarly, instantiated class objects can also be made const by using the `const` keyword. Initialization is done via class constructors:

    const Date date1; // initialize using default constructor
    const Date date2(2020, 10, 16); // initialize using parameterized constructor
    const Date date3 { 2020, 10, 16 }; // initialize using parameterized constructor (C++11)

Once a const class object has been initialized via constructor, any attempt to modify the member variables of the object is disallowed, as it would violate the const-ness of the object. This includes both changing member variables directly (if they are public), or calling member functions that set the value of member variables. Consider the following class:

```C++ 
    class Something
{
public:
    int m_value;
 
    Something(): m_value{0} { }
 
    void setValue(int value) { m_value = value; }
    int getValue() { return m_value ; }
};
 
int main()
{
    const Something something{}; // calls default constructor
 
    something.m_value = 5; // compiler error: violates const
    something.setValue(5); // compiler error: violates const
 
    return 0;
}
```

---

```c++
class SpreadsheetCell
{
// Remainder of the class definition omitted for brevity
private:
double mValue = 0;
};


<in class.cpp>
#include "SpreadsheetCell.h"

void SpreadsheetCell::setValue(double inValue)
{
   mValue = inValue;
}

double SpreadsheetCell::getValue() const  //use const when values arent changing
{
   return mValue;
}
```

```c++
// in header file
class touchButton {
  public:
    touchButton(int x, int y, int xs, int ys, char use);
    void Draw();
    int x1;
    int y1;
    int xsize;
    int ysize;
    char use;
    boolean toggle = false;
};

```


```c++
//in body
  touchButton::touchButton(int x, int y, int xs, int ys, char myuse) {
    x1 = x;
    y1 = y;
    xsize = xs;
    ysize = ys;
    use = myuse;
  }

  void touchButton::Draw() {
    switch (use) {
      case 'p':
      //this is what I would like to have called from the main file.
      //myGLCD.drawRoundRect(x1, y1, x1+xsize, y1+ysize);
        break;

       default:
        break;
    }
  }

  ```


### Brief assignment
---

   `CircleClass(int x, int y, double radius) : mX(x), mY(y), mRadius(radius){}`
   
### Instantiation Overview 

[See Below](#Stack instantiation)

```c++
SpreadsheetCell myCell
SpreadsheetCell myCell(); // WRONG, but will compile.
myCell.setValue(6); //wont fail until <-here
//it must be like this:
SpreadsheetCell myCell;

SpreadsheetCell myCell(5), anotherCell (4);
```

The following are heap initialized.  They are not controlled by scope - eg not deleted when exit method.

```c++
//C++11 style
unique_ptr<SpreadsheetCell> myCellP{make_unique<SpreadsheetCell>()}
//C++14 style
auto myCellp = make_unique<SpreadsheetCell>();
// Equivalent to:
unique_ptr<SpreadsheetCell> myCellp(new SpreadsheetCell());
//<C++11 requires raw pointers.
// Or with raw pointers, without smart pointers (not recommended)
SpreadsheeCell* myCellp = new SpreadsheetCell();
SpreadsheetCell* myCellp = new SpreadsheetCell(5);
SpreadsheetCell* anotherCellp = nullptr;  //if not used immed. make `nullptr`
anotherCellp = new SpreadsheetCell(4);

delete myCellp;
myCellp = nullptr;
```

generally: 

for C++ 14+
`auto [varName] = make_unique<[Class]> ( [ctor params] );`

for C++11+
`unique_ptr< [Class] > [varName] (new [Class]( [ctor params] ));`

for < C++ 11
`[Class]* [varName] = new [Class]( [ctor params] )`

### Uniform Initialization
---

Structs and classes can be initiated similarly

```c++

stuct CircleStruct{
   int x,y ;
   double radius;
}
class CircleClass{
   public:
   CircleClass(int x, int y, double radius) : mX(x), mY(y), mRadius(radius){}

}
CircleStruct myCircle = {10, 10, 2.5}
CircleStruct myCircle4{10, 10, 2.5}
CircleClass myCircle2{10, 10, 2.5};
CircleClass myCircle3 = {10, 10, 2.5};
```


---
### Constructors
---

!!!NOTE C++ programmers sometimes call a constructor a ctor.

You cannot declare a constructor in terms of another:


```c++
SpreadsheetCell::SpreadsheetCell(string_view initialValue)
{
      SpreadsheetCell(stringToDouble(initialValue));
}
```

The code will compile, link, and run, but will not do what you expect. It creates a temp object then dumps it on return. You can use **Delegate constructors**
?Can you return it?

Default constructors are needed - a constructor with 0 params- especially **if the object may be used in an array**.  A default constructor is also required for classes that you want to store in Standard Library containers, such as `std::vector`.


```c++
SpreadsheetCell cells[3]; // FAILS compilation without default constructor
SpreadsheetCell* myCellp = new SpreadsheetCell[10]; // Also FAILS
```

You can circumvent this restriction for stack-based arrays by using initializers like these:

```c++
SpreadsheetCell cells[3] = {SpreadsheetCell(0), SpreadsheetCell(23),
**SpreadsheetCell(41)};**
```

There is an *implicit* default constructor, unless an explicit constructor is defined.  Then you need to explicitly declare the default if you want it available.  If you explicitly don't want a default constructor, and have no others, you need to explicitly delete it.


```c++
class MyClass
{
public:
   MyClass() = default;
   MyClass(double initialValue);
   MyClass(std::string_view initialValue);

   //explicit deletion of default.  No constructor.
public:
   MyClass() = delete;
};
```

---
#### Constructor Initializers
---

```c++
SpreadsheetCell::SpreadsheetCell(double initialValue): mValue(initialValue){}
```

Each element in the list is an initialization of a data member using function notation or the uniform initialization syntax, a call to a base class constructor (see Chapter 10), or a call to a delegated constructor, which is discussed later.

The initializer list is of format `:` then a comma separated list.



```c++
class SpreadsheetCell
{
   public:
      SpreadsheetCell(double d);
};

class SomeClass
{
   public:
      SomeClass();
   private:
      SpreadsheetCell mCell; //no value assigned, and no default
}; 

SomeClass::SomeClass() { } //err

SomeClass::SomeClass() : mCell(1.0) { } //now works/
```

!!!Warning ctor-initializers initialize data members in the order that they appear in the class definition, not their order in the ctor-initializer.

___

#### Copy Constructors
___

Will be created by default, unless you explicitly delete or declare a new one.  But the general form is here:

1. When a class object is created and initialized with an existing object of the class.
2. When a class object is passed by value as a function arg.
3. When a class is returned from a function.

This is (the default version) us a shallow copy

This is ok if the class only has primitive types as members or if the class does not have any pointers or reference types.

-if there is a pointer in the object, then copying object 1 to object 2, affecting object 1 will affect object 2 (if there is a pointer `int* a` for instance both objects point to the same `int * a`)                                                         



```c++
SpreadsheetCell(const SpreadsheetCell& src);
SpreadsheetCell(const SpreadsheetCell src); //doing this causes infinitate recursion- because it calls copy constructor here- to copy input to src...
// used like this in implementation
SpreadsheetCell::SpreadsheetCell(const SpreadsheetCell& src)
: mValue(src.mValue)
{
}
```

!!!Info Info: This is important because C++ is pass by Value, so by default Objects are copied before passing to functions or methods.

If **either** the `Copy` or `Copy Assignment` constructor or destructor is declared, the other *will not* be (given a default).

To add it back:


```c++
MyClass(const MyClass& src) = default; //copy constructor

MyClass& operator=(const MyClass& rhs) = default; //copy *assignment* constructor
```




Utilizing the copy constructor:

```c++
MyClass myClass(params);
MyClass copyClass(myClass); //creates 'copy class' from myclass
```

!!!Note where possible, pass by `const reference`.  Returning by Reference can be risky.  E.g. if you create a string in a method, and then return it by reference to avoid copying, the address  will be returned, but the underlying string will be dumped.

Explicitly declare or remove the copy constructor (e.g. you dont want an object copied.) This can be used to disallow passing the object by value,

```c++
SpreadsheetCell(const SpreadsheetCell& src) = default;
SpreadsheetCell(const SpreadsheetCell& src) = delete;
```
___

#### Copy assignment 
___

Works by setting one, existing object to entirely match the other.

```c++
Object o(params);
Object oo(params);
oo=o;
```

At the end both still exist, just oo matches o.  

This constructor is indicated by `operator=` because its an overloading of the `=` command.

The copy assignment constructor is *not* called in the following example.


```c++
Object new_obj = old_obj;
```

This is because its a declaration, and those are sent to the copy constructor. Had new_obj been already created - in another statement - it would call the `operator=` method.



```c++
class SpreadsheetCell
{
   public:
      SpreadsheetCell& operator=(const SpreadsheetCell& rhs);
      // Remainder of the class definition omitted for brevity
};
```

This returns a `reference` (unlike the copy constructor) so that it can be chained: `o1 = o2 = o3`.

Specifically, it has `    return *this;`.



```c++
myCell = anotherCell = aThirdCell;
//has the true form of 
myCell.operator=(anotherCell.operator=(aThirdCell));
//must guard against self assignment.
myCell=myCell 
//has weird effects if there are dynamic obj inside the obj.
SpreadsheetCell& SpreadsheetCell::operator=(const SpreadsheetCell& rhs)
{
   if (this == &rhs) {
      return *this;
   }
   //...
```

This works because `this` is actually a pointer to the object.  Likewise, `&rhs` is a reference.  Using the equality, we are actually comparing the value of the pointers - e.g. do they point to the same memory location, and are thus the same object. We return `*this` to de-reference the pointer and get the object itself.  This returns a reference to the object.

Explicit declaration or deletion is of the form below.

```c++
SpreadsheetCell& operator=(const SpreadsheetCell& rhs) = default;
// or
SpreadsheetCell& operator=(const SpreadsheetCell& rhs) = delete;
```

Returning an object, e.g. string, calls the copy constructor and passes an un-named obj back.  If on the other side you assign it to a string variable then its assignment operator is called.  So, two objects are temporarily created and destroyed. *Return Value Optimization* or *copy elision* tries to remove some of these inefficiencies.  


         Object obj(5);
         string s1 = obj.getString();

This calls the copy constructor for an un-named string, then calls the copy constructor for s1.  Not the assignment operator. A move constructor can also be used here and is more efficient.


constexpr, which indicates that the return value of the function is a constant value can be computed at compile time.constexpr, which indicates that the return value of the function is a constant value can be computed at compile **time.**
#### Move Constructors
----
##### Move Assignment

##### Move Construction

[C++ classes as value types | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/value-types-modern-cpp?view=msvc-160#value-types-and-move-efficiency)


```c++
#include <memory>
#include <stdexcept>
using namespace std;
// ...
class my_class {
    unique_ptr<BigHugeData> data;
public:
    my_class( my_class&& other )   // move construction
        : data( move( other.data ) ) { }
    my_class& operator=( my_class&& other )   // move assignment
    { data = move( other.data ); return *this; }
    // ...
    void method() {   // check (if appropriate)
        if( !data )
            throw std::runtime_error("RUNTIME ERROR: Insufficient resources!");
    }
};
```



#### Initializer Lists
___

[Brace initialization for classes, structs, and unions | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/initializing-classes-and-structs-without-constructors-cpp?view=msvc-160#initializer_list-constructors)

[initializer_list Class](https://docs.microsoft.com/en-us/cpp/standard-library/initializer-list-class?view=msvc-160)

initializer-list constructor is a constructor with an `std::initializer_list<T>` as first parameter,
without any additional parameters or with additional parameters having default values. Before
you can use the `std::initializer_list<T>` template, you need to include the `<initializer_list>`
header.

The below example shows several things.  Throwing errors.  Vectors. and initializer lists.

```c++
#inclue <initializer_list>
#inclue <vector>
#...

class EvenSequence
{
   public:
      
      EvenSequence(initializer_list<double> args)  //pass a list of doubles named args
      {
         if (args.size() % 2 != 0) {
            throw invalid_argument("initializer_list should "
               "contain even number of elements.");
         } //requires it to be even ?pointless? maybe example of throw


         mSequence.reserve(args.size());  //get the size and reserve space.
         for (const auto& value : args) {
            mSequence.push_back(value); //push onto vector stack.
         }
         //could replace the for loop with
         mSequence.assign(args);
      }

      void dump() const
      {
         for (const auto& value : mSequence) {
            cout << value << ", ";
         }
         cout << endl;
      }

   private:
      vector<double> mSequence; //define vector.
};
```





### Destructors 

[Destructors](https://www.learncpp.com/cpp-tutorial/destructors/)




---
### this keyword
---

```c++
void SpreadsheetCell::setValue(double value)
{
this->value = value;
}
```

a pointer to the object `this` is always passed to the method called.  `this` can be passed elsewhere, or used to disambiguate `value` above- which is both a data member and a function param.


```c++

//declared as a stand alone function:
void printCell(const SpreadsheetCell& cell)
{
   cout << cell.getString() << endl;
}

//in the object, pass a pointer to this.
void SpreadsheetCell::setValue(double value)
{
   this->value = value;
   printCell(*this);
}
```

!!!Warning Warning: When passing `this` elsewhere, make sure you pass the pointer `*this`.

      ALSO: Instead of writing a printCell() function, it would be more convenient
       to overload the << operator, as explained in Chapter 15. You can then use 
       the following line to print a SpreadsheetCell: 
            
               cout << *this << endl;

---
### Instantiation

---
#### Stack Instantiation
---


Space is reserved as soon as declared.  e.g. line 1.  Stack objects are destroyed as soon as they go out of scope (`{ }`).  This is why they don't need to be deleted.

```c++
SpreadsheetCell myCell, anotherCell;
myCell.setValue(6);
anotherCell.setString("3.2");
cout << "cell 1: " << myCell.getValue() << endl;
cout << "cell 2: " << anotherCell.getValue() << endl;
```
These you can access methods and public data members with the access dot `.` operator. 

On the stack, assuming a constructor that takes an int:: `SpreadsheetCell::SpreadsheetCell(int n);` you can call it by just putting the params in the descriptor.

`SpreadsheetCell myCell(5), anotherCell (4);`


!!!Warning You cannot explicitly call the Constructor, also when creating an object on the stack, omit parentheses for the default constructor.
      ```c++
      SpreadsheetCell myCell.SpreadsheetCell(5); //wrong
      ```

      or call it later:

      ```c++
      SpreadsheetCell myCell;
      myCell.SpreadsheetCell(5);

      ```

      Also, for default constructors, this looks right:

      ```c++
      SpreadsheetCell myCell(); // WRONG, but will compile.
      myCell.setValue(6); //wont fail until <-here
      //it must be like this:
      SpreadsheetCell myCell;
      ```
      Do not use parens () when calling the default.  
      
      This problem is commonly known as *the most vexing parse,* and it means that your compiler thinks the first line is actually a function declaration for a function with the name myCell that takes zero arguments and returns a SpreadsheetCell object.







---
#### Heap Instantiation
---

Heap objects are not destroyed when they go out of scope.  If the pointer to it is declared in a scope and that scope closes, you lose the pointer, and thus access to the object which causes a memory leak.  Use smart pointers or use delete and nullptr.

Below space is not reserved until `new` or `make_unique` is called.  e.g. if you split the declaration and assignment below- you would have an indeterminate pointer which is bad, but also no space reserved.

```c++
SpreadsheetCell* myCellp = new SpreadsheetCell();
myCellp->setValue(3.7);
cout << "cell 1: " << myCellp->getValue() <<
" " << myCellp->getString() << endl;
delete myCellp;
myCellp = nullptr;
```

Objects on the heap need to be referenced with the **arrow** operator `->` which combines dereference `*` and member access `.`

You can use this other way instead like this `(*myCellp).getValue()` for `myCellp->getValue()`

Must call `delete` on these (and not required but good practice to set that pointer to nullptr- as delete follows the pointer to the object.  Once its gone, the pointer still points there.), or use smart pointers:


```c++
//C++11 style
unique_ptr<SpreadsheetCell> myCellP{make_unique<SpreadsheetCell>()}
//C++14 style
auto myCellp = make_unique<SpreadsheetCell>();
// Equivalent to:
unique_ptr<SpreadsheetCell> myCellp(new SpreadsheetCell());
//<C++11 requires raw pointers.
// Or with raw pointers, without smart pointers (not recommended)
SpreadsheeCell* myCellp = new SpreadsheetCell();
SpreadsheetCell* myCellp = new SpreadsheetCell(5);
SpreadsheetCell* anotherCellp = nullptr;  //if not used immed. make `nullptr`
anotherCellp = new SpreadsheetCell(4);



delete myCellp;
myCellp = nullptr;

myCellp->setValue(3.7);
cout << "cell 1: " << myCellp->getValue() <<
" " << myCellp->getString() << endl;
```

These all are similar

```c++
//preC++11
SpreadsheetCell* myCellp = new SpreadsheetCell();
//AND
delete myCellp;
myCellp = nullptr;

//OR (C++14+)
auto myCellp = make_unique<SpreadsheetCell>();
//OR (C++11+)
unique_ptr<SpreadsheetCell> myCellp(new SpreadsheetCell());
```

Using Heap constructors:

```c++
//C++14+
auto smartCellp = make_unique<SpreadsheetCell>(4);

// Or with raw pointers, without smart pointers (not recommended)
SpreadsheetCell* myCellp = new SpreadsheetCell(5);
SpreadsheetCell* anotherCellp = nullptr;  //if not used immed. make `nullptr`
anotherCellp = new SpreadsheetCell(4);

//after
delete myCellp; myCellp = nullptr; 
delete anotherCellp; anotherCellp = nullptr;

//default constrictor is same as the first example.
//Requires C++14+
auto smartCellp = make_unique<SpreadsheetCell>();
// Or with a raw pointer (not recommended)
//used pre-C++11
SpreadsheetCell* myCellp = new SpreadsheetCell();
```

generally: 

for C++ 14+

`auto [varName] = make_unique<[Class]> ( [ctor params] );`

for C++11+

`unique_ptr< [Class] > [varName] (new [Class]( [ctor params] ));`

for < C++ 11

`[Class]* [varName] = new [Class]( [ctor params] )`



### Inheritence

from a single parent class --- this is called simple inheritance or single inheritance

inherits from more than one direct parent class it is called multiple inheritance.
 



**Syntax**

```c++
class derived_class_name : [access] base_class_name
{
    … class member declarations & definitions …
};
```


#### Multiple Inheritance

 MULTIPLE INHERITANCE is one way of building new objects from libraries of existing objects without reinventing the wheel
 
 Multiple inheritance involves defining a derived class that directly inherits members from more than one base class
The syntax for defining a class using multiple inheritance is:

```c++
class derived_class_name : access1 base_class1 , ... ,  accessN base_classN 
{
... Class Members ...
}
```

Keywords

`derived`-  over-rides
`final` prevents over-riding.


```c++
// With C++11 "final" can be used to prevent inheritance
class MyClass final
{
    …
} ;
// This will generate a compilation error
class Derived : public MyClass
{
    …
};

```

```c++
#include    <iostream>
using namespace std;

class base1
{
    protected:      int d1;
    public:         void show_base1() { cout << "base1 data is " << d1 << " \n"; }
};

class base2
{
    protected:    int d2;
    public:        void show_base2() { cout << "base2 data is " << d2 << "\n"; }
};

class derived_class : public base1 , public base2
{
    private:    int d_data;
    public:
            void set_derived() { d_data = d1 + d2; }
            void set_base( int I, int j ) { d1 = I; d2 = j; }
            void display_derived() { cout << "d_data is " << d_data << endl; }
};

// PROGRAM OUTPUT:    d_data is 50

#include    "classes.h"

int main()
{
    derived_class myobj;

    myobj.set_base( 20,30 );
    myobj.set_derived();
    myobj.display_derived();

    return 0;
}

```



#### Inheritence vs Aggregation

**Inheritance** should be used when a class is needed that does everything an existing class does, but has some special features---in the Unified Modeling Language this is called *generalization/specialization*

   **Inheritance** models an "`is a`" relationship --- a child class object is a parent class object with some additional specialized characteristics;  The "is a" test is a reliable one/

**Aggregation** is used when you want to build classes that contain other classes as components.  Containment is a synonym for Aggregation.




The access status of the inherited members (public, private, or protected) is determined by the 'access' specified … if 'access' is not specified the default is private

`Public` - everything is the same from the Derived class to the Base class.  Public is public and Protected=protected and Private is Private, which means that the Private Values are private to the base class
 
| Base:  ->     | *Public*      | *Private*   | *Protected*   |
| ------------- | ------------- | ----------- | ------------- |
| Access        | Derived       | Derived     | Derived       |
| ------------- | ------------- | -------     | ---------     |
| **Public**    | **Public**    | **Private** | **Protected** |
| **Private**   | **Private**   | **Private** | **Private**   |
| **Protected** | **Protected** | **Private** | **Protected** |

!!!Caution Private inheritance is really rarely a good choice.  The better choice is containment over this.

*    Prefer using the strict encapsulation principle when implementing inheritance
*    Prefer using private data members vs. protected data members to preserve strict encapsulation
*    Make data members private & use protected member functions to allow derived classes access to base class data members




#include    <iostream>
using namespace std;
class base
{
    private:        int x;
    protected:    getX() { return x; }
    public:        base() { x = 99; }
            void display() { cout << "x is " << x << endl;}
} ;
class derived : public base
{
    private:    int y;
    public:    derived () { y = 88 + getX() ; } 
        …
};


```c++
#include    <iostream>
using namespace std;

class base_class
{
    private:    int x;
            int y;

    public:    base_class() { x = 0; y = 0; }
            void set_base_data( int , int );
            void display_base();
};

class derived_class : public base_class        // Specify inheritance
{
    private:    int d_data;
    public:    derived_class() { d_data = 0; }
            void set_derived_data( int );
            void display_derived();
};

// PROGRAM OUTPUT:    x is 22 : y is 33
//                    d_data is 10

int main()
{
    derived_class myobj;                // Declare a derived class object
    myobj.set_base_data( 22 , 33 );    // Access base class private data via 
                                    // public function
    myobj.display_base();                // Display base class data
    myobj.set_derived_data( 10 );        // Access derived class private data
    myobj.display_derived();            // Display derived class private data
    return 0;
}

```


```c++
// This program defines a derived class that does nothing but use the 
// inherited respond() function.

#include    <iostream>
using namespace std;

class robot
{
    public: void respond( char *s ) { cout << s << endl; }
};

class defiant_robot : public robot
{
    public:
};
// This program defines a derived class that does nothing but use the 
// inherited respond() function.
//
// PROGRAM OUTPUT:        Hello
//                        Whut!!


#include    "robots.h"

int main()
{
    robot r2d2;
    r2d2.respond("Hello");
    defiant_robot Butch;
    Butch.respond("Whut!!");        // subclass inherits respond()

    return 0;
}
// Program illustrating derived class overriding an inherited function
//
// The defiant_robot class overrides inherited respond() function by
// defining its own respond() function with identical signature
```

Derived Classes Override or Shadow the Inherited Members.

```c++
#include    <iostream>
using namespace std;

class robot
{
    public: void respond( char * s ) { cout << s << "\n"; }
};

class defiant_robot : public robot
{
    public: void respond( char * s ) { cout << "I Refuse \n"; }
};

```

### ToString Methods 

Strings#Class toString() methods)


____

### Base Class Pointers

<!-- To Do  -->
____


### Interfaces

<!-- ToDO -->


### Functions and Methods


`Abstract Methods` are methods for which
code definitions are not provided:
    • Serve as building blocks for common behavior and
    programmer interfaces
    • Implemented as pure **virtual** functions in C++
   
    - A *pure virtual function* is a virtual function with no definition in the base class
        • Pure virtual functions are commonly used in the definition of abstract classes

•   The syntax for declaring a pure virtual function is:
            
            virtual return_type func_name( … parms … ) = 0;

It is possible to provide a definition for a pure virtual function in the base class
• This allows code that you may want derived is classes to share to be defined while still requiring
the base class to be an abstract class 
 Derived classes must explicitly implement code in order to be considered concrete classes




• `Concrete Methods` are methods for which
code definitions are supplied

Optional parts of a function declaration are:

`constexpr`,  which indicates that the return value of the function is a constant value *can be computed at compile time.*
    
    
```C++ 
    constexpr float exp(float x, int n)
{
    return n == 0 ? 1 :
        n % 2 == 0 ? exp(x * x, n / 2) :
        exp(x * x, (n - 1) / 2) * x;
};
```

Its **linkage specification,** `extern` or `static`.


`inline`, which instructs the compiler to replace every call to the function with the function code itself. inlining can help performance in scenarios where a function executes quickly and is invoked repeatedly in a performance-critical section of code.


A `noexcept` expression, which specifies whether or not the function can throw an exception. In the following example, the function does not throw an exception if the is_pod expression evaluates to true.

\cpp






___



## Data structures

### Lists

(using vectors)

C++ vectors are very similar to Python lists, i.e. they provide containers for a list/array of values that can be accessed by their index. The big difference between Python lists and C++ vectors is that C++ vectors can only hold values of a single type, which must be specified when you create the vector. For example, create the source file vector.cpp and copy in the below code;

[chryswoods.com | Lists and Dictionaries](https://chryswoods.com/beginning_c++/lists.html)


### Vectors



### Dictionaries

(Using Map)

[chryswoods.com | Lists and Dictionaries](https://chryswoods.com/beginning_c++/lists.html)

Like Python, C++ has a great dictionary type, which in C++ is called a map. This is a container that stores values that are indexed by a key. C++ maps are less versatile than Python dictionaries as all of the keys have to be the same type, and all of the values have to be the same type. For example, copy the following into the source file map.cpp;


### Map

```C++ 
#include <iostream>
#include <map>
#include <string>

int main()
{
    //create a map that stores strings indexed by strings
    std::map<std::string, std::string> m;

    //add some items to the map
    m["cat"] = "mieow";
    m["dog"] = "woof";
    m["horse"] = "neigh";
    m["fish"] = "bubble";

    //now loop through all of the key-value pairs
    //in the map and print them out
    for ( auto item : m )
    {
        //item.first is the key
        std::cout << item.first << " goes ";

        //item.second is the value
        std::cout << item.second << std::endl;
    }

    //finally, look up the sound of a cat
    std::cout << "What is the sound of a cat? " << m["cat"] 
              << std::endl;

    return 0;
}
```


- You need to include the <map> header file as std::map<> is part of the C++ standard library.
- You must specify the type of the key and the type of the value, between the angle brackets, e.g. std::map<int,double> would be a map that uses integer keys to look up double values.
- Like Python, you look up items in the map using square brackets, e.g. m["cat"] looks up the value for "cat".
- Like Python, if the item doesn't exist, then it is created and assigned, e.g. m["cat"] = "mieow" sets the value associated with the key cat to mieow.
- Unlike Python, there is no .insert() function. You can only add items using lookup.
- Unlike Python, there is no .keys() or .values() function. You have to write these yourself…
- When you loop through the values in a map, the iterated item is a key-value pair. In for ( auto item : m ), the type of item is a key-value pair. The key is the first item in the pair item.first, while the value is the second item item.second.
- All keys in a map have to have the same type, and all values in a map have to have the same type, buy keys and values don't have to have the same type. For example, std::map<float,std::string> creates a map in which all keys are floats, and all values are strings.

```C++ 
    #include <iostream>
#include <string>
#include <map>
#include <vector>

int main()
{
    //declare the map that uses a person's name as a key, and looks
    //up a map that stores the person's weight and height
    std::map< std::string, std::map<std::string,float> > database;

    //let's first put the data in three vectors
    std::vector<std::string> names = { "James", "Jane", "Janet", "John" };
    std::vector<float> heights = { 1.7, 1.8, 1.5, 1.4 };
    std::vector<float> weights = { 75.4, 76.5, 56.8, 52.0 };

    //now put all of the data into the database
    for (int i=0; i<names.size(); ++i)
    {
        std::map<std::string,float> data;

        data["height"] = heights[i];
        data["weight"] = weights[i];

        database[names[i]] = data;
    }

    //now print out the entire database
    for ( auto item : database )
    {
        //print out the name
        std::cout << item.first << " : ";

        //now print out all of the data about the person
        for ( auto data : item.second )
        {
            std::cout << data.first << "=" << data.second << " ";
        }

        std::cout << std::endl;
    }

    return 0;
}
```



## Error Handling 




```c++
EvenSequence(initializer_list<double> args)
{
if (args.size() % 2 != 0) {
throw invalid_argument("initializer_list should "
"contain even number of elements.");
}
mSequence.assign(args);
}
//EvenSequence objects can be constructed as follows:
EvenSequence p1 = {1.0, 2.0, 3.0, 4.0, 5.0, 6.0};
p1.dump();
try {
EvenSequence p2 = {1.0, 2.0, 3.0};
// } catch (const invalid_argument& e) {
// cout << e.what() << endl;
}
```

This is an example of a stack trace.

For Linux and I believe Mac OS X, if you're using gcc, or any compiler that uses glibc, you can use the `backtrace()` functions in _execinfo.h_ to print a stacktrace and exit gracefully when you get a segmentation fault. Documentation can be found in the libc manua

Here is a high level discussion on stacktraces: 

[c++ - How to automatically generate a stacktrace when my program crashes - Stack Overflow](https://stackoverflow.com/questions/77005/how-to-automatically-generate-a-stacktrace-when-my-program-crashes)


```C++ 
#include <stdio.h>
#include <execinfo.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>


void handler(int sig) {
  void *array[10];
  size_t size;

  // get void*'s for all entries on the stack
  size = backtrace(array, 10);

  // print out all the frames to stderr
  fprintf(stderr, "Error: signal %d:\n", sig);
  backtrace_symbols_fd(array, size, STDERR_FILENO);
  exit(1);
}

void baz() {
 int *foo = (int*)-1; // make a bad pointer
  printf("%d\n", *foo);       // causes segfault
}

void bar() { baz(); }
void foo() { bar(); }


int main(int argc, char **argv) {
  signal(SIGSEGV, handler);   // install our handler
  foo(); // this will call foo, bar, and baz.  baz segfaults.
}
```

### C library to handle signals

`<csignal>` `(signal.h)`


Functions

- `signal` - Set function to handle signal (function )
- `raise` - Generates a signal (function )

Types

- `sig_atomic_t` - Integral type (type )

Macro constants

- int (signals)
    - `SIGABRT` : **(Signal Abort)** - Abnormal termination, such as is initiated by the abort function.
    - `SIGFPE` : **(Signal Floating-Point Exception)** - Erroneous arithmetic operation, such as zero divide or an operation resulting in overflow (not necessarily with a floating-point operation).
    - `SIGILL` : **(Signal Illegal Instruction)** - Invalid function image, such as an illegal instruction. This is generally due to a corruption in the code or to an attempt to execute data.
    - `SIGINT` : **(Signal Interrupt)** - Interactive attention signal. Generally generated by the application user.
    - `SIGSEGV` : **(Signal Segmentation Violation)** - Invalid access to storage: When a program tries to read or write outside the memory it has allocated.
    - `SIGTERM` : **(Signal Terminate)** - Termination request sent to program.
functions (handlers)
    - `SIG_DFL` :  - Default handling: The signal is handled by the default action for that particular signal.
    - `SIG_IGN` :  - Ignore Signal: The signal is ignored.
    - `SIG_ERR` :  - Special return value indicating failure.


## IO Operations

![IO](http://www.cplusplus.com/img/iostream.gif)

[StringStream](https://stackoverflow.com/questions/2462951/c-equivalent-of-stringbuffer-stringbuilder)



```c++
#include <string>
#include <iosteam.h>
cout << "HELLO WORLD"
cin>>readVal

#include <sstream>
std::stringstream ss;
ss << "my data " << 42;
std::string myString( ss.str() );
//or  return ss.str();
```


___

## Setup (VS Code)
___
___

### Keybindings

```json
  {
    "key": "ctrl+alt+d z",
    "command": "editor.action.insertSnippet",
    "when": "editorTextFocus && editorLangId == 'cpp'",
    "args": {
      "name": "Debug2",
      "langId": "cpp",
      // "snippet": "helloo"
    }
  },
  {
    "key": "ctrl+alt+d x",
    "command": "editor.action.insertSnippet",
    "when": "editorTextFocus && editorLangId == 'cpp'",
    "args": {
      "name": "Debug NoLevel",
      "langId": "cpp",
      // "snippet": "helloo"
    }
  },
```

### Shortcuts

### Snippets

```json
    "Debug NoLevel": {
        "prefix": "dbg",
        "body": "if (DEBUG_EN) Serial.println(\"$1\");\n$0",
        "description": "Enter a statement to print to the console.  Expects DEBUG_EN define, with 0 disabled"
    },
    "Debug": {
        "prefix": "dbglvl",
        "body": [
            "if (DEBUG_EN >= ${1: 1 , 2 , 3 , 4 } ) Serial.println(\"$2\");",
            "$0"
        ],
        "description": "Enter a statement to print to the console.  Expects DEBUG_EN define, with 0 disabled"
    },
    "Debug2": {
        "prefix": "dbgdet",
        "body": [
            "if (DEBUG_EN) Serial.println(\"${1:$TM_CURRENT_WORD}, $TM_LINE_NUMBER:$TM_FILENAME = \" + $1);",
            "$0"
        ],
        "description": "Enter a statement to print to the console.  Expects DEBUG_EN define, with 0 disabled"
    }
}
```

### Settings

```json

```


### Todo place me:


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

```C++ 
    /* snprintf example */
#include <stdio.h>

int main ()
{
  char buffer [100];
  int cx;

  cx = snprintf ( buffer, 100, "The half of %d is %d", 60, 60/2 );

  if (cx>=0 && cx<100)      // check returned value

    snprintf ( buffer+cx, 100-cx, ", and the half of that is %d.", 60/2/2 );

  puts (buffer);

  return 0;
}
```



- `sprintf` - Write formatted data to string (function )

```C++ 
    /* sprintf example */
#include <stdio.h>

int main ()
{
  char buffer [50];
  int n, a=5, b=3;
  n=sprintf (buffer, "%d plus %d is %d", a, b, a+b);
  printf ("[%s] is a string %d chars long\n",buffer,n);
  return 0;
}
```



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


### c

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


### <cstring> (string.h)

C Strings
This header file defines several functions to manipulate C strings and arrays.

Functions
Copying:

- `memcpy`- Copy block of memory (function )
- `memmove`- Move block of memory (function )
- `strcpy`- Copy string (function )
- `strncpy`- Copy characters from string (function )

Concatenation:

- `strcat`- Concatenate strings (function )
- `strncat`- Append characters from string (function )

Comparison:

- `memcmp`- Compare two blocks of memory (function )
- `strcmp`- Compare two strings (function )
- `strcoll`- Compare two strings using locale (function )
- `strncmp`- Compare characters of two strings (function )
- `strxfrm`- Transform string using locale (function )

Searching:

- `memchr`- Locate character in block of memory (function )
- `strchr`- Locate first occurrence of character in string (function )
- `strcspn`- Get span until character in string (function )
- `strpbrk`- Locate characters in string (function )
- `strrchr`- Locate last occurrence of character in string (function )
- `strspn`- Get span of character set in string (function )
- `strstr`- Locate substring (function )
- `strtok`- Split string into tokens (function )

Other:

- `memset`- Fill block of memory (function )
- `strerror`- Get pointer to error message string (function )
- `strlen`- Get string length (function )

Macros

- `NULL`- Null pointer (macro )

Types

- `size_t`- Unsigned integral type (type )

<ctime> (time.h)
C Time Library
This header file contains definitions of functions to get and manipulate date and time information.

Functions
Time manipulation

- `clock`- Clock program (function )
- `difftime`- Return difference between two times (function )
- `mktime`- Convert tm structure to time_t (function )
- `time`- Get current time (function )

Conversion

- `asctime`- Convert tm structure to string (function )
- `ctime`- Convert time_t value to string (function )
- `gmtime`- Convert time_t to tm as UTC time (function )
- `localtime`- Convert time_t to tm as local time (function )
- `strftime`- Format time as string (function )

Macro constants

- `CLOCKS_PER_SEC`- Clock ticks per second (macro )
- `NULL`- Null pointer (macro )

types

- `clock_t`- Clock type (type )
- `size_t`- Unsigned integral type (type )
- `time_t`- Time type (type )
- `struct tm`- Time structure (type )


header
<cctype> (ctype.h)
Character handling functions

[<cctype> (ctype.h) - C++ Reference](https://www.cplusplus.com/reference/cctype/)

- `isalnum`- Check if character is alphanumeric (function )
- `isalpha`- Check if character is alphabetic (function )
- `isblank`- Check if character is blank (function )
- `iscntrl`- Check if character is a control character (function )
- `isdigit`- Check if character is decimal digit (function )
- `isgraph`- Check if character has graphical representation (function )
- `islower`- Check if character is lowercase letter (function )
- `isprint`- Check if character is printable (function )
- `ispunct`- Check if character is a punctuation character (function )
- `isspace`- Check if character is a white-space (function )
- `isupper`- Check if character is uppercase letter (function )
- `isxdigit`- Check if character is hexadecimal digit (function )
    
Character conversion functions
Two functions that convert between letter cases:

- `tolower`- Convert uppercase letter to lowercase (function )
- `toupper` - Convert lowercase letter to uppercase (function )

    <cstdlib> (stdlib.h)
C Standard General Utilities Library
This header defines several general purpose functions, including dynamic memory management, random number generation, communication with the environment, integer arithmetics, searching, sorting and converting.

Functions
String conversion

- `atof` - Convert string to double (function )
- `atoi` - Convert string to integer (function )
- `atol` - Convert string to long integer (function )
- `atoll` - Convert string to long long integer (function )
- `strtod` - Convert string to double (function )
- `strtof` - Convert string to float (function )
- `strtol` - Convert string to long integer (function )
- `strtold` - Convert string to long double (function )
- `strtoll` - Convert string to long long integer (function )
- `strtoul` - Convert string to unsigned long integer (function )
- `strtoull` - Convert string to unsigned long long integer (function )

Pseudo-random sequence generation

- `rand` - Generate random number (function )
- `srand` - Initialize random number generator (function )

Dynamic memory management

- `calloc` - Allocate and zero-initialize array (function )
- `free` - Deallocate memory block (function )
- `malloc` - Allocate memory block (function )
- `realloc` - Reallocate memory block (function )

Environment

- `abort` - Abort current process (function )
- `atexit` - Set function to be executed on exit (function )
- `at_quick_exit` - Set function to be executed on quick exit (function )
- `exit` - Terminate calling process (function )
- `getenv` - Get environment string (function )
- `quick_exit` - Terminate calling process quick (function )
- `system` - Execute system command (function )
- `_Exit` - Terminate calling process (function )

Searching and sorting

- `bsearch` - Binary search in array (function )
- `qsort` - Sort elements of array (function )

Integer arithmetics

- `abs` - Absolute value (function )
- `div` - Integral division (function )
- `labs` - Absolute value (function )
- `ldiv` - Integral division (function )
- `llabs` - Absolute value (function )
- `lldiv` - Integral division (function )

Multibyte characters

- `mblen` - Get length of multibyte character (function )
- `mbtowc` - Convert multibyte sequence to wide character (function )
- `wctomb` - Convert wide character to multibyte sequence (function )

Multibyte strings

- `mbstowcs` - Convert multibyte string to wide-character string (function )
- `wcstombs` - Convert wide-character string to multibyte string (function )

Macro constants

- `EXIT_FAILURE` - Failure termination code (macro )
- `EXIT_SUCCESS` - Success termination code (macro )
- `MB_CUR_MAX` - Maximum size of multibyte characters (macro )
- `NULL` - Null pointer (macro )
- `RAND_MAX` - Maximum value returned by rand (macro )

Types

- `div_t` - Structure returned by div (type )
- `ldiv_t` - Structure returned by ldiv (type )
- `lldiv_t` - Structure returned by lldiv (type )
- `size_t` - Unsigned integral type (type )
<cstring> (string.h)
C Strings
This header file defines several functions to manipulate C strings and arrays.

Functions
Copying:

- `memcpy` - Copy block of memory (function )
- `memmove` - Move block of memory (function )
- `strcpy` - Copy string (function )
- `strncpy` - Copy characters from string (function )

Concatenation:

- `strcat` - Concatenate strings (function )
- `strncat` - Append characters from string (function )

Comparison:

- `memcmp` - Compare two blocks of memory (function )
- `strcmp` - Compare two strings (function )
- `strcoll` - Compare two strings using locale (function )
- `strncmp` - Compare characters of two strings (function )
- `strxfrm` - Transform string using locale (function )

Searching:

- `memchr` - Locate character in block of memory (function )
- `strchr` - Locate first occurrence of character in string (function )
- `strcspn` - Get span until character in string (function )
- `strpbrk` - Locate characters in string (function )
- `strrchr` - Locate last occurrence of character in string (function )
- `strspn` - Get span of character set in string (function )
- `strstr` - Locate substring (function )
- `strtok` - Split string into tokens (function )

Other:

- `memset` - Fill block of memory (function )
- `strerror` - Get pointer to error message string (function )
- `strlen` - Get string length (function )

Macros

- `NULL` - Null pointer (macro )

Types

- `size_t` - Unsigned integral type (typ

## RegEx 
### Regular Expressions

[Link](https://docs.microsoft.com/en-us/cpp/standard-library/regular-expressions-cpp?view=msvc-160)



## Windows Specific Information

### Windows Console

[Windows Console](https://docs.microsoft.com/en-us/windows/console/console-functions)

[Writing to the Console](https://docs.microsoft.com/en-us/windows/console/reading-and-writing-blocks-of-characters-and-attributes)

![](O:\OneDrive\Programming\.Sync\VS Code\md\res\03\18\000018.png)

Higher than 255 it does appear to repeat

```C++ 
    HANDLE hConsole;
const int COLORMODE_0 = 1;
	int oldMode = _setmode ( _fileno ( stdout ), _O_U16TEXT );

	int k;
	hConsole = GetStdHandle ( STD_OUTPUT_HANDLE );

```

