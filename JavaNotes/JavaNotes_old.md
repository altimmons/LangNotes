# Java Notes
//https://www.youtube.com/watch?v=_jhCvy8_lGE&list=PLyRiRUsTyUXhUXoOPEdMZWhGpGeSQFZgH&index=18 @ 15:16
# IO Notes

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


# Exceptions

### types:
    *   IOException
    *   FileNotFoundException

### Handling:
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