# C# Notes

[[TOC]]

## Reference Sources

[CSharp Tour](https://docs.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/index)
[C# Reference](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/index)
[Example Source](https://www.youtube.com/redirect?q=http%3A%2F%2Fgoo.gl%2FXklWBR&redir_token=9pUlbHeA7psV7qzMQz_io1UDYMZ8MTU1MzQ4ODk4MUAxNTUzNDAyNTgx&event=video_description&v=lisiwUZJXqQ)
[YouTube Video- C# Tutorial Overview](https://www.youtube.com/watch?v=lisiwUZJXqQ&t=1358s)

## Syntax

A basic hello world program.  Very similar to java.

```C#
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace HelloWorld
{
    class Program
    {
        static void Main(string[] args)
        {
            // The code provided will print ‘Hello World’ to the console.
            // Press Ctrl+F5 (or go to Debug > Start Without Debugging) to run your app.
            Console.WriteLine("Hello World!");
            Console.ReadKey();

            // Go to http://aka.ms/dotnet-get-started-console to continue learning how to build a console app!
        }
    }
}
```

A Stack program in C#

The fully qualified name of the class is Acme.Collections.Stack

!!!note Class Stack, stored in a file 'acme.cs' in this case.

```C#
using System;
namespace Acme.Collections
{
    public class Stack
    {
        Node top;
        public void Push(object data)
        {
            top = new Node(top, data);
        }

        public object Pop() //pop function
        {
            if (top == null)
            {
                throw new InvalidOperationException();
            }
            object result = top.data;
            top = top.next;
            return result;
        }

        class Node  //inner class Node
        {
            public Node next;
            public object data;
            public Node(Node next, object data)
            {
                this.next = next;
                this.data = data;
            }
        }
    }
}
```

### Compiling

Compiling the above- with the command

!!!example csc /t -library acme.cs

would produce acme.dll a linked library.  Then to utilize this library, you just need to reference it by saying `using Acme.Collections`

```C#
using System;
using Acme.Collections;  //here
class Example
{
    static void Main()
    {
        Stack s = new Stack();
        s.Push(1);
        s.Push(10);
        s.Push(100);
        Console.WriteLine(s.Pop());
        Console.WriteLine(s.Pop());
        Console.WriteLine(s.Pop());
    }
}
```
Then to compile this, we have to reference the .dll file with the `/r` option.  Like this -

!!!example csc /r -acme.dll example.cs

This creates **example.exe.**

From the page -

    When a multi-file C# program is compiled, all of the source files are processed together, and the source files can freely reference each other—conceptually, it is as if all the source files were concatenated into one large file before being processed. Forward declarations are never needed in C# because, with very few exceptions, declaration order is insignificant. C# does not limit a source file to declaring only one public type nor does it require the name of the source file to match a type declared in the source file.

### Keywords


[Keyword Reference](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/index)

|C# Keywords|              |           |           |
| --------- | ------------ | --------- | --------- |
| abstract  | as           | base      | bool      |
| break     | byte         | case      | catch     |
| char      | checked      | class     | const     |
| continue  | decimal      | default   | delegate  |
| do        | double       | else      | enum      |
| event     | explicit     | extern    | false     |
| finally   | fixed        | float     | for       |
| foreach   | goto         | if        | implicit  |
| in        | int          | interface | internal  |
| is        | lock         | long      | namespace |
| new       | null         | object    | operator  |
| out       | override     | params    | private   |
| protected | public       | readonly  | ref       |
| return    | sbyte        | sealed    | short     |
| sizeof    | stackalloc   | static    | string    |
| struct    | switch       | this      | throw     |
| true      | try          | typeof    | uint      |
| ulong     | unchecked    | unsafe    | ushort    |
| using     | using static | virtual   | void      |
| volatile  | while        |           |           |


|Contextual Keywords              | | |
| ------------------------------- | -------------------- | ----------------------- |
| add                             | alias                | ascending               |
| async                           | await                | by                      |
| descending                      | dynamic              | equals                  |
| from                            | get                  | global                  |
| group                           | into                 | join                    |
| let                             | nameof               | on                      |
| orderby                         | partial (type)       | partial (method)        |
| remove                          | select               | set                     |
| value                           | var                  | when (filter condition) |
| where (generic type constraint) | where (query clause) | yield                   |


## Types

[Reference Tables for Types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/reference-tables-for-types)
[Types](https://docs.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/types-and-variables)

- Value types
  - Simple Types
    - **Signed** integral -
      - ``sbyte`` - 8 bits, range from -128 to 127
      - ``short`` - 16 bits, range from -32,768 to 32,767
      - ``int` ` - 32 bits, range from -2,147,483,648 to 2,147,483,647
      - ``long` ` - 64 bits, range from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
    - **Unsigned** integral -
      - ``byte` ` - 8 bits, range from 0 to 255
      - ``ushort` ` - 16 bits, range from 0 to 65,535
      - ``uint` ` - 32 bits, range from 0 to 4,294,967,295
      - ``ulong` ` - 64 bits, range from 0 to 18,446,744,073,709,551,615
  - Unicode **characters -**
    - `char`
  - IEEE floating point -
    - ``float` ` - 32 bits, range from 1.5 × 10-45 to 3.4 × 1038, 7-digit precision
    - ``double` ` - 64 bits, range from 5.0 × 10-324 to 1.7 × 10308, 15-digit precision
  - High-precision **decimal -**
    - ``decimal` ` - 128 bits, range is at least -7.9 × 10-28 to 7.9 × 1028, with at least 28-digit precision
  - **Boolean -**
    - `bool`
  - **Enum** types
    - User-defined types of the form `enum E {...}`
  - **Struct** types
    - User-defined types of the form `struct S {...}`
  - **Nullable** value types
    - Extensions of all other value types with a `null` value
  - Reference types
  - **Class** types
  - Ultimate base class of all other types -
    - `object`
  - Unicode strings -
    - `string`
  - User-defined types of the form `class C {...}`
  - **Interface** types
    - User-defined types of the form `interface I {...}`
  - Array types
    - Single- and multi-dimensional, for example, `int[]` and `int[,]`
  - Delegate types
    - User-defined types of the form delegate `int D(...)`

A `class` type defines a data structure that contains data members (fields) and function members (methods, properties, and others). Class types support single inheritance and polymorphism, mechanisms whereby derived classes can extend and specialize base classes.

A `struct` type is similar to a class type in that it represents a structure with data members and function members. However, unlike classes, structs are value types and do not typically require heap allocation. Struct types do not support user-specified inheritance, and all struct types implicitly inherit from type `object`.

An `interface` type defines a contract as a named set of public function members. A `class` or `struct` that implements an `interface` must provide implementations of the interface’s function members. An `interface` may inherit from multiple base interfaces, and a `class` or `struct` may implement multiple interfaces.

A `delegate` type represents references to methods with a particular parameter list and return type. Delegates make it possible to treat methods as entities that can be assigned to variables and passed as parameters. Delegates are analogous to function types provided by functional languages. They are also similar to the concept of function pointers found in some other languages, but unlike function pointers, delegates are object-oriented and type-safe.

The `class`, `struct`, `interface` and `delegate` types all support `generics`, whereby they can be parameterized with other types.

An `enum` type is a distinct type with named constants. Every `enum` type has an underlying type, which must be one of the eight integral types. The set of values of an `enum` type is the same as the set of values of the underlying type.

C# supports single- and multi-dimensional arrays of any type. Unlike the types listed above, array types do not have to be declared before they can be used. Instead, array types are constructed by following a type name with square brackets. For example, `int[]` is a single-dimensional array of `int`, `int[,]` is a two-dimensional array of int, and `int[][]` is a single-dimensional array of single-dimensional array of int.

`Nullable value` types also do not have to be declared before they can be used. For each non-nullable value type T there is a corresponding nullable value type T?, which can hold an additional value, null. For instance, int? is a type that can hold any 32-bit integer or the value null.

C#’s type system is unified such that a value of any type can be treated as an object. Every type in C# directly or indirectly derives from the object class type, and object is the ultimate base class of all types. Values of reference types are treated as objects simply by viewing the values as type object. Values of value types are treated as objects by performing boxing and unboxing operations. In the following example, an int value is converted to object and back again to int.

### Default Values


| Value type | Default value |
| ---------- | ------------- |
| bool       | false         |
| byte       | 0             |
| char       | '\\0'         |
| decimal    | 0M            |
| double     | 0.0D          |
| enum       | *See Note     |
| float      | 0.0F          |
| int        | 0             |
| long       | 0L            |
| sbyte      | 0             |
| short      | 0             |
| struct     | **See Note    |
| uint       | 0             |
| ulong      | 0             |
| ushort     | 0             |

*(The value produced by the expression (E)0, where E is the enum identifier.)

**(The value produced by setting all value-type fields to their default values and all reference-type fields to null.)

### Expressions


[Operator Reference](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/)

- Primary
  - `x.m` - Member access
  - `x(...)` - Method and delegate invocation
  - `x[...]` - Array and indexer access
  - `x++` - Post-increment
  - `x--` - Post-decrement
  - `new T(...)` - Object and delegate creation
  - `new T(...){...}` - Object creation with initializer
  - `new {...}` - Anonymous object initializer
  - `new T[...]` - Array creation
  - `typeof(T)` - Obtain Type object for T
  - `checked(x)` - Evaluate expression in checked context
  - `unchecked(x)` - Evaluate expression in unchecked context
  - `default(T)` - Obtain default value of type T
  - `delegate {...}` - Anonymous function (anonymous method)
- Unary
  - `+x` - Identity
  - `-x` - Negation
  - `!x` - Logical negation
  - `~x` - Bitwise negation
  - `++x` - Pre-increment
  - `--x` - Pre-decrement
  - `x++` - Post-increment
  - `x--` - Post-decrement
  - `(T)x` - Explicitly convert x to type T
  - `await x` - Asynchronously wait for x to complete
  - Multiplicative
  - `x * y` - Multiplication
  - `x / y` - Division
  - `x % y` - Remainder
- Additive
  - `x + y` - Addition, string concatenation, delegate combination
  - `x – y` - Subtraction, delegate removal
- Shift
  - `x << y` - Shift left
  - `x >> y` - Shift right
- Relational and type testing
  - `x < y` - Less than
  - `x > y` - Greater than
  - `x <= y` - Less than or equal
  - `x >= y` - Greater than or equal
  - `x is T` - Return true if x is a T, false otherwise
  - `x as T` - Return x typed as T, or null if x is not a T
- Equality
  - `x == y` - Equal
  - `x != y` - Not equal
  - Logical AND
    - `x & y` - Integer bitwise AND, boolean logical AND
  - Logical XOR
    - `x ^ y` - Integer bitwise XOR, boolean logical XOR
  - Logical OR
    - `x | y` - Integer bitwise OR, boolean logical OR
  - Conditional AND
    - `x && y` - Evaluates y only if x is not false
  - Conditional OR
    - `x || y` - Evaluates y only if x is not true
  - Null coalescing
    - `x ?? y` - Evaluates to y if x is null, to x otherwise
  - Conditional
    - `x ? y ` - z - Evaluates y if x is true, z if x is false
- Assignment or anonymous function
  - `x = y` - Assignment
  - `x op= y` - Compound assignment; supported operators are
  - `*=` `/=` `%=` `+=` `-=` `<<=` `>>=` `&=` `^=` `|=`
  - `(T x) => y` - Anonymous function (lambda expression)

#### Assignment and Lambda Operators

Assignment and Lambda operators
These operators have higher precedence than the next section and lower precedence than the previous section.

`x = y` – **assignment.**

`x += y` – **increment.** Add the value of y to the value of x, store the result in x, and return the new value. If x designates an event, then y must be an appropriate function that C# adds as an event handler.

`x -= y` – **decrement.** Subtract the value of y from the value of x, store the result in x, and return the new value. If x designates an event, then y must be an appropriate function that C# removes as an event handler

`x *= y` – **multiplication** assignment. Multiply the value of y to the value of x, store the result in x, and return the new value.

`x /= y` – **division** assignment. Divide the value of x by the value of y, store the result in x, and return the new value.

`x %= y` – **remainder** assignment. Divide the value of x by the value of y, store the remainder in x, and return the new value.

`x &= y` – **AND assignment.** `AND` the value of y with the value of x, store the result in x, and return the new value.

`x |= y` – **OR assignment.** OR the value of y with the value of x, store the result in x, and return the new value.

`x ^= y` – **XOR assignment.** XOR the value of y with the value of x, store the result in x, and return the new value.

`x <<= y` – **left-shift assignment.** Shift the value of x left by y places, store the result in x, and return the new value.

`x >>= y` – **right-shift assignment.** Shift the value of x right by y places, store the result in x, and return the new value.

`=>` – **lambda declaration.**

### Casting

Happens automatically from less precise to more precise (e.g. int -> float). With a loss of precision has to be cast.

```C#
float f = 3.14;
int n = (int)f;

//to string
var s = o as string;
if(s != null){
}

//can become"
if(o is string s)
{
}

```

### Reference Types

[Reference Links](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/reference-types)

- The following keywords are used to declare reference types:
  - `class`
  - `interface`
  - `delegate`
- C# also provides the following built-in reference types:
  - `dynamic`
  - `object`
  - `string`


## Conditionals

if statements are also like java

```C#

// Use using to declare namespaces and functions we wish to use
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AnimalNS;

/*
Multiline Comment
*/

// Delegates are used to pass methods as arguments to other methods
// A delegate can represent a method with a similar return type and attribute list
delegate double GetSum(double num1, double num2);

// ---------- ENUMS ----------
// Enums are unique types with symbolic names and associated values

public enum Temperature
{
    Freeze,
    Low,
    Warm,
    Boil
}

// ---------- STRUCT ----------
// A struct is a custom type that holds data made up from different data types
struct Customers
{
    private string name;
    private double balance;
    private int id;

    public void createCust(string n, double b, int i)
    {
        name = n;
        balance = b;
        id = i;
    }

    public void showCust()
    {
        Console.WriteLine("Name  - " + name);
        Console.WriteLine("Balance  - " + balance);
        Console.WriteLine("ID  - " + id);
    }
}

// Give our code a custom namespace
namespace ConsoleApplication1
{
    class Program
    {
        // Code in the main function is executed
        static void Main(string[] args)
        {
            // Prints string out to the console with a line break (Write = No Line Break)
            Console.WriteLine("What is your name  - ");

            // Accept input from the user
            string name = Console.ReadLine();

            // You can combine Strings with +
            Console.WriteLine("Hello " + name);

            // ---------- DATA TYPES ----------

            // Booleans are true or false
            bool canVote = true;

            // Characters are single 16 bit unicode characters
            char grade = 'A';

            // Integer with a max number of 2,147,483,647
            int maxInt = int.MaxValue;

            // Long with a max number of 9,223,372,036,854,775,807
            long maxLong = long.MaxValue;

            // Decimal has a maximum value of 79,228,162,514,264,337,593,543,950,335
            // If you need something bigger look up BigInteger
            decimal maxDec = decimal.MaxValue;

            // A float is a 32 bit number with a maxValue of 3.402823E+38 with 7 decimals of precision
            float maxFloat = float.MaxValue;

            // A float is a 32 bit number with a maxValue of 1.797693134E+308 with 15 decimals of precision
            double maxDouble = double.MaxValue;

            // You can combine strings with other values with +
            Console.WriteLine("Max Int  - " + maxDouble);

            // The dynamic data type is defined at run time
            dynamic otherName = "Paul";
            otherName = 1;

            // The var data type is defined when compiled and then can't change
            var anotherName = "Tom";
            // ERROR  - anotherName = 2;
            Console.WriteLine("Hello " + anotherName);

            // How to get the type and how to format strings
            Console.WriteLine("anotherName is a {0}", anotherName.GetTypeCode());

            // ---------- MATH ----------

            Console.WriteLine("5 + 3 = " + (5 + 3));
            Console.WriteLine("5 - 3 = " + (5 - 3));
            Console.WriteLine("5 * 3 = " + (5 * 3));
            Console.WriteLine("5 / 3 = " + (5 / 3));
            Console.WriteLine("5.2 % 3 = " + (5.2 % 3));

            int i = 0;

            Console.WriteLine("i++ = " + (i++));
            Console.WriteLine("++i = " + (++i));
            Console.WriteLine("i-- = " + (i--));
            Console.WriteLine("--i = " + (--i));

            Console.WriteLine("i += 3 " + (i += 3));
            Console.WriteLine("i -= 2 " + (i -= 2));
            Console.WriteLine("i *= 2 " + (i *= 2));
            Console.WriteLine("i /= 2 " + (i /= 2));
            Console.WriteLine("i %= 2 " + (i %= 2));

            // Casting  - If no magnitude is lost casting happens automatically, but otherwise it must be done
            // like this

            double pi = 3.14;
            int intPi = (int)pi; // put the data type to convert to between braces

            // Math Functions
            // Acos, Asin, Atan, Atan2, Cos, Cosh, Exp, Log, Sin, Sinh, Tan, Tanh
            double number1 = 10.5;
            double number2 = 15;

            Console.WriteLine("Math.Abs(number1) " + (Math.Abs(number1)));
            Console.WriteLine("Math.Ceiling(number1) " + (Math.Ceiling(number1)));
            Console.WriteLine("Math.Floor(number1) " + (Math.Floor(number1)));
            Console.WriteLine("Math.Max(number1, number2) " + (Math.Max(number1, number2)));
            Console.WriteLine("Math.Min(number1, number2) " + (Math.Min(number1, number2)));
            Console.WriteLine("Math.Pow(number1, 2) " + (Math.Pow(number1, 2)));
            Console.WriteLine("Math.Round(number1) " + (Math.Round(number1)));
            Console.WriteLine("Math.Sqrt(number1) " + (Math.Sqrt(number1)));

            // Random Numbers
            Random rand = new Random();
            Console.WriteLine("Random Number Between 1 and 10 " + (rand.Next(1,11)));


```
## Conditionals

```c#
            // Relational Operators  - > < >= <= == !=
            // Logical Operators  - && || ^ !

            // If Statement
            int age = 17;

            if ((age >= 5) && (age <= 7)) {
                Console.WriteLine("Go to elementary school");
            }
            else if ((age > 7) && (age < 13)) {
                Console.WriteLine("Go to middle school");
            }
            else {
                Console.WriteLine("Go to high school");
            }

            if ((age < 14) || (age > 67)) {
                Console.WriteLine("You shouldn't work");
            }

            Console.WriteLine("! true = " + (! true));

            // Ternary Operator

            bool canDrive = age >= 16 ? true  - false;

            // Switch is used when you have limited options
            // Fall through isn't allowed with C# unless there are no statements between cases
            // You can't check multiple values at once

            switch (age)
            {
                case 0 -
                    Console.WriteLine("Infant");
                    break;
                case 1 -
                case 2 -
                    Console.WriteLine("Toddler");

            // Goto can be used to jump to a label elsewhere in the code
                    goto Cute;
                default -
                    Console.WriteLine("Child");
                    break;
            }

            // Lable we can jump to with Goto
            Cute -
            Console.WriteLine("Toddlers are cute");

            // ---------- LOOPING ----------

            int i = 0;

            while (i < 10)
            {
                // If i = 7 then skip the rest of the code and start with i = 8
                if (i == 7)
                {
                    i++;
                    continue;
                }

                // Jump completely out of the loop if i = 9
                if (i == 9)
                {
                    break;
                }

                // You can't convert an int into a bool  - Print out only odds
                if ((i % 2) > 0)
                {
                    Console.WriteLine(i);
                }
                i++;
            }

            // The do while loop will go through the loop at least once
            string guess;
            do
            {
                Console.WriteLine("Guess a Number ");
                guess = Console.ReadLine();
            } while (! guess.Equals("15")); // How to check String equality

            // Puts all changes to the iterator in one place
            for(int j = 0; j < 10; j++)
            {
                if ((j % 2) > 0)
                {
                    Console.WriteLine(j);
                }
            }

            // foreach cycles through every item in an array or collection
            string randStr = "Here are some random characters";

            foreach( char c in randStr)
            {
                Console.WriteLine(c);
            }
```

## Strings

```c#


            // Escape Sequences  - \' \" \\ \b \n \t

            string sampString = "A bunch of random words";

            // Check if empty
            Console.WriteLine("Is empty " + String.IsNullOrEmpty(sampString));
            Console.WriteLine("Is empty " + String.IsNullOrWhiteSpace(sampString));
            Console.WriteLine("String Length " + sampString.Length);

            // Find a string index (Starts with 0)
            Console.WriteLine("Index of bunch " + sampString.IndexOf("bunch"));

            // Get a substring
            Console.WriteLine("2nd Word " + sampString.Substring(2, 6));

            string sampString2 = "More random words";

            // Are strings equal
            Console.WriteLine("Strings equal " + sampString.Equals(sampString2));

            // Compare strings
            Console.WriteLine("Starts with A bunch " + sampString.StartsWith("A bunch"));
            Console.WriteLine("Ends with words " + sampString.EndsWith("words"));

            // Trim white space at beginning and end or (TrimEnd / TrimStart)
            sampString = sampString.Trim();

            // Replace words or characters
            sampString = sampString.Replace("words", "characters");
            Console.WriteLine(sampString);

            // Remove starting at a defined index up to the second index
            sampString = sampString.Remove(0,2);
            Console.WriteLine(sampString);

            // Join values in array and save to string
            string[] names = new string[3] { "Matt", "Joe", "Paul" };
            Console.WriteLine("Name List " + String.Join(", ", names));

            // Formatting  - Currency, Decimal Places, Before Decimals, Thousands Separator
            string fmtStr = String.Format("{0 -c} {1 -00.00} {2 -#.00} {3 -0,0}", 1.56, 15.567, .56, 1000);

            Console.WriteLine(fmtStr.ToString());

```

### String Builder

```C#

            // Each time you create a string you actually create another string in memory
            // StringBuilders are used when you want to be able to edit a string without creating new ones

            StringBuilder sb = new StringBuilder();

            // Append a string to the StringBuilder (AppendLine also adds a newline at the end)
            sb.Append("This is the first sentence.");

            // Append a formatted string
            sb.AppendFormat("My name is {0} and I live in {1}", "Derek", "Pennsylvania");

            // Clear the StringBuilder
            // sb.Clear();

            // Replaces every instance of the first with the second
            sb.Replace("a", "e");

            // Remove characters starting at the index and then up to the defined index
            sb.Remove(5, 7);

            // Out put everything
            Console.WriteLine(sb.ToString());

```

## Arrays

```C#

            // Declare an array
            int[] randNumArray;

            // Declare the number of items an array can contain
            int[] randArray = new int[5];

            // Declare and initialize an array
            int[] randArray2 = { 1, 2, 3, 4, 5 };

            // Get array length
            Console.WriteLine("Array Length " + randArray2.Length);

            // Get item at index
            Console.WriteLine("Item 0 " + randArray2[0]);

            // Cycle through array
            for (int i = 0; i < randArray2.Length; i++)
            {
                Console.WriteLine("{0}  - {1}", i, randArray2[i]);
            }

            // Cycle with foreach
            foreach (int num in randArray2)
            {
                Console.WriteLine(num);
            }

            // Get the index of an item or -1
            Console.WriteLine("Where is 1 " + Array.IndexOf(randArray2, 1));

            string[] names = { "Tom", "Paul", "Sally" };

            // Join an array into a string
            string nameStr = string.Join(", ", names);
            Console.WriteLine(nameStr);

            // Split a string into an array
            string[] nameArray = nameStr.Split(',');

            // Create a multidimensional array
            int[,] multArray = new int[5, 3];

            // Create and initialize a multidimensional array
            int[,] multArray2 = { { 0, 1 }, { 2, 3 }, { 4, 5 } };

            // Cycle through multidimensional array
            foreach(int num in multArray2)
            {
                Console.WriteLine(num);
            }

            // Cycle and have access to indexes
            for (int x = 0; x < multArray2.GetLength(0); x += 1)
            {
                for (int y = 0; y < multArray2.GetLength(1); y += 1)
                {
                    Console.WriteLine("{0} | {1}  - {2}", x, y, multArray2[x, y]);
                }
            }

```

## Lists

```C#

            // A list unlike an array automatically resizes

            // Create a list and add values
            List<int> numList = new List<int>();
            numList.Add(5);
            numList.Add(15);
            numList.Add(25);

            // Add an array to a list
            int[] randArray = { 1, 2, 3, 4, 5 };
            numList.AddRange(randArray);

            // Clear a list
            // numList.Clear();

            // Copy an array into a List
            List<int> numList2 = new List<int>(randArray);

            // Create a List with array
            List<int> numList3 = new List<int>(new int[] { 1, 2, 3, 4 });

            // Insert in a specific index
            numList.Insert(1, 10);

            // Remove a specific value
            numList.Remove(5);

            // Remove at an index
            numList.RemoveAt(2);

            // Cycle through a List with foreach or
            for (int i = 0; i < numList.Count; i++)
            {
                Console.WriteLine(numList[i]);
            }

            // Return the index for a value or -1
            Console.WriteLine("4 is in index " + numList3.IndexOf(4));

            // Does the List contain a value
            Console.WriteLine("5 in list " + numList3.Contains(5));

            // Search for a value in a string List
            List<string> strList = new List<string>(new string[] { "Tom","Paul" });
            Console.WriteLine("Tom in list " + strList.Contains("tom", StringComparer.OrdinalIgnoreCase));

            // Sort the List
            strList.Sort();

```

## Error Handling

```C#

            // All the exceptions
            // msdn.microsoft.com/en-us/library/system.systemexception.aspx#inheritanceContinued

                try
                {
                    Console.Write("Divide 10 by ");
                    int num = int.Parse(Console.ReadLine());
                    Console.WriteLine("10 / {0} =  {1}", num, (10/num));

                }

                // Specifically catches the divide by zero exception
                catch (DivideByZeroException ex)
                {
                    Console.WriteLine("Can't divide by zero");

                    // Get additonal info on the exception
                    Console.WriteLine(ex.GetType().Name);
                    Console.WriteLine(ex.Message);

                    // Throw the exception to the next inline
                    // throw ex;

                    // Throw a specific exception
                    throw new InvalidOperationException("Operation Failed", ex);
                }

                // Catches any other exception
                catch (Exception ex)
                {
                    Console.WriteLine("An error occurred");
                    Console.WriteLine(ex.GetType().Name);
                    Console.WriteLine(ex.Message);
                }

```

## Classes and Objects

```C#


            Animal bulldog = new Animal(13, 50, "Spot", "Woof");

            Console.WriteLine("{0} says {1}", bulldog.name, bulldog.sound);

            // Console.WriteLine("No. of Animals " + Animal.getNumOfAnimals());
```

- `public` - Access not limited
- `protected` - Access limited to this class or classes derived from this class
- `internal` - Access limited to the current assembly (.exe, .dll, etc.)
- `protected internal` - Access limited to the containing class, classes derived from the containing class, or classes within the same assembly
- `private` - Access limited to this class
- `private protected` - Access limited to the containing class or classes derived from the containing type within the same assembly

```C#
using System.Collections.Generic
using System.Linq
using System.Text
using System.Threading.Tasks

namespace ConsoleApplication
{
    class Animal
    {
        public double height { get; set;} //getters and setters
        public double weight { get; set;}
        public double sound { get; set; }

        public string name;
        public string Name; //more complicated getter and setters.
        {
            get{return name;}
            set{name = value;} //important to use VALUE
        }

        public Animal() //constructor
        {
            this.height = 0;
            this.weight = 0;
            this.name = "";
            this.sound ="";
        }

        public Animal(double height, double weight, string name, string sound)
        {
            this.height = height;
            this.weight = weight;
            this.name = name;
            this.sound = sound;
        }

        //to get the count of the number of instances

        static int numOfAnimals = 0

        public static int getNumOfAnimals()
        {
            return numOfAnimals;
        }

        //method overloading
        public int getSum(int num1 = 1, int num2 = 1) //default valuess
        {
            return num1 + num2
        }
        //method overloading
        public double getSum(double num1 = 1, double num2 = 1) //default valuess
        {
            return num1 + num2
        }

        public string toString()
        {
            return String.Format("{0} is {1} inches tall, weighs {2} lbs and likes to say {3}", name, height, weight, sound);
        }
        static void Main(string[] args)
        {
            Animal spot = new Animal(15, 10, "Spot", "Woof");
            Console.WriteLine("{0} says {1}", spot.name, spot.sound);

            Console.WriteLine(spot.getSum(1.4, 2.7));
            Console.WriteLine(spot.getSum(num2: 1.4, num1: 2.7)); //args in the wrong order

            Animal grover = new Animal //another way to create objects in C#
            {

            }
        }
    }
}
```

Constructors can be shorthand


```C#
class Customer
{
    private int Age;
    public Customer(int age)
    {
        Age= age;
    }
}

//can become

class Customer
{
    private int Age;

    public Customer(int age) => Age = age;
}
```

as can getters and setters

```C#
class Customer
{
    private int Age;

    public int GetAge()
    {
        return this.Age;
    }
}

//can become

class Customer
{
    private int Age;

    public GetAge() => this.Age;
}

//or even shorter:
class Customer
{
    public string Name{get; set;} //automatically create getters and setters.
}


//another example
class Customer
{
    private int _age;
    public int Age {get {return _age;} }
}

//that can be shortend more
class Customer
{
    private int _age;
    public int Age => _age;
}

class Customer
{
    private int _age;
    public int Age
    {
        get { return _age;}
        set {_age = value; } //note the 'value'
    }
}
//becomes::
class Customer
{
    private int _age;
    public int Age
    {
        get => _age;
        set => _age = value; //note the 'value'
    }
}


//lists

class List<T>
{
    private T[] _values;
    public T this[int i ]{get {return _values[i];}}
}

//shortened:

class List<T>
{
    private T[] _values;
    public T this[int i] => _values[i];
}
```

### Enums

```C#


            Temperature micTemp = Temperature.Low;
            Console.Write("What Temp  - ");

            Console.ReadLine();

            switch (micTemp)
            {
                case Temperature.Freeze -
                    Console.WriteLine("Temp on Freezing");
                    break;

                case Temperature.Low -
                    Console.WriteLine("Temp on Low");
                    break;

                case Temperature.Warm -
                    Console.WriteLine("Temp on Warm");
                    break;

                case Temperature.Boil -
                    Console.WriteLine("Temp on Boil");
                    break;
            }

```

### Structs

```C#

            Customers bob = new Customers();

            bob.createCust("Bob", 15.50, 12345);

            bob.showCust();

            // ---------- ANONYMOUS METHODS ----------
            // An anonymous method has no name and its return type is defined by the return used in the method

            GetSum sum = delegate (double num1, double num2) {
                return num1 + num2;
            };

            Console.WriteLine("5 + 10 = " + sum(5, 10));

```

### Lambda

```C#

            // A lambda expression is used to act as an anonymous function or expression tree

            // You can assign the lambda expression to a function instance
            Func<int, int, int> getSum = (x, y) => x + y;
            Console.WriteLine("5 + 3 = " + getSum.Invoke(5, 3));

            // Get odd numbers from a list
            List<int> numList = new List<int> { 5, 10, 15, 20, 25 };

            // With an Expression Lambda the input goes in the left (n) and the statements go on the right
            List<int> oddNums = numList.Where(n => n % 2 == 1).ToList();

            foreach (int num in oddNums) {
                Console.Write(num + ", ");
            }

```

## File IO

```C#

            // The StreamReader and StreamWriter allows you to create text files while reading and
            // writing to them

            string[] custs = new string[] { "Tom", "Paul", "Greg" };

            using (StreamWriter sw = new StreamWriter("custs.txt"))
            {
                foreach(string cust in custs)
                {
                    sw.WriteLine(cust);
                }
            }

            string custName = "";
            using (StreamReader sr = new StreamReader("custs.txt"))
            {
                while ((custName = sr.ReadLine()) != null)
                {
                    Console.WriteLine(custName);
                }
            }

            Console.Write("Hit Enter to Exit");
            string exitApp = Console.ReadLine();

        }
    }
}
```


```C#
int fib(int n)
{
    return n <= 1 ? n : fib(n-1) + fib(n-2);
}

//over
Func<int, int> fib = null;
fib = (int n) =>
{
    return n <= 1 ? n :fib(n-1)+ fib(n-2);
}
```
