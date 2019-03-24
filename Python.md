# Python Notes

[[TOC]]

Online Docs:

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

### Managing Python with Conda

Anaconda can manage multiple python installs as well. Now that I've finally figured out how py.exe works.

See here: [Conda Environment](https://conda.io/docs/user-guide/tasks/manage-python.html).

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

### import

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

Escape Sequence | Meaning | Notes|
**\*\***\_\_\_**\*\***|**\*\*\*\***\_\_\_\_**\*\*\*\***|\***\*\_\*\***|
`\newline`| Backslash and newline ignored| |
`\\`| Backslash (\)| |
`\'`| Single quote (')| |
`\"`| Double quote (")| |
`\a`| ASCII Bell (BEL)| |
`\b`| ASCII Backspace (BS)| |
`\f`| ASCII Formfeed (FF)| |
`\n`| ASCII Linefeed (LF)| |
`\r`| ASCII Carriage Return (CR)| |
`\t`| |ASCII Horizontal Tab (TAB)| |
`\v`| ASCII Vertical Tab (VT)| |
`\ooo`| Character with octal value ooo| (1,3)|
`\xhh`| Character with hex value hh |(2,3)|
`\N{name}`| Character named name in the Unicode database| (4)|
`\uxxxx`| Character with 16-bit hex value xxxx| (5)|
`\Uxxxxxxxx`| Character with 32-bit hex value xxxxxxxx| (6)|

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

- abs() - absolute
- divmod()
- input()
- open()
- staticmethod()
- all()
- enumerate()
- int()
- ord()
- [str()](#str())
- any()
- eval()
- isinstance()
- pow()
- sum()
- basestring()
- execfile()
- issubclass()
- [print()](#print())
- super()
- bin()
- file()
- iter()
- property()
- [tuple()](#(TUPLES))
- bool()
- filter()
- len()
- [range()](#RANGES)
- [type()](#Type-Command)
- bytearray()
- float()
- [list()](#[LISTS])
- raw_input()
- unichr()
- callable()
- format()
- locals()
- reduce()
- unicode()
- chr()
- frozenset()
- long()
- reload()
- vars()
- classmethod()
- getattr()
- [map()](#{DICTIONARY})
- repr()
- xrange()
- cmp()
- globals()
- max()
- reversed()
- [zip()](#zip(()))
- compile()
- hasattr()
- memoryview()
- round()
- [`__import__()`](#import)
- complex()
- hash()
- min() - find the minimum of a set of values
- [set()](#Sets)
- delattr()
- help() - get documentation on a command
- next()
- setattr()
- [dict()](#{DICTIONARY})
- hex()
- object()
- slice()
- dir() - get all the methods related to an object
- id()
- oct()
- sorted()

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

`__add__`

`__class__`

`__contains__`

`__delattr__`

`__doc__`

`__eq__`

`__format__`

`__ge__`

`__getattribute__`

`__getitem__`

`__getnewargs__`

`__getslice__`

`__gt__`

`__hash__`

`__init__`

`__le__`

`__len__`

`__lt__`

`__mod__`

`__mul__`

`__ne__`

`__new__`

`__reduce__`

`__reduce_ex__`

`__repr__`

`__rmod__`

`__rmul__`

`__setattr__`

`__sizeof__`

`__str__`,
`__subclasshook__`

`_formatter_field_name_split`

`_formatter_parser`

**`capitalize`**

`center`

`count`

`decode`

`encode`

`endswith`

`expandtabs`

**`find`**

`format`

`index`

`isalnum`

`isalpha`

`isdigit`

`islower`

`isspace`

`istitle`

`isupper`

`join`

`ljust`

`lower`

`lstrip`

`partition`

`replace`

`rfind`

`rindex`

`rjust`

`rpartition`

`rsplit`

`rstrip`

`split`

`splitlines`

`startswith`

`strip`

`swapcase`

`title`

`translate`

`upper`

`zfill`

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

#### String formatting

Do C like string formatting like `sprintf()`.

The format is `print` then a quoted string `"a string here"` followed by a `%` and then in parentheses a comma separated list of values of the appropriate type.

e.g. `print "insert %i as an %s" % (1,"string")`

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

| Conversion | Meaning                                                                                                                                    |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| 'd'        | Signed integer decimal.                                                                                                                    |
| 'i'        | Signed integer decimal.                                                                                                                    |
| 'o'        | Signed octal value.                                                                                                                        |
| 'u'        | Obsolete type – it is identical to 'd'.                                                                                                    |
| 'x'        | Signed hexadecimal (lowercase).                                                                                                            |
| 'X'        | Signed hexadecimal (uppercase).                                                                                                            |
| 'e'        | Floating point exponential format (lowercase).                                                                                             |
| 'E'        | Floating point exponential format (uppercase).                                                                                             |
| 'f'        | Floating point decimal format.                                                                                                             |
| 'F'        | Floating point decimal format.                                                                                                             |
| 'g'        | Floating point format. Uses lowercase exponential format if exponent is less than -4 or not less than precision, decimal format otherwise. |
| 'G'        | Floating point format. Uses uppercase exponential format if exponent is less than -4 or not less than precision, decimal format otherwise. |
| 'c'        | Single character (accepts integer or single character string).                                                                             |
| 'r'        | String (converts any Python object using repr()).                                                                                          |
| 's'        | String (converts any Python object using str()).                                                                                           |
| '%'        | No argument is converted, results in a '%' character in the result.                                                                        |

Flag Meaning

- `#` The value conversion will use the “alternate form” (where defined below).
- `0` The conversion will be zero padded for numeric values.
- `-` The converted value is left adjusted (overrides the '0' conversion if both are given).
- `' '` _(a space)_ A blank should be left before a positive number (or empty string) produced by a signed conversion.
- `+` A sign character ('+' or '-') will precede the conversion (overrides a “space” flag).

A length modifier (h, l, or L) may be present, but is ignored as it is not necessary for Python – so e.g. %ld is identical to %d.

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

```py
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

### Try Catch Syntax

```py
while True:
    try:
        x = int(input("Please enter a number"))
        break
    except ValueError:
        print("Oops, that was no valid number. Try again...")
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
name = sys.stdin.readline()

print('Hello', name)

## FILE I/O

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


## GUIs

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

### Twill

Python 3 version is twill3.


