# Python Notes

[[TOC]]

Online Docs:

!!!tip [UNOFFICIAL Windows Binaries for popular Python Libs](https://www.lfd.uci.edu/~gohlke/pythonlibs/#pycurl)

2.7:

3.7:
[Official Tutorial](https://docs.python.org/3/tutorial/index.html)

[Library Reference](https://docs.python.org/3/library/index.html) - Good
[Language Reference](https://docs.python.org/3/reference/index.html) -describes the syntax and “core semantics” of the language
[Python Setup and Usage](https://docs.python.org/3/using/index.html)

[Python Quick How-To](https://docs.python.org/3/howto/index.html)

[Curses](https://docs.python.org/3/howto/curses.html)

[RexExp](https://docs.python.org/3/howto/regex.html)

[Installing Modules](https://docs.python.org/3/installing/index.html)

[DataModel](https://docs.python.org/3.8/reference/datamodel.html)

Good-
[Official- Brief Tour of the Std Library](https://docs.python.org/3.8/tutorial/stdlib.html)
(https://docs.python.org/3.8/tutorial/stdlib2.html)

## Troubleshooting

 fixed once I fixed register variable HKEY_CLASSES_ROOT\Applications\python.exe\shell\open\command to proper location of Python interpreter e.g "C:\Python36\python.exe" "%1" %*

## BASICS

On linux it is stored in `/usr/local/bin/python<maj-ver>.<min-ver>` Or it could be specified in anohter dir.

You can add it to path on Windows `set path=%path%;C:\python37`.

You can exit the interpreter `Ctrl + Z` on Windows or `Ctrl + D` on Unix.

The first line can be a shebang statement if necessary or an encoding statement.

```
#!/usr/bin/env python3
#-*-coding: encoding-*-
```

### Install Packages

The package library is at [PyPi](https://pypi.org) and [Text Only](https://pypi.org/simple/)

From command line run `py -3 -m pip install` [filename].  See below for `py` syntax.

```batch
py -3 -m pip install --upgrade pip
py -2 -m pip install --upgrade pip
```

`py -3 -m pip install` py is the Windows Launcher, that helps launch the correct version, -3 selects the version, -m says to run the following package name as a script (`pip`).

Thought there was something special about proxies, with the work computer, but it appears to be working fine with just the environment variables set.

pypi.org lists the packages.  The source for the simple view - <https://pypi.org/simple/>

`pip install -Iv http://sourceforge.net/projects/mysql-python/files/mysql-python/1.2.2/MySQL-python-1.2.2.tar.gz/download`

good options

-v (verbose)

Install suboptions

- `-I` (--ignore-installed)
- `--force-reinstall`
- `progress-bar [off|_on_|ascii|pretty|emoji]`
- (get a specific version) pip install notebook==5.7.5)

Uninstall Options
  `-r`, `--requirement <file>`    Uninstall all the packages listed in the given requirements file.  This option can be used multiple times.
  `-y`, `--yes`                   Don't ask for confirmation of uninstall deletions.

### Find out where something is installed

`pip show sympy`

the show command lists the directory.

Allegedly things are saved in %APPDATA%\pip or something. But not for mine.con
## Environments

### Virtualenv

Syntax to make a virtual env in the current directory.

`virtualenv --python="c:/Python37/python.exe" .\`
### virtualenv

Virtualenv package - creates a new environment where you can add packages for the program.

!!!code start with `

`virtualenv [OPTIONS] ENV_DIR`- Where ENV_DIR is an absolute or relative path to a directory to create the virtual environment in.

__Options__ for venv

- `--version` - show program’s version number and exit
- `-h`, `--help` - how this help message and exit
- `-v`, `--verbose` - Increase verbosity.
- `-q`, `--quiet` - Decrease verbosity.
- `-p PYTHON_EXE`, `--python=PYTHON_EXE` - The Python interpreter to use, e.g., `–python=python2.5` will use the python2.5 interpreter to create the new environment. The default is the interpreter that `virtualenv` was installed with (like `/usr/bin/python`)
- `--clear` - Clear out the non-root install and start from scratch.
- `--system-site-packages` - Give the virtual environment access to the global site-packages.
- `--always-copy` - Always copy files rather than symlinking.
- `--relocatable` - Make an EXISTING virtualenv environment relocatable. This fixes up scripts and makes all .pth files relative.
- `--unzip-setuptools` - Unzip Setuptools when installing it.
- `--no-setuptools` - Do not install setuptools in the new virtualenv.
- `--no-pip` - Do not install pip in the new virtualenv.
- `--no-wheel` - Do not install wheel in the new virtualenv.
- `--extra-search-dir=DIR` - Directory to look for setuptools/pip distributions in. This option can be specified multiple times.
- `--prompt=PROMPT` - Provides an alternative prompt prefix for this environment.
- `--download` - Download preinstalled packages from PyPI.
- `--no-download` - Do not download preinstalled packages from PyPI.
- `--no-site-packages` - DEPRECATED. Retained only for backward compatibility. Not having access to global site-packages is now the default behavior.
- `--distribute`
- `--setuptools` - Legacy; now have no effect.


### Python 2 vs Python 3

#### py.exe

As long as Python 3.3 or greater is instanlled in C:\Windows two files are copied py.exe and pyw.exe

From the command line you can specify particular versions of python by saying

```batch
usage:
py [launcher-args] [python-args] script [script-args]
py -3.6
py -2.7
py -3
py -2
py -3.7 # is not installed in this case
>>>  Requested Python version (3.7) not installed\
#To Get a particular build
py -3-64
py -2-32
```

this is apparently only available in the 32 bit installation, perhaps only the 32bit 3.7, and must be installed elevated.

!!!Note Note Launcher arguments:
-3 : Launch the latest Python 3.x version
-X.Y : Launch the specified Python version
The above all default to 64 bit if a matching 64 bit python is present.
-X.Y-32: Launch the specified 32bit Python version
-X-32 : Launch the latest 32bit Python X version
-X.Y-64: Launch the specified 64bit Python version
-X-64 : Launch the latest 64bit Python X version
-2 : Launch the latest Python 2.x version
-0 --list : List the available pythons
-0p --list-paths : List with paths`



py -3.x doesn't work, as in the example, the minor number must be specified or left off. The x, doesnt work.

Python 3 installs 3 versions of PIP, for example, python 3.6 installs:

- easy_install-3.6.exe
- easy_install.exe
- pip.exe
- pip3.6.exe
- pip3.exe

Sp, using `RapidEnivronmentEditor` RapidEE, add to path `D:\Visual Studio\Shared\Python36_64\Scripts` so that you can then call pip3.exe

## Anaconda and Jupyter

### Jupyter

#### Installing Kernals

[All Kernals Link](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)
[VPython](https://pypi.org/project/IVisual/)
[ApacheToree (ApacheSpark) Scala, R, Python](https://github.com/apache/incubator-toree)
[SciJava](https://github.com/scijava/scijava-jupyter-kernel)
[BeakerX](http://beakerx.com/)
[BeakerX iBinder](https://hub.mybinder.org/user/twosigma-beakerx-7t846vvm/notebooks/StartHere.ipynb)
[Micropython](https://github.com/goatchurchprime/jupyter_micropython_kernel/)
[IJava](https://github.com/SpencerPark/IJava)


##### BeakerX

conda install -c conda-forge ipywidgets beakerx

Installation with Conda
We recommend conda to install Jupyter and BeakerX, and to manage your Python environments. BeakerX works with Python 3.4 and above. Conda forge hosts the lastest version.

conda create -y -n beakerx 'python>=3'
source activate beakerx
conda config --env --add pinned_packages 'openjdk>8.0.121'
conda install -y -c conda-forge ipywidgets beakerx
Installation for Jupyter Lab
You can try it as follows. Note that installing Lab extensions requires npm.

conda create -y -n labx 'python>=3'
source activate labx
conda config --env --add pinned_packages 'openjdk>8.0.121'
conda install -y -c conda-forge jupyterlab beakerx
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install beakerx-jupyterlab
Upgrading
If you have an environment with a previous version of BeakerX, to upgrade to the latest version use:

conda update -c conda-forge beakerx
Running BeakerX
Start it with

jupyter notebook
or just

beakerx
Installation with Pip
You can also install BeakerX with pip.

pip install beakerx
beakerx install
Uninstallation with Pip
beakerx uninstall
pip uninstall beakerx


##### Bash

A Jupyter kernel for bash

This requires IPython 3.

To install:

        pip install bash_kernel
        python -m bash_kernel.install
To use it, run one of:

        jupyter notebook
In the notebook interface, select Bash from the 'New' menu
        jupyter qtconsole --kernel bash
        jupyter console --kernel bash

Anaconda can manage multiple python installs as well. Now that I've finally figured out how py.exe works.

See here: [Conda Environment](https://conda.io/docs/user-guide/tasks/manage-python.html).

##### Javascript

Ubuntu
To install IJavascript in Ubuntu 16.04 LTS, run:

        sudo apt-get install nodejs-legacy npm ipython ipython-notebook
        sudo npm install -g ijavascript
        ijsinstall

Windows (Official Python Distribution) In the command line:

        pip3 install --upgrade pip
        pip3 install jupyter
        npm install -g ijavascript
        ijsinstall

Or run:

        %appdata%\npm\ijsinstall

Then you can run jupyter notebook in your terminal to load Jupyter Notebook. When you create a new Jupyter Notebook, you should see the Javascript (Node) kernel available.

Windows (Anaconda Distribution)  Open the Anaconda prompt and run:

        conda install nodejs
        npm install -g ijavascript
        ijsinstall

###### Scala

    [Scala Git](https://github.com/mattpap/IScala)

To start IPython with IScala backend manually, issue:

ipython console --KernelManager.kernel_cmd='["java", "-jar", "lib/IScala.jar", "--connection-file", "{connection_file}", "--parent"]'

##### GO
[Gophernotes](https://github.com/gopherdata/gophernotes#windows)

build and install gophernotes (using the pre-built binaries and zmq-win\build.bat):

        REM Download w/o building.
        go get -d -u github.com/gopherdata/gophernotes
        cd %GOPATH%\src\github.com\gopherdata\gophernotes\zmq-win

        REM Build x64 version.
        build.bat amd64
        move gophernotes.exe %GOPATH%\bin
        copy lib-amd64\libzmq.dll %GOPATH%\bin

        REM Build x86 version.
        build.bat 386
        move gophernotes.exe %GOPATH%\bin
        copy lib-386\libzmq.dll %GOPATH%\bin

Copy the kernel config:

        mkdir %APPDATA%\jupyter\kernels\gophernotes
        xcopy %GOPATH%\src\github.com\gopherdata\gophernotes\kernel %APPDATA%\jupyter\kernels\gophernotes /s

Note, if you have the JUPYTER_PATH environmental variable set or if you are using an older version of Jupyter, you may need to copy this kernel config to another directory. You can check which directories will be searched by executing:

jupyter --data-dir
Update %APPDATA%\jupyter\kernels\gophernotes\kernel.json with the FULL PATH to your gophernotes.exe (in %GOPATH%\bin), unless it's already on the PATH. For example:

        {
            "argv": [
            "C:\\gopath\\bin\\gophernotes.exe",
            "{connection_file}"
            ],
            "display_name": "Go",
            "language": "go",
            "name": "go"
        }

Docker
You can try out or run Jupyter + gophernotes without installing anything using Docker. To run a Go notebook that only needs things from the standard library, run:

    $ docker run -it -p 8888:8888 gopherdata/gophernotes

Or to run a Go notebook with access to common Go data science packages (gonum, gota, golearn, etc.), run:

        $    docker run -it -p 8888:8888 gopherdata/gophernotes:latest-ds

In either case, running this command should output a link that you can follow to access Jupyter in a browser. Also, to save notebooks to and/or load notebooks from a location outside of the Docker image, you should utilize a volume mount. For example:

        $ docker run -it -p 8888:8888 -v /path/to/local/notebooks:/path/to/notebooks/in/docker gopherdata/gophernotes

##### C#

[Link for C#](https://github.com/zabirauf/icsharp/wiki/Installation)


### Errors (relating to Version)

 The cryptic error:  `print '(WARNING: importing distutils, not setuptools!)'`.

 Seems to be caused in at least 2 cases of running pip install on a Py package for 2.7 but not 3.x.


#### Viewing a list of available Python versions

To list the versions of Python that are available to install, in your Terminal window or an Anaconda Prompt, run: `conda search python` This lists all packages whose names contain the text python.

To list only the packages whose full name is exactly python, add the --full-name option. In your Terminal window or an Anaconda Prompt, run: `conda search --full-name python`

#### Installing a different version of Python

To install a different version of Python without overwriting the current version, create a new environment and install the second Python version into it:

1 - Create the new environment:

- To create the new environment for **Python 3.6,** in your Terminal window or an Anaconda Prompt, run:

        conda create -n py36 python=3.6 anaconda

> NOTE: Replace py36 with the name of the environment you want to create. anaconda is the metapackage that includes all of the Python packages comprising the Anaconda distribution. python=3.6 is the package and version you want to install in this new environment. This could be any package, such as numpy=1.7, or multiple packages.

- To create the new environment for **Python 2.7,** in your Terminal window or an Anaconda Prompt, run:

        conda create -n py27 python=2.7 anaconda

2- Activate the new environment.
- On Windows, in your Anaconda Prompt, run `activate myenv`
- On macOS and Linux, in your Terminal Window, run `source activate myenv`
> Conda prepends the path name myenv onto your system command.

- Verify that the new environment is your current environment. To verify that the current environment uses the new Python version, in your Terminal window or an Anaconda Prompt, run:

        python --version

#### Differences

iteritems() vs. items()

zip() returns different values

print() vs print

nonlocal is only in python 3

Python 2 forces integer types with integer operators-  e.g.

-python 2 `5/2 =2`
-python 2 `5.0/2 = 2`
-python 3 `5/2 =2.5`
-python 3 has the floor operator to match this output- `5//2 = 2`

### Compile Code

pyinstaller is simple.  Pip install pyinstaller, then check it by test running it.  Then just feed it the path and file.  It packs it up and you're done.

There's a more elaborate method using cython.

Cython Method

`pip install cython`

typing files- add declarations. Or maybe using PyRi

Declare things as `cdef` `def` (which is effectively 'pdef'), `cpdef` -`cdef` means its only accessible in c code.  `cpdef` means accessible in both, and `def` won't be converted to **c**.

```py
cpdef int test(int x): #add return var
    cdef int y = 0  #declare types
    cdef int i
    for i in range(x):
        y += 1
    return y

```

save file as `*.pyx`

`setup.py` should contain:

```py
#setup.py
from disutils.core import Setup
from Cython.Build import cythonize #note capitals

setup(ext_modules = cythonize('example_cy.pyx))
```

from command line: run `python3 setup.py build_ext --inplace` -> this creates `*.so` file.

`cython -a example_cy.pyx`

comments of video says using pyximport keeps you from having to use setup.py

Also recommended is `cython --embed greet.py -o greet.c`

People recomment numba jit and numba vectorize

#### Python Byte Code

Some tips for experts:

- You can use the -O or -OO switches on the Python command to reduce the size of a compiled module. The -O switch removes assert statements, the -OO switch removes both assert statements and __doc__ strings. Since some programs may rely on having these available, you should only use this option if you know what you’re doing. “Optimized” modules have an opt- tag and are usually smaller. Future releases may change the effects of optimization.
- A program doesn’t run any faster when it is read from a .pyc file ; only the speed with which they are loaded is faster
- The module `compileall` can create .pyc files for all modules in a directory.
There is more detail on this process, including a flow chart of the decisions, in PEP 3147.


### Interrupt

interrupt key (normally [[Ctrl]] + [[C]] or [[Delete]])

Throws `KeyboardInterruptError` -During execution, a check for interrupts is made regularly.


### KEYWORDS

See Online doc [Keywords](https://docs.python.org/3/reference/lexical_analysis.html#keywords)

- control statements
  - [for](#FOR-LOOPS)
  - [in](#RANGES)
  - [if](#CONDITIONALS)
  - [elif](#CONDITIONALS)
  - [while](#WHILE-Loops)
  - [else](#CONDITIONALS)
- control modifiers
  - [break](#Range,-Break,-Continue,-Pass,-Enumerate,-and-Iter,-and-others)
  - [continue](#Range,-Break,-Continue,-Pass,-Enumerate,-and-Iter,-and-others)
  - [pass](#Range,-Break,-Continue,-Pass,-Enumerate,-and-Iter,-and-others)
- Logic commands
  - not
  - and
  - or
  - [False](#boolean)
  - [True](#boolean)
- Error Handling
  - try
  - raise
  - except
  - finally
- Library Statements
  - [import](#import)
  - from
  - as
- [Function statements](#FUNCTIONS)
  - lambda
  - def
  - return
- Namespace Assertions
  - [nonlocal](#global-and-nonlocal-keywords)
  - [global](#global-and-nonlocal-keywords)
  - del
- Null assertions
  - [None](#None)
- Unknown
  - await
  - with
  - class
  - is
  - yield
  - assert
  - async

### Special Symbols

`_` in interactive mode, `_` means the last result.

```py
>>> 5*5
25
>>> _+5
30
```

`__*__` - are special system defined names.  `Dunder Methods` for Double UnderScore methods.

`__*` - is a Class-private name

## Files, Modules, Packages and Libraries

### Directory Structure

[SourceInfo](https://packaging.python.org/guides/distributing-packages-using-setuptools/#setup-py)

```py
sound/                          Top-level package
      __init__.py               Initialize the sound package
      setup.py?                 #
      formats/                  Subpackage for file format conversions
              __init__.py
              wavread.py
              wavwrite.py
              aiffread.py
              aiffwrite.py
              auread.py
              auwrite.py
              ...
      effects/                  Subpackage for sound effects
              __init__.py
              echo.py
              surround.py
              reverse.py
              ...
      filters/                  Subpackage for filters
              __init__.py
              equalizer.py
              vocoder.py
              karaoke.py
...

Top-level package
__init__.py
setup.py

`__init__.py` code defines a list named __all__, it is taken to be the list of module names that should be imported when from package import * is encountered. It is up to the package author to keep this list up-to-date when a new version of the package is released. Package authors may also decide not to support it

### Importing modules

[Ref on Syntax](https://docs.python.org/3/reference/simple_stmts.html#import)

[Ref on Mechanics](https://docs.python.org/3/reference/import.html#importsystem)

import is used to make specialty functions available

These are called modules

```python
import random
import sys
import os
import re #Regular expressions
import math #math functions
```

How you import matters. From the 3.7 help file is the warning "Be sure to use the `import os` style instead of `from os import *`. This will keep `os.open()` from shadowing the built-in `open() function which operates much differently." This seems to suggest that`from <library> import <module>` imports the namespace directly.

In fact, [from the manual](https://docs.python.org/3/reference/simple_stmts.html#import) --If the list of identifiers is replaced by a star ('*'), all public names defined in the module are bound in the local namespace for the scope where the import statement occurs.

The wild card form of import — from module import * — is only allowed at the module level. Attempting to use it in class or function definitions will raise a SyntaxError.

By using leading dots in the specified module or package after from you can specify how high to traverse up the current package hierarchy without specifying exact names.

- `.` = current package
- `..` = up one level
- `...` = up two levels... etc.

```py
from . import ***              #looks in the current package level for ***
from . import mod              #from a module in the 'pkg' package  imports 'pkg.mod'
from ..subpkg2 import mod      #from within 'pkg.subpkg1' you will 'import pkg.subpkg2.mod'
```

`import fibo` - This does not enter the names of the functions defined in fibo directly in the current symbol table; it only enters the module name fibo there. Using the module name you can access the functions:

```py
>>> fibo.fib(1000)
0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987
>>> fibo.fib2(100)
[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
>>> fibo.__name__
'fibo'
>>> fib = fibo.fib
>>> fib(500)
0 1 1 2 3 5 8 13 21 34 55 89 144 233 377
```
If you intend to use a function often you can assign it to a local name:

**Each module has its own private symbol table, which is used as the global symbol table by all functions defined in the module.** Thus, the author of a module can use global variables in the module without worrying about accidental clashes with a user’s global variables. On the other hand, if you know what you are doing you can touch a module’s global variables with the same notation used to refer to its functions, modname.itemname.
And a variant to import all names that a module defines:
```py
>>> from fibo import fib, fib2
>>> from fibo import *
>>> from fibo import fib as fibonacci
>>> import fibo as fib
```
This does not introduce the module name from which the imports are taken in the local symbol table (so in the example, fibo is not defined).

Importing searches for a file named `spam.py` in a list of directories given by the variable `sys.path`. `sys.path` is initialized from these locations:

- The directory containing the input script (or the current directory when no file is specified).
- PYTHONPATH (a list of directory names, with the same syntax as the shell variable PATH).
- The installation-dependent default.



To import from a directory, there needs to be a file (empty) called `__init__.py`.  Presumably you can probably put things in it.

To import from the same directory you use dot notation.

e.g. the same directory is -

`import .module as ModuleName`
from package import item, where item is a submodule (or subpackage) of the package, or some other name defined in the package, like a function, class or variable.
and from sub directory `\sub\` you say:
```py
import sub.module
from sub.module import class
from . import echo
from .. import formats
```

You can also write relative imports, with the from module import name form of import statement. These imports use leading dots to indicate the current and parent packages involved in the relative import. From the surround module for example, you might use:


### Get the Version number of the interpreter

```py
M, m = sys.version_info[0:2]
#or
M, m, _, _, _ = sys.version_info
```

Note: `sys.version_info` is not a function. Calling `sys.version_info()` leads to an error

#### __main__

```py
if __name__ == '__main__' :
    # any amount of code to exercise the functions
    # defined above
```

Determines if the current file is the main file that is executed.

#### USEFUL MODULES

See [Packages](#Packages) for notes on useful 3rd party, and at least less core, modules that are useful and have specific notes...

import \*:

- `sys` - provides information on... -`sys.version` - prvides the version number of python
- `os` -
- `random` - a random number generatior
- `math` -
- `unittest` - Used to create Unittests
- `matplotlib` -

Hello world is just one line of code

### print()

see (Strings- Print)[#### Print]

### KEYWORDS

See Online doc [Keywords](https://docs.python.org/3/reference/lexical_analysis.html#keywords)

False await else import pass
None break except in raise
True class finally is return
and continue for lambda try
as def from nonlocal while
assert del global not with
async elif if or yield

#### NONE

`NONE` - special return value- no return. Print(None) does not print.

#### Specification Statement

Is used to help define a function- user written.

```py
def sqrt(x)
    '''returns the square root of x, if x is a perfect sqare.  Prints an error message and returns None otherwise'''
```

This is a **specification statement**. Tbe statement in a **multiline quote just under a `def` statement** becomes the definition or help statement for that function.

### Escape Characters

| Escape Sequence | Meaning                                      | Note                       |
| --------------- | -------------------------------------------- | -------------------------- |
| `\newline`      | Backslash and newline ignored                |                            |
| `\\`            | Backslash (\)                                |                            |
| `\'`            | Single quote (')                             |                            |
| `\"`            | Double quote (")                             |                            |
| `\a`            | ASCII Bell (BEL)                             |                            |
| `\b`            | ASCII Backspace (BS)                         |                            |
| `\f`            | ASCII Formfeed (FF)                          |                            |
| `\n`            | ASCII Linefeed (LF)                          |                            |
| `\r`            | ASCII Carriage Return (CR)                   |                            |
| `\t`            |                                              | ASCII Horizontal Tab (TAB) |
| `\v`            | ASCII Vertical Tab (VT)                      |                            |
| `\ooo`          | Character with octal value ooo               | (1,3)                      |
| `\xhh`          | Character with hex value hh                  | (2,3)                      |
| `\N{name}`      | Character named name in the Unicode database | (4)                        |
| `\uxxxx`        | Character with 16-bit hex value xxxx         | (5)                        |
| `\Uxxxxxxxx`    | Character with 32-bit hex value xxxxxxxx     | (6)                        |

Notes:

1.- As in Standard C, up to three octal digits are accepted.
2.- Unlike in Standard C, exactly two hex digits are required.
3.- In a bytes literal, hexadecimal and octal escapes denote the byte with the given value. In a string literal, these escapes denote a Unicode character with the given value.
4.- Changed in version 3.3: Support for name aliases [1] has been added.
5.- Exactly four hex digits are required.
6.- Any Unicode character can be encoded this way. Exactly eight hex digits are required.

### Literals

- `b` | `B` - Byte
- `rb` | `br` - Raw Byte ( "br" | "Br" | "bR" | "BR" | "rb" | "rB" | "Rb" | "RB")
- `f` | `F` -Formatted String Literal
  - `fr` ! `fb`! `fu` - Formatted flag may be combined with R but not b or u
- `u` - Unicode Character

Strings can be prefixed with Raw, Unicode, Formatted, or Raw & Formatted- "r" | "u" | "R" | "U" | "f" | "F" | "fr" | "Fr" | "fR" | "FR" | "rf" | "rF" | "Rf" | "RF"

[Formatted String Literals](https://docs.python.org/3/reference/lexical_analysis.html#formatted-string-literals)

Some examples of formatted string literals:

See the [Section on String Formatting](#STRING-FORMATTING)  section for more on formatting strings.  This is on string format as in **Date Type**

```py
>>> name = "Fred"
>>> f"He said his name is {name!r}."
"He said his name is 'Fred'."

>>> f"He said his name is {repr(name)}."  #repr() is equivalent to !r
"He said his name is 'Fred'."

>>> width = 10
>>> precision = 4
>>> value = decimal.Decimal("12.34567")
>>> f"result: {value:{width}.{precision}}"  #nested fields
'result:      12.35'

>>> today = datetime(year=2017, month=1, day=27)
>>> f"{today:%B %d, %Y}"  #using date format specifier
'January 27, 2017'

>>> number = 1024
>>> f"{number:#0x}"  #using integer format specifier
'0x400'
```

### global and nonlocal keywords

!!!Note Note:This may just be in Python 3.  There is no equivalent `nonlocal` for sure in Python 2.

`global` can be used to call a variable global in scope

```py3
x = "global"

def foo():
    global x
    y = "local"
    x = x * 2
    print(x)
    print(y)

foo()
```

`nonlocal` is similar, but goes to an outer function

```py3
def outer():
    x = "local"

    def inner():
        nonlocal x
        x = "nonlocal"
        print("inner:", x)

    inner()
    print("outer:", x)

outer()
```

This is an example demonstrating how to reference the different scopes and namespaces, and how global and nonlocal affect variable binding: [Source](https://docs.python.org/3/tutorial/classes.html)

```py
def scope_test():
    def do_local():
        spam = "local spam"

    def do_nonlocal():
        nonlocal spam
        spam = "nonlocal spam"

    def do_global():
        global spam
        spam = "global spam"

    spam = "test spam"
    do_local()
    print("After local assignment:", spam)
    do_nonlocal()
    print("After nonlocal assignment:", spam)
    do_global()
    print("After global assignment:", spam)

scope_test()
print("In global scope:", spam)
```

After local assignment: test spam
After nonlocal assignment: nonlocal spam
After global assignment: nonlocal spam
In global scope: global spam


### lambda

Program to show the use of lambda functions

```py
double = lambda x: x * 2
print(double(5))
 @Output: 10
```

 [Lambda Calculus Main Article](#Lambda-Calculus)

### Built-in Functions

Python has a few built in functions:

[Defined Here](https://docs.python.org/3/library/functions.html)

- [`__import__()`](#import)
- abs() - absolute
- all()
- any()
- * ascii()
- basestring()
- bin()
- bool()
- * breakpoint()
- bytearray()
- * bytes()
- callable()
- chr()
- classmethod()
- cmp()
- compile()
- complex()
- * copyright()
- credits
- delattr()
- [dict()](#{DICTIONARY})
- dir() - get all the methods related to an object
- divmod()
- enumerate()
- eval()
- execfile()
- issubclass()
- [print()](#print())
- * exec()
- * exit()
- file()
- filter()
- float()
- format()
- frozenset()
- getattr()
- globals()
- hasattr()
- hash()
- help() - get documentation on a command
- hex()
- id()
- input()
- int()
- isinstance()
- issubclass()
- iter()
- len()
- * license
- [list()](#[LISTS])
- locals()
- long()
- [map()](#{DICTIONARY})

- max()
- memoryview()
- min() - find the minimum of a set of values
- next()
- object()
- oct()
- open()
- ord()
- pow()
- [print()](#print())
- property()
- * quit()
- [range()](#RANGES)
- raw_input()
- reduce()
- reload()
- repr()
- reversed()
- round()
- setattr()
- [set()](#Sets)
- slice()
- sorted()
- staticmethod()
- [str()](#str())
- sum()
- super()
- [tuple()](#(TUPLES))
- [type()](#Type-Command)
- unichr()
- unicode()
- vars()
- xrange()
- [zip()](#zip(()))

 '__build_class__'
 '__debug__'
 '__doc__'
 '__import__'
 '__loader__'
 '__name__'
 '__package__'
 '__spec__',


### help()

`help()` - calling help(obj) gets the help file for that object.

```py
help(str)
>>>  #Returns all the methods for that object
help(str.__add__) #Works to get the specific help lines for obj.method.

```

### str()

str() returns a string representation of an object.  Equivalent to the Java `.toString()` method.

### DIR (dir())

dir() -briefly returns all the methods associated with an object- "attributes" etc.

- If the **object** _supplies a method_ named **dir**, it will be used;
  - otherwise the default dir() logic is used and returns:
    - for a **module object:** the module's attributes.
    - for **a class object:** _ its attributes, and recursively the attributes of its bases._
    - for _any other object:_ its attributes, its class's attributes, and recursively the attributes of its class's base classes.
    - If no argument is passed- it will return all the names in the current scope.

dir() does not list the names of built-in functions and variables. If you want a list of those, they are defined in the standard module builtins:
        >>> import builtins
        >>> dir(builtins)
    >>>  #Returns all the methods for that object

    help(str.__add__) #Works to get the specific help lines for obj.method.

### Exit() vs Quit()

To exit the command line python you can use exit() or quit()

`quit()` is an immediete interrupt and exits immedietly

`exit()` says when the interpreter gets a chance to exit

### print()

see (Strings- Print)[#### Print]

### filter()

The `filter()` function in Python takes in a function and a list as arguments.

The function is called with all the items in the list and a new list is returned which contains items for which the function evaluats to True.

Here is an example use of `filter()` function to filter out only even numbers from a list.

```py
my_list = [1, 5, 4, 6, 8, 11, 3, 12]

new_list = list(filter(lambda x: (x%2 == 0) , my_list))

print(new_list)
```

Output: [4, 6, 8, 12]

`filter(predicate, iter)` returns an iterator over all the sequence elements that meet a certain condition, and is similarly duplicated by list comprehensions. A predicate is a function that returns the truth value of some condition; for use with filter(), the predicate must take a single value.

```py
>>> def is_even(x):
...     return (x % 2) == 0
>>> list(filter(is_even, range(10)))
[0, 2, 4, 6, 8]
```

This can also be written as a list comprehension:
```py
>>> list(x for x in range(10) if is_even(x))
[0, 2 4, 6, 8]
```

### enumerate()

`enumerate(iter, start=0)` counts off the elements in the iterable returning 2-tuples containing the count (from start) and each element.

```py
>>>
>>> for item in enumerate(['subject', 'verb', 'object']):
...     print(item)
(0, 'subject')
(1, 'verb')
(2, 'object')
```

enumerate() is often used when looping through a list and recording the indexes at which certain conditions are met:

```py
f = open('data.txt', 'r')
for i, line in enumerate(f):
    if line.strip() == '':
        print('Blank line at line #%i' % i)
```

### Sorted()

`sorted(iterable, key=None, reverse=False)` collects all the elements of the iterable into a list, sorts the list, and returns the sorted result. The key and reverse arguments are passed through to the constructed list’s sort() method.

```py
>>>
>>> import random
>>> # Generate 8 random numbers between [0, 10000)
>>> rand_list = random.sample(range(10000), 8)
>>> rand_list
[769, 7953, 9828, 6431, 8442, 9878, 6213, 2207]
>>> sorted(rand_list)
[769, 2207, 6213, 6431, 7953, 8442, 9828, 9878]
>>> sorted(rand_list, reverse=True)
[9878, 9828, 8442, 7953, 6431, 6213, 2207, 769]
```

(For a more detailed discussion of sorting, see the Sorting HOW TO.)

### any() & all()

The `any(iter)` and `all(iter)` built-ins look at the truth values of an iterable’s contents. any() returns True if any element in the iterable is a true value, and all() returns True if all of the elements are true values:

```py
>>> any([0, 1, 0])
True
>>> any([0, 0, 0])
False
>>> any([1, 1, 1])
True
>>> all([0, 1, 0])
False
>>> all([0, 0, 0])
False
>>> all([1, 1, 1])
True
```


### map()

The `map()` function in Python takes in a function and a list.

The function is called with all the items in the list and a new list is returned which contains items returned by that function for each item.

Here is an example use of `map()` function to double all the items in a list.

```py
my_list = [1, 5, 4, 6, 8, 11, 3, 12]

new_list = list(map(lambda x: x * 2 , my_list))

print(new_list)
```

Output: [2, 10, 8, 12, 16, 22, 6, 24]

`map(f, iterA, iterB, ...)` returns an iterator over the sequence
`f(iterA[0], iterB[0]), f(iterA[1], iterB[1]), f(iterA[2], iterB[2]), ....`

```py
>>> def upper(s):
...     return s.upper()
>>> list(map(upper, ['sentence', 'fragment']))
['SENTENCE', 'FRAGMENT']
>>> [upper(s) for s in ['sentence', 'fragment']]
['SENTENCE', 'FRAGMENT']
```

You can of course achieve the same effect with a list comprehension.

## Basics and Useful bits


## Values

- integer [int] - (1,2,3,4) Integers are primitive data types that represent whole numbers.
- float -(1., 1.0, 2.345, Pi) Floats are primitive data types, which hold decimal numbers.
- long (a type of int) - An integer, over approximately
- boolean - Booleans have only two allowed values, True or False, useful in determining if actions should be taken.
- String - character array -a string of characters
- Lists `[ ]`- Mutable, heterogenous, 0 indexed.
- Tuples `( )` - Immutable, 0 indexed, heterogeneous
- Dictionaries -

### Type() commmand

Type can be checked with the `type(`**var**`)` command

```py
a = 1
type(a)
>>> <type int>
print(type(a))
>>> <type 'int'
```

### VARIABLES

A variable is a place to store values
Its name is like a label for that value

```python
name = "Derek"
print(name)
```

A variable name can contain letters, numbers, or \_ but can't start with a number.
There are 5 data types Numbers, Strings, List, Tuple, Dictionary. You can store any of them in the same variable

```python
name = 15
print(name)
```

### Operators

*Increment* and *decrement* operators do not work in Python. E.g `i++` or `count--` have no meaning.

Apparently, there may exist compound operators- e.g. `+=`


### Assignment

```py
x = 1                   #Integer
x = 1.                  #float
x = 1.0                 #float
x,y,z = 1, 'Hi', 3.0    #Multiple Assignment
x=y=1                   #Serial Assignment

```

Note that serial assignment works very differently with object.
In this case if y changes in `x=y=1` then x will not change, it will remain 1. If x = y = oject (e.g. tuple)? then changing x also changes y. See [Mutation](#### Mutation)

Python uses two types of numbers- integers and floats

Python uses arbitrary precision integers. This means that they can be any value.
Over about 2 billion, they will be marked with an L, which means Long. It just indicates that python is using a long data type internally and will go slower.

```py
a = 2**1000
[lots of digits]L
b = 2**999
[slightly fewer digits]L
a / b = 2L
```

Expect 2 here, not 2L. Since 2 is no longer "long". Once you become Long data type, you stay L. This is Integer Division.

### NUMERICAL

#### types

integer v float are the predominant types.

There are other types though- including:

`long integer`

`decimal integer`

`complex` - `complex(re, im)` and conjugate- `c.conjugate()` - find the conjugate of the complex number c.

### Mathematical Operations

The arithmetic operators +, -, \*, /, %, \*\*, //

\*\* (`**`) Exponential calculation

// Floor Division

```python
print("5 + 2 =", 5+2)
print("5 - 2 =", 5-2)
print("5 * 2 =", 5*2)
print("5 / 2 =", 5/2)
print("5 % 2 =", 5%2)
print("5 ** 2 =", 5**2)
print("5 // 2 =", 5//2)
```

Order of Operation states \* and / is performed before + and -

```python
print("1 + 2 - 3 * 2 =", 1 + 2 - 3 * 2)
print("(1 + 2 - 3) * 2 =", (1 + 2 - 3) * 2)
```

+

- float + any numerical type
- add (float + any numerical)

- `math.floor()`
-` math.ciel()`
- `abs()`
- `int()`
- `float()`
- `divmod(x, y)`
- `pow(x, y)`
- `x ** y` -x to the power of y
- `round(x[, n])`
- `math.trunc(x)` - truncate x to Integral

### Complex Operations

module `cmath` - always available.

[Complex Operations Reference](https://docs.python.org/3/library/cmath.html#module-cmath)

### Constants

- $\pi$- `math.`\ `cmath.pi` - The mathematical constant π, as a float.
- *e*- `math.`\ `cmath.e` - The mathematical constant e, as a float.
- $\tau$- `math.`\ `cmath.tau` - The mathematical constant τ, as a float.*
- $\infinity$- `math.`\ `cmath.inf` - Floating-point positive infinity. Equivalent to float('inf').*
- `cmath.infj` - Complex number with zero real part and positive infinity imaginary part. Equivalent to complex(0.0, float('inf')).*
- `math.`\ `cmath.nan` - A floating-point “not a number” (NaN) value. Equivalent to float('nan').*
- `cmath.nanj` - Complex number with zero real part and NaN imaginary part. Equivalent to complex(0.0, float('nan')).

*New in version 3.6.

### STRINGS

Strings are an ordered collection of characters. It is a series of characters surrounded by ' or "

If you must use a " or ' between the same quote escape it with \.

They can be indexed using the array referencing.

```python
s1 = 'abcde'
s2 = 'fghij'
s1[0] #>1
s2[2:] #>hij
s3 = s1 + s2  #Concatenate 2 strings
print(s3) #> 'abcdefghij'

long_string = "I'll catch you if you fall - The Floor"
print(long_string[0:4])  #Retrieve the first 4 characters
print(long_string[-5:])  #Get the last 5 characters
print(long_string[:-5])  #Everything up to the last 5 characters
print(long_string[:4] + " be there")  #Concatenate part of a string to another
```

#### PRINT()

print() outputs data to the screen

```python
print("Hello World")
'''
This is a multi-line comment
'''

#Python 2 allows the format
print "Hello World"

#You can also comma delimit a print statement and it will separate it by a space
a,b,c = 1, 2.0 , 'three'
print(a,b,c)
```

#### To keep from printing newlines use end=""

```python
print("I don't like ",end="")
print("newlines")

# You can print a string multiple times with *
print('\n' * 5)
```

#### Escape

See more in [Basics - Escape Characters](### Escape Characters) for all

A string is a string of characters surrounded by " or ', but `\` can be used to escape characters

```python
quote = "\"Always remember your unique,"
multi-line quote
multi_line_quote = ''' just
like everyone else" '''
''' Which is just like a
multi-line comment, only its missing
the equal sign to signify it'''

print(quote + multi_line_quote)
```

#### Substring

Squarebrackets after the string or variable subset. 0 indexed and non-inclusive.

```py
aVar = "Hello"
aVar[0] #=H
aVar[0:3] #=Hel


#string from 0-8(non inclusive @9) by 2
print("abcdefghi"[0:9:2])
>>>acegi

print("a a a".rsplit(None, 1)
>>>['a a', 'a']



print("abc".ljust(10))
"%-10s" % s  #same as above
"{:<10}".format(s)  #same as above


print("abc".rjust(10))
"% 10s" % s #same as above
"{:>10}".format(s).  #same as above


print(str(b"abc", encoding="utf8"))


print("{a[0]}".format(a=[1, 2]))
>>>1


print("abc".endswith("c", 1))
>>>True
```


#### Split

Use split to split at a particular character. Returns a tuple.

```py
>>> addr = 'a.l.timmons@gmail.com'
>>> user, domain = addr.split('@')
>>> user
'a.l.timmons'
>>> domain
'gmail.com'
```

#### Other string Functions

- **str**.`capitalize()` - Capitalizes the first letter
- **str**.`find('`_[search string]_`')` -Returns the index of the start of the string (case sensitive)
- **str**.`isalpha()` - Returns true if all characters are letters ' isn't a letter
- **str**.`isalnum()` - Returns true if all characters are numbers
- `len(`**str**`)` - Returns the string length
- **str**.`replace('`_[search string]_`', '`_[replace string]_`')` - Replace the first word with the second (Add a number to replace more)
- **str**.`strip()` - Remove white space from front and end
- **str**.`split('`_[split string]_`')` - Split a string into a list based on the delimiter you provide

Other String Methods:
- `__add__`
- `__class__`
- `__contains__`
- `__delattr__`
- `__doc__`
- `__eq__`
- `__format__`
- `__ge__`
- `__getattribute__`
- `__getitem__`
- `__getnewargs__`
- `__getslice__`
- `__gt__`
- `__hash__`
- `__init__`
- `__le__`
- `__len__`
- `__lt__`
- `__mod__`
- `__mul__`
- `__ne__`
- `__new__`
- `__reduce__`
- `__reduce_ex__`
- `__repr__`
- `__rmod__`
- `__rmul__`
- `__setattr__`
- `__sizeof__`
- `__str__`,
- `__subclasshook__`
- `_formatter_field_name_split`
- `_formatter_parser`
- **`capitalize`**
- `center`
- `count`
- `decode`
- `encode`
- `endswith`
- `expandtabs`
- **`find`**
- `format`
- `index`
- `isalnum`
- `isalpha`
- `isdigit`
- `islower`
- `isspace`
- `istitle`
- `isupper`
- `join`
- `ljust`
- `lower`
- `lstrip`
- `partition`
- `replace`
- `rfind`
- `rindex`
- `rjust`
- `rpartition`
- `rsplit`
- `rstrip`
- `split`
- `splitlines`
- `startswith`
- `strip`
- `swapcase`
- `title`
- `translate`
- `upper`
- `zfill`


```py
print(long_string.capitalize())

print(long_string.find("Floor"))

print(long_string.isalpha())

print(long_string.isalnum())

print(len(long_string))

print(long_string.replace("Floor", "Ground"))

print(long_string.strip())

quote_list = long_string.split(" ")

print(quote_list)
```

You can cast variables and treat them as strings, or attempt to cast strings to ints using `str()` or `int()`.

```py
sumDigits = 0
for c in str(1952):
    sumDigits += int(c)
print(sumDigits)
```

#### STRING FORMATTING


[Official Doc](https://docs.python.org/3/library/string.html#string.Formatter.vformat)

Do C like string formatting like `sprintf()`.

The format is `print` then a quoted string `"a string here"` followed by a `%` and then in parentheses a comma separated list of values of the appropriate type.

e.g. `print "insert %i as an %s" % (1,"string")`
!!!warning Warning: %  vs `{}` notation
    It appears that technically % is deprecated.  See below in advanced.

% values

- i - integer
- s - string
- d or u -integer decimal (?)
- o -octal
- x (X) - hexadecimal (uppercase)
- e (E) Floating point exponential (uppercase)
- f (F) Floating point as a decimal (equivalent?)
- g (G) f is E is less than 4, otherwise uses e (uppercase)
- c - character
- r - string using the repr() method
- s - string using the string() method





| Conversion | Meaning                                                        |
| ---------- | -------------------------------------------------------------- |
| 'd'        | Signed integer decimal.                                        |
| 'i'        | Signed integer decimal.                                        |
| 'o'        | Signed octal value.                                            |
| 'u'        | Obsolete type – it is identical to 'd'.                        |
| 'x'        | Signed hexadecimal (lowercase).                                |
| 'X'        | Signed hexadecimal (uppercase).                                |
| 'e'        | Floating point exponential format (lowercase).                 |
| 'E'        | Floating point exponential format (uppercase).                 |
| 'f'        | Floating point decimal format.                                 |
| 'F'        | Floating point decimal format.                                 |
| 'g'        | Floating point format.[[1]]                                    |
| 'G'        | Floating point format. [[2]]                                   |
| 'c'        | Single character (accepts integer or single character string). |
| 'r'        | String (converts any Python object using repr()).              |
| 's'        | String (converts any Python object using str()).               |
| '%'        | No arg converted, results in  '%' char in result.              |

**[[1]]** Uses lowercase exponential format if exponent is less than -4 or not less than precision, decimal format otherwise.
**[[2]]** Uses uppercase exponential format if exponent is less than -4 or not less than precision, decimal format otherwise.
Flag Meaning

- `#` The value conversion will use the “alternate form” (where defined below).
- `0` The conversion will be zero padded for numeric values.
- `-` The converted value is left adjusted (overrides the '0' conversion if both are given).
- `' '` _(a space)_ A blank should be left before a positive number (or empty string) produced by a signed conversion.
- `+` A sign character ('+' or '-') will precede the conversion (overrides a “space” flag).

A length modifier (h, l, or L) may be present, but is ignored as it is not necessary for Python – so e.g. %ld is identical to %d.

Finally, the type determines how the data should be presented.

The available string presentation types are:



The above is from the manual/documentation, I think it refers to another language

```py
#To embed a string in output use %s
print("%s %s %s" % ('I like the quote', quote, multi_line_quote))

print("%c is my %s letter and my number %d number is %.5f" % ('X', 'favorite', 1, .14))
#>>>X is my favorite letter and my number 1 number is 0.14000

print "%s %s" % ('Hello','Portland')
#Hello Portland

#You can also perform math with it, internally (as in inside the description for it)
x=3
print "%s + %i = %i" % ('3',x, x+x)
3 + 3 = 6

```

[Reference for formatted Printing](https://www.python-course.eu/python3_formatted_output.php)
See more in the [Basics-Literals Section](# ### Literals)

#### Print integer with commas (1,000,000)

This has a simple format:

```py
number = 3729
"{:,}".format(number)
>>> '3,729'
```

!!!info **Advanced Specification**


## TO DO Edit Dowq

Format strings contain “replacement fields” surrounded by curly braces {}. Anything that is not contained in braces is considered literal text, which is copied unchanged to the output. If you need to include a brace character in the literal text, it can be escaped by doubling: {{ and }}.

The grammar for a replacement field is as follows:

            replacement_field ::=  "{" [field_name] ["!" conversion] [":" format_spec] "}"
            field_name        ::=  arg_name ("." attribute_name | "[" element_index "]")*
            arg_name          ::=  [identifier | digit+]
            attribute_name    ::=  identifier
            element_index     ::=  digit+ | index_string
            index_string      ::=  <any source character except "]"> +
            conversion        ::=  "r" | "s" | "a"
            format_spec       ::=  <described in the next section>

The field_name itself begins with an arg_name that is either a number or a keyword. If it’s a number, it refers to a positional argument, and if it’s a keyword, it refers to a named keyword argument. If the numerical arg_names in a format string are 0, 1, 2, … in sequence, they can all be omitted (not just some) and the numbers 0, 1, 2, … will be automatically inserted in that order. Because arg_name is not quote-delimited, it is not possible to specify arbitrary dictionary keys (e.g., the strings '10' or ':-]') within a format string. The arg_name can be followed by any number of index or attribute expressions. An expression of the form '.name' selects the named attribute using getattr(), while an expression of the form '[index]' does an index lookup using __getitem__()

The conversion field causes a type coercion before formatting. Normally, the job of formatting a value is done by the __format__() method of the value itself. However, in some cases it is desirable to force a type to be formatted as a string, overriding its own definition of formatting. By converting the value to a string before calling __format__(), the normal formatting logic is bypassed.

Three conversion flags are currently supported: '!s' which calls str() on the value, '!r' which calls repr() and '!a' which calls ascii().

Some examples:

"Harold's a clever {0!s}"        # Calls str() on the argument first
"Bring out the holy {name!r}"    # Calls repr() on the argument first
"More {!a}"                      # Calls ascii() on the argument first
The format_spec field contains a specification of how the value should be presented, including such details as field width, alignment, padding, decimal precision and so on. Each value type can define its own “formatting mini-language” or interpretation of the format_spec.

Most built-in types support a common formatting mini-language, which is described in the next section.

A format_spec field can also include nested replacement fields within it. These nested replacement fields may contain a field name, conversion flag and format specification, but deeper nesting is not allowed. The replacement fields within the format_spec are substituted before the format_spec string is interpreted. This allows the formatting of a value to be dynamically specified.\

    The general form of a standard format specifier [[format_spec]] is:
        format_spec     ::=  [[fill]align][sign][#][0][width][grouping_option][.precision][type]
        fill            ::=  <any character>
        align           ::=  "<" | ">" | "=" | "^"
        sign            ::=  "+" | "-" | " "
        width           ::=  digit+
        grouping_option ::=  "_" | ","
        precision       ::=  digit+
        type            ::=  "b" | "c" | "d" | "e" | "E" | "f" | "F" | "g" | "G" | "n" | "o" | "s" | "x" | "X" | "%"

##### Align

**[[<]]** - Forces the field to be left-aligned within the available space (this is the default for most objects).
**[[>]]** - Forces the field to be right-aligned within the available space (this is the default for numbers).
**[[=]]** - Forces the padding to be placed after the sign (if any) but before the digits. This is used for printing fields in the form ‘+000000120’. This alignment option is only valid for numeric types. It becomes the default when ‘0’ immediately precedes the field width.
**[[^]]** - Forces the field to be centered within the available space.

##### Sign

__Numbers Only__
**[[+]]** - indicates that a sign should be used for both positive as well as negative numbers.
**[[-]]** - indicates that a sign should be used only for negative numbers (this is the default behavior).
**[[s]]** -   indicates that a leading space should be used on positive numbers, and a minus sign on negative numbers.

**[[#]]** - option causes the “alternate form” to be used for the conversion

##### Grouping Option

**[[,]]** - option signals the use of a comma for a thousands separator. For a locale aware separator, use the **[[n]]** - integer presentation type instead.
**[[_]]** - option signals the use of an underscore for a thousands separator for floating point presentation types and for integer presentation type 'd'. For integer presentation types 'b', 'o', 'x', and 'X', underscores will be inserted every 4 digits (3.6+)

**The available string presentation types are:**
**[[s]]** - String format. This is the default type for strings and may be omitted.
[[None]] - The same as 's'.


##### Type

**The available integer presentation types are:**

**[[b]]** - Binary format. Outputs the number in base 2.
**[[c]]** - Character. Converts the integer to the corresponding unicode character before printing.
**[[d]]** - Decimal Integer. Outputs the number in base 10.
**[[o]]** - Octal format. Outputs the number in base 8.
**[[x]]** - Hex format. Outputs the number in base 16, using lower-case letters for the digits above 9.
**[[X]]** - Hex format. Outputs the number in base 16, using upper-case letters for the digits above 9.
**[[n]]** - Number. This is the same as 'd', except that it uses the current locale setting to insert the appropriate number separator characters.
[[None]] - The same as 'd'.

**The available presentation types for floating point and decimal values are:**


**[[e]]** - Exponent notation. Prints the number in scientific notation using the letter ‘e’ to indicate the exponent. The default precision is 6.
**[[E]]** - Exponent notation. Same as **[[e]]** - except it uses an upper case ‘E’ as the separator character.
**[[f]]** - Fixed-point notation. Displays the number as a fixed-point number. The default precision is 6.
**[[F]]** - Fixed-point notation. Same as 'f', but converts nan to NAN and inf to INF.
**[[g]]** - General format. For a given precision p >= 1, this rounds the number to p significant digits and then formats the result in either fixed-point format or in scientific notation, depending on its magnitude.

The precise rules are as follows: suppose that the result formatted with presentation type **[[e]]** - and precision p-1 would have exponent exp. Then if -4 <= exp < p, the number is formatted with presentation type **[[f]]** - and precision p-1-exp. Otherwise, the number is formatted with presentation type **[[e]]** - and precision p-1. In both cases insignificant trailing zeros are removed from the significand, and the decimal point is also removed if there are no remaining digits following it.

Positive and negative infinity, positive and negative zero, and nans, are formatted as inf, -inf, 0, -0 and nan respectively, regardless of the precision.

A **precision of 0** is treated as equivalent to a precision of 1. The default precision is 6.

**[[G]]** - General format. Same as **[[g]]** - except switches to **[[E]]** - if the number gets too large. The representations of infinity and NaN are uppercased, too.
**[[n]]** - Number. This is the same as 'g', except that it uses the current locale setting to insert the appropriate number separator characters.
**[[%]]** - Percentage. Multiplies the number by 100 and displays in fixed ('f') format, followed by a percent sign.
[[None]] - Similar to 'g', except that fixed-point notation, when used, has at least one digit past the decimal point. The default precision is as high as needed to represent the particular value. The overall effect is to match the output of str() as altered by the other format modifiers.


```py
Some simple format string examples:

"First, thou shalt count to {0}"  # References first positional argument
"Bring me a {}"                   # Implicitly references the first positional argument
"From {} to {}"                   # Same as "From {0} to {1}"
"My quest is {name}"              # References keyword argument 'name'
"Weight in tons {0.weight}"       # 'weight' attribute of first positional arg
"Units destroyed: {players[0]}"   # First element of keyword argument 'players'.

Accessing arguments by position:

>>>
>>> '{0}, {1}, {2}'.format('a', 'b', 'c')
'a, b, c'
>>> '{}, {}, {}'.format('a', 'b', 'c')  # 3.1+ only
'a, b, c'
>>> '{2}, {1}, {0}'.format('a', 'b', 'c')
'c, b, a'
>>> '{2}, {1}, {0}'.format(*'abc')      # unpacking argument sequence
'c, b, a'
>>> '{0}{1}{0}'.format('abra', 'cad')   # arguments' indices can be repeated
'abracadabra'

#Accessing arguments by name:
>>> 'Coordinates: {latitude}, {longitude}'.format(latitude='37.24N', longitude='-115.81W')
'Coordinates: 37.24N, -115.81W'
>>> coord = {'latitude': '37.24N', 'longitude': '-115.81W'}
>>> 'Coordinates: {latitude}, {longitude}'.format(**coord)
'Coordinates: 37.24N, -115.81W'


#Accessing arguments’ attributes:
>>>
>>> c = 3-5j
>>> ('The complex number {0} is formed from the real part {0.real} '
...  'and the imaginary part {0.imag}.').format(c)
'The complex number (3-5j) is formed from the real part 3.0 and the imaginary part -5.0.'
>>> class Point:
...     def __init__(self, x, y):
...         self.x, self.y = x, y
...     def __str__(self):
...         return 'Point({self.x}, {self.y})'.format(self=self)
...
>>> str(Point(4, 2))
'Point(4, 2)'


#Accessing arguments’ items:
>>>
>>> coord = (3, 5)
>>> 'X: {0[0]};  Y: {0[1]}'.format(coord)
'X: 3;  Y: 5'

#Replacing %s and %r:
>>>
>>> "repr() shows quotes: {!r}; str() doesn't: {!s}".format('test1', 'test2')
"repr() shows quotes: 'test1'; str() doesn't: test2"

>>>
#Aligning the text and specifying a width:
>>> '{:<30}'.format('left aligned')
'left aligned                  '
>>> '{:>30}'.format('right aligned')
'                 right aligned'
>>> '{:^30}'.format('centered')
'           centered           '
>>> '{:*^30}'.format('centered')  # use '*' as a fill char
'***********centered***********'

#Replacing %+f, %-f, and % f and specifying a sign:
>>>
>>> '{:+f}; {:+f}'.format(3.14, -3.14)  # show it always
'+3.140000; -3.140000'
>>> '{: f}; {: f}'.format(3.14, -3.14)  # show a space for positive numbers
' 3.140000; -3.140000'
>>> '{:-f}; {:-f}'.format(3.14, -3.14)  # show only the minus -- same as '{:f}; {:f}'
'3.140000; -3.140000'

#Replacing %x and %o and converting the value to different bases:
>>>
>>> # format also supports binary numbers
>>> "int: {0:d};  hex: {0:x};  oct: {0:o};  bin: {0:b}".format(42)
'int: 42;  hex: 2a;  oct: 52;  bin: 101010'
>>> # with 0x, 0o, or 0b as prefix:
>>> "int: {0:d};  hex: {0:#x};  oct: {0:#o};  bin: {0:#b}".format(42)
'int: 42;  hex: 0x2a;  oct: 0o52;  bin: 0b101010'

#Using the comma as a thousands separator:
>>>
>>> '{:,}'.format(1234567890)
'1,234,567,890'

#Expressing a percentage:
>>>
>>> points = 19
>>> total = 22
>>> 'Correct answers: {:.2%}'.format(points/total)
'Correct answers: 86.36%'

#Using type-specific formatting:
>>>
>>> import datetime
>>> d = datetime.datetime(2010, 7, 4, 12, 15, 58)
>>> '{:%Y-%m-%d %H:%M:%S}'.format(d)
'2010-07-04 12:15:58'

#Nesting arguments and more complex examples:
>>>
>>> for align, text in zip('<^>', ['left', 'center', 'right']):
...     '{0:{fill}{align}16}'.format(text, fill=align, align=align)
...
'left<<<<<<<<<<<<'
'^^^^^center^^^^^'
'>>>>>>>>>>>right'
>>>
>>> octets = [192, 168, 0, 1]
>>> '{:02X}{:02X}{:02X}{:02X}'.format(*octets)
'C0A80001'
>>> int(_, 16)
3232235521
>>>
>>> width = 5
>>> for num in range(5,12):
...     for base in 'dXob':
...         print('{0:{width}{base}}'.format(num, base=base, width=width), end=' ')
...     print()
...
    5     5     5   101
    6     6     6   110
    7     7     7   111
    8     8    10  1000
    9     9    11  1001
   10     A    12  1010
   11     B    13  1011
```
#### My Examples


```py
urlsub1 = 202
url_start = 1
"https://image.flaticon.com/icons/svg/{0:0=3d}/{0:0=3d}{1:0=3d}.svg".format(urlsub1, url_start)

```


### Boolean

```py
True
False
true
false
```

True and False must be capitalized.

In the context of Boolean operations, and also when expressions are used by control flow statements, the following values are interpreted as false: `False`, `None`, **numeric zero of all types,** and **empty strings and containers** (including **strings,** **tuples,** **lists,** **dictionaries,** **sets** and **frozensets).** All other values are interpreted as true. (See the **nonzero**() special method for a way to change this.)

### A note on comparison

Mutable objects will be un-equal unless they are the same object, because comparisons are based upon a hash.

Only Immutable Objects are hashable. ANd thus comprable. (Tuples)

## ERROR Handling

[Error Tutorial](https://docs.python.org/3/tutorial/errors.html)

[Error Types](https://docs.python.org/3/library/exceptions.html)

Syntax is similar to Java, and probably other languages.

### Try Catch Syntax

```py
while True:
    try:
        x = int(input("Please enter a number"))
        break
    except ValueError:
        print("Oops, that was no valid number. Try again...")
```

A more complicated and complete but generic example:

```py
import sys  #for the traceback
def exampleMethod(*args):
    try:
    #statements to try

    except <exceptionType>:
        #the error handling progresses down the list. Super types will catch subtypes if they come before
        #multiple types can be passed as well as a tuple requires '()'
    except (RuntimeError, TypeError, NameError):
        #handling code.
    except:
        #adding an except without a type is risky, but catches all. Should go at the end.
        tb = sys.exc_info()[2] #requires `import sys`
        raise OtherException(...).with_traceback(tb)
    except Exception as e: # Exception is the most base class, catches all. 'as e' shorter I guess.
        print('Error:', e)
    else:
        #Unusal Python bit- code that is executed IF NO EXCEPTION occurrs.
    finally:
        #finally handling
```

A finally clause is always executed before leaving the try statement, whether an exception has occurred or not.

`except` can catch the error type.

- can accept tuples except(A, B, C):
- can be blank - except:
- will take the first candidate that applies.  Should get more specific to less.

Sometimes the tabstop is greater, sometimes equal?

`raise` will throw an error.

`else` is code that, when present, must follow all except clauses. It's code that will be executed if the try clause **does not raise an exception.**

`finally` - "A finally clause is always executed before leaving the try statement, whether an exception has occurred or not. When an exception has occurred in the try clause and has not been handled by an except clause (or it has occurred in an except or else clause), it is re-raised after the finally clause has been executed. The finally clause is also executed “on the way out” when any other clause of the try statement is left via a break, continue or return statement."

If an exception occurs which does not match the exception named in the except clause, it is passed on to outer try statements; if no handler is found, it is an **unhandled exception** and **execution stops** with a message.

`raise` -throw equivalent in Java- raise a new exception.

`with_traceback(tb)` This method sets tb as the new traceback for the exception and returns the exception object. It is usually used in exception handling code like the example above.

`as e` - just gives an alias, shorter.

### Error Types

- `BaseException` - the most base class
  - `Exception`
  - Arithmetic Error
    - OverflowError
    - ZeroDivisionError
    - FloatingPointError
  - BufferError
  - LookupError -
    - IndexError
    - KeyError


The base exception and the 4 immedietly under it are base types.

!!!Info Exception- class inheritence
        BaseException
        +-- SystemExit
        +-- KeyboardInterrupt
        +-- GeneratorExit
        +-- Exception
            +-- **User Errors** -
            +-- StopIteration
            +-- StopAsyncIteration
            +-- ArithmeticError
            |    +-- FloatingPointError
            |    +-- OverflowError
            |    +-- ZeroDivisionError
            +-- AssertionError
            +-- AttributeError
            +-- BufferError
            +-- EOFError
            +-- ImportError
            |    +-- ModuleNotFoundError
            +-- LookupError
            |    +-- IndexError
            |    +-- KeyError
            +-- MemoryError
            +-- NameError
            |    +-- UnboundLocalError
            +-- OSError
            |    +-- BlockingIOError
            |    +-- ChildProcessError
            |    +-- ConnectionError
            |    |    +-- BrokenPipeError
            |    |    +-- ConnectionAbortedError
            |    |    +-- ConnectionRefusedError
            |    |    +-- ConnectionResetError
            |    +-- FileExistsError
            |    +-- FileNotFoundError
            |    +-- InterruptedError
            |    +-- IsADirectoryError
            |    +-- NotADirectoryError
            |    +-- PermissionError
            |    +-- ProcessLookupError
            |    +-- TimeoutError
            +-- ReferenceError
            +-- RuntimeError
            |    +-- NotImplementedError
            |    +-- RecursionError
            +-- SyntaxError
            |    +-- IndentationError
            |         +-- TabError
            +-- SystemError
            +-- TypeError
            +-- ValueError
            |    +-- UnicodeError
            |         +-- UnicodeDecodeError
            |         +-- UnicodeEncodeError
            |         +-- UnicodeTranslateError
            +-- Warning
                +-- DeprecationWarning
                +-- PendingDeprecationWarning
                +-- RuntimeWarning
                +-- SyntaxWarning
                +-- UserWarning
                +-- FutureWarning
                +-- ImportWarning
                +-- UnicodeWarning
                +-- BytesWarning
                +-- ResourceWarning

#### Notes on Each...

`BaseException`

+-- `SystemExit`

+-- `KeyboardInterrupt` -  inherits from `BaseException` so its not accidentally caught by code catching `Exception` and prevent exiting.

+-- `GeneratorExit` - directly inherits from `BaseException` instead of `Exception` since it is technically not an error.

+-- `Exception`- All built-in, **non-system-exiting** exceptions and All **user-defined exceptions** should also be derived from this class.

  +-- **User Errors** -

  +-- `StopIteration` - Raised by built-in function `next()` and an iterator’s `__next__()` method to signal that there are no further items produced by the iterator.

  +-- `StopAsyncIteration` - Must be raised by `__anext__()` method of an asynchronous iterator object to stop the iteration.

  +-- `ArithmeticError`

  |    +-- `FloatingPointError`

  |    +-- `OverflowError` - Raised when the result of an arithmetic operation is too large to be represented. cannot occur for integers (which would rather raise MemoryError than give up).

  |    +-- `ZeroDivisionError`

  +-- `AssertionError`

  +-- `AttributeError`

  +-- `BufferError`

  +-- `EOFError`

  +-- `ImportError`

  |    +-- `ModuleNotFoundError`

  +-- `LookupError`

  |    +-- `IndexError`

  |    +-- `KeyError`

  +-- `MemoryError`

  +-- `NameError`

  |    +-- `UnboundLocalError`

  +-- `OSError`

  |    +-- `BlockingIOError`

  |    +-- `ChildProcessError`

  |    +-- `ConnectionError`

  |    |    +-- `BrokenPipeError`

  |    |    +-- `ConnectionAbortedError`

  |    |    +-- `ConnectionRefusedError`

  |    |    +-- `ConnectionResetError`

  |    +-- `FileExistsError`

  |    +-- `FileNotFoundError`

  |    +-- `InterruptedError`

  |    +-- `IsADirectoryError`

  |    +-- `NotADirectoryError`

  |    +-- `PermissionError`

  |    +-- `ProcessLookupError`

  |    +-- `TimeoutError`

  +-- `ReferenceError` This exception is raised when a weak reference proxy, created by the weakref.proxy() function, is used to access an attribute of the referent after it has been garbage collected. (see https://docs.python.org/3/library/weakref.html#module-weakref)

  +-- `RuntimeError` Raised when an error is detected that **doesn’t fall in any of the other categories.** The associated value is a string indicating what precisely went wrong.

  |    +-- `NotImplementedError`

  |    +-- `RecursionError` -  raised when the interpreter detects that the maximum recursion depth (see sys.getrecursionlimit()) is exceeded

  +-- `SyntaxError` Raised when the parser encounters a syntax error. This may occur in an import statement, in a call to the built-in functions `exec()` or `eval()`, or when reading the initial script or standard input (also interactively). Instances of this class have attributes *_filename,_* *_lineno,_* *_offset_* and *_text_* for easier access to the details. _`str()`_ of the exception instance returns only the message.

  |    +-- `IndentationError`

  |         +-- `TabError`

  +-- `SystemError`

  +-- `TypeError`

  +-- `ValueError`

  |    +-- `UnicodeError`

  |         +-- `UnicodeDecodeError`

  |         +-- `UnicodeEncodeError`

  |         +-- `UnicodeTranslateError`

  +-- `Warning`

   + `DeprecationWarning`

      +-- `PendingDeprecationWarning`

      +-- `RuntimeWarning`

      +-- `SyntaxWarning`
        +-- `UserWarning`
        +-- `FutureWarning`
        +-- `ImportWarning`
        +-- `UnicodeWarning`
        +-- `BytesWarning`
        +-- `ResourceWarning`

#### Retrieving a List

You can get a list of all the current errors that are present- e.g. list all the subclasses of `Exception` with this code- adapted from [here](https://stackoverflow.com/questions/3862310/how-to-find-all-the-subclasses-of-a-class-given-its-name):

```py
def allSubclasses(cls):
    return set(cls.__subclasses__()).union([s for c in cls.__subclasses__() for s in allSubclasses(c)])

print(allSubclasses(Exception))
```

in the above list, the ones prefixed with a module are implemented in a module.  Only the ones without periods are found in Base.  Comparing this list with the doc produces an exact match.

#### Cystom Error Types

```py
class Error(Exception):
    """Base class for exceptions in this module."""
    pass

class InputError(Error):

    def __init__(self, expression, message):
        self.expression = expression
        self.message = message

class TransitionErrpr(Error):
    """doc string
    Attributes:
        previous - state at beginning of transition
        next - attempted new state
        message - explanation of why the specific transition is not allowed
    """

    def __init__(self, previous, next, message):
        self.previous = previous
        self.next = next
        self.message = message
```

### Errno

errno.errorcode
Dictionary providing a mapping from the errno value to the string name in the underlying system. For instance, errno.errorcode[errno.EPERM] maps to 'EPERM'.

To translate a numeric error code to an error message, use os.strerror().

Of the following list, symbols that are not used on the current platform are not defined by the module. The specific list of defined symbols is available as errno.errorcode.keys(). Symbols available can include:

- errno.EPERM - Operation not permitted
- errno.ENOENT - No such file or directory
- errno.ESRCH - No such process
- errno.EINTR - Interrupted system call
- errno.EIO - I/O error
- errno.ENXIO - No such device or address
- errno.E2BIG - Arg list too long
- errno.ENOEXEC - Exec format error
- errno.EBADF - Bad file number
- errno.ECHILD - No child processes
- errno.EAGAIN - Try again
- errno.ENOMEM - Out of memory
- errno.EACCES - Permission denied
- errno.EFAULT - Bad address
- errno.ENOTBLK - Block device required
- errno.EBUSY - Device or resource busy
- errno.EEXIST - File exists
- errno.EXDEV - Cross-device link
- errno.ENODEV - No such device
- errno.ENOTDIR - Not a directory
- errno.EISDIR - Is a directory
- errno.EINVAL - Invalid argument
- errno.ENFILE - File table overflow
- errno.EMFILE - Too many open files
- errno.ENOTTY - Not a typewriter
- errno.ETXTBSY - Text file busy
- errno.EFBIG - File too large
- errno.ENOSPC - No space left on device
- errno.ESPIPE - Illegal seek
- errno.EROFS - Read-only file system
- errno.EMLINK - Too many links
- errno.EPIPE - Broken pipe
- errno.EDOM - Math argument out of domain of func
- errno.ERANGE - Math result not representable
- errno.EDEADLK - Resource deadlock would occur
- errno.ENAMETOOLONG - File name too long
- errno.ENOLCK - No record locks available
- errno.ENOSYS - Function not implemented
- errno.ENOTEMPTY - Directory not empty
- errno.ELOOP - Too many symbolic links encountered
- errno.EWOULDBLOCK - Operation would block
- errno.ENOMSG - No message of desired type
- errno.EIDRM - Identifier removed
- errno.ECHRNG - Channel number out of range
- errno.EL2NSYNC - Level 2 not synchronized
- errno.EL3HLT - Level 3 halted
- errno.EL3RST - Level 3 reset
- errno.ELNRNG - Link number out of range
- errno.EUNATCH - Protocol driver not attached
- errno.ENOCSI - No CSI structure available
- errno.EL2HLT - Level 2 halted
- errno.EBADE - Invalid exchange
- errno.EBADR - Invalid request descriptor
- errno.EXFULL - Exchange full
- errno.ENOANO - No anode
- errno.EBADRQC - Invalid request code
- errno.EBADSLT - Invalid slot
- errno.EDEADLOCK - File locking deadlock error
- errno.EBFONT - Bad font file format
- errno.ENOSTR - Device not a stream
- errno.ENODATA - No data available
- errno.ETIME - Timer expired
- errno.ENOSR - Out of streams resources
- errno.ENONET - Machine is not on the network
- errno.ENOPKG - Package not installed
- errno.EREMOTE - Object is remote
- errno.ENOLINK - Link has been severed
- errno.EADV - Advertise error
- errno.ESRMNT - Srmount error
- errno.ECOMM - Communication error on send
- errno.EPROTO - Protocol error
- errno.EMULTIHOP - Multihop attempted
- errno.EDOTDOT - RFS specific error
- errno.EBADMSG - Not a data message
- errno.EOVERFLOW - Value too large for defined data type
- errno.ENOTUNIQ - Name not unique on network
- errno.EBADFD - File descriptor in bad state
- errno.EREMCHG - Remote address changed
- errno.ELIBACC - Can not access a needed shared library
- errno.ELIBBAD - Accessing a corrupted shared library
- errno.ELIBSCN - .lib section in a.out corrupted
- errno.ELIBMAX - Attempting to link in too many shared libraries
- errno.ELIBEXEC - Cannot exec a shared library directly
- errno.EILSEQ - Illegal byte sequence
- errno.ERESTART - Interrupted system call should be restarted
- errno.ESTRPIPE - Streams pipe error
- errno.EUSERS - Too many users
- errno.ENOTSOCK - Socket operation on non-socket
- errno.EDESTADDRREQ - Destination address required
- errno.EMSGSIZE - Message too long
- errno.EPROTOTYPE - Protocol wrong type for socket
- errno.ENOPROTOOPT - Protocol not available
- errno.EPROTONOSUPPORT - Protocol not supported
- errno.ESOCKTNOSUPPORT - Socket type not supported
- errno.EOPNOTSUPP - Operation not supported on transport endpoint
- errno.EPFNOSUPPORT - Protocol family not supported
- errno.EAFNOSUPPORT - Address family not supported by protocol
- errno.EADDRINUSE - Address already in use
- errno.EADDRNOTAVAIL - Cannot assign requested address
- errno.ENETDOWN - Network is down
- errno.ENETUNREACH - Network is unreachable
- errno.ENETRESET - Network dropped connection because of reset
- errno.ECONNABORTED - Software caused connection abort
- errno.ECONNRESET - Connection reset by peer
- errno.ENOBUFS - No buffer space available
- errno.EISCONN - Transport endpoint is already connected
- errno.ENOTCONN - Transport endpoint is not connected
- errno.ESHUTDOWN - Cannot send after transport endpoint shutdown
- errno.ETOOMANYREFS - Too many references: cannot splice
- errno.ETIMEDOUT - Connection timed out
- errno.ECONNREFUSED - Connection refused
- errno.EHOSTDOWN - Host is down
- errno.EHOSTUNREACH - No route to host
- errno.EALREADY - Operation already in progress
- errno.EINPROGRESS - Operation now in progress
- errno.ESTALE - Stale NFS file handle
- errno.EUCLEAN - Structure needs cleaning
- errno.ENOTNAM - Not a XENIX named type file
- errno.ENAVAIL - No XENIX semaphores available
- errno.EISNAM - Is a named type file
- errno.EREMOTEIO - Remote I/O error
- errno.EDQUOT - Quota exceeded

### Traceback

Traceback Examples
This simple example implements a basic read-eval-print loop, similar to (but less useful than) the standard Python interactive interpreter loop. For a more complete implementation of the interpreter loop, refer to the code module.

```py
import sys, traceback

def run_user_code(envdir):
    source = input(">>> ")
    try:
        exec(source, envdir)
    except Exception:
        print("Exception in user code:")
        print("-"*60)
        traceback.print_exc(file=sys.stdout)
        print("-"*60)

envdir = {}
while True:
    run_user_code(envdir)
```

The following example demonstrates the different ways to print and format the exception and traceback:

```py
import sys, traceback

def lumberjack():
    bright_side_of_death()

def bright_side_of_death():
    return tuple()[0]

try:
    lumberjack()
except IndexError:
    exc_type, exc_value, exc_traceback = sys.exc_info()
    print("*** print_tb:")
    traceback.print_tb(exc_traceback, limit=1, file=sys.stdout)
    print("*** print_exception:")
    # exc_type below is ignored on 3.5 and later
    traceback.print_exception(exc_type, exc_value, exc_traceback,
                              limit=2, file=sys.stdout)
    print("*** print_exc:")
    traceback.print_exc(limit=2, file=sys.stdout)
    print("*** format_exc, first and last line:")
    formatted_lines = traceback.format_exc().splitlines()
    print(formatted_lines[0])
    print(formatted_lines[-1])
    print("*** format_exception:")
    # exc_type below is ignored on 3.5 and later
    print(repr(traceback.format_exception(exc_type, exc_value,
                                          exc_traceback)))
    print("*** extract_tb:")
    print(repr(traceback.extract_tb(exc_traceback)))
    print("*** format_tb:")
    print(repr(traceback.format_tb(exc_traceback)))
    print("*** tb_lineno:", exc_traceback.tb_lineno)
```

The output for the example would look similar to this:

```py
*** print_tb:
  File "<doctest...>", line 10, in <module>
    lumberjack()
*** print_exception:
Traceback (most recent call last):
  File "<doctest...>", line 10, in <module>
    lumberjack()
  File "<doctest...>", line 4, in lumberjack
    bright_side_of_death()
IndexError: tuple index out of range
*** print_exc:
Traceback (most recent call last):
  File "<doctest...>", line 10, in <module>
    lumberjack()
  File "<doctest...>", line 4, in lumberjack
    bright_side_of_death()
IndexError: tuple index out of range
*** format_exc, first and last line:
Traceback (most recent call last):
IndexError: tuple index out of range
*** format_exception:
['Traceback (most recent call last):\n',
 '  File "<doctest...>", line 10, in <module>\n    lumberjack()\n',
 '  File "<doctest...>", line 4, in lumberjack\n    bright_side_of_death()\n',
 '  File "<doctest...>", line 7, in bright_side_of_death\n    return tuple()[0]\n',
 'IndexError: tuple index out of range\n']
*** extract_tb:
[<FrameSummary file <doctest...>, line 10 in <module>>,
 <FrameSummary file <doctest...>, line 4 in lumberjack>,
 <FrameSummary file <doctest...>, line 7 in bright_side_of_death>]
*** format_tb:
['  File "<doctest...>", line 10, in <module>\n    lumberjack()\n',
 '  File "<doctest...>", line 4, in lumberjack\n    bright_side_of_death()\n',
 '  File "<doctest...>", line 7, in bright_side_of_death\n    return tuple()[0]\n']
*** tb_lineno: 10


```
The following example shows the different ways to print and format the stack:

```py
>>> import traceback
>>> def another_function():
...     lumberstack()
...
>>> def lumberstack():
...     traceback.print_stack()
...     print(repr(traceback.extract_stack()))
...     print(repr(traceback.format_stack()))
...
>>> another_function()
  File "<doctest>", line 10, in <module>
    another_function()
  File "<doctest>", line 3, in another_function
    lumberstack()
  File "<doctest>", line 6, in lumberstack
    traceback.print_stack()
[('<doctest>', 10, '<module>', 'another_function()'),
 ('<doctest>', 3, 'another_function', 'lumberstack()'),
 ('<doctest>', 7, 'lumberstack', 'print(repr(traceback.extract_stack()))')]
['  File "<doctest>", line 10, in <module>\n    another_function()\n',
 '  File "<doctest>", line 3, in another_function\n    lumberstack()\n',
 '  File "<doctest>", line 8, in lumberstack\n    print(repr(traceback.format_stack()))\n']
```

This last example demonstrates the final few formatting functions:

```py
>>> import traceback
>>> traceback.format_list([('spam.py', 3, '<module>', 'spam.eggs()'),
...                        ('eggs.py', 42, 'eggs', 'return "bacon"')])
['  File "spam.py", line 3, in <module>\n    spam.eggs()\n',
 '  File "eggs.py", line 42, in eggs\n    return "bacon"\n']
>>> an_error = IndexError('tuple index out of range')
>>> traceback.format_exception_only(type(an_error), an_error)
['IndexError: tuple index out of range\n']

```
## LISTS, TUPLES and DICTIONARIES

| `LISTS`           | **TUPLES**         | _DICTIONARES_             |                                                                                              |
| ----------------- | ------------------ | ------------------------- | -------------------------------------------------------------------------------------------- |
| dunder            | methods            |                           |                                                                                              |
| list methods      | tuple equivalent   | works in dictionaries     | descriptions                                                                                 |
| x is a List       |                    |                           |                                                                                              |
| x+**L**           | yes                | no                        | y=list (0)                                                                                   |
| x[i]=**L**        | no                 | yes, where y is a key     | set item                                                                                     |
| x[i:j]=**L**      | no                 | no                        | set items (1)                                                                                |
| y in x            | yes                | Yes, only searches keys   | x must be an item in a list. not another list(2)                                             |
| del x[y]          | no                 | yes, where y is a key     | remove y (int)                                                                               |
| del x[i:j]        | no                 | no                        | remove i through j (ints) (1)                                                                |
| cmp(x,y)          | yes                | yes                       | compares                                                                                     |
| ----------------- | ------------------ | ------------------------- | -------------------------------------------------------------------------------------------- |
| ==,>=,<=,>,<,!=   | yes                | yes                       | unsure, comparing two lists does equal true in some cases. Length?                           |
| x[y]              | yes                | yes, where y is a key     | lookup 0 indexed value                                                                       |
| x[i:j]            | yes                | no                        | as above a slice (1)                                                                         |
| len(x)            | yes                | yes                       | returns the length of list.                                                                  |
| x+=**L**          | yes,               | no                        | x+=y perform action and set. y must be list. basically append. (3)                           |
| x\*=**L**         | yes                | no                        | multiplies the list by copying itself (4)                                                    |
| repr(x)           | yes                | yes                       | returns a string representation                                                              |
| iter(x)           | yes                | yes                       | uses in iteration                                                                            |
| x\*n              | yes                | no                        | returns the list or tuple that many times in one list or tuple                               |
| explicit          | methods            |                           | definition                                                                                   |
| append(...)       | no                 | no                        | L.append(object) -- append object to end                                                     |
| count(...)        | yes                | no                        | L.count(value) -> integer -- return number of occurrences of value                           |
| extend(...)       | no                 | no                        | L.extend(iterable) -- extend list by appending elements from the iterable                    |
| index(...)        | yes                | no                        | L.index(value, [start, [stop]]) -> integer -- return first index of value. (5)               |
| insert(...)       | no                 | no                        | L.insert(index, object) -- insert object before index                                        |
| pop(...)          | no                 | yes                       | L.pop([index]) -> item -- remove and return item at index (default last).                    |
|                   |                    |                           | similar to L[i]; del L[i](6)                                                                 |
| remove(...)       | no                 | no                        | L.remove(value) -- remove first occurrence of value. (5)                                     |
| reverse(...)      | reversed(l)        | no                        | L.reverse() -- reverse _IN PLACE_                                                            |
| sort(...)         | sorted(t)          | no                        | L.sort(cmp=None, key=None, reverse=False) -- stable sort _IN PLACE_; cmp(x, y) -> -1, 0, 1   |

---

1. appends the List with another
2. Use of negative indices is not supported.
3. For dict to search values, use 'str' in dict_name.values()
4. this works because of rassignment
5. L \* (int) = L + L + L+…(int)
6. Raises ValueError if the value is not present.
7. Raises IndexError if list is empty or index is out of range.

See the [Dictionary](### DICTIONARY or MAP { } - Mutable, heterogeneous)

### [LISTS]

 Lists `[ ]` - Mutable

- A list allows you to create a list of values and manipulate them
- Each value has an index with the first one starting at 0
  **- mutable** and indexed by integers (zero indexed). Shown by **square brackets**.
- Zeroed indexed

Methods demonstrated-

- `L.reverse()` - reverses the order of the list
- `L.sort()` - sorts the order of the lists.
- `sorted(L)` -|changes the list order and returns it without changing L. while `L.sort()` changes L to be ther result.
- `del L[i:j]`- removes a slice
- `repr(L)`|-returns L as a string
- `L.__add__(y)` - dunder method refers to L + y , y must be another List, appends the lists- as L + (list
  - `L + L2` - concatenate two lists.
- `L.append(Obj)` - appends a list
- `L.remove('Str')` - removes the first instance of what it finds

```python
L = [1,2,3]
L=["abc", 123,  0, variable, ["another", "list"] ]

grocery_list = ['Juice', 'Tomatoes', 'Potatoes', 'Bananas']
print('The first item is', grocery_list[1])

#You can change the value stored in a list box
grocery_list[0] = "Green Juice"
print(grocery_list)

#indexing a list position that doesnt exist throws an error.
List= [1, 'a string', A_Variable]
List[3] = -15 #indexing the 4th position, a position that doesnt exist, attempts to redirect the binding of the 4th item and throws an error.

#You can get a subset of the list with [min:up to but not including max]

print(grocery_list[1:3])

#You can put any data type in a a list including a list
other_events = ['Wash Car', 'Pick up Kids', 'Cash Check']
to_do_list = [other_events, grocery_list]

print(to_do_list)

#Get the second item in the second list (Boxes inside of boxes)
print(to_do_list[1][1])

#You add values using append
grocery_list.append('onions')
print(to_do_list)

#Insert item at given index
grocery_list.insert(1, "Pickle")

#Remove item from list
grocery_list.remove("Pickle")

#Sorts items in list
grocery_list.sort()

#Reverse sort items in list
grocery_list.reverse()

#del deletes an item at specified index
del grocery_list[4]
print(to_do_list)

#We can combine lists with a +
to_do_list = other_events + grocery_list
print(to_do_list)

#Get length of list
print(len(to_do_list))

#Get the max item in list
print(max(to_do_list))

#Get the minimum item in list
print(min(to_do_list))
```

#### List store with step

```py
l = [1, 2, 3, 4]
l[0:4:2] = [5, 6]
print(l)
>>>[5, 2, 6, 4]
```

List slice-store 

```py
l = [10, 20]
l[0:1] = range(4)
print(l)
>>>[0, 1, 2, 3, 20]
```

#### List vs. Tuples - MIT Class Example

```py
Ivies = ['Harvard', 'Yale', 'Brown']
Techs = ['MIT', 'CalTech']
Univs = []
Univs.append(Techs)
print Univs #>> [['MIT', 'CalTech']]
Univs.append(Ivies)
print Univs
#>> [['MIT', 'CalTech'], ['Harvard', 'Yale', 'Brown']]


for e in Univs:     #Will return Lists
    print e         #Prints the Lists
    for c in e:     #Nested loop to iterate through sublist
        print c     #Prints each University

```

Because when you appended the list, you didnt append the elements of the list, you appended the lists to the lists. A list can have any data type

#### Flattening or Concatenating a List

You can also concatenate or _flatten the list_

```py3
Univs = Techs + Ivies  #Concatenation
#> ['MIT', 'CalTech', 'Harvard', 'Yale', 'Brown']
```

Remove from a list

```py
Univs.remove('Harvard')
```

#### Mutation

Changing the list cause mutation- eg. the change of the variable in place rather than the creation of an entirely new variable (a la Tuples).

This means that `Ivies[1]=-15` mutates the List of Objects Ivies, rather than re-binding the variable to a new object as in something that is immutable.

```py
myList1 = [1, 2, 3, 4]
myList2 = List1  #This assignment creates a binding - 2 separate paths to the same object.
print myList2
#>>> [1, 2, 3, 4]
myList1[0] = 4
print myList1
#>>> [4, 2, 3, 4]
print myList2
#>>> [4, 2, 3, 4]

A = 1
B = A
A = 2
print B
#>>> 1
```

This is because L2 was bound to the same object as L1. This doesnt occur in the lower object because its not a mutable object. It reassigns A to another object. In the first case its a list, that then refers to n objects, its the lists reference to the nth object that is replaced.
[n1, n2, n3, ...] -> its n1 that is replaced the reference, not the references myList1 and myList2 still refer to the same list.

#### List Comprehension

List comprehensions provide a concise way to create lists. Common applications are to make new lists where each element is the result of some operations applied to each member of another sequence or iterable, or to create a subsequence of those elements that satisfy a certain condition.

For example, assume we want to create a list of squares, like:

```py3
>>> squares = []
>>> for x in range(10):
...     squares.append(x**2)
...
>>> squares
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

Note that this creates (or overwrites) a variable named x that still exists after the loop completes. We can calculate the list of squares without any side effects using:

```py3
squares = list(map(lambda x: x**2, range(10)))
#or, equivalently:
squares = [x**2 for x in range(10)]
```

which is more concise and readable and is a **List Comprehension** or **ListComp**.

A list comprehension *consists of brackets containing an expression followed by a for clause, then zero or more for or if clauses.* The result will be a new list resulting from evaluating the expression in the context of the for and if clauses which follow it. For example, this **listcomp** combines the elements of two lists if they are not equal:

```py3
>>> [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
[(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
```

and it’s equivalent to:

```py3
>>> combs = []
>>> for x in [1,2,3]:
...     for y in [3,1,4]:
...         if x != y:
...             combs.append((x, y))
...
>>> combs
[(1, 3), (1, 4), (2, 3), (2, 1), (2, 4), (3, 1), (3, 4)]
```

More Examples:  `vec = [-4, -2, 0, 2, 4]`

Create a new list with the values doubled
`[x*2 for x in vec]` => [-8, -4, 0, 4, 8]

Filter the list to exclude negative numbers
`[x for x in vec if x >= 0]` => [0, 2, 4]

Apply a function to all the elements
`[abs(x) for x in vec]` => [4, 2, 0, 2, 4]

Call a method on each element
`freshfruit = ['  banana', '  loganberry ', 'passion fruit  ']`
`[weapon.strip() for weapon in freshfruit]` => ['banana', 'loganberry', 'passion fruit']

Create a list of 2-tuples like (number, square)

```py3
>>> [(x, x**2) for x in range(6)]
[(0, 0), (1, 1), (2, 4), (3, 9), (4, 16), (5, 25)]

>>> #the tuple must be parenthesized, otherwise an error is raised
>>> [x, x**2 for x in range(6)]
  File "<stdin>", line 1, in <module>
    [x, x**2 for x in range(6)]
               ^
SyntaxError: invalid syntax
```

Flatten a list using a listcomp with two 'for'
```py3
>>> vec = [[1,2,3], [4,5,6], [7,8,9]]
>>> [num for elem in vec for num in elem]
[1, 2, 3, 4, 5, 6, 7, 8, 9]
```

List comprehensions can contain complex expressions and nested functions:

```py3
>>> from math import pi
>>> [str(round(pi, i)) for i in range(1, 6)]
['3.1', '3.14', '3.142', '3.1416', '3.14159']
```
```py
line_list = ['  line 1\n', 'line 2  \n', ...]

#Generator expression -- returns iterator
stripped_iter = (line.strip() for line in line_list)

#List comprehension -- returns list
stripped_list = [line.strip() for line in line_list]
You can select only certain elements by adding an "if" condition:

stripped_list = [line.strip() for line in line_list
                 if line != ""]
```

##### Nested Comprehension

The initial expression in a list comprehension can be any arbitrary expression, including another list comprehension.

Consider the following example of a 3x4 matrix implemented as a list of 3 lists of length 4.  The following list comprehension will transpose rows and columns:

```py3
>>> matrix = [
...     [1, 2, 3, 4],
...     [5, 6, 7, 8],
...     [9, 10, 11, 12],
... ]
>>>
>>> [[row[i] for row in matrix] for i in range(4)]
[[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]
```

This example takes some unpacking, As we saw in the previous section, the nested listcomp is evaluated in the context of the for that follows it, so this example is equivalent to:

```py3
>>> transposed = []
>>> for i in range(4):
...     transposed.append([row[i] for row in matrix])
...
>>> transposed
[[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]
```

which, in turn, is the same as:

```py3
>>> transposed = []
>>> for i in range(4):
...     # the following 3 lines implement the nested listcomp
...     transposed_row = []
...     for row in matrix:
...         transposed_row.append(row[i])
...     transposed.append(transposed_row)
...
>>> transposed
[[1, 5, 9], [2, 6, 10], [3, 7, 11], [4, 8, 12]]
```

In the real world, you should prefer built-in functions to complex flow statements. The zip() function would do a great job for this use case:

```py3
>>> list(zip(*matrix))
[(1, 5, 9), (2, 6, 10), (3, 7, 11), (4, 8, 12)]
```



#### zip()


zip() takes a set of iterables, and iterates through them pairing them up until one list ends.

```py3
>>> matrix = [
...     [1, 2, 3, 4],
...     [5, 6, 7, 8],
...     [9, 10, 11, 12],
... ]
>>>
>>> list(zip(*matrix))
[(1, 5, 9), (2, 6, 10), (3, 7, 11), (4, 8, 12)]
```

#### del

There is a way to remove an item from a list given its index instead of its value: the del statement. This differs from the pop() method which returns a value. The del statement can also be used to remove slices from a list or clear the entire list (which we did earlier by assignment of an empty list to the slice). For example:

```py
>>> a = [-1, 1, 66.25, 333, 333, 1234.5]
>>> del a[0]
>>> a
[1, 66.25, 333, 333, 1234.5]
>>> del a[2:4]
>>> a
[1, 66.25, 1234.5]
>>> del a[:]
>>> a
[]
```

del can also be used to delete entire variables: `del a`. Referencing the name `a` hereafter is an error (at least until another value is assigned to it). We’ll find other uses for del later.

### (TUPLES)

TUPLES `( )` Immutable

Briefly - _Immutable, parentheses, Ref w/ [], negative from other end, and slice with [start:end], both optional._

You still reference it with square brackets `[ ]` - like everything in python. They are just defined in parentheses `( )`

`pi_tuple = (3, 1, 4, 1, 5, 9)`

In fact, the parentheses, *on input*, are optional:

```py
>>> t = 12345, 54321, 'hello!'
>>> t[0]
12345
>>> t
(12345, 54321, 'hello!')
```

Tuples may be nested:

```py3
... u = t, (1, 2, 3, 4, 5)
>>> u
((12345, 54321, 'hello!'), (1, 2, 3, 4, 5))
```

Values in a `tuple` can't change like `lists`, they are **Immutable**. Note the **Parentheses**. THis is the important indicator.

You can index them and reference them, 'selection', using **[#]** square brackets. Zero indexed.

Giving a negative index starts from the other end. You can also 'slice' with the colon.

Importantly, slicing goes _up to but not including the value_. tuple = (1,2,3,4,5) slice[0:2] >> 1,2, but does not include tuple[2](>3).

```python
my_tuple = (1, 2, 3, 4, 5) #Changed example from pi to better show in/exclusion
my_tuple[0] #>1
my_tuple[2] #>3
my_tuple[-1] #>5
my_tuple[-2] #>4
my_tuple[:3] #>(1,2,3)
my_tuple[1:3] #>(2,3)
my_tuple[2:] #>(3,4,5)
```

#### Tuples of 0 or 1 length

!!!Important Important- it is not sufficient to enclose a single value in parentheses, to make a tuple of lenth=1.

A special problem is the construction of tuples containing 0 or 1 items: the syntax has some extra quirks to accommodate these.

0-  **Empty tuples are constructed by an empty pair of parentheses;**

1- **a tuple with one item is constructed by following a value with a comma.**

```py
>>> empty = ()
>>> singleton = 'hello',    # <-- note trailing comma
>>>#this is equivalent to singleton = ('hello',) the paren is optional on input.
>>> len(empty)
0
>>> len(singleton)
1
>>> singleton
('hello',)

#### Convert tuple into a list

`new_list = list(my_tuple)`

#### Convert a list into a tuple

`new_tuple = tuple(grocery_list)`

#### Other Methods

```py
len(tuple)
min(tuple)
max(tuple)

x = 100
divisors = () #Empty Tuple
for i in range(1, x):
    if x%i == 0:
        divisors = divisors + (i)
```

Functions can return a tuple. Functions that return a tuple need a variable for each, or it will assign a tuple

```py
def func()
    return (1, 2)

var1, var2 = func() #var1 = 1 , var2 = 2

type(var1)
type(var2)
#<type 'int'>
var=func()
type(var)
<type 'tuple'>
```

#### Tuple Packing and Unpacking

The statement` '` is an example of tuple `packing`: the values 12345, 54321 and 'hello!' are packed together in a tuple. The reverse operation is also possible:

```py
>[1]
t = 12345, 54321, 'hello!
t
$>(12345, 54321, 'hello!')
>[2]
x, y, z = t
x
$>x = 12345
z
$>z = 'hello!'
```

This is called, appropriately enough, `sequence unpacking` and works for any sequence on the right-hand side.

Sequence unpacking requires that there are as many variables on the left side of the equals sign as there are elements in the sequence. Note that multiple assignment is really just a combination of tuple packing and sequence unpacking.

#### Gathering and Scattering

Variable Length Inputs and Outputs

This is very similar to the tuple `packing` and `unpacking` above, though the usecase is a bit different.

Functions can take a variable number of arguments. A parameter name that begins with \* gathers arguments into a tuple. For example, printall takes any number of arguments and prints them:

```py
def printall(*args):
    print args
The gather parameter can have any name you like, but args is conventional. Here’s how the function works:

>>> printall(1, 2.0, '3')
(1, 2.0, '3')
```

The complement of gather is scatter. If you have a sequence of values and you want to pass it to a function as multiple arguments, you can use the \* operator. For example, divmod takes exactly two arguments; it doesn’t work with a tuple:

```py
>>> t = (7, 3)
>>> divmod(t)
TypeError: divmod expected 2 arguments, got 1
```

But if you scatter the tuple, it works:

```py
>>> divmod(*t)
(2, 1)
```

#### Sequence Type

As a [sequence](####Sequential Operations) (sequential?) data type, there are some specific operations available

[Main Article](#Sequence-Specific-Operations)


#### Swap

Tuples can be used to quickly swap two variables via tuple assignment:

`a,b = b,a`

#### Assignment

A series of variables and expressions as tubles will be assigned to each other as long as their numbers match:

```py
>>> (a,b,c,d) = (1,2,3,4)
>>> a
1
>>> b
2
>>> c,d
(3, 4)
>>> type(a)
<type 'int'>

>>> addr = 'a.l.timmons@gmail.com'
>>> user, domain = addr.split('@')
>>> user
'a.l.timmons'
>>> domain
'gmail.com'
```

#### zip()

-works similarly to assignment style above taking two sequences and combining them. Taking one from each, until it hits whatever ends first. This may be more tolerant of inequal lengths?

```py
>>> t = range(5)
>>> s= 'andrew'
>>> u = 'Timmons'
>>> zip(s,t,u)
[('a', 0, 'T'), ('n', 1, 'i'), ('d', 2, 'm'), ('r', 3, 'm'), ('e', 4, 'o')]
>>> type(zip(s,t,u))
<type 'list'>
>>> for pair in zip(s,t,u):
        print pair


('a', 0, 'T')
('n', 1, 'i')
('d', 2, 'm')
('r', 3, 'm')
('e', 4, 'o')
```

**Book says this creates a zip object, that then has to be turned into a list with `list(zip(*args))`, however, I get a list at the outset.** This may be a difference with python 2 and 3.

#### Create a Dict from Tuples

You can quickly create a dictionary using `dict()` and `zip()- D = dict(zip(range(4), 'abcd'))`

You can also map multiple pairs using a tuple. **This won't work with lists because they are mutable.** An example given is a phonebook: which has last name and first name pairs refer to a number.

```py
directory[last,first] = number
#where (last,first) is the tuple object that forms a key.
for last, first in directory:
    print(first, last, directory[last,first]) #to print the phonebook.
```

### {DICTIONARY}

Dictionaries or MAPS- marked by `{ }` - Mutable, heterogeneous

Dictionaries, like lists, are mutable, heterogeneous.
But unlike lists, they are unordered, and we have generalized the indexing.
Dictionaries are fast. Values are returned in constant time as opposed to linear time as in Lists.
They have keys and values. Keys can be any data type, strings, objects, integers, etc.

Any Hashable object can be used as a dictionary key. To be hashable, the object has to be immutable- it can't change during its lifetime.

Made up of values with a unique key for each value
Similar to lists, but you can't join dicts with a +

Dictionary Additional Methods

| Dictionary        | Additional Methods                                                                                           |
| ----------------- | ------------------------------------------------------------------------------------------------------------ |
| **init**          |                                                                                                              |
| dict()            | new empty dictionary                                                                                         |
| dict(mapping)     | new dictionary initialized from a mapping object's (key, value) pairs                                        |
| dict(iterable)    | new dictionary initialized as if via: d = {}                                                                 |
|                   | for k, v in iterable:                                                                                        |
|                   | d[k] = v                                                                                                     |
| dict()            | dict(**kwargs) -> new dictionary initialized with the name=value pairs in the keyword argument list. **1\*\* |
| **implicit**      |                                                                                                              |
| D.**contains**(k) | **contains**(...) -> True if D has a key k, else False **2**                                                 |
| k in D            |                                                                                                              |
| x[i]=y            | set item                                                                                                     |
| x[y]              | get item, lookup                                                                                             |
| del x[y]          | delete item                                                                                                  |
| ==,>=,<=,>,<,!=   | comparison, unknown (to me) how this works.                                                                  |
| **explicit**      |                                                                                                              |
| iter(x)           | uses in iteration                                                                                            |
| len(x)            | returns the length of Length                                                                                 |
| repr(x)           | returns the value as a string                                                                                |
| clear(...)        | D.clear() -> None. Remove all items from D.                                                                  |
| copy(...)         | D.copy() -> a shallow copy of D                                                                              |
| fromkeys(...)     | dict.fromkeys(S[,v]) -> New dict with keys from S and values equal to v. **3**                               |
| get(...)          | D.get(k[,d]) -> D[k] if k in D, else d. d defaults to None. **4**                                            |
| has_key(...)      | D.has_key(k) -> True if D has a key k, else False                                                            |
| items(...)        | D.items() -> list of D's (key, value) pairs, as 2-tuples- spits the Dict out as a list of tuples.            |
| iteritems(...)    | D.iteritems() -> an iterator over the (key, value) items of D                                                |
| iterkeys(...)     | D.iterkeys() -> an iterator over the keys of D                                                               |
| itervalues(...)   | D.itervalues() -> an iterator over the values of D                                                           |
| keys(...)         | D.keys() -> list of D's keys                                                                                 |
| pop(...)          | D.pop(k[,d]) -> v, remove specified key and return the corresponding value. **5**                            |
| popitem(...)      | D.popitem() -> (k, v), remove and return some (key, value) pair as a 2-tuple; **6**                          |
| setdefault(...)   | D.setdefault(k[,d]) -> D.get(k,d), also set D[k]=d if k not in D                                             |
| update(...)       | D.update([E, ]**F) -> None. Update D from dict/iterable E and F. **7a-c\*\*\*                                |
| values(...)       | D.values() -> list of D's values                                                                             |
| viewitems(...)    | D.viewitems() -> a set-like object providing a view on D's items                                             |
| viewkeys(...)     | D.viewkeys() -> a set-like object providing a view on D's keys                                               |
| viewvalues(...)   | D.viewvalues() -> an object providing a view on D's values                                                   |

1. For example: dict(one=1, two=2)
2. 'Barkingtreefrog'in bw_grams
3. v defaults to None.
4. printbw_grams.get('Barkingtreefrog','Notfound')
5. If key is not found, d is returned if given, otherwise KeyError is raised
6. raise KeyError if D is empty.
7. If E present and:

- has a .keys() method, does: for k in E: D[k] = E[k]
- lacks .keys() method, does: for (k, v) in E: D[k] = v
- In either case, this is followed by: for k in F: D[k] = F[k]

#### Reverse Lookup

Reverse lookup is difficult. Can use some code:

```python
def reverse_lookup(d, v):
        for k in d:
                if d[k] == v;
                        return k
        raise LookupError()
|
Raise error('details') #Throws error, there is something not correct about this...
```

Raise Statement sends an error, returning a trace along with the quote., Allthough the above code doesn't work in ver 2.7 anyway

Dictionary inversion snippit:

```python
def invert_dict(d):
        inverse = dict()
        for key in d:
                val = d[key]
                if val not in inverse:
                        inverse[val] = [key]
                else:
                        inverse[val].append(key)
        return inverse
```

```python
super_villains = {'Fiddler' : 'Isaac Bowin',
                  'Captain Cold' : 'Leonard Snart',
                  'Weather Wizard' : 'Mark Mardon',
                  'Mirror Master' : 'Sam Scudder',
                  'Pied Piper' : 'Thomas Peterson'}

print(super_villains['Captain Cold'])
```

#### Delete an entry

```python
del super_villains['Fiddler']
print(super_villains)
```

#### Replace a value

```python
super_villains['Pied Piper'] = 'Hartley Rathaway'
```

#### `in` and `not in`

`x in d` returns true or false respectively

```py
>>> 'Fiddler' in super_villains
True
>>> 'Batman' in super_villains
False
>>> 'Batman' not in super_villains
True
```

#### Print the number of items in the dictionary

```python
print(len(super_villains))
```

#### Get the value for the passed key

```python
print(super_villains.get("Pied Piper"))
```

#### Get a list of dictionary keys

```python
print(super_villains.keys())

#or
list(iter(super_villains))
```

#### Get a list of dictionary values

```python
print(super_villains.values())
```

#### List the Key Value pairs

```py
for i in d:
    print i, d[i]
```

You can also get an iterator that contains both keys and values. In Python 2, d.items() returns a list of (key, value) tuples, while d.iteritems() returns an iterator that provides the same:

```py
for k, v in d.iteritems():
    print k, v
```

In Python 3, d.items() returns the iterator; to get a list, you need to pass the iterator to list() yourself.

```py3
for k, v in d.items():
    print(k, v)
```

#### Return a Default Value if not present

```py
d={'a':'apple','b':'ball'}

d.get('c', 'Cat')

#'Cat'
```

#### Sort a Dictionary

If you want to sort the output by dict key you can use the collection package.

```py
import collections
for k, v in collections.OrderedDict(sorted(d.items())).items():
    print(k, v)
```

### RANGES

See the section on Ranges in Iterables.

But, `range` together with `tuples` and `lists`, make up the `Sequence Data Types`.



#### Sequence Specific Operations

[Doc on Sequence Types](https://docs.python.org/3/library/stdtypes.html#typesseq)

### Sets

A set object is an unordered collection of distinct hashable objects. Common uses include membership testing, removing duplicates from a sequence, and computing mathematical operations such as intersection, union, difference, and symmetric difference.

A set display is denoted by curly braces and distinguishable from dictionary displays by the lack of colons separating keys and values: `Set= {'item1', 'item2', 'item3'}`

A set display yields a new mutable set object, the contents being specified by either a sequence of expressions or a comprehension. When a comma-separated list of expressions is supplied, its elements are evaluated from left to right and added to the set object. When a comprehension is supplied, the set is constructed from the elements resulting from the comprehension.

An empty set cannot be constructed with `{}`; this literal constructs an empty dictionary.

[Set Syntax](https://docs.python.org/3/reference/expressions.html#atom-identifiers)



#### Frozensets

Dont know what these are yet

## CONDITIONALS

The `if`, `else` and `elif` statements are used to perform different actions based off of conditions Comparison Operators `: ==, !=, >, <, >=, <=`

- The `if` statement will execute code if a condition is met
- White space is used to group blocks of code in Python
- Use the same number of proceeding spaces for blocks of code
- The **colon** indicates the block follows. Returning to the previous indention level indicates that you have completed the block.

conditional

- if
  - or
  - and
  - not
- elif
- else

The operator not yields True if its argument is false, False otherwise.

Lazy interpretation- The expression x and y first evaluates x; if x is false, its value is returned; otherwise, y is evaluated and the resulting value is returned.

In the context of Boolean operations, and also when expressions are used by control flow statements, the following values are interpreted as false: False, None, numeric zero of all types, and empty strings and containers (including strings, tuples, lists, dictionaries, sets and frozensets). All other values are interpreted as true. (See the **nonzero**() special method for a way to change this.)

```py
if value %2-==1:
    print 'odd'
elif value%2 ==0:
    print 'even'
else:
    print 'neither'
```

_there is no 'end' statement, code is determined by whitespace (indents)_

_common indented code is part of the same subroutine._

```python
age = 30
if age > 16 :
    print('You are old enough to drive')
else :
    print('just nope')
#Do something else
```

Use an `if` statement if you want to execute different code regardless of whether the condition ws met or not

If you want to check for multiple conditions use elif

If the first matches it won't check other conditions that follow

```python
if age > 16 :
    print('You are old enough to drive')
else :
    print('You are not old enough to drive')

#---------------------

if age >= 21 :
    print('You are old enough to drive a tractor trailer')
elif age >= 16:
    print('You are old enough to drive a car')
else :
    print('You are not old enough to drive')
```

You can combine conditions with logical operators
Logical Operators : `and`, `or`, `not`

```python
if ((age >= 1) and (age <= 18)):
    print("You get a birthday party")
elif q (age == 21) or (age >= 65):
    print("You get a birthday party")
elif not(age == 30):
    print("You don't get a birthday party")
else:
    print("You get a birthday party yeah")
```

## ITERABLES

The general thought process for iteration

- Choose a variable that "counts"
- Initialize this variable **outside** the loop.
- Set up an End test
- Construct the block
- The variable must change
- Decide what to do when Done.

Built in method `iter()` will attempt to return an iterator.  An iterator supports the `__next__()` method, that takes no arguments ands returns the next element of the stream.  Raises the `StopIteration` exception when complete.  `TypeError` exception if not iteratable.

```py
>>> L = [1, 2, 3]
>>> it = iter(L)
>>> it  #doctest: +ELLIPSIS
<...iterator object at ...>
>>> it.__next__()  # same as next(it)
1
>>> next(it)
2
>>> next(it)
3
>>> next(it)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
>>>
```

iterables, tuples and lists are all related

```py
>>> L = [1, 2, 3]
>>> iterator = iter(L)
>>> t = tuple(iterator)
>>> t
(1, 2, 3)
```

### FOR LOOPS

object of type iterative

most container objects can be looped over using a for statement:

```py
for element in [1, 2, 3]:
    print(element)
for element in (1, 2, 3):
    print(element)
for key in {'one':1, 'two':2}:
    print(key)
for char in "123":
    print(char)
for line in open("myfile.txt"):
    print(line, end='')
```

`for` **-FOR** _variable_ **IN** _iterable_ or _collection:_

In the statement for X in Y, Y must be an iterator or some object for which iter() can create an iterator. These two statements are equivalent:

```py
for i in iter(obj):
    print(i)

for i in obj:
    print(i)
```

```py
for print in [0,1,2,3,4,5,6,7]:
    print value
    if value %2-==1:
        print 'odd'
    else value%2 ==0:
        print 'even'

#Other Examples
for key in x:
for v in [0,1,2,3,4,5,6,7]:
for v in range(0,8):
for key, value in enumerate(x):

Lists  = [2,4,6,8,10]
Tuple = (1,2,3,4,5)
Dictionary = {1:'a', 2:'b', 3:'c', 4:'d'}
```

- Allows you to perform an action a set number of times
- Range performs the action 10 times 0 - 9

```python
for x in range(0, 10):
    print(x , ' ', end="")

print('\n')

#You can use for loops to cycle through a list
grocery_list = ['Juice', 'Tomatoes', 'Potatoes', 'Bananas']

for y in grocery_list:
    print(y)

#You can also define a list of numbers to cycle through
for x in [2,4,6,8,10]:
    print(x)

#You can double up for loops to cycle through lists
num_list =[[1,2,3],[10,20,30],[100,200,300]];

for x in range(0,3):
    for y in range(0,3):
        print(num_list[x][y])
```

#### comprehensions

See the longer section under lists.

```py
line_list = ['  line 1\n', 'line 2  \n', ...]

#Generator expression -- returns iterator
stripped_iter = (line.strip() for line in line_list)

#List comprehension -- returns list
stripped_list = [line.strip() for line in line_list]
#You can select only certain elements by adding an "if" condition:

stripped_list = [line.strip() for line in line_list
                 if line != ""]
```

#### Generators

Any function containing a `yield` keyword is a generator function;

simplest example of a generator function:

```py
>>> def generate_ints(N):
    for i in range(N):
    yield i

#Usage:
>>> gen = generate_ints(3)
>>> gen  #doctest: +ELLIPSIS
<generator object generate_ints at ...>
>>> next(gen)
0
>>> next(gen)
1
>>> next(gen)
2
>>> next(gen)
Traceback (most recent call last):
  File "stdin", line 1, in <module>
  File "stdin", line 2, in generate_ints
StopIteration
```
The test suite included with Python’s library, [Lib/test/test_generators.py](https://github.com/python/cpython/tree/3.7/Lib/test/test_generators.py), contains a number of more interesting examples.

A recursive generator that generates Tree leaves in in-order.

```py
def inorder(t):
    if t:
        for x in inorder(t.left):
            yield x

        yield t.label

        for x in inorder(t.right):
            yield x
```

Here’s a simple counter that increments by 1 and allows changing the value of the internal counter.
```py
def counter(maximum):
    i = 0
    while i < maximum:
        val = (yield i)
        # If value provided, change counter
        if val is not None:
            i = val
        else:
            i += 1
#And here’s an example of changing the counter:

>>> it = counter(10)  #doctest: +SKIP
>>> next(it)  #doctest: +SKIP
0
>>> next(it)  #doctest: +SKIP
1
>>> it.send(8)  #doctest: +SKIP
8
>>> next(it)  #doctest: +SKIP
9
>>> next(it)  #doctest: +SKIP
Traceback (most recent call last):
  File "t.py", line 15, in <module>
    it.next()
StopIteration
```

Because yield will often be returning None, you should always check for this case. Don’t just use its value in expressions unless you’re sure that the send() method will be the only method used to resume your generator function.

In addition to send(), there are two other methods on generators:

- throw(type, value=None, traceback=None) is used to raise an exception inside the generator; the exception is raised by the yield expression where the generator’s execution is paused.
- close() raises a GeneratorExit exception inside the generator to terminate the iteration. On receiving this exception, the generator’s code must either raise GeneratorExit or StopIteration; catching the exception and doing anything else is illegal and will trigger a RuntimeError. close() will also be called by Python’s garbage collector when the generator is garbage-collected.

If you need to run cleanup code when a GeneratorExit occurs, I suggest using a try: ... finally: suite instead of catching GeneratorExit.

[Source](https://www.youtube.com/watch?v=cKPlPJyQrt4&t=4606s)

```py
#Top-level syntax, function -> underscore method
#x()

```


### WHILE Loops

- While loops are used when you don't know ahead of time how many times you'll have to loop

```python
random_num = random.randrange(0,100)

while (random_num != 15):
    print(random_num)
    random_num = random.randrange(0,100)

y = 0  #MIT Class Example
x = 3
itersLeft  = x
while(itersLeft>0):
    y = y + x
    itersLeft = itersLeft - 1
    print('y =', y, ', itersLeft=', itersLeft)
```

Note **An iterator for a while loop is defined before the loop**

```python
i = 0
while (i <= 20):
    if(i%2 == 0):
        print(i)
    elif(i == 9):
        #Forces the loop to end all together
        break
    else:
        #Shorthand for i = i + 1
        i += 1
        #Skips to the next iteration of the loop
        continue

    i += 1
```

### Do While (equivalents)

A do-While list does not exist in python,

One possible equivalent:

```py3
while True:
    answer = raw_input("Start typing...")
    if answer == "quit":
        break
    print "Your answer was", answer
    #implied: else: continue
```

[More](https://stackoverflow.com/questions/743164/emulate-a-do-while-loop-in-python)

### Case / Switch Statement

A Case statement, as implemented in Java (below), this doesn't explicitly exist in Python.

```java
    public static void switch_demo(String[] args){
        int month = 8;
        String monthString;
        switch (month){
            case 1:
                monthString = "Jan";
                break;  //break statement is critical
            case 2:  //a few alternative styles:
                monthString = "Feb";
                break
            case 3:  monthString = "March"; //another
                     break;
            case 4: {   //finally-
                       monthString = "April";
                       break;
                    }
            case 5: { monthString = "May";
                     break; }
            case 6:
            {
                monthString = "June";
                break;
            }
            case 7:  {
                monthString = "July";
                break;
            }
            case 8:  monthString = "August";
                     break;
            case 9:  monthString = "September";
                     break;
            case 10: monthString = "October";
                     break;
            case 11: monthString = "November";
                     break;
            case 12: monthString = "December";
                     break;
            default: monthString = "Invalid month";
                     break;
        }
        System.out.println(monthString);
    }
```

One possible implementation is this:

```py3
def switch_demo(argument):
    switcher = {
        1: "January",
        2: "February",
        3: "March",
        4: "April",
        5: "May",
        6: "June",
        7: "July",
        8: "August",
        9: "September",
        10: "October",
        11: "November",
        12: "December"
    }
    print switcher.get(argument, "Invalid month")
```

Another example:

```py3
def one():
    return "January"

def two():
    return "February"

def three():
    return "March"

def four():
    return "April"

def five():
    return "May"

def six():
    return "June"

def seven():
    return "July"

def eight():
    return "August"

def nine():
    return "September"

def ten():
    return "October"

def eleven():
    return "November"

def twelve():
    return "December"


def numbers_to_months(argument):
    switcher = {
        1: one,
        2: two,
        3: three,
        4: four,
        5: five,
        6: six,
        7: seven,
        8: eight,
        9: nine,
        10: ten,
        11: eleven,
        12: twelve
    }
    #Get the function from switcher dictionary
    func = switcher.get(argument, lambda: "Invalid month")
    #Execute the function
    print func()
```

In fact, if you’re calling methods on objects, you can even use a dispatch method to dynamically determine which function needs to be called during runtime.

```py3
class Switcher(object):
    def numbers_to_months(self, argument):
        """Dispatch method"""
        method_name = 'month_' + str(argument)
        #Get the method from 'self'. Default to a lambda.
        method = getattr(self, method_name, lambda: "Invalid month")
        #Call the method as we return it
        return method()

    def month_1(self):
        return "January"

    def month_2(self):
        return "February"

    def month_3(self):
        return "March"

    #...

    #To call /utilize the method
    #Based on the passed argument, the in-built getattr() function will retrieve object methods with the particular name.
    a=Switcher()
    a.numbers_to_months(1)

#Returns:
#>>> January
```

Since you can alter Python dictionaries during runtime (add, remove or update key-value pairs), you can easily change your very switch statement on the fly. Here’s an example,

```py3
def zero():
    return "zero"

def one():
    return "one"

def two():
    return "two"

switcher = {
        0: zero,
        1: one,
        2: two
    }

def numbers_to_strings(argument):
    #Get the function from switcher dictionary
    func = switcher.get(argument, "nothing")
    #Execute the function
    return func()

numbers_to_strings(1)
#>>> One

switcher[1]=two #changing the switch case
numbers_to_strings(1)
#>>> Two
```

### Range, Break, Continue, Pass, Enumerate, and Iter, and others

- range([start], stop, [step])
- `break` break out of a loop, typically with an internal conditional statement
- `continue` -continue the loop -just stop the current iteration
- `pass` - handle the condition without the loop being impacted in any way;
- `enumerate(x)` - create a for loop that iterates over the keys and the values

#### RANGE

`range(int, int, int)`

- (stop)
- (start, stop)
- (start, stop, step)

**Reversed Example** `range( len(data) -1, -1, -1):`

```py
>>> start = 1
>>> stop = 8
>>> step = 2
>>> range(stop)
[0, 1, 2, 3, 4, 5, 6, 7]
>>> range(start, stop)
[1, 2, 3, 4, 5, 6, 7]
>>> range(start, stop, step)
[1, 3, 5, 7]
>>> step = -1
>>> range(stop, start)
[]
>>> range(stop, start, step)
[8, 7, 6, 5, 4, 3, 2]
>>> range(start, stop, step)
[]
>>> range(1.01, 2.004)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: range() integer end argument expected, got float.
```

The step by default is +1. Python will not handle ranges that don't make sense. It just returns an empty list. So if Start > stop (and no step given) then there is no series of +1 to get to 1. And it only takes integers.

Importantly, this method allows you to change the values within the range. (Not sure what I meant by this in retrospect...)

```py
for value in range(0,8):
    print value
    if value %2-==1:
        print 'odd'
    elif value%2 ==0:
        print 'even'
    else:

[0,1,2,3,4,5,6,7]
range(5)
[0,1,2,3,4,5]
#exclusive of end
>>> range(5,0,-1)
[5, 4, 3, 2, 1]
```

#### BREAK

`break` break out of a loop, typically with an internal conditional statement

```py
number = 0
for number in range(10):
    number = number + 1
    if number == 5:
         break    #break here
     print('Number is ' + str(number))
print('Out of loop')

Number is 1
Number is 2
Number is 3
Number is 4
Out of loop
 #gets to 5 and then stops
```

#### CONTINUE

`continue` -continue the loop -just stop the current iteration

```py
number = 0
for number in range(7):
    number = number + 1

    if number == 5:
         continue    #continue here

     print('Number is ' + str(number))

print('Out of loop')

Number is 1
Number is 2
Number is 3
Number is 4
Number is 6    # 5 is skipped
Number is 7
Number is 8
Number is 9
Number is 10
Out of loop
```

#### PASS

`pass` - handle the condition without the loop being impacted in any way;

e.g. `pass` statement- in this program, we notice that the program runs exactly as it would if there were no conditional statement in the program. The pass statement tells the program to disregard that condition and continue to run the program as usual.

```py
number = 0

for number in range(10):
   number = number + 1

   if number == 5:
        pass    #pass here
   print('Number is ' + str(number))

print('Out of loop')

Number is 1
Number is 2
Number is 3
Number is 4
Number is 5  #Nothing Happens
Number is 6
Number is 7
Number is 8
Number is 9
Number is 10
Out of loop
```

From docs: `pass` is a null operation — when it is executed, nothing happens. It is useful as a placeholder when a statement is required syntactically, but no code needs to be executed, for example:

```py
def f(arg): pass    #a function that does nothing (yet)

class C: pass       #a class with no methods (yet)
```

#### enumerate(x)

`enumerate(x)` - create a for loop that iterates over the keys and the values

```py
x= {1:'a', 2:'b', 3:'c', 4:'d'}  #dict
for key, value in enumerate(x):
    print value
    if value %2-==1:
        print 'odd'
    elif value%2 ==0:
        print 'even'
    else:
#reduces code by one line vs:

x= {1:'a', 2:'b', 3:'c', 4:'d'}  #dictionary
 for key in x:  #dict x
    value = x[key]
    print value
    if value %2-==1:
        print 'odd'
    elif value%2 ==0:
        print 'even'
    else:
```

#### Other iterable Functions

Some example things that turn collections into iterable items

- d.items()
- enumerate(\*)
- d.iter()
- d.iteritems()

You can make things iterable with some commands. A dictionay, for instance has no order.

In Python 2, `d.items()` returns a list of (key, value) tuples, while `d.iteritems()` returns an iterator that provides the same:

```py
zero = 'zero'
d = {1:'a',2:'b', 'c':3, '4':4, 0:zero}

for i in d:
    print i, d[i]

for k, v in d.iteritems():
    print k, v
```

In Python 3, `d.items()` returns the iterator; to get a list, you need to pass the iterator to list() yourself. SO, `list(d.items())= d.iteritems()` in python 3.

```py3
for k, v in d.items():
    print(k, v)
list(d.items())
```


```py
class yrange:
    def __init__(self, n):
        self.i = 0
        self.n = n

    def __iter__(self):
        return self

    def next(self):
        if self.i < self.n:
            i = self.i
            self.i += 1
            return i
        else:
            raise StopIteration()
```

My Stack() class as a generator:


### Generators

[Generator Info](https://wiki.python.org/moin/Generators)

 The following implements generator as an iterable object.

The following implements generator as an iterable object.

``py`
>#Using the generator pattern (an iterable)
class firstn(object):
    def __init__(self, n):
        self.n = n
        self.num, self.nums = 0, []

    def __iter__(self):
        return self

    # Python 3 compatibility
    def __next__(self):
        return self.next()

    def next(self):
        if self.num < self.n:
            cur, self.num = self.num, self.num+1
            return cur
        else:
            raise StopIteration()

sum_of_first_n = sum(firstn(1000000))
```


```py
def zeros():
    while True:
        yield 0

def ones():
    while True:
        yield 1
```

#### Empty Generator

```py
    def __iter__(self):
        return iter(())

    def __iter__(self):
        return
        yield
```


## FUNCTIONS

Purposes of a function:

- Functions allow you to reuse and write readable code
- Type `def` (define), function name and parameters it receives
- return is used to return something to the caller of the function
- **return is optional.**
- I think there needs to be a blank line and a return of tab after the end of a function.
- Provide Decomposition and Abstraction.
  - Decomposition is a way to break the code up into modules that are reusable.
  - Abstraction allows the supressions of details. It allows the creation of a black box.

naming convention is lowercase_and_underscores, with a verb. Arguments should indicate a data type.

Doc string `'''doc goes here'''`

Arguments - of two types
-required
-optional- An optional or default argument has an = sign.

```python
def addNumbers(fNum, sNum):
    sumNum = fNum + sNum
    return sumNum

print(addNumbers(1, 4))
print(sumNum) #>>>Error
```

Can't get the value of sumNum because it was created in a function. It is said to be out of scope.

```py
#If you define a variable outside of the function it works every place
newNum = 0;
def subNumbers(fNum, sNum):
    newNum = fNum - sNum
    return newNum

print(subNumbers(1, 4))
```

```py
def sqrt(x)
    '''returns the square root of x, if x is a perfect sqare.  Prints an error message and returns None otherwise'''
    ans = 0
    if x >= 0:
        while ans * ans < x: ans = ans + 1
        if ans * ans != x:
            print x, 'is not a perfect square' #py3 =>  print( x, 'is not a perfect square')
            return None
        else: ans
    else:
        print x, ' is a negative number' #py3 =>  print(x, ' is a negative number')
        return None
```

**Syntax** - as follows

- `def` (Define)
- Keyword (a name),
- parentheses- formal parentheses ( ) _Required_
- return - when you get to this point return control from the function and return the value.
  - None - a special value, but has a special value - no value.
  - Should be a return on every branch of the code.
- the `''' description '''` just after def will display as a tooltip when someone starts the function.

- Invocation

!!!Note `Print(f(x)->None)` does not print

!!!Example A farmer has chickens and cows. He sees 20 heads and 50 legs.

```py
#MIT Class Example:

def solve(numLegs, numHeads):
    for numChicks in range(0, numHeads + 1):
        numPigs = numHeads - numChicks
        totLegs = 4 * numPigs + 2 * numChicks
        if totLegs == numLegs:
            return (numPigs, numChicks)  #Note the return of a Tuple
    return (None, None)  #Tuple of None

def barnYard():
    heads = int(raw input('Enter Number of heads: '))
    legs = int(raw input('Enter Number of Legs: ' ))
    pigs, chickens = solve(legs, heads)
    if pigs == None:
        print 'There is no solution'
    else
        print 'Number of Pigs', pigs
        print 'Number of Chickes', chickens

def solve1(numLegs, numHeads):
    for numSpiders in range(0, numHeads + 1):
        for numChicks in range(0, numHeads  - numSpiders + 1):
            numPigs = numHeads - numChicks - numSpiders
            totLegs = 4 * numPigs + 2 * numChicks + 8 * numSpiders
            if totLegs == numLegs:
                return (numPigs, numChicks, numSpiders)  #a Tuple
    return (None, None, None)  #Tuple of None

def barnYard1()
    heads = int(raw input('Enter Number of heads: '))
    legs = int(raw input('Enter Number of Legs: ' ))
    pigs, chickens, spiders = solve1(legs, heads)
    if pigs == None:
        print 'There is no solution'
    else
        print 'Number of Pigs', pigs
        print 'Number of Chickes', chickens
        print 'Number of Spiders', spiders

#However now there is likely more than one solution.  Ideally wed keep going once a solution is found.

def solve2(numLegs, numHeads):
    solutionFound = False
    for numSpiders in range(0, numHeads + 1):
        for numChicks in range(0, numHeads  - numSpiders + 1):
            numPigs = numHeads - numChicks - numSpiders
            totLegs = 4 * numPigs + 2 * numChicks + 8 * numSpiders
            if totLegs == numLegs:
                print 'Number of Pigs', pigs
                print 'Number of Chickes', chickens
                print 'Number of Spiders', spiders
                solutionFound = True
                #return (numPigs, numChicks, numSpiders)  #a Tuple
    if not solutionFound: print 'There is no solution'
    #return (None, None, None)  #Tuple of None

def barnYard2()
    heads = int(raw input('Enter Number of heads: '))
    legs = int(raw input('Enter Number of Legs: ' ))
    solve2(legs, heads)
```

### Recursion

A problem is broken into a

- base case
- inductive step

For Example: Palindrome. If str.len()=0 or str.len()=1 then Palindrome = True.
Inductive step- start at one end, if the other end is the same letter, if all the letters inside are palindromic then its a palindrome.

```py
def isPalindrome(str):
    '''Returns True if str is a Palindrome and False otherwise'''
    if len(str) <= 1: return True
    else: return str[0] == str[1] and isPalindrome(str[1:-1])

 def isPalindrome1(str, indent):
    if len(str) <= 1: return True
    else: return str[0] == str[1] and isPalindrome(str[1:-1])
```

### Gathering and Scattering

#### Gathering

Variable Length Arguments using Tuples:

Some functions take arguments as a tuple. They take any number of inputs and zip them up into a single tuple. The command for this is an asterisk (*), where it looks like: `def func(*args):`

example:

```py
def func(*args):
    #some code
    return


def printAll(*args)
    print(args)
    return

>>> printAll('A', 123, 'hello world', 75.4)
('A', 123, 'hello world', 75.4)
```

This is called **gathering** the arguments.

```py
##OOPS Divmod is built in afterall.
def divmod(n, d):
    ''' Input is (int, int), returns as a tuple of length 2 the divisor and the modulus'''
    #first multiline quote after def will pop up as help
    div = n / d
    rem = n % d
    return (div, rem)

a=divmod(5, 2)
>>> a
(2, 1)

#Automatically scatter the tuple
>>> a,b = divmod(5,2)
>>> a
2
>>> b
1
>>> t=(5,2)
>>> divmod(t)
#ERROR need to scatter
>>> divmod(t*)
#ERROR Wrong Way
>>> divmod(*t) #Works
(2, 1)
```

#### Scattering

The opposite is **scattering,** also done with an _. Using divmod(n,o) from above. var_

This is wrong 'So it appears in gathering, the asterisk comes first _args, and in scattering it comes second- args_' it seems like its always first.

```py
>>> t= 7,3
>>> divmod(t)

Traceback (most recent call last):
  File "<pyshell#24>", line 1, in <module>
    divmod(t)
TypeError: divmod expected 2 arguments, got 1

>>> divmod(t*)
SyntaxError: invalid syntax
>>> divmod(*t)
(2, 1)
```

### Lambda Calculus

Lambda calculus is an abstract "throwaway" function, designed to relate a value to another.

List comprehensions provide a concise way to create lists. Common applications are to make new lists where each element is the result of some operations applied to each member of another sequence or iterable, or to create a subsequence of those elements that satisfy a certain condition.

For example, assume we want to create a list of squares, like:
```py
>>> squares = []
>>> for x in range(10):
...     squares.append(x**2)
...
>>> squares
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```

Note that this creates (or overwrites) a variable named x that still exists after the loop completes. We can calculate the list of squares without any side effects using:

```py
squares = list(map(lambda x: x**2, range(10)))
#or, equivalently:
squares = [x**2 for x in range(10)]
```

The above is an example of a lambda function. Running just the lambda shows that its a throwaway function:

```py
>>> lambda x : x**2, range(10)
(<function <lambda> at 0x00000000034D9198>, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
>>> map(lambda x: x**2, range(10))
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
>>> list(map(lambda x: x**2, range(10)))
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```
## USER INPUT

print('What is your name?')

Stores everything typed up until ENTER
name = sys.stdin.readline() - this wasnt working for me

print('Hello', name)

input() - input is used to read integers

```py
age = input("What is your age? ")
print "Your age is: ", age
type(age)
```

raw_input() - raw_input is used to read text (strings) from the user:

```py
name = raw_input("What is your name? ")
type(name)
```

## FILE I/O

Class IO

- io
  - _IOBase_
    - fileno
    - seek
    - truncate
    - **methods**
      - close, flush
      - closed, seekable, writable, readable
      - __enter__, __exit__
      - __iter__, __next__
      - isatty, tell
      - readlines, wrielines
  - _RAWIOBase(IOBase)_
    - readinto
    - write
    - **methods**: read, readall
  - _BufferedIOBase(IOBase)_
    - detach
    - read, write
    - readline
    - **methods** - readinto, readinto1
  - _TextIOBase(IOBase)_
    - detach
    - read, write
    - readline
    - **methods** encoding, errors, newlines
    - _TextIOWrapper(IOBase)_
    - _StringIO(IOBase)_



```
from os import path

here = path.abspath(path.dirname(__file__))
with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()
```



End of line characters can be Unix/Linux, Windows, or Mac style.

```py
file = open("myFileName.txt") creates a pointer
for line in file:
    print line
        for cell in line.split(','): #csv file reading
            print cell
            print cell.strip()      #strip
file.close()

#Overwrite or create a file for writing
test_file = open("test.txt", "wb")  #not sure what wb is specifically.

#or to write or append
test_file = open("test.txt", "w")
test_file = open("test.txt", "a")
#read is the default so the below two commands are equivalent
test_file = open("test.txt", "r")
test_file = open("test.txt")
#Opens a file for reading and writing
test_file = open("test.txt", "r+")
#Opens a file for reading and writing
test_file = open("test.txt", "x") # create
```

[Open Docs](https://docs.python.org/3/library/functions.html#open)

| Character | Meaning                                                         |
| --------- | --------------------------------------------------------------- |
| 'r'       | open for reading (default)                                      |
| 'w'       | open for writing, truncating the file first                     |
| 'x'       | open for exclusive creation, failing if the file already exists |
| 'a'       | open for writing, appending to the end of the file if it exists |
| 'b'       | binary mode                                                     |
| 't'       | text mode (default)                                             |
| '+'       | open a disk file for updating (reading and writing)             |


mode is an optional string that specifies the mode in which the file is opened. It defaults to 'r' which means open for reading in text mode. Other common values are 'w' for writing (truncating the file if it already exists), 'x' for exclusive creation and 'a' for appending (which on some Unix systems, means that all writes append to the end of the file regardless of the current seek position). In text mode, if encoding is not specified the encoding used is platform dependent: locale.getpreferredencoding(False) is called to get the current locale encoding. (For reading and writing raw bytes use binary mode and leave encoding unspecified.) The available modes are:

```py
#Get the file mode used
print(test_file.mode)

#Get the files name
print(test_file.name)

#Write text to a file with a newline
test_file.write(bytes("Write me to the file\n", 'UTF-8'))

#Close the file
test_file.close()



#Read text from the file
text_in_file = test_file.read()

print(text_in_file)

#Delete the file
os.remove("test.txt")
```
file error handling

```py
try:
    with open(argv[1]) as f:
        s = f.read()
        print 'read', len(s), 'bytes.'
except IOError as x:
    if x.errno == errno.ENOENT:
        print argv[1], '- does not exist'
    elif x.errno == errno.EACCES:
        print argv[1], '- cannot be read'
    else:
        print argv[1], '- some other error'
```

### Using Paths

Cant use relative paths outright.  Use `Os` to manipulate filesystem

```py
subpath = '/Python/Web-STS/'
filename = 'payload.txt'
fullpath = os.getcwd() + subpath + filename
```

#### Check if a file exists

`Pathlib` is good and `fileinput`

```py
from pathlib import Path
>>> filepath = 'D:\ASUSsync\VS Code\Python\Web-STS\STS.py'
>>> p = Path(filepath)
>>> p.exists()
```

A better method is this:

```py
from os.paths import exists
from os import getcwd

subpath = '/Python/Web-STS/'
fullpath = getcwd() = subpath
hfile = fullpath + 'headers'
exists(hfile)
$True
```

```
try:
    fp = open("myfile")
except PermissionError:
    return "some Default message"
else:
    with fp:
        return fp.read()
```
Typing the exact path in didnt work at all.  Despite a mix of all kinds of slashes.  A path of the form `C:\dir1\dir2\dir3\dir4\` just didnt work, even replacing `/` with `\` and `\\`.

```py
import os
from pathlib import Path
from pathlib import WindowsPath as WP
from pathlib import PureWindowsPath as PWP

#Tried with and without the terminal `/`
path = 'C:\\ASUSsync\\VS Code\\Python\\Data Structures\\TOHfinal\\etc\\Box'
wp = 'C:/ASUSsync/VS Code/Python/Data Structures/TOHfinal/etc/Box'
sub = '/DataStructures/TOHfinal/etc/Box'
subw = '\\DataStructures\\TOHfinal\\etc\\Box'

p = Path(path)
print(p.exists())
q = WP(wp)
print(q.exists())
p = Path(wp)
print(p.exists())
q = WP(path)
print(q.exists())
p = Path(sub)
print(p.exists())
q = WP(sub)
print(q.exists())
$ False
$ False
$ False
$ False
$ False
$ False
```

I cannot figure out why this is. Yet this works.  And the docs show a very similar example.

```py
import os
from pathlib import Path
p = Path(os.getcwd())
r = p / 'DataStructures' / 'TOHfinal' / 'etc' / 'Box'
print(str(r), type(r), r.exists())

#using this you can get to the '/=' operator to traverse
>>> p /= 'file.txt'
>>> str(p)
'C:\\ASUSsync\\VS Code\\Python\\file.txt'
```


PATH.`parts` returns a tuple of all the file parts.

!!!note it is not PATH`.parts()`, because its not a method, just an attribute? Or something.

```py
>>> p.parts #split the path to get each loc
('C:\\', 'ASUSsync', 'VS Code', 'Python', 'file.txt')
>>> p.parts[-1] #get the file name
'file.txt'
#could check x.is_dir() before grabbing the last bit.
>>> p.is_dir()
False
>>> p.parts[-1].split('.')
['file', 'txt']
>>> p.parts[-1].split('.')[0]
'file'
```

### Resource Managers

The better way to open files.  Has something to do with minimizing resources.

```py
with open('test.txt', 'r') as file:
        file_contents = f.read()

words = file_contents.split(' ')
word_count = len(words)
print(word_count)
```

### JSON

Using the json library, opens a json file as a dictionary.

loads a dictionary, with keys that are dictionary keys.  Arrays become lists.  And so on.

```py
import json
dd = json.loads(datadict)

datadict = '''
 {
        "intro" : "TODO- provide and intro",
        "args" : [
            {
                "name" : "output",
                "short" : "-o",
                "long" : "--output",
                "positional" : true,
                "nargs" : 2,
                "type" : "str",
                "optional" : false,
                "action" : "store_true"
                "default" : "TOH-Output.txt",
                "help"  : "The location to save the file output."
            },
            {
                "name" : "print",
                "positional" : true,
                "optional" : false,
                "short" : "-p",
                "long" : "--print",
                "nargs" : "",
                "type" : "",
                "action" : "store_true"
                "help"  : "Print output to the terminal (in addition to the file output."
            }
        ]
'''

```


### Create a tempfile

tempfile library


## Web Operationas

In py3, urllib has been broken into 3 sub-modules `urllib.request`, `urllib.parse`, and `urllib.error`.

the Requests library opens a higher level interface. `httplib` (`http.client` in py3) calls `urllib` and is also higher level.

```py3
import urllib
file = urllib.urlopen('http://example.iana.org/', ,"https://proxy.swmed.edu:3128")
for line in file:
print line

```

OS.path or pathlib (high lvl path objects) can be used to determine paths.

os.path defaults to the appropriate of:

- posixpath (Unix)
- ntpath (Windows)
- macpath (MacOs)

### Proxies

With URL Lib

```py
import urllib.request
proxy = urllib.request.ProxyHandler({'https': 'proxy.swmed.edu:3128'})  #create the object, assign it to a variable
opener = urllib.request.build_opener(proxy)#construct a new opener using your proxy settings
urllib.request.install_opener(opener)  #install the openen on the module-level
urllib.request.urlretrieve(URL)#make a request
with urllib.request.urlopen(url2) as response:
    html = response.read()
```

With Requests

```py
from requests import Request, Session
prox = {"http": "http://proxy.swmed.edu:3128",
           "https": "https://proxy.swmed.edu:3128"}
#requests.get(gurl, proxies=prox)
s = requests.Session()
r = s.get(gurl,  proxies=prox)
```

### Requests package

[Requests](http://docs.python-requests.org/en/master/)

### HTTP Response Codes

100-continue
101 Switching Protocol
102 Processing
103 Early Hints
Successful Response 2xx
200 Ok
201 Created
202 Accepted
203 Non Authoritative Information
204 No Content
205 Reset Content
Redirection 3xx

Error 4xx
400 Bad Request
401 Unauthorized
403 Forbidden
404 Not Found
407 Proxy Auth Required
408 Timeout
Server Error 5xx
500 Internal Server Error
501 Not Implemented
502 Bad Gateway


## CLASSES AND OBJECTS

The concept of OOP allows us to model real world things using code
Every object has **attributes** (color, height, weight) which are object variables
Every object has abilities (walk, talk, eat) which are object functions

Class objects support two kinds of operations: **attribute** references and **instantiation.**

A very simple class:

```py
class MyClass:
    """A simple example class"""
    i = 12345

    def f(self):
        return 'hello world'
```

then both `MyClass.i` and `MyClass.f` are valid *attribute* references, returning an integer and a function object, respectively. Class attributes can also be assigned to, so you can change the value of MyClass.i by assignment. `__doc__` is also a valid attribute, returning the docstring belonging to the class: "A simple example class".

**Class instantiation** uses function notation. Just pretend that the class object is a parameterless function that returns a new instance of the class. For example (assuming the above class):

`x = MyClass()`

the self is there to pass the instance on.  So `x.f()` actually calls `MyClass.f(x)`.

You can store a reference to a method like `xf=x.f` (note no paren), then dereference with paren `print(xf())` is the same as `x.f()`

When a class defines an `__init__()` method, class instantiation automatically invokes `__init__()` for the newly-created class instance.

data attributes correspond to “instance variables” in Smalltalk, and to “data members” in C++. Data attributes need not be declared; like local variables, they spring into existence when they are first assigned to. For example, if x is the instance of MyClass created above, the following piece of code will print the value 16, without leaving a trace:

```py
x.counter = 1
while x.counter < 10:
    x.counter = x.counter * 2
print(x.counter)
del x.counter
```

meaning objects are somewhat fluid as to what can be an attribute.  It seems theres nothing preventing you from creating attributes of objects.



```py3
class Animal:
    #None signifies the lack of a value
    #You can make a variable private by starting it with __
    __name = None
    __height = None
    __weight = None
    __sound = None

    #The constructor is called to set up or initialize an object
    #self allows an object to refer to itself inside of the class
    def __init__(self, name, height, weight, sound):
        self.__name = name
        self.__height = height
        self.__weight = weight
        self.__sound = sound

    def set_name(self, name):
        self.__name = name

    def set_height(self, height):
        self.__height = height

    def set_weight(self, height):
        self.__height = height

    def set_sound(self, sound):
        self.__sound = sound

    def get_name(self):
        return self.__name

    def get_height(self):
        return str(self.__height)

    def get_weight(self):
        return str(self.__weight)

    def get_sound(self):
        return self.__sound

    def get_type(self):
        print("Animal")

    def toString(self):
        return "{} is {} cm tall and {} kilograms and says {}".format(self.__name, self.__height, self.__weight, self.__sound)
```

How to create a Animal object

```py3
cat = Animal('Whiskers', 33, 10, 'Meow')

print(cat.toString())

#You can't access this value directly because it is private

print(cat.__name)
```

### Class and Instance Variables

Generally speaking, instance variables are for data unique to each instance and class variables are for attributes and methods shared by all instances of the class:

```py
class Dog:

     class_tricks = []             # mistaken use of a class variable

    kind = 'canine'         # class variable shared by all instances

    def __init__(self, name):
        self.name = name    # instance variable unique to each instance

    def add_ClassTrick(self, trick):
        self.class_tricks.append(trick)

    def add_trick(self, trick):
        self.tricks.append(trick)

>>> d = Dog('Fido')
>>> e = Dog('Buddy')
>>> d.kind                  # shared by all dogs
'canine'
>>> e.kind                  # shared by all dogs
'canine'
>>> d.name                  # unique to d
'Fido'
>>> e.name                  # unique to e
'Buddy'

>>> d.add_ClassTrick('roll over')
>>> e.add_ClassTrick('play dead')
>>> d.class_tricks              # unexpectedly shared by all dogs
['roll over', 'play dead']

>>> d.add_trick('roll over')
>>> e.add_trick('play dead')
>>> d.tricks
['roll over']
>>> e.tricks
['play dead']
```

The only difference between the two seems to be the declaration as a `field`, e.g. at the top.

### INHERITANCE

You can inherit all of the variables and methods from another class

note the syntax `class NewClass(BaseClass):`  you can even extend objects in another module- `class NewClass(module.BaseClass):` or multiple: `class DerivedClassName(Base1, Base2, Base3):`

```py3
class Dog(Animal):
    __owner = None

    def __init__(self, name, height, weight, sound, owner):
        self.__owner = owner
        self.__animal_type = None

        #How to call the super class constructor
        super(Dog, self).__init__(name, height, weight, sound)

    def set_owner(self, owner):
        self.__owner = owner

    def get_owner(self):
        return self.__owner

    def get_type(self):
        print ("Dog")

    #We can overwrite functions in the super class
    def toString(self):
        return "{} is {} cm tall and {} kilograms and says {}. His owner is {}".format(self.get_name(), self.get_height(), self.get_weight(), self.get_sound(), self.__owner)

    #You don't have to require attributes to be sent
    #This allows for method overloading
    def multiple_sounds(self, how_many=None):
        if how_many is None:
            print(self.get_sound)
        else:
            print(self.get_sound() * how_many)

spot = Dog("Spot", 53, 27, "Ruff", "Derek")

print(spot.toString())
```

calling overridden methods is imprecise.  'Because methods have no special privileges when calling other methods of the same object, a method of a base class that calls another method defined in the same base class may end up calling a method of a derived class that overrides it.'

call the base class method directly: just call `BaseClassName.methodname(self, arguments)`

Python has two built-in functions that work with inheritance:

Use `isinstance()` to check an instance’s type: `isinstance(obj, int)` will be True only if `obj.__class__` is `int` or some class derived from `int`.
Use `issubclass()` to check class inheritance: `issubclass(bool, int)` is `True` since bool is a subclass of int. However, `issubclass(float, int)` is `False` since `float` is not a subclass of `int`.

### Polymorphism

Polymorphism allows use to refer to objects as their super class and the correct functions are called automatically

```py3
class AnimalTesting:
    def get_type(self, animal):
        animal.get_type()

test_animals = AnimalTesting()

test_animals.get_type(cat)
test_animals.get_type(spot)

spot.multiple_sounds(4)
```

### METHODS

Methods are a function basically with different syntax.

List1.append(List2)
Append(List1, List2)

#### Dunder Methods (Double Underline)

aka data model methods. see [here](https://docs.python.org/3/reference/datamodel.html)

Dunder methods are written as `__method__` but they are called indirectly. For instance, the integer or string object has the Dunder Method `__add__` that declares what occurs when 5 + 8 or String + String occurs. In the case of integers, method calls for basic addition. In the case of strings, it calls for _Concatenation._

Other conditions, call other dunder methods. `print()` for instance, calls the dunder method `__str__`.

These are the inbuilt actions in python.  There are many.

[example source](https://www.youtube.com/watch?v=cKPlPJyQrt4&t=4606s)

```py
class Polynomial:
    def __init__(self, *coeffs):
        self.coeffs = coeffs

    def __repr__(self):
        return 'Polynomial(*{!r})'.format(self.coeffs)

    def __add__(self, other):
        return Polynomial(*(x + y for x, y in zip(self.coeffs, other.coeffs)))

    def __len__(self):
        return len(self.coeffs)

    def __call__(self):
        pass
```

Other methods

- `__init__` is the constructor method.
- `__new__` is a static method called to created a new instance of the class- remaining arguuments re passed to the constructor.
- `__str__` is the method to return the string representation
- `__repr__` is the 'string you would type into the console to get another object like the one represented'
- `__add__` is the method for adding two of the objects.
- `__len__` return the length of an object
- `__format__` returns the 'formatted' string representation of the object
- `__del__` called when the instance is about to be destroyed.
- `__call__` is used when you call object()
- `__next__` is part of the iterator behavior provides the behavior to iterate over the class
- `__bytes__`
- object.__lt__(self, other)
object.__le__(self, other)
object.__eq__(self, other)
object.__ne__(self, other)
object.__gt__(self, other)
object.__ge__(self, other)
object.__hash__
The only required property is that objects which compare equal have the same hash value; it is advised to mix together the hash values of the components of the object that also play a part in comparison of objects by packing them into a tuple and hashing the tuple. Example:

```py
def __hash__(self):
    return hash((self.name, self.nick, self.color))
```
object.__bool__(self)
object.__getattr__(self, name)
object.__getattribute__(self, name)
object.__setattr__(self, name, value)
object.__delattr__(self, name)
object.__dir__(self)

```py
import sys
from types import ModuleType

class VerboseModule(ModuleType):
    def __repr__(self):
        return f'Verbose {self.__name__}'

    def __setattr__(self, attr, value):
        print(f'Setting {attr}...')
        super().__setattr__(attr, value)

sys.modules[__name__].__class__ = VerboseModule
```

__doc__ - The function’s documentation string, or None if unavailable; not inherited by subclasses. - Writable
__name__ - The function’s name. - Writable
__qualname__ - The function’s qualified name. Writable
__module__ - The name of the module the function was defined in, or None if unavailable. - Writable
__defaults__ - A tuple containing default argument values for those arguments that have defaults, or None if no arguments have a default value. - Writable
__code__ - The code object representing the compiled function body. - Writable
__globals__ - A reference to the dictionary that holds the function’s global variables — the global namespace of the module in which the function was defined. - Read-only
__dict__ - The namespace supporting arbitrary function attributes. - Writable
__closure__ - None or a tuple of cells that contain bindings for the function’s free variables. See below for information on the cell_contents attribute. - Read-only
__annotations__ - A dict containing annotations of parameters. The keys of the dict are the parameter names, and 'return' for the return annotation, if provided. - Writable
__kwdefaults__ - A dict containing defaults for keyword-only parameters. - Writable

#### Functional Methods

Having seen the mechanics behind the iterator protocol, it is easy to add iterator behavior to your classes. Define an __iter__() method which returns an object with a __next__() method. If the class defines __next__(), then __iter__() can just return self:

```py
class Reverse:
    """Iterator for looping over a sequence backwards."""
    def __init__(self, data):
        self.data = data
        self.index = len(data)

    def __iter__(self):
        return self

    def __next__(self):
        if self.index == 0:
            raise StopIteration
        self.index = self.index - 1
        return self.data[self.index]
```

### Classes

Defining a class, the parentheses are not obligatory.  They are just used if you want to use inheritance. `class Rabbit:` would not throw an error.

`def __init__(self, ...)` you always need the initialzation, it always runs when calling the class.  You don't necessicarily have to pass `self` and you can even use another word to refer to self.  Self can be called 'boobs' if you want.

`def __init__(self, *args, **kwargs)` can also just be written `def __init__(self, *, **)`, this allows you to pass any number of arguments.  `**kwargs` refers to *keyword args* and usually refers to dictionaries.

constructor always starts with the self keyword `def __init__(self, ...)`.  Then to instantiate it you basically ignore that `someVar = Class(...)`

class_keyword class_name (base_object) overridden_method
    class_field class_self-reference new_subclass_method

```py3
class Rabbit(object):
#class definition class keyword class, Name Rabbit, object is the BASE CLASS

    def __init__(self, name): #Constructor Class
        self.name = name    #field name
        self.hitpoints = 1

    def hop(self):
        self.hit_points = self.hit_points - 1
        print("%s hops one node, now has %i hit points."%(self.name, self.hit_points))

    def eat_carrot(self):
        self.hit_points = self.hit_points + 3
        print("%s eats a carrot, now has %i hit points." % (self.name, self.hit_points))

class Frog(Rabbit):
    '''The Frog class extends the Rabbit class'''
#create a new croak method
    def croak(self):
        self.hit_points = self.hitpoints - 1
        print("%s croaks, now he has %i hit points." % (self.name, self.hit))

#Override the eat_carrot method
    def eat_carrot(self):
        print("%s cannot eat a carrot, it is too big!!" % (self.name))

    #Create an eat fly method
    def eat_fly(self):
        self.hit_points = self.hit_points + 2
        print("%s eats a fly, now has %i hit points." % (self.name, self.hit_points))

##Instantiate a frog
frogger = Frog("Frogger")
##Do frog stuff
frogger.croak()
frogger.eat_carrot()
frogger.eat_fly()
frogger.hop()
```

![Slide1](/Python_res/image1.png)

Extending a base class is shown above.  the first line, usese the keyword class, followed by then Name, the followed by the name of the object its extending.

### Object oriented Python

“Private” instance variables that cannot be accessed except from inside an object don’t exist in Python. However, there is a convention that is followed by most Python code: a name prefixed with an underscore (e.g. _spam) should be treated as a non-public part of the API (whether it is a function, a method or a data member).

**name mangling** Any identifier of the form __spam (at least two leading underscores, at most one trailing underscore) is textually replaced with _classname__spam, where classname is the current class name with leading underscore(s) stripped.


Sometimes it is useful to have a data type similar to the Pascal “record” or C “struct”, bundling together a few named data items. An empty class definition will do nicely:

```
class Employee:
    pass

john = Employee()  # Create an empty employee record


>>#Fill the fields of the record
john.name = 'John Doe'
john.dept = 'computer lab'
john.salary = 1000
```

## Advanced Concepts

### Tests

`assert hasattr(Base, 'foo'), "You broke it you fool"` - this is an assertion that foo is an attribute of Base (the example class in this case.)

### Patch into Python Architecture

[Source](https://www.youtube.com/watch?v=cKPlPJyQrt4&t=4606s)
```py
old_bc = __build_class__  #capture the original buildclass
def my_bc(*args, **kwargs):
    print('my_buildclass->' args, kwargs)
    return old_bc(*args, **kwargs)
import builtins #A library that contains all the builting functions
builtins.__build_class__ = my_bc #redirect the current __build_class__ to your function
```

```py
class Base:
    def foo(self):
        return self.bar()

old_bc = __build_class__  #capture the original buildclass
def my_bc(fun, name, base=None, **kwargs):
    print('my_buildclass->' args, kwargs)
    if base is Base:
        print('check if bar method is defined')
    if base is not Base:
        return old_bc(fun, name, base, **kwargs)
    return old_bc(fun, name, **kwargs)
import builtins #A library that contains all the builting functions
builtins.__build_class__ = my_bc #redirect the current __build_class__ to your function
```

### Metaclass

Classes that derive from type

```py
class BaseMeta(type):
    def __new__(cls, name, bases, body):
        #print('BaseMeta.__new__`, cls, name, bases, body)
        if not 'bar' in body:
            raise TypeError "bad user class"
        return super().__new__(cls, name, bases, body)

class Base(metaclass=BaseMeta):
    def foo(self):
        return self.bar()

    ##new method py3.6
    def __init_subclass__(cls, *a, **kw):
        print('init_subclass', a, kw)
        return super().__init_subclass__(cls, *a, **kw)

#other file
from library import Base

class Derived(Base):
    def bar(self):
        return 'bar'
```

### Inspect Module

```py
from inspect import getsource
getsource(add)
print(getsource(add))

from inspect import getfile
getfile(add)

```

### Decorators

Decorators `@timer` or `@a.b.c` enable easier syntax for wrapper functions, basically where we want to have some function with some enclosing behaviour before and after.  `@timer / def func(*args)` really calls `func = timer(func)` where `*args` is passed as part of the object.

```py
@dec  #decorator
def f():
    pass
```


```py
#dec.py
from time import time

>#Some anon library functions:
def add(x, y=10):
    return x + y

def sub(x, y=10):
    return x-y
```

running this code block:  Written here so its not repeated...

!!!example '''code block'''
        print('add(10)', add(10))
        print('add(20, 30)', add(20, 30))
        print('add("a","b")', add("a", "b"))
        print('add(20, 30)', add(20, 30))
        print('sub(10)', sub(10))
        print('sub(20, 30)', sub(20, 30))

Now if you want to capture the time before and after-- one option, add it to the 'library' function
```py
from time import time

>#library function
def add(x, y=10):
    before = time()
    rv = x + y
    after = time()
    print('elapsed', after-before)
    return rv

'''code block''' #See definition above
```

above we add the function we want to wrap to the actual function.  We'd be required to do it for all the places we want this occur.  E.g. *sub* as well.  Another option is to create a function which wraps the other, as below
```py
#dec.py
from time import time

def timer(func, x, y):
    before= time()
    rv = func(x,y) #see the last example for more general args.
    after = time()
    print('elapsed', after - before)
    return rv


>#library function
def add(x, y=10):
    return x + y

def sub(x, y=10):
    return x-y

'''code block''' #->now you could change this value also, note the changing of '(' to ',' so that its passed as an arg.
print('add(10)', timer(add,10))
print('add(20, 30)', timer(add,20, 30))
```
A better option is to create the wrapper function- _`f`()_ below:

```py
from time import time

def timer(func): #function passed as arg
    def f(x, y=10):  #wrapper functionm
        before= time() #gets the time
        rv = func(x,y) #calls the function -> The original function
        after = time() #after time
        print('elapsed', after - before)
        return rv #return the result
    return f #return the function itself


>#library function
def add(x, y=10):
    return x + y
.#need to redefine add:
add = timer(add)

def sub(x, y=10):
    return x-y
sub = timer(sub) #and sub

'''code block'''
```

finally to the point-- we can replace the wrapper command `add=timer(add)` with `@timer` before the add definition.

Also, lets replace the parameters `x, y=10` hardcoded args and replace with the generic `*args, **kwargs`;
```py
#dec.py
from time import time

def timer(func): #function passed as arg
    def f(*args, **kwargs):  #wrapper functionm  -- also replace the args
        before= time() #gets the time
        rv = func(*args, **kwargs) #calls the function -> The original function
        after = time() #after time
        print('elapsed', after - before)
        return rv #return the result
    return f #return the function itself


>#library function

##Finally

@timer # is equivalent to 'add = timer(add)'
def add(x, y=10):
    return x + y

@timer #is equivalent to sub=timer(sub)
def sub(x, y=10):
    return x-y

'''code block'''
```

```py
def ntimes(n):  #outer function that constructs the decorator
    def inner(f): #inner function creates the wrapper
        def wrapper(*args, **kwargs): #wrapper function creates the function and runs the decorated function.
            for _ in range(n): #takes arg 'n' from ntimes
                print('running {.__name__}'.format(f))
                rv = f(*args, **kwargs)
            return rv
        return wrapper
    return inner

@ntimes(2)
def add(x, y=10):
    return x + y

@ntimes(5)
def sub (x, y=10)
    return x - y

print('add(10)', add(10))
'''code block'''
```

## Unit Testting

Checks that a function named `add_2` is a function `self.assert_(isinstance(add_2, types.FunctionType))`
        

 `self.assertEquals(add_2(4), 6)`

## GUIs

### Curses

!!!warn Warn: The Windows version of Python doesn’t include the curses module. A ported version called UniCurses is available. You could also try the Console module written by Fredrik Lundh, which doesn’t use the same API as curses but provides cursor-addressable text output and full support for mouse and keyboard input.

THe basic outline of a curses program

```py
import curses

stdscr = curses.initscr()
curses.noecho() #does not send keys to the screen
curses.cbreak() #allows curses to react to key presses.
stdscr.keypad(True) #allow curses to respond to special keys like 'Home'

#exiting - The opposite of the above
curses.nocbreak()
stdscr.keypad(False)
curses.echo()
curses.endwin()
```

A common problem when debugging a curses application is to get your terminal messed up when the application dies without restoring the terminal to its previous state.


In Python you can avoid these complications and make debugging much easier by importing the curses.wrapper() function and using it like this:

```py
from curses import wrapper

def main(stdscr):

    # Clear screen
    stdscr.clear()

    # This raises ZeroDivisionError when i == 10.
    for i in range(0, 11):
        v = i-10
        stdscr.addstr(i, 0, '10 divided by {} is {}'.format(v, 10/v))

    stdscr.refresh()
    stdscr.getkey()

wrapper(main)
```

#### Windows-curses



### tKinter

Tkinter is a python wrapper for Tcl/Tk

[Link to Tutorial](https://pythonprogramming.net/tkinter-depth-tutorial-making-actual-program/)

```py3
import tkinter as tk #Python 2 use 'Tkinter'

LARGE_FONT = ("Verdana", 12) #Constant font type Verdana and size 12

class SeaofBTCapp:

    def __init__(self, *args, **kwargs):

        tk.Tk.__init__(self, *args, **kwargs)
        container = tk.Frame(self) #Frame = window
        container.pack(side="top", fill="both", expand = True)
        #the pack command just fits things in the quickest available spot. Grid also works well.
        #fill will fill the alloted space
        #expand will enlarge beyond the limits you set

        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)
        #weight refers to the priority
        #the first argument is the minimum, just using 0 here


        self.frames = {} #empty dictionary

            #Create a for function that will add each frame to the container
        for F in (StartPage, PageOne):  #A tuple with a list of the pages

            frame =  F(container, self)
            #all the frames go into a container.  Whichever one is at the top is the one that you are going to be interacting with.  Code within will handle which frame is at the top of the container.

            self.frames[F] = frame

            frame.grid(row=0, column=0, sticky="nsew") #specify the grid position you are referring to.  We are assigning the frame to grid position 0, 0.
            #skipped numbers will just be ignored if they are empty; so you can leave the cells space inbetween.
            #sticky="nsew" = north south east west.  Determines how things are stretched.  nsew refers to all 4 directions.  You can do any combo- n/ns/w/e/we/ws etc...

'''
        frame =  StartPage(container, self)
        #all the frames go into a container.  Whichever one is at the top is the one that you are going to be interacting with.  Code within will handle which frame is at the top of the container.

        self.frames[StartPage] = frame

        frame.grid(row=0, column=0, sticky="nsew") #specify the grid position you are referring to.  We are assigning the frame to grid position 0, 0.
        #skipped numbers will just be ignored if they are empty; so you can leave the cells space inbetween.
        #sticky="nsew" = north south east west.  Determines how things are stretched.  nsew refers to all 4 directions.  You can do any combo- n/ns/w/e/we/ws etc...
'''

    def show_frame(self, cont):
        frame = self.frames[cont] #cont is a key for the dictionary.  It is used to look up a particular frame and load it into the frame variable.  Calling this method will bring a particular frame to the front
        frame.tkraise() #this actually brings the frame to the front

#--------this is the base code for adding pages/windows

class StartPage(tk.Frame): #inherit the methods for the frame.

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="Start Page", font = LARGE_FONT)  #LARGE_FONT will be a constant that can be specified outside the code.
        label.pack(pady=10, padx=10) #this adds padding around the label.  Using the pack method to place it, since its just a single object.


#TKinter specific commands.
app = SeaofBTCapp()
app.mainloop()
```

The above is a baseline for tkinter code.

#### Adding Buttons

```py3
#Reuse the code from above above this line.
#--------this is the base code for adding pages/windows
def someQuickFunction()
    print("You pressed this")

def someQuickFunction2(arg)
    print(arg)

class StartPage(tk.Frame): #inherit the methods for the frame.

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="Start Page", font = LARGE_FONT)  #LARGE_FONT will be a constant that can be specified outside the code.
        label.pack(pady=10, padx=10) #this adds padding around the label.  Using the pack method to place it, since its just a single object.

        button1 = tk.Button(self, text="Run Quick Function", command= someQuickFunction)
        button1.pack()
        button2 = tk.Button(self, text="Run Quick Function 2", command= someQuickFunction2("Some String"))
        button2.pack()
        button3 = tk.Button(self, text="Run QF2 as Lambda", command= lambda: someQuckFunction2("This Works"))
        button3.pack()
        #button 2 doesnt work.  It runs immedietly on load.  You must use a lambda to pass arguments.

#TKinter specific commands.
app = SeaofBTCapp()
app.mainloop()
```

#### Adding Pages

```py3
#Reuse the code from above above this line.
#--------this is the base code for adding pages/windows
def someQuickFunction()
    print("You pressed this")

def someQuickFunction2(arg)
    print(arg)

class StartPage(tk.Frame): #inherit the methods for the frame.

    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="Start Page", font = LARGE_FONT)  #LARGE_FONT will be a constant that can be specified outside the code.
        label.pack(pady=10, padx=10) #this adds padding around the label.  Using the pack method to place it, since its just a single object.

        button1 = tk.Button(self, text="Visit Page 1", command= lambda: controller.show_frame(PageOne))
        button1.pack()

class PageOne
    #Most of the page definition will be under init.
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="PageOne", font = LARGE_FONT)  #LARGE_FONT will be a constant that can be specified outside the code.
        label.pack(pady=10, padx=10) #this adds padding around the label.  Using the pack method to place it, since its just a single object.

        button1 = tk.Button(self, text="Back to Home", command= lambda: controller.show_frame(StartPage))
        button1.pack()

class PageTwo
    #Most of the page definition will be under init.
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        label = tk.Label(self, text="PageOne", font = LARGE_FONT)  #LARGE_FONT will be a constant that can be specified outside the code.
        label.pack(pady=10, padx=10) #this adds padding around the label.  Using the pack method to place it, since its just a single object.

        button1 = tk.Button(self, text="Back to Home", command= lambda: controller.show_frame(StartPage))




#TKinter specific commands.
app = SeaofBTCapp()
app.mainloop()
```

### wxPyton

### Kivy

### PyQt

[Tutorial](https://www.youtube.com/watch?annotation_id=annotation_3865470925&feature=iv&index=2&list=PLQVvvaa0QuDdVpDFNq4FwY9APZPGSUyR4&src_vid=JBME1ZyHiP8&v=DF_44sWnAsk)

[PythonProgramming.net](PythonProgramming.net)

PyQt has Qt4 and Qt5 version

Installing is complicated.  See the python 2 v 3 section, you have to use py.exe.  The `-m` is critical here.  First install `sip`.

```cmd
py -3-64 -m pip install sip
```

in wsl thin works
python configure.py

need to create a configuration file:


[Sample config file](http://pyqt.sourceforge.net/Docs/sip4/installation.html)
```txt
#The target Python installation.
py_platform = windows
py_inc_dir = /mnt/C/python3-64

#Where SIP will be installed.
sip_bin_dir = %(sysroot)/usr/bin
sip_module_dir = %(sysroot)/usr/lib/python%(py_major)/dist-packages



```

Then download [PyQt4](https://www.riverbankcomputing.com/software/pyqt/download) then follow the instructions to use sip at the reference page for [instructions](http://pyqt.sourceforge.net/Docs/PyQt4/installation.html)

```cmd
py -3-64 -m pip install pyqt4
Collecting pyqt4
  Could not find a version that satisfies the requirement pyqt4 (from versions: )
No matching distribution found for pyqt4

pip3 install PyQt5-sip

Basic Framework

```py3
import sys
from PyQt import QtGui

app = QtGui.QApplication(sys.argv)
window = QtGui.QWidget()
window.show()
```

`sys.argv` - allows you to pass arguments from the command line.  In that spot, you dont have to put `sys.argv` but you have to put something.  You can put an empty list there.

other Qt modules
QtOpenGL
QTXML
QtNetworking
QtSQL
QtSVG

`window.setGeometry(x,y, w, h)` sets the window position and size.

`window.setWindowTitle("Some String As the Title")`


#### Basic App With Icons

```py3

import sys
from PyQt4 import QtGui


class Window(QtGui.QMainWindow):

    def __init__(self):
        super(Window, self).__init__()
        self.setGeometry(50, 50, 500, 500)
        self.setWindowTitle("PyaQt tuts!")
        #pythonprgramming.net/static/favicon.ico
        self.setWindowIcon(QtGui.QIcon('pythonlogo.png'))
        self.show()

app = QtGui.QApplication(sys.argv)
GUI = Window()
sys.exit(app.exec_())
```

#### Adding a button

```py3
import sys
from PyQt4 import QtGui


class Window(QtGui.QMainWindow):

    #Runs each time we make a window objwct, And runs all the methods code.
    def __init__(self):
        super(Window, self).__init__()
        self.setGeometry(50, 50, 500
        self.setWindowTitle("PyaQt tuts!")
        #pythonprgramming.net/static/favicon.ico
        self.setWindowIcon(QtGui.QIcon('pythonlogo.png'))
        self.home()  #change this to home

    #Need to define home
    def home(self):
        btn = QtGui.QPushButton("Quit", self)
        btn.clicked.connect(QtCore.QCoreApplication.instance().quit)
        #optional methods to detail button params:
        btn.resize(100, 100)
        btn.move(100, 100)
        self.show()

#Create a main loop, this is a quick exa ole
def run():
    app=QtGui.QApplication(sys.argv)
    GUI=Window()
    sys.exit(app.ezec_())

run()

```

#### Defining custom button functions

Custom Event Handling

```py3
import sys
from PyQt4 import QtGui

class Window(QtGui.QMainWindow):

    #Runs each time we make a window objwct, And runs all the methods code.
    def __init__(self):
        super(Window, self).__init__()
        self.setGeometry(50, 50, 500
        self.setWindowTitle("PyaQt tuts!")
        #pythonprgramming.net/static/favicon.ico
        self.setWindowIcon(QtGui.QIcon('pythonlogo.png'))
        self.home()  #change this to home

    #Need to define home
    def home(self):
        btn - QtGui.QPushButton("Quit", self)
        btn.clicked.connect(self.close_application())
        #optional methods to detail button params:
        #btn.resize(100, 100)
        #btn.resize(btn.sizeHint()) #allows pyQt to determine the best size
        #lets pyQt determine the minimum size thats reasonable
        btn.resize(btn.minimumSizeHint())
        btn.move(100, 100)
        self.show()

    def close_application(self):
        print("Woah soo custom")
        self.setWindowTitle("Quitting!")
        sys.exit()

#Create a main loop, this is a quick exa ole
def run():
    app=QtGui.QApplication(sys.argv)
    GUI=Window()
    sys.exit(app.exec_())

run()
```

#### Adding a main menu

```py3
import sys
from PyQt4 import QtGui

class Window(QtGui.QMainWindow):

    #Runs each time we make a window objwct, And runs all the methods code.
    def __init__(self):
        super(Window, self).__init__()
        self.setGeometry(50, 50, 500
        self.setWindowTitle("PyaQt tuts!")
        #pythonprgramming.net/static/favicon.ico
        self.setWindowIcon(QtGui.QIcon('pythonlogo.png'))

        #Adding a main menu

        #Code for a single menu item.  Set it equal to a variable, and add each variable under 'fileMenu.addAction(var)
        extractAction=QtGui.QAction("&Get to The Chopper")
        extractAction.setShortcut("Ctrl+Q")
        extractAction.setStatusTip('Leave the App')
        extractAction.triggered.connect(self.close_application())
        #Calls the status bar into being, Shows the tip from above.
        self.statusBar()

        #Because we want to modify the menubar, it has to be set equal to a variable
        mainMenu=self.menuBar()
        fileMenu - mainMenu.addMenu('&File')
        fileMenu.addAction(extractAction)


        self.home()  #change this to home

    #Need to define home
    def home(self):
        btn - QtGui.QPushButton("Quit", self)
        btn.clicked.connect(self.close_application())
        #optional methods to detail button params:
        #btn.resize(100, 100)
        #btn.resize(btn.sizeHint()) #allows pyQt to determine the best size
        #lets pyQt determine the minimum size thats reasonable
        btn.resize(btn.minimumSizeHint())
        btn.move(100, 100)
        self.show()

    def close_application(self):
        print("Woah soo custom")
        self.setWindowTitle("Quitting!")
        sys.exit()

#Create a main loop, this is a quick exa ole
def run():
    app=QtGui.QApplication(sys.argv)
    GUI=Window()
    sys.exit(app.exec_())

run()
```

#### Adding A Toolbar

The toolbar module creates a toolbar that can be dragged around the window, or even dragged off the screen to a stand alone method.

```py3
import sys
from PyQt4 import QtGui


class Window(QtGui.QMainWindow):

    #Runs each time we make a window objwct, And runs all the methods code.
    def __init__(self):
        super(Window, self).__init__()
        self.setGeometry(50, 50, 500
        self.setWindowTitle("PyaQt tuts!")
        #pythonprgramming.net/static/favicon.ico
        self.setWindowIcon(QtGui.QIcon('pythonlogo.png'))

        #Adding a main menu

        #Code for a single menu item.  Set it equal to a variable, and add each variable under 'fileMenu.addAction(var)
        extractAction=QrGui.QAction("&Get to The Chopper")
        extractAction.setShortcut("Ctrl+Q")
        extractAction.setStatusTip('Leave the App')
        extractAction.triggered.connect(self.close_application())
        #Calls the status bar into being, Shows the tip from above.
        self.statusBar()

        #Because we want to modify the menubar, it has to be set equal to a variable
        mainMenu=self.menuBar()
        fileMenu - mainMenu.addMenu('&File')
        fileMenu.addAction(extractAction)


        self.home()  #change this to home

    #Need to define home
    def home(self):
        btn - QtGui.QPushButton("Quit", self)
        btn.clicked.connect(self.close_application())
        #optional methods to detail button params:
        #btn.resize(100, 100)
        #btn.resize(btn.sizeHint()) #allows pyQt to determine the best size
        #lets pyQt determine the minimum size thats reasonable
        btn.resize(btn.minimumSizeHint())
        btn.move(100, 100)

#-------Adding A Toolbar
        #Toolbar
        #Param1 is text string or icon, Parmeter 2 is the hover text. Param 3 is 'self'
        extractAction=QtGui.QAction(QtGui.QIcon(''), 'Flee the Scene', self)
        extractAction.triggered.connect(self.close_application)
        #extractAction.triggered.connect(self.close_application()) #leaving the parens here will make this execute on load, eg the program will just exit.
        #Dont leave the parens
        self.toolBar=self.addToolBar('Extraction')
        self.toolBar.addAction(extractAction)
        self.show()

    def close_application(self):
        print("Woah soo custom")
        self.setWindowTitle("Quitting!")
        sys.exit()

#Create a main loop, this is a quick exa ole
def run():
    app=QtGui.QApplication(sys.argv)
    GUI=Window()
    sys.exit(app.exec_())

run()

```

#### Popup Windows

```py3

        choice=QtGui.QMessageBox.question(
            self, 'Extact!', "Get into the Chopper?", QtGui.QMessageBox.Yes | QtGui.QMessageBox.No)
        #var = QtGui.QMessageBox.question(self, <title>, <prompt>, <choice> | [<choice>]...)
        if choice == QtGui.QMessageBox.Yes:
            print("Extracting Naaaawww")
            self.setWindowTitle("Quitting!")
            sys.exit()
        else:
            pass

```



## Packages

### Timeit

```py
import timeit
t1 = timeit.timeit(someFunc())
t2 = timeit.timeit(someFunc2())
print('Cython is {}x faster'.format(t1/t2))
```

also logtimer, time_benchmark

### Twill

Python 3 version is twill3.


### Generate a progress bar automatically

```py
from time import sleep
from tqdm import tqdm

for i in tqdm(range(1000))
    sleep(0.01)
```

### argparse
```py
import argparse

    parser = argparse.ArgumentParser(description="version " + __version__, prog="almonds",
                                     formatter_class=lambda prog:
                                     argparse.RawTextHelpFormatter(prog, max_help_position=45))

    parser.add_argument("save", nargs="?", type=str, default=None,
                        help="path of a save to load")
    parser.add_argument("-p", "--processes", type=int, metavar="N",
                        default=multiprocessing.cpu_count(),
                        help="number of concurrent processes")

    group = parser.add_mutually_exclusive_group()
    group.add_argument("-r", "--char-ratio", type=float,
                       default=0.428, metavar="RATIO",
                       help="width to height ratio of the terminal characters")
    group.add_argument("-d", "--dimensions", type=int, nargs=2,
                       metavar=("W", "H"), help="width and height of the terminal characters")

    parser.add_argument("-z", "--qwertz", action="store_true", default=False,
                        help='swap the "z" and "y" keys')

    parser.print_help = wrap_prolog(parser.print_help, "\n".join(splash))
    parser.print_usage = wrap_prolog(parser.print_usage, "")

    args = parser.parse_args()

```

Define -

`class argparse.ArgumentParser(prog=None, usage=None, description=None, epilog=None, parents=[], formatter_class=argparse.HelpFormatter, prefix_chars='-', fromfile_prefix_chars=None, argument_default=None, conflict_handler='error', add_help=True, allow_abbrev=True)`

Create a new ArgumentParser object. All parameters should be passed as keyword arguments. Each parameter has its own more detailed description below, but in short they are:
- `prog` - The name of the program (default: sys.argv[0])
- `usage` - The string describing the program usage (default: generated from arguments added to parser)
- `description` - Text to display before the argument help (default: none)
- `epilog` - Text to display after the argument help (default: none)
- `parents` - A list of ArgumentParser objects whose arguments should also be included
- `formatter_class` - A class for customizing the help output
  - class argparse.RawDescriptionHelpFormatter
  - class argparse.RawTextHelpFormatter
  - class argparse.ArgumentDefaultsHelpFormatter
  - class argparse.MetavarTypeHelpFormatter
- `prefix_chars` - The set of characters that prefix optional arguments (default: ‘-‘)
- `fromfile_prefix_chars` - The set of characters that prefix files from which additional arguments should be read (default: None)
- `argument_default` - The global default value for arguments (default: None)
- `conflict_handler` - The strategy for resolving conflicting optionals (usually unnecessary)
- `add_help` - Add a -h/--help option to the parser (default: True)
- `allow_abbrev` - Allows long options to be abbreviated if the abbreviation is unambiguous. (default: True)

```py3

```
The `add_argument()` method must know whether an optional argument, like -f or --foo, or a positional argument, like a list of filenames, is expected. The first arguments passed to `add_argument()` must therefore be either a series of flags, or a simple argument name.

For example, an **optional** argument could be created like:

        >>> parser.add_argument('-f', '--foo')

while a **positional** argument could be created like:

        >>> parser.add_argument('bar')

Formal Definition:  `ArgumentParser.add_argument(name or flags...[, action][, nargs][, const][, default][, type][, choices][, required][, help][, metavar][, dest])`

Define how a single command-line argument should be parsed. Each parameter has its own more detailed description below, but in short they are:

- `name` or flags - Either a name or a list of option strings, e.g. foo or -f, --foo.
- `action` - The basic type of action to be taken when this argument is encountered at the command line.
  - `'store'`- just stores the argument’s value. This is the default action.
  - `'store_const'` - This stores the value specified by the const keyword argument. The 'store_const' action is usually a flag - e.g.
    - `'store_true'`
    - `'store_false'`
  - `'append'` - This stores a list, and appends each argument value to the list.
  - `'append_const'` - This stores a list, and appends the value specified by the const keyword argument to the list.
  - `'count'` - This counts the number of times a keyword argument occurs. e.g. `-vvv`
  - 'help' - This prints a complete help message for all the options in the current parser and then exits.
  - 'version' - This expects a version= keyword argument in the add_argument() call, and prints version information and exits
- `nargs` - The number of command-line arguments that should be consumed.
  !!!warning NOTE: if you specify **nargs** it will return a list.  Even if `nargs=1`.
- `const` - A constant value required by some action and nargs selections.
- `default` - The value produced if the argument is absent from the command line.
- `type` - The type to which the command-line argument should be converted.
- `choices` - A container of the allowable values for the argument.
- `required` - Whether or not the command-line option may be omitted (optionals only).
- `help` - A brief description of what the argument does.
- `metavar` - A name for the argument in usage messages.
- `dest` - The name of the attribute to be added to the object returned by parse_args(). (e.g. the var name - dest=foo, arg.foo)

types of args

**positional** is a required value, just after the program name.  Ideally the program will either run by itself or just positional variable

`parser.add_argument("square", help="display a square of a given number", type=int)`

```py
import argparse #

parser = argparse.ArgumentParser() #
parser.add_argument("square", help="display a square of a given number", type=int)
args = parser.parse_args() #
print(args.square)
```

Note: to avoid having an error returned when no arg is supplied (and just print help) - either extend the error method or check length.  The first returns an error message and prints help for all errors in parsing. Like -blahblah.

[source](https://stackoverflow.com/questions/4042452/display-help-message-with-python-argparse-when-script-is-called-without-any-argu)

```py
#method 1 - more flexible way.
import argparse
import sys

class MyParser(argparse.ArgumentParser):
    def error(self, message):
        sys.stderr.write('error: %s\n' % message)
        self.print_help()
        sys.exit(2)

parser = MyParser()
#Note this is MyParser(*args) now instead of argparse.ArgumentParser(*args)
parser.add_argument('foo', nargs='+')
args = parser.parse_args()

#method 2 Easier way
import argparse
import sys

parser=argparse.ArgumentParser()
parser.add_argument('foo', nargs='+')
if len(sys.argv)==1:
    parser.print_help(sys.stderr)
    sys.exit(1)
args=parser.parse_args()
```

Note: from here on the bits marked by comment flags are implied.


**choices** -constrain the input to a few select values

`parser.add_argument("-v", "--verbosity", type=int, choices=[0, 1, 2],help="increase output verbosity")`

```py
parser.add_argument("-v", "--verbosity", type=int, choices=[0, 1, 2],
                    help="increase output verbosity")

```
**true/false** - is either present or not.

`parser.add_argument("-v", "--verbose", help="increase output verbosity",action="store_true")`

```py
parser.add_argument("-v", "--verbose", help="increase output verbosity",
                    action="store_true")
args = parser.pzarse_args()
if args.verbose:
    print("verbosity turned on")
```

**count** - counts the number of times a value is provided.

`parser.add_argument("-v", "--verbosity", action="count", help="increase output verbosity")`

```py
parser.add_argument("-v", "--verbosity", action="count", default="0",
                    help="increase output verbosity")
if args.verbosity >= 2:
    print("the square of {} equals {}".format(args.square, answer))
elif args.verbosity >= 1:
    print("{}^2 == {}".format(args.square, answer))
else:
    print('...')

$ python3 prog.py 4 -vvv
the square of 4 equals 16
$ python3 prog.py 4 -vvvv
```

Remember that by default, if an optional argument isn’t specified, it gets the None value, and that cannot be compared to an int value (hence the TypeError exception).

**groups**

groups can combine flags that should be mutually exclusive.

```py
import argparse

parser = argparse.ArgumentParser(description="calculate X to the power of Y")
group = parser.add_mutually_exclusive_group()
group.add_argument("-v", "--verbose", action="store_true")
group.add_argument("-q", "--quiet", action="store_true")
parser.add_argument("x", type=int, help="the base")
parser.add_argument("y", type=int, help="the exponent")
args = parser.parse_args()
answer = args.x**args.y

if args.quiet:
    print(answer)
elif args.verbose:
    print("{} to the power {} equals {}".format(args.x, args.y, answer))
else:
    print("{}^{} == {}".format(args.x, args.y, answer))

##out
$ python3 prog.py --help
usage: prog.py [-h] [-v | -q] x y

calculate X to the power of Y

positional arguments:
  x              the base
  y              the exponent

optional arguments:
  -h, --help     show this help message and exit
  -v, --verbose
  -q, --quiet
```

### Windows Modules

the idea is to collect modules that would provide AHK like functionality

- ?pip-Win (1.4) - Pip-Win is a tiny python package manager with virtualenv that is super easy to install on Windows
-  supervisor-win (4.0.1)         - A system for controlling process state under WINDOWS
win-devices (0.0.2)            - A module to return video devices connected to a Windows computer



fasttext-win (0.8.3)           - A Python interface for Facebook fastText library
os-win (4.2.0)                 - Windows / Hyper-V library for OpenStack projects.
win-nic (1.0.1)                - Python package to interface with network intetrface cards (NICs) on Windows-based computers.
virtualenvwrapper-win (1.2.5)  - Port of Doug Hellmann's virtualenvwrapper to Windows batch scripts
win-bash-aliases (0.0.3)       - Windows WSL bash aliases for cmd and powershell
win-inet-pton (1.1.0)          - Native inet_pton and inet_ntop implementation for Python on Windows (with ctypes).
pyenv-win (1.2.2)              - pyenv lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do
                                 one thing well.
sanic-win (0.6.1)              - A microframework based on uvloop, httptools, and learnings of flask
aiowintest (0.0.5)             - Python implementation of the Win-Test UDP protocol
windows-curses (1.1)                                  - Support for the standard curses module on Windows
windows (0.1.1)                                       - This package name is reserved by Microsoft Corporation
EasyDialogs-for-Windows (46691.0)                     - EasyDialogs for Windows
plover-windows-brightness (0.0.2)                     - Change Windows monitor brightness with Plover
py-windows-exe (1.0.0)                                - Functions needed when running a Python program as a Windows exe
windows-rbs-parser (0.0.1)                            - Python library/tool which is able to parse .rbs files used by the windows diagnostics framework
os-windows (0.0.1)                                    -
capstone-windows (3.0.4)                              - Capstone disassembly engine
some-windows-snippets (0.0.0)                         - description
os-windows (0.0.1)                                    -
capstone-windows (3.0.4)                              - Capstone disassembly engine


WMI (1.4.9)                                           - Windows Management Instrumentation
pkgtest (0.0.0)                                       - Control the Windows GUI
swdpp (0.0.5)                                         - sliding window DPP
syspy (0.2)                                           - Windows System Informations
win32core (221.36)                                    - Python for Window Extensions
pygst_utils (0.3.post10)                              - GStreamer Windows server
registry (0.4.2)                                      - Windows registry API
sifr (0.0.4)                                          - Window based counters
win32ext (221.2)                                      - Python for Window Extensions
azuremonitor (0.1)                                    - Windows Azure Monitor
ration (0.1.3)                                        - Civilized window management
WinDeft (1.0.0)                                       - Windows Defender Tester.
pmuxy (0.1.3)                                         - A tmux windows manager
win32gui (221.6)                                      - Python for Window Extensions
infi.winver (1.0.3)                                   - get windows version
guippy (0.1.1)                                        - Control the Windows GUI
rage (0.1.0)                                          - Windows Registry Manipulation
mypc (0.0.1)                                          - Open "This PC" on Windows.
jqpython (0.1)                                        - python + jq for windows
winshell (0.6)                                        - Windows shell functions
pywin32 (224)                                         - Python for Window Extensions
  INSTALLED: 224 (latest)
WinWallpaper (1.0)                                    - Windows Background Changer
Bourbon (1.1)                                         - WSGI Windows Service
windirs (1.1.1)                                       - Windows path wrapper
uiautomation (1.1.15)                                 - Python UIAutomation for Windows
time-window (0.0.1)                                   - A Time Window library
wpi (0.10.2)                                          - Windows Printer Installer
infi.wioctl (0.1.15)                                  - Windows ioctl wrapper
pywincert (1.0.2)                                     - Wrapper for Windows makecert
paws-cli (0.6.0)                                      - A tool used to provision Windows systems and configure Windows services.
wslexplorer (0.1.2)                                   - Simple script that launches Window Explorer from Windows Subsystem for Linux
icaclswrap (0.2.0)                                    - Windows ACL permissions management through wrapping windows executable icacls
winappdbg (1.5)                                       - Windows application debugging engine
M2CryptoWin32 (0.21.1-3)                              - M2Crypto for Windows (32-bit)
z3c.recipe.winservice (0.7.0)                         - Zope3 windows service installer
powershellmagic (0.1.0)                               - IPython magic for Windows PowerShell
PyRexecd (0.3.1)                                      - Standalone SSH server for Windows
MP_Sliding_Window (0.0.26)                            - Multiprocessing Based Sliding window
jaraco.video (3.0)                                    - A pure-python framegrabber for Windows
time-series (0.2)                                     - Python implementation of a sliding window.
Pysam-Win-AltAnalyze (0.5.9)                          - Pysam for Windows Altanalyze installation
wrun (0.1.6)                                          - Run Remote Windows Executables
infi.eventlog (0.1.11)                                - Bindings to Windows Event Log
winwifi (0.0.17)                                      - A Windows Wi-Fi CLI
simpleazure (0.1.5)                                   - Python Library for Windows Azure
CobraWinLDTP (4.0.0)                                  - Windows GUI Test automation
weighslide (0.1.7)                                    - Flexible sliding window analysis
rolling (0.2.0)                                       - Efficient rolling window algorithms
infi.systray (0.1.11)                                 - Windows system tray icon
M2CryptoWin64 (0.21.1-3)                              - M2Crypto for Windows (64-bit)
infi.wmpio (0.1.29)                                   - Windows MPIO Management in Python
rio-mucho (1.0.0)                                     - Windowed multiprocessing wrapper for rasterio
sx-tiling (0.0.0)                                     - tiling window manager plugin
bearlibterminal (0.15.7)                              - BearLibTerminal is a pseudoterminal window library
TestcaseSelector (1.3.2)                              - Unittest test selector window
winproxy (0.3.0a1)                                    - A Proxy Selection Tool for Windows
datetimewindow (0.1.0.3)                              - Data type for windows of datetimes.
AL---Application-Launcher (1.0.7)                     - Freeware application launcher for windows
dympy (0.0.3)                                         - Python-Dymola communication on windows
PrintOnline (0.0.8)                                   - A online printer manager for Windows.
odoo8-addon-mail-read-new-window (8.0.1.0.0.99.dev9)  - Open mail in new window
WinPET (1.0.2)                                        - Windows Privilege Escalation Tester.
tinycc (1.1)                                          - TinyCC compiler bundle for windows
tkinterquickhelper (1.5.72)                           - Helpers for tkinter, extra windows.
caffe-ssd-x86 (1.0.0.1)                               - Baidu Caffe SSD For Windows
PyCY (1.0.0)                                          - wrapper for windows CY type
pyface (6.0.0)                                        - traits-capable windowing framework
WinService (0.0.1)                                    - Package to manage windows service
WinSys-3.x (0.5.2)                                    - Python tools for the Windows sysadmin
py_win_keyboard_layout (0.2)                          - Interaction with keyboard layout on windows
PyWinMouse (1.0)                                      - Python Windows Mouse Utilities
pysam-win (0.5.12)                                    - Pysam for Windows Altanalyze installation


## Python on windows

(Python) PS D:\ASUSsync\VS Code\Python> pip search windows



**InterOp**
win-app-packager
virtualenvwrapper-win
pip-Win
pyenv-win
win-inet-pton
win-bash-aliases

**Utils**


**Windows Funcs**
some-windows-snippets
windows-curses
uiautomation
os-windows
EasyDialogs-for-Windows
py-windows-exe
plover-windows-brightness
temper-windows
wpi
infi.wioctl
pywincert
pywin32
pmuxy
winshell
WinWallpaper
Bourbon
syspy
windirs
swdpp
win32gui
infi.winver
guippy
WinDeft
rage
mypc
jqpython
WMI
pkgtest
win32core
win32compat
pygst_utils
registry
paws-cli
icaclswrap
PyCY
wslexplorer
gettext_windows
iis_bridge
winregrc
infi.win32service
tinycc
tkinterquickhelper
sifr
WinService
py_win_keyboard_layout
PyRexecd
WinSys-3.x
jaraco.video
PyWinMouse
PrintOnline
WinPET
infi.systray
M2CryptoWin64
infi.wmpio
win32ext
winproxy
AL---Application-Launcher
M2CryptoWin32
winappdbg
z3c.recipe.winservice
powershellmagic
winwifi
pyAA
mpns-client
fasttext-win
supervisor-win
rtsf-win
os-win
pdbparse
pycab
toga-mfc


**Hardware**
win-devices
win-nic
aiowintest

