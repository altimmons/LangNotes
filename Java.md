# Java Notes

- [Java Notes](#java-notes)
  - [Syntax](#syntax)
  - [Maven](#maven)
  - [Other Java Ext](#other-java-ext)
    - [SDKMAN!](#sdkman)
    - [Comments](#comments)
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
        - [continue](#continue)
      - [Switch (Case)](#switch-case)
  - [IO Notes](#io-notes)
    - [System.in and System.out](#systemin-and-systemout)
    - [Reading and Writing Files](#reading-and-writing-files)
    - [Reading and Writing for Badasses](#reading-and-writing-for-badasses)
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

## Standard Directory Layout
| LOCATION           | CONTENTS                                                                   |
| ------------------ | -------------------------------------------------------------------------- |
| src/main/java      | Application/Library sources                                                |
| src/main/resources | Application/Library resources                                              |
| src/main/filters   | Resource filter files                                                      |
| src/main/webapp    | Web application sources                                                    |
| src/test/java      | Test sources                                                               |
| src/test/resources | Test resources                                                             |
| src/test/filters   | Test resource filter files                                                 |
| src/it             | Integration Tests (primarily for plugins)                                  |
| src/assembly       | Assembly descriptors                                                       |
| src/site           | Site                                                                       |
| LICENSE.txt        | Project's license                                                          |
| NOTICE.txt         | Notices and attributions required by libraries that the project depends on |
| README.txt         | Project's readme                                                           |

## JavaDoc

[Tools Reference (JDK 8)](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/toc.html)
[JDK 12 Tools Ref](https://docs.oracle.com/en/java/javase/12/tools/tools-and-command-reference.html)
[JDK 12 Javadoc Guide](https://www.oracle.com/pls/topic/lookup?ctx=javase12&id=JSJAV-GUID-7A344353-3BBF-45C4-8B28-15025DDCC643)\
[JDK 12 Main Doc Page](https://docs.oracle.com/en/java/javase/12/)


Syntax - block comment with two stars instead of one.

      /**
      * etc
      */

Uses tags


    Tag	Introduced in JDK/SDK
    @author	1.0
    {@code}	1.5
    {@docRoot}	1.3
    @deprecated	1.0
    @exception	1.0
    {@inheritDoc}	1.4
    {@link}	1.2
    {@linkplain}	1.4
    {@literal}	1.5
    @param	1.0
    @return	1.0
    @see	1.0
    @serial	1.2
    @serialData	1.2
    @serialField	1.2
    @since	1.1
    @throws	1.2
    {@value}	1.4
    @version	1.0

## Maven

In vsCode

Start maven project

```bash
$#I had more luck in WSL than cmd
mvn archetype:generate
$# millions of options zip by- try:
maven-archetype-simple
de.tebros:simple-maven-archetype (This is a archetype for a simple maven project with JUnit 5 and Log4j 2)
org.apache.maven.archetypes:maven-archetype-quickstart (An archetype which contains a sample Maven project.)51
```
groupid -> edu.datastructures
artifactId -> (becomes the root folder)
pakage-> becomes a package within


Value for **groupId:** This serves as the group identifier of your Maven project, it should be in a form similar to Java packages, such as org.example.learnlib
Value for **artifactId:** This serves as the group-local identifier of your Maven project. It should be in a very simple, all-lowercase form, such as my-project.
Value for **version:** The (initial) version of your project. The default is 1.0-SNAPSHOT.
Value for **package:** The name of your root package. The default is the groupId you entered before.

        Define value for property 'groupId': : org.example.learnlib
        Define value for property 'artifactId': : my-project
        Define value for property 'version':  1.0-SNAPSHOT: :
        Define value for property 'package':  org.example.learnlib: :
        [INFO] Using property: learnlibVersion = 0.13.1
        Confirm properties configuration:
        groupId: org.example
        artifactId: my-project
        version: 1.0-SNAPSHOT
        package: org.example
        learnlibVersion: 0.13.1
        Y: :

### POM

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>edu.datastruc</groupId>
  <artifactId>p3_huffman</artifactId>
  <version>1.0-SNAPSHOT</version>

  <name>p3_huffman</name>
  <description>Huffman Encoder app</description>
  <!-- FIXME change it to the project's website -->
  <url>http://www.jhu.edu/or/something</url>

  <properties>
        <!-- java version  -->
    <maven.compiler.target>1.7</maven.compiler.target>
    <!-- variables -->
  </properties>

<dependencies>
<dependency>
    <!-- groupid -->
    <groupId>commons-cli</groupId>
    <!-- artifact id -->
    <artifactId>commons-cli</artifactId>
    <!-- version -->
    <version>1.4</version>
    <!-- can also reference a property with '${prop.name} -->
            <scope>compile</scope>
            <scope>test</scope>
</dependency>
</dependencies>
```

#### JUnit

[Documentation](https://junit.org/junit5/docs/current/user-guide/index.pdf)

```xml
  <dependencies>
  <!-- start cut and paste -->
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>${junit.jupiter.version}</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-engine</artifactId>
        <version>${junit.jupiter.version}</version>
        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-commons -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-commons</artifactId>
        <version>1.5.1</version>
    </dependency>

    <!-- end cut and pase -->
</dependencies>
```
- `@Test` -  Denotes that a method is a test method. Unlike JUnit 4’s @Test annotation, this annotation does not declare any attributes, since test extensions in JUnit Jupiter operate based on their own dedicated annotations. Such methods are inherited unless they are overridden.
- `@ParameterizedTest` -  Denotes that a method is a parameterized test. Such methods are inherited unless they are overridden.
- `@RepeatedTest` -  Denotes that a method is a test template for a repeated test. Such methods are inherited unless they are overridden.
- `@TestFactory` -  Denotes that a method is a test factory for dynamic tests. Such methods are inherited unless they are overridden.
- `@TestTemplate` -  Denotes that a method is a template for test cases designed to be invoked multiple times depending on the number of invocation contexts returned by the registered providers. Such methods are inherited unless they are overridden.
- `@TestMethodOrder` -  Used to configure the test method execution order for the annotated test class; similar to JUnit 4’s @FixMethodOrder. Such annotations are inherited.
- `@TestInstance` -  Used to configure the test instance lifecycle for the annotated test class. Such annotations are inherited.
- `@DisplayName` -  Declares a custom display name for the test class or test method. Such annotations are not inherited.
- `@DisplayNameGeneration` -  Declares a custom display name generator for the test class. Such annotations are inherited.
- `@BeforeEach` -  Denotes that the annotated method should be executed before each @Test, @RepeatedTest, @ParameterizedTest, or @TestFactory method in the current class;analogous to JUnit 4’s @Before. Such methods are inherited unless they are overridden.
- `@AfterEach` -  Denotes that the annotated method should be executed after each @Test, @RepeatedTest, @ParameterizedTest, or @TestFactory method in the current class; analogous to JUnit 4’s @After. Such methods are inherited unless they are overridden.
- `@BeforeAll` -  Denotes that the annotated method should be executed before all @Test, @RepeatedTest, @ParameterizedTest, and @TestFactory methods in the current class; analogous to JUnit 4’s @BeforeClass. Such methods are inherited (unless they are hidden or overridden) and must be static (unless the "per-class" test instance lifecycle is used).
- `@AfterAll` -  Denotes that the annotated method should be executed after all @Test, @RepeatedTest, @ParameterizedTest, and @TestFactory methods in the current class; analogous to JUnit 4’s @AfterClass. Such methods are inherited (unless they are hidden or overridden) and must be static (unless the "per-class" test instance lifecycle is used).
- `@Nested` -  Denotes that the annotated class is a non-static nested test class. @BeforeAll and @AfterAll methods cannot be used directly in a @Nested test class unless the "per-class" test instance lifecycle is used. Such annotations are not inherited.
- `@Tag` -  Used to declare tags for filtering tests, either at the class or method level; analogous to test groups in TestNG or Categories in JUnit 4. Such annotations are inherited at the class level but not at the method level.
- `@Disabled` -  Used to disable a test class or test method; analogous to JUnit 4’s @Ignore. Such annotations are not inherited.
- `@Timeout` -  Used to fail a test, test factory, test template, or lifecycle method if its execution exceeds a given duration. Such annotations are inherited.
- `@ExtendWith` -  Used to register extensions declaratively. Such annotations are inherited. @RegisterExtension Used to register extensions programmatically via fields. Such fields are inherited unless they are shadowed.
- `@TempDir` -  Used to supply a temporary directory via field injection or parameter injection in a lifecycle method or test method; located in the org.junit.jupiter.api.io package.


### Maven Lifecycle Stages

- validate - validate the project is correct and all necessary information is available
- compile - compile the source code of the project
- test - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
- package - take the compiled code and package it in its distributable format, such as a JAR.
- verify - run any checks on results of integration tests to ensure quality criteria are met
- install - install the package into the local repository, for use as a dependency in other projects locally
- deploy - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects

- `validate` -
- `initialize` -
- `generate-sources` -
- `process-sources` -
- `generate-resources` -
- `process-resources` -
- `compile` -
- `process-classes` -
- `generate-test-sources` -
- `process-test-sources` -
- `generate-test-resources` -
- `process-test-resources` -
- `test-compile` -
- `process-test-classes` -
- `test` -
- `prepare-package` -
- `package` -
- `pre-integration-test` -
- `integration-test` -
- `post-integration-test` -
- `verify` -
- `install` -
- `deploy` -
- `pre-clean` -
- `clean` -
- `post-clean` -
- `pre-site` -
- `site` -
- `post-site` -
- `site-deploy` -


## Other Java Ext

- Ant
- Gradle
- Ivy
- Antlr
- Junit4
- Jython
- Groovy


### SDKMAN!

(The Software Development Kit Manager)

        $curl -s get.sdkman.io | bash

### Comments

`//` marks a comment

`/* */` marks multiline comments

`/**...*...*/` marks javadoc

`#region` and `#endregion` marks regions.

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
[Java Array Doc ](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/arrays.html)
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
```


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


### Singleton Class

a singleton class is a class that
- can have only one object (an instance of the class) at a time.
- if we try to instantiate the Singleton class, the new variable also points to the first instance created.
- whatever modifications we do to any variable inside the class through any instance, it affects the variable of the single instance everywhere

!!!faq Static and Singleton Sound very similar. - From[ Stack Exchange](https://stackoverflow.com/questions/519520/difference-between-static-class-and-singleton-pattern):
        The big difference between a singleton and a bunch of static methods is that **singletons can implement interfaces (or derive from useful base classes,** although that's less common, in my experience), so you can pass around the singleton as if it were "just another" implementation.

    And also [here](https://bytes.com/topic/c-sharp/answers/271199-diff-between-singleton-class-static-class#post1084937):

        A singleton allows access to a single created instance - that instance (or rather, a reference to that instance) can be passed as a parameter to other methods, and treated as a normal object.

        A static class allows only static methods.


**Normal class** vs **Singleton class:** Difference in normal and singleton class in terms of instantiation is that, For normal class we use constructor, whereas for singleton class we use `getInstance()` method (Example code:I). In general, to avoid confusion we may also use the class name as method name while defining this method

**Eager initialization:**  simplest method.

- object of class is created when it is loaded to the memory by JVM by assigning the reference an instance directly.
- It can be used when program will always use instance of this class, or *the cost of creating the instance is not too large in terms of resources and time*
- instance of class is created always, whether it is required or not.
- Exception handling is not possible.

```java
public class GFG {  // Eager Initialization //
    // public instance initialized when loading the class
    public static GFG instance = new GFG();

    private GFG()
    {
        // private constructor
    }
}
```

**Using static block:** This is also a *sub part of Eager initialization*. The only difference is object is created in a static block so that we can have access on its creation, like exception handling. In this way also, object is created at the time of class loading.

It can be used when there is a chance of exceptions in creating object with eager initialization.

```java
public class GFG { // Using Static block
    // public instance
    public static GFG instance;

    private GFG(){
        // private constructor
    }

    static{  //I added static
        // static block to initialize instance
        instance = new GFG();
    }
}
```

**Lazy initialization:** In this method, object is created only if it is needed.

- An implementation of getInstance() method is required which return the instance.
- There is a null check that if object is not created then create, otherwise return previously created.
- To **make sure that class cannot be instantiated in any other way, constructor is made final.** As object is created with in a method, it ensures that object will not be created until and unless it is required. Instance is kept private so that no one can access it directly.
- It can be used in a single threaded environment because multiple threads can break singleton property because they can access get instance method simultaneously and create multiple objects.

```java
public class GFG { // With Lazy initialization
// private instance, can only be accessed by getInstance() method
private static GFG instance;

    private GFG(){
        // private constructor
    }

    public static GFG getInstance() { //method to ret inst of class
        if (instance == null) {
        // if instance is null, initialize
            instance = new GFG();
        }
        return instance;
    }
}
```

**Thread Safe Singleton:** A thread safe singleton in created so that singleton property is maintained even in multithreaded environment. To make a singleton class thread-safe, getInstance() method is made synchronized so that multiple threads can’t access it simultaneously.

```java
// Thread Safe  Singleton class
public class GFG {
// private instance, can only be accessed by getInstance() method
    private static GFG instance;

    private GFG() {
        // private constructor
    }

    //synchronized method to control simultaneous access
    synchronized public static GFG getInstance() {
        if (instance == null) {
            // if instance is null, initialize
            instance = new GFG();
        }
        return instance;
    }
}
```

**Lazy initialization with Double check locking:** In this mechanism, we overcome the overhead problem of synchronized code. In this method, getInstance is not synchronized but the block which creates instance is synchronized so that minimum number of threads have to wait and that’s only for first time.
// Java code to explain double check locking
public class GFG
{
// private instance, so that it can be
// accessed by only by getInstance() method
private static GFG instance;

private GFG()
{
	// private constructor
}

public static GFG getInstance()
{
	if (instance == null)
	{
	//synchronized block to remove overhead
	synchronized (GFG.class)
	{
		if(instance==null)
		{
		// if instance is null, initialize
		instance = new GFG();
		}

	}
	}
	return instance;
}
}
Bill Pugh Singleton Implementation: Prior to Java5, memory model had a lot of issues and above methods caused failure in certain scenarios in multithreaded environment. So, Bill Pugh suggested a concept of inner static classes to use for singleton.
// Java code for Bill Pugh Singleton Implementaion
public class GFG
{

private GFG()
{
	// private constructor
}

// Inner class to provide instance of class
private static class BillPughSingleton
{
	private static final GFG INSTANCE = new GFG();
}

public static GFG getInstance()
{
	return BillPughSingleton.INSTANCE;
}
}


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

## RegEx -Java Style

[Doc on Matcher](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/regex/Matcher.html)

No.	Character Class	Description
[abc]	a, b, or c (simple class)
[^abc]	Any character except a, b, or c (negation)
[a-zA-Z]	a through z or A through Z, inclusive (range)
[a-d[m-p]]	a through d, or m through p: [a-dm-p] (union)
[a-z&&[def]]	d, e, or f (intersection)
[a-z&&[^bc]]	a through z, except for b and c: [ad-z] (subtraction)
[a-z&&[^m-p]]	a through z, and not m through p: [a-lq-z](subtraction)


Regex	Description
X?	X occurs once or not at all
X+	X occurs once or more times
X*	X occurs zero or more times
X{n}	X occurs n times only
X{n,}	X occurs n or more times
X{y,z}	X occurs at least y times but less than z times

.	Any character (may or may not match terminator)
\d	Any digits, short of [0-9]
\D	Any non-digit, short for [^0-9]
\s	Any whitespace character, short for [\t\n\x0B\f\r]
\S	Any non-whitespace character, short for [^\s]
\w	Any word character, short for [a-zA-Z_0-9]
\W	Any non-word character, short for [^\w]
\b	A word boundary
\B	A non word boundary

!!!: Its confusing using this method - below is actually a pretty good example.  You call a pattern and create it.  then you give it a pattern. (pattern.compile(xx)) then you can keep going anonymously (like 2) or break it out and make it.



```java
  import java.util.regex.*;
  public class RegexExample1{
      public static void main(String args[]){
          //1st way
          Pattern p = Pattern.compile(".s");//. represents single character
          Matcher m = p.matcher("as");
          boolean b = m.matches();

          //2nd way
          boolean b2=Pattern.compile(".s").matcher("as").matches();

          //3rd way
          boolean b3 = Pattern.matches(".s", "as");

          System.out.println(b+" "+b2+" "+b3);

      }
  }
        Pattern pRegEx =
        Pattern.compile("([A-Za-z])([\\s]*?)([\\W\\S])([\\s]*?)([\\d]{1,2})");
  #Method 1
          if(pRegEx.matcher(inputString).matches()){
              pRegEx.matcher(inputString).group(1)= x
              pRegEx.matcher(inputString).group(4)= y

          Matcher match =  pRegEx.matcher(inputString);
          if(match.matches()){
              match.group(1)= x
              match.group(4)= y
```

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

Interesting twist on the for loop (from java.util.treemap)

```
public boolean containsValue(Object value) {
    for (Entry<K,V> e = getFirstEntry(); e != null; e = successor(e))
        if (valEquals(value, e.value))
            return true;
    return false;
}
```

#### Collections

Works with any collection- Emnums, Arrays, etc.
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
[Iterating over Enums](https://www.baeldung.com/java-enum-iteration)


Iterate Using java.util.stream: Iteration over enum can also be done using java.util.stream class. Create the stream of enum.values() using Stream.of() method by passing eum.values() at parameter to function.
Below program illustrate the iteration over enum using java.util.stream:

##### break

The break statement has two forms: labeled and unlabeled.

The unlabeled form is below in the `switch` statement.

You can also use an unlabeled break to terminate a `for`, `while`, or `do-while` loop

       for (i = 0; i < arrayOfInts.length; i++) {
            if (arrayOfInts[i] == searchfor) {
                foundIt = true;
                break;
            }
        }

The break statement, shown in boldface, terminates the for loop when that value is found. Control flow then transfers **to the statement after the for loop**.

 a labeled break terminates the outer for loop (labeled "search"):

 ```java

 search:
    for (int a : arrayA){
        for ( int b : arrayB ){
            //codee
            break search;
        }
    }
```
The `break` statement terminates the labeled statement; *it does not transfer the flow of control to the label*. Control flow is transferred to the *statement immediately following the labeled (terminated) statement*.

##### continue

The `continue` statement skips the current iteration of a `for`, `while` , or `do-while` loop. The unlabeled form skips to the end of the innermost loop's body and evaluates the boolean expression that controls the loop.

A _labeled_ `continue` statement skips the current iteration of an outer loop marked with the given label.

```java
class ContinueWithLabelDemo {
    public static void main(String[] args) {

        String searchMe = "Look for a substring in me";
        String substring = "sub";
        boolean foundIt = false;

        int max = searchMe.length() -
                  substring.length();

    test:
        for (int i = 0; i <= max; i++) {
            int n = substring.length();
            int j = i;
            int k = 0;
            while (n-- != 0) {
                if (searchMe.charAt(j++) != substring.charAt(k++)) {
                    continue test;
                }
            }
            foundIt = true;
                break test;
        }
        System.out.println(foundIt ? "Found it" : "Didn't find it");
    }
}
```

Without the label, only the inner loop would terminate.  Labeled- the other loop is able to be called to skip.



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


All are the following ways to declare a logger- the global logger.


```Java
private final static Logger LOGGER = Logger.getLogger( "" );
private final static Logger LOGGER = Logger.getLogger( LogMan.class.getName() );
private final static Logger LOGGER = Logger.getLogger( Logger.GLOBAL_LOGGER_NAME );
```

```java
public static void setup(){

  //removes default settings for the root logger
  LogManager.getLogManager().reset();
  LOGGER.setLevel( Level.ALL );


  //Setup the console handler
  ConsoleHandler ch = new ConsoleHandler();
  ch.setLevel( LogMan.INIT_CONSOLE_LEVEL );
  LOGGER.addHandler( ch );


  //Setup a file handler
  try{
    FileHandler fh = new FileHandler(LogMan.strLogFileName);
    fh.setLevel( LogMan.INIT_FILE_LEVEL );
    SimpleFormatter.format=  ;
    LOGGER.addHandler( fh );

  }catch( IOException e ){
    String absPath = Paths.get(LogMan.strLogFileName).toFile().getAbsolutePath();
    LOGGER.severe( "IOException starting log file. " +
        absPath + " is not accessible.");
  }

}
```








Format the given LogRecord.

Format the given LogRecord.

The formatting can be customized by specifying the format string in the [`java.util.logging.SimpleFormatter.format`](#formatting) property. The given `LogRecord` will be formatted as if by calling:

```java
   String.format(format, date, source, logger, level, message, thrown)
```
where the arguments are:

1.  `format` - the format string specified in the `java.util.logging.SimpleFormatter.format` property or the default format.
2.  `date` - a `ZonedDateTime` "class in java.time" object representing event time (LogRecord.html#getInstant()) of the log record in the `ZoneId.systemDefault()` (ZoneId.html#systemDefault()) system time zone.
3.  `source` - a string representing the caller, if available; otherwise, the logger's name.
4.  `logger` - the logger's name.
5.  `level` - the log level.
6.  `message` - the formatted log message returned from the `Formatter.formatMessage(LogRecord)` method. It uses `java.text` class in java.text formatting and does not use the `java.util.Formatter format` argument.
6.  `thrown` - a string representing the [throwable](LogRecord.html#getThrown()) associated with the log record and its backtrace beginning with a newline character, if any; otherwise, an empty string.
Some example formats:

```java
java.util.logging.SimpleFormatter.format="%4$s: %5$s [%1$tc]%n"
```

This prints 1 line with the log level `(4$)`, the log message `(5$)` and the timestamp `(1$)` in a square bracket.

     WARNING: warning message [Tue Mar 22 13:11:31 PDT 2011]


```java.md
java.util.logging.SimpleFormatter.format="%1$tc %2$s%n%4$s: %5$s%6$s%n"
```
This prints 2 lines where:
- the first line includes the timestamp `(1$)` `%1$tc`
- the source `(2$)` `%2$s%`
- the second line includes the log level `(4$)` `%n%4$s:`
- the log message `(5$)` `%5$s`
- followed with the throwable and its backtrace `(6$)` `%6$s%n`, if any:

        Tue Mar 22 13:11:31 PDT 2011 MyClass fatal
        SEVERE: several message with an exception
        java.lang.IllegalArgumentException: invalid argument
                at MyClass.mash(MyClass.java:9)
                at MyClass.crunch(MyClass.java:6)
                at MyClass.main(MyClass.java:3)

```java
java.util.logging.SimpleFormatter.format="%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS %1$Tp %2$s%n%4$s: %5$s%n"
```


This prints 2 lines similar to the example above with a different date/time formatting and does not print the throwable and its backtrace:

     Mar 22, 2011 1:11:31 PM MyClass fatal
     SEVERE: several message with an exception

java.util.logging.SimpleFormatter.format="%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS.%1$tN %1$Tp %2$s%n%4$s: %5$s%6$s%n"
Since JDK 9, java.util.logging uses java.time to create more precise time stamps. The format above can be used to add a .%1$tN to the date/time formatting so that nanoseconds will also be printed:

     Feb 06, 2015 5:33:10.279216000 PM example.Main main
     INFO: This is a test

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
- ParseException #takes (String, int) as message, parse location
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

## Lambda Methods

### java.util.function Package

The java.util.function package in Java 8 contains many builtin functional interfaces like-

**_Predicate:_** The Predicate interface has an abstract method test which gives a Boolean value as a result for the specified argument. Its prototype is

        public Predicate
        {
        public boolean test(T  t);
        }

_**BinaryOperator:**_ The BinaryOperator interface has an abstract method apply which takes two argument and returns a result of same type. Its prototype is

        public interface BinaryOperator
        {
            public T apply(T x, T y);
        }

_**Function:**_ The Function interface has an abstract method apply which takes argument of type T and returns a result of type R. Its prototype is

        public interface Function
        {
        public R apply(T t);
        }

```java

// A simple program to demonstrate the use
// of predicate interface
import java.util.*;
import java.util.function.Predicate;

class Test
{
    public static void main(String args[])
    {

        // create a list of strings
        List<String> names =
            Arrays.asList("Geek","GeeksQuiz","g1","QA","Geek2");

        // declare the predicate type as string and use
        // lambda expression to create object
        Predicate<String> p = (s)->s.startsWith("G");

        // Iterate through the list
        for (String st:names)
        {
            // call the test method
            if (p.test(st))
                System.out.println(st);
        }
    }
}
```

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



## Appendix

### POM JUnit

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>edu.datastruc</groupId>
  <artifactId>p3_huffman</artifactId>
  <version>1.0-SNAPSHOT</version>

  <name>p3_huffman</name>
  <description>Huffman Encoder app</description>
  <!-- FIXME change it to the project's website -->
  <url>http://www.jhu.edu/or/something</url>

  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <!-- java version  -->
    <maven.compiler.source>11</maven.compiler.source>
    <maven.compiler.target>11</maven.compiler.target>
    <junit.jupiter.version>5.5.1</junit.jupiter.version>
    <junit.platform.version>1.5.1</junit.platform.version>
  </properties>
  <dependencies>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>${junit.jupiter.version}</version>
        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-engine -->
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-engine</artifactId>
        <version>${junit.jupiter.version}</version>
        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-params -->
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-params</artifactId>
        <version>${junit.jupiter.version}</version>

        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter -->
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter</artifactId>
        <version>${junit.jupiter.version}</version>

        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/commons-cli/commons-cli -->
    <dependency>
        <groupId>commons-cli</groupId>
        <artifactId>commons-cli</artifactId>
        <version>1.4</version>
        <scope>compile</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-launcher -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-launcher</artifactId>
        <version>${junit.platform.version}</version>

        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-engine -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-engine</artifactId>
        <version>${junit.platform.version}</version>

        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-runner -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-runner</artifactId>
        <version>${junit.platform.version}</version>

        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-suite-api -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-suite-api</artifactId>
        <version>${junit.platform.version}</version>

        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-commons -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-commons</artifactId>
        <version>${junit.platform.version}</version>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-surefire-provider -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-surefire-provider</artifactId>
        <version>1.3.2</version>
        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-console -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-console</artifactId>
        <version>${junit.platform.version}</version>
        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-console-standalone -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-console-standalone</artifactId>
        <version>${junit.platform.version}</version>
        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-testkit -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-testkit</artifactId>
        <version>${junit.platform.version}</version>
        <scope>test</scope>
    </dependency>
    <!-- https://mvnrepository.com/artifact/org.junit.platform/junit-platform-reporting -->
    <dependency>
        <groupId>org.junit.platform</groupId>
        <artifactId>junit-platform-reporting</artifactId>
        <version>${junit.platform.version}</version>
    </dependency>

  </dependencies>
```


## Java Binaries

      jabswitch.exe
      jaccessinspector.exe -GUI
      jaccesswalker.exe -GUI
      jaotc.exe
      jar.exe
      jarsigner.exe
      java.exe
      javac.exe
      javadoc.exe
      javap.exe
      javaw.exe
      jcmd.exe
      jconsole.exe
      jdb.exe
      jdeprscan.exe
      jdeps.exe
      jhsdb.exe
      jimage.exe
      jinfo.exe
      jjs.exe
      jlink.exe
      jmap.exe
      jmod.exe
      jps.exe
      jrunscript.exe
      jshell.exe
      jstack.exe
      jstat.exe
      jstatd.exe
      keytool.exe
      kinit.exe
      klist.exe
      ktab.exe
      pack200.exe
      rmic.exe
      rmid.exe
      rmiregistry.exe
      serialver.exe
      unpack200.exe



### Java.exe

help doc:

      Usage: java [options] <mainclass> [args...]
                 (to execute a class)
         or  java [options] -jar <jarfile> [args...]
                 (to execute a jar file)
         or  java [options] -m <module>[/<mainclass>] [args...]
             java [options] --module <module>[/<mainclass>] [args...]
                 (to execute the main class in a module)

       Arguments following the main class, -jar <jarfile>, -m or --module
       <module>/<mainclass> are passed as the arguments to main class.

       where options include:

          -cp <class search path of directories and zip/jar files>
          -classpath <class search path of directories and zip/jar files>
          --class-path <class search path of directories and zip/jar files>
                        A ; separated list of directories, JAR archives,
                        and ZIP archives to search for class files.
          -p <module path>
          --module-path <module path>...
                        A ; separated list of directories, each directory
                        is a directory of modules.
          --upgrade-module-path <module path>...
                        A ; separated list of directories, each directory
                        is a directory of modules that replace upgradeable
                        modules in the runtime image
          --add-modules <module name>[,<module name>...]
                        root modules to resolve in addition to the initial module.
                        <module name> can also be ALL-DEFAULT, ALL-SYSTEM,
                        ALL-MODULE-PATH.
          --list-modules
                        list observable modules and exit
          -d <module name>
          --describe-module <module name>
                        describe a module and exit
          --dry-run     create VM and load main class but do not execute main method.
                        The --dry-run option may be useful for validating the
                        command-line options such as the module system configuration.
          --validate-modules
                        validate all modules and exit
                        The --validate-modules option may be useful for finding
                        conflicts and other errors with modules on the module path.
          -D<name>=<value>
                        set a system property
          -verbose:[class|module|gc|jni]
                        enable verbose output
          -version      print product version to the error stream and exit
          --version     print product version to the output stream and exit
          -showversion  print product version to the error stream and continue
          --show-version
                        print product version to the output stream and continue
          --show-module-resolution
                        show module resolution output during startup
          -? -h -help
                        print this help message to the error stream
          --help        print this help message to the output stream
          -X            print help on extra options to the error stream
          --help-extra  print help on extra options to the output stream
          -ea[:<packagename>...|:<classname>]
          -enableassertions[:<packagename>...|:<classname>]
                        enable assertions with specified granularity
          -da[:<packagename>...|:<classname>]
          -disableassertions[:<packagename>...|:<classname>]
                        disable assertions with specified granularity
          -esa | -enablesystemassertions
                        enable system assertions
          -dsa | -disablesystemassertions
                        disable system assertions
          -agentlib:<libname>[=<options>]
                        load native agent library <libname>, e.g. -agentlib:jdwp
                        see also -agentlib:jdwp=help
          -agentpath:<pathname>[=<options>]
                        load native agent library by full pathname
          -javaagent:<jarpath>[=<options>]
                        load Java programming language agent, see java.lang.instrument
          -splash:<imagepath>
                        show splash screen with specified image
                        HiDPI scaled images are automatically supported and used
                        if available. The unscaled image filename, e.g. image.ext,
                        should always be passed as the argument to the -splash option.
                        The most appropriate scaled image provided will be picked up
                        automatically.
                        See the SplashScreen API documentation for more information
          @argument files
                        one or more argument files containing options
          -disable-@files
                        prevent further argument file expansion
      To specify an argument for a long option, you can use --<name>=<value> or
      --<name> <value>.


### javac.exe

      Usage: javac <options> <source files>
      where possible options include:
        @<filename>                  Read options and filenames from file
        -Akey[=value]                Options to pass to annotation processors
        --add-modules <module>(,<module>)*
              Root modules to resolve in addition to the initial modules, or all modules
              on the module path if <module> is ALL-MODULE-PATH.
        --boot-class-path <path>, -bootclasspath <path>
              Override location of bootstrap class files
        --class-path <path>, -classpath <path>, -cp <path>
              Specify where to find user class files and annotation processors
        -d <directory>               Specify where to place generated class files
        -deprecation
              Output source locations where deprecated APIs are used
        --enable-preview
              Enable preview language features. To be used in conjunction with either -source or --release.
        -encoding <encoding>         Specify character encoding used by source files
        -endorseddirs <dirs>         Override location of endorsed standards path
        -extdirs <dirs>              Override location of installed extensions
        -g                           Generate all debugging info
        -g:{lines,vars,source}       Generate only some debugging info
        -g:none                      Generate no debugging info
        -h <directory>
              Specify where to place generated native header files
        --help, -help, -?            Print this help message
        --help-extra, -X             Print help on extra options
        -implicit:{none,class}
              Specify whether or not to generate class files for implicitly referenced files
        -J<flag>                     Pass <flag> directly to the runtime system
        --limit-modules <module>(,<module>)*
              Limit the universe of observable modules
        --module <module-name>, -m <module-name>
              Compile only the specified module, check timestamps
        --module-path <path>, -p <path>
              Specify where to find application modules
        --module-source-path <module-source-path>
              Specify where to find input source files for multiple modules
        --module-version <version>
              Specify version of modules that are being compiled
        -nowarn                      Generate no warnings
        -parameters
              Generate metadata for reflection on method parameters
        -proc:{none,only}
              Control whether annotation processing and/or compilation is done.
        -processor <class1>[,<class2>,<class3>...]
              Names of the annotation processors to run; bypasses default discovery process
        --processor-module-path <path>
              Specify a module path where to find annotation processors
        --processor-path <path>, -processorpath <path>
              Specify where to find annotation processors
        -profile <profile>
              Check that API used is available in the specified profile
        --release <release>
              Compile for a specific VM version. Supported targets: 6, 7, 8, 9, 10, 11
        -s <directory>               Specify where to place generated source files
        -source <release>
              Provide source compatibility with specified release
        --source-path <path>, -sourcepath <path>
              Specify where to find input source files
        --system <jdk>|none          Override location of system modules
        -target <release>            Generate class files for specific VM version
        --upgrade-module-path <path>
              Override location of upgradeable modules
        -verbose                     Output messages about what the compiler is doing
        --version, -version          Version information
        -Werror                      Terminate compilation if warnings occur


### jar.exe


      Usage: jar [OPTION...] [ [--release VERSION] [-C dir] files] ...
      jar creates an archive for classes and resources, and can manipulate or
      restore individual classes or resources from an archive.

       Examples:
       # Create an archive called classes.jar with two class files:
       jar --create --file classes.jar Foo.class Bar.class
       # Create an archive using an existing manifest, with all the files in foo/:
       jar --create --file classes.jar --manifest mymanifest -C foo/ .
       # Create a modular jar archive, where the module descriptor is located in
       # classes/module-info.class:
       jar --create --file foo.jar --main-class com.foo.Main --module-version 1.0
           -C foo/ classes resources
       # Update an existing non-modular jar to a modular jar:
       jar --update --file foo.jar --main-class com.foo.Main --module-version 1.0
           -C foo/ module-info.class
       # Create a multi-release jar, placing some files in the META-INF/versions/9 directory:
       jar --create --file mr.jar -C foo classes --release 9 -C foo9 classes

      To shorten or simplify the jar command, you can specify arguments in a separate
      text file and pass it to the jar command with the at sign (@) as a prefix.

       Examples:
       # Read additional options and list of class files from the file classes.list
       jar --create --file my.jar @classes.list


       Main operation mode:

        -c, --create               Create the archive
        -i, --generate-index=FILE  Generate index information for the specified jar
                                   archives
        -t, --list                 List the table of contents for the archive
        -u, --update               Update an existing jar archive
        -x, --extract              Extract named (or all) files from the archive
        -d, --describe-module      Print the module descriptor, or automatic module name

       Operation modifiers valid in any mode:

        -C DIR                     Change to the specified directory and include the
                                   following file
        -f, --file=FILE            The archive file name. When omitted, either stdin or
                                   stdout is used based on the operation
            --release VERSION      Places all following files in a versioned directory
                                   of the jar (i.e. META-INF/versions/VERSION/)
        -v, --verbose              Generate verbose output on standard output

       Operation modifiers valid only in create and update mode:

        -e, --main-class=CLASSNAME The application entry point for stand-alone
                                   applications bundled into a modular, or executable,
                                   jar archive
        -m, --manifest=FILE        Include the manifest information from the given
                                   manifest file
        -M, --no-manifest          Do not create a manifest file for the entries
            --module-version=VERSION    The module version, when creating a modular
                                   jar, or updating a non-modular jar
            --hash-modules=PATTERN Compute and record the hashes of modules
                                   matched by the given pattern and that depend upon
                                   directly or indirectly on a modular jar being
                                   created or a non-modular jar being updated
        -p, --module-path          Location of module dependence for generating
                                   the hash

       Operation modifiers valid only in create, update, and generate-index mode:

        -0, --no-compress          Store only; use no ZIP compression

       Other options:

        -?, -h, --help[:compat]    Give this, or optionally the compatibility, help
            --help-extra           Give help on extra options
            --version              Print program version

       An archive is a modular jar if a module descriptor, 'module-info.class', is
       located in the root of the given directories, or the root of the jar archive
       itself. The following operations are only valid when creating a modular jar,
       or updating an existing non-modular jar: '--module-version',
       '--hash-modules', and '--module-path'.

       Mandatory or optional arguments to long options are also mandatory or optional
       for any corresponding short options.


       jabswitch [/enable | /disable | /version | /?]

       Description:
         jabswitch enables or disables the Java Access Bridge.

       Parameters:
         /enable   Enable the Java Accessibility Bridge.
         /disable  Disable the Java Accessibility Bridge.
         /version  Display the version.
         /?        Display this usage information.

       Note:
         The Java Access Bridge can also be enabled with the
         Windows Ease of Access control panel (which can be
         activated by pressing Windows + U).  The Ease of Access
         control panel has a Java Access Bridge checkbox.  Please
         be aware that unchecking the checkbox has no effect and
         in order to disable the Java Access Bridge you must run
         jabswitch.exe from the command line.

### jaotc

      Usage: jaotc <options> list

        list       A : separated list of class names, modules, jar files
                   or directories which contain class files.

      where options include:
        --output <file>            Output file name
        --class-name <class names> List of classes to compile
        --jar <jarfiles>           List of jar files to compile
        --module <modules>         List of modules to compile
        --directory <dirs>         List of directories where to search for files to compile
        --search-path <dirs>       List of directories where to search for specified files
        --compile-commands <file>  Name of file with compile commands
        --compile-for-tiered       Generate profiling code for tiered compilation
        --compile-with-assertions  Compile with java assertions
        --compile-threads <number> Number of compilation threads to be used
        --ignore-errors            Ignores all exceptions thrown during class loading
        --exit-on-error            Exit on compilation errors
        --info                     Print information during compilation
        --verbose                  Print verbose information
        --debug                    Print debug information
        -? -h --help               Print this help message
        --version                  Version information
        --linker-path              Full path to linker executable
        -J<flag>                   Pass <flag> directly to the runtime system

### jarsigner

      Usage: jarsigner [options] jar-file alias
             jarsigner -verify [options] jar-file [alias...]

      [-keystore <url>]           keystore location
      [-storepass <password>]     password for keystore integrity
      [-storetype <type>]         keystore type
      [-keypass <password>]       password for private key (if different)
      [-certchain <file>]         name of alternative certchain file
      [-sigfile <file>]           name of .SF/.DSA file
      [-signedjar <file>]         name of signed JAR file
      [-digestalg <algorithm>]    name of digest algorithm
      [-sigalg <algorithm>]       name of signature algorithm
      [-verify]                   verify a signed JAR file
      [-verbose[:suboptions]]     verbose output when signing/verifying.
                                  suboptions can be all, grouped or summary
      [-certs]                    display certificates when verbose and verifying
      [-tsa <url>]                location of the Timestamping Authority
      [-tsacert <alias>]          public key certificate for Timestamping Authority
      [-tsapolicyid <oid>]        TSAPolicyID for Timestamping Authority
      [-tsadigestalg <algorithm>] algorithm of digest data in timestamping request
      [-altsigner <class>]        class name of an alternative signing mechanism
                                  (This option has been deprecated.)
      [-altsignerpath <pathlist>] location of an alternative signing mechanism
                                  (This option has been deprecated.)
      [-internalsf]               include the .SF file inside the signature block
      [-sectionsonly]             don't compute hash of entire manifest
      [-protected]                keystore has protected authentication path
      [-providerName <name>]      provider name
      [-addprovider <name>        add security provider by name (e.g. SunPKCS11)
        [-providerArg <arg>]] ... configure argument for -addprovider
      [-providerClass <class>     add security provider by fully-qualified class name
        [-providerArg <arg>]] ... configure argument for -providerClass
      [-strict]                   treat warnings as errors
      [-conf <url>]               specify a pre-configured options file
      [-? -h --help]              Print this help message

### javadoc

[Documentation on JavaDoc (JDK v 1.6)](https://docs.oracle.com/javase/6/docs/technotes/tools/windows/javadoc.html#examples)

      Usage:
          javadoc [options] [packagenames] [sourcefiles] [@files]
      where options include:
          --add-modules <module>(,<module>)*
                        Root modules to resolve in addition to the initial modules,
                        or all modules on the module path if <module> is
                        ALL-MODULE-PATH.
          -bootclasspath <path>
                        Override location of platform class files used for non-modular
                        releases
          -breakiterator
                        Compute first sentence with BreakIterator
          --class-path <path>, -classpath <path>, -cp <path>
                        Specify where to find user class files
          -doclet <class>
                        Generate output via alternate doclet
          -docletpath <path>
                        Specify where to find doclet class files
          --enable-preview
                        Enable preview language features. To be used in conjunction with
                        either -source or --release.
          -encoding <name>
                        Source file encoding name
          -exclude <pkglist>
                        Specify a list of packages to exclude
          --expand-requires <value>
                        Instructs the tool to expand the set of modules to be
                        documented. By default, only the modules given explicitly on
                        the command line will be documented. A value of "transitive"
                        will additionally include all "requires transitive"
                        dependencies of those modules. A value of "all" will include
                        all dependencies of those modules.
          -extdirs <dirlist>
                        Override location of installed extensions
          --help, -help, -?, -h
                        Display command line options and exit
          --help-extra, -X
                        Print a synopsis of nonstandard options and exit
          -J<flag>      Pass <flag> directly to the runtime system
          --limit-modules <module>(,<module>)*
                        Limit the universe of observable modules
          -locale <name>
                        Locale to be used, e.g. en_US or en_US_WIN
          --module <module>(,<module>)*
                        Document the specified module(s)
          --module-path <path>, -p <path>
                        Specify where to find application modules
          --module-source-path <path>
                        Specify where to find input source files for multiple modules
          -package
                        Show package/protected/public types and members. For
                        named modules, show all packages and all module details.
          -private
                        Show all types and members. For named modules,
                        show all packages and all module details.
          -protected
                        Show protected/public types and members (default). For
                        named modules, show exported packages and the module's API.
          -public
                        Show only public types and members. For named modules,
                        show exported packages and the module's API.
          -quiet        Do not display status messages
          --release <release>
                        Provide source compatibility with specified release
          --show-members <value>
                        Specifies which members (fields, methods, etc.) will be
                        documented, where value can be one of "public", "protected",
                        "package" or "private". The default is "protected", which will
                        show public and protected members, "public" will show only
                        public members, "package" will show public, protected and
                        package members and "private" will show all members.
          --show-module-contents <value>
                        Specifies the documentation granularity of module
                        declarations. Possible values are "api" or "all".
          --show-packages <value>
                        Specifies which modules packages will be documented. Possible
                        values are "exported" or "all" packages.
          --show-types <value>
                        Specifies which types (classes, interfaces, etc.) will be
                        documented, where value can be one of "public", "protected",
                        "package" or "private". The default is "protected", which will
                        show public and protected types, "public" will show only
                        public types, "package" will show public, protected and
                        package types and "private" will show all types.
          -source <release>
                        Provide source compatibility with specified release
          --source-path <path>, -sourcepath <path>
                        Specify where to find source files
          -subpackages <subpkglist>
                        Specify subpackages to recursively load
          --system <jdk>
                        Override location of system modules used for modular releases
          --upgrade-module-path <path>
                        Override location of upgradeable modules
          -verbose      Output messages about what Javadoc is doing
          --version     Print version information

      Provided by the Standard doclet:
          --add-stylesheet <file>
                        Additional stylesheet file for the generated documentation
          --allow-script-in-comments
                        Allow JavaScript in options and comments
          -author       Include @author paragraphs
          -bottom <html-code>
                        Include bottom text for each page
          -charset <charset>
                        Charset for cross-platform viewing of generated documentation
          -d <directory>
                        Destination directory for output files
          -docencoding <name>
                        Specify the character encoding for the output
          -docfilessubdirs
                        Recursively copy doc-file subdirectories
          -doctitle <html-code>
                        Include title for the overview page
          -excludedocfilessubdir <name>:..
                        Exclude any doc-files subdirectories with given name
          -footer <html-code>
                        Include footer text for each page
          --frames      Enable the use of frames in the generated output
          -group <name> <g1>:<g2>...
                        Group specified elements together in overview page
          -header <html-code>
                        Include header text for each page
          -helpfile <file>
                        Include file that help link links to
          -html4        Generate HTML 4.01 output
          -html5        Generate HTML 5 output
          --javafx, -javafx
                        Enable JavaFX functionality
          -keywords     Include HTML meta tags with package, class and member info
          -link <url>   Create links to javadoc output at <url>
          -linkoffline <url1> <url2>
                        Link to docs at <url1> using package list at <url2>
          -linksource   Generate source in HTML
          --main-stylesheet <file>, -stylesheetfile <file>
                        File to change style of the generated documentation
          -nocomment    Suppress description and tags, generate only declarations
          -nodeprecated
                        Do not include @deprecated information
          -nodeprecatedlist
                        Do not generate deprecated list
          --no-frames   Disable the use of frames in the generated output (default)
          -nohelp       Do not generate help link
          -noindex      Do not generate index
          -nonavbar     Do not generate navigation bar
          -noqualifier <name1>:<name2>:..
                        Exclude the list of qualifiers from the output
          -nosince      Do not include @since information
          -notimestamp  Do not include hidden time stamp
          -notree       Do not generate class hierarchy
          --override-methods (detail|summary)
                        Document overridden methods in the detail or summary sections
          -overview <file>
                        Read overview documentation from HTML file
          -serialwarn   Generate warning about @serial tag
          -sourcetab <tab length>
                        Specify the number of spaces each tab takes up in the source
          -splitindex   Split index into one file per letter
          -tag <name>:<locations>:<header>
                        Specify single argument custom tags
          -taglet       The fully qualified name of Taglet to register
          -tagletpath   The path to Taglets
          -top <html-code>
                        Include top text for each page
          -use          Create class and package usage pages
          -version      Include @version paragraphs
          -windowtitle <text>
                        Browser window title for the documentation

      GNU-style options may use = instead of whitespace to separate the name of an
      option from its value.


### javap

      Usage: javap <options> <classes>
      where possible options include:
        -? -h --help -help               Print this help message
        -version                         Version information
        -v  -verbose                     Print additional information
        -l                               Print line number and local variable tables
        -public                          Show only public classes and members
        -protected                       Show protected/public classes and members
        -package                         Show package/protected/public classes
                                         and members (default)
        -p  -private                     Show all classes and members
        -c                               Disassemble the code
        -s                               Print internal type signatures
        -sysinfo                         Show system info (path, size, date, MD5 hash)
                                         of class being processed
        -constants                       Show final constants
        --module <module>, -m <module>   Specify module containing classes to be disassembled
        --module-path <path>             Specify where to find application modules
        --system <jdk>                   Specify where to find system modules
        --class-path <path>              Specify where to find user class files
        -classpath <path>                Specify where to find user class files
        -cp <path>                       Specify where to find user class files
        -bootclasspath <path>            Override location of bootstrap class files

      GNU-style options may use = instead of whitespace to separate the name of an option
      from its value.

      Each class to be shown may be specified by a filename, a URL, or by its fully
      qualified class name. Examples:
         path/to/MyClass.class
         jar:file:///path/to/MyJar.jar!/mypkg/MyClass.class
         java.lang.Object

### javaw

nothing


### jcmd

On its own shows all running java programs

      Usage: jcmd <pid | main class> <command ...|PerfCounter.print|-f file>
         or: jcmd -l
         or: jcmd -h

        command must be a valid jcmd command for the selected jvm.
        Use the command "help" to see which commands are available.
        If the pid is 0, commands will be sent to all Java processes.
        The main class argument will be used to match (either partially
        or fully) the class used to start Java.
        If no options are given, lists Java processes (same as -l).

        PerfCounter.print display the counters exposed by this process
        -f  read and execute commands from the file
        -l  list JVM processes on the local machine
        -? -h --help print this help message

### jconsole

Java Monitoring and Management Console - GUI

Similar to the Java Mission Control

### jdb

on its own opens a prompt.

Usage: jdb <options> <class> <arguments>

      where options include:
          -? -h --help -help print this help message and exit
          -sourcepath <directories separated by ";">
                            directories in which to look for source files
          -attach <address>
                            attach to a running VM at the specified address using standard connector
          -listen <address>
                            wait for a running VM to connect at the specified address using standard connector
          -listenany
                            wait for a running VM to connect at any available address using standard connector
          -launch
                            launch VM immediately instead of waiting for 'run' command
          -listconnectors   list the connectors available in this VM
          -connect <connector-name>:<name1>=<value1>,...
                            connect to target VM using named connector with listed argument values
          -dbgtrace [flags] print info for debugging jdb
          -tclient          run the application in the HotSpot(TM) Client Compiler
          -tserver          run the application in the HotSpot(TM) Server Compiler

      options forwarded to debuggee process:
          -v -verbose[:class|gc|jni]
                            turn on verbose mode
          -D<name>=<value>  set a system property
          -classpath <directories separated by ";">
                            list directories in which to look for classes
          -X<option>        non-standard target VM option

      <class> is the name of the class to begin debugging
      <arguments> are the arguments passed to the main() method of <class>

      For command help type 'help' at jdb prompt

### jdeprscan

      Usage: jdeprscan [options] {dir|jar|class} ...

      options:
              --class-path PATH
              --for-removal
              --full-version
        -? -h --help
        -l    --list
              --release 6|7|8|9|10|11
        -v    --verbose
              --version

      Scans each argument for usages of deprecated APIs. An argument
      may be a directory specifying the root of a package hierarchy,
      a JAR file, a class file, or a class name. The class name must be
      specified using a fully qualified class name using the $ separator
      character for nested classes, for example,

          java.lang.Thread$State

      The --class-path option provides a search path for resolution
      of dependent classes.

      The --for-removal option limits scanning or listing to APIs that are
      deprecated for removal. Cannot be used with a release value of 6, 7, or 8.

      The --full-version option prints out the full version string of the tool.

      The --help (-? -h) option prints out a full help message.

      The --list (-l) option prints out the set of deprecated APIs. No scanning is done,
      so no directory, jar, or class arguments should be provided.

      The --release option specifies the Java SE release that provides the set
      of deprecated APIs for scanning.

      The --verbose (-v) option enables additional message output during processing.

      The --version option prints out the abbreviated version string of the tool.

### jdeps

      Usage: jdeps <options> <path ...>]
      <path> can be a pathname to a .class file, a directory, a JAR file.

      Possible options include:
        -h -? --help                  Print this help message
        -dotoutput <dir>
        --dot-output <dir>            Destination directory for DOT file output
        -s       -summary             Print dependency summary only.
        -v       -verbose             Print all class level dependences
                                      Equivalent to -verbose:class -filter:none.
        -verbose:package              Print package-level dependences excluding
                                      dependences within the same package by default
        -verbose:class                Print class-level dependences excluding
                                      dependences within the same package by default
        -apionly
        --api-only                    Restrict analysis to APIs i.e. dependences
                                      from the signature of public and protected
                                      members of public classes including field
                                      type, method parameter types, returned type,
                                      checked exception types etc.
        -jdkinternals
        --jdk-internals               Finds class-level dependences on JDK internal
                                      APIs. By default, it analyzes all classes
                                      on --class-path and input files unless -include
                                      option is specified. This option cannot be
                                      used with -p, -e and -s options.
                                      WARNING: JDK internal APIs are inaccessible.
        -cp <path>
        -classpath <path>
        --class-path <path>           Specify where to find class files
        --module-path <module path>   Specify module path
        --upgrade-module-path <module path>  Specify upgrade module path
        --system <java-home>          Specify an alternate system module path
        --add-modules <module-name>[,<module-name>...]
                                      Adds modules to the root set for analysis
        --multi-release <version>     Specifies the version when processing
                                      multi-release jar files.  <version> should
                                      be integer >= 9 or base.
        -q       -quiet               Suppress warning messages
        -version --version            Version information

      Module dependence analysis options:
        -m <module-name>
        --module <module-name>        Specify the root module for analysis
        --generate-module-info <dir>  Generate module-info.java under the specified
                                      directory. The specified JAR files will be
                                      analyzed. This option cannot be used with
                                      --dot-output or --class-path. Use
                                      --generate-open-module option for open modules.
        --generate-open-module <dir>  Generate module-info.java for the specified
                                      JAR files under the specified directory as
                                      open modules. This option cannot be used with
                                      --dot-output or --class-path.
        --check <module-name>[,<module-name>...
                                      Analyze the dependence of the specified modules
                                      It prints the module descriptor, the resulting
                                      module dependences after analysis and the
                                      graph after transition reduction.  It also
                                      identifies any unused qualified exports.
        --list-deps                   Lists the module dependences.  It also prints
                                      any JDK internal API packages if referenced.
                                      This option does not show dependences on the
                                      class path or not found.
        --list-reduced-deps           Same as --list-deps with not listing
                                      the implied reads edges from the module graph.
                                      If module M1 reads M2, and M2 requires
                                      transitive on M3, then M1 reading M3 is implied
                                      and is not shown in the graph.
        --print-module-deps           Same as --list-reduced-deps with printing
                                      a comma-separated list of module dependences.
                                      This output can be used by jlink --add-modules
                                      in order to create a custom image containing
                                      those modules and their transitive dependences.

      Options to filter dependences:
        -p <pkg>
        -package <pkg>
        --package <pkg>               Finds dependences matching the given package
                                      name (may be given multiple times).
        -e <regex>
        -regex <regex>
        --regex <regex>               Finds dependences matching the given pattern.
        --require <module-name>       Finds dependences matching the given module
                                      name (may be given multiple times). --package,
                                      --regex, --require are mutual exclusive.
        -f <regex> -filter <regex>    Filter dependences matching the given
                                      pattern. If given multiple times, the last
                                      one will be used.
        -filter:package               Filter dependences within the same package.
                                      This is the default.
        -filter:archive               Filter dependences within the same archive.
        -filter:module                Filter dependences within the same module.
        -filter:none                  No -filter:package and -filter:archive
                                      filtering.  Filtering specified via the
                                      -filter option still applies.


      Options to filter classes to be analyzed:
        -include <regex>              Restrict analysis to classes matching pattern
                                      This option filters the list of classes to
                                      be analyzed.  It can be used together with
                                      -p and -e which apply pattern to the dependences
        -P       -profile             Show profile containing a package
        -R       -recursive           Recursively traverse all run-time dependences.
                                      The -R option implies -filter:none.  If -p,
                                      -e, -f option is specified, only the matching
                                      dependences are analyzed.
        -I       --inverse            Analyzes the dependences per other given options
                                      and then find all artifacts that directly
                                      and indirectly depend on the matching nodes.
                                      This is equivalent to the inverse of
                                      compile-time view analysis and print
                                      dependency summary.  This option must use
                                      with --require, --package or --regex option.
        --compile-time                Compile-time view of transitive dependences
                                      i.e. compile-time view of -R option.
                                      Analyzes the dependences per other given options
                                      If a dependence is found from a directory,
                                      a JAR file or a module, all classes in that
                                      containing archive are analyzed.

### jhsdb

Java HotSpot Debugger?  eg jhsdb.exe hsdb opens GUI

      clhsdb       	command line debugger
      debugd       	debug server
      hsdb         	ui debugger
      jstack --help	to get more information
      jmap   --help	to get more information
      jinfo  --help	to get more information
      jsnap  --help	to get more information

### jimage

      Usage: jimage <extract | info | list | verify> <options> jimage...

        extract  - Extract all jimage entries and place in a directory specified
                   by the --dir=<directory> (default=.) option.

        info     - Prints detailed information contained in the jimage header.

        list     - Prints the names of all the entries in the jimage.  When used with
                   --verbose, list will also print entry size and offset attributes.

        verify   - Reports on any .class entries that dont verify as classes.

      Possible options include:
                --dir                        Target directory for extract directive
        -?, -h, --help                       Print this help message
                --include <pattern-list>     Pattern list for filtering entries.
                --verbose                    Listing prints entry size and offset
                                             attributes
                --version                    Print version information

      For options requiring a <pattern-list>, the value will be a comma separated
      list of elements each using one the following forms:
        <glob-pattern>
        glob:<glob-pattern>
        regex:<regex-pattern>

### jinfo

      Usage:
          jinfo <option> <pid>
             (to connect to a running process)

      where <option> is one of:
          -flag <name>         to print the value of the named VM flag
          -flag [+|-]<name>    to enable or disable the named VM flag
          -flag <name>=<value> to set the named VM flag to the given value
          -flags               to print VM flags
          -sysprops            to print Java system properties
          <no option>          to print both VM flags and system properties
          -? | -h | --help | -help to print this help message

### jjs

On its own opens a terminal, with a warning it will soon be removed

      jjs [<options>] <files> [-- <arguments>]
              -D (-Dname=value. Set a system property. This option can be repeated.)

              --add-modules (--add-modules modules. Specify the root user java modules.)

              -cp, -classpath (-cp path. Specify where to find user class files.)

              -doe, -dump-on-error (Dump a stack trace on errors.)
                      param: [true|false]   default: false

              -fv, -fullversion (Print full version info of Nashorn.)
                      param: [true|false]   default: false

              -fx (Launch script as an fx application.)
                      param: [true|false]   default: false

              -h, --help (Print this help message.)
                      param: [true|false]   default: false

              --language (Specify ECMAScript language version.)
                      param: [es5|es6]   default: es5

              --module-path (--module-path path. Specify where to find user java modules.)

              --no-deprecation-warning (Do not show nashorn deprecation warning.)
                      param: [true|false]   default: false

              -ot, --optimistic-types (Use optimistic type assumptions with deoptimizing recompilation.
                                      This makes the compiler try, for any program symbol whose type cannot
                                      be proven at compile time, to type it as narrow and primitive as
                                      possible. If the runtime encounters an error because symbol type
                                      is too narrow, a wider method will be generated until steady stage
                                      is reached. While this produces as optimal Java Bytecode as possible,
                                      erroneous type guesses will lead to longer warmup. Optimistic typing
                                      is currently enabled by default, but can be disabled for faster
                                      startup performance.)
                      param: [true|false]   default: true

              -scripting (Enable scripting features.)
                      param: [true|false]   default: false

              -strict (Run scripts in strict mode.)
                      param: [true|false]   default: false

              -t, -timezone (Set timezone for script execution.)
                      param: <timezone>   default: America/New_York

              -v, -version (Print version info of Nashorn.)
                      param: [true|false]   default: false

### jlink

      Error: --output must be specified
      Usage: jlink <options> --module-path <modulepath> --add-modules <module>[,<module>...]
      Use --help for a list of possible options

help:

      Usage: jlink <options> --module-path <modulepath> --add-modules <module>[,<module>...]
      Possible options include:
            --add-modules <mod>[,<mod>...]    Root modules to resolve
            --bind-services                   Link in service provider modules and
                                              their dependences
        -c, --compress=<0|1|2>                Enable compression of resources:
                                                Level 0: No compression
                                                Level 1: Constant string sharing
                                                Level 2: ZIP
            --disable-plugin <pluginname>     Disable the plugin mentioned
            --endian <little|big>             Byte order of generated jimage
                                              (default:native)
        -h, --help, -?                        Print this help message
            --ignore-signing-information      Suppress a fatal error when signed
                                              modular JARs are linked in the image.
                                              The signature related files of the
                                              signed modular JARs are not copied to
                                              the runtime image.
            --launcher <name>=<module>[/<mainclass>]
                                              Add a launcher command of the given
                                              name for the module and the main class
                                              if specified
            --limit-modules <mod>[,<mod>...]  Limit the universe of observable
                                              modules
            --list-plugins                    List available plugins
        -p, --module-path <path>              Module path
            --no-header-files                 Exclude include header files
            --no-man-pages                    Exclude man pages
            --output <path>                   Location of output path
            --post-process-path <imagefile>   Post process an existing image
            --resources-last-sorter <name>    The last plugin allowed to sort
                                              resources
            --save-opts <filename>            Save jlink options in the given file
        -G, --strip-debug                     Strip debug information
            --suggest-providers [<name>,...]  Suggest providers that implement the
                                              given service types from the module path
        -v, --verbose                         Enable verbose tracing
            --version                         Version information
            @<filename>                       Read options from file


  ### jmap

      Usage:
          jmap -clstats <pid>
              to connect to running process and print class loader statistics
          jmap -finalizerinfo <pid>
              to connect to running process and print information on objects awaiting finalization
          jmap -histo[:live] <pid>
              to connect to running process and print histogram of java object heap
              if the "live" suboption is specified, only count live objects
          jmap -dump:<dump-options> <pid>
              to connect to running process and dump java heap
          jmap -? -h --help
              to print this help message

          dump-options:
            live         dump only live objects; if not specified,
                         all objects in the heap are dumped.
            format=b     binary format
            file=<file>  dump heap to <file>

          Example: jmap -dump:live,format=b,file=heap.bin <pid>

### jmod

      Usage: jmod (create|extract|list|describe|hash) <OPTIONS> <jmod-file>

      Main operation modes:
        create    - Creates a new jmod archive
        extract   - Extracts all the files from the archive
        list      - Prints the names of all the entries
        describe  - Prints the module details
        hash      - Records hashes of tied modules.

       Option                              Description
       ------                              -----------
        -?, -h, --help                      Print this help message
        --class-path <path>                 Application jar files|dir containing
                                              classes
        --cmds <path>                       Location of native commands
        --config <path>                     Location of user-editable config files
        --dir <path>                        Target directory for extract
        --dry-run                           Dry run of hash mode
        --exclude <pattern-list>            Exclude files matching the supplied
                                              comma separated pattern list, each
                                              element using one the following
                                              forms: <glob-pattern>, glob:<glob-
                                              pattern> or regex:<regex-pattern>
        --hash-modules <regex-pattern>      Compute and record hashes to tie a
                                              packaged module with modules
                                              matching the given <regex-pattern>
                                              and depending upon it directly or
                                              indirectly. The hashes are recorded
                                              in the JMOD file being created, or a
                                              JMOD file or modular JAR on the
                                              module path specified the jmod hash
                                              command.
        --header-files <path>               Location of header files
        --help-extra                        Print help on extra options
        --legal-notices <path>              Location of legal notices
        --libs <path>                       Location of native libraries
        --main-class <String: class-name>   Main class
        --man-pages <path>                  Location of man pages
        --module-version <module-version>   Module version
        -p, --module-path <path>            Module path
        --target-platform <String: target-  Target platform
          platform>
        --version                           Version information
        @<filename>                         Read options from the specified file

### jps

A process manager?

      10544 Main
      29040
      29072 Main
      22148 Launcher
      27476
      7540
      25048 Launcher
      25512 RemoteMavenServer36
      19900 Jps

      usage: jps [--help]
             jps [-q] [-mlvV] [<hostid>]

      Definitions:
          <hostid>:      <hostname>[:<port>]
          -? -h --help -help: Print this help message and exit.

### jrunscript

      jrunscript.exe
      Warning: Nashorn engine is planned to be removed from a future JDK release
      nashorn> quit
      function quit() { [native code] }
      nashorn> quit()

      C:\Program Files\Java\JDK-11\bin>jrunscript.exe -h
      Usage: jrunscript [options] [arguments...]

      where [options] include:
        -classpath <path>    Specify where to find user class files
        -cp <path>           Specify where to find user class files
        -D<name>=<value>     Set a system property
        -J<flag>             Pass <flag> directly to the runtime system
        -l <language>        Use specified scripting language
        -e <script>          Evaluate given script
        -encoding <encoding> Specify character encoding used by script files
        -f <script file>     Evaluate given script file
        -f -                 Interactive mode, read script from standard input
                             If this is used, this should be the last -f option
        -? -h --help -help   Print this help message and exit
        -q                   List all scripting engines available and exit

      If [arguments..] are present and if no -e or -f option is used, then first
      argument is script file and the rest of the arguments, if any, are passed
      as script arguments. If [arguments..] and -e or -f option is used, then all
      [arguments..] are passed as script argume

### jshell
      |  Welcome to JShell -- Version 11.0.3
      |  For an introduction type: /help intro

        Usage:   jshell <option>... <load-file>...
        where possible options include:
          --class-path <path>   Specify where to find user class files
          --module-path <path>  Specify where to find application modules
          --add-modules <module>(,<module>)*
                                Specify modules to resolve, or all modules on the
                                  module path if <module> is ALL-MODULE-PATHs
          --enable-preview      Allow code to depend on preview features of this release
          --startup <file>      One run replacement for the startup definitions
          --no-startup          Do not run the startup definitions
          --feedback <mode>     Specify the initial feedback mode. The mode may be
                                  predefined (silent, concise, normal, or verbose) or
                                  previously user-defined
          -q                    Quiet feedback.  Same as: --feedback concise
          -s                    Really quiet feedback.  Same as: --feedback silent
          -v                    Verbose feedback.  Same as: --feedback verbose
          -J<flag>              Pass <flag> directly to the runtime system.
                                  Use one -J for each runtime flag or flag argument
          -R<flag>              Pass <flag> to the remote runtime system.
                                  Use one -R for each remote flag or flag argument
          -C<flag>              Pass <flag> to the compiler.
                                  Use one -C for each compiler flag or flag argument
          --version             Print version information and exit
          --show-version        Print version information and continue
          --help, -?, -h        Print this synopsis of standard options and exit
          --help-extra, -X      Print help on non-standard options and exit

        A file argument may be a file name, or one of the predefined file names: DEFAULT,
        PRINTING, or JAVASE.
        A load-file may also be "-" to indicate standard input, without interactive I/O.

        For more information on the evaluation context options (--class-path,
        --module-path, and --add-modules) see:
              /help context

        A path lists the directories and archives to search. For Windows, use a
        semicolon (;) to separate items in the path. On other platforms, use a
        colon (:) to separate items.

      jshell>

      jshell> /help
      |  Type a Java language expression, statement, or declaration.
      |  Or type one of the following commands:
      |  /list [<name or id>|-all|-start]
      |       list the source you have typed
      |  /edit <name or id>
      |       edit a source entry
      |  /drop <name or id>
      |       delete a source entry
      |  /save [-all|-history|-start] <file>
      |       Save snippet source to a file
      |  /open <file>
      |       open a file as source input
      |  /vars [<name or id>|-all|-start]
      |       list the declared variables and their values
      |  /methods [<name or id>|-all|-start]
      |       list the declared methods and their signatures
      |  /types [<name or id>|-all|-start]
      |       list the type declarations
      |  /imports
      |       list the imported items
      |  /exit [<integer-expression-snippet>]
      |       exit the jshell tool
      |  /env [-class-path <path>] [-module-path <path>] [-add-modules <modules>] ...
      |       view or change the evaluation context
      |  /reset [-class-path <path>] [-module-path <path>] [-add-modules <modules>]...
      |       reset the jshell tool
      |  /reload [-restore] [-quiet] [-class-path <path>] [-module-path <path>]...
      |       reset and replay relevant history -- current or previous (-restore)
      |  /history [-all]
      |       history of what you have typed
      |  /help [<command>|<subject>]
      |       get information about using the jshell tool
      |  /set editor|start|feedback|mode|prompt|truncation|format ...
      |       set configuration information
      |  /? [<command>|<subject>]
      |       get information about using the jshell tool
      |  /!
      |       rerun last snippet -- see /help rerun
      |  /<id>
      |       rerun snippets by ID or ID range -- see /help rerun
      |  /-<n>
      |       rerun n-th previous snippet -- see /help rerun
      |
      |  For more information type '/help' followed by the name of a
      |  command or a subject.
      |  For example '/help /list' or '/help intro'.
      |
      |  Subjects:
      |
      |  intro
      |       an introduction to the jshell tool
      |  id
      |       a description of snippet IDs and how use them
      |  shortcuts
      |       a description of keystrokes for snippet and command completion,
      |       information access, and automatic code generation
      |  context
      |       a description of the evaluation context options for /env /reload and /reset
      |  rerun
      |       a description of ways to re-evaluate previously entered snippets


### jstack

      jstack.exe -h
      Usage:
          jstack [-l][-e] <pid>
              (to connect to running process)

      Options:
          -l  long listing. Prints additional information about locks
          -e  extended listing. Prints additional information about threads
          -? -h --help -help to print this help message

### jstat

      Usage: jstat --help|-options
             jstat -<option> [-t] [-h<lines>] <vmid> [<interval> [<count>]]

      Definitions:
        <option>      An option reported by the -options option
        <vmid>        Virtual Machine Identifier. A vmid takes the following form:
                           <lvmid>[@<hostname>[:<port>]]
                      Where <lvmid> is the local vm identifier for the target
                      Java virtual machine, typically a process id; <hostname> is
                      the name of the host running the target Java virtual machine;
                      and <port> is the port number for the rmiregistry on the
                      target host. See the jvmstat documentation for a more complete
                      description of the Virtual Machine Identifier.
        <lines>       Number of samples between header lines.
        <interval>    Sampling interval. The following forms are allowed:
                          <n>["ms"|"s"]
                      Where <n> is an integer and the suffix specifies the units as
                      milliseconds("ms") or seconds("s"). The default units are "ms".
        <count>       Number of samples to take before terminating.
        -J<flag>      Pass <flag> directly to the runtime system.
        -? -h --help  Prints this help message.
        -help         Prints this help message.

### jstatd

      Could not create remote object
      java.security.AccessControlException: access denied ("java.util.PropertyPermission" "java.rmi.server.ignoreSubClasses" "write")
              at java.base/java.security.AccessControlContext.checkPermission(AccessControlContext.java:472)
              at java.base/java.security.AccessController.checkPermission(AccessController.java:895)
              at java.base/java.lang.SecurityManager.checkPermission(SecurityManager.java:322)
              at java.base/java.lang.System.setProperty(System.java:888)
              at jdk.jstatd/sun.tools.jstatd.Jstatd.main(Jstatd.java:140)

      C:\Program Files\Java\JDK-11\bin>jstatd - h
      usage: jstatd [-nr] [-p port] [-n rminame]
             jstatd -?|-h|--help

### keytool.exe

      Key and Certificate Management Tool

      Commands:

       -certreq            Generates a certificate request
       -changealias        Changes an entry's alias
       -delete             Deletes an entry
       -exportcert         Exports certificate
       -genkeypair         Generates a key pair
       -genseckey          Generates a secret key
       -gencert            Generates certificate from a certificate request
       -importcert         Imports a certificate or a certificate chain
       -importpass         Imports a password
       -importkeystore     Imports one or all entries from another keystore
       -keypasswd          Changes the key password of an entry
       -list               Lists entries in a keystore
       -printcert          Prints the content of a certificate
       -printcertreq       Prints the content of a certificate request
       -printcrl           Prints the content of a CRL file
       -storepasswd        Changes the store password of a keystore

      Use "keytool -?, -h, or --help" for this help message
      Use "keytool -command_name --help" for usage of command_name.
      Use the -conf <url> option to specify a pre-configured options file.

### kinit

    >kinit -h
    Usage:

    1. Initial ticket request:
        kinit [-A] [-f] [-p] [-c cachename] [-l lifetime] [-r renewable_time]
              [[-k [-t keytab_file_name]] [principal] [password]
    2. Renew a ticket:
        kinit -R [-c cachename] [principal]

    Available options to Kerberos 5 ticket request:
            -A   do not include addresses
            -f   forwardable
            -p   proxiable
            -c   cache name (i.e., FILE:\d:\myProfiles\mykrb5cache)
            -l   lifetime
            -r   renewable time (total lifetime a ticket can be renewed)
            -k   use keytab
            -t   keytab file name
            principal   the principal name (i.e., qweadf@ATHENA.MIT.EDU qweadf)
            password    the principal's Kerberos password

            >kinit
            Exception:  Can not obtain principal name
            java.lang.IllegalArgumentException:  Can not obtain principal name
                    at java.security.jgss/sun.security.krb5.internal.tools.Kinit.acquire(Kinit.java:188)
                    at java.security.jgss/sun.security.krb5.internal.tools.Kinit.<init>(Kinit.java:134)
                    at java.security.jgss/sun.security.krb5.internal.tools.Kinit.main(Kinit.java:96)

### klist

      >klist
      Credentials cache C:\Users\andyt\krb5cc_andyt not found.

      C:\Program Files\Java\JDK-11\bin>klist -h

      Usage: klist [[-c] [-f] [-e] [-a [-n]]] [-k [-t] [-K]] [name]
         name  name of credentials cache or  keytab with the prefix. File-based cache or keytab's prefix is FILE:.
         -c specifies that credential cache is to be listed
         -k specifies that key tab is to be listed
         options for credentials caches:
              -f       shows credentials flags
              -e       shows the encryption type
              -a       shows addresses
                -n       do not reverse-resolve addresses
         options for keytabs:
              -t       shows keytab entry timestamps
              -K       shows keytab entry key value
              -e       shows keytab entry key type

### ktab

      No default key table exists.

      C:\Program Files\Java\JDK-11\bin>ktab -h

      Usage: ktab <commands> <options>

      Available commands:

      -l [-e] [-t]
          list the keytab name and entries. -e with etype, -t with timestamp.
      -a <principal name> [<password>] [-n <kvno>] [-append]
          add new key entries to the keytab for the given principal name with
          optional <password>. If a <kvno> is specified, new keys' Key Version
          Numbers equal to the value, otherwise, automatically incrementing
          the Key Version Numbers. If -append is specified, new keys are
          appended to the keytab, otherwise, old keys for the
          same principal are removed.
      -d <principal name> [-f] [-e <etype>] [<kvno> | all | old]
          delete key entries from the keytab for the specified principal. If
          <kvno> is specified, delete keys whose Key Version Numbers match
          kvno. If "all" is specified, delete all keys. If "old" is specified,
          delete all keys except those with the highest kvno. Default action
          is "all". If <etype> is specified, only keys of this encryption type
          are deleted. <etype> should be specified as the numberic value etype
          defined in RFC 3961, section 8. A prompt to confirm the deletion is
          displayed unless -f is specified.

      Common option(s):

      -k <keytab name>
          specify keytab name and path with prefix FILE:

### Pack200

         Warning: The pack200 tool is deprecated, and is planned for removal in a future JDK release.

        Usage:  pack200 [-opt... | --option=value]... x.pack[.gz] y.jar
        (For more information, run pack200 --help .)

        C:\Program Files\Java\JDK-11\bin>pack200.exe --help

        Warning: The pack200 tool is deprecated, and is planned for removal in a future JDK release.

        Usage:  pack200 [-opt... | --option=value]... x.pack[.gz] y.jar

        Packing Options
          -r, --repack                    repack or normalize a jar, suitable for
                                          signing with jarsigner
          -g, --no-gzip                   output a plain pack file, suitable to be
                                          compressed with a file compression utility
          --gzip                          (default) post compress the pack output
                                          with gzip
          -G, --strip-debug               remove debugging attributes (SourceFile,
                                          LineNumberTable, LocalVariableTable
                                          and LocalVariableTypeTable) while packing
          -O, --no-keep-file-order        do not transmit file ordering information
          --keep-file-order               (default) preserve input file ordering
          -S{N}, --segment-limit={N}      limit segment sizes (default unlimited)
          -E{N}, --effort={N}             packing effort (default N=5)
          -H{h}, --deflate-hint={h}       transmit deflate hint: true, false,
                                          or keep (default)
          -m{V}, --modification-time={V}  transmit modtimes: latest or keep (default)
          -P{F}, --pass-file={F}          transmit the given input element(s) unchanged
          -U{a}, --unknown-attribute={a}  unknown attribute action: error, strip,
                                          or pass (default)
          -C{N}={L}, --class-attribute={N}={L}  (user-defined attribute)
          -F{N}={L}, --field-attribute={N}={L}  (user-defined attribute)
          -M{N}={L}, --method-attribute={N}={L} (user-defined attribute)
          -D{N}={L}, --code-attribute={N}={L}   (user-defined attribute)
          -f{F}, --config-file={F}        read file F for Pack200.Packer properties
          -v, --verbose                   increase program verbosity
          -q, --quiet                     set verbosity to lowest level
          -l{F}, --log-file={F}           output to the given log file,
                                          or '-' for System.out
          -?, -h, --help                  print this help message
          -V, --version                   print program version
          -J{X}                           pass option X to underlying Java VM

        Notes:
          The -P, -C, -F, -M, and -D options accumulate.
          Example attribute definition:  -C SourceFile=RUH .
          Config. file properties are defined by the Pack200 API.
          For meaning of -S, -E, -H-, -m, -U values, see Pack200 API.
          Layout definitions (like RUH) are defined by JSR 200.

        Repacking mode updates the JAR file with a pack/unpack cycle:
            pack200 [-r|--repack] [-opt | --option=value]... [repackedy.jar] y.jar

            Exit Status:
              0 if successful, >0 if an error occurred

            Warning: The pack200 tool is deprecated, and is planned for removal in a future JDK release.

### rmic

        Usage: rmic <options> <class names>

        where <options> includes:
          -keep          Do not delete intermediate generated source files
          -keepgenerated (same as "-keep")
          -v1.1          Create stubs/skeletons for 1.1 stub protocol version (deprecated)
          -vcompat       Create stubs/skeletons compatible with both
                                   1.1 and 1.2 stub protocol versions (deprecated)
          -v1.2          (default) Create stubs for 1.2 stub protocol version only (deprecated)
          -g             Generate debugging info
          -nowarn        Generate no warnings
          -nowrite       Do not write compiled classes to the file system
          -verbose       Output messages about what the compiler is doing
          -classpath <path>      Specify where to find input class files
          -bootclasspath <path>  Override location of bootstrap class files
          -d <directory>         Specify where to place generated class files
          -J<runtime flag>       Pass argument to the java interpreter

### rmid

      Activation.main: warning: sun.rmi.activation.execPolicy system
          property unspecified and no ExecPermissions/ExecOptionPermissions
          granted; subsequent activation attempts may fail due to unsuccessful
          ExecPermission/ExecOptionPermission permission checks.
          To configure security, refer to the rmid documentation.


      C:\Program Files\Java\JDK-11\bin>rmid -h
      rmid: invalid option: -h
      Usage: rmid <options>

      where <options> include:
        -port <port>        Specify port for rmid to use
        -log <directory>    Specify directory in which rmid writes log
        -stop               Stop current invocation of rmid (for specified port)
        -C<runtime flag>    Pass argument to each child process (activation group)
        -J<runtime flag>    Pass argument to the java interpreter


### rmiregistry.exe

        rmiregistry.exe -h
        port argument, -h, is not a number.
        Usage: rmiregistry <options> <port>

        where <options> includes:
          -J<runtime flag> Pass argument to the java interpreter

### serialver

serialver -h
Invalid flag -h.
use: serialver [-classpath classpath] [classname...]



### servertool

        servertool -h


        Welcome to the Java IDL Server Tool
        please enter commands at the prompt

        servertool > help


                Available Commands:
                -------------------

                register     - register an activatable server
                unregister   - unregister a registered server
                getserverid  - return the server id for an applicationName
                list         - list all registered servers
                listappnames - list applicationNames currently defined
                listactive   - list currently active servers
                locate       - locate ports of specific type for a registered server
                locateperorb - locate ports for a specific orb of registered server
                orblist      - list of orb names and their mapping
                shutdown     - shutdown a registered server
                startup      - start a registered server
                help         - get help
                quit         - quit this tool


### unpack200

        unpack200.exe -h

        Warning: The unpack200.exe tool is deprecated, and is planned for removal in a future JDK release.

        Usage:  unpack200.exe [-opt... | --option=value]... x.pack[.gz] y.jar

        Unpacking Options
          -H{h}, --deflate-hint={h}     override transmitted deflate hint:
                                        true, false, or keep (default)
          -r, --remove-pack-file        remove input file after unpacking
          -v, --verbose                 increase program verbosity
          -q, --quiet                   set verbosity to lowest level
          -l{F}, --log-file={F}         output to the given log file,
                                        or '-' for standard output (default)
          -?, -h, --help                print this help message
          -V, --version                 print program version

        Exit Status:
          0 if successful, >0 if an error occurred

in JRE Only

### orbd

locks when run alone


      >orbd -h
      Sep 05, 2019 1:19:36 AM com.sun.corba.se.impl.transport.SocketOrChannelAcceptorImpl initialize
      SEVERE: "IOP00410216: (COMM_FAILURE) Unable to create listener thread on the specified port: 1049"
      org.omg.CORBA.COMM_FAILURE:   vmcid: SUN  minor code: 216  completed: No
              at com.sun.corba.se.impl.logging.ORBUtilSystemException.createListenerFailed(Unknown Source)
              at com.sun.corba.se.impl.logging.ORBUtilSystemException.createListenerFailed(Unknown Source)
              at com.sun.corba.se.impl.transport.SocketOrChannelAcceptorImpl.initialize(Unknown Source)
              at com.sun.corba.se.impl.transport.CorbaTransportManagerImpl.getAcceptors(Unknown Source)
              at com.sun.corba.se.impl.transport.CorbaTransportManagerImpl.addToIORTemplate(Unknown Source)
              at com.sun.corba.se.spi.oa.ObjectAdapterBase.initializeTemplate(Unknown Source)
              at com.sun.corba.se.impl.oa.toa.TOAImpl.<init>(Unknown Source)
              at com.sun.corba.se.impl.oa.toa.TOAFactory.getTOA(Unknown Source)
              at com.sun.corba.se.impl.orb.ORBImpl.connect(Unknown Source)
              at com.sun.corba.se.impl.activation.RepositoryImpl.<init>(Unknown Source)
              at com.sun.corba.se.impl.activation.ORBD.startActivationObjects(Unknown Source)
              at com.sun.corba.se.impl.activation.ORBD.run(Unknown Source)
              at com.sun.corba.se.impl.activation.ORBD.main(Unknown Source)
      Caused by: java.net.BindException: Address already in use: bind
              at sun.nio.ch.Net.bind0(Native Method)
              at sun.nio.ch.Net.bind(Unknown Source)
              at sun.nio.ch.Net.bind(Unknown Source)
              at sun.nio.ch.ServerSocketChannelImpl.bind(Unknown Source)
              at sun.nio.ch.ServerSocketAdaptor.bind(Unknown Source)
              at sun.nio.ch.ServerSocketAdaptor.bind(Unknown Source)
              at com.sun.corba.se.impl.transport.DefaultSocketFactoryImpl.createServerSocket(Unknown Source)
              ... 11 more

And more

JavaFX only

### idlj

        idlj
        com.sun.tools.corba.se.idl.InvalidArgument: No IDL file was specified.

        Compiler Usage:

            java com.sun.tools.corba.se.idl.toJavaPortable.Compile [options] <idl file>

        where <idl file> is the name of a file containing IDL definitions, and
        [options] is any combination of the options listed below.  The options
        are optional and may appear in any order; <idl file> is required and
        must appear last.

        Options:
        -d <symbol>               This is equivalent to the following line in an
                                  IDL file:  #define <symbol>
        -emitAll                  Emit all types, including those found in #included files.
        -f<side>                  Define what bindings to emit.  <side> is one of client,
                                  server, all, serverTIE, allTIE.  serverTIE and allTIE
                                  cause delegate model skeletons to be emitted.  If this
                                  flag is not used, -fclient is assumed.
        -i <include path>         By default, the current directory is scanned for
                                  included files.  This option adds another directory.
        -keep                     If a file to be generated already exists, do not
                                  overwrite it.  By default it is overwritten.
        -noWarn                   Suppress warnings.
        -oldImplBase              Generate skeletons compatible with old (pre-1.4) JDK ORBs.
        -pkgPrefix <t> <prefix>   When the type or module name <t> is encountered at
                                  file scope, begin the Java package name for all files
                                  generated for <t> with <prefix>.
        -pkgTranslate <t> <pkg>   When the type or module name <t> in encountered, replace
                                  it with <pkg> in the generated java package.  Note that
                                  pkgPrefix changes are made first.  <t> must match the
                                  full package name exactly.  Also, <t> must not be
                                  org, org.omg, or any subpackage of org.omg.
        -skeletonName <xxx%yyy>   Name the skeleton according to the pattern.
                                  The defaults are:
                                  %POA for the POA base class (-fserver or -fall)
                                  _%ImplBase for the oldImplBase base class
                                  (-oldImplBase and (-fserver or -fall)).
        -td <dir>                 use <dir> for the output directory instead of
                                  the current directory.
        -tieName <xxx%yyy>        Name the tie according to the pattern.  The defaults are:
                                  %POATie for the POA tie (-fserverTie or -fallTie)
                                  %_Tie for the oldImplBase tie
                                  (-oldImplBase and (-fserverTie or -fallTie)).
        -v, -verbose              Verbose mode.
        -version                  Display the version number and quit.


### appletviewer

        appletviewer.exe
        Warning: Applet API and AppletViewer are deprecated.
        Usage: appletviewer <options> url(s)

        where <options> include:
          -encoding <encoding>    Specify character encoding used by HTML files
          -J<runtime flag>        Pass argument to the java interpreter

        The -J option is non-standard and subject to change without notice.



C:\Program Files\Java\JFx-9\bin\appletviewer.exe
C:\Program Files\Java\JFx-9\bin\ssvagent.exe
C:\Program Files\Java\JFx-9\bin\tnameserv.exe
C:\Program Files\Java\JFx-9\bin\tnameserv.exe
