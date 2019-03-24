# Java Notes

- [Java Notes](#java-notes)
  - [Classes and Methods](#classes-and-methods)
    - [Method main](#method-main)
      - [Access Control](#access-control)
      - [modifiers](#modifiers)
    - [Constructors](#constructors)
    - [Subclass](#subclass)
    - [Inner Class](#inner-class)
      - [Nested Inner class](#nested-inner-class)
      - [Method Local inner classes](#method-local-inner-classes)
      - [Static nested classes](#static-nested-classes)
      - [Anonymous inner classes](#anonymous-inner-classes)
  - [Types](#types)
    - [Primitive types](#primitive-types)
  - [Operators](#operators)
  - [Type Operations](#type-operations)
    - [byte to char](#byte-to-char)
    - [Convert Char Array to String and back](#convert-char-array-to-string-and-back)
  - [IO Notes](#io-notes)
  - [System.in and System.out](#systemin-and-systemout)
  - [Reading and Writing Files](#reading-and-writing-files)
  - [Writing](#writing)
    - [As Text](#as-text)
    - [AsBytes](#asbytes)
    - [PrintStream](#printstream)
  - [File Reading](#file-reading)
    - [AsBytes](#asbytes-1)
  - [Coalesceing](#coalesceing)
  - [Exceptions](#exceptions)
    - [Class location](#class-location)
      - [Types and Causes](#types-and-causes)
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
  - [Graphs](#graphs)
  - [Error Translation](#error-translation)
    - [Syntax error on 'class', @ expected](#syntax-error-on-class--expected)


## Syntax

...

## Classes and Methods

### Method main

#### Access Control

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

#### modifiers

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

#### Coalesceing

If not null, the dinner = cage. getChicken(), if null get free range chicken.

```java

dinner = ((dinner = cage.getChicken()) != null) ? dinner : getFreeRangeChicken();

//or
dinner = Optional.ofNullable(cage.getChicken())
  .orElse(getFreerangeChicken());  //this method is discouraged

```

## Exceptions

### Class location

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

Multiple paths in a system property value are separated by the path separator character of the platform.

Note that even if the security manager does not permit the getProperties operation, it may choose to permit the getProperty(String) operation.

Implementation Note:
In addition to the standard system properties, the system properties may include the following keys:
Key Description of Associated Value

## Recursion

Recursive example 1

```java

import java.util.Scanner;

public class FibonacciSequence {
   /* Output the Fibonacci sequence step-by-step.
      Fibonacci sequence starts as:
      0 1 1 2 3 5 8 13 21 ... in which the first
      two numbers are 0 and 1 and each additional
      number is the sum of the previous two numbers
   */
   public static void computeFibonacci(int fibNum1, int fibNum2, int runCnt) {
      System.out.println(fibNum1 + " + " + fibNum2 + " = " + 
                         (fibNum1 + fibNum2));

      if (runCnt <= 1) { // Base case: Ran for user specified
                         // number of steps, do nothing
      }
      else {             // Recursive case: compute next value
         computeFibonacci(fibNum2, fibNum1 + fibNum2, runCnt - 1);
      }
   }

   public static void main(String[] args) {
      Scanner scnr = new Scanner(System.in);
      int runFor;     // User specified number of values computed

      // Output program description
      System.out.println("This program outputs the\n" +
                         "Fibonacci sequence step-by-step,\n" +
                         "starting after the first 0 and 1.\n");

      // Prompt user for number of values to compute
      System.out.print("How many steps would you like? ");
      runFor = scnr.nextInt();

      // Output first two Fibonacci values, call recursive function     
      System.out.println("0\n1");
      computeFibonacci(0, 1, runFor);
   }
}
```

andther example of the same:

```java

public class FibonacciSequence {
   public static int computeFibonacci(int N) {
      
      //System.out.println("FIXME: Complete this method.");
      //System.out.println("Currently just returns 0."); 
      if (N == 1 || N == 0){
         return N;
      } 
      //f(N) = f(N-1) + f(N-2)
      //0 1 2 3 5 8 11 
      if (N > 1){
         return (computeFibonacci(N-1) + computeFibonacci(N-2));
      }
      return 0;
   }

   public static void main(String[] args) {
      int N;      // F_N, starts at 0
      for (int i = 0; i<=10; i++){
         N=i;
      System.out.print("F_" + N + " is " + computeFibonacci(N) + "\t--");
      if (i%4==0) System.out.println();
      }
   }
}
```

Euclids Greatest Common Division Eq.

```java
import java.util.Scanner;

public class GCDCalc {
   /* Determine the greatest common divisor
      of two numbers, e.g. GCD(8, 12) = 4
   */
   public static int gcdCalculator(int inNum1, int inNum2) {
      int gcdVal;     // Holds GCD results

      if (inNum1 == inNum2) {   // Base case: Numbers are equal
         gcdVal = inNum1;       // Return value
      }
      else {                    // Recursive case: subtract smaller from larger
         if (inNum1 > inNum2) { // Call function with new values
            gcdVal = gcdCalculator(inNum1 - inNum2, inNum2);
         }
         else { // n1 is smaller
            gcdVal = gcdCalculator(inNum1, inNum2 - inNum1);
         }
      }

      return gcdVal;
   }
   
   public static void main (String[] args) {
      Scanner scnr = new Scanner(System.in);
      int gcdInput1;     // First input to GCD calc
      int gcdInput2;     // Second input to GCD calc
      int gcdOutput;     // Result of GCD
   
      // Print program function   
      System.out.println("This program outputs the greatest \n" + 
                         "common divisor of two numbers.");
              
      // Prompt user for input
      System.out.print("Enter first number: ");
      gcdInput1 = scnr.nextInt();
      
      System.out.print("Enter second number: ");
      gcdInput2 = scnr.nextInt();
       
      // Check user values are > 1, call recursive GCD function
      if ((gcdInput1 < 1) || (gcdInput2 < 1)) {
         System.out.println("Note: Neither value can be below 1.");
      }
      else {
         gcdOutput = gcdCalculator(gcdInput1, gcdInput2);
         System.out.println("Greatest common divisor = " +  gcdOutput);
      }
   }
}
```


power Val

```java
public class ExponentMethod {
   public static int raiseToPower(int baseVal, int exponentVal) {
      int resultVal;
      if (exponentVal == 0) {
         resultVal = 1;
      }
      else {
         resultVal = baseVal * raiseToPower(baseVal, exponentVal-1);
      }
      return resultVal;
   }

   public static void main (String [] args) {
      int userBase;
      int userExponent;
      userBase = 4;
      userExponent = 2;
      System.out.println(userBase + "^" + userExponent + " = "
        + raiseToPower(userBase, userExponent));
   }
}
```


Searching

```java
import java.util.Scanner;
import java.util.ArrayList;

public class NameFinder {
   /* Finds index of string in vector of strings, else -1.
      Searches only with index range low to high
      Note: Upper/lower case characters matter
   */
   public static int findMatch(ArrayList<String> stringList, String itemMatch,
                               int lowVal, int highVal, String indentAmt) { // indentAmt used for print debug
      int midVal;        // Midpoint of low and high values
      int itemPos;       // Position where item found, -1 if not found
      int rangeSize;     // Remaining range of values to search for match

      System.out.println(indentAmt + "Find() range " + lowVal + " " + highVal);
      rangeSize = (highVal - lowVal) + 1;
      midVal = (highVal + lowVal) / 2;

      if (itemMatch.equals(stringList.get(midVal))) {           // Base case 1: item found at midVal position
         System.out.println(indentAmt + "Found person.");
         itemPos = midVal;
      }
      else if (rangeSize == 1) {                                // Base case 2: match not found
         System.out.println(indentAmt + "Person not found.");
         itemPos = -1;
      }
      else {                                                    // Recursive case: search lower or upper half
         if (itemMatch.compareTo(stringList.get(midVal)) < 0) { // Search lower half, recursive call
            System.out.println(indentAmt + "Searching lower half.");
            itemPos = findMatch(stringList, itemMatch, lowVal, midVal, indentAmt + "   ");
         }
         else {                                                 // Search upper half, recursive call
            System.out.println(indentAmt + "Searching upper half.");
            itemPos = findMatch(stringList, itemMatch, midVal + 1, highVal, indentAmt + "   ");
         }
      }

      System.out.println(indentAmt + "Returning pos = " + itemPos + ".");
      return itemPos;
   }

   public static void main(String[] args) {
      Scanner scnr = new Scanner(System.in);
      ArrayList<String> attendeesList = new ArrayList<String>(); // List of attendees
      String attendeeName;                                       // Name of attendee to match
      int matchPos;                                              // Matched position in attendee list

      // Omitting part of program that adds attendees
      // Instead, we insert some sample attendees in sorted order
      attendeesList.add("Adams, Mary");
      attendeesList.add("Carver, Michael");
      attendeesList.add("Domer, Hugo");
      attendeesList.add("Fredericks, Carlos");
      attendeesList.add("Li, Jie");

      // Find "Aaron, Joe"
      attendeeName = "Aaron, Joe";

      // Call function to match name, output results
      matchPos = findMatch(attendeesList, attendeeName, 0, attendeesList.size() - 1, "   ");
      if (matchPos >= 0) {
         System.out.println("Found at position " + matchPos + ".");
      }
      else {
         System.out.println("Not found.");
      }
   }
}
```


Generics

```java

import java.util.ArrayList;

public class ShoppingSpreeCombinations {
   public static final int MAX_SHOPPING_BAG_SIZE = 3; // Max number of items in shopping bag

   /* Output every combination of items that fit
      in a shopping bag. Each recursive call moves
      one item into the shopping bag.
   */
   public static void shoppingBagCombinations(ArrayList<GroceryItem> currBag,          // Bag contents
                                              ArrayList<GroceryItem> remainingItems) { // Available items
      int bagValue;               // Cost of items in shopping bag
      GroceryItem tmpGroceryItem; // Grocery item to add to bag
      int i;                      // Loop index

      if (currBag.size() == MAX_SHOPPING_BAG_SIZE) {   // Base case: Shopping bag full
         bagValue = 0;
         for (i = 0; i < currBag.size(); ++i) {
            bagValue += currBag.get(i).priceDollars;
            System.out.print(currBag.get(i).itemName + "  ");
         }
         System.out.println("= $" + bagValue);
      }
      else {                                           // Recursive case: move one
         for (i = 0; i < remainingItems.size(); ++i) { // item to bag
            // Move item into bag
            tmpGroceryItem = remainingItems.get(i);
            remainingItems.remove(i);
            currBag.add(tmpGroceryItem);

            shoppingBagCombinations(currBag, remainingItems);

            // Take item out of bag
            remainingItems.add(i, tmpGroceryItem);
            currBag.remove(currBag.size() - 1);
         }
      }
   }

   public static void main(String[] args) {
      ArrayList<GroceryItem> possibleItems = new ArrayList<GroceryItem>(); // Possible shopping items
      ArrayList<GroceryItem> shoppingBag = new ArrayList<GroceryItem>();   // Current shopping bag
      GroceryItem tmpGroceryItem;                                          // Temp item

      // Populate grocery with different items
      tmpGroceryItem = new GroceryItem();
      tmpGroceryItem.itemName = "Milk";
      tmpGroceryItem.priceDollars = 2;
      possibleItems.add(tmpGroceryItem);

      tmpGroceryItem = new GroceryItem();
      tmpGroceryItem.itemName = "Belt";
      tmpGroceryItem.priceDollars = 24;
      possibleItems.add(tmpGroceryItem);

      tmpGroceryItem = new GroceryItem();
      tmpGroceryItem.itemName = "Toys";
      tmpGroceryItem.priceDollars = 19;
      possibleItems.add(tmpGroceryItem);

      tmpGroceryItem = new GroceryItem();
      tmpGroceryItem.itemName = "Cups";
      tmpGroceryItem.priceDollars = 12;
      possibleItems.add(tmpGroceryItem);

      // Try different combinations of three items
      shoppingBagCombinations(shoppingBag, possibleItems);
   }
}

//-------------------------file
public class GroceryItem {
   public String itemName;  // Name of item
   public int priceDollars; // Price of item
}

```


Traveling Salesman Problem

```java
import java.util.ArrayList;

public class TravelingSalesmanPaths {
   public static final int NUM_CITIES = 3;                                // Number of cities
   public static int[][] cityDistances = new int[NUM_CITIES][NUM_CITIES]; // Distance between cities
   public static String[] cityNames = new String[NUM_CITIES];             // City names

   /* Output every possible travel path. 
      Each recursive call moves to a new city.
   */
   public static void travelPaths(ArrayList<Integer> currPath, 
                                  ArrayList<Integer> needToVisit) {
      int totalDist;     // Total distance given current path
      int tmpCity;       // Next city distance
      int i;             // Loop index

      if ( currPath.size() == NUM_CITIES ) { // Base case: Visited all cities
         totalDist = 0;                      // Return total path distance
         for (i = 0; i < currPath.size(); ++i) {
            System.out.print(cityNames[currPath.get(i)] + "   ");

            if (i > 0) {
               totalDist += cityDistances[currPath.get(i - 1)][currPath.get(i)];
            }
         }

         System.out.println("= " + totalDist);
      }
      else {                                 // Recursive case: pick next city
         for (i = 0; i < needToVisit.size(); ++i) {
            // add city to travel path
            tmpCity = needToVisit.get(i);
            needToVisit.remove(i);
            currPath.add(tmpCity);

            travelPaths(currPath, needToVisit);

            // remove city from travel path
            needToVisit.add(i, tmpCity);
            currPath.remove(currPath.size() - 1);
         }
      }
   }   
   
   public static void main (String[] args) {
      ArrayList<Integer> needToVisit = new ArrayList<Integer>(); // Cities left to visit
      ArrayList<Integer> currPath = new ArrayList<Integer>();    // Current path traveled
      
      // Initialize distances array
      cityDistances[0][0] = 0;
      cityDistances[0][1] = 960;  // Boston-Chicago
      cityDistances[0][2] = 2960; // Boston-Los Angeles
      cityDistances[1][0] = 960;  // Chicago-Boston
      cityDistances[1][1] = 0;
      cityDistances[1][2] = 2011; // Chicago-Los Angeles
      cityDistances[2][0] = 2960; // Los Angeles-Boston
      cityDistances[2][1] = 2011; // Los Angeles-Chicago
      cityDistances[2][2] = 0;
      
      cityNames[0] = "Boston";
      cityNames[1] = "Chicago";
      cityNames[2] = "Los Angeles";
      
      needToVisit.add(new Integer(0)); // Boston
      needToVisit.add(new Integer(1)); // Chicago
      needToVisit.add(new Integer(2)); // Los Angeles
      
      // Explore different paths   
      travelPaths(currPath, needToVisit);
   }
}
 ```

 binary search

 When the low and high indices are equal, the list has 1 item to search. If the 1 item doesn't match the key, then BinarySearch makes a recursive call with a low argument greater than the high argument.                                                                                                                                                                 

 ```java

 BinarySearch(numbers, low, high, key) {
  if (low > high)
     return -1

  mid = (low + high) / 2
  if (numbers[mid] < key) {
     return BinarySearch(numbers, mid + 1, high, key)
  }
  else if (numbers[mid] > key) {
     return BinarySearch(numbers, low, mid - 1, key)
  }
  return mid
}
```


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