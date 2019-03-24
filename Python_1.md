# Python Notes

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

### Python 2 vs Python 3

As long as Python 3.3 or greater is instanlled in C:\Windows two files are copied py.exe and pyw.exe

From the command line you can specify particular versions of python by saying

```batch
py -3.6
py -2.7
py -3
py -2
py -3.7 # is not installed in this case
>>>  Requested Python version (3.7) not installed
```

py -3.x doesn't work, as in the example, the minor number must be specified or left off. The x, doesnt work.

Python 3 installs 3 versions of PIP, for example, python 3.6 installs:

- easy_install-3.6.exe
- easy_install.exe
- pip.exe
- pip3.6.exe
- pip3.exe

Sp, using `RapidEnivronmentEditor` RapidEE, add to path `D:\Visual Studio\Shared\Python36_64\Scripts` so that you can then call pip3.exe

#### Differences

iteritems() vs. items()

zip() returns different values

print() vs print

### help()

`help()` - calling help(obj) gets the help file for that object.

```py
help(str)
>>>  # Returns all the methods for that object
help(str.__add__) # Works to get the specific help lines for obj.method.

```

### DIR (dir())

dir()

- If the **object** _supplies a method_ named **dir**, it will be used;
  - otherwise the default dir() logic is used and returns:
  - for a **module object:** the module's attributes.
  - for **a class object:** _ its attributes, and recursively the attributes of its bases._
  - for _any other object:_ its attributes, its class's attributes, and recursively the attributes of its class's base classes.

### Exit() vs Quit()

To exit the command line python you can use exit() or quit()

`quit()` is an immediete interrupt and exits immedietly

`exit()` says when the interpreter gets a chance to exit

### import

import is used to make specialty functions available

These are called modules

```python
import random
import sys
import os
import re # Regular expressions
import math # math functions
```

How you import matters. From the 3.7 help file is the warning "Be sure to use the `import os` style instead of `from os import *`. This will keep `os.open()` from shadowing the built-in `open() function which operates much differently." This seems to suggest that`from <library> import <module>` imports the namespace directly.

#### USEFUL MODULES

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

### Built-in Functions

Python has a few built in functions:

[Defined Here](https://docs.python.org/3/library/functions.html)

- abs()
- divmod()
- input()
- open()
- staticmethod()
- all()
- enumerate()
- int()
- ord()
- str()
- any()
- eval()
- isinstance()
- pow()
- sum()
- basestring()
- execfile()
- issubclass()
- print()
- super()
- bin()
- file()
- iter()
- property()
- tuple()
- bool()
- filter()
- len()
- range()
- type()
- bytearray()
- float()
- list()
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
- map()
- repr()
- xrange()
- cmp()
- globals()
- max()
- reversed()
- zip()
- compile()
- hasattr()
- memoryview()
- round()
- `__import__()`
- complex()
- hash()
- min() - find the minimum of a set of values
- set()
- delattr()
- help() - get documentation on a command
- next()
- setattr()
- dict()
- hex()
- object()
- slice()
- dir() - get all the methods related to an object
- id()
- oct()
- sorted()

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

>>> f"He said his name is {repr(name)}."  # repr() is equivalent to !r
"He said his name is 'Fred'."

>>> width = 10
>>> precision = 4
>>> value = decimal.Decimal("12.34567")
>>> f"result: {value:{width}.{precision}}"  # nested fields
'result:      12.35'

>>> today = datetime(year=2017, month=1, day=27)
>>> f"{today:%B %d, %Y}"  # using date format specifier
'January 27, 2017'

>>> number = 1024
>>> f"{number:#0x}"  # using integer format specifier
'0x400'
```

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

### Assignment

```py
x = 1                   # Integer
x = 1.                  # float
x = 1.0                 # float
x,y,z = 1, 'Hi', 3.0    # Multiple Assignment
x=y=1                   # Serial Assignment

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

integer

float

long integer

decimal integer(?)

#### Mathematical Operations

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

- float + any numerical type
- add (float + any numerical)

### STRINGS

Strings are an ordered collection of characters. It is a series of characters surrounded by ' or "

If you must use a " or ' between the same quote escape it with \.

They can be indexed using the array referencing.

```python
s1 = 'abcde'
s2 = 'fghij'
s1[0] #>1
s2[2:] #>hij
s3 = s1 + s2  # Concatenate 2 strings
print(s3) #> 'abcdefghij'

long_string = "I'll catch you if you fall - The Floor"
print(long_string[0:4])  #Retrieve the first 4 characters
print(long_string[-5:])  # Get the last 5 characters
print(long_string[:-5])  # Everything up to the last 5 characters
print(long_string[:4] + " be there")  # Concatenate part of a string to another
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

See more in the [Basics-Literals Section](# ### Literals)

### Boolean

In the context of Boolean operations, and also when expressions are used by control flow statements, the following values are interpreted as false: `False`, `None`, **numeric zero of all types,** and **empty strings and containers** (including **strings,** **tuples,** **lists,** **dictionaries,** **sets** and **frozensets).** All other values are interpreted as true. (See the **nonzero**() special method for a way to change this.)

### A note on comparison

Mutable objects will be un-equal unless they are the same object, because comparisons are based upon a hash.

Only Immutable Objects are hashable. ANd thus comprable. (Tuples)

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

### Lists `[ ]` - Mutable

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

# You can change the value stored in a list box
grocery_list[0] = "Green Juice"
print(grocery_list)

#indexing a list position that doesnt exist throws an error.
List= [1, 'a string', A_Variable]
List[3] = -15 #indexing the 4th position, a position that doesnt exist, attempts to redirect the binding of the 4th item and throws an error.

# You can get a subset of the list with [min:up to but not including max]

print(grocery_list[1:3])

# You can put any data type in a a list including a list
other_events = ['Wash Car', 'Pick up Kids', 'Cash Check']
to_do_list = [other_events, grocery_list]

print(to_do_list)

# Get the second item in the second list (Boxes inside of boxes)
print(to_do_list[1][1])

# You add values using append
grocery_list.append('onions')
print(to_do_list)

# Insert item at given index
grocery_list.insert(1, "Pickle")

# Remove item from list
grocery_list.remove("Pickle")

# Sorts items in list
grocery_list.sort()

# Reverse sort items in list
grocery_list.reverse()

# del deletes an item at specified index
del grocery_list[4]
print(to_do_list)

# We can combine lists with a +
to_do_list = other_events + grocery_list
print(to_do_list)

# Get length of list
print(len(to_do_list))

# Get the max item in list
print(max(to_do_list))

# Get the minimum item in list
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
        print c     # Prints each University

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

---

### TUPLES `( )` Immutable

Briefly - _Immutable, parentheses, Ref w/ [], negative from other end, and slice with [start:end], both optional._

You still reference it with square brackets `[ ]` - like everything in python. They are just defined in parentheses `( )`

`pi_tuple = (3, 1, 4, 1, 5, 9)`

Values in a tuple can't change like lists, they are **Immutable**. Note the **Parentheses**. THis is the important indicator.

You can index them and reference them, 'selection', using **[#]** square brackets. Zero indexed. Giving a negative index starts from the other end. You can also 'slice' with the colon.

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

#### Gathering- Variable Length Inputs and Outputs

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
	print(first, last, directory[last,first]) # to print the phonebook.
```

### DICTIONARY or MAP { } - Mutable, heterogeneous

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

### Sets

Dont know what these are yet

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

### FOR LOOPS

iterative

`for` **-FOR** _variable_ **IN** _iterable_ or _collection:_

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

# You can use for loops to cycle through a list
grocery_list = ['Juice', 'Tomatoes', 'Potatoes', 'Bananas']

for y in grocery_list:
    print(y)

# You can also define a list of numbers to cycle through
for x in [2,4,6,8,10]:
    print(x)

# You can double up for loops to cycle through lists
num_list =[[1,2,3],[10,20,30],[100,200,300]];

for x in range(0,3):
    for y in range(0,3):
        print(num_list[x][y])
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
i = 0;
while (i <= 20):
    if(i%2 == 0):
        print(i)
    elif(i == 9):
        # Forces the loop to end all together
        break
    else:
        # Shorthand for i = i + 1
        i += 1
        # Skips to the next iteration of the loop
        continue

    i += 1
```

### Range, Break, Continue, Pass, Enumerate, and Iter, and others

#### RANGE

`range(int, int, int)`

- (stop)
- (start, stop)
- (start, stop, step)

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
         break    # break here
     print('Number is ' + str(number))
print('Out of loop')

Number is 1
Number is 2
Number is 3
Number is 4
Out of loop
 # gets to 5 and then stops
```

#### CONTINUE

`continue` -continue the loop -just stop the current iteration

```py
number = 0
for number in range(7):
    number = number + 1

    if number == 5:
         continue    # continue here

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
        pass    # pass here
   print('Number is ' + str(number))

print('Out of loop')

Number is 1
Number is 2
Number is 3
Number is 4
Number is 5  # Nothing Happens
Number is 6
Number is 7
Number is 8
Number is 9
Number is 10
Out of loop
```

From docs: `pass` is a null operation — when it is executed, nothing happens. It is useful as a placeholder when a statement is required syntactically, but no code needs to be executed, for example:

```py
def f(arg): pass    # a function that does nothing (yet)

class C: pass       # a class with no methods (yet)
```

#### enumerate(x)

enumerate(x) - create a for loop that iterates over the keys and the values

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
    return (None, None)  # Tuple of None

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
    return (None, None, None)  # Tuple of None

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
    #return (None, None, None)  # Tuple of None

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

## USER INPUT

print('What is your name?')

Stores everything typed up until ENTER
name = sys.stdin.readline()

print('Hello', name)

## FILE I/O

End of line characters can be Unix/Linux, Windows, or Mac style.

````py
file = open("myFileName.txt") creates a pointer
for line in file:
    print line
        for cell in line.split(','): #csv file reading
            print cell
            print cell.strip()      #strip
file.close()


#Overwrite or create a file for writing
test_file = open("test.txt", "wb") #not sure what wb is specifically.

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

#Opens a file for reading and writing
test_file = open("test.txt", "r+")

#Read text from the file
text_in_file = test_file.read()

print(text_in_file)

#Delete the file
os.remove("test.txt")



#Get a web file/site

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

## CLASSES AND OBJECTS

The concept of OOP allows us to model real world things using code
Every object has attributes (color, height, weight) which are object variables
Every object has abilities (walk, talk, eat) which are object functions

```py
class Animal:
    # None signifies the lack of a value
    # You can make a variable private by starting it with __
    __name = None
    __height = None
    __weight = None
    __sound = None

    # The constructor is called to set up or initialize an object
    # self allows an object to refer to itself inside of the class
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

```
cat = Animal('Whiskers', 33, 10, 'Meow')

print(cat.toString())

# You can't access this value directly because it is private
#print(cat.__name)
```

### INHERITANCE

You can inherit all of the variables and methods from another class

```py
class Dog(Animal):
    __owner = None

    def __init__(self, name, height, weight, sound, owner):
        self.__owner = owner
        self.__animal_type = None

        # How to call the super class constructor
        super(Dog, self).__init__(name, height, weight, sound)

    def set_owner(self, owner):
        self.__owner = owner

    def get_owner(self):
        return self.__owner

    def get_type(self):
        print ("Dog")

    # We can overwrite functions in the super class
    def toString(self):
        return "{} is {} cm tall and {} kilograms and says {}. His owner is {}".format(self.get_name(), self.get_height(), self.get_weight(), self.get_sound(), self.__owner)

    # You don't have to require attributes to be sent
    # This allows for method overloading
    def multiple_sounds(self, how_many=None):
        if how_many is None:
            print(self.get_sound)
        else:
            print(self.get_sound() * how_many)

spot = Dog("Spot", 53, 27, "Ruff", "Derek")

print(spot.toString())
```

### Polymorphism

Polymorphism allows use to refer to objects as their super class and the correct functions are called automatically

```py
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

Dunder methods are written as `__method__` but they are called indirectly. For instance, the integer or string object has the Dunder Method `__add__` that declares what occurs when 5 + 8 or String + String occurs. In the case of integers, method calls for basic addition. In the case of strings, it calls for _Concatenation._

Other conditions, call other dunder methods. print() for instance, calls the dunder method `__str__`.
```
````
