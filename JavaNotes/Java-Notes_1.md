# Java Notes
- [Java Notes](#java-notes)
  - [Type Operations](#type-operations)
    - [byte to char](#byte-to-char)
    - [Convert Char Array to String and back](#convert-char-array-to-string-and-back)
- [IO Notes](#io-notes)
  - [Reading and Writing Files](#reading-and-writing-files)
  - [Writing](#writing)
    - [As Text](#as-text)
    - [AsBytes](#asbytes)
  - [File Reading](#file-reading)
    - [AsBytes](#asbytes-1)
  - [Coalesceing](#coalesceing)
  - [Exceptions](#exceptions)
      - [types:](#types)
      - [Handling:Java](#handlingjava)


## Type Operations

### byte to char

* source : https://www.javacodegeeks.com/2010/11/java-best-practices-char-to-byte-and.html
  
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

We construct every String character from its 2 byte representation. Using the resulted character  array we can convert back to the original String, by utilizing the “classic” String constructor “new String(char[])”

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

### Convert Char Array to String and back

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

# IO Notes

## Reading  and Writing Files

http://www.java2s.com/Code/Java/File-Input-Output/Readfilecharacterbycharacter.htm

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

//https://www.youtube.com/watch?v=_jhCvy8_lGE&list=PLyRiRUsTyUXhUXoOPEdMZWhGpGeSQFZgH&index=18 @ 15:16

## Writing

### As Text

 `PrintWriter()`  Behaves the most like System.out.print();

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
### AsBytes


`FileOutputStream()` - Used to write to a file, treating it as bytes instead of text.

```Java

```
`ObjectOutputStream()` Used to serialize an object/data input stream back into an object.

**Serialization** - used to output objects to file, so that they can be recovered later.

```Java

```

## File Reading

*  `Scanner()` - most flexible of the file input class- works the similar way to as with console.
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
### AsBytes


`FileOutputStream()` - Used to write to a file, treating it as bytes instead of text.

```Java

```
`ObjectInputStream()` Used to serialize an object/data  stream out into a file.

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

## Coalesceing

If not null, the dinner = cage. getChicken(), if null get free range chicken.

```java

dinner = ((dinner = cage.getChicken()) != null) ? dinner : getFreeRangeChicken();

//or
dinner = Optional.ofNullable(cage.getChicken())
  .orElse(getFreerangeChicken());  //this method is discouraged

```



## Exceptions

#### types:
    *   IOException
    *   FileNotFoundException

#### Handling:
```java

try {
    
} catch (Exception e) {
    //TODO: handle exception
}

`$0`-$2

```Java
$1
```

```In