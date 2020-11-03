---
id: "javanotes"

---


# Java Notes

[[TOC]]


## Setup

### Environment Variables:


The `JRE_HOME` variable is used to specify location of a JRE.

`JAVA_HOME` variable is used to specify location of a JDK.

`CATALINA_HOME` -  the location of the Tomcat Server Installation Directory:  Default `C:\Program Files\Apache Software Foundation\Tomcat 9.0`

`M2_HOME`, `M2`, `MAVEN_OPTS`

### JDK Structure

[Contents of the JDK](https://www.oracle.com/java/technologies/javase/jdk13-readme-downloads.html)

This section contains a general summary of the files and directories in the JDK.

**Executables** (In the `bin/` subdirectory) An implementation of the Java Runtime Environment (JRE). The JRE includes a Java Virtual Machine (JVM™), class libraries, and other files that support the execution of programs written in the Java programming language. This directory also includes tools and utilities that will help you develop, execute, debug, and document programs written in the Java programming language. For further information, see the JDK 13 tools specification [here](https://docs.oracle.com/en/java/javase/13/docs/specs/man/index.html) and within this file in [Java binaries](#Java-Binaries)



Configuration files
(In the conf/ subdirectory) Files that contain user-configurable options. Files in this directory can be edited to change the JDK's access permissions, configure security algorithms, and set the Java Cryptography Extension Policy Files which might be used to limit the JDK's cryptographic strength.

C header Files
(In the include/ subdirectory) C-language header files that support native-code programming with the Java Native Interface and the Java Virtual Machine (JVM) Debugger Interface.

Compiled Java Modules
(in the jmods/ subdirectory) Compiled modules used by jlink to create custom runtimes.

Copyright and License files
(in the legal/ subdirectory) License and copyright files for each module. Includes third party notices as .md (markdown)files.

Additional Libraries
(In the lib/ subdirectory) Additional class libraries and support files required by the JDK. These files are not intended for external use.


### Difference between Oracle JDK and Open-JDK

[Source](https://blogs.oracle.com/java-platform-group/oracle-jdk-releases-for-java-11-and-later)

From _Java 11_ forward, therefore, Oracle JDK builds and OpenJDK builds will be essentially identical.

...yet with some cosmetic and packaging differences

There do remain a small number of differences, some intentional and cosmetic, and some simply because more time to discuss with OpenJDK contributors is warranted.

Oracle JDK 11 emits a warning when using the -XX:+UnlockCommercialFeatures option, whereas in OpenJDK builds this option results in an error. This option was never part of OpenJDK and it would not make sense to add it now, since there are no commercial features in OpenJDK. This difference remains in order to make it easier for users of Oracle JDK 10 and earlier releases to migrate to Oracle JDK 11 and later. 

Oracle JDK 11 can be configured to provide usage log data to the “Advanced Management Console” tool, which is a separate commercial Oracle product.  We will work with other OpenJDK contributors to discuss how such usage data may be useful in OpenJDK in future releases, if at all.   This difference remains primarily to provide a consistent experience to Oracle customers until such decisions are made.

The `javac --release` command behaves differently for the Java 9 and Java 10 targets, since in those releases the **Oracle JDK contained some additional modules that were not part of corresponding OpenJDK releases:**
- javafx.base
- javafx.controls
- javafx.fxml
- javafx.graphics
- javafx.media
- javafx.web
- java.jnlp
- jdk.jfr
- jdk.management.cmm
- jdk.management.jfr
- jdk.management.resource
- jdk.packager.services
- jdk.snmp

This difference remains in order to provide a consistent experience for specific kinds of legacy use. *These modules are either now available separately as part of **OpenJFX,*** are now in both **OpenJDK** and the Oracle JDK because they were commercial features which Oracle contributed to **OpenJDK** (e.g., **Flight Recorder),** or were removed from **Oracle JDK 11 (e.g.,** **JNLP).**

The output of the `java --version` and `java -fullversion` commands will distinguish Oracle JDK builds from OpenJDK builds, so that support teams can diagnose any issues that may exist.  Specifically, running `java --version` with an Oracle JDK 11 build results in:

        java 11 2018-09-25
        Java(TM) SE Runtime Environment 18.9 (build 11+28)
        Java HotSpot(TM) 64-Bit Server VM 18.9 (build 11+28, mixed mode)

And for an OpenJDK 11 build:

        openjdk version "11" 2018-09-25
        OpenJDK Runtime Environment 18.9 (build 11+28)
        OpenJDK 64-Bit Server VM 18.9 (build 11+28, mixed mode)

The Oracle JDK has always required third party cryptographic providers to be signed by a known certificate.  *The cryptography framework in OpenJDK has an open cryptographic interface, meaning it does not restrict which providers can be used.* Oracle JDK 11 will continue to require a valid signature, and Oracle OpenJDK builds will continue to allow the use of either a valid signature or unsigned third party crypto provider. 

Oracle JDK 11 will continue to include installers, branding and JRE packaging for an experience consistent with legacy desktop uses.  Oracle OpenJDK builds are currently available as zip and tar.gz files, while alternative distribution formats are being considered.


## Running a program

To launch a class file:

        java [options] mainclass [args...] 

To launch the main class in a JAR file:

        java [options] -jar jarfile [args...]

To launch the main class in a module:

        java [options] -m module[/mainclass] [args...] 

or

        java [options] --module module[/mainclass] [args...] 

To launch a single source-file program:

        java [options] source-file [args...] 

`[options]` -     Optional: Specifies command-line options separated by spaces. See Overview of Java Options for a description of available options.

`mainclass` - Specifies the name of the class to be launched. Command-line entries following classname are the arguments for the main method.

`-jar jarfile` Executes a program encapsulated in a JAR file. The jarfile argument is the name of a JAR file with a manifest that contains a line in the form 

`Main-Class:classname` that defines the class with the public static void main(String[] args) method that serves as your application's starting point. When you use -jar, the specified JAR file is the source of all user classes, and other class path settings are ignored. If you’re using JAR files, then see jar.
-m or --module module[/mainclass]

    Executes the main class in a module specified by mainclass if it is given, or, if it is not given, the value in the module. In other words, mainclass can be used when it is not specified by the module, or to override the value when it is specified.

    See Standard Options for Java.
source-file

    Only used to launch a single source-file program. Specifies the source file that contains the main class when using source-file mode. See Using Source-File Mode to Launch Single-File Source-Code Programs
[args...]

    Optional: Arguments following mainclass, source-file, -jar jarfile, and -m or --module module/mainclass are passed as arguments to the main class.


## Java Command Line Options:

- [Best Source](https://docs.oracle.com/en/java/javase/11/tools/java.html#GUID-3B1CE181-CD30-4178-9602-230B800D4FAE)
- [In PDF Form](https://docs.oracle.com/en/java/javase/11/tools/tools-reference.pdf)
- [Local](file://R:\_JDOC\JDK12SEtools-reference.pdf)
- [Local2](file:///R:\_JDOC\JDK11tools-reference.pdf)
- [Java Command Line Doc](https://docs.oracle.com/cd/E13150_01/jrockit_jvm/jrockit/jrdocs/refman/optionX.html)
- [Hotspot command line options](https://docs.oracle.com/en/java/javase/11/jrockit-hotspot/command-line-options.html#GUID-34F4E86A-649B-4C7B-BA04-8E7298B9E98F)

-Xss - Sets the thread stack size (in bytes). 

-Xmx - Specifies the maximum size (in bytes) of the memory allocation pool in bytes. 

-Xmn Sets the initial and maximum size (in bytes) of the **heap** for the young generation (nursery).

-Xms - Sets the initial size (in bytes) of the heap.

Example:

`-Xss4M -Xms32M -Xmx128M -XshowSettings`  

```java 
        <plugins>
      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.8.1</version>
        <configuration>
          <compilerArgs>
            <arg>-verbose</arg>
            <arg>-Xlint:all,-options,-path</arg>
          </compilerArgs>
        </configuration>
      </plugin>
    </plugins>
```


!!!Important These, and any value, can be made implicit in the compiler for the program by setting the `J`*option* command :
        -JoptionPasses option to the runtime system, whereoption is one of the Java options de‐scribed on javacommand. For example, -J-Xms48m sets the startup memory to 48 MB.
    So that the resulting compiled program will contain these settings.  I set this value in the maven build settings and it resolved overflow issues.


`-Xms` The -Xms option sets the initial and minimum Java heap size. The Java heap (the “heap”) is the part of the memory where blocks of memory are allocated to objects and freed during garbage collection. 


Format: -Xms<size>[g|G|m|M|k|K]

java
My own list

- `-Xmx size` - Specifies the maximum size (in bytes) of the memory allocation pool in bytes. This value must be a multiple of 1024 and greater than 2 MB. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. The default value is chosen at runtime based on system configuration. For server deployments, -Xms and -Xmx are often set to the same value. The following examples show how to set the maximum allowed size of allocated memory to 80 MB by using various units:

    -Xmx83886080
    -Xmx81920k
    -Xmx80m

    The -Xmx option is equivalent to **-XX:MaxHeapSize.**



 - `-Xms size` - Sets the initial size (in bytes) of the heap. This value must be a multiple of 1024 and greater than 1 MB. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, g or G to indicate gigabytes. The following examples show how to set the size of allocated memory to 6 MB by using various units:

    -Xms6291456
    -Xms6144k
    -Xms6m

    If you don’t set this option, then the initial size is set as the sum of the sizes allocated for the old generation and the young generation. The initial size of the heap for the young generation can be set by using the -Xmn option or the -XX:NewSize option.

     -Xms:64m myApp

If you do not set this, the minimum Java heap size defaults to (depending on which mode you are running):

    -server mode: 25% of the amount of free physical memory in the system, up to 64 MB and at least 8 MB
    -client mode: 25% of the amount of free physical memory in the system, up to 16 MB and at least 8 MB 


    -Xmx

This option sets the maximum Java heap size. The Java heap (the “heap”) is the part of the memory where blocks of memory are allocated to objects and freed during garbage collection. Depending upon the kind of operating system you are running, the maximum value you can set for the Java heap can vary. 



 - `-Xmn size` - Sets the initial and maximum size (in bytes) of the heap for the young generation (nursery). Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, or g or G to indicate gigabytes. The young generation region of the heap is used for new objects. GC is performed in this region more often than in other regions. If the size for the young generation is too small, then a lot of minor garbage collections are performed. If the size is too large, then only full garbage collections are performed, which can take a long time to complete. Oracle recommends that you keep the size for the young generation greater than 25% and less than 50% of the overall heap size. The following examples show how to set the initial and maximum size of young generation to 256 MB using various units:

    -Xmn256m
    -Xmn262144k
    -Xmn268435456

    Instead of the -Xmn option to set both the initial and maximum size of the heap for the young generation, you can use -XX:NewSize to set the initial size and -XX:MaxNewSize to set the maximum size.


    
 - `-Xss size` - Sets the thread stack size (in bytes). Append the letter k or K to indicate KB, m or M to indicate MB, and g or G to indicate GB. The default value depends on the platform:

        Linux/x64 (64-bit): 1024 KB

        macOS (64-bit): 1024 KB

        Oracle Solaris/x64 (64-bit): 1024 KB

        Windows: The default value depends on virtual memory

    The following examples set the thread stack size to 1024 KB in different units:

    -Xss1m
    -Xss1024k
    -Xss1048576

    This option is similar to -XX:ThreadStackSize.


    
## Java Standard Options

Standard Options for Java

These are the most commonly used options supported by all implementations of the JVM.

Note:

To specify an argument for a long option, you can use either --name=value or --name value.

- `-agentlib:libname[=options]` - Loads the specified native agent library. After the library name, a comma-separated list of options specific to the library can be used.

        Oracle Solaris, Linux, and macOS: If the option -agentlib:foo is specified, then the JVM attempts to load the library named libfoo.so in the location specified by the LD_LIBRARY_PATH system variable (on macOS this variable is DYLD_LIBRARY_PATH).

        Windows: If the option -agentlib:foo is specified, then the JVM attempts to load the library named foo.dll in the location specified by the PATH system variable.

        The following example shows how to load the Java Debug Wire Protocol (JDWP) library and listen for the socket connection on port 8000, suspending the JVM before the main class loads:

        -agentlib:jdwp=transport=dt_socket,server=y,address=8000

- `-agentpath:pathname[=options]` - Loads the native agent library specified by the absolute path name. This option is equivalent to -agentlib but uses the full path and file name of the library.
- `--class-path classpath, -classpath classpath, or -cp classpath` - A semicolon (;) separated list of directories, JAR archives, and ZIP archives to search for class files.

    Specifying classpath overrides any setting of the CLASSPATH environment variable. If the class path option isn’t used and classpath isn’t set, then the user class path consists of the current directory (.).

    As a special convenience, a class path element that contains a base name of an asterisk (*) is considered equivalent to specifying a list of all the files in the directory with the extension .jar or .JAR. A Java program can’t tell the difference between the two invocations. For example, if the directory mydir contains a.jar and b.JAR, then the class path element mydir/* is expanded to A.jar:b.JAR, except that the order of JAR files is unspecified. All .jar files in the specified directory, even hidden ones, are included in the list. A class path entry consisting of an asterisk (*) expands to a list of all the jar files in the current directory. The CLASSPATH environment variable, where defined, is similarly expanded. Any class path wildcard expansion occurs before the Java VM is started. Java programs never see wildcards that aren’t expanded except by querying the environment, such as by calling System.getenv("CLASSPATH").
- `--disable-@files` - Can be used anywhere on the command line, including in an argument file, to prevent further @filename expansion. This option stops expanding @-argfiles after the option.
- `--enable-preview` - Allows classes to depend on preview features of the release.

 - `--module-path modulepath... or -p modulepath` - A semicolon (;) separated list of directories in which each directory is a directory of modules.

 - `--upgrade-module-path modulepath...` - A semicolon (;) separated list of directories in which each directory is a directory of modules that replace upgradeable modules in the runtime image.

 - `--add-modules module[,module...]` - Specifies the root modules to resolve in addition to the initial module. module also can be ALL-DEFAULT, ALL-SYSTEM, and ALL-MODULE-PATH.

 - `--list-modules` - Lists the observable modules and then exits.

 - `-d module name or --describe-module module_name` - Describes a specified module and then exits.

 - `--dry-run` - Creates the VM but doesn’t execute the main method. This --dry-run option might be useful for validating the command-line options such as the module system configuration.

 - `--validate-modules` - Validates all modules and exits. This option is helpful for finding conflicts and other errors with modules on the module path.

 - `-Dproperty=value` - Sets a system property value. The property variable is a string with no spaces that represents the name of the property. The value variable is a string that represents the value of the property. If value is a string with spaces, then enclose it in quotation marks (for example -Dfoo="foo bar").

 - `-disableassertions[:[packagename]...|:classname] or -da[:[packagename]...|:classname]` - Disables assertions. By default, assertions are disabled in all packages and classes. With no arguments, -disableassertions (-da) disables assertions in all packages and classes. With the packagename argument ending in ..., the switch disables assertions in the specified package and any subpackages. If the argument is simply ..., then the switch disables assertions in the unnamed package in the current working directory. With the classname argument, the switch disables assertions in the specified class.

    The -disableassertions (-da) option applies to all class loaders and to system classes (which don’t have a class loader). There’s one exception to this rule: If the option is provided with no arguments, then it doesn’t apply to system classes. This makes it easy to disable assertions in all classes except for system classes. The -disablesystemassertions option enables you to disable assertions in all system classes. To explicitly enable assertions in specific packages or classes, use the -enableassertions (-ea) option. Both options can be used at the same time. For example, to run the MyClass application with assertions enabled in the package com.wombat.fruitbat (and any subpackages) but disabled in the class com.wombat.fruitbat.Brickbat, use the following command:

    java -ea:com.wombat.fruitbat... -da:com.wombat.fruitbat.Brickbat MyClass


 - `-disablesystemassertions or -dsa` - Disables assertions in all system classes.

 - `-enableassertions[:[packagename]...|:classname] or -ea[:[packagename]...|:classname]` - Enables assertions. By default, assertions are disabled in all packages and classes. With no arguments, -enableassertions (-ea) enables assertions in all packages and classes. With the packagename argument ending in ..., the switch enables assertions in the specified package and any subpackages. If the argument is simply ..., then the switch enables assertions in the unnamed package in the current working directory. With the classname argument, the switch enables assertions in the specified class.

    The -enableassertions (-ea) option applies to all class loaders and to system classes (which don’t have a class loader). There’s one exception to this rule: If the option is provided with no arguments, then it doesn’t apply to system classes. This makes it easy to enable assertions in all classes except for system classes. The -enablesystemassertions option provides a separate switch to enable assertions in all system classes. To explicitly disable assertions in specific packages or classes, use the -disableassertions (-da) option. If a single command contains multiple instances of these switches, then they’re processed in order, before loading any classes. For example, to run the MyClass application with assertions enabled only in the package com.wombat.fruitbat (and any subpackages) but disabled in the class com.wombat.fruitbat.Brickbat, use the following command:

    java -ea:com.wombat.fruitbat... -da:com.wombat.fruitbat.Brickbat MyClass


 - `-enablesystemassertions or -esa` - Enables assertions in all system classes.

 - `-help , -h, or -?` - Prints the help message to the error stream.

 - `--help` - Prints the help message to the output stream.

 - `-javaagent:jarpath[=options]` - Loads the specified Java programming language agent.

 - `--show-version` - Prints the product version to the output stream and continues.

 - `-showversion` - Prints the product version to the error stream and continues.

 - `--show-module-resolution` - Shows module resolution output during startup.

 - `-splash:imagepath` - Shows the splash screen with the image specified by imagepath. HiDPI scaled images are automatically supported and used if available. The unscaled image file name, such as image.ext, should always be passed as the argument to the -splash option. The most appropriate scaled image provided is picked up automatically.

    For example, to show the splash.gif file from the images directory when starting your application, use the following option:

    -splash:images/splash.gif

    See the SplashScreen API documentation for more information.

 - `-verbose:class` - Displays information about each loaded class.

 - `-verbose:gc` - Displays information about each garbage collection (GC) event.

 - `-verbose:jni` - Displays information about the use of native methods and other Java Native Interface (JNI) activity.

 - `-verbose:module` - Displays information about the modules in use.

 - `--version` - Prints product version to the error stream and exits.

 - `-version` - Prints product version to the output stream and exits.

 - `-X` - Prints the help on extra options to the error stream.

 - `--help-extra` - Prints the help on extra options to the output stream.
@argfile

    Specifies one or more argument files prefixed by @ used by the java command. It isn’t uncommon for the java command line to be very long because of the .jar files needed in the classpath. The @argfile option overcomes command-line length limitations by enabling the launcher to expand the contents of argument files after shell expansion, but before argument processing. Contents in the argument files are expanded because otherwise, they would be specified on the command line until the -Xdisable-@files option was encountered.

    The argument files can also contain the main class name and all options. If an argument file contains all of the options required by the java command, then the command line could simply be:

    java @argfile

    See java Command-Line Argument Files for a description and examples of using @argfile .


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


### Block

[^Block]



This is a `Block`  It allegedly has a more limited scope, e.g. the instance variables within are not scoped outside.





```java
 public static void main( String[] args )
  {

    {  //a block
      System.setProperty( "java.util.logging.config.file" ,
            Sys.joinPath( Sys.USER_DIR , "res" , "logging.properties" ) );
      LogMan logMan = new LogMan();
      LOG = Logger.getLogger( "App(main)" );
    } // end of the block
    Sys sys = new Sys();
    
  }

```
[Source](https://stackoverflow.com/questions/4484884/java-just-curly-braces)

Relevant quotes from the source.


   "A block is a sequence of statements, local class declarations and local variable declaration statements within braces.

    "Autogenerated code uses scoping to simplify the creation of several similar components with identical variable names (i.e. consider a gui generator that needed to make code for 100 radio buttons - rather than incrementing variable names per button, it could use scoping).

    "As a tiny, reusable, pastable logical block with minimal side effects : the programmer felt like a block of code in a method was so obscure, its variables and internal side effects should have minimal visibility to the outside world. That is, the programmer has used a code block as a poor-man's anonymous lambda function (albeit, one without a return value). In this pattern one might do something akin to the below :


```java
//lets say I want to make a primary key for a dogs name in a database. 
String dogNameKey=null;
{
    long time = System.currentTimeInMilliseconds();
    String theName = "spot";
    dogName=theName+"_"+time;
}

```


### Class Declaration

<Access modifier> <static or final> [className]<Type Parameter>  <implements List> <extends List> {

}



### Method Declaration

<Access modifier> <static or final> <<TypeParameter>> [Return Type] [Name] (<Type Param> Name Param ...)

   `public static < E > void printArray( E[] inputArray ) {`
## Standard Directory Layout
| LOCATION           | CONTENTS   |
| ------------------ | -------------------------------------------------------------------------- |
| src/main/java      | Application/Library sources                                                |
| src/main/resources | Application/Library resources                                              |
| src/main/filters   | Resource filter files                                                      |
| src/main/webapp    | Web application sources                                                    |
| src/test/java      | Test sources         |
| src/test/resources | Test resources       |
| src/test/filters   | Test resource filter files                                                 |
| src/it             | Integration Tests (primarily for plugins)                                  |
| src/assembly       | Assembly descriptors |
| src/site           | Site       |
| LICENSE.txt        | Project's license    |
| NOTICE.txt         | Notices and attributions required by libraries that the project depends on |
| README.txt         | Project's readme     |



## JavaDoc

[Tools Reference (JDK 8)](https://docs.oracle.com/javase/8/docs/technotes/tools/windows/toc.html)
[JDK 12 Tools Ref](https://docs.oracle.com/en/java/javase/12/tools/tools-and-command-reference.html)
[JDK 12 Javadoc Guide](https://www.oracle.com/pls/topic/lookup?ctx=javase12&id=JSJAV-GUID-7A344353-3BBF-45C4-8B28-15025DDCC643)\
[JDK 12 Main Doc Page](https://docs.oracle.com/en/java/javase/12/)

See the section on the JDK component [java](##javadoc.exe)


Syntax - block comment with two stars instead of one.

      /**
      * etc
      */

Uses tags


    Tag	Introduced in JDK/SDK
    @author	1.0
    `{@code}`	1.5
    `{@docRoot}`	1.3
    @deprecated	1.0
    @exception	1.0
    `{@inheritDoc}`	1.4
    `{@link}`	1.2
    `{@linkplain}`	1.4
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


!!! Javadoc tags.


| Tag           | Description                                                                                                                                                  | Syntax                                               |
| -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------- |
| @author       | Adds the author of a class.                                                                                                                                  | @author name-text                                    |
| `{@code}`       | Displays text in code font without interpreting the text as HTML markup or nested javadoc tags.                                                              | {@code text}                                         |
| `{@docRoot}`    | Represents the relative path to the generated document's root directory from any generated page.                                                             | `{@docRoot}`                                           |
| @deprecated   | Adds a comment indicating that this API should no longer be used.                                                                                            | @deprecated deprecatedtext                           |
| @exception    | Adds a Throws subheading to the generated documentation, with the classname and description text.                                                            | @exception class-name description                    |
| `{@inheritDoc}` | Inherits a comment from the nearest inheritable class or implementable interface.                                                                            | Inherits a comment from the immediate surperclass.   |
| `{@link}`       | Inserts an in-line link with the visible text label that points to the documentation for the specified package, class, or member name of a referenced class. | {@link package.class#member label}                   |
| `{@linkplain}`  | Identical to `{@link}`, except the link's label is displayed in plain text than code font.                                                                     | {@linkplain package.class#member label}              |
| @param        | Adds a parameter with the specified parameter-name followed by the specified description to the "Parameters" section.                                        | @param parameter-name description                    |
| @return       | Adds a "Returns" section with the description text.                                                                                                          | @return description                                  |
| `@see`          | Adds a "See Also" heading with a link or text entry that points to reference.                                                                                | `@see` reference                                       |
| @serial       | Used in the doc comment for a default serializable field.                                                                                                    | @serial field-description \| include \| exclude      |
| @serialData   | Documents the data written by the writeObject( ) or writeExternal( ) methods.                                                                                | @serialData data-description                         |
| @serialField  | Documents an ObjectStreamField component.                                                                                                                    | @serialField field-name field-type field-description |
| @since        | Adds a "Since" heading with the specified since-text to the generated documentation.                                                                         | @since release                                       |
| @throws       | The @throws and @exception tags are synonyms.                                                                                                                | @throws class-name description                       |
| `{@value}`      | When `{@value}` is used in the doc comment of a static field, it displays the value of that constant.                                                          | {@value package.class#field}                         |
| @version      | Adds a "Version" subheading with the specified version-text to the generated docs when the -version option is used.                                          | @version version-text                                |


The format of @see is 
  `  @see public T[] getData()`  I copied this from the header of the help file that popped up in intelliJ, but it looks like access modifier _ return value _ name(params)
   * @see java.util.ListIterator
   * @see java.util.Iterator


Link format : {@link java.util.ListIterator}
              /**
   * Load all the files in a directory, read each one and add the data to 
   * an array of Integers.  Returns a wrapper for the array,
   * <p></p>
   * GArrayList really should have been the super for RecordSet -> DataSet, 
   * but I wrote them separately and they sort of converged.  I wrote 
   * RecordSet first to store the array of data and handle adding, removing, 
   * resizing, subsetting, formatting, etc. an array of Integers.
   * <p></p>
   * DataSet extends RecordSet to add 2 important functionalities, the first 
   * the File Reading and nameing methods.  RecordSet only handles the actual
   * data, DataSet Loads and applies that data given a fileName or path.
   * </p>
   * In addition, DataSet implements the{@link Iterable}interface and 
   * the contains two sub-classes that provide the <Code> 
   * {@link java.util.ListIterator} and the {@link Iterator<Integer>}
   * interfaces.
   * 
   *
   * GArray List was written after, and is essentially the same thing, many 
   * of the ideas in one were implemented in the other.  And in truth, by the
   * end, GArrayList could have completely replaced {@link RecordSet}.  
   * RecordSet is an <b>Integer</b> implementation of {@link GArrayList}
   * 
   * @param dir
   *       the dir
   *
   * @return the GArrayList - and arrayList wrapper of DataSet classes.
   * 
   * @throws IOException
   * 
   * @see public Interface Iterator<E> 
   * @see java.util.Iterator
   * @see java.util.ListIterator
   *  @see java.util.ArrayList
   * @see RecordSet
   * @see GArrayList
   * 
   */

## Maven

[Documentation](https://maven.apache.org/index.html)

[Settings Reference](https://maven.apache.org/settings.html)

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

[POM Reference](https://maven.apache.org/pom.html)

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

#### POM Elements

[Maven Model](http://maven.apache.org/ref/2.2.1/maven-model/maven.html)



##### overview

closing tags are omitted and implicit in a dedent.

```xml
<project> / <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>
    <groupId>
    <artifactId>
    <version>
    <name>
    <description>
    <url>
    <packaging>
    <properties>
        <project.build.sourceEncoding>
        <maven.compiler.source>
        <maven.compiler.target>
    <dependencies>
    <dependency>
    <!--repeated as many times as needed -->
        <groupId>
        <artifactId>
        <version>  

    <build>
        <pluginManagement>
            <plugins>
                <plugin>
                <!--repeated as many times as needed -->
                    <artifactId>
                    <version>

    <reporting>
        <plugins>
            <plugin>
            <!--repeated as many times as needed -->
                <artifactId>

```

So briefly:

- intro fields
    - modelVersion
    - groupId
    - artifactId
    - version
    - name
    - description
    - url
    - packaging
- **properties**
    
- dependencies
- build [Build Info](https://maven.apache.org/pom.html#Build_Settings)
    - plugins [List of Plugins](http://maven.apache.org/plugins/index.html)
 
- reporting


##### preamble

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>usr.ATimmons</groupId>
  <artifactId>JHU-DataStructures</artifactId>
  <version>1.0-SNAPSHOT</version>

  <name>JHU-DataStructures</name>
  <description>A simple JHU-DataStructures.</description>
  <!-- FIXME change it to the project's website -->
  <url>http://www.example.com</url>

...


</project>

  ```

##### Dependencies


[Dependency Ref](https://maven.apache.org/pom.html#Dependencies)


```xml
  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>4.12</version>
      <type>jar</type>
      <scope>test</scope>
      <optional>true</optional>
    </dependency>
    ...
  </dependencies>
  ...
```
 From the documentation- `<scope>system` is used for a provided jar.

###### Versioning Notes:

"`(,`" or "`,)`" is a soft end (note the comma included),
while "`[`" or "`]`" is a hard limit.

Version requirements have the following syntax:

- `1.0`: Soft requirement for 1.0. Use 1.0 if no other version appears earlier in the dependency tree.
- `[1.0]`: Hard requirement for 1.0. Use 1.0 and only 1.0.
- `(,1.0]`: Hard requirement for any version <= 1.0.
- `[1.2,1.3]`: Hard requirement for any version between 1.2 and 1.3 inclusive.
- `[1.0,2.0)`: 1.0 <= x < 2.0; Hard requirement for any version between 1.0 inclusive and 2.0 exclusive.
- `[1.5,)`: Hard requirement for any version greater than or equal to 1.5.
- `(,1.0],[1.2,)`: Hard requirement for any version less than or equal to 1.0 than or greater than or equal to 1.2, but not 1.1. Multiple requirements are separated by commas.
- `(,1.1),(1.1,)`: Hard requirement for any version except 1.1; for example because 1.1 has a critical vulnerability.

    Maven picks the highest version of each project that satisfies all the hard requirements of the dependencies on that project. If no version satisfies all the hard requirements, the build fails.

##### Packaging

  `<packaging>jar</packaging>`

##### Properties:

```xml
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
  </properties>
```

`<localRepository>${project.basedir}/lib</localRepository>`

##### Dependency

Roughly

```
  <dependencies>
    <dependency></dependency>
    <dependency></dependency>
  </dependencies>
```

With each dependency requiring 3 ids to find it.

```
    <dependency>
      <groupId>A</groupId>
      <artifactId>B</artifactId>
      <version>C</version>
    </dependency>
```
 
Example:


```xml

  <dependencies>
    <dependency>
      <groupId>junit</groupId>
      <artifactId>junit</artifactId>
      <version>3.8.1</version>
    </dependency>
    <dependency>
      <groupId>com.googlecode.lanterna</groupId>
      <artifactId>lanterna</artifactId>
      <version>3.0.1</version>
    </dependency>
  </dependencies>

```

#### POM Variables (Properties)

You can store variables and call them up later.  In `Properties` Section-

```xml


  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
        <!-- Variables -->
    <java.version>1.8</java.version>
    <junit.jupiter.version>5.5.1</junit.jupiter.version>
    <junit.platform.version>1.5.1</junit.platform.version>
    <maven.compiler.source>${java.version}</maven.compiler.source>
    <maven.compiler.target>${java.version}</maven.compiler.target>
    <!-- Plugins -->
  </properties>

  <dependencies>
    <dependency>
      <groupId>org.junit.platform</groupId>
      <artifactId>junit-platform-launcher</artifactId>
      <!-- Referenced -->
      <version>${junit.platform.version}</version>
      <scope>test</scope>
    </dependency>
```


From the [Settings Reference](https://maven.apache.org/settings.html) there are 5 cases:
    
1. `env.X`:
    - Prefixing a variable with **“env.”** will return the shell’s environment variable. 
        - For example, `${env.PATH}` contains the `$path` environment variable (`%PATH%` in Windows).
2. `project.x`:
    - A dot (`.`) notated path in the POM will contain the corresponding element’s value. 
        - For example: `<project><version>1.0</version></project>` is accessible via `${project.version}`.
3. `settings.x`:
    -  A dot (.) notated path in the *settings.xml* will contain the corresponding element’s value. For example: `<settings><offline>false</offline></settings>` is accessible via `${settings.offline}`.
4. _Java System Properties_:
    - All properties accessible via java.lang.System.getProperties() are available as POM properties, such as `${java.home}`.
        - See [this](###System.getProperty) section on available options.
5. `x`: 
    - Set within a `<properties />` element or an external files, the value may be used as `${someVar}`.


### Maven Lifecycle Stages

Major Stages

- `validate` - validate the project is correct and all necessary information is available
- `compile` - compile the source code of the project
- `test` - test the compiled source code using a suitable unit testing framework. These tests should not require the code be packaged or deployed
- `package` - take the compiled code and package it in its distributable format, such as a JAR.
- `verify` - run any checks on results of integration tests to ensure quality criteria are met
- `install` - install the package into the local repository, for use as a dependency in other projects locally
- `deploy` - done in the build environment, copies the final package to the remote repository for sharing with other developers and projects

Or fully inclusive:

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


#### Plugins



[List of Plugins](http://maven.apache.org/plugins/index.html)

[Repository of Plugins](https://repo.maven.apache.org/maven2/org/apache/maven/plugins/)

[]

### Compiling Maven

!!! Attention   
    !!!!! Failure  Potential Failure: to make a jar executable... you need to jar a file called `META-INF/MANIFEST.MF` the file itself should have (at least) this one liner:

            Main-Class: com.mypackage.MyClass

        ```xml
        <build>
        <plugins>
            <plugin>
            <!-- Build an executable JAR -->
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-jar-plugin</artifactId>
            <version>3.1.0</version>
            <configuration>
                <archive>
                <manifest>
                    <addClasspath>true</addClasspath>
                    <classpathPrefix>lib/</classpathPrefix>
                    <mainClass>com.mypackage.MyClass</mainClass>
                </manifest>
                </archive>
            </configuration>
            </plugin>
        </plugins>
        </build>
        ```
    [Source: Stack Overflow](https://stackoverflow.com/questions/9689793/cant-execute-jar-file-no-main-manifest-attribute)
    
    

    






## JUnit

[Documentation](https://junit.org/junit5/docs/current/user-guide/index.pdf)

[org.junit.jupiter.api Doc](https://junit.org/junit5/docs/5.0.1/api/org/junit/jupiter/api/Assertions.html)

[More Doc](https://junit.org/junit5/docs/current/user-guide/)




![org.junit.jupiter.api Classes](res\JUnitClasses.png)



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


### Parameterized Tests

[Good Source](https://www.baeldung.com/parameterized-tests-junit-5)


@ParameterizedTest
then
@NullSource|@EmptySource|@NullAndEmptySource|@ValueSource(type={})

One of the limitations of value sources is that they only support the following types:

    short (with the shorts attribute)
    byte (with the bytes attribute)
    int (with the ints attribute)
    long  (with the longs attribute)
    float (with the floats attribute)
    double (with the doubles attribute)
    char (with the chars attribute)
    java.lang.String (with the strings attribute) (e.g. `strings` is lower case:
      @ValueSource(strings= {})
    
    java.lang.Class (with the classes attribute)


Other sources:

@EnumSource
@CsvSource
@MethodSource("provideStringsForIsBlank")

	
```java 
    private static Stream<Arguments> provideStringsForIsBlank() {
        return Stream.of(
            Arguments.of(null, true),
            Arguments.of("", true),
            Arguments.of("  ", true),
            Arguments.of("not blank", false)
        )
    }
```


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


## Types

[Documentation](https://docs.oracle.com/javase/tutorial/java/data/numbers.html)

### Casting 


#### Casting a primitive to Boxed class

see [](#Boxing-and-unboxing-arrays)

and [Source](https://www.techiedelight.com/convert-int-array-integer-array-java/)


```java
  public Integer[] castIntArray(int[] intArray){
//    return IntStream.of( intArray ).boxed().toArray(Integer[]::new);
    return Arrays.stream( intArray ).boxed().toArray( Integer[] :: new );
    
  }
  ```



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


### instanceOf

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

#### instanceof

[Source](https://www.javatpoint.com/downcasting-with-instanceof-operator)

```java
    class Simple1{  
     public static void main(String[] args){  
     Simple1 s=new Simple1();  
     System.out.println(s instanceof Simple1);//true  
     }  
    }  

```


### Constables

Some 'constable' types have a native representation in the constant pool: `String`, `Integer`, `Long`, `Float`, `Double`, `Class`, `MethodType`, and `MethodHandle`. The types `String`, `Integer`, `Long`, `Float`, and `Double` serve as their own nominal descriptors; Class, MethodType, and MethodHandle have corresponding nominal descriptors ClassDesc, MethodTypeDesc, and MethodHandleDesc.

See [ConStable Interface.](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/lang/constant/Constable.html)



### Generics

[Another Tutorial](https://www.tutorialspoint.com/java/java_generics.htm)

[Official Tutorial](https://docs.oracle.com/javase/tutorial/java/generics/index.html)

[Easy to Understand Tutorial](http://www.angelikalanger.com/GenericsFAQ/FAQSections/ParameterizedTypes.html#FAQ001)


[Generic Source](http://www.angelikalanger.com/GenericsFAQ/FAQSections/ParameterizedTypes.html#FAQ001)


Generally a class has a Type parameter. `<T>` or `<E>` by convention.

 restrictions:

- Cannot Instantiate Generic Types with **Primitive Types**
    - Though the Compiler will [AutoBox and Unbox](https://docs.oracle.com/javase/tutorial/java/data/autoboxing.html) where it can.
- Cannot Create Instances of Type Parameters
- Cannot Declare Static Fields Whose Types are Type Parameters
- Cannot Use Casts or instanceof With Parameterized Types
- Cannot Create Arrays of Parameterized Types
- Cannot Create, Catch, or Throw Objects of Parameterized Types
- Cannot Overload a Method Where the Formal Parameter Types of Each Overload Erase to the Same Raw Type



#### Bounded Type Parameters

You can limit the allowed values of T (which must be subtype of Object Class) -  like this:

`class GenericNumber<T extends Number>{`

 `extends` is used for both `extends` /classes and `implements` (e.g. when its an interface.) In otherwords, even though you normally would use implements when using an interface, you still use the word Extends, because you arent implementing anything.  You are saying - some type `T`, is down the type hierarchy of this Interface.


```java
public class MaximumTest {
   // determines the largest of three Comparable objects
   
   public static <T extends Comparable<T>> T maximum(T x, T y, T z) {
      T max = x;   // assume x is initially the largest
      
      if(y.compareTo(max) > 0) {
         max = y;   // y is the largest so far
      }
      
      if(z.compareTo(max) > 0) {
         max = z;   // z is the largest now                 
      }
      return max; // returns the largest object   
   }
   
   public static void main(String args[]) {
      System.out.printf("Max of %d, %d and %d is %d\n\n", 
         3, 4, 5, maximum( 3, 4, 5 ));

      System.out.printf("Max of %.1f,%.1f and %.1f is %.1f\n\n",
         6.6, 8.8, 7.7, maximum( 6.6, 8.8, 7.7 ));

      System.out.printf("Max of %s, %s and %s is %s\n","pear",
         "apple", "orange", maximum("pear", "apple", "orange"));
   }
}

```


#### Wildcards

##### <? extends Class> - Upper Bounded 

`<? extends Class>` - Upper Bounded 


public static double sumOfList(List<? extends Number> list) {
    double s = 0.0;
    for (Number n : list)
        s += n.doubleValue();
    return s;
}

For example, say you want to write a method that works on List<Integer>, List<Double>, and List<Number>; you can achieve this by using an upper bounded wildcard.

To declare an upper-bounded wildcard, use the wildcard character ('?'), followed by the extends keyword, followed by its upper bound. Note that, in this context, extends is used in a general sense to mean either "extends" (as in classes) or "implements" (as in interfaces).

To write the method that works on lists of Number and the subtypes of Number, such as Integer, Double, and Float, you would specify List<? extends Number>. 

!!!example **The term List<Number> is more restrictive than List<? extends Number> because the former matches a list of type Number only, whereas the latter matches a list of type Number or any of its subclasses.**

        ```java 
            //  The sumOfList method returns the sum of the numbers in a list:

        public static double sumOfList(List<? extends Number> list) {
            double s = 0.0;
            for (Number n : list)
                s += n.doubleValue();
            return s;
        }

        // The following code, using a list of Integer objects, prints sum = 6.0:

        List<Integer> li = Arrays.asList(1, 2, 3);
        System.out.println("sum = " + sumOfList(li));

        // A list of Double values can use the same sumOfList method. The following code prints sum = 7.0:

        List<Double> ld = Arrays.asList(1.2, 2.3, 3.5);
        System.out.println("sum = " + sumOfList(ld));

        ```

##### <?> Unbounded Wildcards

[The Guidelines for Wildcard Use](https://docs.oracle.com/javase/tutorial/java/generics/wildcardGuidelines.html)

<?> This is called a list of unknown type. There are two scenarios where an unbounded wildcard is a useful approach:


 Consider the following method, printList:

```java 
    
public static void printList(List<Object> list) {
    for (Object elem : list)
        System.out.println(elem + " ");
    System.out.println();
}

```

The goal of printList is to print a list of any type, but it fails to achieve that goal — it prints only a list of Object instances; 

!!!important "it cannot print List<Integer>, List<String>, List<Double>, and so on, because they are not subtypes of List<Object>. To write a generic printList method, use List<?>:"
    
    This is an important point-- List<Object> is not a supertype of List<Integer>.  So they cant be called like this.  its confusing as well.

```java
public static void printList(List<?> list) {
    for (Object elem: list)
        System.out.print(elem + " ");
    System.out.println();
}


List<Integer> li = Arrays.asList(1, 2, 3);
List<String>  ls = Arrays.asList("one", "two", "three");
printList(li);
printList(ls);
```

Because for any concrete type A, List<A> is a subtype of List<?>, you can use printList to print a list of any type:



    If you are writing a method that can be implemented using functionality provided in the Object class.
    When the code is using methods in the generic class that don't depend on the type parameter. For example, List.size or List.clear. In fact, Class<?> is so often used because most of the methods in Class<T> do not depend on T.

!!!Note The Arrays.asList method is used in examples throughout this lesson. This static factory method converts the specified array and returns a fixed-size list. 

!!! noteIt's important to note that List<Object> and List<?> are not the same. You can insert an Object, or any subtype of Object, into a List<Object>. But you can only insert null into a List<?>. [The Guidelines for Wildcard Use](https://docs.oracle.com/javase/tutorial/java/generics/wildcardGuidelines.html)section has more information on how to determine what kind of wildcard, if any, should be used in a given situation.


##### Lower Bounded Wildcards <? super Class>

!!!Note: You can specify an upper bound for a wildcard, or you can specify a lower bound, but you cannot specify both. 

The Upper Bounded Wildcards section shows that an upper bounded wildcard restricts the unknown type to be a specific type or a subtype of that type and is represented using the extends keyword. In a similar way, a lower bounded wildcard restricts the unknown type to be a specific type or a super type of that type.

A lower bounded wildcard is expressed using the wildcard character ('?'), following by the `super` keyword, followed by its lower bound: `<? super A`>.

 To write the method that works on lists of Integer and the supertypes of Integer, such as Integer, Number, and Object, you would specify `List<? super Integer>`. The term List<Integer> is more restrictive than List<? super Integer> because the former matches a list of type Integer only, whereas the latter matches a list of any type that is a supertype of Integer.

The following code adds the numbers 1 through 10 to the end of a list:


```java

public static void addNumbers(List<? super Integer> list) {
    for (int i = 1; i <= 10; i++) {
        list.add(i);
    }
}
```


![](https://docs.oracle.com/javase/tutorial/figures/java/generics-wildcardSubtyping.gif)


In this example, the compiler processes the i input parameter as being of type Object. When the foo method invokes List.set(int, E), the compiler is not able to confirm the type of object that is being inserted into the list, and an error is produced. When this type of error occurs it typically means that the compiler believes that you are assigning the wrong type to a variable. Generics were added to the Java language for this reason — to enforce type safety at compile time.

```java 

//throws Error!
    import java.util.List;

public class WildcardError {

    void foo(List<?> i) {
        i.set(0, i.get(0));
    }
}

//  work around the problem by creating the private helper method, fooHelper, as shown in 

// WildcardFixed:

public class WildcardFixed {

    void foo(List<?> i) {
        fooHelper(i);
    }

    // Helper method created so that the wildcard can be captured
    // through type inference.
    private <T> void fooHelper(List<T> l) {
        l.set(0, l.get(0));
    }
}
```

The WildcardError example generates the following error when compiled by Oracle's JDK 7 javac implementation:

        WildcardError.java:6: error: method set in interface List<E> cannot be applied to given types;
            i.set(0, i.get(0));
            ^
        required: int,CAP#1
        found: int,Object
        reason: actual argument Object cannot be converted to CAP#1 by method invocation conversion
        where E is a type-variable:
            E extends Object declared in interface List
        where CAP#1 is a fresh type-variable:
            CAP#1 extends Object from capture of ?
        1 error



#### Generic Methods

You can write a single generic method declaration that can be called with arguments of different types. 


 rules to define Generic Methods −

    All generic method declarations have a **type parameter section delimited by angle brackets** (< and >) that precedes the method's return type ( < E > in the next example).

    Each type parameter section contains one or more type parameters separated by commas. A type parameter, also known as a type variable, is an identifier that specifies a generic type name.

    The type parameters **can be used to declare the return type** and act as placeholders for the types of the arguments passed to the generic method, which are known as actual type arguments.

    A generic method's body is declared like that of any other method. 
    
!!!note  type parameters can represent only reference types, not primitive types (like int, double and char).

```java
public class GenericMethodTest {
   // generic method printArray
   public static < E > void printArray( E[] inputArray ) {
      // Display array elements
      for(E element : inputArray) {
         System.out.printf("%s ", element);
      }
      System.out.println();
   }

   public static void main(String args[]) {
      // Create arrays of Integer, Double and Character
      Integer[] intArray = { 1, 2, 3, 4, 5 };
      Double[] doubleArray = { 1.1, 2.2, 3.3, 4.4 };
      Character[] charArray = { 'H', 'E', 'L', 'L', 'O' };

      System.out.println("Array integerArray contains:");
      printArray(intArray);   // pass an Integer array
            
      System.out.println("\nArray doubleArray contains:");
      printArray(doubleArray);   // pass a Double array

      System.out.println("\nArray characterArray contains:");
      printArray(charArray);   // pass a Character array
   }
}

```

        Array integerArray contains:
        1 2 3 4 5 

        Array doubleArray contains:
        1.1 2.2 3.3 4.4 

        Array characterArray contains:
        H E L L O

#### Generic Constructors


```java
Note that constructors can be generic (in other words, declare their own formal type parameters) in both generic and non-generic classes. Consider the following example:

class MyClass<X> {
  <T> MyClass(T t) {
    // ...
  }
}
MyClass<Integer> myObject = new MyClass<>("");

```


In this example, the compiler infers the type Integer for the formal type parameter, X, of the generic class MyClass<X>. It infers the type String for the formal type parameter, T, of the constructor of this generic class.

e.g. this is confusing at first.  But above, notice 2 type params, T and X.

MyClass<Integer> -> goes to `X` but new MyClass<>(String) plugs into T.


#### Instantiating a Generic Array

Saying:

```java
class SomeClass<T>{
    //constructor
    public SomeClass(){
        //instantiate an array of T[]
        T[] arrayOfTs = new T[someLength];
    }
}
```
wont work.  The given error says : *Type parameter 'T' cannot be instantiated directly*

[SO-Create Generic Array](https://stackoverflow.com/questions/529085/how-to-create-a-generic-array-in-java)



`T[] tempArray = (T[])Array.newInstance( this.type , len );`


Wildcards

In generic code, the question mark (?), called the wildcard, represents an unknown type. The wildcard can be used in a variety of situations: as the type of a parameter, field, or local variable; sometimes as a return type (though it is better programming practice to be more specific). The wildcard is never used as a type argument for a generic method invocation, a generic class instance creation, or a supertype.


To write the method that works on lists of `Number` and the subtypes of `Number`, such as `Integer`, `Double`, and `Float`, you would specify **`List<? extends Number>`**

The term **`List<Number>`** is more restrictive than **`List<? extends Number>`** because the former matches a list of type Number only, whereas the latter matches a list of type `Number` or any of its subclasses.


### (ToDO) Type Erasure


[Erasure](https://docs.oracle.com/javase/tutorial/java/generics/erasure.html)

 To implement generics, the Java compiler applies type erasure to:

- Replace all type parameters in generic types with their bounds or Object if the type parameters are unbounded. The produced bytecode, therefore, contains only ordinary classes, interfaces, and methods.
- Insert type casts if necessary to preserve type safety.
- Generate bridge methods to preserve polymorphism in extended generic types.

Type erasure ensures that no new classes are created for parameterized types; consequently, generics incur no runtime overhead.

### Primitive types

[Numbers](https://docs.oracle.com/javase/tutorial/java/data/index.html)

|type|range|
|-|-|
`boolean` | true or false (!= 1 or 0 (not 1 or 0))
`byte` | -128 to 127
`short` | -32,768 to 32,767
`char` | Unicode character set (2 bytes- 65,000 values, hex x 4 [\uFFFF]*
`int` | -2,147,483,648 to 2,147,483,647
`long` | -9,223,372,036,854,775,808 through 9,223,372,036,854,775,807
`float` | Approx. +/- 10E-38 through +/- 10E38 with up to 6 dec. precision
`double` | Approx. +/- 10E-308 through +/- 10E308 with up to 15 dec. precision



- `byte`: 
  - 8-bit signed two's complement integer
  - minimum value of -128 
  - maximum value of 127 (inclusive). 
  -  useful for saving memory in large arrays, where the memory savings actually matters. They can also be used in place of int where their limits help to clarify your code; the fact that a variable's range is limited can serve as a form of documentation.

- `short`: 
  - 16-bit signed two's complement integer.
  - minimum value of -32,768 
  - maximum value of 32,767 (inclusive). 
  - As with byte, the same guidelines apply: you can use a short to save memory in large arrays, in situations where the memory savings actually matters.

- `int`: 
  - 32-bit signed two's complement integer, w
  - minimum value of -2^31^ 
  - maximum value of (2^31^)-1. 
  - [[Java SE 8+]] - can use the int data type to represent an **unsigned 32-bit integer,**
    - minimum value of 0 
    - maximum value of 2^32^ -1. 
    - Use the `Integer` class to use int data type as an **unsigned integer.** 
    
    !!!Info   See the section The Number Classes for more information. Static methods like `compareUnsigned`, `divideUnsigned` etc have been added to the `Integer` class to support the arithmetic operations for unsigned integers.

- `long`: 
  - 64-bit two's complement integer. 
  - minimum value of -2^63^
  - maximum value of (2^63^)-1. 
  - [[Java SE 8+]]  can use the long data type to represent an unsigned 64-bit long
    - minimum value of 0 
    -  maximum value of 264-1.

    !!!Info  Use this data type when you need a range of values wider than those provided by int. The Long class also contains methods like compareUnsigned, divideUnsigned etc to support arithmetic operations for unsigned long.

- `float`: 
    - float data type 
    - single-precision 32-bit `IEEE 754` floating point. 
    - [Floating-Point Types, Formats, and Values section of the Java Language Specification.](https://docs.oracle.com/javase/specs/jls/se7/html/jls-4.html#jls-4.2.3)
    
    

    
    !!! Caution  This data type should never be used for precise values, such as currency. 
        
        For that, you will need to use the `java.math.BigDecimal` class instead. Numbers and Strings covers `BigDecimal` and other useful classes provided by the Java platform.

        As with the recommendations for byte and short, use a float (instead of double) if you need to save memory in large arrays of floating point numbers.

        [BigDecimal](https://docs.oracle.com/javase/8/docs/api/java/math/BigDecimal.html)

        [Numbers and Strings](https://docs.oracle.com/javase/tutorial/java/data/index.html)

- `double`: 
    - double-precision 64-bit IEEE 754 floating point.
    - this data type is **generally the default choice.**

As mentioned above, this data type should never be used for precise values, such as currency.

- `boolean`:
    - true and false.
    - data type for simple flags
    - one bit 

- `char`: 
    - single 16-bit Unicode character. 
    - minimum value of '\u0000' (or 0)  
    - maximum value of '\uffff' (or 65,535 inclusive).




*ascii - is one byte per char (255)

Unicode - 2 bytes per character.
- 0-9 = 0030 -> 0039
- A-Z = 0041 -> 005A
- a-z = 0061 -> 007A
- tab = 0009
- lf = 000A
- return = 000D

Primitive type variables are declared.  Variables  (names) can contain letters, digits, underscore character, and $, and must start with a letter.

### Numbers

Each of the above types has a class. [Here](https://docs.oracle.com/javase/tutorial/java/data/numberclasses.html)

![Number Hierarchy](https://docs.oracle.com/javase/tutorial/figures/java/objects-numberHierarchy.gif)

"There are, however, reasons to use objects in place of primitives, and the Java platform provides wrapper classes for each of the primitive data types. These classes "wrap" the primitive in an object. Often, the wrapping is done by the compiler—if you use a primitive where an object is expected, the compiler boxes the primitive in its wrapper class for you. Similarly, if you use a number object when a primitive is expected, the compiler unboxes the object for you. For more information, see Autoboxing and Unboxing
"

!!!Note: There are four other subclasses of `Number` that are not discussed here.

    `BigDecimal` and `BigInteger` are used for high-precision calculations. 
    
    `AtomicInteger` and `AtomicLong` are used for multi-threaded applications. 

There are three reasons that you might use a Number object rather than a primitive:

1. As an argument of a method that expects an object (often used when manipulating collections of numbers).
2. To use constants defined by the class, such as MIN_VALUE and MAX_VALUE, that provide the upper and lower bounds of the data type.
3. To use class methods for converting values to and from other primitive types, for converting to and from strings, and for converting between number systems (decimal, octal, hexadecimal, binary).

The following table lists the instance methods that all the subclasses of the Number class implement.


!!!   _Methods Implemented by all Subclasses of Number Method_ 	

 **Converts the value of this Number object to the primitive data type returned.**

- byte `byteValue()`
- short `shortValue()`
- int `intValue()`
- long `longValue()`
- float `floatValue()`
- double `doubleValue()`


**Compares this Number object to the argument.**

- int `compareTo(Byte anotherByte)`
- int `compareTo(Double anotherDouble)`
- int `compareTo(Float anotherFloat)`
- int `compareTo(Integer anotherInteger)`
- int `compareTo(Long anotherLong)`
- int `compareTo(Short anotherShort)`

**Determines whether this number object is equal to the argument.**

- boolean `equals(Object obj)`

        The methods return true if the argument is not null and is an object of the same type and with the same numeric value.
        There are some extra requirements for Double and Float objects that are described in the Java API documentation.


- `static Integer decode(String s) ` - Decodes a string into an integer. Can accept string representations of decimal, octal, or hexadecimal numbers as input.
- `static int parseInt(String s) ` - Returns an integer (decimal only).
- `static int parseInt(String s, int radix) ` - Returns an integer, given a string representation of decimal, binary, octal, or hexadecimal (radix equals 10, 2, 8, or 16 respectively) numbers as input.
- `String toString() ` - Returns a String object representing the value of this Integer.
- `static String toString(int i) ` - Returns a String object representing the specified integer.
- `static Integer valueOf(int i) ` - Returns an Integer object holding the value of the specified primitive.
- `static Integer valueOf(String s) ` - Returns an Integer object holding the value of the specified string representation.
- `static Integer valueOf(String s, int radix) ` - Returns an Integer object holding the integer value of the specified string representation, parsed with the value of radix. For example, if s = "333" and radix = 8, the method returns the base-ten integer equivalent of the octal number 333.

#### Constants

There are constants for each class.  Such as `Integer.MAX_VALUE` or `Integer.MIN_VALUE` that can be accessed


### null

Only object references can be null, not primitives. In Java, int is a primitive type and it is not considered an object. Only objects can have a null value.

Use the object methods (int -> Integer)

### Strings

[Strings](https://docs.oracle.com/javase/tutorial/java/data/strings.html)

#### Methods


| Modifier and Type | Method  | Description |
| ------- | --------| ----------- |
| char  | charAt​(int index)| Returns the char value at the specified index.
| IntStream  | chars()  | Returns a stream of int zero-extending the char values from this sequence.
| int| codePointAt​(int index) | Returns the character (Unicode code point) at the  index.
| int| codePointBefore​(int index) | Returns the character (Unicode code point) before the  index.
| int| codePointCount​(int beginIndex, int endIndex) | Returns the number of Unicode code points in the specified text range of this String.
| IntStream  | codePoints()| Returns a stream of code point values from this sequence.
| int| compareTo​(String anotherString)| Compares two strings lexicographically.
| int| compareToIgnoreCase​(String str)| Compares two strings lexicographically, ignoring case differences.
| String  | concat​(String str)| Concatenates the specified string to the end of this string.
| boolean | contains​(CharSequence s)| Returns true if and only if this string contains the specified sequence of char values. 
| boolean | contentEquals​(CharSequence cs) | Compares this string to the specified CharSequence.
| boolean | contentEquals​(StringBuffer sb) | Compares this string to the specified StringBuffer.
| static String  | copyValueOf​(char[] data)| Equivalent to valueOf(char[]).
| static String  | copyValueOf​(char[] data, int offset, int count)| Equivalent to valueOf(char[], int, int).
| boolean | endsWith​(String suffix) | Tests if this string ends with the specified suffix.
| boolean | equals​(Object anObject) | Compares this string to the specified object.
| boolean | equalsIgnoreCase​(String anotherString)| Compares this String to another String, ignoring case considerations.
| static String  | format​(String format, Object... args) | Returns a formatted string using the specified format string and arguments.
| static String  | format​(Locale l, String format, Object... args)| Returns a formatted string using the specified locale, format string, and arguments. 
| byte[]  | getBytes() | Encodes this String into a sequence of bytes using the platform's default charset, storing the result into a new byte array.
| void  | getBytes​(int srcBegin, int srcEnd, byte[] dst, int dstBegin) | _**Deprecated-**_ This method does not properly convert characters into bytes.
| byte[]  | getBytes​(String charsetName) | Encodes this String into a sequence of bytes using the named charset, storing the result into a new byte array.
| byte[]  | getBytes​(Charset charset)  | Encodes this String into a sequence of bytes using the given charset, storing the result into a new byte array.
| void  | getChars​(int srcBegin, int srcEnd, char[] dst, int dstBegin) | Copies characters from this string into the destination character array.| 
| int| hashCode() | Returns a hash code for this string.
| int| indexOf​(int ch) | Returns the index within this string of the first occurrence of the specified character.
| int| indexOf​(int ch, int fromIndex) | Returns the index within this string of the first occurrence of the specified character, starting the search at the specified index. 
| int| indexOf​(String str) | Returns the index within this string of the first occurrence of the specified substring.
| int| indexOf​(String str, int fromIndex) | Returns the index within this string of the first occurrence of the specified substring, starting at the specified index.
| String  | intern() | Returns a canonical representation for the string object.
| boolean | isBlank()  | Returns true if the string is empty or contains only white space codepoints, otherwise false.
| boolean | isEmpty() | Returns true if, and only if, length() is 0.
| static String  | join​(CharSequence delimiter, CharSequence... elements)| Returns a new String composed of copies of the CharSequence elements joined together with a copy of the specified delimiter.
| static String  | join​(CharSequence delimiter, Iterable<? extends CharSequence> elements) | Returns a new String composed of copies of the CharSequence elements joined together with a copy of the specified delimiter.
| int| lastIndexOf​(int ch) | Returns the index within this string of the last occurrence of the specified character. 
| int| lastIndexOf​(int ch, int fromIndex) | Returns the index within this string of the last occurrence of the specified character, searching backward starting at the specified index.
| int| lastIndexOf​(String str)| Returns the index within this string of the last occurrence of the specified substring. 
| int| lastIndexOf​(String str, int fromIndex)| Returns the index within this string of the last occurrence of the specified substring, searching backward starting at the specified index.
| int| length() | Returns the length of this string.  
| Stream<String> | lines()  | Returns a stream of lines extracted from this string, separated by line terminators. 
| boolean | matches​(String regex) | Tells whether or not this string matches the given regular expression. 
| int| offsetByCodePoints​(int index, int codePointOffset)| Returns the index within this String that is offset from the given index by codePointOffset code points.
| boolean | regionMatches​(boolean ignoreCase, int toffset, String other, int ooffset, int len)  | Tests if two string regions are equal.
| boolean | regionMatches​(int toffset, String other, int ooffset, int len)| Tests if two string regions are equal.
| String  | repeat​(int count)| Returns a string whose value is the concatenation of this string repeated count times.
| String  | replace​(char oldChar, char newChar)| Returns a string resulting from replacing all occurrences of oldChar in this string with newChar.
| String  | replace​(CharSequence target, CharSequence replacement)| Replaces each substring of this string that matches the literal target sequence with the specified literal replacement sequence. 
| String  | replaceAll​(String regex, String replacement) | Replaces each substring of this string that matches the given regular expression with the given replacement. 
| String  | replaceFirst​(String regex, String replacement) | Replaces the first substring of this string that matches the given regular expression with the given replacement. 
| String[]| split​(String regex) | Splits this string around matches of the given regular expression. 
| String[]| split​(String regex, int limit) | Splits this string around matches of the given regular expression. 
| boolean | startsWith​(String prefix) | Tests if this string starts with the specified prefix.
| boolean | startsWith​(String prefix, int toffset)| Tests if the substring of this string beginning at the specified index starts with the specified prefix.
| String  | strip() | Returns a string whose value is this string, with all leading and trailing white space removed.
| String  | stripLeading() | Returns a string whose value is this string, with all leading white space removed.
| String  | stripTrailing()| Returns a string whose value is this string, with all trailing white space removed. 
| CharSequence| subSequence​(int beginIndex, int endIndex) | Returns a character sequence that is a subsequence of this sequence.
| String  | substring​(int beginIndex)  | Returns a string that is a substring of this string. 
| String  | substring​(int beginIndex, int endIndex) | Returns a string that is a substring of this string. 
| char[]  | toCharArray() | Converts this string to a new character array. 
| String  | toLowerCase() | Converts all of the characters in this String to lower case using the rules of the default locale. 
| String  | toLowerCase​(Locale locale) | Converts all of the characters in this String to lower case using the rules of the given Locale. 
| String  | toString() | This object (which is already a string!) | 
| String  | toUpperCase() | Converts all of the characters in this String to upper case using the rules of the default locale.  | 
| String  | toUpperCase​(Locale locale) | Converts all of the characters in this String to upper case using the rules of the given Locale. | 
| String  | trim()| Returns a string whose value is this string, with all leading and trailing space removed, where space is defined as any character whose codepoint is less than or equal to 'U+0020' (the space character). | 
| *static* String  | valueOf​(boolean b)  | Returns the string representation of the boolean argument.  | 
| *static* String  | valueOf​(char c)  | Returns the string representation of the char argument. | 
| *static* String  | valueOf​(char[] data)| Returns the string representation of the char array argument.  | 
| *static* String  | valueOf​(char[] data, int offset, int count)| Returns the string representation of a specific subarray of the char array argument. | 
| *static* String  | valueOf​(double d)| Returns the string representation of the double argument.
| *static* String  | valueOf​(float f) | Returns the string representation of the float argument.
| *static* String  | valueOf​(int i)| Returns the string representation of the int argument.
| *static* String  | valueOf​(long l)| Returns the string representation of the long argument. 
| *static* String  | valueOf​(Object obj) | Returns the string representation of the Object argument.


#### Convert a String to Byte Array
```java
    // Convert the string to a
    // byte array.
    String s = "Hello World! ";
    byte data[] = s.getBytes();
```

#### Pad a string 

[Source](https://www.baeldung.com/java-pad-string)

##### Using StringBuilder()

```java
public String padLeftZeros(String inputString, int length) {
    if (inputString.length() >= length) {
        return inputString;
    }
    StringBuilder sb = new StringBuilder();
    while (sb.length() < length - inputString.length()) {
        sb.append('0');
    }
    sb.append(inputString);
 
    return sb.toString();
}
```

##### Using SubString()

```java
StringBuilder sb = new StringBuilder();
for (int i = 0; i < length; i++) {
    sb.append(' ');
}
 
return sb.substring(inputString.length()) + inputString;
```


#####  Using String.format

since Java 5, we can use String.format():

```java
return String.format("%1$" + length + "s", inputString).replace(' ', '0');
```

We should note that by default the padding operation will be performed using spaces. That's the reason why we need to use the replace() method if we want to pad with zeros or any other character.

For the right pad, we just have to use a different flag: `%1$-`

Pad a String Using Libraries
And, there are external libraries that already offer padding functionalities.

##### Apache Commons Lang

[Apache Commons](https://www.baeldung.com/java-commons-lang-3)
[StringUtils class](https://www.baeldung.com/string-processing-commons-lang)

StringUtils

Maven Dependency:

```xml
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-lang3</artifactId>
    <version>3.8.1</version>
</dependency>
```

And then we pass the inputString and the length, just like the methods we created. We can also pass the padding character:

```java
assertEquals("    123456", StringUtils.leftPad("123456", 10));
assertEquals("0000123456", StringUtils.leftPad("123456", 10, "0"));
```


Again, the String will be padded with spaces by default or we need to explicitly set another pad character.

There are also corresponding `rightPad()` methods.



##### Google Guava

Maven Dependency:

```xml
<dependency>
    <groupId>com.google.guava</groupId>
    <artifactId>guava</artifactId>
    <version>27.0-jre</version>
</dependency>
```
And then use the Strings class:

```java
assertEquals("    123456", Strings.padStart("123456", 10, ' '));
assertEquals("0000123456", Strings.padStart("123456", 10, '0'));
```

There is no default pad character in this method, so we need to pass it every time.

To right pad, we can use `padEnd()` method.

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


`Integer[] preOrderResult = new Integer[tree.size];`

Arrays are specified in the later half;


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

See [Formatter](#Formatter)


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

**String class format( ) method:** (See Also [Strings](#Strings))  You can build a formatted String and assign it to a variable using the static format method in the String class.  The use of a format string and argument list is identical to its use in the printf method. The format method returns a reference to a String. Example: `String grandTotal = String.format("Grand Total: %,.2f", dblTotal);`

### Java.text class summary

Class 	Description
 - `Annotation ` - An Annotation object is used as a wrapper for a text attribute value if the attribute has annotation characteristics.
 - `AttributedCharacterIterator.Attribute ` - Defines attribute keys that are used to identify text attributes.
 - `AttributedString ` - An AttributedString holds text and related attribute information.
 - `Bidi ` - This class implements the Unicode Bidirectional Algorithm.
 - `BreakIterator ` - The BreakIterator class implements methods for finding the location of boundaries in text.
 - `ChoiceFormat ` - A ChoiceFormat allows you to attach a format to a range of numbers.
 - `CollationElementIterator ` - The CollationElementIterator class is used as an iterator to walk through each character of an international string.
 - `CollationKey ` - A CollationKey represents a String under the rules of a specific Collator object.
 - `Collator ` - The Collator class performs locale-sensitive String comparison.
 - `DateFormat ` - DateFormat is an abstract class for date/time formatting subclasses which formats and parses dates or time in a language-independent manner.
 - `DateFormat.Field ` - Defines constants that are used as attribute keys in the AttributedCharacterIterator returned from DateFormat.formatToCharacterIterator and as field identifiers in FieldPosition.
 - `DateFormatSymbols ` - DateFormatSymbols is a public class for encapsulating localizable date-time formatting data, such as the names of the months, the names of the days of the week, and the time zone data.
 - `DecimalFormat ` - DecimalFormat is a concrete subclass of NumberFormat that formats decimal numbers.
 - `DecimalFormatSymbols ` - This class represents the set of symbols (such as the decimal separator, the grouping separator, and so on) needed by DecimalFormat to format numbers.
 - `FieldPosition ` - FieldPosition is a simple class used by Format and its subclasses to identify fields in formatted output.
 - `Format ` - Format is an abstract base class for formatting locale-sensitive information such as dates, messages, and numbers.
 - `Format.Field ` - Defines constants that are used as attribute keys in the AttributedCharacterIterator returned from Format.formatToCharacterIterator and as field identifiers in FieldPosition.
 - `MessageFormat ` - MessageFormat provides a means to produce concatenated messages in a language-neutral way.
 - `MessageFormat.Field ` - Defines constants that are used as attribute keys in the AttributedCharacterIterator returned from MessageFormat.formatToCharacterIterator.
 - `Normalizer ` - This class provides the method normalize which transforms Unicode text into an equivalent composed or decomposed form, allowing for easier sorting and searching of text.
 - `NumberFormat ` - NumberFormat is the abstract base class for all number formats.
 - `NumberFormat.Field ` - Defines constants that are used as attribute keys in the AttributedCharacterIterator returned from NumberFormat.formatToCharacterIterator and as field identifiers in FieldPosition.
 - `ParsePosition ` - ParsePosition is a simple class used by Format and its subclasses to keep track of the current position during parsing.
 - `RuleBasedCollator ` - The RuleBasedCollator class is a concrete subclass of Collator that provides a simple, data-driven, table collator.
 - `SimpleDateFormat ` - SimpleDateFormat is a concrete class for formatting and parsing dates in a locale-sensitive manner.
 - `StringCharacterIterator ` - StringCharacterIterator implements the CharacterIterator protocol for a String.

## Formatter


[Formatter Documentation](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Formatter.html)

     

!!! example Convenience methods for common formatting requests exist as illustrated by the following invocations:

    ```java
    // Writes a formatted string to System.out.
    System.out.format("Local time: %tT", Calendar.getInstance());
    // -> "Local time: 13:34:18"

    // Writes formatted output to System.err.
    System.err.printf("Unable to open file '%1$s': %2$s",fileName, exception.getMessage());
    // -> "Unable to open file 'food': No such file or directory"
    ```
     
### Syntax

!!! info general, character, and numeric syntax
    The format specifiers for general, character, and numeric types have the following syntax:

      `%[argument_index$][flags][width][.precision]conversion`

    The _optional_ **argument_index** is a decimal integer indicating the position of the argument in the argument list. The first argument is referenced by `"1$"`, the second by `"2$"`, etc.

    The _optional_ **flags** is a set of characters that modify the output format. The set of valid flags depends on the conversion.

    The _optional_ **width** is a positive decimal integer indicating the minimum number of characters to be written to the output.

    The _optional_ **precision** is a non-negative decimal integer usually used to restrict the number of characters. The specific behavior depends on the conversion.

    The *_required_  **conversion*** is a character indicating how the argument should be formatted. The set of valid conversions for a given argument depends on the argument's data type. 



!!! info Dates and Times syntax
    
    The format specifiers for types which are used to represents dates and times have the following syntax:

       `%[argument_index$][flags][width]conversion`
     

    The _optional_ **argument_index,** **flags** and **width** are defined as above.

    The *_required_ **conversion*** is a *two character sequence.* 
    - The first character is `t` or `T`. 
    - The second character indicates the format to be used. These characters are similar to but not completely identical to those defined by GNU date and POSIX strftime(3c). 


The format specifiers which do not correspond to arguments have the following syntax:

       `%[flags][width]conversion`
     

The _optional_ **flags** and **width** is defined as above.

The *_required_  *conversion*** is a character indicating content to be inserted in the output. 

#### Defining the arguments:

 
 _Width_ - The width is the minimum number of characters to be written to the output. For the line separator conversion, width is not applicable; if it is provided, an exception will be thrown. 

 _Precision_ - For general argument types, the precision is the maximum number of characters to be written to the output.

- For the `floating-point` conversions `a`, `A`, `e`, `E`, and `f` the **precision is the number of digits after the radix point.** 
- If the conversion is `g` or `G`, then the **precision is the total number of digits in the resulting magnitude after rounding.**
- For `character, integral, and date/time` argument types and the percent and line separator conversions, the **precision is not applicable; if a precision is provided, an exception will be thrown.**

_Argument Index_ The argument index is a decimal integer indicating the position of the argument in the argument list. The first argument is referenced by "1$", the second by "2$", etc.

- Another way to reference arguments by position is to use the `<` (`\u003c`) flag, which causes the argument for the previous format specifier to be re-used. For example, the following two statements would produce identical strings:

        ```java
       Calendar c = ...;
       String s1 = String.format("Duke's Birthday: %1$tm %1$te,%1$tY", c);

       String s2 = String.format("Duke's Birthday: %1$tm %<te,%<tY", c);
       ```
     
### Conversions and Types


 Conversions are divided into the following categories:
- **General** - may be applied to any argument type
- **Character** - may be applied to basic types which represent Unicode characters: char, Character, byte, Byte, short, and Short. This conversion may also be applied to the types int and Integer when Character.isValidCodePoint(int) returns true
- **Numeric**
    - **Integral** - may be applied to Java integral types: byte, Byte, short, Short, int and Integer, long, Long, and BigInteger (but not char or Character)
    - **Floating** Point - may be applied to Java floating-point types: float, Float, double, Double, and BigDecimal
- **Date/Time** - may be applied to Java types which are capable of encoding a date or time: long, Long, Calendar, Date and TemporalAccessor
- **Percent** - produces a literal '%' ('\u0025')
- **Line Separator** - produces the platform-specific line separator

|Conversion| Argument Cat| Description                                                   |
| ------- | ------------------ | ----------------------------------------------------------- |
| `b`, `B`| general       | If arg=null= "false". if not Bool res=  String.valueOf(arg).[^B]|
| `h`, `H`| general       | result obtained by invoking Integer.toHexString(arg.hashCode()).|
| `s`, `S`| general       | If impls `Formattable`, then `->arg.formatTo()` else `->.toString()`|
| `c`, `C`| character     | result returns Unicode character                       |
| `d`     | integral      | result formatted as a decimal integer      |
| `o`     | integral      | result formatted as an octal integer       |
| `x`, `X`| integral      | result formatted as a hexadecimal integer  |
| `e`, `E`| floating point| result formatted as a decimal in computerized scientific notation|
| `f`     | floating point| result formatted as a decimal number    |
| `g`, `G`| floating point| result formatted using computerized scientific notation or decimal |
|         |               | ......format, depending on the precision and the value after rounding.|
| `a`, `A`| floating point| result formatted as a hexadecimal floating-point number with a significand and an exponent [^1] .  |
| `t`, `T`| date/time     | Prefix for date and time conversion characters. |
|         |               |See [[Date/Time Conversions.]]     |
| `%`     | percent       | result is literal `%`    ***(\\u0025)***        |
| `n`     | line separator| result is the platform-specific line separator  |

[^B]: If arg is a boolean or Boolean, then the result is the string returned by

Conversions denoted by an upper-case character (i.e. `B`, `H`, `S`, `C`, `X`, `E`, `G`, `A`, and `T`) are the same as those for the corresponding lower-case conversion characters except that **the result is converted to upper case** ... (see below). 


    According to the rules of the prevailing Locale. 
    
    If there is no explicit locale specified, either at the construction of the instance or as a parameter to its method invocation, then the default locale is used. 

!!!note In general, there is a capital letter version for any formatting that may include a letter.

Character types are indicated by a `%`  (percent) and index numbers are *followed by* a (dollar sign).

Classes -

- _General_ -
    - `b`, `B` - Boolean - nulls are false.  If its not a `boolean` value passed the String.valueOf(arg) is retuned. 
    - `h`, `H` - Is the Hex encoded Hash value of an object. It is equivalent to the result obtained by invoking `Integer.toHexString(arg.hashCode())`.
    - `s`, `S` - Strings - takes just the string *Unless* the class implements `Formattable`, then it useses the `formatTo()` class, (`->arg.formatTo()`).
- _Character_
    - `c`, `C` - result returns Unicode character.  I am sure there is some implication of this being in Unicode.  There are characters represented in doc as `\u0048`
        - It may also be applied to the types `byte`, `Byte`, `short`, and `Short`, `int` and `Integer` when `Character.isValidCodePoint(int)` returns `true`. If it returns `false` then an `IllegalFormatCodePointException` will be thrown. 
        -  	Formats the argument as a Unicode character as described in [Unicode Character Representation](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/lang/Character.html#unicode)
        
        - This may be more than one 16-bit char in the case where the argument represents a supplementary character
- _Date/Time_
    -  `t`, `T` - `$t` has its own special set of codes (shown below) its only a Prefix for date and time conversion characters. Presumably if nothing is given, it will default to some standard format
 - Numeric conversions are divided into the following categories:

 -   [**Byte, Short, Integer, and Long**](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Formatter.html#dnint)
 -   [**BigInteger**](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Formatter.html#dnbint)
 -   [**Float and Double**](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Formatter.html#dndec)
 -   [**BigDecimal**](https://docs.oracle.com/en/java/javase/12/docs/api/java.base/java/util/Formatter.html#dnbdec)

    - _Integral_
        - `d` - a decimal (base 10, *whole*) integer.
        - `o` - an octal integer       
        - `x`, `X` - a hexadecimal integer. Capital `X` returns 0x8ABC, while `x` might return 0x8abc.
    - _Floating Point_
        - `e`, `E` -gives a decimal in computerized scientific notation
        - `f` - gives a decimal number    |
        - `g`, `G` Sort of a 'smart' `%f` - where the result is formatted using computerized scientific notation or decimal format, depending on the precision and the value after rounding.
        - `a`, `A`-  result formatted as a hexadecimal floating-point number with a significand and an exponent - sort of `x+f`
            - *caveat:* this does not work on the `BigDecimal` class, despite it being a float value.




### Argument Index


You can over-ride the order with `%n` e.g.


!!! example Explicit argument indices may be used to re-order output.
    You can over-ride the order with `%n` e.g.

    ```java
    formatter.format("%4$2s %3$2s %2$2s %1$2s", "a", "b", "c", "d")
    // -> " d  c  b  a"
    ```
    You dont even necessarily need the same number of arguments as format flags, this below, has 4 references but only 3 additional arguments and throws no errors.

    ```java
    String.format( "%2$2s %3$2s %2$2s %1$2s", "a", "b", "c")
    // ->  " b  c  b  a"
    ```

    It will not throw an error if you don't use all the arguments either.

!!! example More advanced formatting can be performed, including *Locale* and *Precision*   
    Optional locale as the first argument can be used to get locale-specific formatting numbers.  
    
    The precision and width can be given to round and align the value.

    ```java
    formatter.format(Locale.FRANCE, "e = %+10.4f", Math.E);
    // -> "e =    +2,7183"
    ```
    The locale sets the fractional separator to `,` rather than `.`.  Precision format 


Format specifiers can reference arguments in three ways:

_Explicit indexing_

 used when the format specifier contains an argument index. The argument index is a decimal integer indicating the position of the argument in the argument list. The first argument is referenced by "1$", the second by "2$", etc. An argument may be referenced more than once.



```java
formatter.format("%4$s %3$s %2$s %1$s %4$s %3$s %2$s %1$s",
                "a", "b", "c", "d")
// -> "d c b a d c b a"
```
         

_Relative indexing_

used when the format specifier contains a '<' ('\u003c') flag which causes the argument for the previous format specifier to be re-used. If there is no previous argument, then a `MissingFormatArgumentException` is thrown.
```java
formatter.format("%s %s %<s %<s", "a", "b", "c", "d")
// -> "a b b b"
// "c" and "d" are ignored because they are not referenced
```
         

_Ordinary indexing_

 used when the format specifier contains neither an argument index nor a '<' flag. Each format specifier which uses ordinary indexing is assigned a sequential implicit index into argument list which is independent of the indices used by explicit or relative indexing.

```java
formatter.format("%s %s %s %s", "a", "b", "c", "d")
// -> "a b c d"
```

It is possible to have a format string which uses all forms of indexing, for example:
```java
formatter.format("%2$s %s %<s %s", "a", "b", "c", "d")
// -> "b a a b"
// "c" and "d" are ignored because they are not referenced
```

The maximum number of arguments is limited by the maximum dimension of a Java array as defined by The Java™ Virtual Machine Specification. If the argument index does not correspond to an available argument, then a MissingFormatArgumentException is thrown.

If there are more arguments than format specifiers, the extra arguments are ignored. 

### Conversion

!!!faq Conversion Codes For Formatter
    !!!Attention The following table summarizes the supported conversions

        `Conversion`  -  *Argument Category* - Description
        - **`b`**, **`B`**  -  [[general]] - If the argument arg is null, then the result is "false". If arg is a boolean or Boolean, then the result is the string returned by String.valueOf(arg). Otherwise, the result is "true".

        - **`h`**, **`H`**  -  [[general]] - The result is obtained by invoking Integer.toHexString(arg.hashCode()).

        - **`s`**, **`S`**  -  [[general]] - If arg implements Formattable, then arg.formatTo is invoked. Otherwise, the result is obtained by invoking arg.toString().
        - **`c`**, **`C`**  -  [[character]] - The result is a Unicode character
            -  It may also be applied to the types `byte`, `Byte`, `short`, and `Short`, `int` and `Integer` when `Character.isValidCodePoint(int)` returns `true`. If it returns `false` then an `IllegalFormatCodePointException` will be thrown. 
        - **`d`**  -  [[integral]] - The result is formatted as a decimal integer
        - **`o`**  -  [[integral]] - The result is formatted as an octal integer
        - **`x`**, **`X`**  -  [[integral]] - The result is formatted as a hexadecimal integer
        - **`e`**, **`E`**  -  [[floating point]] - The result is formatted as a decimal number in computerized scientific notation
        - **`f`**  -  [[floating point]] - The result is formatted as a decimal number
        - **`g`**, **`G`**  -  [[floating point]] - The result is formatted using computerized scientific notation or decimal format, depending on the precision and the value after rounding.
        - **`a`**, **`A`**  -  [[floating point]] - The result is formatted as a hexadecimal floating-point number with a significand and an exponent. This conversion is not supported for the BigDecimal type despite the latter`s being in the floating point argument category.
        - **`t`**, **`T`**  -  [[date/time]] - Prefix for date and time conversion characters. See Date/Time Conversions.
        - **`%`**  -  [[percent]] - The result is a literal `%` (`\u0025`)
        - **`n`**  -  [[line separator]] - The result is the platform-specific line separator


### Times and Dates

Time and date conversion are a formatting series all on their own, with its own set of rules.


!!! example  Like C's sprintf, Strings may be formatted using the static method `String.format`:

    ```java
    // Format a string containing a date.
    import java.util.Calendar;
    import java.util.GregorianCalendar;
    import static java.util.Calendar.*;

    Calendar c = new GregorianCalendar(1995, MAY, 23);
    String s = String.format("Duke's Birthday: %1$tb %1$te, %1$tY", c);
    // -> s == "Duke's Birthday: May 23, 1995"
    
       Calendar c = ...;
   String s = String.format("Duke's Birthday: %1$tm %1$te,%1$tY", c);
     ```

!!! Info Time Conversions

    - **`H`** -*"\u0048"* -Hour of the day for the 24-hour clock, formatted as two digits with a leading zero as necessary i.e. 00 - 23.
    - **`I`** -*"\u0049"* -Hour for the 12-hour clock, formatted as two digits with a leading zero as necessary, i.e. 01 - 12.
    - **`k`** -*"\u006b"* -Hour of the day for the 24-hour clock, i.e. 0 - 23.
    - **`l`** -*"\u006c"* -Hour for the 12-hour clock, i.e. 1 - 12.
    - **`M`** -*"\u004d"* -Minute within the hour formatted as two digits with a leading zero as necessary, i.e. 00 - 59.
    - **`S`** -*"\u0053"* -Seconds within the minute, formatted as two digits with a leading zero as necessary, i.e. 00 - 60 ("60" is a special value required to support leap seconds).
    - **`L`** -*"\u004c"* -Millisecond within the second formatted as three digits with leading zeros as necessary, i.e. 000 - 999.
    - **`N`** -*"\u004e"* -Nanosecond within the second, formatted as nine digits with leading zeros as necessary, i.e. 000000000 - 999999999.
    - **`p`** -*"\u0070"* -Locale-specific morning or afternoon marker in lower case, e.g."am" or "pm". Use of the conversion prefix `T` forces this output to upper case.
    - **`z`** -*"\u007a"* -RFC 822 style numeric time zone offset from GMT, e.g. -0800. This value will be adjusted as necessary for Daylight Saving Time. For long, Long, and Date the time zone used is the default time zone for this instance of the Java virtual machine.
    - **`Z`** -*"\u005a"* -A string representing the abbreviation for the time zone. This value will be adjusted as necessary for Daylight Saving Time. For long, Long, and Date the time zone used is the default time zone for this instance of the Java virtual machine. The Formatter`s locale will supersede the locale of the argument (if any).
    - **`s`** -*"\u0073"* -Seconds since the beginning of the epoch starting at 1 January 1970 00:00:00 UTC, i.e. Long.MIN_VALUE/1000 to Long.MAX_VALUE/1000.
    - **`Q`** -*"\u004f"* -Milliseconds since the beginning of the epoch starting at 1 January 1970 00:00:00 UTC, i.e. Long.MIN_VALUE to Long.MAX_VALUE. 


!!!Success  Dates Conversions:

    - **`B`** -*"\u0042"* -Locale-specific full month name, e.g. "January", "February".
    - **`b`** -*"\u0062"* -Locale-specific abbreviated month name, e.g. "Jan", "Feb".
    - **`h`** -*"\u0068"* -Same as `b`.
    - **`A`** -*"\u0041"* -Locale-specific full name of the day of the week, e.g. "Sunday", "Monday"
    - **`a`** -*"\u0061"* -Locale-specific short name of the day of the week, e.g. "Sun", "Mon"
    - **`C`** -*"\u0043"* -Four-digit year divided by 100, formatted as two digits with leading zero as necessary, i.e. 00 - 99
    - **`Y`** -*"\u0059"* -Year, formatted as at least four digits with leading zeros as necessary, e.g. 0092 equals 92 CE for the Gregorian calendar.
    - **`y`** -*"\u0079"* -Last two digits of the year, formatted with leading zeros as necessary, i.e. 00 - 99.
    - **`j`** -*"\u006a"* -Day of year, formatted as three digits with leading zeros as necessary, e.g. 001 - 366 for the Gregorian calendar.
    - **`m`** -*"\u006d"* -Month, formatted as two digits with leading zeros as necessary, i.e. 01 - 13.
    - **`d`** -*"\u0064"* -Day of month, formatted as two digits with leading zeros as necessary, i.e. 01 - 31
    - **`e`** -*"\u0065"* -Day of month, formatted as two digits, i.e. 1 - 31. 


!!!Fail Common date/time compositions. 
    
    The following conversion characters are used for formatting common date/time compositions.
    - **`R`** -*"\u0052"* -Time formatted for the 24-hour clock as "%tH:%tM"
    - **`T`** -*"\u0054"* -Time formatted for the 24-hour clock as "%tH:%tM:%tS".
    - **`r`** -*"\u0072"* -Time formatted for the 12-hour clock as "%tI:%tM:%tS %Tp". The location of the morning or afternoon marker (`%Tp`) may be locale-dependent.
    - **`D`** -*"\u0044"* -Date formatted as "%tm/%td/%ty".
    - **`F`** -*"\u0046"* -ISO 8601 complete date formatted as "%tY-%tm-%td".
    - **`c`** -*"\u0063"* -Date and time formatted as "%ta %tb %td %tT %tZ %tY", e.g. "Sun Jul 20 16:17:00 EDT 1969". 

### Flags
    
| Flag | Gen | C | I  | F  | D/T | Description                                                 |
| ---- | --- | - | -- | -- | --- | ----------------------------------------------------------- |
| '-'  | y   | y | y  | y  | y   | The result will be left-justified.                          |
| '#'  | y1  | - | y3 | y  | -   | The result should use a conversion-dependent alternate form |
| '+'  | -   | - | y4 | y  | -   | The result will always include a sign                       |
| '  ' | -   | - | y4 | y  | -   | The result will include a leading space for positive values |
| '0'  | -   | - | y  | y  | -   | The result will be zero-padded                              |
| ','  | -   | - | y2 | y5 | -   | The result will include locale-specific grouping separators |
| '('  | -   | - | y4 | y5 | -   | The result will enclose negative numbers in parentheses     |
| '<'  | ?   | ? | ?  | ?  | ?   | The result will enclose negative numbers in parentheses     |


The following works on all types: 
- `-` -  **Left Justifies** result.  Works on all types.
    - `#` - result should use a **conversion-dependent alternate form**, which varies depending on Formatter definition (Y^1^). 

- Works on `General`, and `Integers` and `Floats` (Numerics)
    - `+` result will **always include a sign**, works on `Integers` and `Floats` (Numerics)
    - ` ` result will **include a leading space for positive values** (for formatting tables, etc, that may have negatives as well.) 
- The remaining only work on Numeric types `Integers` and `Floats`
    - `0` - The result is zero padded.  
        - `Integer`- for 'd' conversion only.
        - `Floating Point` - For 'e', 'E', 'f', 'g', and 'G' conversions only. (E and G are scientific notation, while F is a general float.)
    - `,` -  result includes locale-specific grouping separators, e.g `1.002.934,99` if appropriate.
    - `(` - show negative numbers in parentheses.

!!! example The `(` numeric flag may be used to format negative numbers with  parentheses rather than a minus sign.  Group separators are automatically inserted.
    ```java
       formatter.format("Amount gained or lost since last statement: $ %(,.2f",balanceDelta);
       // -> "Amount gained or lost since last statement: $ (6,217.58)"
    ```


 Any characters not explicitly defined as conversions, date/time conversion suffixes, or flags are illegal and are reserved for future extensions. Use of such a character in a format string will cause an `UnknownFormatConversionException` or `UnknownFormatFlagsException` to be thrown.

If the format specifier contains a width or precision with an invalid value or which is otherwise unsupported, then a `IllegalFormatWidthException` or `IllegalFormatPrecisionException` respectively will be thrown.

If a format specifier contains a conversion character that is not applicable to the corresponding argument, then an `IllegalFormatConversionException` will be thrown.

All specified exceptions may be thrown by any of the format methods of Formatter as well as by any format convenience methods such as `String.format` and P`rintStream.printf`.

For category General, Character, Numberic, Integral and Date/Time conversion, unless otherwise specified, if the argument arg is null, then the result is "null". 

[^1]: This conversion is not supported for the BigDecimal type despite the latter's being in the floating point argument category.

### Decimal Format

[Source](https://www.java67.com/2014/06/how-to-format-float-or-double-number-java-example.html)



But the best method for task is using DecmialFormat class, which is actually designed to format any number in Java be it integer, float or double. While creating instance of DecimalFormat class, you can pass it a formatting string, which is bit different then what you pass to these format method, but I guess its more readable. This string specifies up-to how many decimal places you want to format the input. Here is a quick example of formatting double and float numbers using DecimalFormat class.

```java 
    DecimalFormat df = new DecimalFormat("#.##");
String formatted = df.format(2.456345); 
System.out.println(formatted);  //prints 2.46
```


The string "#.##" indicate that we are formatting up-to 2 decimal points, "#.###" indicates formatting number up-to 3 decimal places. By the way, even DecimalFormat rounds the number if next decimal point is more than 5.

[More](https://www.java67.com/2014/06/how-to-format-float-or-double-number-java-example.html#ixzz6N3U5zPsn)

```java 
        results.setTime_micros(simpleTimer.getResultMicroS()  );
    results.setTime_millis( simpleTimer.getResultMilliS() );


  class Results{
    public String time_micros;
    public String time_millis;
    private final DecimalFormat microsFormat = new DecimalFormat("####.###");
    private final DecimalFormat millisFormat =
          new DecimalFormat("###.####");

        public void setTime_micros(double micros){
      this.time_micros = microsFormat.format( micros );
    }
    public void setTime_millis(double millis){
      this.time_micros = microsFormat.format( millis );
    }
```



## Classes and Methods

### Method main

### Field (and Method) Modifiers

#### Access Control

!!!tldr Class can be public (everywhere) or nothing(package private). Methods

A method can be **public**, **private**, **package private**.

Access level modifiers determine whether other classes can use a particular field or invoke a particular method. There are two levels of access control:

At the top level—`public`, or `package-private` (no explicit modifier eg "" or blank, or no specification is package-private).

At the member level—`public`, `private`, `protected`, or `package-private` (no explicit modifier).

A class may be declared with the modifier `public`, in which case that class is visible to all classes everywhere. If a class has no modifier (the default, also known as `package-private`), it is visible only within its own package (packages are named groups of related classes — you will learn about them in a later lesson.)

At the member level, you can also use the `public` modifier or no modifier (`package-private`) just as with top-level classes, and with the same meaning. For members, there are two additional access modifiers: `private` and `protected`. The `private` modifier specifies that the member can only be accessed in its own class.

The _`protected`_ modifier specifies that the member can only be accessed within its own package (as with package-private) and, in addition, by a subclass of its class in another package.

[Source](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html)

#### Other Modifiers

`synchronized` - when applied to a method or code block, guarantees that at most one thread at a time executes that code. 

`transient`tells the Java object serialization subsystem to exclude the field when serializing an instance of the class. When the object is then deserialized, the field will be initialized to the default value; i.e. null for a reference type, and zero or false for a primitive type.  Presumably, the field it modifies, should be of a class that implements `serializable`

`volatile` - tells the compiler that the variable modified by volatile can be changed unexpectedly by other parts of your program. One of these situations involves multithreaded programs.  In a multithreaded program, sometimes, two or more threads share the same instance variable. For efficiency considerations, each thread can keep its own, private copy of such a shared variable. The real (or master) copy of the variable is updated at various times, such as when a synchronized method is entered. While this approach works fine, it may be inefficient at times. In some cases, all that really matters is that the master copy of a variable always reflects its current state. To ensure this, simply specify the variable as volatile, which tells the compiler that it must always use the master copy of a volatile variable (or, at least, always keep any private copies up to date with the master copy, and vice versa). Also, accesses to the master variable must be executed in the precise order in which they are executed on any private copy.


  `strictfp`  keyword in java used for restricting floating-point calculations and ensuring same result on every platform while performing operations in the floating-point variable.
Floating point calculations are platform dependent i.e. different output(floating-point values) is achieved when a class file is run on different platforms(16/32/64 bit processors). To solve this types of issue, strictfp keyword was introduced in JDK 1.2 version by following IEEE 754 standards for floating-point calculations. 

[Source](https://www.geeksforgeeks.org/strictfp-keyword-java/)


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
    this.modelYear = year;
    this.modelName = name;
  }

  public static void main(String[] args) {
    Car myCar = new Car(1969, "Mustang");
    System.out.println(myCar.modelYear + " " + myCar.modelName);
  }
}
```

### Factory Method

Simple Factory Method Example 

```java
SimpleTimer(){
    started = false;
    ended = false;
  }
```

is replaced with:

```java 
  private SimpleTimer(){
    started = false;
    ended = false;
  }
  
  static SimpleTimer createSimpleTimer(){
    return new SimpleTimer();
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
       Inner in = new Outer().new Inner();
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

```java
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

    public static GFG getInstance(){
        if (instance == null){
            //synchronized block to remove overhead
            synchronized (GFG.class){
                if(instance==null){
                    // if instance is null, initialize
                    instance = new GFG();
                }
            }
        }
        return instance;
    }
}

```


**Bill Pugh Singleton Implementation:** Prior to Java5, memory model had a lot of issues and above methods caused failure in certain scenarios in multithreaded environment. So, Bill Pugh suggested a concept of inner static classes to use for singleton.

```java
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
```

### varArgs `...`

[Source: The Java Programming Language specification](http://docs.oracle.com/javase/specs/)

, where the technical term is `variable arity parameter` rather than the common term **varargs.**

`...` represent varargs. They let you pass any number of objects of a specific type (in this case they are of type JID).

[Documentation](http://java.sun.com/j2se/1.5.0/docs/guide/language/varargs.html)



```java

public MessageBuilder withRecipientJids(JID... recipientJids)
/*In your example, the following function calls would be valid:*/

MessageBuilder msgBuilder; //There should probably be a call to a constructor here ;)
MessageBuilder msgBuilder2;
msgBuilder.withRecipientJids(jid1, jid2);
msgBuilder2.withRecipientJids(jid1, jid2, jid78_a, someOtherJid);

```

The way to use the ellipsis or varargs inside the method is as if it were an array:


```java
public void PrintWithEllipsis(String...setOfStrings) {
    for (String s : setOfStrings)
        System.out.println(s);
}

//This method can be called as following:

obj.PrintWithEllipsis(); // prints nothing
obj.PrintWithEllipsis("first"); // prints "first"
obj.PrintWithEllipsis("first", "second"); // prints "first\nsecond"
```

Inside PrintWithEllipsis, the type of setOfStrings is an array of String. So you could save the compiler some work and pass an array:

```java
String[] argsVar = {"first", "second"};
obj.PrintWithEllipsis(argsVar);
```

For varargs methods, a sequence parameter is treated as being an array of the same type. So if two signatures differ only in that one declares a sequence and the other an array, as in this example:

```java
void process(String[] s){}
void process(String...s){}
```

then a compile-time error occurs.


### Get Class name

[Source](https://stackoverflow.com/questions/6271417/java-get-the-current-class-name)



You may want to get the class name for the purpose of prining error messages and what not-

You can do it like this:

```java
Class<?> enclosingClass = getClass().getEnclosingClass();
if (enclosingClass != null) {
  System.out.println(enclosingClass.getName());
} else {
  System.out.println(getClass().getName());
}
```


`this.getClass().getCanonicalName()`
`this.getClass().getSimpleName()`

if the class is static:  You cant use this.

Then you need the class name

<Class>.getSimpleName();

This also gets the method name.

```java
Class thisClass = new Object(){}.getClass();
String className = thisClass.getEnclosingClass().getSimpleName();
String methodName = thisClass.getEnclosingMethod().getName();
Log.d("app", className + ":" + methodName);
```


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
- 3   
  - `*`,Multiply, 
  - `/`, divide, 
  - `%` - remainder Left
- 4 - Addition or Subtraction--   
- `+` Addition or string concatenation Left 
- `‐` Subtraction
- 5
  -  `<<` Signed bit shift left Left
  - `>>` Signed bit shift right
    - `>>>` Unsigned bit shift right
- 6
  - `<` ,Less than,
  - `<=`  less than or equal Left
  - `>`, Greater than,
  - `>=` -  greater than or equal instanceof Reference test
- 7   - `==` Equal to Left  - `!=` Not equal to
- 8 -  `&` Bitwise and Left
- 9 - `^` -  Bitwise exclusive or Left
- 10 - `|` Bitwise or Left
- 11 - `&&` Logical and Left
- 12 -  `||` - Logical or Left
- 13 - `?:` - Conditional Left
- 14 - `=` -  Assignment Right
Compound assignment:

*=, /=, %=, +=, ‐=,
<<=, >>=, >>>=, &=, |=


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

Many operators below do not apply to objects.  They only apply to primatives.  Operator methods cannot be added to or overwritten.  E.g. you cannot extend MyClass to have a `+` method such that `MyClass myClassA + myClassB = ?` compiles

Because the remainder (%) and unary plus (+=) operators do not apply to Integer objects, you may wonder why the Java compiler compiles the method without issuing any errors. The compiler does not generate an error because it invokes the intValue method to convert an Integer to an int at runtime:

```java 
    public static int sumEven(List<Integer> li) {
    int sum = 0;
    for (Integer i : li)
        if (i.intValue() % 2 == 0)
            sum += i.intValue();
        return sum;
}
```

Converting an object of a wrapper type (Integer) to its corresponding primitive (int) value is called unboxing. The Java compiler applies unboxing when an object of a wrapper class is:

    Passed as a parameter to a method that expects a value of the corresponding primitive type.
    Assigned to a variable of the corresponding primitive type.

#### Operator Precedence

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

Note, PostFix is higher precedence than Prefix.

 Compound assignmen: 

- `*=`
- `/=`
- `%=`
- `+=`
- `‐=`
- `<<=`
- `>>=`
- `>>>=`
- `&=`
- `|=`
       t

        a *= x is the same as a = a * x
        a += x is the same as a = a + x
        a &= x is the same as a = a & x
        etc...

Another [Source](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/opsummary.html)


- Simple Assignment Operator
    - [[=]] - Simple assignment operator
- Arithmetic Operators
    - [[+]] - Additive operator (also used
- for String concatenation)
    - [[-]] - Subtraction operator
    - [[*]] - Multiplication operator
    - [[/]] - Division operator
    - [[%]] - Remainder operator
- Unary Operators
    - [[+]] - Unary plus operator; indicates positive value (numbers are positive without this, however)
    - [[-]] - Unary minus operator; negates an expression
    - [[++]] - Increment operator; increments a value by 1
    - [[--]] - Decrement operator; decrements a value by 1
    - [[!]] - Logical complement operator; inverts the value of a boolean
- Equality and Relational Operators
    - [[==]] - Equal to
    - [[!=]] - Not equal to
    - [[>]] - Greater than
    - [[>=]] - Greater than or equal to
    - [[<]] - Less than
    - [[<=]] - Less than or equal to
- Conditional Operators
    - [[&&]] - Conditional-AND
    - [[||]] - Conditional-OR
- Type Comparison Operator
    - `instanceof` - Compares an object to a specified type
- [Bitwise and Bit Shift Operators](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/op3.html)


    - [[~]] - Unary bitwise complement
    - [[<<]] - Signed left shift
    - [[>>]] - Signed right shift
    - [[>>>]] - Unsigned right shift
    - [[&]] - Bitwise AND
    - [[^]] - Bitwise exclusive OR
    - [[|]] - Bitwise inclusive OR


#### Conditional Evaluation (Lavy Eval)

The && and || operators perform Conditional-AND and Conditional-OR operations on two boolean expressions. These operators exhibit "short-circuiting" behavior, which means that the second operand is evaluated only if needed. Also referred to lazy evaluation.

So something like the example below wont throw an error, even though the second statement does.  The first is false, so the whole statement fails.

```java
 if ( objectNotExisting != null && objectNotExisting.instaceOf(objectB)){
     continue;
 }

objectNotExisting.instaceOf(objectB) //throws error

```


#### Type Comparison

The `instanceof` operator compares an object to a specified type. You can use it to test if an object is an _instance of a class,_ an instance of a *subclass,* or an *instance of a class that implements a particular interface.*

The following program, [InstanceofDemo](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/op2.html), defines a parent class (named Parent), a simple interface (named MyInterface), and a child class (named Child) that inherits from the parent and implements the interface.

```java
class InstanceofDemo {

    public static void main(String[] args) {

/*
class Parent {}
class Child extends Parent implements MyInterface {}
interface MyInterface {}
*/

        Parent obj1 = new Parent();
        Parent obj2 = new Child();

        System.out.println("obj1 instanceof Parent: "
            + (obj1 instanceof Parent));
            /* true  */
            /* obj1 instanceof Parent: true  */
        System.out.println("obj1 instanceof Child: "
            + (obj1 instanceof Child));
            /* false  */
            /*obj1 instanceof Child: false  */
        System.out.println("obj1 instanceof MyInterface: "
            + (obj1 instanceof MyInterface));
            /* false  */
            /* obj1 instanceof MyInterface: false  */
        System.out.println("obj2 instanceof Parent: "
            + (obj2 instanceof Parent));
            /* true  */
            /* obj2 instanceof Parent: true  */
        System.out.println("obj2 instanceof Child: "
            + (obj2 instanceof Child));
            /* true  */
            /* obj2 instanceof Child: true */
        System.out.println("obj2 instanceof MyInterface: "
            + (obj2 instanceof MyInterface));
            /* true  */
            /* obj2 instanceof MyInterface: true  */
    }
}

class Parent {}
class Child extends Parent implements MyInterface {}
interface MyInterface {}

/*Results shown above*/
```



When using the instanceof operator, keep in mind that null is not an instance of anything.



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
      public static void main(String[] args){
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


```C# 
    using System;
using System.Text.RegularExpressions;

public class Example
{
   public static void Main()
   {
      string pattern = @"\p{Sc}*(?<amount>\s?\d+[.,]?\d*)\p{Sc}*";
      string replacement = "${amount}";
      string input = "$16.32 12.19 £16.29 €18.29  €18,29";
      string result = Regex.Replace(input, pattern, replacement);
      Console.WriteLine(result);
   }
}
// The example displays the following output:
//       16.32 1
```



### Syntax

String s = " ()()()"
Pattern ->  Pattern.compile(s);
Matcher matcher = new Matcher(Pattern , String)
MatchResult m
scanner.findInLine( "([0-9]*)(K)" );
MatchResult matchResult1 = scanner.match();

### RegEx Utilization

```java

String nextToken = "10K";
Scanner scanner = new Scanner(nextToken);
scanner.findInLine( "([0-9]*)(K)" );
MatchResult matchResult1 = scanner.match();
matchResult1.group( 0 ).toString(); //== both matches '10K'
matchResult1.group( 1 ).toString();// the first match group '10'
matchResult1.group( 2 ).toString();//the second match group 'K'
```


If `K` may or may not appear, as in this case, then you need to use (K*) meaning 0 or more `K's`,

```java
nextToken = "10K";
Scanner scanner = new Scanner(nextToken);
scanner.findInLine( "([0-9]*)(K*)" );
MatchResult matchResult1 = scanner.match();
      Integer i = Integer.valueOf( matchResult1.group( 1 ) ;
      Integer j =(matchResult1.group(2).equals( "K" )) ? 1000 : 1 ;
      count = i * j;
```


This example shows the syntax and arrangement 

Though it should be noted that this is NOT WORKING right now.



```java
      String      nextToken = fileName.substring( 3 );
      Pattern     pattern = Pattern.compile( "([0-9]*?)([kK])" );
      MatchResult matchResult = pattern.matcher( nextToken ).toMatchResult();
      MatchResult matchResult2 =
            Pattern.compile( "([0-9]*?)" )
                   .matcher( nextToken )
                   .toMatchResult()
                   .group( 0 );
                  Matcher matcher = new Matcher( pattern , nextToken.toCharArray() );
```

## Date and Times

[Source](https://www.javatpoint.com/java-get-current-date)


Simple Method

```java
//1
import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;    
/*... */
   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
   LocalDateTime now = LocalDateTime.now();  
   System.out.println(dtf.format(now));  

//2

import java.text.SimpleDateFormat;  
import java.util.Date;  
/*... */
   SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
    Date date = new Date();  
    System.out.println(formatter.format(date));  

//3
System.out.println(java.time.LocalDate.now());  

//4
System.out.println(java.time.LocalTime.now());  
```

## Control Statements

[Documentation](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)



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

[Language Basics Tutorial](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/index.html)


[Control Flow Statements](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flow.html)

[For Loops](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/for.html)

[Branch Statements](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/branch.html)


!!!example Most Generally:

    The for statement provides a compact way to iterate over a range of values. Programmers often refer to it as the "for loop" because of the way in which it repeatedly loops until a particular condition is satisfied. The general form of the for statement can be expressed as follows:

            for (  initialization; 
                    termination;
                      increment  ) {
                statement(s)
            }



The three expressions of the for loop are optional; an infinite loop can be created as follows:

        // infinite loop
        for ( ; ; ) {
            
            // your code goes here
        }

#### Enhanced For Loop

The for statement also has another form designed for iteration through Collections and arrays This form is sometimes referred to as the enhanced for statement, and can be used to make your loops more compact and easy to read. To demonstrate, consider the following array, which holds the numbers 1 through 10:



The following program, EnhancedForDemo, uses the enhanced for to loop through the array:

```java
int[] numbers = {1,2,3,4,5,6,7,8,9,10};

class EnhancedForDemo {
    public static void main(String[] args){
         int[] numbers = 
             {1,2,3,4,5,6,7,8,9,10};
         for (int item : numbers) {
             System.out.println("Count is: " + item);
         }
    }
}
```

!!!attention In the Java Documentation- they recommend using the 'enhanced form' over the 'general form' whenever possible.

in this form: we have initializer; terminator; then no iterator as its built in...

        for(Iterator<Path> i = path.iterator(); i.hasNext(); ){
        
        }

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

**Syntax**

for(Class var : Collection){

}

Works with any collection- Emnums, Arrays, etc.
```Java
// JAVA program to iterate over an array using for loop
import java.io.*;
class GFG {

	public static void main(String[] args) throws IOException
	{
		int[] ar = { 1, 2, 3, 4, 5, 6, 7, 8 };
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

Iterating over an array:
and in this example, iterating over an array of arrays, created on the fly

```java
  for( Handler[] handlers : new Handler[][]{ 
        GLOBAL_LOGGER.getHandlers() ,
        LOG.getHandlers() ,
        LOG.getParent().getHandlers() 
                    }
                     ){
    for( Handler handler : handlers ){
    //should just have a console handler
      if(handler instanceof ConsoleHandler){
        /*Code Action*/
      }
  }
```

`for( Handler[] handlers : {GLOBAL_LOGGER.getHandlers() ,
        LOG.getHandlers() ,
        LOG.getParent().getHandlers() }` doesnt work, but declaring it, as an an array of the same type then it does work.



### Iterating over iterators

```java

for( DataSet d : dataList){
 //included this because its notable of its inclusion of two initial variables defined within the loop.
 
      for (int i=0, n=d.getSize(); i < n; i++  ){
        d.getValue( i );
      }
      
      //this is the example one
      for( Iterator i = d.iterator() ; i.hasNext();){
        i.next();
      }
}

 for (Iterator i=list.iterator(); i.hasNext(); )
          i.next();
 
````

The same can be done for enums

#### ForEach() Enums

For more see [Enum Iteration](#Enum-Iteration)


`forEach()` is a member of several classes and operates on "consumers" e.g. `default void forEach​(BiConsumer<? super K,​? super V> action)` in java.util.map


```java
    public static void forEnums()
    {
        // iterate over enums using for loop
        for (seasons s : seasons.values()) {
            System.out.println(s);
        }
    }

```


##### Examples

You can get pretty crazy in these loops-
see these two working examples:

```java
                 int entered = 0;
          
          
          for(  ; itr.hasNext() ; entered += 1){
            if( entered < count ) break;
            printWriter.println( itr.next() );
          }
           
           //or
        for(  ; itr.hasNext() ;){
            if( entered < count ) break;
            printWriter.println( itr.next() );
             entered += 1;
        }

        //or even

        for(  ;  ; ){
            if( entered >= count ) break;
            printWriter.println( itr.next() );
             entered += 1;
             if(!itr.hasNext())break;
        }

```
the last works because remember (; ;) is an infinite loop.  And weve moved all the exits into the loop.  We break there.

Here I have two variables with two exit params as above.   One is completion, and the latter, !hasNext is really an error state.

```java       
          for(Integer ct = 0,  i = itr.next(); 
              (itr.hasNext() &&  ct < count); 
            itr.next() , ct++ );
          {
            printWriter.println( itr.next() );
          }
```      


### Enums

Enum class is present in java.lang package. It is the common base class of all Java language enumeration types. For information about enums, refer enum in java

!!!Info Definition:

        public abstract class Enum<E extends Enum>
        extends Object
        implements Comparable, Serializable


Enums have 10 specific methods that are over-ridden from the general Object Class. These methods are declared as final in Enum class so the programmer cannot modify any of the enum constants.

!!!Info Methods

    - **public final String `name()`** - returns the name of the enum Constant
    - **public final int `ordinal()`** - returns the ordinal of this enum constant (its numerical position in the list. *0 indexed*)
    - **public String `toString()`** -  same as name()
    - **public final boolean `equals(Object obj)`** -  returns true if the specified object is equal to this enum constant
    - **public final int `hashCode()`** - actually calls `return super.hashCode()` so its the same as Object Class.
    - **public int `compareTo(E obj)`** -  “compares” this enum with the specified object for order. Enum constants are only comparable to other enum constants of the same enum type. **1**
    - **public static <T extends Enum> T `valueOf(Class enumType,String name)`** - valueOf looks up an Enum by its name, must match exactly. **2**
    - **public final Class <E> `getDeclaringClass()`** - returns the Class object corresponding to this enum constant’s enum type. Any Two enum constants e1 and e2 are of the same enum type if this method returns the same Class object for both. 
    - **public final Object `clone()` throws CloneNotSupportedException** - This method guarantees that enums are never cloned, which is necessary to preserve their “singleton” status. It is used internally by compiler to create Enum constants. 
    -   **protected final void `finalize()`** -  This method guarantees that enum classes cannot have finalize methods.

Footnotes : 


(1) - Actually compares the Enum.ordinal() values, returning -1 if comes before, 1 if it comes after and 0 if its the same.

(2) - `valueOf` method

        TypeParameters : 
        T - The enum type whose constant is to be returned
        Parameters : 
        enumType - the Class object of the enum type from which to return a constant
        name - the name of the constant to return
        Returns :
        the enum constant of the specified enum type with the specified name
        Throws :
        IllegalArgumentException - if the specified enum type has no 
        constant with the specified name or the specified class object
        does not represent an enum type
        NullPointerException - if enumType or name is null



// Java program to demonstrate valueOf() method 
```java
enum Color 
{ 
    RED, GREEN, BLUE 
} 
   
public class Test 
{ 
    // Driver method 
    public static void main(String[] args) 
    { 
        // getting value of enum with specified String 
        // using valueOf method 
        Color c1 = Color.valueOf("RED"); 
        Color c2 = Color.valueOf("GREEN"); 
          
        // name method 
        System.out.println(c1.name()); 
        System.out.println(c2.name()); 
          
        // The following statement throw IllegalArgumentException 
        // as GrEEN is not an enum constant 
        //  Color c3 = Color.valueOf("GrEEN"); 
           
        // The following statement throw NullPointerException 
        // as argument of valueOf method is null 
       // Color c4 = Color.valueOf(null); 
    } 
} 

    // Driver method 
    public static void compareToDemo(String[] args) 
    { 
        Color c1 = Color.RED; 
        Color c2 = Color.GREEN; 
        Color c3 = Color.RED; 
        Color c4 = Color.BLUE; 
          
        System.out.print("Comparing "+c1.name()+" with "+ c2.name() +" : "); 
          
        // compareTo method 
        System.out.println(c1.compareTo(c2)); 
          
        System.out.print("Comparing "+c1.name()+" with "+ c3.name() +" : "); 
          
        // compareTo method 
        System.out.println(c1.compareTo(c3)); 
          
        System.out.print("Comparing "+c4.name()+" with "+ c2.name() +" : "); 
          
        // compareTo method 
        System.out.println(c4.compareTo(c2)); 
          
        // The following statement throw NullPointerException 
        // as argument of compareTo method is null 
        // System.out.println(c4.compareTo(null)); 
         
    } 


```




### Enum Iteration

//TODO https://www.geeksforgeeks.org/java-lang-enum-class-java/ check and see if this is useful.  Just skimmed it.

```Java
// Program that demonstrates iteration
// over enums using forEach()
import java.util.Arrays;
import java.util.EnumSet;

public class GFG {
    public enum seasons 
    {
        Spring,
        Summer,
        Monsoon,
        Autumn,
        Winter
    }

import java.util.EnumSet
    public void iterEnum()
    {
        // Convert enum to set and apply forEach()
        EnumSet.allOf(GFG.seasons.class)
            .forEach(season -> System.out.println(season));
    }

import java.util.Arrays

    public void iterSet()
    {
        // Convert enum to set and apply forEach()
        Arrays.asList(GFG.seasons.values()).forEach(season ->
                                 System.out.println(season));
    }

    public static void forEnums()
    {
        // iterate over enums using for loop
        for (GFG.seasons s : GFG.seasons.values()) {
            System.out.println(s);
        }
    }
import java.util.stream.Stream

    public void iterStream(){
                // iteration over enum using java.util.stream
        Stream.of(GFG.seasons.values()).forEach(System.out::println);
    }
}
```

This seems to be another method in the documentation for `Interface Enumeration<E>` This is also an unfamiliar form of `for`

For example, to print all elements of a Vector<E> v: 

```java
for (Enumeration<E> e = v.elements(); e.hasMoreElements();){
    System.out.println(e.nextElement());

}
/* Practical Example*/

    Enumeration<String> logNames   = logManager.getLoggerNames();
    
    for(Enumeration<String> lN = logNames ; logNames.hasMoreElements();){
      Handler[]   handlers   = classLogger.getHandlers();
      for (Handler handler : classLogger.getHandlers() )
        if( handler instanceof ConsoleHandler ){
          classLogger.removeHandler( handler );
        }
      logNames.nextElement();
    }

//this works
    for(Enumeration<String> lN = logManager.getLoggerNames() ; logNames.hasMoreElements();){

//and this:

    
//defined outside the for loop it does not work:

    Enumeration<String> logNames   = logManager.getLoggerNames();
    for(logNames; logNames.hasMoreElements();){

//        also
    Enumeration<String> logNames   = logManager.getLoggerNames();
    for(logNames; logNames.hasMoreElements();){

```


[Iterating over Enums](https://www.baeldung.com/java-enum-iteration)


Iterate Using java.util.stream: Iteration over enum can also be done using java.util.stream class. Create the stream of enum.values() using Stream.of() method by passing eum.values() at parameter to function.
Below program illustrate the iteration over enum using java.util.stream:


### Branching Statements (break, continue, return)

[Official Doc](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/branch.html)



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


##### return

The return statement exits from the current method, and control flow returns to where the method was invoked. The return statement has two forms: one that returns a value, and one that doesn't. 


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

### Streams

#### Random Number Generator Example
 
 Cant set a max and min on this method.
 
 Random rng = new Random( SEED );

```java
  @Test
  void testOverFill(){
    int i = 1000000;
    Records r = new Records( "overflowTest" );
    final int SEED = 999;
    Random rng = new Random( SEED );

//    IntStream intStream = rng.ints( 0 , 100000 );
//    intStream.limit( i + i / 100 ); //101%
    for( int j = 0 ; j < i ; j++ ) r.add( rng.nextInt() );
    System.out.println( r );
  }
  
```

but you can here...

```java
  void testStream(){
    final int SEED = 999,
          MIN = 0,
          MAX = Integer.MAX_VALUE;
    Records r = new Records( "testStream" );
    IntStream intStream = new Random( SEED ).ints( MIN , MAX );
    r.add(
    intStream.boxed().toArray( Integer[]::new )
         );
  }

```

#### Boxing and unboxing arrays

```java
  public Integer[] castIntArray(int[] intArray){
    return Arrays.stream( intArray ).boxed().toArray( Integer[] :: new );
    
  }
//or

  public Integer[] castIntArray(int[] intArray){
   return IntStream.of( intArray ).boxed().toArray(Integer[]::new);
  }


```
      IntStream intStream = rng.ints( count,min , max );

.boxed()-

Stream<Integer> streamofIntegers= rng.ints( count,min , max ).boxed();


.Iterator()-
Iterator<Integer> intIter = rng.ints( count,min , max ).Iterator();

.Sequential()-

.map( i -> max - i - 1 )- allegedly this maps in reverse order...


.toArray()-
        int[] arr = streamofIntegers.sequential().toArray();

`.orElse(alternateValue)` -  in this example returns NA rather than an error when the requested data is empty.

To answer the second part of your question, if you want to avoid the exception when the list is empty and return some double value, use orElse instead of getAsDouble:

return weightChanges.stream()
    .mapToDouble(WeightChange::getValue)
    .average()
    .orElse(Double.NaN);


`.average()` - get the running average as the stream.


maybe also related -in the `OptionalDouble` class:

`orElse​(double other)` If a value is present, returns the value, otherwise returns other.
`double orElseGet​(DoubleSupplier supplier)` If a value is present, returns the value, otherwise returns the result produced by the supplying function.
`double orElseThrow()` 
`void ifPresent​(DoubleConsumer action)` If a value is present, performs the given action with the value, otherwise does nothing.
`void ifPresentOrElse​(DoubleConsumer action, Runnable emptyAction)`
#### More Integer Generators


`.distinct()`  to hopefully get unique values.


```java

Random        rng       = new Random( seed );
          int entered = 0;
  
            for( Iterator<Integer> itr =
                 rng.ints( min , max ).distinct().iterator() ; itr.hasNext() ; ){
              if(entered < count)break;
              printWriter.println(
                    itr.next()
                                 );
              count += 1;
            }
```


```java

  
  public static Iterator<Integer> integerIterator ( int count, int min, int max,
                                             boolean allowDups,
                                             DataType dataType){
    
    int    seed = (int)Math.random() * 1000;
    Random          rng              = new Random( seed );
//    Stream<Integer> streamofIntegers = rng.ints( count,min , max ).boxed();
    //Note- cant do count, as I thought this is the initial values, not the
    // final value count.  So that, when duplicates are removed. etc counts
    // are lowered...
    
    Stream<Integer> streamofIntegers = rng.ints( count,min , max ).boxed();
    //store ref to close this.
    stream = streamofIntegers;
    switch( dataType ){
      case DESCENDING:
      case REVERSE:
        if(allowDups){
          // to reverse the stream we cab map, or we can convert to
          // Stream<Integ> first and then Reverse(), and then -> IntStream();
          return streamofIntegers.sequential().map( i -> max - i - 1 ).iterator();
        }else{
          return streamofIntegers.distinct().sequential().map( i -> max - i - 1 ).iterator();
        }
      case ASCENDING:
        if (allowDups){
          return streamofIntegers.sequential().iterator();
        }else{
          return streamofIntegers.sequential().distinct().iterator();
        }
      case DUPLICATE:
        return streamofIntegers.iterator();
      case UNSPECIFIED:
      case RANDOM:
      default:
        //implies no Duplicates?
        return streamofIntegers.distinct().iterator();
    }

  }
  ```

  These are static operators...
  
  So setting 
```java
Iterator<Integer>   itr =
          streamofIntegers.distinct().sequential().map( i -> max - i - 1 ).iterator();

          //and then a few lines later saying
        //e.g. anything else- and it fails....
Iterator<Integer>   itr =
          streamofIntegers.iterator();
```

## Collections


### Lists

### Sets

### Maps

Map<K,V> is an interface.

The 'regular' kind is a Hash Map


#### EnumMap

An Enum Map is faster than a Hash map- it can be optimized at the outset, since all the possible Keys are declared in advance (The Enum.getValues() = <E>[])

Declaration is a bit weird

`  private EnumMap<QSParams, Long> timeResult=
        new EnumMap<QSParams, Long>(QSParams.class);`

        




## IO Notes

### Simplest File Reading

```java
    try( DirectoryStream<Path> dirStream = Files.newDirectoryStream( dir )){
      //          Iterator<Path> fileIterator = dirStream.iterator();
      for( Path path : dirStream ){
        File file = new File( path.toUri() );
        LineNumberReader lineNumberReader = new LineNumberReader(  Files.newBufferedReader( path ); )
  
      }
  
    }catch( IOException e ){
    
    }
    

```
### System.in and System.out

See System.java.

print and println are classes of the `java.io.PrintStream#println(obj)` class;

It can be possibly reassigned with `System.setIn(InputStream in)` (and out/err respectively)

This throws `Exception SecurityException` if for some reason its not permitted.

### Reading and Writing Files

Two main Classes `java.nio.file.Files` and `java.io.File` 

From [java.io.File](https://docs.oracle.com/javase/10/docs/api/java/io/File.html)
Interoperability with java.nio.file package

The java.nio.file package defines interfaces and classes for the Java virtual machine to access files, file attributes, and file systems. This API may be used to overcome many of the limitations of the `java.io.File` class. The `toPath` method may be used to obtain a Path that uses the abstract path represented by a `File` object to locate a file. _The resulting `Path` may be used with the `Files` class to_ **provide more efficient and extensive access to additional file operations, file attributes, and I/O exceptions to help diagnose errors when an operation on a file fails.**

#### java.nio.file class

Class Summary Class 	Description
`Files` - This class consists exclusively of static methods that operate on files, directories, or other types of files.
`FileStore` Storage for files.
`FileSystem` - Provides an interface to a file system and is the factory for objects to access files and other objects in the file system.
`FileSystems` - Factory methods for file systems.
`LinkPermission` - The Permission class for link creation operations.
`Paths` - This class consists exclusively of static methods that return a Path by converting a path string or URI.
`SimpleFileVisitor<T>` - A simple visitor of files with default behavior to visit all files and to re-throw I/O errors.
`StandardWatchEventKinds` - Defines the standard event kinds.

AccessMode	Defines access modes used to test the accessibility of a file.
FileVisitOption - Defines the file tree traversal options.
FileVisitResult -The result type of a FileVisitor.
LinkOption - Defines the options as to how symbolic links are handled.
StandardCopyOption - Defines the standard copy options.
StandardOpenOption - Defines the standard open options.

Exception Summary
 - `AccessDeniedException ` - Checked exception thrown when a file system operation is denied, typically due to a file permission or other access check.
 - `AtomicMoveNotSupportedException ` - Checked exception thrown when a file cannot be moved as an atomic file system operation.
 - `ClosedDirectoryStreamException ` - Unchecked exception thrown when an attempt is made to invoke an operation on a directory stream that is closed.
 - `ClosedFileSystemException ` - Unchecked exception thrown when an attempt is made to invoke an operation on a file and the file system is closed.
 - `ClosedWatchServiceException ` - Unchecked exception thrown when an attempt is made to invoke an operation on a watch service that is closed.
 - `DirectoryIteratorException ` - Runtime exception thrown if an I/O error is encountered when iterating over the entries in a directory.
 - `DirectoryNotEmptyException ` - Checked exception thrown when a file system operation fails because a directory is not empty.
 - `FileAlreadyExistsException ` - Checked exception thrown when an attempt is made to create a file or directory and a file of that name already exists.
 - `FileSystemAlreadyExistsException ` - Runtime exception thrown when an attempt is made to create a file system that already exists.
 - `FileSystemException ` - Thrown when a file system operation fails on one or two files.
 - `FileSystemLoopException ` - Checked exception thrown when a file system loop, or cycle, is encountered.
 - `FileSystemNotFoundException ` - Runtime exception thrown when a file system cannot be found.
 - `InvalidPathException ` - Unchecked exception thrown when path string cannot be converted into a Path because the path string contains invalid characters, or the path string is invalid for other file system specific reasons.
 - `NoSuchFileException ` - Checked exception thrown when an attempt is made to access a file that does not exist.
 - `NotDirectoryException ` - Checked exception thrown when a file system operation, intended for a directory, fails because the file is not a directory.
 - `NotLinkException ` - Checked exception thrown when a file system operation fails because a file is not a symbolic link.
 - `ProviderMismatchException ` - Unchecked exception thrown when an attempt is made to invoke a method on an object created by one file system provider with a parameter created by a different file system provider.
 - `ProviderNotFoundException ` - Runtime exception thrown when a provider of the required type cannot be found.
 - `ReadOnlyFileSystemException ` - Unchecked exception thrown when an attempt is made to update an object associated with a read-only FileSystem.

### Java.io class summary


#### Interface Summary 

 - `Interface ` - Description
 - `Closeable ` - A Closeable is a source or destination of data that can be closed.
 - `DataInput ` - The DataInput interface provides for reading bytes from a binary stream and reconstructing from them data in any of the Java primitive types.
 - `DataOutput ` - The DataOutput interface provides for converting data from any of the Java primitive types to a series of bytes and writing these bytes to a binary stream.
 - `Externalizable ` - Only the identity of the class of an Externalizable instance is written in the serialization stream and it is the responsibility of the class to save and restore the contents of its instances.
 - `FileFilter ` - A filter for abstract pathnames.
 - `FilenameFilter ` - Instances of classes that implement this interface are used to filter filenames.
 - `Flushable ` - A Flushable is a destination of data that can be flushed.
 - `ObjectInput ` - ObjectInput extends the DataInput interface to include the reading of objects.
 - `ObjectInputValidation ` - Callback interface to allow validation of objects within a graph.
 - `ObjectOutput ` - ObjectOutput extends the DataOutput interface to include writing of objects.
 - `ObjectStreamConstants ` - Constants written into the Object Serialization Stream.
 - `Serializable ` - Serializability of a class is enabled by the class implementing the java.io.Serializable interface.


#### Class Summary

 - ` Class ` - **Description**

 - `BufferedInputStream ` - A BufferedInputStream adds functionality to another input stream-namely, the ability to buffer the input and to support the mark and reset methods.
 - `BufferedOutputStream ` - The class implements a buffered output stream.
 - `BufferedReader ` - Reads text from a character-input stream, buffering characters so as to provide for the efficient reading of characters, arrays, and lines.
 - `BufferedWriter ` - Writes text to a character-output stream, buffering characters so as to provide for the efficient writing of single characters, arrays, and strings.
 - `ByteArrayInputStream ` - A ByteArrayInputStream contains an internal buffer that contains bytes that may be read from the stream.
 - `ByteArrayOutputStream ` - This class implements an output stream in which the data is written into a byte array.
 - `CharArrayReader ` - This class implements a character buffer that can be used as a character-input stream.
 - `CharArrayWriter ` - This class implements a character buffer that can be used as an Writer.
 - `Console ` - Methods to access the character-based console device, if any, associated with the current Java virtual machine.
 - `DataInputStream ` - A data input stream lets an application read primitive Java data types from an underlying input stream in a machine-independent way.
 - `DataOutputStream ` - A data output stream lets an application write primitive Java data types to an output stream in a portable way.
 - `File ` - An abstract representation of file and directory pathnames.
 - `FileDescriptor ` - Instances of the file descriptor class serve as an opaque handle to the underlying machine-specific structure representing an open file, an open socket, or another source or sink of bytes.
 - `FileInputStream ` - A FileInputStream obtains input bytes from a file in a file system.
 - `FileOutputStream ` - A file output stream is an output stream for writing data to a File or to a FileDescriptor.
 - `FilePermission ` - This class represents access to a file or directory.
 - `FileReader ` - Convenience class for reading character files.
 - `FileWriter ` - Convenience class for writing character files.
 - `FilterInputStream ` - A FilterInputStream contains some other input stream, which it uses as its basic source of data, possibly transforming the data along the way or providing additional functionality.
 - `FilterOutputStream ` - This class is the superclass of all classes that filter output streams.
 - `FilterReader ` - Abstract class for reading filtered character streams.
 - `FilterWriter ` - Abstract class for writing filtered character streams.
 - `InputStream ` - This abstract class is the superclass of all classes representing an input stream of bytes.
 - `InputStreamReader ` - An InputStreamReader is a bridge from byte streams to character streams: It reads bytes and decodes them into characters using a specified charset.
 - `LineNumberInputStream ` - _*Deprecated*_ This class incorrectly assumes that bytes adequately represent characters.
 - `LineNumberReader ` - A buffered character-input stream that keeps track of line numbers.
 - `ObjectInputStream ` - An ObjectInputStream deserializes primitive data and objects previously written using an ObjectOutputStream.
 - `ObjectInputStream.GetField ` - Provide access to the persistent fields read from the input stream.
 - `ObjectOutputStream ` - An ObjectOutputStream writes primitive data types and graphs of Java objects to an OutputStream.
 - `ObjectOutputStream.PutField ` - Provide programmatic access to the persistent fields to be written to ObjectOutput.
 - `ObjectStreamClass ` - Serialization's descriptor for classes.
 - `ObjectStreamField ` - A description of a Serializable field from a Serializable class.
 - `OutputStream ` - This abstract class is the superclass of all classes representing an output stream of bytes.
 - `OutputStreamWriter ` - An OutputStreamWriter is a bridge from character streams to byte streams: Characters written to it are encoded into bytes using a specified charset.
 - `PipedInputStream ` - A piped input stream should be connected to a piped output stream; the piped input stream then provides whatever data bytes are written to the piped output stream.
 - `PipedOutputStream ` - A piped output stream can be connected to a piped input stream to create a communications pipe.
 - `PipedReader ` - Piped character-input streams.
 - `PipedWriter ` - Piped character-output streams.
 - `PrintStream ` - A PrintStream adds functionality to another output stream, namely the ability to print representations of various data values conveniently.
 - `PrintWriter ` - Prints formatted representations of objects to a text-output stream.
 - `PushbackInputStream ` - A PushbackInputStream adds functionality to another input stream, namely the ability to "push back" or "unread" one byte.
 - `PushbackReader ` - A character-stream reader that allows characters to be pushed back into the stream.
 - `RandomAccessFile ` - Instances of this class support both reading and writing to a random access file.
 - `Reader ` - Abstract class for reading character streams.
 - `SequenceInputStream ` - A SequenceInputStream represents the logical concatenation of other input streams.
 - `SerializablePermission ` - This class is for Serializable permissions.
 - `StreamTokenizer ` - The StreamTokenizer class takes an input stream and parses it into "tokens", allowing the tokens to be read one at a time.
 - `StringBufferInputStream ` - *Deprecated*This class does not properly convert characters into bytes.
 - `StringReader ` - A character stream whose source is a string.
 - `StringWriter ` - A character stream that collects its output in a string buffer, which can then be used to construct a string.
 - `Writer ` - Abstract class for writing to character streams.
 - `Exception Summary Exception ` - Description
 - `CharConversionException ` - Base class for character conversion exceptions.
 - `EOFException ` - Signals that an end of file or end of stream has been reached unexpectedly during input.
 - `FileNotFoundException ` - Signals that an attempt to open the file denoted by a specified pathname has failed.
 - `InterruptedIOException ` - Signals that an I/O operation has been interrupted.
 - `InvalidClassException ` - Thrown when the Serialization runtime detects one of the following problems with a Class.
 - `InvalidObjectException ` - Indicates that one or more deserialized objects failed validation tests.
 - `IOException ` - Signals that an I/O exception of some sort has occurred.
 - `NotActiveException ` - Thrown when serialization or deserialization is not active.
 - `NotSerializableException ` - Thrown when an instance is required to have a Serializable interface.
 - `ObjectStreamException ` - Superclass of all exceptions specific to Object Stream classes.
 - `OptionalDataException ` - Exception indicating the failure of an object read operation due to unread primitive data, or the end of data belonging to a serialized object in the stream.
 - `StreamCorruptedException ` - Thrown when control information that was read from an object stream violates internal consistency checks.
 - `SyncFailedException ` - Signals that a sync operation has failed.
 - `UncheckedIOException ` - Wraps an IOException with an unchecked exception.
 - `UnsupportedEncodingException ` - The Character Encoding is not supported.
 - `UTFDataFormatException ` - Signals that a malformed string in modified UTF-8 format has been read in a data input stream or by any class that implements the data input interface.
 - `WriteAbortedException ` - Signals that one of the ObjectStreamExceptions was thrown during a write operation.
 - `Error Summary Error ` - Description
 - `IOError ` - Thrown when a serious I/O error has occurred.

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


##### Null Output Stream

A null output stream, which I have struggled to create -  can be called simply by calling the static method `OutputStream. 	nullOutputStream()`

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

#### Printing to String

This can be done using `PrintWriter` and `StringWriter`. An Example when this is necessary is when trying to get a stack trace to string.

	    StringWriter stringWriter = new StringWriter();
	    PrintWriter printWriter = new PrintWriter( stringWriter );
	    throwable.printStackTrace( printWriter );
        stringWriter.toString();


```java
public static String convertStackTraceToString(Throwable throwable){
	  try(
	      StringWriter stringWriter = new StringWriter();
	      PrintWriter printWriter = new PrintWriter( stringWriter );
        ){
	    throwable.printStackTrace( printWriter );
      return stringWriter.toString();
	    
    }catch( IOException iOE ){
	      System.err.println("IO Exception in "
                           + "convertStackTraceTo String");
	      iOE.printStackTrace();
	      throw new IllegalStateException(iOE);
      }
	  return null;
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
    private final String strField;
    private final int intField

    public exampleClass(String input, int input2) { //constructor
        this.strField = input;
        this.intField = input2;
    }
}
```
## Logging


[Java Logging Overview](https://docs.oracle.com/en/java/javase/12/core/java-logging-overview.html#GUID-B83B652C-17EA-48D9-93D2-563AE1FF8EDA)

![](https://docs.oracle.com/en/java/javase/12/core/img/java_pb_001a.png)

There are two main logging classes built in:

- [java.base.lang.system.logger](https://docs.oracle.com/javase/10/docs/api/java/lang/System.html#getLogger(java.lang.String))

    and 

- [java.util.logger](https://docs.oracle.com/javase/10/docs/api/java/util/logging/Logger.html)


[Java11](Java11[](https://docs.oracle.com/en/java/javase/11/docs/api/java.logging/java/util/logging/package-summary.html))

Along with several 3rd party loggers:

- slf4j



Other sources
[GeeksForGeeks](https://www.geeksforgeeks.org/logging-in-java/)
[StackOverflow](https://stackoverflow.com/questions/5950557/good-examples-using-java-util-logging)
[Jenkov Tutorials](http://tutorials.jenkov.com/java-logging/logger.html)

[MyCode](O:\OneDrive\Programming\JAVA\PostFix_DS\src\com\DS_Postfix)


Module **java.logging**  Package _java.util.logging_



 The key elements of this package include:

 - `Logger`: The main entity on which applications make logging calls. A Logger object is used to log messages for a specific system or application component. 
 - `LogRecord`: Used to pass logging requests between the logging framework and individual log handlers. 
 - `Handler`: Exports LogRecord objects to a variety of destinations including memory, output streams, consoles, files, and sockets. A variety of Handler subclasses exist for this purpose. Additional Handlers may be developed by third parties and delivered on top of the core platform. 
 - `Level`: Defines a set of standard logging levels that can be used to control logging output. Programs can be configured to output logging for some levels while ignoring output for others. 
 - `Filter`: Provides fine-grained control over what gets logged, beyond the control provided by log levels. The logging APIs support a general-purpose filter mechanism that allows application code to attach arbitrary filters to control logging output. 
 - `Formatter`: Provides support for formatting LogRecord objects. This package includes two formatters, SimpleFormatter and XMLFormatter, for formatting log records in plain text or XML respectively. As with Handlers, additional Formatters may be developed by third parties.  

The Logging APIs offer both static and dynamic configuration control. Static control enables field service staff to set up a particular configuration and then re-launch the application with the new logging settings. Dynamic control allows for updates to the logging configuration within a currently running program. The APIs also allow for logging to be enabled or disabled for different functional areas of the system. For example, a field service engineer might be interested in tracing all AWT events, but might have no interest in socket events or memory management. 

Getting a logger:

```java
  private static final Logger
        LOGGER = LoggerFactory.getLogger(AwtExceptionHandler.class );
```

where AwtEx... is the current class

**System.Logger Severity Level Mapping**

System.Logger Levels vs. java.util.logging Levels.

| System. | .util.  | value             |
| ------- | ------- | ----------------- |
| ALL     | ALL     | Integer.MIN_VALUE |
| -----   | FINEST  | 300               |
| TRACE   | FINER   | 400               |
| DEBUG   | FINE    | 500               |
| -----   | CONFIG  | 700               |
| INFO    | INFO    | 800               |
| WARNING | WARNING | 900               |
| ERROR   | SEVERE  | 1000              |
| OFF     | OFF     | Integer.MAX_VALUE |
|---------|---------|-------------------|

All are the following ways to declare a logger- the global logger.

!!!Warning Warning: By default, anything over _Config_ is ALWAYS printed to Console, even if there is no Console Handler...

At startup, there is one ConsoleHandler, assigned to the *Global Logger.*  All other loggers by default inherit this from Global.  The method .useParentHandler(), or getParentHandler(), refer to this.  




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




### Formatting the Log

~~!!!Warning This isnt working as expected right now.~~ - fixed 


Log formatting works based on `XMLFormatter` class and the [SimpleFormatter](https://docs.oracle.com/en/java/javase/11/docs/api/java.logging/java/util/logging/SimpleFormatter.html) class.




Format the given LogRecord.

Format the given LogRecord.

The formatting can be customized by specifying the format string in the [`java.util.logging.SimpleFormatter.format`](#formatting) property. The given `LogRecord` will be formatted as if by calling:

```java
   String.format(format, date, source, logger, level, message, thrown)
```

[SimpleFormatter](https://docs.oracle.com/en/java/javase/11/docs/api/java.logging/java/util/logging/SimpleFormatter.html)

where the arguments are:

1.  `format` - the format string specified in the `java.util.logging.SimpleFormatter.format` property or the default format.
2.  `date` - a `ZonedDateTime` "class in java.time" object representing event time (LogRecord.html#getInstant()) of the log record in the `ZoneId.systemDefault()` (ZoneId.html#systemDefault()) system time zone.
3.  `source` - a string representing the caller, if available; otherwise, the logger's name.
4.  `logger` - the logger's name.
5.  `level` - the log level.
6.  `message` - the formatted log message returned from the `Formatter.formatMessage(LogRecord)` method. It uses `java.text` class in java.text formatting and does not use the `java.util.Formatter format` argument.
7.  `thrown` - a string representing the [throwable](LogRecord.html#getThrown()) associated with the log record and its backtrace beginning with a newline character, if any; otherwise, an empty string.

Some example formats:

 - `~~`java.util.logging.SimpleFormatter.format="%4$s`: %5$s [%1$tc]%n"`~~ 

`System.setProperty("java.util.logging.SimpleFormatter.format", "%4$s: %5$s [%1$tc]%n");`

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

~~`java.util.logging.SimpleFormatter.format="%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS.%1$tN %1$Tp %2$s%n%4$s: %5$s%6$s%n"`~~

`System.setProperty("java.util.logging.SimpleFormatter.format", "%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS.%1$tN %1$Tp %2$s%n%4$s: %5$s%6$s%n");`


Since JDK 9, java.util.logging uses java.time to create more precise time stamps. The format above can be used to add a .%1$tN to the date/time formatting so that nanoseconds will also be printed:

     Feb 06, 2015 5:33:10.279216000 PM example.Main main
     INFO: This is a test


##### Example:

[Usages(Codata)](https://www.codota.com/code/java/classes/java.util.logging.SimpleFormatter)

[Code](https://github.com/jenkinsci/jenkins/blob/master/core/src/main/java/hudson/Functions.java#L576)



```java

  /**
   * Method for formatting a Log Record.
   *
   * Source : https://github.com/jenkinsci/jenkins/blob/master/core/src/main
   * /java/hudson/Functions.java#L576
   */
  private static String[] logPreformat(LogRecord record){
	  String source;
	  if (record.getSourceClassName() == null){
	    //source missing, replace with logger name...
	    source = record.getLoggerName();
    }else{
	    if(record.getSourceMethodName() == null){
	      source = record.getSourceClassName();
      }else{
	      source = String.format( "%s %s",record.getSourceClassName(),
            record.getSourceMethodName() );
      }
    }
	  String message =
        new SimpleFormatter().formatMessage( record ) + Sys.LINE_SEP;
	  Throwable throwable = record.getThrown();
	  
	  return new String[]{
	      String.format( "%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS %1$Tp",
            new Date(record.getMillis()) ),
        source,
        record.getLevel().getLocalizedName(),
        throwable == null ? message : message + convertStackTraceToString( throwable ) + "\n"
    };
  }

  
```
Needs the `convertStackTrace` method which is in the [exceptions section](#Converting-Stacktrace-to-String)


##### Another Example Formatting

[Relevant Stack Overflow](https://stackoverflow.com/questions/35745714/limiting-string-length-with-simpleformatter/35749990#35749990)



```java
public static void main(String[] args) {
    //This really should be set as a command argument but, it works.

    //No min and max of seven chars of level.
    //System.setProperty("java.util.logging.SimpleFormatter.format", "%4$.7s %n");

    //Min and max of seven chars of level (right justified).
    //System.setProperty("java.util.logging.SimpleFormatter.format", "%4$7.7s %n");

    //Min and max of seven chars of level (left justified).
    //System.setProperty("java.util.logging.SimpleFormatter.format", "%4$-7.7s %n");

    //No min with max of one chars of level.
    System.setProperty("java.util.logging.SimpleFormatter.format", "%4$.1s %n");

    LogRecord r = new LogRecord(Level.SEVERE, "Message");
    r.setLoggerName("logger");
    r.setSourceClassName("class");
    r.setSourceMethodName("method");
    System.out.println(new SimpleFormatter().format(r));
}
```


#### Formatter Class

 Formatted printing for the Java language is heavily inspired by C's printf. Although the format strings are similar to C, some customizations have been made to accommodate the Java language and exploit some of its features. Also, Java formatting is more strict than C's; for example, if a conversion is incompatible with a flag, an exception will be thrown. In C inapplicable flags are silently ignored. The format strings are thus intended to be recognizable to C programmers but not necessarily completely compatible with those in C.

Examples of expected usage:

       StringBuilder sb = new StringBuilder();
       // Send all output to the Appendable object sb
       Formatter formatter = new Formatter(sb, Locale.US);

       // Explicit argument indices may be used to re-order output.
       formatter.format("%4$2s %3$2s %2$2s %1$2s", "a", "b", "c", "d")
       // -> " d  c  b  a"

       // Optional locale as the first argument can be used to get
       // locale-specific formatting of numbers.  The precision and width can be
       // given to round and align the value.
       formatter.format(Locale.FRANCE, "e = %+10.4f", Math.E);
       // -> "e =    +2,7183"

       // The '(' numeric flag may be used to format negative numbers with
       // parentheses rather than a minus sign.  Group separators are
       // automatically inserted.
       formatter.format("Amount gained or lost since last statement: $ %(,.2f",
                        balanceDelta);
       // -> "Amount gained or lost since last statement: $ (6,217.58)"
     

#### Manually creating a log Entry

See above.

```java
System.setProperty("java.util.logging.SimpleFormatter.format", "%4$.1s %n");
  
LogRecord r = new LogRecord( Level.WARNING, "Message");
r.setLoggerName("logger");
r.setSourceClassName("class");
r.setSourceMethodName("method");
System.out.println(new SimpleFormatter().format(r ) );
```

#### Handlers

At startup, there is one ConsoleHandler, assigned to the Global Logger.  All other loggers by default inherit this from Global.  The method .useParentHandler(), or getParentHandler(), refer to this.  

By default, anything over _Config_ is ALWAYS printed to Console, even if there is no Console Handler...


There is a FileHandler, ...

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

### Try catch


### Finally

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

### Try With Resources

Try with resources- automatically closes the resources if the try fails.

Syntax:

Note the use of parentheses rather than Brackets.  Brackets are still required (I think)

try(
    *Resources*
){
    *Normal Try Block*
}catch( **Exception to catch** ){
    *Action*
}

```java
try(
	      StringWriter stringWriter = new StringWriter();
	      PrintWriter printWriter = new PrintWriter( stringWriter );
){
    throwable.printStackTrace( printWriter );
    return stringWriter.toString();
}catch( IOException iOE ){
    if (Sys.DEBUG_EN) {
        System.err.println("IO Exception in "
                           + "convertStackTraceTo String");
        iOE.printStackTrace();
    }
        if(Sys.LOG_EN){
            LOG.warning( "IO Exception error" );
//	        throw new Exception("IO Exception");
            throw new IllegalStateException(iOE);
    }
}
```


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

##### IllegalStateException(iOE);

See [Converting Stacktrace to String](#Converting-Stacktrace-to-String)

Doesnt throw an error?  Runtime exception...

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

### Converting Stacktrace to String

[Source](https://howtodoinjava.com/java/string/convert-stacktrace-to-string/)

Using Printwriter and Stringwriter.


```java
public static String convertStackTraceToString(Throwable throwable){
	  try(
	      StringWriter stringWriter = new StringWriter();
	      PrintWriter printWriter = new PrintWriter( stringWriter );
        ){
	    throwable.printStackTrace( printWriter );
      return stringWriter.toString();
	    
    }catch( IOException iOE ){
	    if (Sys.DEBUG_EN) {
	      System.err.println("IO Exception in "
                           + "convertStackTraceTo String");
	      iOE.printStackTrace();
      }
	    if(Sys.LOG_EN){
	      LOG.warning( "IO Exception error" );
//	      throw new Exception("IO Exception");
	      throw new IllegalStateException(iOE);
      }
    }
	  return null;
}

```


#### Option 2:  Apache Commons

Maven Dependency

```XML
dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-lang3</artifactId>
    <version>3.5</version>
</dependency>

```

`String ExceptionUtils.getStackTrace(<Exception>)`

```java
ExceptionUtils example
String errorStr = ExceptionUtils.getStackTrace(new NullPointerException("Custom error"));
System.out.println(errorStr);
```

            Output:
        java.lang.NullPointerException: Custom error
        at com.howtodoinjava.demo.StringExample.main(StringExample.java:11)

## Testing

[Documentation](https://junit.org/junit5/docs/5.0.1/api/org/junit/jupiter/api/package-summary.html)

[Source](https://mvnrepository.com/artifact/org.junit.jupiter/junit-jupiter-api)

[Tutorial](https://howtodoinjava.com/junit-5-tutorial/)

[Good Examples](https://howtodoinjava.com/junit5/junit-5-assumptions-examples/)


POM // Maven XML

```xml
    <!-- properties...
     -->
   <junit.jupiter.version>5.5.1</junit.jupiter.version>
        <junit.platform.version>1.5.1</junit.platform.version>
        <arguments>""</arguments>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.junit.platform</groupId>
            <artifactId>junit-platform-launcher</artifactId>
            <version>${junit.platform.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-api</artifactId>
            <version>${junit.jupiter.version}</version>
            <scope>test</scope>
        </dependency>
        <!-- Optional for parameterized tests -->
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-params</artifactId>
            <version>${junit.jupiter.version}</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.junit.jupiter</groupId>
            <artifactId>junit-jupiter-engine</artifactId>
            <version>${junit.jupiter.version}</version>
            <scope>test</scope>
        </dependency>
    </dependencies>

```

### Sample Code

```java

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class GameBoardTest{
  static GameBoard classUnderTest;
  static Pole a;
  static Pole b;
  static Pole c;
  
  @BeforeAll
  static void init(){
    classUnderTest = GameBoard.Get().setup( 5 );
    a = classUnderTest.getPoleA();
    b = classUnderTest.getPoleB();
    c = classUnderTest.getPoleC();
  }
  
  @Test
  void getOtherTest(){
    Pole a = classUnderTest.getPoleA();
    Pole b = classUnderTest.getPoleB();
    Pole c = classUnderTest.getPoleC();
  
    try{
      assertEquals( classUnderTest.getOther( a, b ), c );
      assertEquals( classUnderTest.getOther(a,c), b );
      assertEquals( classUnderTest.getOther(b,c), a );
      assertEquals( classUnderTest.getOther(b,a), c );
      assertEquals( classUnderTest.getOther(c,a), b );
      assertEquals( classUnderTest.getOther(c,b), a );
    }catch(Throwable t  ){ }
//    classUnderTest.getOther( a, b )
  }
  
  
  @Test
  void getOther_ErrorTest(){
    assertThrows( Throwable.class, ()-> classUnderTest.getOther( a, a ) );
    assertThrows( Throwable.class, ()-> classUnderTest.getOther( b, b ) );
    assertThrows( Throwable.class, ()-> classUnderTest.getOther( c, c ) );
  }
  
  
}
```

### Repeat test with input

Minimal Example

```java
class Test{

    RepititionInfo info;  //create a field...


    @RepeatedTest(5)
    @DisplayName("This is Optional with placeholders:  {displayName}{currentRepetition}{totalRepetitions}")

    void method(){
        n = this.info.getCurrentRepition();
        //use n;
    }
}
```

### Tags

`@AfterAll` is used to signal that the annotated method should be executed after all tests in the current test class.
`@AfterEach` is used to signal that the annotated method should be executed after each @Test, @RepeatedTest, @ParameterizedTest, @TestFactory, and @TestTemplate method in the current test class.
`@BeforeAll` is used to signal that the annotated method should be executed before all tests in the current test class.
`@BeforeEach` is used to signal that the annotated method should be executed before each `@Test`, `@RepeatedTest`, `@ParameterizedTest`, `@TestFactory`, and `@TestTemplate` method in the current test class.
`@Disabled` is used to signal that the annotated test class or test method is currently disabled and should not be executed.
`@DisplayName` is used to declare a custom display name for the annotated test class or test method.
`@DisplayNameGeneration` is used to declare a custom display name generator for the annotated test class.
`@Nested` is used to signal that the annotated class is a nested, non-static test class (i.e., an inner class) that can share setup and state with an instance of its enclosing class.
`@Order` is an annotation that is used to configure the order in which the annotated element (i.e., field or method) should be evaluated or executed relative to other elements of the same category.
`@RepeatedTest` is used to signal that the annotated method is a test template method that should be repeated a specified number of times with a configurable display name.
`@Tag` is a repeatable annotation that is used to declare a tag for the annotated test class or test method.
`@Tags` is a container for one or more @Tag declarations.
`@Test` is used to signal that the annotated method is a test method.
`@TestFactory` is used to signal that the annotated method is a test factory method.
`@TestInstance` is a type-level annotation that is used to configure the lifecycle of test instances for the annotated test class or test interface.
`@TestMethodOrder` is a type-level annotation that is used to configure a MethodOrderer for the test methods of the annotated test class or test interface.
`@TestTemplate` is used to signal that the annotated method is a test template method.
`@Timeout` is used to define a timeout for a method or all testable methods within one class and its `@Nested` classes.
  `@ParameterizedTest`
  `@ValueSource(ints = {1,2,3,4,5,6,7,8,9,10})`

`@Order(n)`
`@Order(1)`, `@Order(2)`, `@Order(3)` 



### Parameterized Test Examples

[Source](https://github.com/junit-team/junit5/blob/master/documentation/src/test/java/example/ParameterizedTestDemo.java)

```java
	@ParameterizedTest
	@ValueSource(ints = { 1, 2, 3 })
	void testWithValueSource(int argument) {
		assertTrue(argument > 0 && argument < 4);
	}
```

### Ordered Tests:

```java
// tag::user_guide[]
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

@TestMethodOrder(OrderAnnotation.class)
class OrderedTestsDemo {

	@Test
	@Order(1)
	void nullValues() {
		// perform assertions against null values
	}

	@Test
	@Order(2)
	void emptyValues() {
		// perform assertions against empty values
	}
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


## Data Strictires Code
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
    public static void main(String[] args)
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

## Features and Miscellanea 

### System.getProperty

Can be used to get system values. Note the double quotes. Single quotes are character literals.

```Java
String value = System.getProperty("java.version");
//System.getProperty('[key value]');
```

| **Key**                         | Value                                         |
| ------------------------------- | ------------------------------------------------------------------------------------------------------------- |
| `java.version`                  | Java Runtime Environment version, which may be interpreted as a Runtime.Version                               |
| `java.version.date`             | Java Runtime Environment version date, in ISO-8601 YYYY-MM-DD format, which may be interpreted as a LocalDate |
| `java.vendor`                   | Java Runtime Environment vendor               |
| `java.vendor.url`               | Java vendor URL                               |
| `java.vendor.version`           | Java vendor version                           |
| `java.home`                     | Java installation directory                   |
| `java.vm.specification.version` | Java Virtual Machine specification version which may be interpreted as a Runtime.Version                      |
| `java.vm.specification.vendor`  | Java Virtual Machine specification vendor     |
| `java.vm.specification.name`    | Java Virtual Machine specification name       |
| `java.vm.version`               | Java Virtual Machine implementation version which may be interpreted as a Runtime.Version                     |
| `java.vm.vendor`                | Java Virtual Machine implementation vendor    |
| `java.vm.name`                  | Java Virtual Machine implementation name      |
| `java.specification.version`    | Java Runtime Environment specification version which may be interpreted as a Runtime.Version                  |
| `java.specification.vendor`     | Java Runtime Environment specification vendor |
| `java.specification.name`       | Java Runtime Environment specification name   |
| `java.class.version`            | Java class format version number              |
| `java.class.path`               | Java class path                               |
| `java.library.path`             | List of paths to search when loading libraries          |
| `java.io.tmpdir`                | Default temp file path                        |
| `java.compiler`                 | Name of JIT compiler to use                   |
| `os.name`                       | Operating system name                         |
| `os.arch`                       | Operating system architecture                 |
| `os.version`                    | Operating system version                      |
| `file.separator`                | File separator ("/" on UNIX)                  |
| `path.separator`                | Path separator (":" on UNIX)                  |
| `line.separator`                | Line separator ("\n" on UNIX)                 |
| `user.name`                     | User's account name                           |
| `user.home`                     | User's home directory                         |
| `user.dir`                      | User's current working directory              |
| `jdk.module.path`               | The application module path                   |
| `jdk.module.upgrade.path`       | The upgrade module path                       |
| `jdk.module.main`               | The module name of the initial/main module    |
| `jdk.module.main.class`         | The main class name of the initial module     |
| `file.encoding`         | The default characterset used    |

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


## GUI

### Text Based- LANTERNA

using the

### Swing

[Swing Demos](https://docs.oracle.com/javase/tutorial/uiswing/examples/components/index.html)

[More Demos](https://docs.oracle.com/javase/tutorial/uiswing/index.html)

[Creating a GUI with JFC/Swing,](http://java.sun.com/docs/books/tutorial/uiswing/index.html)

 
[Related Documentation. ](https://docs.oracle.com/javase/8/docs/api/javax/swing/package-summary.html#related)

[THe Swing Connection](http://java.sun.com/products/jfc/tsc/)

[Java Tutorial](http://java.sun.com/docs/books/tutorial/)

[Training at Java Dev. Conn.](http://java.sun.com/developer/onlineTraining/)

[Java Found. Classes](http://java.sun.com/products/jfc/)








##### Swing Threading

[Concurrency](https://docs.oracle.com/javase/tutorial/uiswing/concurrency/index.html)



Swing's Threading Policy

In general Swing is not thread safe. All Swing components and related classes, unless otherwise documented, must be accessed on the event dispatching thread.

Typical Swing applications do processing in response to an event generated from a user gesture. For example, clicking on a JButton notifies all ActionListeners added to the JButton. As all events generated from a user gesture are dispatched on the event dispatching thread, most developers are not impacted by the restriction.

Where the impact lies, however, is in constructing and showing a Swing application. Calls to an application's main method, or methods in Applet, are not invoked on the event dispatching thread. As such, care must be taken to transfer control to the event dispatching thread when constructing and showing an application or applet. The preferred way to transfer control and begin working with Swing is to use invokeLater. The invokeLater method schedules a Runnable to be processed on the event dispatching thread. The following two examples work equally well for transferring control and starting up a Swing application:

```java
import javax.swing.SwingUtilities;

public class MyApp implements Runnable {
    public void run() {
        // Invoked on the event dispatching thread.
        // Construct and show GUI.
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new MyApp());
    }
}
```
Or:

```java
import javax.swing.SwingUtilities;

public class MyApp {
    MyApp(String[] args) {
        // Invoked on the event dispatching thread.
        // Do any initialization here.
    }

    public void show() {
        // Show the UI.
    }

    public static void main( String[] args) {
        // Schedule a job for the event-dispatching thread:
        // creating and showing this application's GUI.
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new MyApp(args).show();
            }
        });
    }
}
```

This restriction also applies to models attached to Swing components. For example, if a `TableModel` is attached to a `JTable`, the `TableModel` should only be modified on the event dispatching thread. If you modify the model on a separate thread you run the risk of exceptions and possible display corruption.

As all events are delivered on the event dispatching thread, care must be taken in event processing. In particular, a long running task, such as network io or computational intensive processing, executed on the event dispatching thread blocks the event dispatching thread from dispatching any other events. While the event dispatching thread is blocked the application is completely unresponsive to user input. Refer to [SwingWorker](https://docs.oracle.com/javase/8/docs/api/javax/swing/SwingWorker.html) for the preferred way to do such processing when working with Swing.


#### Swing Class (Java.swing)


#####    Interface Summary 
 - `Interface` - Description
 - `Action` - The Action interface provides a useful extension to the ActionListener interface in cases where the same functionality may be accessed by several controls.
 - `BoundedRangeModel` - Defines the data model used by components like Sliders and ProgressBars.
 - `ButtonModel` - State model for buttons.
 - `CellEditor` - This interface defines the methods any general editor should be able to implement.
 - `ComboBoxEditor` - The editor component used for JComboBox components.
 - `ComboBoxModel<E>` - A data model for a combo box.
 - `DesktopManager` - DesktopManager objects are owned by a JDesktopPane object.
 - `Icon` - A small fixed size picture, typically used to decorate components.
 - `JComboBox.KeySelectionManager` - The interface that defines a KeySelectionManager.
 - `ListCellRenderer<E>` - Identifies components that can be used as "rubber stamps" to paint the cells in a JList.
 - `ListModel<E>` - This interface defines the methods components like JList use to get the value of each cell in a list and the length of the list.
 - `ListSelectionModel` - This interface represents the current state of the selection for any of the components that display a list of values with stable indices.
 - `MenuElement` - Any component that can be placed into a menu should implement this interface.
 - `MutableComboBoxModel<E>` - A mutable version of ComboBoxModel.
 - `Painter<T>` - A painting delegate.
 - `Renderer` - Defines the requirements for an object responsible for "rendering" (displaying) a value.
 - `RootPaneContainer` - This interface is implemented by components that have a single JRootPane child: JDialog, JFrame, JWindow, JApplet, JInternalFrame.
 - `Scrollable` - An interface that provides information to a scrolling container like JScrollPane.
 - `ScrollPaneConstants` - Constants used with the JScrollPane component.
 - `SingleSelectionModel` - A model that supports at most one indexed selection.
 - `SpinnerModel` - A model for a potentially unbounded sequence of object values.
 - `SwingConstants` - A collection of constants generally used for positioning and orienting components on the screen.
 - `UIDefaults.ActiveValue` - This class enables one to store an entry in the defaults table that's constructed each time it's looked up with one of the getXXX(key) methods.
 - `UIDefaults.LazyValue` - This class enables one to store an entry in the defaults table that isn't constructed until the first time it's looked up with one of the getXXX(key) methods.
 - `WindowConstants` - Constants used to control the window-closing operation.
 - `Class Summary Class` - Description
 - `AbstractAction` - This class provides default implementations for the JFC Action interface.
 - `AbstractButton` - Defines common behaviors for buttons and menu items.
 - `AbstractCellEditor` - A base class for CellEditors, providing default implementations for the methods in the CellEditor interface except getCellEditorValue().
 - `AbstractListModel<E>` - The abstract definition for the data model that provides a List with its contents.
 - `AbstractSpinnerModel` - This class provides the ChangeListener part of the SpinnerModel interface that should be suitable for most concrete SpinnerModel implementations.
 - `ActionMap` - ActionMap provides mappings from Objects (called keys or Action names) to Actions.
 - `BorderFactory` - Factory class for vending standard Border objects.
 - `Box` - A lightweight container that uses a BoxLayout object as its layout manager.
 - `Box.Filler` - An implementation of a lightweight component that participates in layout but has no view.
 - `BoxLayout` - A layout manager that allows multiple components to be laid out either vertically or horizontally.
 - `ButtonGroup` - This class is used to create a multiple-exclusion scope for a set of buttons.
 - `CellRendererPane` - This class is inserted in between cell renderers and the components that use them.
 - `ComponentInputMap` - A ComponentInputMap is an InputMap associated with a particular JComponent.
 - `DebugGraphics` - Graphics subclass supporting graphics debugging.
 - `DefaultBoundedRangeModel` - A generic implementation of BoundedRangeModel.
 - `DefaultButtonModel` - The default implementation of a Button component's data model.
 - `DefaultCellEditor` - The default editor for table and tree cells.
 - `DefaultComboBoxModel<E>` - The default model for combo boxes.
 - `DefaultDesktopManager` - This is an implementation of the DesktopManager.
 - `DefaultFocusManager` - This class has been obsoleted by the 1.4 focus APIs.
 - `DefaultListCellRenderer` - Renders an item in a list.
 - `DefaultListCellRenderer.UIResource` - A subclass of DefaultListCellRenderer that implements UIResource.
 - `DefaultListModel<E>` - This class loosely implements the java.util.Vector API, in that it implements the 1.1.x version of java.util.Vector, has no collection class support, and notifies the ListDataListeners when changes occur.
 - `DefaultListSelectionModel` - Default data model for list selections.
 - `DefaultRowSorter<M,I>` - An implementation of RowSorter that provides sorting and filtering around a grid-based data model.
 - `DefaultRowSorter.ModelWrapper<M,I>` - DefaultRowSorter.ModelWrapper is responsible for providing the data that gets sorted by DefaultRowSorter.
 - `DefaultSingleSelectionModel` - A generic implementation of SingleSelectionModel.
 - `FocusManager` - This class has been obsoleted by the 1.4 focus APIs.
 - `GrayFilter` - An image filter that "disables" an image by turning it into a grayscale image, and brightening the pixels in the image.
 - `GroupLayout` - GroupLayout is a LayoutManager that hierarchically groups components in order to position them in a Container.
 - `ImageIcon` - An implementation of the Icon interface that paints Icons from Images.
 - `InputMap` - InputMap provides a binding between an input event (currently only KeyStrokes are used) and an Object.
 - `InputVerifier` - The purpose of this class is to help clients support smooth focus navigation through GUIs with text fields.
 - `InternalFrameFocusTraversalPolicy` - A FocusTraversalPolicy which can optionally provide an algorithm for determining a JInternalFrame's initial Component.
 - `JApplet` - An extended version of java.applet.Applet that adds support for the JFC/Swing component architecture.
 - `JButton` - An implementation of a "push" button.
 - `JCheckBox` - An implementation of a check box -- an item that can be selected or deselected, and which displays its state to the user.
 - `JCheckBoxMenuItem` - A menu item that can be selected or deselected.
 - `JColorChooser` - JColorChooser provides a pane of controls designed to allow a user to manipulate and select a color.
 - `JComboBox<E>` - A component that combines a button or editable field and a drop-down list.
 - `JComponent` - The base class for all Swing components except top-level containers.
 - `JDesktopPane` - A container used to create a multiple-document interface or a virtual desktop.
 - `JDialog` - The main class for creating a dialog window.
 - `JEditorPane` - A text component to edit various kinds of content.
 - `JFileChooser` - JFileChooser provides a simple mechanism for the user to choose a file.
 - `JFormattedTextField` - JFormattedTextField extends JTextField adding support for formatting arbitrary values, as well as retrieving a particular object once the user has edited the text.
 - `JFormattedTextField.AbstractFormatter` - Instances of AbstractFormatter are used by JFormattedTextField to handle the conversion both from an Object to a String, and back from a String to an Object.
 - `JFormattedTextField.AbstractFormatterFactory` - Instances of AbstractFormatterFactory are used by JFormattedTextField to obtain instances of AbstractFormatter which in turn are used to format values.
 - `JFrame` - An extended version of java.awt.Frame that adds support for the JFC/Swing component architecture.
 - `JInternalFrame` - A lightweight object that provides many of the features of a native frame, including dragging, closing, becoming an icon, resizing, title display, and support for a menu bar.
 - `JInternalFrame.JDesktopIcon` - This component represents an iconified version of a JInternalFrame.
 - `JLabel` - A display area for a short text string or an image, or both.
 - `JLayer<V extends Component>` - JLayer is a universal decorator for Swing components which enables you to implement various advanced painting effects as well as receive notifications of all AWTEvents generated within its borders.
 - `JLayeredPane` - JLayeredPane adds depth to a JFC/Swing container, allowing components to overlap each other when needed.
 - `JList<E>` - A component that displays a list of objects and allows the user to select one or more items.
 - `JList.DropLocation` - A subclass of TransferHandler.DropLocation representing a drop location for a JList.
 - `JMenu` - An implementation of a menu -- a popup window containing JMenuItems that is displayed when the user selects an item on the JMenuBar.
 - `JMenuBar` - An implementation of a menu bar.
 - `JMenuItem` - An implementation of an item in a menu.
 - `JOptionPane` - JOptionPane makes it easy to pop up a standard dialog box that prompts users for a value or informs them of something.
 - `JPanel` - JPanel is a generic lightweight container.
 - `JPasswordField` - JPasswordField is a lightweight component that allows the editing of a single line of text where the view indicates something was typed, but does not show the original characters.
 - `JPopupMenu` - An implementation of a popup menu -- a small window that pops up and displays a series of choices.
 - `JPopupMenu.Separator` - A popup menu-specific separator.
 - `JProgressBar` - A component that visually displays the progress of some task.
 - `JRadioButton` - An implementation of a radio button -- an item that can be selected or deselected, and which displays its state to the user.
 - `JRadioButtonMenuItem` - An implementation of a radio button menu item.
 - `JRootPane` - A lightweight container used behind the scenes by JFrame, JDialog, JWindow, JApplet, and JInternalFrame.
 - `JScrollBar` - An implementation of a scrollbar.
 - `JScrollPane` - Provides a scrollable view of a lightweight component.
 - `JSeparator` - JSeparator provides a general purpose component for implementing divider lines - most commonly used as a divider between menu items that breaks them up into logical groupings.
 - `JSlider` - A component that lets the user graphically select a value by sliding a knob within a bounded interval.
 - `JSpinner` - A single line input field that lets the user select a number or an object value from an ordered sequence.
 - `JSpinner.DateEditor` - An editor for a JSpinner whose model is a SpinnerDateModel.
 - `JSpinner.DefaultEditor` - A simple base class for more specialized editors that displays a read-only view of the model's current value with a JFormattedTextField.
 - `JSpinner.ListEditor` - An editor for a JSpinner whose model is a SpinnerListModel.
 - `JSpinner.NumberEditor` - An editor for a JSpinner whose model is a SpinnerNumberModel.
 - `JSplitPane` - JSplitPane is used to divide two (and only two) Components.
 - `JTabbedPane` - A component that lets the user switch between a group of components by clicking on a tab with a given title and/or icon.
 - `JTable` - The JTable is used to display and edit regular two-dimensional tables of cells.
 - `JTable.DropLocation` - A subclass of TransferHandler.DropLocation representing a drop location for a JTable.
 - `JTextArea` - A JTextArea is a multi-line area that displays plain text.
 - `JTextField` - JTextField is a lightweight component that allows the editing of a single line of text.
 - `JTextPane` - A text component that can be marked up with attributes that are represented graphically.
 - `JToggleButton` - An implementation of a two-state button.
 - `JToggleButton.ToggleButtonModel` - The ToggleButton model
 - `JToolBar` - JToolBar provides a component that is useful for displaying commonly used Actions or controls.
 - `JToolBar.Separator` - A toolbar-specific separator.
 - `JToolTip` - Used to display a "Tip" for a Component.
 - `JTree` - A control that displays a set of hierarchical data as an outline.
 - `JTree.DropLocation` - A subclass of TransferHandler.DropLocation representing a drop location for a JTree.
 - `JTree.DynamicUtilTreeNode` - DynamicUtilTreeNode can wrap vectors/hashtables/arrays/strings and create the appropriate children tree nodes as necessary.
 - `JTree.EmptySelectionModel` - EmptySelectionModel is a TreeSelectionModel that does not allow anything to be selected.
 - `JViewport` - The "viewport" or "porthole" through which you see the underlying information.
 - `JWindow` - A JWindow is a container that can be displayed anywhere on the user's desktop.
 - `KeyStroke` - A KeyStroke represents a key action on the keyboard, or equivalent input device.
 - `LayoutFocusTraversalPolicy` - A SortingFocusTraversalPolicy which sorts Components based on their size, position, and orientation.
 - `LayoutStyle` - LayoutStyle provides information about how to position components.
 - `LookAndFeel` - LookAndFeel, as the name implies, encapsulates a look and feel.
 - `MenuSelectionManager` - A MenuSelectionManager owns the selection in menu hierarchy.
 - `OverlayLayout` - A layout manager to arrange components over the top of each other.
 - `Popup` - Popups are used to display a Component to the user, typically on top of all the other Components in a particular containment hierarchy.
 - `PopupFactory` - PopupFactory, as the name implies, is used to obtain instances of Popups.
 - `ProgressMonitor` - A class to monitor the progress of some operation.
 - `ProgressMonitorInputStream` - Monitors the progress of reading from some InputStream.
 - `RepaintManager` - This class manages repaint requests, allowing the number of repaints to be minimized, for example by collapsing multiple requests into a single repaint for members of a component tree.
 - `RowFilter<M,I>` - RowFilter is used to filter out entries from the model so that they are not shown in the view.
 - `RowFilter.Entry<M,I>` - An Entry object is passed to instances of RowFilter, allowing the filter to get the value of the entry's data, and thus to determine whether the entry should be shown.
 - `RowSorter<M>` - RowSorter provides the basis for sorting and filtering.
 - `RowSorter.SortKey` - SortKey describes the sort order for a particular column.
 - `ScrollPaneLayout` - The layout manager used by JScrollPane.
 - `ScrollPaneLayout.UIResource` - The UI resource version of ScrollPaneLayout.
 - `SizeRequirements` - For the convenience of layout managers, calculates information about the size and position of components.
 - `SizeSequence` - A SizeSequence object efficiently maintains an ordered list of sizes and corresponding positions.
 - `SortingFocusTraversalPolicy` - A FocusTraversalPolicy that determines traversal order by sorting the Components of a focus traversal cycle based on a given Comparator.
 - `SpinnerDateModel` - A SpinnerModel for sequences of Dates.
 - `SpinnerListModel` - A simple implementation of SpinnerModel whose values are defined by an array or a List.
 - `SpinnerNumberModel` - A SpinnerModel for sequences of numbers.
 - `Spring` - An instance of the Spring class holds three properties that characterize its behavior: the minimum, preferred, and maximum values.
 - `SpringLayout` - A SpringLayout lays out the children of its associated container according to a set of constraints.
 - `SpringLayout.Constraints` - A Constraints object holds the constraints that govern the way a component's size and position change in a container controlled by a SpringLayout.
 - `SwingUtilities` - A collection of utility methods for Swing.
 - `SwingWorker<T,V>` - An abstract class to perform lengthy GUI-interaction tasks in a background thread.
 - `Timer` - Fires one or more ActionEvents at specified intervals.
 - `ToolTipManager` - Manages all the ToolTips in the system.
 - `TransferHandler` - This class is used to handle the transfer of a Transferable to and from Swing components.
 - `TransferHandler.DropLocation` - Represents a location where dropped data should be inserted.
 - `TransferHandler.TransferSupport` - This class encapsulates all relevant details of a clipboard or drag and drop transfer, and also allows for customizing aspects of the drag and drop experience.
 - `UIDefaults` - A table of defaults for Swing components.
 - `UIDefaults.LazyInputMap` - LazyInputMap will create a InputMap in its createValue method.
 - `UIDefaults.ProxyLazyValue` - This class provides an implementation of LazyValue which can be used to delay loading of the Class for the instance to be created.
 - `UIManager` - UIManager manages the current look and feel, the set of available look and feels, PropertyChangeListeners that are notified when the look and feel changes, look and feel defaults, and convenience methods for obtaining various default values.
 - `UIManager.LookAndFeelInfo` - Provides a little information about an installed LookAndFeel for the sake of configuring a menu or for initial application set up.
 - `ViewportLayout` - The default layout manager for JViewport.
   
##### Enum Summary

 Enum 	Description
 - `DropMode` - Drop modes, used to determine the method by which a component tracks and indicates a drop location during drag and drop.
 - `GroupLayout.Alignment` - Enumeration of the possible ways ParallelGroup can align its children.
 - `JTable.PrintMode` - Printing modes, used in printing JTables.
 - `LayoutStyle.ComponentPlacement` - ComponentPlacement is an enumeration of the possible ways two components can be placed relative to each other.
 - `RowFilter.ComparisonType` - Enumeration of the possible comparison values supported by some of the default RowFilters.
 - `SortOrder` - SortOrder is an enumeration of the possible sort orderings.
 - `SwingWorker.StateValue` - Values for the state bound property.
 - `Exception Summary Exception` - Description
 - `UnsupportedLookAndFeelException` - An exception that indicates the requested look & feel management classes are not present on the user's system.

##### Package javax.swing Description

Provides a set of "lightweight" (all-Java language) components that, to the maximum degree possible, work the same on all platforms. For a programmer's guide to using these components, see Creating a GUI with JFC/Swing, a trail in The Java Tutorial. For other resources, see Related Documentation. 

#### JTree



#### Look and Feel

Sun's JRE provides the following L&Fs:

    CrossPlatformLookAndFeel—this is the "Java L&F" (also called "Metal") that looks the same on all platforms. It is part of the Java API (javax.swing.plaf.metal) and is the default that will be used if you do nothing in your code to set a different L&F.

    SystemLookAndFeel—here, the application uses the L&F that is native to the system it is running on. The System L&F is determined at runtime, where the application asks the system to return the name of the appropriate L&F.

    Synth—the basis for creating your own look and feel with an XML file.

    Multiplexing— a way to have the UI methods delegate to a number of different look and feel implementations at the same time.



There are 3 look and feels in Java-

1. Java
2. Windows
3. Mac

On another page- there may be more:

1. Solaris, Linux with GTK+ 2.2 or later 	`GTK+`
2. Other Solaris, Linux 	`Motif`
3. IBM UNIX 	`IBM`*
4. HP UX 	`HP`*
5. Classic Windows 	`Windows`
6. Windows XP 	`Windows XP`
7. Windows Vista 	`Windows Vista`
8. Macintosh 	`Macintosh`*


```java
public static void main(String argv[]) 
{
  try {
    UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
  } catch (Exception evt) {}
  new FileTreeViewer();
}
```

You don't see the System L&F in the API. The GTK+, Motif, and Windows packages that it requires are shipped with the Java SDK as:

    com.sun.java.swing.plaf.gtk.GTKLookAndFeel
    com.sun.java.swing.plaf.motif.MotifLookAndFeel
    com.sun.java.swing.plaf.windows.WindowsLookAndFeel


#### Paradigms

There are two overall paradigms in Java Swing (my word)--

1. Metal
2. Nimbus
3. Synth

Synth seems to provide an XML defined GUI that can be fully customized. See [Here](https://docs.oracle.com/javase/tutorial/uiswing/lookandfeel/index.html)


From this on [LookandFeel](https://docs.oracle.com/javase/tutorial/uiswing/lookandfeel/nimbus.html)

 in Java

        Nimbus uses Java 2D vector graphics to draw the user interface (UI), rather than static bitmaps, so the UI can be crisply rendered at any resolution.

        Nimbus is highly customizable. You can use the Nimbus look and feel as is, or you can skin (customize) the look with your own brand.

```java
/**
 * Look and Feel
 * Try and set Nimbus as the look and feel
 *
 */
private void setNimbusAsLookandFeel(){
	try{
		for( UIManager.LookAndFeelInfo info :
						UIManager.getInstalledLookAndFeels() ){
			System.out.println(info.getName());
			if("Nimbus".equals( info.getName() )){
				UIManager.setLookAndFeel( info.getClassName() );
				break;
			}
		}
	}catch (Exception e){
		//if Nimbus not found, continue with the default.
	}
//	return UIManager;
}

```


##### Nimbus Customization

[Link](https://docs.oracle.com/javase/tutorial/uiswing/lookandfeel/color.html)



All of the colors used by Nimbus are stored as a set of UIManager properties. You can change any or all of these properties before you set the look and feel. For example:


```java
UIManager.put("nimbusBase", new Color(...));
UIManager.put("nimbusBlueGrey", new Color(...));
UIManager.put("control", new Color(...));

for (LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
    if ("Nimbus".equals(info.getName())) {
        UIManager.setLookAndFeel(info.getClassName());
        break;
    }
}
```

These three base colors, nimbusBase, nimbusBlueGrey, and control, will address most of your needs. See a full list of color keys and their default values on the [Nimbus Defaults page](https://docs.oracle.com/javase/tutorial/uiswing/lookandfeel/_nimbusDefaults.html#primary)

.


### Standard Dialogs

#### FileChooser

Class [Doc](https://docs.oracle.com/en/java/javase/12/docs/api/java.desktop/javax/swing/JFileChooser.html)




```java
  public static void getFileGUI(){
    try{
      JFileChooser jFileChooser = new JFileChooser();
      //      FileFilter fileFilter = new FileFilter(){
      //        @Override
      //        public boolean accept( File f ){
      //          return false;
      //        }
      //
      //        @Override
      //        public String getDescription(){
      //          return null;
      //        }
      //      }
     
      int returnVal = jFileChooser.showDialog(  TreeBuilder.getInstance(), "Read" );
      //      FileNameExtensionFilter fnEF      =
      //      jFileChooser.addChoosableFileFilter( new textFileFilterImpl() );
      jFileChooser.addChoosableFileFilter( new FileNameExtensionFilter( "Text Files", "txt" ) );
      jFileChooser.setCurrentDirectory( Paths
                                            .get( Sys.USER_DIR ).toFile() );
      //      jFileChooser.changeToParentDirectory();
      if(returnVal == JFileChooser.APPROVE_OPTION){
        File file = jFileChooser.getSelectedFile();
      }else{
        if(Sys.LOG_EN)LOG.warning( "No File Selected." );
      }
      
    }catch( HeadlessException heE){
      if(Sys.LOG_EN) LOG.warning("Well, that's unexpected. Headless Exception thrown.");
    }
  }
```


### AWT 

#### AWT Class

##### Interface Summary 
 - `ActiveEvent` - An interface for events that know how to dispatch themselves.
 - `Adjustable` - The interface for objects which have an adjustable numeric value contained within a bounded range of values.
 - `Composite` - The Composite interface, along with CompositeContext, defines the methods to compose a draw primitive with the underlying graphics area.
 - `CompositeContext` - The CompositeContext interface defines the encapsulated and optimized environment for a compositing operation.
 - `ItemSelectable` - The interface for objects which contain a set of items for which zero or more can be selected.
 - `KeyEventDispatcher` - A KeyEventDispatcher cooperates with the current KeyboardFocusManager in the targeting and dispatching of all KeyEvents.
 - `KeyEventPostProcessor` - A KeyEventPostProcessor cooperates with the current KeyboardFocusManager in the final resolution of all unconsumed KeyEvents.
 - `LayoutManager` - Defines the interface for classes that know how to lay out Containers.
 - `LayoutManager2` - Defines an interface for classes that know how to layout Containers based on a layout constraints object.
 - `MenuContainer` - The super class of all menu related containers.
 - `Paint` - This Paint interface defines how color patterns can be generated for Graphics2D operations.
 - `PaintContext` - The PaintContext interface defines the encapsulated and optimized environment to generate color patterns in device space for fill or stroke operations on a Graphics2D.
 - `PrintGraphics` - An abstract class which provides a print graphics context for a page.
 - `SecondaryLoop` - A helper interface to run the nested event loop.
 - `Shape` - The Shape interface provides definitions for objects that represent some form of geometric shape.
 - `Stroke` - The Stroke interface allows a Graphics2D object to obtain a Shape that is the decorated outline, or stylistic representation of the outline, of the specified Shape.
 - `Transparency` - The Transparency interface defines the common transparency modes for implementing classes.
 
 ##### Class Summary
 
  Class - Description

 - `AlphaComposite` - The AlphaComposite class implements basic alpha compositing rules for combining source and destination colors to achieve blending and transparency effects with graphics and images.
 - `AWTEvent` - The root event class for all AWT events.
 - `AWTEventMulticaster` - AWTEventMulticaster implements efficient and thread-safe multi-cast event dispatching for the AWT events defined in the java.awt.event package.
 - `AWTKeyStroke` - An AWTKeyStroke represents a key action on the keyboard, or equivalent input device.
 - `AWTPermission` - This class is for AWT permissions.
 - `BasicStroke` - The BasicStroke class defines a basic set of rendering attributes for the outlines of graphics primitives, which are rendered with a Graphics2D object that has its Stroke attribute set to this BasicStroke.
 - `BorderLayout` - A border layout lays out a container, arranging and resizing its components to fit in five regions: north, south, east, west, and center.
 - `BufferCapabilities` - Capabilities and properties of buffers.
 - `BufferCapabilities.FlipContents` - A type-safe enumeration of the possible back buffer contents after page-flipping
 - `Button` - This class creates a labeled button.
 - `Canvas` - A Canvas component represents a blank rectangular area of the screen onto which the application can draw or from which the application can trap input events from the user.
 - `CardLayout` - A CardLayout object is a layout manager for a container.
 - `Checkbox` - A check box is a graphical component that can be in either an "on" (true) or "off" (false) state.
 - `CheckboxGroup` - The CheckboxGroup class is used to group together a set of Checkbox buttons.
 - `CheckboxMenuItem` - This class represents a check box that can be included in a menu.
 - `Choice` - The Choice class presents a pop-up menu of choices.
 - `Color` - The Color class is used to encapsulate colors in the default sRGB color space or colors in arbitrary color spaces identified by a ColorSpace.
 - `Component` - A component is an object having a graphical representation that can be displayed on the screen and that can interact with the user.
 - `ComponentOrientation` - The ComponentOrientation class encapsulates the language-sensitive orientation that is to be used to order the elements of a component or of text.
 - `Container` - A generic Abstract Window Toolkit(AWT) container object is a component that can contain other AWT components.
 - `ContainerOrderFocusTraversalPolicy` - A FocusTraversalPolicy that determines traversal order based on the order of child Components in a Container.
 - `Cursor` - A class to encapsulate the bitmap representation of the mouse cursor.
 - `DefaultFocusTraversalPolicy` - A FocusTraversalPolicy that determines traversal order based on the order of child Components in a Container.
 - `DefaultKeyboardFocusManager` - The default KeyboardFocusManager for AWT applications.
 - `Desktop` - The Desktop class allows a Java application to launch associated applications registered on the native desktop to handle a URI or a file.
 - `Dialog` - A Dialog is a top-level window with a title and a border that is typically used to take some form of input from the user.
 - `Dimension` - The Dimension class encapsulates the width and height of a component (in integer precision) in a single object.
 - `DisplayMode` - The DisplayMode class encapsulates the bit depth, height, width, and refresh rate of a GraphicsDevice.
 - `Event` - NOTE: The Event class is obsolete and is available only for backwards compatibility.
 - `EventQueue` - EventQueue is a platform-independent class that queues events, both from the underlying peer classes and from trusted application classes.
 - `FileDialog` - The FileDialog class displays a dialog window from which the user can select a file.
 - `FlowLayout` - A flow layout arranges components in a directional flow, much like lines of text in a paragraph.
 - `FocusTraversalPolicy` - A FocusTraversalPolicy defines the order in which Components with a particular focus cycle root are traversed.
 - `Font` - The Font class represents fonts, which are used to render text in a visible way.
 - `FontMetrics` - The FontMetrics class defines a font metrics object, which encapsulates information about the rendering of a particular font on a particular screen.
 - `Frame` - A Frame is a top-level window with a title and a border.
 - `GradientPaint` - The GradientPaint class provides a way to fill a Shape with a linear color gradient pattern.
 - `Graphics` - The Graphics class is the abstract base class for all graphics contexts that allow an application to draw onto components that are realized on various devices, as well as onto off-screen images.
 - `Graphics2D` - This Graphics2D class extends the Graphics class to provide more sophisticated control over geometry, coordinate transformations, color management, and text layout.
 - `GraphicsConfigTemplate` - The GraphicsConfigTemplate class is used to obtain a valid GraphicsConfiguration.
 - `GraphicsConfiguration` - The GraphicsConfiguration class describes the characteristics of a graphics destination such as a printer or monitor.
 - `GraphicsDevice` - The GraphicsDevice class describes the graphics devices that might be available in a particular graphics environment.
 - `GraphicsEnvironment` - The GraphicsEnvironment class describes the collection of GraphicsDevice objects and Font objects available to a Java(tm) application on a particular platform.
 - `GridBagConstraints` - The GridBagConstraints class specifies constraints for components that are laid out using the GridBagLayout class.
 - `GridBagLayout` - The GridBagLayout class is a flexible layout manager that aligns components vertically, horizontally or along their baseline without requiring that the components be of the same size.
 - `GridBagLayoutInfo` - The GridBagLayoutInfo is an utility class for GridBagLayout layout manager.
 - `GridLayout` - The GridLayout class is a layout manager that lays out a container's components in a rectangular grid.
 - `Image` - The abstract class Image is the superclass of all classes that represent graphical images.
 - `ImageCapabilities` - Capabilities and properties of images.
 - `Insets` - An Insets object is a representation of the borders of a container.
 - `JobAttributes` - A set of attributes which control a print job.
 - `JobAttributes.DefaultSelectionType` - A type-safe enumeration of possible default selection states.
 - `JobAttributes.DestinationType` - A type-safe enumeration of possible job destinations.
 - `JobAttributes.DialogType` - A type-safe enumeration of possible dialogs to display to the user.
 - `JobAttributes.MultipleDocumentHandlingType` - A type-safe enumeration of possible multiple copy handling states.
 - `JobAttributes.SidesType` - A type-safe enumeration of possible multi-page impositions.
 - `KeyboardFocusManager` - The KeyboardFocusManager is responsible for managing the active and focused Windows, and the current focus owner.
 - `Label` - A Label object is a component for placing text in a container.
 - `LinearGradientPaint` - The LinearGradientPaint class provides a way to fill a Shape with a linear color gradient pattern.
 - `List` - The List component presents the user with a scrolling list of text items.
 - `MediaTracker` - The MediaTracker class is a utility class to track the status of a number of media objects.
 - `Menu` - A Menu object is a pull-down menu component that is deployed from a menu bar.
 - `MenuBar` - The MenuBar class encapsulates the platform's concept of a menu bar bound to a frame.
 - `MenuComponent` - The abstract class MenuComponent is the superclass of all menu-related components.
 - `MenuItem` - All items in a menu must belong to the class MenuItem, or one of its subclasses.
 - `MenuShortcut` - The MenuShortcutclass represents a keyboard accelerator for a MenuItem.
 - `MouseInfo` - MouseInfo provides methods for getting information about the mouse, such as mouse pointer location and the number of mouse buttons.
 - `MultipleGradientPaint` - This is the superclass for Paints which use a multiple color gradient to fill in their raster.
 - `PageAttributes` - A set of attributes which control the output of a printed page.
 - `PageAttributes.ColorType` - A type-safe enumeration of possible color states.
 - `PageAttributes.MediaType` - A type-safe enumeration of possible paper sizes.
 - `PageAttributes.OrientationRequestedType` - A type-safe enumeration of possible orientations.
 - `PageAttributes.OriginType` - A type-safe enumeration of possible origins.
 - `PageAttributes.PrintQualityType` - A type-safe enumeration of possible print qualities.
 - `Panel` - Panel is the simplest container class.
 - `Point` - A point representing a location in (x,y) coordinate space, specified in integer precision.
 - `PointerInfo` - A class that describes the pointer position.
 - `Polygon` - The Polygon class encapsulates a description of a closed, two-dimensional region within a coordinate space.
 - `PopupMenu` - A class that implements a menu which can be dynamically popped up at a specified position within a component.
 - `PrintJob` - An abstract class which initiates and executes a print job.
 - `RadialGradientPaint` - The RadialGradientPaint class provides a way to fill a shape with a circular radial color gradient pattern.
 - `Rectangle` - A Rectangle specifies an area in a coordinate space that is enclosed by the Rectangle object's upper-left point (x,y) in the coordinate space, its width, and its height.
 - `RenderingHints` - The RenderingHints class defines and manages collections of keys and associated values which allow an application to provide input into the choice of algorithms used by other classes which perform rendering and image manipulation services.
 - `RenderingHints.Key` - Defines the base type of all keys used along with the RenderingHints class to control various algorithm choices in the rendering and imaging pipelines.
 - `Robot` - This class is used to generate native system input events for the purposes of test automation, self-running demos, and other applications where control of the mouse and keyboard is needed.
 - `Scrollbar` - The Scrollbar class embodies a scroll bar, a familiar user-interface object.
 - `ScrollPane` - A container class which implements automatic horizontal and/or vertical scrolling for a single child component.
 - `ScrollPaneAdjustable` - This class represents the state of a horizontal or vertical scrollbar of a ScrollPane.
 - `SplashScreen` - The splash screen can be displayed at application startup, before the Java Virtual Machine (JVM) starts.
 - `SystemColor` - A class to encapsulate symbolic colors representing the color of native GUI objects on a system.
 - `SystemTray` - The SystemTray class represents the system tray for a desktop.
 - `TextArea` - A TextArea object is a multi-line region that displays text.
 - `TextComponent` - The TextComponent class is the superclass of any component that allows the editing of some text.
 - `TextField` - A TextField object is a text component that allows for the editing of a single line of text.
 - `TexturePaint` - The TexturePaint class provides a way to fill a Shape with a texture that is specified as a BufferedImage.
 - `Toolkit` - This class is the abstract superclass of all actual implementations of the Abstract Window Toolkit.
 - `TrayIcon` - A TrayIcon object represents a tray icon that can be added to the system tray.
 - `Window` - A Window object is a top-level window with no borders and no menubar.


##### Enum Summary

     Enum 	Description
 - `Component.BaselineResizeBehavior` - Enumeration of the common ways the baseline of a component can change as the size changes.
 - `Desktop.Action` - Represents an action type.
 - `Dialog.ModalExclusionType` - Any top-level window can be marked not to be blocked by modal dialogs.
 - `Dialog.ModalityType` - Modal dialogs block all input to some top-level windows.
 - `GraphicsDevice.WindowTranslucency` - Kinds of translucency supported by the underlying system.
 - `MultipleGradientPaint.ColorSpaceType` - The color space in which to perform the gradient interpolation.
 - `MultipleGradientPaint.CycleMethod` - The method to use when painting outside the gradient bounds.
 - `TrayIcon.MessageType` - The message type determines which icon will be displayed in the caption of the message, and a possible system sound a message may generate upon showing.
 - `Window.Type` - Enumeration of available window types.


 ##### Exception Summary
 
  Exception` - Description
 - `AWTException` - Signals that an Abstract Window Toolkit exception has occurred.
 - `FontFormatException` - Thrown by method createFont in the Font class to indicate that the specified font is bad.
 - `HeadlessException` - Thrown when code that is dependent on a keyboard, display, or mouse is called in an environment that does not support a keyboard, display, or mouse.
 - `IllegalComponentStateException` - Signals that an AWT component is not in an appropriate state for the requested operation.
 - `Error Summary Error` - Description
 - `AWTError` - Thrown when a serious Abstract Window Toolkit error has occurred.

Package java.awt Description


### JavaFx


### JavaScript in Java 

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



### Nashorn (JavaX in Java)

[JavaScript Tutorial](https://www.w3schools.com/html/html5_canvas.asp)
[Nashorn Tutorial](https://winterbe.com/posts/2014/04/05/java8-nashorn-tutorial/)

[Java 8 Nashorn Tutorial](https://winterbe.com/posts/2014/04/05/java8-nashorn-tutorial/)

> For further information about Nashorn read [here](http://docs.oracle.com/javase/8/docs/technotes/guides/scripting/nashorn/), [here](http://www.oracle.com/technetwork/articles/java/jf14-nashorn-2126515.html) and [here](https://wiki.openjdk.java.net/display/Nashorn/Nashorn+extensions). A guide to coding shell scripts with Nashorn can be found [here](http://docs.oracle.com/javase/8/docs/technotes/guides/scripting/nashorn/shell.html#sthref24).


```java
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class Main{
  public static void main( String[] args ) throws ScriptException{
    ScriptEngine engine =
          new ScriptEngineManager().getEngineByName( "nashorn" );
    engine.eval("print('HelloWorld');");
  }
}
```



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

[See JDK Structure](#JDK-Structure)

[Tool List](https://docs.oracle.com/en/java/javase/13/docs/specs/man/index.html)


All Platforms

 - `jaotc` - the Java static compiler that produces native code for compiled Java methods 
 - `jar` - create an archive for classes and resources, and manipulate or restore individual classes or resources from an archive 
 - `jarsigner` - sign and verify Java Archive (JAR) files 
 - `java` - launch a Java application 
 - `javac` - read Java class and interface definitions and compile them into bytecode and class files 
 - `javadoc` - generate HTML pages of API documentation from Java source files 
 - `javap` - disassemble one or more class files 
 - `jcmd` - send diagnostic command requests to a running Java Virtual Machine (JVM) 
 - `jconsole` - start a graphical console to monitor and manage Java applications 
 - `jdb` - find and fix bugs in Java platform programs 
 - `jdeprscan` - static analysis tool that scans a jar file (or some other aggregation of class files) for uses of deprecated API elements 
 - `jdeps` - launch the Java class dependency analyzer 
 - `jfr` - parse and print Flight Recorder files 
 - `jhsdb` - attach to a Java process or launch a postmortem debugger to analyze the content of a core dump from a crashed Java Virtual Machine (JVM) 
 - `jinfo` - generate Java configuration information for a specified Java process 
 - `jjs` - command-line tool to invoke the Nashorn engine 
 - `jlink` - assemble and optimize a set of modules and their dependencies into a custom runtime image 
 - `jmap` - print details of a specified process 
 - `jmod` - create JMOD files and list the content of existing JMOD files 
 - `jps` - list the instrumented JVMs on the target system 
 - `jrunscript` - run a command-line script shell that supports interactive and batch modes 
 - `jshell` - interactively evaluate declarations, statements, and expressions of the Java programming language in a read-eval-print loop (REPL) 
 - `jstack` - print Java stack traces of Java threads for a specified Java process 
 - `jstat` - monitor JVM statistics 
 - `jstatd` - monitor the creation and termination of instrumented Java HotSpot VMs 
 - `keytool` - manage a keystore (database) of cryptographic keys, X.509 certificate chains, and trusted certificates 
 - `pack200` - transform a Java Archive (JAR) file into a compressed pack200 file with the Java gzip compressor 
 - `rmic` - generate stub and skeleton class files using the Java Remote Method Protocol (JRMP) 
 - `rmid` - start the activation system daemon that enables objects to be registered and activated in a Java Virtual Machine (JVM) 
 - `rmiregistry` - create and start a remote object registry on the specified port on the current host 
 - `serialver` - return the `serialVersionUID` for one or more classes in a form suitable for copying into an evolving class 
 - `unpack200` - transform a packed file into a JAR file for web deployment 

Windows Only

 - `jabswitch` - enable or disable Java Access Bridge 
 - `jaccessinspector` - examine accessible information about the objects in the Java Virtual Machine using the Java Accessibility Utilities API 
 - `jaccesswalker` - navigate through the component trees in a particular Java Virtual Machine and present the hierarchy in a tree view 
 - `javaw` - launch a Java application without a console window 
 - `kinit` - obtain and cache Kerberos ticket-granting tickets 
 - `klist` - display the entries in the local credentials cache and key table 
 - `ktab` - manage the principal names and service keys stored in a local key table 


`dir *.exe` from *"...Program Files/Java/JDKxx/bin/"*

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

## javadoc.exe

[Documentation on JavaDoc (JDK v 1.6)](https://docs.oracle.com/javase/6/docs/technotes/tools/windows/javadoc.html#examples)

See also, the section on writing code [Javadoc](##javadoc)


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


#### Generating Javadoc - 

[Usage Examples](https://docs.oracle.com/en/java/javase/13/javadoc/javadoc-command.html#GUID-B0079316-8AA3-475B-8276-6A4095B5186A)

From Usage Examples:

In the following examples, the source files are located at C:\home\src\java\awt\*java. The destination directory is C:\home\html. 

If a package name has several identifiers (separated by dots, such as `java.awt.color`), then each subsequent identifier must correspond to a deeper subdirectory (such as `java\awt\color`). 

You can split the source files for a single package among two such directory trees located at different places, as long as the `-sourcepath` option points to them both. For example, `src1\java\awt\color` and `src2\java\awt\color`. 

You can run the **javadoc** command either by changing directories (with the `cd` command) or by using the `-sourcepath` option. The following examples illustrate both alternatives: 

##### Example 1   Recursive Run from One or More Packages 



This example uses `-sourcepath` so the `javadoc` command can be run from any directory for recursion. It traverses the subpackages of the Java directory excluding packages rooted at `java.net` and `java.lang`. Notice this excludes `java.lang.ref`, a subpackage of `java.lang`. To also traverse down other package trees, append their names to the `-subpackages` argument, such as `java:javax:org.xml.sax.`

    javadoc -d /home/html -sourcepath /home/src -subpackages java -exclude

##### Example 2   Change to Root and Run Explicit Packages

1. Change to the parent directory of the fully qualified package.

2. Run the javadoc command with the names of one or more packages that you want to document:

- Linux and macOS:

    cd /home/src/
    javadoc -d /home/html java.awt java.awt.event

- Windows:

    cd C:\home\src\
    javadoc -d C:\home\html java.awt java.awt.event

To also traverse down other package trees, append their names to the `-subpackages` argument, such as `java:javax:org.xml.sax.`

##### Example 3   Run from Any Directory on Explicit Packages in One Tree

In this case, it doesn't matter what the current directory is. Run the `javadoc` command and use the `-sourcepath` option with the parent directory of the top-level package. Provide the names of one or more packages that you want to document: 

Linux and macOS: `javadoc -d /home/html -sourcepath /home/src java.awt java.awt.event`

Windows: `javadoc -d C:\home\html -sourcepath C:\home\src java.awt java.awt.event`

##### Example 4   Run from Any Directory on Explicit Packages in Multiple Trees

Run the javadoc command and use the -sourcepath option with a colon-separated list of the paths to each tree's root. Provide the names of one or more packages that you want to document. All source files for a specified package don't need to be located under a single root directory, but they must be found somewhere along the source path.

Linux and macOS: `javadoc -d /home/html -sourcepath /home/src1:/home/src2 java.awt java.awt.event`

Windows: `javadoc -d C:\home\html -sourcepath C:\home\src1;C:\home\src2 java.awt java.awt.event`

The result is that all cases generate HTML-formatted documentation for the `public` and `protected` classes and interfaces in packages `java.awt` and `java.awt.event` and save the HTML files in the specified destination directory. Because two or more packages are being generated, the document has three HTML frames: one for the list of packages, another for the list of classes, and the third for the main class pages.


#### Document One or More Classes

The second way to run the `javadoc` command is to pass one or more source files. You can run `javadoc` either of the following two ways: by changing directories (with the `cd` command) or by fully specifying the path to the source files. Relative paths are relative to the current directory. The `-sourcepath` option is ignored when passing source files. You can use command-line wildcards, such as an asterisk (*), to specify groups of classes.

##### Example 1   Change to the Source Directory

Change to the directory that holds the source files. Then run the `javadoc` command with the names of one or more source files, you want to document.

This example generates HTML-formatted documentation for the classes `Button, Canvas`, and classes that begin with `Graphics`. Because source files rather than package names were passed in as arguments to the `javadoc` command, the document has two frames: one for the list of classes and the other for the main page.

Linux and macOS:

    cd /home/src/java/awt
    javadoc -d /home/html Button.java Canvas.java Graphics*.java

Windows:

    cd C:\home\src\java\awt
    javadoc -d C:\home\html Button.java Canvas.java Graphics*.java

##### Example 2   Change to the Root Directory of the Package

This is useful for documenting individual source files from different subpackages off of the same root. Change to the package root directory, and specify the source files with paths from the root.

Linux and macOS:

    cd /home/src/
    javadoc -d /home/html java/awt/Button.java java/math/BigDecimal.java

Windows:

    cd C:\home\src
    javadoc -d \home\html java\awt\Button.java java\math\BigDecimal.java

##### Example 3   Document Files from Any Directory

In this case, it doesn't matter what the current directory is. Run the `javadoc` command with the absolute path (or path relative to the current directory) to the source files that you want to document.

Linux and macOS:

    javadoc -d /home/html /home/src/java/awt/Button.java \   
    	/home/src/java/awt/Graphics*.java

Windows:

    javadoc -d C:\home\html C:\home\src\java\awt\Button.java ^
    	C:\home\src\java\awt\Graphics*.java

#### Document Packages and Classes

You can document entire packages and individual classes at the same time. The following is an example that mixes two of the previous examples. You can use the `-sourcepath` option for the path to the packages but not for the path to the individual classes.

##### Example 1   

Linux and macOS:

    javadoc -d /home/html -sourcepath /home/src java.awt \
    	/home/src/java/math/BigDecimal.java


Windows:

    javadoc -d C:\home\html -sourcepath C:\home\src java.awt ^
    	C:\home\src\java\math\BigDecimal.java



Notes

If you omit the `-windowtitle` option, then the `javadoc` command copies the document title to the window title. The `-windowtitle` option text is similar to the `-doctitle` option, but without HTML tags to prevent those tags from appearing as just characters (plain text) in the window title.

If you omit the `-footer` option, then the javadoc command *copies the header text to the footer.*

Other important options you might want to use, but weren't needed in the previous example, are the `-classpath` and `-link` options.

The `javadoc` command reads only files that contain valid class names. If the `javadoc` command isn't correctly reading the contents of a file, then verify that the class names are valid.




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
      |       a description of snippet IDs and how use+  them
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

## Reflection

Reflection.getCallerClass()


## Archetype POM

```xml
<?xml version="1.0" encoding="UTF-8"?>

<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>org.timmons.datastructures</groupId>
  <artifactId>P4encoding</artifactId>
  <version>2.0-SNAPSHOT</version>

  <name>P4encoding</name>
  <!-- FIXME change it to the project's website -->
  <url>http://www.example.com</url>
<!-- <packaging>jar</packaging> -->
<packaging>jarwarearpom</packaging>
  <properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <java.version>1.8</java.version>
<!--      com.mypackage.MyClass-->
      <mainclassName>App</mainclassName>
<!--     ${project.groupId}.${mainclassName}    -->
      <targetClass> ${groupId}.${mainclassName}</targetClass>
    <maven.compiler.source>${java.version}</maven.compiler.source>
    <maven.compiler.target>${java.version}</maven.compiler.target>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <junit.jupiter.version>5.5.1</junit.jupiter.version>
    <junit.platform.version>1.5.1</junit.platform.version>
    <maven.compiler.plugin.version>3.8.0</maven.compiler.plugin.version>
    <maven.surefire.plugin.version>2.22.1</maven.surefire.plugin.version>
    <maven.dependency.plugin.version>3.0.1</maven.dependency.plugin.version>
  </properties>