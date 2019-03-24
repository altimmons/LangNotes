# Exceptions

## Class location

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
2: code  <- error
3: code  >< not executed.
}

Method Call stack, goes from recent to last (the first one called.)  The code will move through the call stack looking for a handler.  If it makes it all the way to main, then it will present an error to the user and halt.

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

If you use the `throws` clause, then the calling method has to handle the exception.  This will continue up the chain until its caught.  Where I guess you can catch all with `Exception e`?

Any Exception that extends java.lang.RuntimeException is called a Runtime Exception.  They dont need to be caught or declared.  These are the ones that depend on user input.
?? another video says that we do have to check for these exceptions- its our responsibility.

ArithmeticException -  divide by 0 etc.
ClassNotFoundException - not a real exception
IllegalArgumentException
IndexOutofBounds- arrays
InputMismatchException -  wrong type e.g. scanner 
IOException - any type of IO exception
FileNotFoundException - file not found
