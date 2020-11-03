package org.timmons.datastructures;


import sun.util.logging.LoggingSupport;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.OpenOption;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Arrays;
import java.util.Date;
import java.util.EnumSet;
import java.util.Enumeration;
import java.util.logging.*;

public class logging{
  
  
  static final         PrintStream default_out           = System.out;
  static final         PrintStream default_err           = System.err;
  static final         Console     con                   = System.console();
  public static final  Logger      GLOBAL_LOGGER         = Logger.getGlobal();
  private static       String      LOGFILE_CONFIGURATION =
      "%h/Output_Log%g.pkg.log";
  private static final String      PRE_PARAMS            = "%h/";
  private static final String      POST_PARAMS           = "%g-%u";
  
  /**Level.DEFAULT_LEVEL ==  GlobalLogger.Level @ startup.
   * I was playing with a way to add a level, it didnt make a whole lot of
   * sense, but it piqued my interest that it had protected access and yet
   * you were supposed to access it.  So I played with how I might
   * instantiate a new one, and do so on instantiation of this class before
   * anything is altered.  This is what I came up with.  It has to run in a
   * static block, though this class is static for all practical purposes,
   * because if it is reinstantiated, the Global Logger level may already
   * have changed.  This isnt the best way, or even all that useful, just
   * playing with my understanding of Java.

   This however does not work quite like expected.  Perhaps it needs to be overridden...
   */
  private static Level DEFAULT_LEVEL;
  static {
    class DefaultLevel extends Level{
      
      DefaultLevel(){
        super( "DEFAULT_LEVEL" , Logger.getGlobal().getLevel().intValue(),
             Level.ALL.getResourceBundleName()
             );
      }
      protected Level getDefaultLevel(){
        return this;
      }
      
    }
  
    LogMan.DEFAULT_LEVEL = new DefaultLevel().getDefaultLevel();
  }
  
  private static       Handler     fileHandler;
  private static       Handler     defaultConsoleHandler;
  private static       String      defaultFormatting;
  private static       Handler     streamHandler;
  public static        int         currentLogValue;
  public static        Level       currentLogLevel;
  private static final String      defaultFileName       = "LogFile.txt";
  private static final Logger      LOG                   =
      Logger.getLogger( "LogMan" );
//  private static       File        ;
  static File  tempLogFile,  temporaryFile;
  static PrintStream psFileOut, psFileErr, oldPSConsole, oldPSerr;
  
  
  
  //private static final Formatter SIMPLE_FORMATTER = new SimpleFormatter();
  //java.util.logging.SimpleFormatter.format =
  
  static final   LogManager logManager = LogManager.getLogManager();
  private static String     LOGFile;
  private        Formatter  formatter;
  private static File       consoleFile, errorFile, logFile;
  private static NullStream consoleStream;
  private static ConsoleHandler consoleHandler;
  
  
  public static Logger getGlobalLogger(){
    
    return GLOBAL_LOGGER;
  }
  
  
  LogMan( int format ){
    System.setProperty( "java.util.logging.SimpleFormatter.format" ,
  getFormatString( format ) );
    getLogDir();
    init();
  }
  
  /**
   * I was second guessing myself about overloading constructors so I did it
   * this way.
   */
  LogMan(){
  }
  
  private void init(){
    /*This doesnt work.  I guess theres no default state:?*/
    //get the current state: handlers
    for( Handler[] handlers : new Handler[][]{ GLOBAL_LOGGER.getHandlers() ,
        LOG.getHandlers() ,
        LOG.getParent().getHandlers() } ){
//      if( handlers.length > 0 ) System.out.println( "Handlers is more than 0" );
      
      for( Handler handler : handlers ){
        //should just have a console handler
        if( handler instanceof ConsoleHandler ){
          defaultConsoleHandler = handler;
          GLOBAL_LOGGER.removeHandler( handler );
          //          formatter             = handler.getFormatter();
//          ErrorManager defaultErrorManager = handler.getErrorManager();
//          Filter       defaultFilter       = handler.getFilter();
//          Level        defaultLevel        = handler.getLevel();
        }
      }
      
      //	  globalLogger.addHandler(  );
    }
  }
  
  public static void flushFiles(){
    fileHandler.flush();
  }
  
  public static void redirectLogFile(String initalFileName) throws IOException{
    
     String  fileName = initalFileName;
    final String ext          = ".txt";
    FileHandler fileHandler;
    
    String pathName = getPathName( fileName , ext );
    
    while( Files.exists( Paths.get( pathName ) ) ){
      pathName = getPathName( fileName , ext );
    }
  
    File tempFile= new File( pathName );
  
    try{
      
//      PrintStream printStream = new PrintStream( tempFile );
      fileHandler = new FileHandler( tempFile.getAbsolutePath(), 8096, 1, true );
      System.out.println( "Logs are being written out to " + tempFile.getAbsolutePath().toString() );
      fileHandler.setFormatter( new SimpleFormatter() );
      fileHandler.setLevel( Level.ALL );
      
      //make a new filter that passes all.
      Filter filter = new Filter(){
        @Override
        public boolean isLoggable( LogRecord record ){
          return true;
        }
      };
      
      fileHandler.setFilter(filter  );
      GLOBAL_LOGGER.addHandler( fileHandler );
      LOG.info( "Setting Console Level Logging to WARN and above." );
      consoleHandler = new ConsoleHandler();
      consoleHandler.setLevel(Level.WARNING );
      Logger.getLogger( "processor" ).setParent( Logger.getGlobal() );
      Logger.getLogger( "processor" ).setUseParentHandlers( true );
      Logger.getLogger( "App(main)" ).setParent( Logger.getGlobal() );
      Logger.getLogger( "App(main)" ).setUseParentHandlers( true );
      Logger.getLogger( "TokenQueue-inst." ).setParent( Logger.getGlobal() );
      Logger.getLogger( "TokenQueue-inst." ).setUseParentHandlers( true );
    } catch( IOException e ){
      throw new IOException( e.getMessage() );
    }finally{
      tempFile.deleteOnExit();
    }
  }
  
  private static String getPathName( String fileName , String ext ){
    Date date = new Date(System.getProperty(  ))
    String timeSubString = getTimeString();
    return Sys.USER_DIR + Sys.FILE_SEP + "Logs" + Sys.FILE_SEP + fileName + timeSubString + ext;
  }
  
  
  /**
   * Not entirely necessary to have this as a method, yet its called 3 or 4
   * times (or more depending on it)
   */
  private static String getTimeString(){
    return String.valueOf(System.currentTimeMillis()).substring( 6,
    10);
  }
  
  
  /**
   * This method is designed to check that a directory ready to receive the
   * log Files is available, and if it is not present, creates it.
   *
   * That said, IntelliJ seems to be preventing the JVM from altering the
   * file structure of this project directory. Which in many respects makes
   * sense from a stability and side effects standpoint, as the addition of
   * folders in the right place can change the class path of the classes
   * contained there-in were they to be affected.
   */
  private static void getLogDir(){
    String path = Sys.USER_DIR + Sys.FILE_SEP + "Logs" + Sys.FILE_SEP;
    // Files.notExists( Paths.get( path ) evaluates as true
    //Files.isDirectory( Paths.get( path ) ) evaluates as false
    if( Files.notExists( Paths.get( path ) )) {
      LOG.fine( "The directory for log files" + path + "does not exist and " + "will be created" );
      try{
        Files.createDirectory( Paths.get( path ) );
  
      }catch( IOException ioE ){
        LOG.warning( String.format( "Call to %s from %s :  Resulted in "
                                 + "IOExceptoion, Trying another method" ,
            "getLogDir" ,
            "LogMan" ) );
        LOG.warning( ioE.getMessage()
                   );
          File f = new File( Paths.get( path ).toUri() );
          if ( f.mkdir(  )){
            LOG.fine( "New directory created." );
          }else{
            LOG.severe( "Make Directory failed" + path );
          }
      }
    } else{
      LOG.fine( "[Logs] directory exists." );
    
    }
  }
  
  /**
   * After I was continuing to get output after removing the console handler
   * from Global logger, I tried this method to strip that class from each
   * class.  Later
   */
  public Logger setupLogger(Logger classLogger){
    
    LogManager  logManager = LogManager.getLogManager();
    
    for(Enumeration<String> loggerNames = logManager.getLoggerNames();
        loggerNames.hasMoreElements();)
    {
      String name       = loggerNames.nextElement();
      Logger thisLogger = Logger.getLogger( name );
      for (Handler handler : classLogger.getHandlers() )
        if( handler instanceof ConsoleHandler ){
          classLogger.removeHandler( handler );
        }
    }
//    for(logNames; logNames.hasMoreElements();){
//      Handler[]   handlers   = classLogger.getHandlers();
//      for (Handler handler : classLogger.getHandlers() )
//        if( handler instanceof ConsoleHandler ){
//          classLogger.removeHandler( handler );
//        }x
//      logNames.nextElement();
//    }
    
    Handler[]   handlers   = classLogger.getHandlers();

    
//    for( Handler handler : handlers ){

//    }
    classLogger.setUseParentHandlers( true );
    classLogger.addHandler( consoleHandler );
    classLogger.addHandler( fileHandler );
    return classLogger;
  }
  
  public static void redirectConsole(){
    
    try{
//      File f = new File(Sys.USER_DIR + Sys.FILE_SEP + "any.file");
  
//      consoleFile = File.createTempFile( "output" +
//       = File.createTempFile( "output" +
//                                         getTimeString() ,
//      ".tmp", new File( URI.create(Sys.USER_DIR)) );
      String pathName = getPathName( "output" , ".txt" );
//      File f = new File( pathName );
      consoleFile = new File( pathName );
      if(Sys.LOG_EN) LOG.info("Opening a temporary file at " + consoleFile.getAbsolutePath() + " for console output.");
//       errorFile = File.createTempFile( "error" +
//                           (String.valueOf(System.currentTimeMillis()).substring(3,6 )) ,
//      ".tmp", new File( URI.create(Sys.USER_DIR)) );
      
//       logFile = File.createTempFile( "error" +
//                                      getTimeString() ,
//      ".tmp", new File( URI.create(Sys.USER_DIR)) );
      consoleStream = new NullStream( consoleFile );
      oldPSConsole = System.out;
      oldPSerr = System.err;
      System.setOut( consoleStream );
      System.setErr( consoleStream );
      
    }catch( IOException ignore ){};
  
  }
  
  /**
   * NullStream was intended to be a dummy class that I could print to, just
   * as in the class it extends, PrintStream.  The intention was that the
   * strings passed to PrintStream would add to a String array(initially) and
   * later a <code>Vector\<String\></code> that would be taken into the
   * htmlPane, in the bottom third of the GUI.  It probably looks like just a
   * narrow white band at this point.  The hope was that I could write this
   * list to act like a console, such that the dialogue would be printed there.
   */
  public static NullStream getConsoleStream(){
    return consoleStream;
  }
  
  /**
   * This method was used for debugging, a quick method to print all the
   * relevant points I can get on a logger to try and peek into whats going
   * on.  Not particularly useful.
   */
  private String getString(Logger classLogger){
    return ( String.format( "Logger information: Logger: %s, "
                             + "Level: "
                             + "%s, Filter: %s, Handlers: %s, Parent: %s, "
                             + "useParent: %s, \n Logger String "
                             + "Representation: %s",
                classLogger.getName(), classLogger.getLevel(),classLogger.getFilter()
        , Arrays.toString( classLogger.getHandlers() ) , classLogger.getParent(),
        classLogger.getUseParentHandlers(), classLogger.toString()) );
  }
  
  
  /**
   * Experimenting with formatters, not ready yet.
   */
  protected Formatter getCustFormatter(){
    return new Formatter(){
      @Override
      public String format( LogRecord record ){
        return unwrapArray( logPreformat(  record ), "");
      }
    };
  }
  
  /**
   * Method for formatting a Log Record.
   * <p>
   * Source : https://github.com/jenkinsci/jenkins/blob/master/core/src/main
   * /java/hudson/Functions.java#L576
   */
  private static String[] logPreformat( LogRecord record ){
    String source;
    if( record.getSourceClassName() == null ){
      //source missing, replace with logger name...
      source = record.getLoggerName();
    } else{
      if( record.getSourceMethodName() == null ){
        source = record.getSourceClassName();
      } else{
        source = String.format( "%s %s" ,
            record.getSourceClassName() ,
            record.getSourceMethodName()
                              );
      }
    }
    String message =
        new SimpleFormatter().formatMessage( record ) + Sys.LINE_SEP;
    Throwable throwable = record.getThrown();
    
    return new String[]{ String.format(
        "%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS %1$Tp" ,
        new Date( record.getMillis() )
                                      ) ,
        source ,
        record.getLevel().getLocalizedName() ,
        throwable == null ?
        message :
        message + convertStackTraceToString( throwable ) + "\n" };
  }
  
  
  /**
   * Unwrap an array into a single String
   */
  private static String unwrapArray(String[] stringArray, String separator){
    separator = (separator == null ) ? "" : separator;
    StringBuilder outString = new StringBuilder();
    if(stringArray !=  null && stringArray.length > 0){
      for (String s : stringArray){
        //add the separator, but only after the first one and if theres another.
        if(outString.length()>0) outString.append( separator );
        
        outString.append( s );
      }
    }
    return outString.toString();
  }
  
  
  /**
   * Overloaded single param method
   * with a new line as the default
   */
  private static String unwrapArray(String[] stringArray){
    return unwrapArray( stringArray, Sys.LINE_SEP);
  }
  
  /**
   * Converts stack traces to a usable string.  Inspiration found here:
   * <p>
   * link: https://howtodoinjava.com/java/string/convert-stacktrace-to-string/
   */
  public static String convertStackTraceToString( Throwable throwable ){
    try( StringWriter stringWriter = new StringWriter() ;
         PrintWriter printWriter = new PrintWriter( stringWriter ) ; ){
      throwable.printStackTrace( printWriter );
      return stringWriter.toString();
      
    } catch( IOException iOE ){
      if( Sys.DEBUG_EN ){
        System.err.println( "IO Exception in " + "convertStackTraceTo String" );
        iOE.printStackTrace();
      }
      if( Sys.LOG_EN ){
        LOG.warning( "IO Exception error" );
        //	      throw new Exception("IO Exception");
        throw new IllegalStateException( iOE );
      }
    }
    return null;
  }
  
  
  /**
   * returns a format string
   * <p>
   * /** * From My notes (which are obviously from documentation somewhere...) *
   * * The formatting can be customized by specifying the format string in the *
   * [`java.util.logging.SimpleFormatter.format`](#formatting) property. The *
   * given `LogRecord` will be formatted as if by calling: * * ```java *
   * String.format(format, date, source, logger, level, message, thrown) * ``` *
   * where the arguments are:
   *<p>
   * 1.  `format` - the format string specified in the `java.util.logging
   * .SimpleFormatter.format` property or the default format.
   * <p>
   * 2.  `date` - a `ZonedDateTime` "class in java.time" object  representing
   * event time <code>(LogRecord.html#getInstant())</code> of the log record
   * in the `ZoneId
   * <code>.systemDefault()`</code> (ZoneId.html#systemDefault()) system
   * time zone.
   * <p>
   * 3.  `source` - a string representing the caller, if available;
   * otherwise,  the logger's name.
   * <p>
   * 4.  `logger` - the logger's name.
   * <p>
   * 5. `level` - the log level.
   * <p>
   * 6.  `message` - the formatted log message returned from the `Formatter
   * .formatMessage(LogRecord)` method. It uses `java.text` class in java .text
   * formatting and does not use the `java.util.Formatter format` argument.
   *
   * 6.  `thrown` - a string representing the [throwable](LogRecord * .html#getThrown()) associated with
   * the log record and its backtrace * beginning with a newline character, if
   * any; otherwise, an empty string. * Some example formats: * * ```java *
   * java.util.logging.SimpleFormatter.format="%4$s: %5$s [%1$tc]%n" * ```
   *
   *  %4$.1s       Apr 22, 2020 10:09:06 PMApr 22, 2020 10:09:06 PMApr 22, 2020
   *         10:09:06 PMApr 22, 2020 10
   */
  //todo add an enum to select these
  String getFormatString( int i ){
    switch( i ){

      
      case 0:
              /*
      * Produces Junk:
      *
      * I
        I
        I
        I
        I
        I
      * */
        return "%4$.1s %n %5$s%n";
      case 1:
        /*
        Returns a ton of junk
        Apr 22, 2020 10:09:06 PMApr 22, 2020 10:09:06 PMApr 22, 2020 10:09:06 PMApr 22, 2020 10
         */
        return "%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS %1$Tp %5$s%n";
      case 2:
      /*
      Example
        INFO: Key:C, Value: 01101
        Apr 22, 2020 10:13:48.470000000 PM org.timmons.datastructures.Huffcoder encode
        INFO: Key:B, Value: 00101
        Apr 22, 2020 10:13:48.470000000 PM org.timmons.datastructures.Huffcoder encode
        INFO: Key:A, Value: 0110
        */
        
        return "1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS %1$Tp %2$s%n%4$s: %5$s%n";
  
  
      case 3:
        /*
        Since JDK 9, java.util.logging uses java.time to create more precise
        time stamps. The format above can be used to add a .%1$tN to the
        date/time formatting so that nanoseconds will also be printed:
        */
        return "%1$tb %1$td, %1$tY %1$tl:%1$tM:%1$tS.%1$tN %1$Tp %2$s%n%4$s: "
               + "%5$s%6$s%n";
      
      case 4:
      /*
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
        
        */
        return "%1$tc %2$s%n%4$s: %5$s%6$s%n";
        /*
        This prints 1 line with the log level `(4$)`, the log message `(5$)`
        and the timestamp `(1$)` in a square bracket.

        WARNING: warning message [Tue Mar 22 13:11:31 PDT 2011]
         */
      case 5:
        return "%4$s: %5$s [%1$tc]%n";
      case 6:
        /*
         INFO: Key:D, Value: 01100 [Wed Apr 22 22:38:43 EDT 2020]
        INFO: Key:C, Value: 01101 [Wed Apr 22 22:38:43 EDT 2020]
        INFO: Key:B, Value: 00101 [Wed Apr 22 22:38:43 EDT 2020]
        INFO: Key:A, Value: 0110 [Wed Apr 22 22:38:43 EDT 2020]
        */
      //        //todo
              return "%4$s: %5$s [%1$tc]%n";
      case 7:
        /*
         INFO: [Wed Apr 22 22:40:41 EDT 2020]
         Starting TreeBuilder Initialization Routine and Adding Root Node
         INFO: [Wed Apr 22 22:40:41 EDT 2020]
         Started Form Generation routines
         INFO: [Wed Apr 22 22:40:41 EDT 2020]
         Initializing new treeBuilder.
         INFO: [Wed Apr 22 22:40:41 EDT 2020]
         Close Icon Load status is 8
         WARNING: [Wed Apr 22 22:40:41 EDT 2020]
         */
        
        return "%4$s: [%1$tc]%n %5$s%6$s%n ";
      case 8:
        /*
         INFO: [Wed Apr 22 22:42:57 EDT 2020]
            Starting TreeBuilder Initialization Routine and Adding Root Node
         INFO: [Wed Apr 22 22:42:57 EDT 2020]
            Started Form Generation routines
         INFO: [Wed Apr 22 22:42:57 EDT 2020]
            Initializing new treeBuilder.
         INFO: [Wed Apr 22 22:42:58 EDT 2020]
            Close Icon Load status is 8
         WARNING: [Wed Apr 22 22:42:58 EDT 2020]
            Null Pointer Exception when generating interface
         */
        return "%4$s: [%1$tc]%n \t%5$s%6$s%n ";
        
      case 9:
        return "%4$s: [%1$tc] \t%5$s%6$s%n ";
  
      default:
        /*
        This returns the basic simple format string.
         */
        return LoggingSupport.getSimpleFormat();
    }
  }
  
  //enum LogTarget{
  //		TO_FILE(fileOut), TO_CONSOLE, TO_STREAM;
  //
  //
  //Runnable fileOut = () -> {
  
  static void setFileHandler(){
    String     defaultfn     = LogMan.defaultFileName;
    File       outFile       = new File( defaultfn );
    OpenOption createOption  = StandardOpenOption.CREATE;
    OpenOption writeOrAppend = ( App.appendLog ) ?
                               StandardOpenOption.APPEND :
                               StandardOpenOption.CREATE;
    String     fileName      = ( LOGFile == null ) ? defaultfn : LOGFile;
    if( ! App.appendLog ){
      while( Files.exists( Paths.get( fileName ) ) ){
        fileName = Sys.fileNameIterator( fileName );
      }
    }
    try{
      Handler fileHandler = new FileHandler( fileName );
    } catch( FileNotFoundException fnfE ){
      LogMan.LOG.warning( String.format(
          "\"File Not Found Exception\". :(C)%s (m)%s" ,
          "run" ,
          "LogTarget"
                                       ) );
    } catch( IOException ioE ){
      LogMan.LOG.warning( "IO Exception trying to open file: " + Paths
                                                                     .get(
                                                                         fileName )
                                                                     .toAbsolutePath()
                                                                     .toString() );
    } catch( IllegalArgumentException iaE ){
      LogMan.LOG.warning( "IllegalArgumentException trying to open file: " + Paths
                                                                                 .get(
                                                                                     fileName )
                                                                                 .toAbsolutePath()
                                                                                 .toString() );
    } catch( SecurityException sE ){
      LogMan.LOG.warning( "SecurityException trying to open file: " + Paths
                                                                          .get(
                                                                              fileName )
                                                                          .toAbsolutePath()
                                                                          .toString() );
    } catch( NullPointerException npE ){
      LogMan.LOG.warning( "NullPointerException trying to open file: " + Paths
                                                                             .get(
                                                                                 fileName )
                                                                             .toAbsolutePath()
                                                                             .toString() );
    }
  }
  
  
  static void setFileWriter(){
    String     defaultfileOut = App.defaultFileName;
    File       outFile        = new File( defaultFileName );
    OpenOption writeOrAppend  = ( App.appendLog ) ?
                                StandardOpenOption.APPEND :
                                StandardOpenOption.CREATE;
    String     fileName       = ( LOGFile == null ) ? defaultFileName : LOGFile;
    if( ! App.appendLog ){
      while( Files.exists( Paths.get( fileName ) ) ){
        fileName = Sys.fileNameIterator( fileName );
      }
    }
    try(
        PrintStream printStream =
            new PrintStream( Files.newOutputStream( Paths.get(
            fileName ) ) ) ){
      System.setOut( printStream );
    } catch( FileNotFoundException fnfE ){
      LogMan.LOG.warning( String.format(
          "\"File Not Found Exception\". :(C)%s (m)%s" ,
          "run" ,
          "LogTarget" ) );
    } catch( IOException ioE ){
      LogMan.LOG.warning( "IO Exception trying to open file: " + Paths
                                                                     .get(
                                                                         fileName )
                                                                     .toAbsolutePath()
                                                                     .toString() );
    } catch( IllegalArgumentException iaE ){
      LogMan.LOG.warning( "IllegalArgumentException trying to open file: " + Paths
                                                                                 .get(
                                                                                     fileName )
                                                                                 .toAbsolutePath()
                                                                                 .toString() );
    } catch( SecurityException sE ){
      LogMan.LOG.warning( "SecurityException trying to open file: " + Paths
                                                                          .get(
                                                                              fileName )
                                                                          .toAbsolutePath()
                                                                          .toString() );
    } catch( NullPointerException npE ){
      LogMan.LOG.warning( "NullPointerException trying to open file: " + Paths
                                                                             .get(
                                                                                 fileName )
                                                                             .toAbsolutePath()
                                                                             .toString() );
    }
    
    LogMan.LOG.warning( String.format(
        "\"File Not Found Exception\". :(C)%s (m)%s" ,
        "run" ,
        "LogTarget"
                                     ) );
    
  }
  
  //
  //
  //}
  
  static void initTest(){
    LogMan.GLOBAL_LOGGER.addHandler( new ConsoleHandler() );
    LogMan.GLOBAL_LOGGER.setLevel( Level.ALL );
    LogMan.LOG.info( String.format( " Logger Initiated. :(C)%s (m)%s" ,
        "initTest" ,
        "LogMan"
                                  ) );
    
    //		LogMan.GLOBAL_LOGGER.setFilter(  LoG);
  }
  
  /**
   * <li> OFF    0x7FFFFFFF 0
   * <li>SEVERE  1000       1
   * <li>WARNING 900        2
   * <li>INFO    800
   * <li>CONFIG  700        3
   * <li>FINE    500
   * <li>FINER   400        4
   * <li>FINEST  300
   * <li>ALL     0          5
   */
  private static void setGlobalLogLevel( int givenLogLevel ){
    
    int logLevel = givenLogLevel;
    switch( logLevel ){
      case 0:
        LogMan.GLOBAL_LOGGER.setLevel( Level.OFF );
        currentLogValue = 0;
        break;
      case 1:
        LogMan.GLOBAL_LOGGER.setLevel( Level.SEVERE );
        currentLogValue = 1;
        break;
      case 3:
        LogMan.GLOBAL_LOGGER.setLevel( Level.CONFIG );
        currentLogValue = 3;
        break;
      case 4:
        LogMan.GLOBAL_LOGGER.setLevel( Level.FINER );
        currentLogValue = 4;
        break;
      case 5:
        LogMan.GLOBAL_LOGGER.setLevel( Level.ALL );
        currentLogValue = 5;
        break;
      default: case 2:
        LogMan.GLOBAL_LOGGER.setLevel( Level.WARNING );
        currentLogValue = 2;
        break;
    }
  }
  
  
  public static void setLogINFO(){
    LogMan.setGlobalLogLevel( 3 );
    LOG.info( "Level set to Info (3)" );
  }
  
  public static void setLogWARN(){
    LogMan.setGlobalLogLevel( 2 );
    LOG.info( "Level set to Warn" );
  }
  
  public static void setLogSEVERE(){
    LogMan.setGlobalLogLevel( 1 );
    LOG.info( "Level set to Severe (1)" );
  }
  
  public static void setLogFINE(){
    LogMan.setGlobalLogLevel( 4 );
    LOG.info( "Level set to Fine (4)" );
    
  }
  
  public static void setLogALL(){
    LogMan.setGlobalLogLevel( 5 );
    LOG.info( "Level set to All (5)" );
    
  }
  
  public static void setLogOFF(){
    LogMan.setGlobalLogLevel( 0 );
    LOG.info( "Level set to Off (0)" );
  }
  
  public static Level getLogLevel(){
    return LogMan.GLOBAL_LOGGER.getLevel();
    
  }
  
  
  public static void initTempFile(){
    try{
      tempLogFile = File.createTempFile( Sys.randChars( 20 ) , "txt" );
      if( ! tempLogFile.exists() ) tempLogFile.createNewFile();
      if( ! tempLogFile.canWrite() )
        throw new IOException( "File Created, but unable to write to file" );
      FileHandler logFileHandler = new FileHandler( tempLogFile.toString() );
      
      //		logFileHandler.setFilter(  );
      //		logFileHandler.setFormatter( java.util.logging.SimpleFormatter
      //		.format="%4$s: %5$s [%1$tc]%n");
    } catch( FileNotFoundException fnfE ){
      LOG.warning( "FileNotFoundException trying to open file: " + Paths
                                                                       .get(
                                                                           tempLogFile
                                                                               .toString() )
                                                                       .toAbsolutePath() );
      LOG.warning( Sys.exceptionConv( fnfE ) );
      
    } catch( IOException ioE ){
      LOG.warning( "IO Exception trying to open file: " + Paths
                                                              .get( tempLogFile.toString() )
                                                              .toAbsolutePath() );
      LOG.warning( Sys.exceptionConv( ioE ) );
      
    } catch( IllegalArgumentException iaE ){
      LOG.warning( "IllegalArgumentException trying to open file: " + Paths
                                                                          .get(
                                                                              tempLogFile
                                                                                  .toString() )
                                                                          .toAbsolutePath() );
      LOG.warning( Sys.exceptionConv( iaE ) );
      
    } catch( SecurityException sE ){
      LOG.warning( "SecurityException trying to open file: " + Paths
                                                                   .get(
                                                                       tempLogFile
                                                                           .toString() )
                                                                   .toAbsolutePath() );
      LOG.warning( Sys.exceptionConv( sE ) );
    } catch( NullPointerException npE ){
      LOG.warning( "NullPointerException! trying to open file: " + Paths
                                                                       .get(
                                                                           tempLogFile
                                                                               .toString() )
                                                                       .toAbsolutePath() );
      LOG.warning( Sys.exceptionConv( npE ) );
    }
    
  }
  
  class allFilter implements Filter{
    
    @Override
    public boolean isLoggable( LogRecord record ){
      return true;
    }
  }
  
  //class anyFilter implements Filter{
  //
  //	@Override
  //	public boolean isLoggable( LogRecord record ){
  //		record.getLevel();
  //	}
  //}
  class noneFilter implements Filter{
    
    @Override
    public boolean isLoggable( LogRecord record ){
      return false;
    }
  }
  
  class logFormatter extends Formatter{
    
    @Override
    public String format( LogRecord record ){
      Level    level      = record.getLevel();
      long     time       = record.getMillis();
      int      threadID   = record.getThreadID();
      long     sequenceNo = record.getSequenceNumber();
      Object[] oo         = record.getParameters();
      if( oo != null ){
        String strParams = "Params:";
        for( Object o : oo ){
          strParams += ( "\n\t" + o
                                      .getClass()
                                      .getName()
                                      .toUpperCase() + ": " + o.toString()
          );
        }
      }
      String strLevel     = level.getLocalizedName();
      String strLogger    = record.getLoggerName();
      String strMessage   = record.getMessage();
      String strSrcClass  = record.getSourceClassName();
      String strSrcMethod = record.getSourceMethodName();
      String strTime      = String.valueOf( record.getMillis() );
      String strThread    = String.valueOf( record.getThreadID() );
      String strSeqNo     = String.valueOf( record.getSequenceNumber() );
      String strThrown    = String.valueOf( record.getThrown() );
      
      String result = "";
      
      //Instant  intstant = record.getInstant(); //Java 9+
      //    java.util.logging.SimpleFormatter.format = "%1$tc %2$s%n%4$s: %5$s%6$s%n";
      System.setProperty( "java.util.logging.SimpleFormatter.format" ,
          "%4$s: " + "%5$s [%1$tc]%n"
                        );
      return null;
    }
  }
  
  
/*
  *//**
   * Add this to the Logger Output. So it all comes out one place.
   *
   * @param outputStream
   *//*
  private void addToHandlers(OutputStream outputStream){
    if(psFileOut != null || psFileErr != null){
      
      //create a format.  Dont want that BS XML
      Formatter streamFormatter = new SimpleFormatter();
      
      //Create the handler, with formatter and the outputStream we created
      StreamHandler streamHandler = new StreamHandler(outputStream, streamFormatter);
      
      //Get the global logger so it applys to all of them.
      Logger global = Logger.getGlobal();
      
      //set the level.
      global.setLevel( IOConfig.getGlobalLogLevel() );
      
      //global.addHandler( streamHandler );
      //todo IOConfig.setStreamHandler( streamHandler );
      //todo IOMain.addFileLog( outPath );
    }
  }
  
  */
//  /**
//   * Redirect std err.
//   *
//   * @param errFile the out file
//   * @param append  the append
//   */
//  public /*static*/ void redirectStdErr( String errFile, boolean append ){
//    LOG.entering( "redirectStdErr" , "IORedirect" , "[errFile, append]" );
//    //String outFile = "sampleLog.txt";
//
//    LOG.info( "IORedirect started. Redirecting StdErr" );
//    // System.out.println( "The file is " + file.getAbsolutePath());
//    // System.out.println("file.exists is " + file.exists() );
//
//    //create a file object using the file name
//    File file = new File( errFile );
//
//    errPath     = file.getAbsolutePath();
//    psSystemErr = System.err;
//    psFileErr   = internalSetMethod( file , false , append );
//    System.setOut( psFileErr );
//
//    //todo- should probably check that this works at some point.
//    if( psFileErr.equals( System.err ) ){
//      errRedirected = false;
//    } else errRedirected = true;
//    LOG.exiting( "redirectStdErr" , "IORedirect" , "" );
//  }
//
  
  /**
   * Redirect std out.
   *
   * @param errFile the out file
   */
  ///*static*/ overloaded method to create a new outstream and - in the end, redirect the
  // console.
/*  public void redirectStdErr( String errFile ){
    redirectStdErr( errFile, true );
  }
  */
  
  /**
   * fileExistsMethod- A method containing the duplicated code between the
   * methods
   *
   * @param file - a file to determine if it exists
   *
   * @throws java.io.IOException -  IOException is thrown if something is unable to be
   *                             opened.
   */
  private /*static*/ void fileExistsMethod( /*@NotNull*/ File file )
      throws IOException{
    if( ! file.exists() ){
      System.out.print( "The file did not exist" );
      file.createNewFile();  //try and create the file
      if( ! file.exists() ){
        //check and make sure that a file was in fact created
        //if not throw an exception.
        throw new IOException( "A file cannot be created." );
      }
      //report that a file has been created.
      System.out.println( ", but has been created at " + file.getAbsolutePath() );
    }
  }
  
//  /**
//   * swaps StdOut back to the console quickly.  Or back.
//   */
//  public /*static*/ void swapStdOut(){
//    if( psFileOut != null ){
//      if( outRedirected ){
//        System.setOut( psSystemOut );
//        outRedirected = false;
//        LOG.info( String.format( "StdOut redirected to console  :(C)%s (m)%s[%d]", "swap",
//            "IORedirect" ) );
//
//      }else{
//        System.setOut( psFileOut );
//        outRedirected = true;
//        LOG.info( String.format( "StdOut redirected to file  :(C)%s (m)%s[%d]", "swap",
//            "IORedirect" ) );
//      }
//    }
//  }
  /*
   *
   * This prints 1 line with the log level `(4$)`, the log message `(5$)` and
   * the timestamp `(1$)` in a square bracket.
   *
   *      WARNING: warning message [Tue Mar 22 13:11:31 PDT 2011]
   *
   *
   * ```java.md
   * java.util.logging.SimpleFormatter.format="%1$tc %2$s%n%4$s: %5$s%6$s%n"
   * ```
   * This prints 2 lines where:
   * - the first line includes the timestamp `(1$)` `%1$tc`
   * - the source `(2$)` `%2$s%`
   * - the second line includes the log level `(4$)` `%n%4$s:`
   * - the log message `(5$)` `%5$s`
   * - followed with the throwable and its backtrace `(6$)` `%6$s%n`, if any:
   *
   *         Tue Mar 22 13:11:31 PDT 2011 MyClass fatal
   *         SEVERE: several message with an exception
   *         java.lang.IllegalArgumentException: invalid argument
   *                 at MyClass.mash(MyClass.java:9)
   *                 at MyClass.crunch(MyClass.java:6)
   *                 at MyClass.main(MyClass.java:3)
   *
   * ```java
   * java.util.logging.SimpleFormatter.format="%1$tb %1$td, %1$tY
   * %1$tl:%1$tM:%1$tS %1$Tp %2$s%n%4$s: %5$s%n"
   * ```
   *
   *
   * This prints 2 lines similar to the example above with a different
   * date/time formatting and does not print the throwable and its backtrace:
   *
   *      Mar 22, 2011 1:11:31 PM MyClass fatal
   *      SEVERE: several message with an exception
   *
   */
//
    private static void setGlobalLogLevel(int givenLogLevel){
      Logger global_logger = GLOBAL_LOGGER;
      int logLevel =givenLogLevel;
      switch(  logLevel ){
        case 0:
          global_logger.setLevel( Level.OFF );
          currentLogValue = 0;
          break;
        case 1:
          global_logger.setLevel( Level.SEVERE );
          currentLogValue = 1;
          break;
        case 2:
          global_logger.setLevel( Level.WARNING );
          currentLogValue = 2;
          break;
        case 3:
          global_logger.setLevel( Level.INFO );
          currentLogValue = 3;
          break;

        case 4:
          global_logger.setLevel( Level.CONFIG );
          currentLogValue = 4;
          break;
        case 5:
          global_logger.setLevel( Level.FINE );
          currentLogValue = 5;
          break;
        case 6:
          global_logger.setLevel( Level.FINER );
          currentLogValue = 6;
          break;
        case 7:
          global_logger.setLevel( Level.FINEST );
          currentLogValue = 7
          break;
        default:

      }
    }
}