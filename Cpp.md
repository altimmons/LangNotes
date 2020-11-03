# C++: Getting Started

[Try this tutorial](https://msdn.microsoft.com/en-us/library/bb384843.aspx)
[Dr. GUI](https://msdn.microsoft.com/en-us/library/aa302304.aspx)
[C Language Reference | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/c-language/c-language-reference?view=vs-2017)
[C++ Language Reference | Microsoft Docs](https://docs.microsoft.com/en-us/cpp/cpp/cpp-language-reference?view=vs-2019)
## Setip


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



## Variables 

Initalize 3 ways

int valueX; // this could be anything, whatever happens to be in the reused memory function
Copy Initialization: `int valueX = 0; `
Direct Initialization: `int valueX(0);`
Uniform Initialization (aka Brace Initialization): `int valueX{0};`
   - Zero Initialization: `int valueX{}` - initializes to zero or empty depending on value.


int valueX[0] returns a pointer


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


## Casting

`sstatic_cast<T>(v);`

Assigning a value to increasing precision is ok

eg. a float -> double

to force a cast to lower precision (e.g. double assigned to int)





```cpp
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


## IO Operations

```cpp

#include <iosteam.h>
cout << "HELLO WORLD"
cin>>readVal

```

## Pointers


### Passing Objects

The best way is to provide the myGLCD object as a parameter to the constructor:

```cpp
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
```cpp
private: 
  UTFT *glcd;
Your library code then uses the glcd pointer to the object:

**glcd->drawRoundedRectangle(...);**
``` 

Note the use of `->` since glcd is a pointer to the object (as created by the & operator when it was assigned in the constructor).


## Classes 


```cpp
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


```cpp
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



## Multiple Files

### Initial Prototype

```cpp
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

```cpp
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

#### Implementation

```cpp
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

```cpp
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

### Compilation

Sinle File:
`g++ -W -Wall -s -pendantic-errors proq.cpp -o my_proq`

To multiple files:
`g++ -W -Wall -s -pendantic-errors treeFarm.cpp treeFarmFunctions.cpp -o my_proq`
`g++ -W -Wall -s -pendantic-errors *.cpp  -o my_proq`

## Enums
[How to iterate over enums](https://stackoverflow.com/questions/261963/how-can-i-iterate-over-an-enum)

Iterable Enums

```cpp
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

```cpp
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


## Pragmas:

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

## Compiler Pre-Defined Macros

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

## Preprocessor operators

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