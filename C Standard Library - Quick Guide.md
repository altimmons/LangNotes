# [C Standard Library - Quick Guide - Tutorialspoint](https://www.tutorialspoint.com/c_standard_library/c_standard_library_quick_guide.htm)

<!-- 
-[ `$1`]$2 - $3 <- ^\d+\s+\[(.*?)\](.*?)\n\n(.*?)$
^\d+\s+(.*?)\n\n(.*?)$\n   ==$1== -  $2
(\\_)  -> _

^(#+ )(.*?$) #$1$2

## C Library - <(.*?)\.h>   ## _$1_ <$1.h> <c$1>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
 -->

_______
______
## _assert_ <assert.h> <cassert>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **assert.h** header file of the C Standard Library provides a macro called **assert** which can be used to verify assumptions made by the program and print a diagnostic message if this assumption is false.

The defined macro **assert** refers to another macro **NDEBUG** which is not a part of <assert.h>. If NDEBUG is defined as a macro name in the source file, at the point where <assert.h> is included, the **assert** macro is defined as follows −

#define assert(ignore) ((void)0)

### Library Macros

Following is the only function defined in the header assert.h −

Function & Description

-[ `void assert(int expression)`](https://www.tutorialspoint.com/c_standard_library/c_macro_assert.htm) - This is actually a macro and not a function, which can be used to add diagnostics in your C program.

_______
______
## _ctype_ <ctype.h> <cctype>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **ctype.h** header file of the C Standard Library declares several functions that are useful for testing and mapping characters.

All the functions accepts **int** as a parameter, whose value must be EOF or representable as an unsigned char.

All the functions return non-zero (true) if the argument c satisfies the condition described, and zero(false) if not.

### Library Functions

Following are the functions defined in the header ctype.h −

Function & Description

-[ `int isalnum(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isalnum.htm) - This function checks whether the passed character is alphanumeric.

-[ `int isalpha(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isalpha.htm) - This function checks whether the passed character is alphabetic.

-[ `int iscntrl(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_iscntrl.htm) - This function checks whether the passed character is control character.

-[ `int isdigit(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isdigit.htm) - This function checks whether the passed character is decimal digit.

-[ `int isgraph(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isgraph.htm) - This function checks whether the passed character has graphical representation using locale.

-[ `int islower(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_islower.htm) - This function checks whether the passed character is lowercase letter.

-[ `int isprint(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isprint.htm) - This function checks whether the passed character is printable.

-[ `int ispunct(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_ispunct.htm) - This function checks whether the passed character is a punctuation character.

-[ `int isspace(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isspace.htm) - This function checks whether the passed character is white-space.

-[ `int isupper(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isupper.htm) - This function checks whether the passed character is an uppercase letter.

-[ `int isxdigit(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_isxdigit.htm) - This function checks whether the passed character is a hexadecimal digit.

The library also contains two conversion functions that accepts and returns an "int".

Function & Description

-[ `int tolower(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_tolower.htm) - This function converts uppercase letters to lowercase.

-[ `int toupper(int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_toupper.htm) - This function converts lowercase letters to uppercase.

### Character Classes

Character Class & Description

 ==**Digits**=={style="background: -webkit-linear-gradient(0deg, deepskyblue, transparent)} -  This is a set of whole numbers { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 }.
 ==**Hexadecimal digits**=={style="background: -webkit-linear-gradient(0deg, deepskyblue 0%, transparent 90%)}  -  This is the set of { 0 1 2 3 4 5 6 7 8 9 A B C D E F a b c d e f }.
 ==**Lowercase letters**== -  This is a set of lowercase letters { a b c d e f g h i j k l m n o p q r s t u v w x y z }.
 ==**Uppercase letters**== -  This is a set of uppercase letters {A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }.
 ==**Letters**== -  This is a set of lowercase and uppercase letters.
 ==**Alphanumeric characters**== -  This is a set of Digits, Lowercase letters and Uppercase letters.
 ==**Punctuation characters**== -  This is a set of ```! " # $ % & ' ( ) \* + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~```
 ==**Graphical characters**== -  This is a set of Alphanumeric characters and Punctuation characters.
 ==**Space characters**== -  This is a set of tab, newline, vertical tab, form feed, carriage return, and space.
 ==**Printable characters**== -  This is a set of Alphanumeric characters, Punctuation characters and Space characters.
 ==**Control characters**== -  In ASCII, these characters have octal codes 000 through 037, and 177 (DEL).
 ==**Blank characters**== -  These are spaces and tabs.
 ==**Alphabetic characters**== -  This is a set of Lowercase letters and Uppercase letters.
_______
______
## _errno_ <errno.h> <cerrno>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **errno.h** header file of the C Standard Library defines the integer variable **errno**, which is set by system calls and some library functions in the event of an error to indicate what went wrong. This macro expands to a modifiable lvalue of type int, therefore it can be both read and modified by a program.

The **errno** is set to zero at program startup. Certain functions of the standard C library modify its value to other than zero to signal some types of error. You can also modify its value or reset to zero at your convenience.

The **errno.h** header file also defines a list of macros indicating different error codes, which will expand to integer constant expressions with type **int**.

### Library Macros

Following are the macros defined in the header errno.h −

Macro & Description

-[ `extern int errno`](https://www.tutorialspoint.com/c_standard_library/c_macro_errno.htm) - This is the macro set by system calls and some library functions in the event of an error to indicate what went wrong.

-[ `EDOM Domain Error`](https://www.tutorialspoint.com/c_standard_library/c_macro_edom.htm) - This macro represents a domain error, which occurs if an input argument is outside the domain, over which the mathematical function is defined and errno is set to EDOM.

-[ `ERANGE Range Error`](https://www.tutorialspoint.com/c_standard_library/c_macro_erange.htm) - This macro represents a range error, which occurs if an input argument is outside the range, over which the mathematical function is defined and errno is set to ERANGE.

_______
______
## _float_ <float.h> <cfloat>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **float.h** header file of the C Standard Library contains a set of various platform-dependent constants related to floating point values. These constants are proposed by ANSI C. They allow making more portable programs. Before checking all the constants, it is good to understand that floating-point number is composed of following four elements −

Component & Component Description

 ==**S**== -  sign ( +/- )
 ==**b**== -  base or radix of the exponent representation, 2 for binary, 10 for decimal, 16 for hexadecimal, and so on...
 ==**e**== -  exponent, an integer between a minimum **emin** and a maximum **emax**.
 ==**p**== -  precision, the number of base-b digits in the significand.
Based on the above 4 components, a floating point will have its value as follows −

floating\-point \= ( S ) p x be or floating\-point \= (+/-) precision x baseexponent

### Library Macros

The following values are implementation-specific and defined with the #define directive, but these values may not be any lower than what is given here. Note that in all instances FLT refers to type **float**, DBL refers to **double**, and LDBL refers to **long double**.

Macro & Description

 ==**FLT_ROUNDS**== -  Defines the rounding mode for floating point addition and it can have any of the following values −
-   \-1 − indeterminable
-   0 − towards zero
-   1 − to nearest
-   2 − towards positive infinity
-   3 − towards negative infinity

 ==**FLT_RADIX 2**== -  This defines the base radix representation of the exponent. A base-2 is binary, base-10 is the normal decimal representation, base-16 is Hex.
 ==**FLT_MANT_DIG**==  **DBL_MANT_DIG**
**LDBL_MANT_DIG**

These macros define the number of digits in the number (in the FLT_RADIX base).

 ==**FLT_DIG 6**== -  **DBL_DIG 10**
**LDBL_DIG 10**

These macros define the maximum number decimal digits (base-10) that can be represented without change after rounding.

 ==**FLT_MIN_EXP**== -  **DBL_MIN_EXP**
**LDBL_MIN_EXP**

These macros define the minimum negative integer value for an exponent in base FLT_RADIX.

 ==**FLT_MIN_10_EXP -37**== -  **DBL_MIN_10_EXP -37**
**LDBL_MIN_10_EXP -37**

These macros define the minimum negative integer value for an exponent in base 10.

 ==**FLT_MAX_EXP**== -  **DBL_MAX_EXP**
**LDBL_MAX_EXP**

These macros define the maximum integer value for an exponent in base FLT_RADIX.

 ==**FLT_MAX_10_EXP +37**==  **DBL_MAX_10_EXP +37**
**LDBL_MAX_10_EXP +37**

These macros define the maximum integer value for an exponent in base 10.

 ==**FLT_MAX 1E+37**== -  **DBL_MAX 1E+37**
**LDBL_MAX 1E+37**

These macros define the maximum finite floating-point value.

 ==**FLT_EPSILON 1E-5**== -  **DBL_EPSILON 1E-9**
**LDBL_EPSILON 1E-9**

These macros define the least significant digit representable.

 ==**FLT_MIN 1E-37**== -  **DBL_MIN 1E-37**
**LDBL_MIN 1E-37**

These macros define the minimum floating-point values.

### Example

The following example shows the usage of few of the constants defined in float.h file.

[Live Demo](http://tpcg.io/FK5Hwy)

#include <stdio.h> #include <float.h> int main () { printf("The maximum value of float = %.10e\\n", FLT_MAX); printf("The minimum value of float = %.10e\\n", FLT_MIN); printf("The number of digits in the number = %.10e\\n", FLT_MANT_DIG); }

Let us compile and run the above program that will produce the following result −

The maximum value of float = 3.4028234664e+38
The minimum value of float = 1.1754943508e-38
The number of digits in the number = 7.2996655210e-312

_______
______
## _limits_ <limits.h> <climits>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **limits.h** header determines various properties of the various variable types. The macros defined in this header, limits the values of various variable types like char, int and long.

These limits specify that a variable cannot store any value beyond these limits, for example an unsigned character can store up to a maximum value of 255.


The following values are implementation-specific and defined with the #define directive, but these values may not be any lower than what is given here.

### Library Macros
| Macro      | Value                | Description                                                             |
| ---------- | -------------------- | ----------------------------------------------------------------------- |
| CHAR_BIT   | 8                    | Defines the number of bits in a byte.                                   |
| SCHAR_MIN  | -128                 | Defines the minimum value for a signed char.                            |
| SCHAR_MAX  | +127                 | Defines the maximum value for a signed char.                            |
| UCHAR_MAX  | 255                  | Defines the maximum value for an unsigned char.                         |
| CHAR_MIN   | -128                 | Defines the minimum value for type char ^[1] (c has neg)? SCHAR_MIN : 0 |
| CHAR_MAX   | +127                 | Defines the value for type char^[2] (c has neg)? SCHAR_MAX : UCAHR_MAX  |
| MB_LEN_MAX | 16                   | Defines the maximum number of bytes in a multi-byte character.          |
| SHRT_MIN   | -32768               | Defines the minimum value for a short int.                              |
| SHRT_MAX   | +32767               | Defines the maximum value for a short int.                              |
| USHRT_MAX  | 65535                | Defines the maximum value for an unsigned short int.                    |
| INT_MIN    | -2147483648          | Defines the minimum value for an int.                                   |
| INT_MAX    | +2147483647          | Defines the maximum value for an int.                                   |
| UINT_MAX   | 4294967295           | Defines the maximum value for an unsigned int.                          |
| LONG_MIN   | -9223372036854775808 | Defines the minimum value for a long int.                               |
| LONG_MAX   | +9223372036854775807 | Defines the maximum value for a long int.                               |
| ULONG_MAX  | 18446744073709551615 | Defines the maximum value for an unsigned long int.                     |


1- its value will be equal to SCHAR_MIN if char represents negative values, otherwise zero.
2-   its value will be equal to SCHAR_MAX if char represents negative values, otherwise UCHAR_MAX.   

The following example shows the usage of few of the constants defined in **limits.h** file.

[Live Demo](http://tpcg.io/MYWu7P)
```c++
#include <stdio.h> 
#include <limits.h> 
int main() { printf("The number of bits in a byte %d\\n", CHAR_BIT); printf("The minimum value of SIGNED CHAR = %d\\n", SCHAR_MIN); printf("The maximum value of SIGNED CHAR = %d\\n", SCHAR_MAX); printf("The maximum value of UNSIGNED CHAR = %d\\n", UCHAR_MAX); printf("The minimum value of SHORT INT = %d\\n", SHRT_MIN); printf("The maximum value of SHORT INT = %d\\n", SHRT_MAX); printf("The minimum value of INT = %d\\n", INT_MIN); printf("The maximum value of INT = %d\\n", INT_MAX); printf("The minimum value of CHAR = %d\\n", CHAR_MIN); printf("The maximum value of CHAR = %d\\n", CHAR_MAX); printf("The minimum value of LONG = %ld\\n", LONG_MIN); printf("The maximum value of LONG = %ld\\n", LONG_MAX); return(0);
 }
```

Let us compile and run the above program that will produce the following result −

The maximum value of UNSIGNED CHAR = 255
The minimum value of SHORT INT = -32768
The maximum value of SHORT INT = 32767
The minimum value of INT = -2147483648
The maximum value of INT = 2147483647
The minimum value of CHAR = -128
The maximum value of CHAR = 127
The minimum value of LONG = -9223372036854775808
The maximum value of LONG = 9223372036854775807
{style="border: 2px groove; margin-left: 10x !important ; background-color" }
_______
______
## _locale_ <locale.h> <clocale>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **locale.h** header defines the location specific settings, such as date formats and currency symbols. You will find several macros defined along with an important structure **struct lconv** and two important functions listed below.

### Library Macros

Following are the macros defined in the header and these macros will be used in two functions listed below −

Macro & Description**{style="color::green"}

 ==**LC_ALL**=={style=} -  Sets everything.
 ==**LC_COLLATE**== -  Affects strcoll and strxfrm functions.
 ==**LC_CTYPE**== -  Affects all character functions.
 ==**LC_MONETARY**== -  Affects the monetary information provided by localeconv function.
 ==**LC_NUMERIC**== -  Affects decimal-point formatting and the information provided by localeconv function.
 ==**LC_TIME**== -  Affects the strftime function.
### Library Functions

Following are the functions defined in the header locale.h −

Function & Description

-[ `char \*setlocale(int category, const char \*locale)`](https://www.tutorialspoint.com/c_standard_library/c_function_setlocale.htm) - Sets or reads location dependent information.

-[ `struct lconv \*localeconv(void)`](https://www.tutorialspoint.com/c_standard_library/c_function_localeconv.htm) - Sets or reads location dependent information.

### Library Structure

typedef struct { char \*decimal_point;
 char \*thousands_sep;
 char \*grouping;
 char \*int_curr_symbol;
 char \*currency_symbol;
 char \*mon_decimal_point;
 char \*mon_thousands_sep;
 char \*mon_grouping;
 char \*positive_sign;
 char \*negative_sign;
 char int_frac_digits;
 char frac_digits;
 char p_cs_precedes;
 char p_sep_by_space;
 char n_cs_precedes;
 char n_sep_by_space;
char p_sign_posn;
char n_sign_posn; } lconv

Following is the description of each of the fields −

Field & Description

 ==**decimal_point**== -  Decimal point character used for non-monetary values.
 ==**thousands_sep**== -  Thousands place separator character used for non-monetary values.
 ==**grouping**== -  A string that indicates the size of each group of digits in non-monetary quantities. Each character represents an integer value, which designates the number of digits in the current group. A value of 0 means that the previous value is to be used for the rest of the groups.
 ==**int_curr_symbol**== -  It is a string of the international currency symbols used. The first three characters are those specified by ISO 4217:1987 and the fourth is the character, which separates the currency symbol from the monetary quantity.
 ==**currency_symbol**== -  The local symbol used for currency.
 ==**mon_decimal_point**== -  The decimal point character used for monetary values.
 ==**mon_thousands_sep**== -  The thousands place grouping character used for monetary values.
 ==**mon_grouping**== -  A string whose elements defines the size of the grouping of digits in monetary values. Each character represents an integer value which designates the number of digits in the current group. A value of 0 means that the previous value is to be used for the rest of the groups.
 ==**positive_sign**== -  The character used for positive monetary values.
 ==**negative_sign**== -  The character used for negative monetary values.
 ==**int_frac_digits**== -  Number of digits to show after the decimal point in international monetary values.
 ==**frac_digits**== -  Number of digits to show after the decimal point in monetary values.
 ==**p_cs_precedes**== -  If equals to 1, then the currency_symbol appears before a positive monetary value. If equals to 0, then the currency_symbol appears after a positive monetary value.
 ==**p_sep_by_space**== -  If equals to 1, then the currency_symbol is separated by a space from a positive monetary value. If equals to 0, then there is no space between the currency_symbol and a positive monetary value.
 ==**n_cs_precedes**== -  If equals to 1, then the currency_symbol precedes a negative monetary value. If equals to 0, then the currency_symbol succeeds a negative monetary value.
 ==**n_sep_by_space**== -  If equals to 1, then the currency_symbol is separated by a space from a negative monetary value. If equals to 0, then there is no space between the currency_symbol and a negative monetary value.
 ==**p_sign_posn**== -  Represents the position of the positive_sign in a positive monetary value.
 ==**n_sign_posn**== -  Represents the position of the negative_sign in a negative monetary value.
The following values are used for **p_sign_posn** and **n_sign_posn** −

Value

Description

 ==Parentheses encapsulates the value and the currency_symbol.== -  1
The sign precedes the value and currency_symbol.

 ==The sign succeeds the value and currency_symbol.== -  3
The sign immediately precedes the value and currency_symbol.

 ==The sign immediately succeeds the value and currency_symbol.== -  # C Library - <math.h>
The **math.h** header defines various mathematical functions and one macro. All the functions available in this library take **double** as an argument and return **double** as the result.

### Library Macros

There is only one macro defined in this library −

Macro & Description

 ==**HUGE_VAL**== -  This macro is used when the result of a function may not be representable as a floating point number. If magnitude of the correct result is too large to be represented, the function sets errno to ERANGE to indicate a range error, and returns a particular, very large value named by the macro HUGE_VAL or its negation (- HUGE_VAL).
If the magnitude of the result is too small, a value of zero is returned instead. In this case, errno might or might not be set to ERANGE.

### Library Functions

Following are the functions defined in the header math.h −

Function & Description

-[ `double acos(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_acos.htm) - Returns the arc cosine of x in radians.

-[ `double asin(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_asin.htm) - Returns the arc sine of x in radians.

-[ `double atan(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_atan.htm) - Returns the arc tangent of x in radians.

-[ `double atan2(double y, double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_atan2.htm) - Returns the arc tangent in radians of y/x based on the signs of both values to determine the correct quadrant.

-[ `double cos(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_cos.htm) - Returns the cosine of a radian angle x.

-[ `double cosh(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_cosh.htm) - Returns the hyperbolic cosine of x.

-[ `double sin(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_sin.htm) - Returns the sine of a radian angle x.

-[ `double sinh(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_sinh.htm) - Returns the hyperbolic sine of x.

-[ `double tanh(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_tanh.htm) - Returns the hyperbolic tangent of x.

-[ `double exp(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_exp.htm) - Returns the value of **e** raised to the xth power.

-[ `double frexp(double x, int \*exponent)`](https://www.tutorialspoint.com/c_standard_library/c_function_frexp.htm) - The returned value is the mantissa and the integer pointed to by exponent is the exponent. The resultant value is x = mantissa \* 2 ^ exponent.

-[ `double ldexp(double x, int exponent)`](https://www.tutorialspoint.com/c_standard_library/c_function_ldexp.htm) - Returns **x** multiplied by 2 raised to the power of exponent.

-[ `double log(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_log.htm) - Returns the natural logarithm (base-e logarithm) of **x**.

-[ `double log10(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_log10.htm) - Returns the common logarithm (base-10 logarithm) of **x**.

-[ `double modf(double x, double \*integer)`](https://www.tutorialspoint.com/c_standard_library/c_function_modf.htm) - The returned value is the fraction component (part after the decimal), and sets integer to the integer component.

-[ `double pow(double x, double y)`](https://www.tutorialspoint.com/c_standard_library/c_function_pow.htm) - Returns x raised to the power of **y**.

-[ `double sqrt(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_sqrt.htm) - Returns the square root of **x**.

-[ `double ceil(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_ceil.htm) - Returns the smallest integer value greater than or equal to **x**.

-[ `double fabs(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_fabs.htm) - Returns the absolute value of **x**.

-[ `double floor(double x)`](https://www.tutorialspoint.com/c_standard_library/c_function_floor.htm) - Returns the largest integer value less than or equal to **x**.

-[ `double fmod(double x, double y)`](https://www.tutorialspoint.com/c_standard_library/c_function_fmod.htm) - Returns the remainder of x divided by **y**.

_______
______
## _setjmp_ <setjmp.h> <csetjmp>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **setjmp.h** header defines the macro **setjmp()**, one function **longjmp()**, and one variable type **jmp_buf**, for bypassing the normal function call and return discipline.

### Library Variables

Following is the variable type defined in the header setjmp.h −

Variable & Description

 ==**jmp_buf**== -  This is an array type used for holding information for macro **setjmp()** and function **longjmp()**.
### Library Macros

There is only one macro defined in this library −

Macro & Description

-[ `int setjmp(jmp_buf environment)`](https://www.tutorialspoint.com/c_standard_library/c_macro_setjmp.htm) - This macro saves the current _environment_ into the variable **environment** for later use by the function **longjmp()**. If this macro returns directly from the macro invocation, it returns zero but if it returns from a **longjmp()** function call, then a non-zero value is returned.

### Library Functions

Following is the only one function defined in the header setjmp.h −

Function & Description

-[ `void longjmp(jmp_buf environment, int value)`](https://www.tutorialspoint.com/c_standard_library/c_function_longjmp.htm) - This function restores the environment saved by the most recent call to **setjmp()** macro in the same invocation of the program with the corresponding **jmp_buf** argument.

_______
______
## _signal_ <signal.h> <csignal>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **signal.h** header defines a variable type **sig_atomic_t**, two function calls, and several macros to handle different signals reported during a program's execution.

### Library Variables

Following is the variable type defined in the header signal.h −

Variable & Description

 ==**sig_atomic_t**== -  This is of **int** type and is used as a variable in a signal handler. This is an integral type of an object that can be accessed as an atomic entity, even in the presence of asynchronous signals.
### Library Macros

Following are the macros defined in the header signal.h and these macros will be used in two functions listed below. The **SIG_** macros are used with the signal function to define signal functions.

Macro & Description

 ==**SIG_DFL**== -  Default signal handler.
 ==**SIG_ERR**== -  Represents a signal error.
 ==**SIG_IGN**== -  Signal ignore.
The **SIG** macros are used to represent a signal number in the following conditions −

Macro & Description

 ==**SIGABRT**== -  Abnormal program termination.
 ==**SIGFPE**== -  Floating-point error like division by zero.
 ==**SIGILL**== -  Illegal operation.
 ==**SIGINT**== -  Interrupt signal such as ctrl-C.
 ==**SIGSEGV**== -  Invalid access to storage like segment violation.
 ==**SIGTERM**== -  Termination request.
### Library Functions

Following are the functions defined in the header signal.h −

Function & Description

-[ `void (\*signal(int sig, void (\*func)(int)))(int)`](https://www.tutorialspoint.com/c_standard_library/c_function_signal.htm) - This function sets a function to handle signal i.e. a signal handler.

-[ `int raise(int sig)`](https://www.tutorialspoint.com/c_standard_library/c_function_raise.htm) - This function causes signal **sig** to be generated. The sig argument is compatible with the SIG macros.

_______
______
## _stdarg_ <stdarg.h> <cstdarg>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **stdarg.h** header defines a variable type **va_list** and three macros which can be used to get the arguments in a function when the number of arguments are not known i.e. variable number of arguments.

A function of variable arguments is defined with the ellipsis (,...) at the end of the parameter list.

### Library Variables

Following is the variable type defined in the header stdarg.h −

Variable & Description

 ==**va_list**== -  This is a type suitable for holding information needed by the three macros **va_start(), va_arg()** and **va_end()**.
### Library Macros

Following are the macros defined in the header stdarg.h −

Macro & Description

-[ `void va_start(va_list ap, last_arg)`](https://www.tutorialspoint.com/c_standard_library/c_macro_va_start.htm) - This macro initializes **ap** variable to be used with the **va_arg** and **va_end** macros. The **last_arg** is the last known fixed argument being passed to the function i.e. the argument before the ellipsis.

-[ `type va_arg(va_list ap, type)`](https://www.tutorialspoint.com/c_standard_library/c_macro_va_arg.htm) - This macro retrieves the next argument in the parameter list of the function with type **type**.

-[ `void va_end(va_list ap)`](https://www.tutorialspoint.com/c_standard_library/c_macro_va_end.htm) - This macro allows a function with variable arguments which used the **va_start** macro to return. If **va_end** is not called before returning from the function, the result is undefined.

_______
______
## _stddef_ <stddef.h> <cstddef>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **stddef.h** header defines various variable types and macros. Many of these definitions also appear in other headers.

### Library Variables

Following are the variable types defined in the header stddef.h −

Variable & Description

 ==**ptrdiff_t**== -  This is the signed integral type and is the result of subtracting two pointers.
 ==**size_t**== -  This is the unsigned integral type and is the result of the **sizeof** keyword.
 ==**wchar_t**== -  This is an integral type of the size of a wide character constant.
### Library Macros

Following are the macros defined in the header stddef.h −

Macro & Description

-[ `NULL`](https://www.tutorialspoint.com/c_standard_library/c_macro_null.htm) - This macro is the value of a null pointer constant.

-[ `offsetof(type, member-designator)`](https://www.tutorialspoint.com/c_standard_library/c_macro_offsetof.htm) - This results in a constant integer of type size_t which is the offset in bytes of a structure member from the beginning of the structure. The member is given by _member-designator_, and the name of the structure is given in _type_.

_______
______
## _stdio_ <stdio.h> <cstdio>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **stdio.h** header defines three variable types, several macros, and various functions for performing input and output.

### Library Variables

Following are the variable types defined in the header stdio.h −

Variable & Description

 ==**size_t**== -  This is the unsigned integral type and is the result of the **sizeof** keyword.
 ==**FILE**== -  This is an object type suitable for storing information for a file stream.
 ==**fpos_t**== -  This is an object type suitable for storing any position in a file.
### Library Macros

Following are the macros defined in the header stdio.h −

Macro & Description

 ==**NULL**== -  This macro is the value of a null pointer constant.
 ==**_IOFBF, _IOLBF** and **_IONBF**== -  These are the macros which expand to integral constant expressions with distinct values and suitable for the use as third argument to the **setvbuf** function.
 ==**BUFSIZ**== -  This macro is an integer, which represents the size of the buffer used by the **setbuf** function.
 ==**EOF**== -  This macro is a negative integer, which indicates that the end-of-file has been reached.
 ==**FOPEN_MAX**== -  This macro is an integer, which represents the maximum number of files that the system can guarantee to be opened simultaneously.
 ==**FILENAME_MAX**== -  This macro is an integer, which represents the longest length of a char array suitable for holding the longest possible filename. If the implementation imposes no limit, then this value should be the recommended maximum value.
 ==**L_tmpnam**== -  This macro is an integer, which represents the longest length of a char array suitable for holding the longest possible temporary filename created by the **tmpnam** function.
 ==**SEEK_CUR, SEEK_END,** and **SEEK_SET**== -  These macros are used in the **fseek** function to locate different positions in a file.
 ==**TMP_MAX**== -  This macro is the maximum number of unique filenames that the function **tmpnam** can generate.
 ==**stderr, stdin,** and **stdout**== -  These macros are pointers to FILE types which correspond to the standard error, standard input, and standard output streams.
### Library Functions

Following are the functions defined in the header stdio.h −

Function & Description

-[ `int fclose(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fclose.htm) - Closes the stream. All buffers are flushed.

-[ `void clearerr(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_clearerr.htm) - Clears the end-of-file and error indicators for the given stream.

-[ `int feof(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_feof.htm) - Tests the end-of-file indicator for the given stream.

-[ `int ferror(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_ferror.htm) - Tests the error indicator for the given stream.

-[ `int fflush(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fflush.htm) - Flushes the output buffer of a stream.

-[ `int fgetpos(FILE \*stream, fpos_t \*pos)`](https://www.tutorialspoint.com/c_standard_library/c_function_fgetpos.htm) - Gets the current file position of the stream and writes it to pos.

-[ `FILE \*fopen(const char \*filename, const char \*mode)`](https://www.tutorialspoint.com/c_standard_library/c_function_fopen.htm) - Opens the filename pointed to by filename using the given mode.

-[ `size_t fread(void \*ptr, size_t size, size_t nmemb, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fread.htm) - Reads data from the given stream into the array pointed to by ptr.

-[ `FILE \*freopen(const char \*filename, const char \*mode, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_freopen.htm) - Associates a new filename with the given open stream and same time closing the old file in stream.

-[ `int fseek(FILE \*stream, long int offset, int whence)`](https://www.tutorialspoint.com/c_standard_library/c_function_fseek.htm) - Sets the file position of the stream to the given offset. The argument _offset_ signifies the number of bytes to seek from the given _whence_ position.

-[ `int fsetpos(FILE \*stream, const fpos_t \*pos)`](https://www.tutorialspoint.com/c_standard_library/c_function_fsetpos.htm) - Sets the file position of the given stream to the given position. The argument _pos_ is a position given by the function fgetpos.

-[ `long int ftell(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_ftell.htm) - Returns the current file position of the given stream.

-[ `size_t fwrite(const void \*ptr, size_t size, size_t nmemb, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fwrite.htm) - Writes data from the array pointed to by ptr to the given stream.

-[ `int remove(const char \*filename)`](https://www.tutorialspoint.com/c_standard_library/c_function_remove.htm) - Deletes the given filename so that it is no longer accessible.

-[ `int rename(const char \*old_filename, const char \*new_filename)`](https://www.tutorialspoint.com/c_standard_library/c_function_rename.htm) - Causes the filename referred to, by old_filename to be changed to new_filename.

-[ `void rewind(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_rewind.htm) - Sets the file position to the beginning of the file of the given stream.

-[ `void setbuf(FILE \*stream, char \*buffer)`](https://www.tutorialspoint.com/c_standard_library/c_function_setbuf.htm) - Defines how a stream should be buffered.

-[ `int setvbuf(FILE \*stream, char \*buffer, int mode, size_t size)`](https://www.tutorialspoint.com/c_standard_library/c_function_setvbuf.htm) - Another function to define how a stream should be buffered.

-[ `FILE \*tmpfile(void)`](https://www.tutorialspoint.com/c_standard_library/c_function_tmpfile.htm) - Creates a temporary file in binary update mode (wb+).

-[ `char \*tmpnam(char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_tmpnam.htm) - Generates and returns a valid temporary filename which does not exist.

-[ `int fprintf(FILE \*stream, const char \*format, ...)`](https://www.tutorialspoint.com/c_standard_library/c_function_fprintf.htm) - Sends formatted output to a stream.

-[ `int printf(const char \*format, ...)`](https://www.tutorialspoint.com/c_standard_library/c_function_printf.htm) - Sends formatted output to stdout.

-[ `int sprintf(char \*str, const char \*format, ...)`](https://www.tutorialspoint.com/c_standard_library/c_function_sprintf.htm) - Sends formatted output to a string.

-[ `int vfprintf(FILE \*stream, const char \*format, va_list arg)`](https://www.tutorialspoint.com/c_standard_library/c_function_vfprintf.htm) - Sends formatted output to a stream using an argument list.

-[ `int vprintf(const char \*format, va_list arg)`](https://www.tutorialspoint.com/c_standard_library/c_function_vprintf.htm) - Sends formatted output to stdout using an argument list.

-[ `int vsprintf(char \*str, const char \*format, va_list arg)`](https://www.tutorialspoint.com/c_standard_library/c_function_vsprintf.htm) - Sends formatted output to a string using an argument list.

-[ `int fscanf(FILE \*stream, const char \*format, ...)`](https://www.tutorialspoint.com/c_standard_library/c_function_fscanf.htm) - Reads formatted input from a stream.

-[ `int scanf(const char \*format, ...)`](https://www.tutorialspoint.com/c_standard_library/c_function_scanf.htm) - Reads formatted input from stdin.

-[ `int sscanf(const char \*str, const char \*format, ...)`](https://www.tutorialspoint.com/c_standard_library/c_function_sscanf.htm) - Reads formatted input from a string.

-[ `int fgetc(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fgetc.htm) - Gets the next character (an unsigned char) from the specified stream and advances the position indicator for the stream.

-[ `char \*fgets(char \*str, int n, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fgets.htm) - Reads a line from the specified stream and stores it into the string pointed to by str. It stops when either (n-1) characters are read, the newline character is read, or the end-of-file is reached, whichever comes first.

-[ `int fputc(int char, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fputc.htm) - Writes a character (an unsigned char) specified by the argument char to the specified stream and advances the position indicator for the stream.

-[ `int fputs(const char \*str, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_fputs.htm) - Writes a string to the specified stream up to but not including the null character.

-[ `int getc(FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_getc.htm) - Gets the next character (an unsigned char) from the specified stream and advances the position indicator for the stream.

-[ `int getchar(void)`](https://www.tutorialspoint.com/c_standard_library/c_function_getchar.htm) - Gets a character (an unsigned char) from stdin.

-[ `char \*gets(char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_gets.htm) - Reads a line from stdin and stores it into the string pointed to by, str. It stops when either the newline character is read or when the end-of-file is reached, whichever comes first.

-[ `int putc(int char, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_putc.htm) - Writes a character (an unsigned char) specified by the argument char to the specified stream and advances the position indicator for the stream.

-[ `int putchar(int char)`](https://www.tutorialspoint.com/c_standard_library/c_function_putchar.htm) - Writes a character (an unsigned char) specified by the argument char to stdout.

-[ `int puts(const char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_puts.htm) - Writes a string to stdout up to but not including the null character. A newline character is appended to the output.

-[ `int ungetc(int char, FILE \*stream)`](https://www.tutorialspoint.com/c_standard_library/c_function_ungetc.htm) - Pushes the character char (an unsigned char) onto the specified stream so that the next character is read.

-[ `void perror(const char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_perror.htm) - Prints a descriptive error message to stderr. First the string str is printed followed by a colon and then a space.

_______
______
## _stdlib_ <stdlib.h> <cstdlib>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **stdlib.h** header defines four variable types, several macros, and various functions for performing general functions.

### Library Variables

Following are the variable types defined in the header stdlib.h −

Variable & Description

 ==**size_t**== -  This is the unsigned integral type and is the result of the **sizeof** keyword.
 ==**wchar_t**== -  This is an integer type of the size of a **wide** character constant.
 ==**div_t**== -  This is the structure returned by the **div** function.
 ==**ldiv_t**== -  This is the structure returned by the **ldiv** function.
### Library Macros

Following are the macros defined in the header stdlib.h −

Macro & Description

 ==**NULL**== -  This macro is the value of a null pointer constant.
 ==**EXIT_FAILURE**== -  This is the value for the exit function to return in case of failure.
 ==**EXIT_SUCCESS**== -  This is the value for the exit function to return in case of success.
 ==**RAND_MAX**== -  This macro is the maximum value returned by the rand function.
 ==**MB_CUR_MAX**== -  This macro is the maximum number of bytes in a multi-byte character set which cannot be larger than MB_LEN_MAX.
### Library Functions

Following are the functions defined in the header stlib.h −

Function & Description

-[ `double atof(const char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_atof.htm) - Converts the string pointed to, by the argument _str_ to a floating-point number (type double).

-[ `int atoi(const char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_atoi.htm) - Converts the string pointed to, by the argument _str_ to an integer (type int).

-[ `long int atol(const char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_atol.htm) - Converts the string pointed to, by the argument _str_ to a long integer (type long int).

-[ `double strtod(const char \*str, char \*\*endptr)`](https://www.tutorialspoint.com/c_standard_library/c_function_strtod.htm) - Converts the string pointed to, by the argument _str_ to a floating-point number (type double).

-[ `long int strtol(const char \*str, char \*\*endptr, int base)`](https://www.tutorialspoint.com/c_standard_library/c_function_strtol.htm) - Converts the string pointed to, by the argument _str_ to a long integer (type long int).

-[ `unsigned long int strtoul(const char \*str, char \*\*endptr, int base)`](https://www.tutorialspoint.com/c_standard_library/c_function_strtoul.htm) - Converts the string pointed to, by the argument _str_ to an unsigned long integer (type unsigned long int).

-[ `void \*calloc(size_t nitems, size_t size)`](https://www.tutorialspoint.com/c_standard_library/c_function_calloc.htm) - Allocates the requested memory and returns a pointer to it.

-[ `void free(void \*ptr`](https://www.tutorialspoint.com/c_standard_library/c_function_free.htm) - Deallocates the memory previously allocated by a call to _calloc, malloc,_ or _realloc_.

-[ `void \*malloc(size_t size)`](https://www.tutorialspoint.com/c_standard_library/c_function_malloc.htm) - Allocates the requested memory and returns a pointer to it.

-[ `void \*realloc(void \*ptr, size_t size)`](https://www.tutorialspoint.com/c_standard_library/c_function_realloc.htm) - Attempts to resize the memory block pointed to by ptr that was previously allocated with a call to _malloc_ or _calloc_.

-[ `void abort(void)`](https://www.tutorialspoint.com/c_standard_library/c_function_abort.htm) - Causes an abnormal program termination.

-[ `int atexit(void (\*func)(void))`](https://www.tutorialspoint.com/c_standard_library/c_function_atexit.htm) - Causes the specified function **func** to be called when the program terminates normally.

-[ `void exit(int status)`](https://www.tutorialspoint.com/c_standard_library/c_function_exit.htm) - Causes the program to terminate normally.

-[ `char \*getenv(const char \*name)`](https://www.tutorialspoint.com/c_standard_library/c_function_getenv.htm) - Searches for the environment string pointed to by name and returns the associated value to the string.

-[ `int system(const char \*string)`](https://www.tutorialspoint.com/c_standard_library/c_function_system.htm) - The command specified by string is passed to the host environment to be executed by the command processor.

-[ `void \*bsearch(const void \*key, const void \*base, size_t nitems, size_t size, int (\*compar)(const void \*, const void \*))`](https://www.tutorialspoint.com/c_standard_library/c_function_bsearch.htm) - Performs a binary search.

-[ `void qsort(void \*base, size_t nitems, size_t size, int (\*compar)(const void \*, const void\*))`](https://www.tutorialspoint.com/c_standard_library/c_function_qsort.htm) - Sorts an array.

-[ `int abs(int x)`](https://www.tutorialspoint.com/c_standard_library/c_function_abs.htm) - Returns the absolute value of x.

-[ `div_t div(int numer, int denom)`](https://www.tutorialspoint.com/c_standard_library/c_function_div.htm) - Divides numer (numerator) by denom (denominator).

-[ `long int labs(long int x)`](https://www.tutorialspoint.com/c_standard_library/c_function_labs.htm) - Returns the absolute value of x.

-[ `ldiv_t ldiv(long int numer, long int denom)`](https://www.tutorialspoint.com/c_standard_library/c_function_ldiv.htm) - Divides numer (numerator) by denom (denominator).

-[ `int rand(void)`](https://www.tutorialspoint.com/c_standard_library/c_function_rand.htm) - Returns a pseudo-random number in the range of 0 to _RAND_MAX_.

-[ `void srand(unsigned int seed)`](https://www.tutorialspoint.com/c_standard_library/c_function_srand.htm) - This function seeds the random number generator used by the function **rand**.

-[ `int mblen(const char \*str, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_mblen.htm) - Returns the length of a multibyte character pointed to by the argument _str_.

-[ `size_t mbstowcs(schar_t \*pwcs, const char \*str, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_mbstowcs.htm) - Converts the string of multibyte characters pointed to by the argument _str_ to the array pointed to by _pwcs_.

-[ `int mbtowc(whcar_t \*pwc, const char \*str, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_mbtowc.htm) - Examines the multibyte character pointed to by the argument _str_.

-[ `size_t wcstombs(char \*str, const wchar_t \*pwcs, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_wcstombs.htm) - Converts the codes stored in the array _pwcs_ to multibyte characters and stores them in the string _str_.

-[ `int wctomb(char \*str, wchar_t wchar)`](https://www.tutorialspoint.com/c_standard_library/c_function_wctomb.htm) - Examines the code which corresponds to a multibyte character given by the argument _wchar_.

_______
______
## _string_ <string.h> <cstring>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **string.h** header defines one variable type, one macro, and various functions for manipulating arrays of characters.

### Library Variables

Following is the variable type defined in the header string.h −

Variable & Description

 ==**size_t**== -  This is the unsigned integral type and is the result of the **sizeof** keyword.
### Library Macros

Following is the macro defined in the header string.h −

Macro & Description

 ==**NULL**== -  This macro is the value of a null pointer constant.
### Library Functions

Following are the functions defined in the header string.h −

Function & Description

-[ `void \*memchr(const void \*str, int c, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_memchr.htm) - Searches for the first occurrence of the character c (an unsigned char) in the first n bytes of the string pointed to, by the argument _str_.

-[ `int memcmp(const void \*str1, const void \*str2, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_memcmp.htm) - Compares the first n bytes of _str1_ and _str2_.

-[ `void \*memcpy(void \*dest, const void \*src, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_memcpy.htm) - Copies n characters from src to _dest_.

-[ `void \*memmove(void \*dest, const void \*src, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_memmove.htm) - Another function to copy n characters from _str2_ to _str1_.

-[ `void \*memset(void \*str, int c, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_memset.htm) - Copies the character c (an unsigned char) to the first n characters of the string pointed to, by the argument _str_.

-[ `char \*strcat(char \*dest, const char \*src)`](https://www.tutorialspoint.com/c_standard_library/c_function_strcat.htm) - Appends the string pointed to, by _src_ to the end of the string pointed to by _dest_.

-[ `char \*strncat(char \*dest, const char \*src, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_strncat.htm) - Appends the string pointed to, by _src_ to the end of the string pointed to, by _dest_ up to n characters long.

-[ `char \*strchr(const char \*str, int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_strchr.htm) - Searches for the first occurrence of the character c (an unsigned char) in the string pointed to, by the argument _str_.

-[ `int strcmp(const char \*str1, const char \*str2)`](https://www.tutorialspoint.com/c_standard_library/c_function_strcmp.htm) - Compares the string pointed to, by _str1_ to the string pointed to by _str2_.

-[ `int strncmp(const char \*str1, const char \*str2, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_strncmp.htm) - Compares at most the first n bytes of _str1_ and _str2_.

-[ `int strcoll(const char \*str1, const char \*str2)`](https://www.tutorialspoint.com/c_standard_library/c_function_strcoll.htm) - Compares string _str1_ to _str2_. The result is dependent on the LC_COLLATE setting of the location.

-[ `char \*strcpy(char \*dest, const char \*src)`](https://www.tutorialspoint.com/c_standard_library/c_function_strcpy.htm) - Copies the string pointed to, by _src_ to _dest_.

-[ `char \*strncpy(char \*dest, const char \*src, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_strncpy.htm) - Copies up to n characters from the string pointed to, by _src_ to _dest_.

-[ `size_t strcspn(const char \*str1, const char \*str2)`](https://www.tutorialspoint.com/c_standard_library/c_function_strcspn.htm) - Calculates the length of the initial segment of str1 which consists entirely of characters not in str2.

-[ `char \*strerror(int errnum)`](https://www.tutorialspoint.com/c_standard_library/c_function_strerror.htm) - Searches an internal array for the error number errnum and returns a pointer to an error message string.

-[ `size_t strlen(const char \*str)`](https://www.tutorialspoint.com/c_standard_library/c_function_strlen.htm) - Computes the length of the string str up to but not including the terminating null character.

-[ `char \*strpbrk(const char \*str1, const char \*str2)`](https://www.tutorialspoint.com/c_standard_library/c_function_strpbrk.htm) - Finds the first character in the string _str1_ that matches any character specified in _str2_.

-[ `char \*strrchr(const char \*str, int c)`](https://www.tutorialspoint.com/c_standard_library/c_function_strrchr.htm) - Searches for the last occurrence of the character c (an unsigned char) in the string pointed to by the argument _str_.

-[ `size_t strspn(const char \*str1, const char \*str2)`](https://www.tutorialspoint.com/c_standard_library/c_function_strspn.htm) - Calculates the length of the initial segment of _str1_ which consists entirely of characters in _str2_.

-[ `char \*strstr(const char \*haystack, const char \*needle)`](https://www.tutorialspoint.com/c_standard_library/c_function_strstr.htm) - Finds the first occurrence of the entire string _needle_ (not including the terminating null character) which appears in the string _haystack_.

-[ `char \*strtok(char \*str, const char \*delim)`](https://www.tutorialspoint.com/c_standard_library/c_function_strtok.htm) - Breaks string _str_ into a series of tokens separated by _delim_.

-[ `size_t strxfrm(char \*dest, const char \*src, size_t n)`](https://www.tutorialspoint.com/c_standard_library/c_function_strxfrm.htm) - Transforms the first **n** characters of the string **src** into current locale and places them in the string **dest**.

_______
______
## _time_ <time.h> <ctime>{style="background: -webkit-linear-gradient(60deg, #abf5a3, #0Fa4c3); border: inset; margin: 20px; color: black; font-weight: 900}
_______

The **time.h** header defines four variable types, two macro and various functions for manipulating date and time.

### Library Variables

Following are the variable types defined in the header time.h −

Variable & Description

 ==**size_t**== -  This is the unsigned integral type and is the result of the **sizeof** keyword.
 ==**clock_t**== -  This is a type suitable for storing the processor time.
 ==**time_t is**== -  This is a type suitable for storing the calendar time.
 ==**struct tm**== -  This is a structure used to hold the time and date.
The tm structure has the following definition −

```cpp
struct tm {
    int tm_sec; 	/* seconds,  range 0 to 59          */
 int tm_min; 	   /* minutes, range 0 to 59           */
 int tm_hour; 	   /* hours, range 0 to 23             */
 int tm_mday; 	   /* day of the month, range 1 to 31  */
 int tm_mon;   	/* month, range 0 to 11             */
 int tm_year;  	/* The number of years since 1900   */
 int tm_wday; 	   /* day of the week, range 0 to 6    */
 int tm_yday;   	/* day in the year, range 0 to 365  */
 int tm_isdst; 	/* daylight saving time             */
 };
```
### Library Macros

Following are the macros defined in the header time.h −

Macro & Description

 ==**NULL**== -  This macro is the value of a null pointer constant.
 ==**CLOCKS_PER_SEC**== -  This macro represents the number of processor clocks per second.
### Library Functions

Following are the functions defined in the header time.h −

Function & Description

-[ `char \*asctime(const struct tm \*timeptr)`](https://www.tutorialspoint.com/c_standard_library/c_function_asctime.htm) - Returns a pointer to a string which represents the day and time of the structure timeptr.

-[ `clock_t clock(void)`](https://www.tutorialspoint.com/c_standard_library/c_function_clock.htm) - Returns the processor clock time used since the beginning of an implementation defined era (normally the beginning of the program).

-[ `char \*ctime(const time_t \*timer)`](https://www.tutorialspoint.com/c_standard_library/c_function_ctime.htm) - Returns a string representing the localtime based on the argument timer.

-[ `double difftime(time_t time1, time_t time2)`](https://www.tutorialspoint.com/c_standard_library/c_function_difftime.htm) - Returns the difference of seconds between time1 and time2 (time1-time2).

-[ `struct tm \*gmtime(const time_t \*timer)`](https://www.tutorialspoint.com/c_standard_library/c_function_gmtime.htm) - The value of timer is broken up into the structure tm and expressed in Coordinated Universal Time (UTC) also known as Greenwich Mean Time (GMT).

-[ `struct tm \*localtime(const time_t \*timer)`](https://www.tutorialspoint.com/c_standard_library/c_function_localtime.htm) - The value of timer is broken up into the structure tm and expressed in the local time zone.

-[ `time_t mktime(struct tm \*timeptr)`](https://www.tutorialspoint.com/c_standard_library/c_function_mktime.htm) - Converts the structure pointed to by timeptr into a time_t value according to the local time zone.

-[ `size_t strftime(char \*str, size_t maxsize, const char \*format, const struct tm \*timeptr)`](https://www.tutorialspoint.com/c_standard_library/c_function_strftime.htm) - Formats the time represented in the structure timeptr according to the formatting rules defined in format and stored into str.

-[ `time_t time(time_t \*timer)`](https://www.tutorialspoint.com/c_standard_library/c_function_time.htm) - Calculates the current calender time and encodes it into time_t format.

[Previous Page](https://www.tutorialspoint.com/c_standard_library/time_h.htm) [Print Page](javascript:printPage();)

[Next Page](https://www.tutorialspoint.com/c_standard_library/c_standard_library_useful_resources.htm)

Advertisements

var adPos = document.getElementById('adp_bottom_ads'); var mobile_ad_id = "a8a632a6-046e-4f5c-b25f-8bc82ac89fb2"; var desktop_ad_id = "e7ddd6f7-1ab0-494a-bade-887daa4373a0"; var adpushup = adpushup || {}; adpushup.que = adpushup.que || \[\]; adpushup.que.push(function() { var ad_id = window.innerWidth <= 768 ? mobile_ad_id : desktop_ad_id; adPos.innerHTML = '<div id="' + ad_id + '" class="_ap_apex_ad"></div>'; adpushup.triggerAd(ad_id); });

-   [Print](javascript:printPage(); "Print this page")
-    [Add Notes](javascript:void(0) "Add Custom Notes")
-    [Bookmark this page](javascript:void(0) "Add Bookmark")
-    [Report Error](javascript:void(0); "Report Error")
-    [Suggestions](javascript:void(0); "Give Suggestions")


[Save](javascript:void(0);) [Close](javascript:void(0);)

[Dashboard](https://www.tutorialspoint.com/videotutorials/dashboard.php) [Logout](https://www.tutorialspoint.com/videotutorials/userlogout.php)

var adpushup = adpushup || {}; adpushup.que = adpushup.que || \[\]; adpushup.que.push(function() { adpushup.triggerAd("f0f6cff6-393d-4170-b63a-d9ff06ca9f25"); });

var adpushup = adpushup || {}; adpushup.que = adpushup.que || \[\]; adpushup.que.push(function() { adpushup.triggerAd("5c0affd5-724a-475c-bfcd-cecbc7660c36"); });

var adpushup = adpushup || {}; adpushup.que = adpushup.que || \[\]; adpushup.que.push(function() { adpushup.triggerAd("8f8814c2-d64c-4d26-9cb9-543653c0b48f"); });