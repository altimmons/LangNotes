# Java Notes

- [Java Notes](#java-notes)
  - [Syntax](#syntax)
    - [Print](#print)
      - [Printf](#printf)
  - [Types](#types)
    - [Primitive types](#primitive-types)
    - [null](#null)
    - [Strings](#strings)
      - [Convert a String to Byte Array](#convert-a-string-to-byte-array)
    - [Arrays](#arrays)
    - [Getting Types](#getting-types)
    - [Generic Types](#generic-types)
  - [Classes and Methods](#classes-and-methods)
    - [Method main](#method-main)
    - [Access Control](#access-control)
      - [Static](#static)
        - [blocks](#blocks)
    - [modifiers](#modifiers)
    - [Constructors](#constructors)
    - [Subclass](#subclass)
      - [Writing](#writing)
        - [As Text](#as-text)
        - [AsBytes](#asbytes)
        - [PrintStream](#printstream)
      - [Reading](#reading)
        - [AsBytes](#asbytes-1)
    - [Logging](#logging)
  - [Exceptions](#exceptions)
    - [Class location](#class-location)
      - [Getting the method](#getting-the-method)
      - [Types and Causes](#types-and-causes)
        - [Full List of Exceptions (Alpha)](#full-list-of-exceptions-alpha)
        - [Runtime Exceptions](#runtime-exceptions)
        - [IOException](#ioexception)
        - [FileNotFoundException](#filenotfoundexception)
        - [SecurityException](#securityexception)
        - [NullPointerException](#nullpointerexception)
        - [IllegalArgumentException](#illegalargumentexception)
        - [ArithmeticException](#arithmeticexception)
        - [ClassNotFoundException](#classnotfoundexception)
        - [IndexOutofBounds](#indexoutofbounds)
        - [InputMismatchException](#inputmismatchexception)
      - [Handling:](#handling)
    - [System.getProperty](#systemgetproperty)
    - [Line Terminators](#line-terminators)
  - [Graphs](#graphs)
  - [Error Translation](#error-translation)
    - [Syntax error on 'class', @ expected](#syntax-error-on-class--expected)
  - [GUI](#gui)
    - [Text Based- LANTERNA](#text-based--lanterna)
    - [Swing](#swing)
  - [Etc.](#etc)
    - [JShell](#jshell)
      - [Editing](#editing)
    - [Console Colors:](#console-colors)
  - [Config IntelliJ](#config-intellij)
    - [Set Path Vars](#set-path-vars)


## Syntax

...
 https://www.geeksforgeeks.org/understanding-static-in-public-static-void-main-in-java/

Conventions-

Classes start with a capital letter. 

Object instances go onto the heap. References to objects go on the stack.`

[access] class{
    [access] [replication] [return_type] nameStartsWithLowerCase(Type Parameter, Type Parameter){

        return return_type
    }
}

### Print

[Reference](https://alvinalexander.com/programming/printf-format-cheat-sheet)

- System.out.print
- System.out.println
- System.out.printf
- System.setout(Outstream out)

```java
printf("the %s jumped over the %s, %d times", "cow", "moon", 2);
System.out.format("the %s jumped over the %s, %d times", "cow", "moon", 2);
System.err.format("the %s jumped over the %s, %d times", "cow", "moon", 2);
String result = String.format("the %s jumped over the %s, %d times", "cow", "moon", 2);
```

%c - character
%d - decimal (integer) number (base 10)
%e - exponential floating-point number
%f - floating-point number
%i - integer (base 10)
%o - octal number (base 8)
%s - a string of characters
%u - unsigned decimal (integer) number
%x - number in hexadecimal (base 16)
%% - print a percent sign
\% - print a percent sign

**Controlling integer width with printf**

The %3d specifier is used with integers, and means a minimum width of three spaces, which, by default, will be right-justified:

        printf("%3d", 0); - 0
        printf("%3d", 123456789); - 123456789
        printf("%3d", -10); - -10
        printf("%3d", -123456789);

#### Printf

[Source](https://www.cs.colostate.edu/~cs160/.Summer16/resources/Java_printf_method_quick_reference.pdf)

Composed of literals and format specifiers. Arguments are required only if there are format specifiers in the
format string. Format specifiers include: flags, width, precision, and conversion characters in the following
sequence:
% [flags] [width] [.precision] conversion-character ( square brackets denote optional parameters )

**Flags:**
- `-` : left-justify ( default is to right-justify )
- `+` : output a plus ( + ) or minus ( - ) sign for a numerical value
- `0` : forces numerical values to be zero-padded ( default is blank padding )
- `,` : comma grouping separator (for numbers > 1000)
- ` ` : space will display a minus sign if the number is negative or a space if it is positive

**Width:**
Specifies the field width for outputting the argument and represents the minimum number of characters to
be written to the output. Include space for expected commas and a decimal point in the determination of
the width for numerical values. 

**Precision:**
Used to restrict the output depending on the conversion. It specifies the number of digits of precision when
outputting floating-point values or the length of a substring to extract from a String. Numbers are rounded
to the specified precision.

**Conversion-Characters:**
- `d` : decimal integer [byte, short, int, long]
- `f` : floating-point number [float, double]
- `c` : character Capital C will uppercase the letter
- `s` : String Capital S will uppercase all the letters in the string
- `h` : hashcode A hashcode is like an address. This is useful for printing a reference
- `n` : newline Platform specific newline character- use %n instead of \n for greater compatibility

**Examples:**

```java
System.out.printf("Total is: $%,.2f%n", dblTotal);
System.out.printf("Total: %-10.2f: ", dblTotal);
System.out.printf("% 4d", intValue);
System.out.printf("%20.10s\n", stringVal);
String s = "Hello World";
System.out.printf("The String object %s is at hash code %h%n", s, s);
```

**String class format( ) method:** You can build a formatted String and assign it to a variable using the static format method in the String class.  The use of a format string and argument list is identical to its use in the printf method. The format method returns a reference to a String. Example: `String grandTotal = String.format("Grand Total: %,.2f", dblTotal);`


## Types

### Primitive types

|type|range|
|-|-|
`boolean` | true or false (!= 1 or 0 (not 1 or 0))
`byte` | -128 to 127
`short` | -32,768 to 32,767
`char` | Unicode character set (2 bytes- 65,000 values, hex x 4 [\uFFFF]*
`int` | -2,147,483,648 to 2,147,483,647
`long` | -9,223,372,036,854,775,808 through 9,223,372,036,854,775,807
`float` | Approx. +/- 10E-38 through +/- 10E38 with up to 6 dec. precision
`double` | Approx. +/- 10E-308 through +/- 10E308 with up to 15 dec. precisionaq

*ascii - is one byte per char (255)

Unicode - 2 bytes per character.
- 0-9 = 0030 -> 0039
- A-Z = 0041 -> 005A
- a-z = 0061 -> 007A
- tab = 0009
- lf = 000A
- return = 000D

Primitive type variables are declared.  Variables can contain letters, digits, underscore character, and $, and must start with a variable.

### null

Only object references can be null, not primitives. In Java, int is a primitive type and it is not considered an object. Only objects can have a null value. 

Use the object methods (int -> Integer)

### Strings

#### Convert a String to Byte Array
```java
    // Convert the string to a
    // byte array.
    String s = "Hello World! ";
    byte data[] = s.getBytes();
```

### Arrays

Array declarations are finicky.  Even base classes need to be instantiated. You declare an array with brackets after a type.

```Java
int[] intArray;  
>>> intArray[2]= 2; //error
intArray = new int[];  //intArray cant be assigned to until its instantiated.
int[] intArray = new int[]; //these two are equivalent essentially.
int[] a = new int[100]; //defines the size
```

There was something weird about 2D arrays, though I can't recall what it was.  I recall something about arrays moving strictly in a vectorized direction.  E.g you move along vector x, then y, then z.  But translating along z for instance is impossible.  I cant recall the details.

### Getting Types

With Objects you can use- `instanceOf

```java
System.out.println( args.getClass().getName() );//           [Ljava.lang.String;
System.out.println( args.getClass().toString() );        //  class [Ljava.lang.String;
System.out.println( args.getClass().getCanonicalName()); //  java.lang.String[]
System.out.println( args.getClass().getSimpleName());//      String[]
System.out.println( args.getClass().toGenericString());//    java.lang.String[]
System.out.println( file.getClass().getName() ); //          java.io.File
System.out.println( file.getClass().toString() );      //    class java.io.File
System.out.println( file.getClass().getCanonicalName()); //  java.io.File
System.out.println( file.getClass().getSimpleName()); //     File
System.out.println( file.getClass().toGenericString());//    public class java.io.File
System.out.println( s.getClass().getName() );  // java.lang.String
System.out.println( s.getClass().toString() ); //class java.lang.String
System.out.println( s.getClass().getCanonicalName()); //java.lang.String
System.out.println( s.getClass().getSimpleName()); //String
System.out.println( s.getClass().toGenericString()); //public final class java.lang.String
System.out.println( charset.getClass().getName() ); // sun.nio.cs.US_ASCII
System.out.println( charset.getClass().toString() ); //   class sun.nio.cs.US_ASCII
System.out.println( charset.getClass().getCanonicalName()); // sun.nio.cs.US_ASCII
System.out.println( charset.getClass().getSimpleName()); //  US_ASCII
System.out.println( charset.getClass().toGenericString()); //public class sun.nio.cs.US_ASCII
```

To account for primitives: Cast to an object

```java
   public String getType(T object){
      return ((Object) object).getClass().getSimpleName();
   }
//also
Integer.class.isInstance(20);  // true
Integer.class.isInstance(20f); // false
Integer.class.isInstance("s"); // false
```

### Generic Types

[Generic Source](http://www.angelikalanger.com/GenericsFAQ/FAQSections/ParameterizedTypes.html#FAQ001)

## Classes and Methods

### Method main

### Access Control

!!!tldr Class can be public (everywhere) or nothing(package private). Methods   

A method can be **public**, **private**, **package private**.

ccess level modifiers determine whether other classes can use a particular field or invoke a particular method. There are two levels of access control:

At the top level—`public`, or `package-private` (no explicit modifier).
At the member level—`public`, `private`, `protected`, or `package-private` (no explicit modifier).

A class may be declared with the modifier `public`, in which case that class is visible to all classes everywhere. If a class has no modifier (the default, also known as `package-private`), it is visible only within its own package (packages are named groups of related classes — you will learn about them in a later lesson.)

At the member level, you can also use the `public` modifier or no modifier (`package-private`) just as with top-level classes, and with the same meaning. For members, there are two additional access modifiers: `private` and `protected`. The `private` modifier specifies that the member can only be accessed in its own class. 

The _`protected`_ modifier specifies that the member can only be accessed within its own package (as with package-private) and, in addition, by a subclass of its class in another package.

[Source](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html)

**static** or *instance*

`public static void` - tells the compiler that main is acccessible outside the class (`public`), it is a static method (there is a single, durable instance), and it is not expected to return a value.  `String[]  args` marks the input values.  The general structure.

```java
public class [filename]{
    public static void main(String[] args){
    //code here
    }   
}
```
#### Static
 
When a member is declared static, it can be accessed before any objects of its class are created, and without reference to any object. Static is a non-access modifier in Java which is applicable for the following:

- variables
- methods
- nested classes
- blocks - 


##### blocks

 If you need to do computation in order to initialize your static variables, you can declare a static block that gets executed exactly once, when the class is first loaded. Consider the following java program demonstrating use of static blocks.

```Java
class Test 
{ 
    static int a = 10; // static variable 
    static int b; 
      
    static {     // static block 
        System.out.println("Static block initialized."); 
        b = a * 4; 
    } 
  
    public static void main(String[] args) { 
       System.out.println("from main"); 
       System.out.println("Value of a : "+a); 
       System.out.println("Value of b : "+b); 
    } 
} 
```


### modifiers

- static
- final
- @override
- extends
- implements

        [package-private] class MyClass `extends` MySuperClass `implements` YourInterface {
            // field, constructor, and
            // method declarations
        }


### Constructors

Note that the constructor name must match the class name, and it cannot have a return type (like void).

Also note that the constructor is called when the object is created.

All classes have constructors by default: if you do not create a class constructor yourself, Java creates one for you. However, then you are not able to set initial values for object attributes

```java
public class Car {
  int modelYear;
  String modelName;

    //constructor
  public Car(int year, String name) {
    modelYear = year;
    modelName = name;
  }

  public static void main(String[] args) {
    Car myCar = new Car(1969, "Mustang");
    System.out.println(myCar.modelYear + " " + myCar.modelName);
  }
}
```

### Subclass

Distinguished from inner classes- these are marked by `extends`.

A superclass can have a derived subclass.  These are subtypes of the parent class.  e.g. Shape-> Square.  Animals->Cat.

Animals have methods like eat, sleep, screw, move (?override). A cat subclass would have like bathe itself, scratch, play.  An instance would be Hobbes.  Move would be overridden by the subclas to write the way a cat moves.  Can have multiple subclasses-

Animal-Mammal-Feline-Cat-...(?Male)-(??Kitten)...

```java
public class Animal{
    void eat(object food){ ... }
    object defecate(){ ... return poop}
    void sleep(){ ... }
    void move() { ... }
}

class Cat extends Animal{
    void bathe(){ ... }
    void scratch() {... }
    @override
    void move(){ ... }
}
...

### Inner Class

Inner classes are a security mechanism in Java. We know a class cannot be associated with the access modifier private, but if we have the class as a member of other class, then the inner class can be made private. And this is also used to access the private members of a class.

[Source](https://www.geeksforgeeks.org/inner-class-java/)

Inner class means one class which is a member of another class. There are basically four types of inner classes in java.
1) [Nested Inner class](#Nested-Inner-class)
2) [Method Local inner classes](#Method-Local-inner-classes)
3) [Anonymous inner classes](#Anonymous-inner-classes)
4) [Static nested classes](#Static-nested-classes)

#### Nested Inner class

Nested Inner class can access any private instance variable of outer class. Like any other instance variable, we can have access modifier private, protected, public and default modifier.  Once you declare an inner class private, it cannot be accessed from an object outside the class.
Like class, interface can also be nested and can have access specifiers.

Following example demonstrates a nested class.

```java
class Outer { 
   // Simple nested inner class 
   class Inner { 
      public void show() { 
           System.out.println("In a nested class method"); 
      } 
   } 
} 
class Main { 
   public static void main(String[] args) { 
       Outer.Inner in = new Outer().new Inner(); 
       in.show(); 
   } 
} 
```

**Output**

        In a nested class method


As a side note, we can’t have static method in a nested inner class because an inner class is implicitly associated with an object of its outer class so it cannot define any static method for itself. For example the following program **doesn’t compile.**

```java
class Outer { 
   void outerMethod() { 
      System.out.println("inside outerMethod"); 
   } 
   class Inner { 
      public static void main(String[] args){ 
         System.out.println("inside inner class Method"); 
      } 
   } 
}
//doesnt work
```

**Output:**

        Error illegal static declaration in inner class 
        Outer.Inner public static void main(String[] args) 
        modifier ‘static’ is only allowed in constant 
        variable declaration 

An interface can also be nested and nested interfaces have some interesting properties. We will be covering nested interfaces in the next post.

#### Method Local inner classes

Inner class can be declared within a method of an outer class. In the following example, Inner is an inner class in outerMethod().

```java
class Outer { 
	void outerMethod() { 
		System.out.println("inside outerMethod"); 
		// Inner class is local to outerMethod() 
		class Inner { 
			void innerMethod() { 
				System.out.println("inside innerMethod"); 
			} 
		} 
		Inner y = new Inner(); 
		y.innerMethod(); 
	} 
} 
class MethodDemo { 
	public static void main(String[] args) { 
		Outer x = new Outer(); 
		x.outerMethod(); 
	} 
}
```

**Output**

        Inside outerMethod
        Inside innerMethod

Method Local inner classes can’t use local variable of outer method until that local variable is not declared as final. For example, the following code generates compiler error (Note that x is not final in outerMethod() and innerMethod() tries to access it)

```java

class Outer { 
   void outerMethod() { 
      int x = 98; 
      System.out.println("inside outerMethod"); 
      class Inner { 
         void innerMethod() { 
            System.out.println("x= "+x); 
         } 
      } 
      Inner y = new Inner(); 
      y.innerMethod(); 
   } 
} 
class MethodLocalVariableDemo { 
   public static void main(String[] args) { 
      Outer x=new Outer(); 
      x.outerMethod(); 
   } 
}
```
**Output**

        local variable x is accessed from within inner class; needs to be declared final

!!!Note : Local inner class cannot access non-final local variable till JDK 1.7. Since JDK 1.8, it is possible to access the non-final local variable in method local inner class.

But the following code compiles and runs fine (Note that x is final this time)

```java
class Outer { 
   void outerMethod() { 
      final int x=98; 
      System.out.println("inside outerMethod"); 
      class Inner { 
         void innerMethod() { 
            System.out.println("x = "+x); 
         } 
      } 
      Inner y = new Inner(); 
      y.innerMethod(); 
   } 
} 
class MethodLocalVariableDemo { 
    public static void main(String[] args){ 
      Outer x = new Outer(); 
      x.outerMethod(); 
    } 
}
```

**Output**

        Inside outerMethod
        X = 98 

The main reason we need to declare a local variable as a final is that local variable lives on stack till method is on the stack but there might be a case the object of inner class still lives on the heap.

Method local inner class can’t be marked as private, protected, static and transient but can be marked as abstract and final, but not both at the same time.

#### Static nested classes

Static nested classes are not technically an inner class. They are like a static member of outer class.

```java
class Outer { 
   private static void outerMethod() { 
     System.out.println("inside outerMethod"); 
   } 
     
   // A static inner class 
   static class Inner { 
     public static void main(String[] args) { 
        System.out.println("inside inner class Method"); 
        outerMethod(); 
     } 
   } 
  
}
```
func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, x))))))))))

func(vars, i++, func(i);func(i);func(i);func(i);func(i);func(i);func(i);func(i);func(i);func(i);func(i);, return i);
func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(vars, i++, func(i), return i);, return i);, return i);, return i);, return i);, return i);, return i);, return i);, return i);, return i);, return i);
**Output**

        inside inner class Method
        inside outerMethod 

#### Anonymous inner classes

Anonymous inner classes are declared without any name at all. They are created in two ways.

a) As subclass of specified type

```java
class Demo { 
   void show() { 
      System.out.println("i am in show method of super class"); 
   } 
} 
class Flavor1Demo { 
  
   //  An anonymous class with Demo as base class 
   static Demo d = new Demo() { 
       void show() { 
           super.show(); 
           System.out.println("i am in Flavor1Demo class"); 
       } 
   }; 
   public static void main(String[] args){ 
       d.show(); 
   } 
}
```

**Output**

        i am in show method of super class
        i am in Flavor1Demo class 

In the above code, we have two class Demo and Flavor1Demo. Here demo act as super class and anonymous class acts as a subclass, both classes have a method show(). In anonymous class show() method is overridden.

a) As implementer of the specified interface

```java
class Flavor2Demo { 
  
    // An anonymous class that implements Hello interface 
    static Hello h = new Hello() { 
        public void show() { 
            System.out.println("i am in anonymous class"); 
        } 
    }; 
  
    public static void main(String[] args) { 
        h.show(); 
    } 
} 
  
interface Hello { 
    void show(); 
} 
```

**Output:**

        i am in anonymous class

In above code we create an object of anonymous inner class but this anonymous inner class is an implementer of the interface Hello. Any anonymous inner class can implement only one interface at one time. It can either extend a class or implement interface at a time.

## Operators

Operator Precedence

Rank Operator Operation Associativity

- 1
  - `[]` Array subscript Left
  - `()` Method call
  - `.` Member access
  - `++` Postfix increment
  - `‐‐` Postfix decrement
- 2
  - `++` Prefix increment Right
  - `‐‐` Prefix decrement
  - `+` ‐ Unary plus or minus
  - `!` Complement
  - `~` Bitwise complement
  - `(type)` Type cast
  - `new` Object creation
- 3   `*`, `/`, `%` - Multiply, divide, remainder Left
- 4 - Addition or Subtraction--   - `+` Addition or string concatenation Left - `‐` Subtraction
- 5
  -  `<<` Signed bit shift left Left
  - `>>` Signed bit shift right
    - `>>>` Unsigned bit shift right
- 6
  - `<`, `<=` Less than, less than or equal Left
  - `>`, `>=` -  Greater than, greater than or equal instanceof Refer=ence test
- 7   - `==` Equal to Left  - `!=` Not equal to
- 8 -  `&` Bitwise and Left
- 9 - `^` -  Bitwise exclusive or Left
- 10 - `|` Bitwise or Left
- 11 - `&&` Logical and Left
- 12 -  `||` - Logical or Left
- 13 - `?:` - Conditional Left
- 14 - `=` -  Assignment Right
*=, /=, %=, +=, ‐=,
<<=, >>=, >>>=, &=, |=
Compound assignment

### Type Operations

#### byte to char

- [Source](https://www.javacodegeeks.com/2010/11/java-best-practices-char-to-byte-and.html)

When all characters to be converted are ASCII characters, a proposed conversion method is the one shown below :

```java
public static byte[] stringToBytesASCII(String str) {
 char[] buffer = str.toCharArray();
 byte[] b = new byte[buffer.length];
 for (int i = 0; i < b.length; i++) {
  b[i] = (byte) buffer[i];
 }
 return b;
}
```

The resulted byte array is constructed by casting every character value to its byte equivalent since we know that all characters are in the ASCII range (0 – 127) thus can occupy just one byte in size.

Using the resulted byte array we can convert back to the original String, by utilizing the “classic” String constructor “
String myString = new String(byte[]);

For the default character encoding we can use the methods shown below to convert a String to a byte array and vice – versa :

```Java
public static byte[] stringToBytesUTFCustom(String str) {
 char[] buffer = str.toCharArray();
 byte[] b = new byte[buffer.length << 1];
 for(int i = 0; i < buffer.length; i++) {
  int bpos = i << 1;
  b[bpos] = (byte) ((buffer[i]&0xFF00)>>8);
  b[bpos + 1] = (byte) (buffer[i]&0x00FF);
 }
 return b;
}
```

Every character type in Java occupies 2 bytes in size. For converting a String to its byte array equivalent we convert every character of the String to its 2 byte representation.

Using the resulted byte array we can convert back to the original
String, by utilizing the method provided below ://

```java
public static String bytesToStringUTFCustom(byte[] bytes) {
 char[] buffer = new char[bytes.length >> 1];
 for(int i = 0; i < buffer.length; i++) {
  int bpos = i << 1;
  char c = (char)(((bytes[bpos]&0x00FF)<<8) + (bytes[bpos+1]&0x00FF));
  buffer[i] = c;
 }
 return new String(buffer);
}
```

We construct every String character from its 2 byte representation. Using the resulted character array we can convert back to the original String, by utilizing the “classic” String constructor “new String(char[])”

Last but not least we provide two example methods using the NIO package in order to convert a String to its byte array equivalent and vice – versa :

```java
public static byte[] stringToBytesUTFNIO(String str) {
 char[] buffer = str.toCharArray();
 byte[] b = new byte[buffer.length << 1];
 CharBuffer cBuffer = ByteBuffer.wrap(b).asCharBuffer();
 for(int i = 0; i < buffer.length; i++)
  cBuffer.put(buffer[i]);
 return b;
}
```

#### Convert Char Array to String and back

```Java
public class main{
    public static void main {
        String test = "this is a string";
        char[] charArray = test.toCharArray();

        //this will print each one by one
        for(char output : charArray){
            System.out.print(output);
        }

        //you can create a string with
        String backtoString = new String(charArray);
        String backtoString2 = String.valueOf(charArray);
    }
}
```

### Operators

Operator Precedence

Rank Operator Operation Associativity

- 1
  - `[]` Array subscript Left
  - `()` Method call
  - `.` Member access
  - `++` Postfix increment
  - `‐‐` Postfix decrement
- 2
  - `++` Prefix increment Right
  - `‐‐` Prefix decrement
  - `+` ‐ Unary plus or minus
  - `!` Complement
  - `~` Bitwise complement
  - `(type)` Type cast
  - `new` Object creation
- 3   `*`, `/`, `%` - Multiply, divide, remainder Left
- 4 - Addition or Subtraction--   - `+` Addition or string concatenation Left - `‐` Subtraction
- 5
  - `<<` Signed bit shift left Left
  - `>>` Signed bit shift right
    - `>>>` Unsigned bit shift right
- 6
  - `<`, `<=` Less than, less than or equal Left
  - `>`, `>=` -  Greater than, greater than or equal instanceof Refer=ence test
- 7   - `==` Equal to Left  - `!=` Not equal to
- 8 -  `&` Bitwise and Left
- 9 - `^` -  Bitwise exclusive or Left
- 10 - `|` Bitwise or Left
- 11 - `&&` Logical and Left
- 12 -  `||` - Logical or Left
- 13 - `?:` - Conditional Left
- 14 - `=` -  Assignment Right
*=, /=, %=, +=, ‐=,
<<=, >>=, >>>=, &=, |=
Compound assignment

## Control Statements

### IF statements

General format:

```java
boolean fUC=false,fAlpha=false;

//looking at ASCII Charactercodes to set some flags
if(x>=65  && x <=90){
    fUC=true;
    fAlpha=true;
}else{
    fUC = false
}
```
#### Ternary Operators

Can Also do this with Ternary Operators
```java
result = (expression == eval) ? result_if_true : result_if_false;
fNum = (x>=30  && x <=39) ? true : false;
fUC = ((x>=65  && x <=90) ? true : false;
fLC = (x>=97  && x <=122) ? true : false;
fAlpha =(fUC || fLC) ? true : false;
```

#### Coalesceing

moved from IO.  Merge with  ternary Operators?
If not null, the dinner = cage. getChicken(), if null get free range chicken.

```java

dinner = ((dinner = cage.getChicken()) != null) ? dinner : getFreeRangeChicken();

//or
dinner = Optional.ofNullable(cage.getChicken())
  .orElse(getFreerangeChicken());  //this method is discouraged

```

#### Boolean simplifications

Boolean values can be set simply by making it equal to the expression

```Java
 fNum = x >= 30 && x <= 39;
fUC = (x >= 65 && x <= 90;
fLC = x >= 97 && x <= 122;
fAlpha = fUC || fLC;

```
### For Loops

```Java
 for(int i; i<= 10; i++){
     //do stuff
 }
```
```Java
// JAVA program to iterate over an array using for loop 
import java.io.*; 
class GFG { 

	public static void main(String args[]) throws IOException 
	{ 
		int ar[] = { 1, 2, 3, 4, 5, 6, 7, 8 }; 
		int x; 
		// iterating over an array 
		for (int i : ar) { 
			// accessing each element of array 
			x = i; 
			System.out.print(x + " "); 
		} 
	} 
} 
```
The same can be done for enums


### Enums

Enum class is present in java.lang package. It is the common base class of all Java language enumeration types. For information about enums, refer enum in java

        public abstract class Enum<E extends Enum>
        extends Object
        implements Comparable, Serializable
        
Enum class provides 10 useful methods. Most of them are overridden from Object class. These methods are declared as final in Enum class so the programmer cannot modify any of the enum constants.
//TODO https://www.geeksforgeeks.org/java-lang-enum-class-java/ check and see if this is useful.  Just skimmed it.

```Java
// Program that demonstrates iteration 
// over enums using forEach() 
import java.util.Arrays; 
import java.util.EnumSet; 
  
public class GFG { 
    public enum seasons x
    { 
        Spring, 
        Summer, 
        Monsoon, 
        Autumn, 
        Winter 
    }

import java.util.EnumSet; 

    public void iterEnum()   
    { 
        // Convert enum to set and apply forEach() 
        EnumSet.allOf(seasons.class) 
            .forEach(season -> System.out.println(season)); 
    }

import java.util.Arrays; 

    public void iterSet()
    {
        // Convert enum to set and apply forEach() 
        Arrays.asList(seasons.values()).forEach(season -> 
                                 System.out.println(season)); 
    }

    public static void forEnums() 
    { 
        // iterate over enums using for loop 
        for (seasons s : seasons.values()) { 
            System.out.println(s); 
        } 
    }  
import java.util.stream.Stream; 
  
    public void iterStream(){
                // iteration over enum using java.util.stream 
        Stream.of(seasons.values()).forEach(System.out::println); 
    }
} 
```

Iterate Using java.util.stream: Iteration over enum can also be done using java.util.stream class. Create the stream of enum.values() using Stream.of() method by passing eum.values() at parameter to function.
Below program illustrate the iteration over enum using java.util.stream:

#### Switch (Case)


```Java
    private String ordinal(int i){
        String s;
        switch(i) {
            case 0:
                s = "zeroth";
                break;
            case 1:
                s = "first";
                break;
            case 2:
                s = "second";
                break;
            case 3:
                s = "third";
                break;
            case 4:
                s = "fourth";
                break;
            case 5:
                s = "fifth"; //this will fall down and return the default answer.
            default:
                ;
                s = String.valueOf(i);
                break;
        }
        return s;
    }
    
    private String shortOrdinal(int i){
        i= i % 10;
        String s;
        switch(i) {
            case 1:
                s = "st";
                break;
            case 2:
                s = "nd";
                break;
            case 3:
                s = "rd";
                break;
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 0:
            default:
                s = "th";
                break;
        }
        return String.valueOf(i) + s;
    }

```

## IO Notes

### System.in and System.out

See System.java.

print and println are classes of the `java.io.PrintStream#println(obj)` class;

It can be possibly reassigned with `System.setIn(InputStream in)` (and out/err respectively)

This throws `Exception SecurityException` if for some reason its not permitted.

### Reading and Writing Files

[Ref](http://www.java2s.com/Code/Java/File-Input-Output/Readfilecharacterbycharacter.htm)

```java
    public File fileReadable(String inString){
        File file = new File(inString);
        if (!file.exists()) {
            System.out.println(inString + " does not exist or is not a valid path");
            return null;
        }
        if (!(file.isFile() && file.canRead())) {
        System.out.println(file.getName() + " cannot be read from.");
        return null;
        }
        try {
        FileInputStream fis = new FileInputStream(file);
        char current;
        while (fis.available() > 0){
            current = (char) fis.read();
            System.out.print(current);
        }
        } catch (IOException e) {
        e.printStackTrace();
        }
    }
```

### Reading and Writing for Badasses

```java
  private void  readAndWrite() {
    try {
          new BufferedOutputStream( 
              new FileOutputStream( 
                  new File( 
                      "Outfile64-new.txt"
                  )
              )
          ).write( Base64.getEncoder().encode(
              new BufferedInputStream(
                  new FileInputStream(
                      new File(
                          FULLPATH + INTRO_FILE 
                      ) 
                  ) 
              ).readAllBytes()  ) );
    }catch(Exception ignore){}
  }
  ```

//[Ref](https://www.youtube.com/watch?v=_jhCvy8_lGE&list=PLyRiRUsTyUXhUXoOPEdMZWhGpGeSQFZgH&index=18) @ 15:16

#### Writing

##### As Text

`PrintWriter()` Behaves the most like System.out.print();

```Java
String string = new String();
File file = new File(string);
try{
    PrintWriter output = new PrintWriter(file);
    output.println("Some String");
    output.println(42);
} catch (IOException ex){
    System.out.printf("Error %s\n",ex);
}finally{
    //always executed;
}
//file is in the same location of the project

```

##### AsBytes

`FileOutputStream()` - Used to write to a file, treating it as bytes instead of text.

```Java

```

`ObjectOutputStream()` Used to serialize an object/data input stream back into an object.

**Serialization** - used to output objects to file, so that they can be recovered later.

```Java

```

##### PrintStream

A PrintStream adds functionality to another output stream,namely the ability to print representations of various data valuesconveniently. Two other features are provided as well. Unlike other outputstreams, a PrintStream never throws an IOException; instead, exceptional situations merely set aninternal flag that can be tested via the checkError method.

All characters printed by a PrintStream are converted intobytes using the given encoding or charset, or platform's default characterencoding if not specified.The `PrintWriter` class should be used in situations that requirewriting characters rather than bytes.

```java


```

#### Reading

- `Scanner()` - most flexible of the file input class- works the similar way to as with console.

```Java
public void scratch() {
        String path = new String("C:\\..\\..\\somepath.txt"):
        File file = new File(path);
        try {
            Scanner input = new Scanner(file);
            String name = input.newLine();
            int age = input.nextInt();
            System.out.printf("Name %s, Age: %d\n",name, age);
        } catch (FileNotFoundException e) {
            //TODO: handle exception
            System.out.printf("Error %s\n",ex);
        }
    }

```

##### AsBytes

`FileOutputStream()` - Used to write to a file, treating it as bytes instead of text.

```Java

```

`ObjectInputStream()` Used to serialize an object/data stream out into a file.

**Serialization** - used to output objects to file, so that they can be recovered later.

```Java
import java.io.Serializable;

public class exampleClass implements Serializable{  //the object class to be serialized.
    private String strField;
    private int intField

    public exampleClass(String input, int input2) { //constructor
        this.strField = input;
        this.intField = input2;
    }
}
```
### Logging

java.base.lang.system.logger
[system.logger](https://docs.oracle.com/javase/10/docs/api/java/lang/System.html#getLogger(java.lang.String))
and
java.util.logger
[util.logger](https://docs.oracle.com/javase/10/docs/api/java/util/logging/Logger.html)

System.Logger Severity Level Mapping
System.Logger Levels vs. java.util.logging Levels.

| System. | .util.  |
|---------|---------|
| ALL     | ALL     |
| TRACE   | FINER   |
| DEBUG   | FINE    |
| INFO    | INFO    |
| WARNING | WARNING |
| ERROR   | SEVERE  |
| OFF     | OFF     |
## Exceptions

### Class location

#### Getting the method

```java
public static String getMethodName(final int depth)
{
  final StackTraceElement[] ste = Thread.currentThread().getStackTrace();

  //System. out.println(ste[ste.length-depth].getClassName()+"#"+ste[ste.length-depth].getMethodName());
  // return ste[ste.length - depth].getMethodName();  //Wrong, fails for depth = 0
  return ste[ste.length - 1 - depth].getMethodName(); //Thank you Tom Tresansky
}

//also


```


Object -> Throwable ┬─> Error
└─> Exception ┬─> Runtime Exceptions -> (...)
└─> (...) Extended Exceptions

java.lang.OutOfMemoryError
java.lang.StackOverflowError

```java
try{
    //code that might error
}catch(Exception e){
    //reaction code
}finally{

}
/* You need at least 1 catch or finally
-You can have as many catch as you want
-Only 1 total finally
can have both

*/
try{
    c=a/b;
    FileReader fr = new FileReader("test.txt");
}catch(ArithmeticException e){

}catch(FileNotFoundException fe){
    //can increase in vaugeness
}catch(IOException IOe){
    //more broad
}catch(Exception e){
    //cleanup
//Exception is the super-class of the other 2 (and all of them), so it should come last, as the code will move down the list till it hits.
}finally{
    //used often in IO to close files, even on error
}
```

Code beyond the error-causing the line will not be executed below it:
try{
1: code
2: code <- error
3: code >< not executed.
}

Method Call stack, goes from recent to last (the first one called.) The code will move through the call stack looking for a handler. If it makes it all the way to main, then it will present an error to the user and halt.

```java
/** */
public class Main{

    public void earlierMethod(){
        someMethod();
    }


    public static void someMethod(File file) throws FileNotFoundException{
        FileReader fr = new FileReader("somenon-existingFile.txt");
    }
}
```

If you use the `throws` clause, then the calling method has to handle the exception. This will continue up the chain until its caught. Where I guess you can catch all with `Exception e`?

Any Exception that extends java.lang.RuntimeException is called a Runtime Exception. They dont need to be caught or declared. These are the ones that depend on user input.
?? another video says that we do have to check for these exceptions- its our responsibility.

#### Types and Causes

Detail on each below-

- IOException - any type of IO exception
- FileNotFoundException - file not found
- SecurityException - if a security manager exists and its checkPropertyAccess method doesn't allow access to the specified system property.
- NullPointerException - if key is null.
- IllegalArgumentException - if key is empty.
- ArithmeticException - divide by 0 etc.
- ClassNotFoundException - not a real exception
- IndexOutofBounds- arrays
- InputMismatchException - wrong type e.g. **scanner**

##### Full List of Exceptions (Alpha)

- AbsentInformationException
- AclNotFoundException
- ActivationException
- AgentInitializationException
- AgentLoadException
- AlreadyBoundException
- AttachNotSupportedException
- AWTException
- BackingStoreException
- BadAttributeValueExpException
- BadBinaryOpValueExpException
- BadLocationException
- BadStringOperationException
- BrokenBarrierException
- CardException
- CertificateException
- ClassNotLoadedException
- CloneNotSupportedException
- DataFormatException
- DatatypeConfigurationException
- DestroyFailedException
- ExecutionControl.ExecutionControlException
- ExecutionException
- ExpandVetoException
- FontFormatException
- GeneralSecurityException
- GSSException
- IllegalClassFormatException
- IllegalConnectorArgumentsException
- IncompatibleThreadStateException
- InterruptedException
- IntrospectionException
- InvalidApplicationException
- InvalidMidiDataException
- InvalidPreferencesFormatException
- InvalidTargetObjectTypeException
- InvalidTypeException
- InvocationException
- IOException
- JMException
- JShellException
- KeySelectorException
- LambdaConversionException
- LastOwnerException
- LineUnavailableException
- MarshalException
- MidiUnavailableException
- MimeTypeParseException
- NamingException
- NoninvertibleTransformException
- NotBoundException
- NotOwnerException
- ParseException
- ParserConfigurationException
- PrinterException
- PrintException
- PrivilegedActionException
- PropertyVetoException
- ReflectiveOperationException
- RefreshFailedException
- RuntimeException
- SAXException
- ScriptException
- ServerNotActiveException
- SQLException
- StringConcatException
- TimeoutException
- TooManyListenersException
- TransformerException
- TransformException
- UnmodifiableClassException
- UnsupportedAudioFileException
- UnsupportedCallbackException
- UnsupportedFlavorException
- UnsupportedLookAndFeelException
- URIReferenceException
- URISyntaxException
- VMStartException
- XAException
- XMLParseException
- XMLSignatureException
- XMLStreamException
- XPathException

##### Runtime Exceptions

These are unckecked exceptions

- AnnotationTypeMismatchException
- ArithmeticException
- ArrayStoreException
- BufferOverflowException
- BufferUnderflowException
- CannotRedoException
- CannotUndoException
- CatalogException
- ClassCastException
- ClassNotPreparedException
- CMMException
- CompletionException
- ConcurrentModificationException
- DateTimeException
- DOMException
- DuplicateRequestException
- EmptyStackException
- EnumConstantNotPresentException
- EventException
- FileSystemAlreadyExistsException
- FileSystemNotFoundException
- FindException
- IllegalArgumentException
- IllegalCallerException
- IllegalMonitorStateException
- IllegalPathStateException
- IllegalStateException
- IllformedLocaleException
- ImagingOpException
- InaccessibleObjectException
- IncompleteAnnotationException
- InconsistentDebugInfoException
- IndexOutOfBoundsException
- InternalException
- InvalidCodeIndexException
- InvalidLineNumberException
- InvalidModuleDescriptorException
- InvalidModuleException
- InvalidRequestStateException
- InvalidStackFrameException
- JarSignerException
- JMRuntimeException
- JSException
- LayerInstantiationException
- LSException
- MalformedParameterizedTypeException
- MalformedParametersException
- MirroredTypesException
- MissingResourceException
- NashornException
- NativeMethodException
- NegativeArraySizeException
- NoSuchDynamicMethodException
- NoSuchElementException
- NoSuchMechanismException
- NullPointerException
- ObjectCollectedException
- ProfileDataException
- ProviderException
- ProviderNotFoundException
- RangeException
- RasterFormatException
- RejectedExecutionException
- ResolutionException
- SecurityException
- SPIResolutionException
- TypeNotPresentException
- UncheckedIOException
- UndeclaredThrowableException
- UnknownEntityException
- UnknownTreeException
- UnmodifiableModuleException
- UnmodifiableSetException
- UnsupportedOperationException
- VMDisconnectedException
- VMMismatchException
- VMOutOfMemoryException
- WrongMethodTypeException
- XPathException

##### IOException

any type of IO exception

##### FileNotFoundException

file not found

##### SecurityException

if a security manager exists and its checkPropertyAccess method doesn't allow access to the specified system property.

##### NullPointerException

if key is null.

##### IllegalArgumentException

if key is empty.

##### ArithmeticException

divide by 0 etc.

##### ClassNotFoundException

not a real exception

##### IndexOutofBounds

arrays

##### InputMismatchException

wrong type e.g. scanner

#### Handling:

```java

try {

} catch (Exception e) {
    //TODO: handle exception
}
```

### System.getProperty

Can be used to get system values. Note the double quotes. Single quotes are character literals.

```Java
String value = System.getProperty("java.version");
//System.getProperty('[key value]');
```

| **Key**                         | Value                                                                                                         |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `java.version`                  | Java Runtime Environment version, which may be interpreted as a Runtime.Version                               |
| `java.version.date`             | Java Runtime Environment version date, in ISO-8601 YYYY-MM-DD format, which may be interpreted as a LocalDate |
| `java.vendor`                   | Java Runtime Environment vendor                                                                               |
| `java.vendor.url`               | Java vendor URL                                                                                               |
| `java.vendor.version`           | Java vendor version                                                                                           |
| `java.home`                     | Java installation directory                                                                                   |
| `java.vm.specification.version` | Java Virtual Machine specification version which may be interpreted as a Runtime.Version                      |
| `java.vm.specification.vendor`  | Java Virtual Machine specification vendor                                                                     |
| `java.vm.specification.name`    | Java Virtual Machine specification name                                                                       |
| `java.vm.version`               | Java Virtual Machine implementation version which may be interpreted as a Runtime.Version                     |
| `java.vm.vendor`                | Java Virtual Machine implementation vendor                                                                    |
| `java.vm.name`                  | Java Virtual Machine implementation name                                                                      |
| `java.specification.version`    | Java Runtime Environment specification version which may be interpreted as a Runtime.Version                  |
| `java.specification.vendor`     | Java Runtime Environment specification vendor                                                                 |
| `java.specification.name`       | Java Runtime Environment specification name                                                                   |
| `java.class.version`            | Java class format version number                                                                              |
| `java.class.path`               | Java class path                                                                                               |
| `java.library.path`             | List of paths to search when loading libraries                                                                |
| `java.io.tmpdir`                | Default temp file path                                                                                        |
| `java.compiler`                 | Name of JIT compiler to use                                                                                   |
| `os.name`                       | Operating system name                                                                                         |
| `os.arch`                       | Operating system architecture                                                                                 |
| `os.version`                    | Operating system version                                                                                      |
| `file.separator`                | File separator ("/" on UNIX)                                                                                  |
| `path.separator`                | Path separator (":" on UNIX)                                                                                  |
| `line.separator`                | Line separator ("\n" on UNIX)                                                                                 |
| `user.name`                     | User's account name                                                                                           |
| `user.home`                     | User's home directory                                                                                         |
| `user.dir`                      | User's current working directory                                                                              |
| `jdk.module.path`               | The application module path                                                                                   |
| `jdk.module.upgrade.path`       | The upgrade module path                                                                                       |
| `jdk.module.main`               | The module name of the initial/main module                                                                    |
| `jdk.module.main.class`         | The main class name of the initial module                                                                     |
| `file.encoding`         | The default characterset used                                                                    |

Multiple paths in a system property value are separated by the path separator character of the platform.

Note that even if the security manager does not permit the getProperties operation, it may choose to permit the getProperty(String) operation.

Implementation Note:
In addition to the standard system properties, the system properties may include the following keys:
Key Description of Associated Value

```java
//running the below returns the VM vars
      System.getProperties().list(System.out);

sun.desktop=windows
awt.toolkit=sun.awt.windows.WToolkit
java.specification.version=11
sun.cpu.isalist=amd64
sun.jnu.encoding=Cp1252
java.class.path=C:\Users\andyt\.IntelliJIdea2018.2\sy...
java.vm.vendor=Oracle Corporation
sun.arch.data.model=64
user.variant=
java.vendor.url=http://java.oracle.com/
user.timezone=
os.name=Windows 10
java.vm.specification.version=11
sun.java.launcher=SUN_STANDARD
user.country=US
sun.boot.library.path=C:\Program Files\Java\jdk-11\bin
sun.java.command=Scratch
jdk.debug=release
sun.cpu.endian=little
user.home=C:\Users\andyt
user.language=en
java.specification.vendor=Oracle Corporation
java.version.date=2018-09-25
java.home=C:\Program Files\Java\jdk-11
file.separator=\
java.vm.compressedOopsMode=Zero based
line.separator=

java.specification.name=Java Platform API Specification
java.vm.specification.vendor=Oracle Corporation
java.awt.graphicsenv=sun.awt.Win32GraphicsEnvironment
user.script=
sun.management.compiler=HotSpot 64-Bit Tiered Compilers
java.runtime.version=11+28
user.name=andyt
path.separator=;
os.version=10.0
java.runtime.name=Java(TM) SE Runtime Environment
file.encoding=UTF-8
java.vm.name=Java HotSpot(TM) 64-Bit Server VM
java.vendor.version=18.9
java.vendor.url.bug=http://bugreport.java.com/bugreport/
java.io.tmpdir=C:\Users\andyt\AppData\Local\Temp\
java.version=11
user.dir=C:\Users\andyt\.IntelliJIdea2018.2\co...
os.arch=amd64
java.vm.specification.name=Java Virtual Machine Specification
java.awt.printerjob=sun.awt.windows.WPrinterJob
sun.os.patch.level=
java.library.path=C:\Program Files\Java\jdk-11\bin;C:\W...
java.vendor=Oracle Corporation
java.vm.info=mixed mode
java.vm.version=11+28
sun.io.unicode.encoding=UnicodeLittle
java.class.version=55.0
```


### Line Terminators

`LF` in Linux and MacOS (post OS-9)
`CR` in Old machines, Early Mac **Deprecated**
`CR LF` in Windows

## Graphs

`vertex` - each node
`edge` - each link between a node.  Each edge connects two verticies.

`undirected graph` - a graph- with out direction applied to the 'edges', they are bi-directional.

An undirected graph is a finite set of vertices together with a finite set of edges. Both sets might be empty (no vertices and no edges), which is called the empty graph. Each edge is associated with two vertices.

## Error Translation

### Syntax error on 'class', @ expected

```java
class stackNode() {

    private stackNode(stackNode head, int value){
        //...
    }
}
```

Remove the '()' after class- `class stackNode{`

## GUI

### Text Based- LANTERNA

using the

### Swing

[Swing Demos](https://docs.oracle.com/javase/tutorial/uiswing/examples/components/index.html)


## Etc.

### JShell

Start with JShell.  Is in JDK 9+, `jshell -v` starts jshell in *verbose* mode.

[JShell Docs](https://docs.oracle.com/javase/10/jshell/commands.htm#JSHEL-GUID-F4881B8E-8B6C-4906-A100-E78C4AFC277D)


 Commands are distinguished from snippets by a leading forward slash (`/`). For information about the current variables, methods, and types, use the /vars, /methods, and /types commands. For a list of entered snippets, use the /list command.
- `/`
- `/?`
- `/drop`
- `/edit`
- `/env`
- `/exit`
- `/help`
- `/history`
- `/imports`
- `/list`
- `/methods`
- `/open`
- `/reload`
- `/reset`
- `/save`
- `/set`
  - editor
  - feedback
  - format
  - mode
  - prompt
  - start
  - truncation
- `/types`
- `/vars`
- `/!`           
- `/-<n>` return n-th previous snippet         
- `/<id>`               
- `/drop`               
- `context`      
- `id`           
- `intro`        
- `rerun`        
- `shortcuts`

[[Tab]] works and does a lot for completion, /[[Tab]] shows all the commands.  `/list` [[Tab]] shows the options associated `-all`, `-history`, and `-start`.  Pressing tab again gives synopsis.

Commands, /set subcommands, command arguments, and command options can all be abbreviated, as long as the abbreviation is unique.

The only command that begins with /l is /list, and the only /list option that begins with -a is -all . Therefore, you can use the following abbreviations to enter the /list -all command :

        jshell> /l -a

Terminating semicolons are automatically added to the end of a complete snippet if not entered. When an expression is entered that doesn't have a named variable, a scratch variable is created so that the value can be referenced later. The following example shows scratch values for an expression and for the results of a method. The example also shows the continuation prompt (...>) that is used when a snippet requires more than one line of input to complete:

```java
jshell> int x = 45
x ==> 45
|  created variable x : int
jshell> 2 + 2
$3 ==> 4
|  created scratch variable $3 : int

jshell> String twice(String s) {
   ...>    return s + s;
   ...> }
|  created method twice(String)

jshell> twice("Ocean")
$5 ==> "OceanOcean"
|  created scratch variable $5 : String

//change a value by updating it.

jshell> int x = 45
x ==> 45
|  created variable x : int
//if incompatible it will overwrite.
jshell> String x
x ==> null
|  replaced variable x : String
|    update overwrote variable x : int
```


#### Editing 

To edit all existing snippets at once in an editor, use `/edit` without an option. To edit a specific snippet in an editor, use the `/edit` command with the snippet name or ID. Use the `/list` command to get the snippet IDs. The following example opens an editor to edit the snippet named volume, which was defined in Forward References:  `jshell> /edit volume`
You can also enter new snippets in the editor. When you save in the editor, any snippet that is changed or new is entered into the JShell session. Feedback from the snippets is shown in the JShell window, however, no JShell prompt is shown. You can’t enter commands or snippets in the JShell window until the editor is closed.

If you don’t specify an editor, then the following environment variables are checked in order: `JSHELLEDITOR`, `VISUAL`, and `EDITOR`. If none of those are set, then a simple default editor is used. To set up JShell to open the editor of your choice, use the /set editor command. The argument to the `/set editor` command is the command needed to start the external editor that you want to use. The following example sets kwrite as the editor and opens the editor with all existing snippets:

### Console Colors:

//  System.out.println((char)27+"[31m"+"ERROR MESSAGE IN RED");
//   System.out.println((char)27+"[01m" + "Bold");
//   System.out.println((char)27+"[04m"+"Underline");
//   System.out.println((char)27+"[07m"+"Highlight");
//
//   System.out.println((char)27+"[30m"+"White Letters");
//   System.out.println((char)27+"[31m"+"Red Letters");
//   System.out.println((char)27+"[32m"+"Green Letters");
//   System.out.println((char)27+"[33m"+"Yellow Letters");
//   System.out.println((char)27+"[34m"+"Blue Letters");
//   System.out.println((char)27+"[35m"+"Purple Letters");
//   System.out.println((char)27+"[36m"+"Teal Letters");
//   System.out.println((char)27+"[37m"+"Grey Letters");
//
//   System.out.println((char)27+"[40m"+"White Highlight");
//   System.out.println((char)27+"[41m"+"Red Highlight");
//   System.out.println((char)27+"[42m"+"Green Highlight");
//   System.out.println((char)27+"[43m"+"Yellow Highlight");
//   System.out.println((char)27+"[44m"+"Blue Highlight");
//   System.out.println((char)27+"[45m"+"Purple Highlight");
//   System.out.println((char)27+"[46m"+"Teal Highlight");
//   System.out.println((char)27+"[47m"+"Grey Light");
//
//   System.out.println((char)27+"[90m"+"Bright White Letters");
//   System.out.println((char)27+"[91m"+"Bright Red Letters");
//   System.out.println((char)27+"[92m"+"Bright Green Letters");
//   System.out.println((char)27+"[93m"+"Bright Yellow Letters");
//   System.out.println((char)27+"[94m"+"Bright Blue Letters");
//   System.out.println((char)27+"[95m"+"Bright Purple Letters");
//   System.out.println((char)27+"[96m"+"Bright Teal Letters");
//   System.out.println((char)27+"[97m"+"Bright Grey Letters");
//
//   System.out.println((char)27+"[40m"+"Bright White Highlight");
//   System.out.println((char)27+"[41m"+"Bright Red Highlight");
//   System.out.println((char)27+"[42m"+"Bright Green Highlight");
//   System.out.println((char)27+"[43m"+"Bright Yellow Highlight");
//   System.out.println((char)27+"[44m"+"Bright Blue Highlight");
//   System.out.println((char)27+"[45m"+"Bright Purple Highlight");
//   System.out.println((char)27+"[46m"+"Bright Teal Highlight");
//   System.out.println((char)27+"[47m"+"Bright Grey Light");


## Config IntelliJ

### Set Path Vars

Settings ([[Alt]] + [[F7]]) and then set up Scratch Dir and Console Dir- 

`C:\Users\andyt\.IntelliJIdea2018.2\config\scratches`
`C:\Users\andyt\.IntelliJIdea2018.2\config\consoles\jshell\`



