Extra Options for Java

The following java options are general purpose options that are specific to the Java HotSpot Virtual Machine.


 - `-Xbatch` - Disables background compilation. By default, the JVM compiles the method as a background task, running the method in interpreter mode until the background compilation is finished. The -Xbatch flag disables background compilation so that compilation of all methods proceeds as a foreground task until completed. This option is equivalent to -XX:-BackgroundCompilation.

 - `-Xbootclasspath/a:directories|zip|JAR-files` - Specifies a list of directories, JAR files, and ZIP archives to append to the end of the default bootstrap class path.

    Oracle Solaris, Linux, and macOS: Colons (:) separate entities in this list.

    Windows: Semicolons (;) separate entities in this list.

 - `-Xcheck:jni` - Performs additional checks for Java Native Interface (JNI) functions. Specifically, it validates the parameters passed to the JNI function and the runtime environment data before processing the JNI request. It also checks for pending exceptions between JNI calls. Any invalid data encountered indicates a problem in the native code, and the JVM terminates with an irrecoverable error in such cases. Expect a performance degradation when this option is used.

 - `-Xcomp` - Forces compilation of methods on first invocation. By default, the Client VM (-client) performs 1,000 interpreted method invocations and the Server VM (-server) performs 10,000 interpreted method invocations to gather information for efficient compilation. Specifying the -Xcomp option disables interpreted method invocations to increase compilation performance at the expense of efficiency. You can also change the number of interpreted method invocations before compilation by using the -XX:CompileThreshold option.

 - `-Xdebug` - Does nothing. Provided for backward compatibility.

 - `-Xdiag` - Shows additional diagnostic messages.

 - `-Xfuture` - Enables strict class-file format checks that enforce close conformance to the class-file format specification. Developers should use this flag when developing new code. Stricter checks may become the default in future releases.

 - `-Xint` - Runs the application in interpreted-only mode. Compilation to native code is disabled, and all bytecode is executed by the interpreter. The performance benefits offered by the just-in-time (JIT) compiler aren’t present in this mode.

 - `-Xinternalversion` - Displays more detailed JVM version information than the -version option, and then exits.

 - `-Xloggc:option` - Enables the JVM unified logging framework. Logs GC status to a file with time stamps.

 - `-Xlog:option` - Configure or enable logging with the Java Virtual Machine (JVM) unified logging framework. See Enable Logging with the JVM Unified Logging Framework.

 - `-Xmixed` - Executes all bytecode by the interpreter except for hot methods, which are compiled to native code.

 - `-Xmn size` - Sets the initial and maximum size (in bytes) of the heap for the young generation (nursery). Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, or g or G to indicate gigabytes. The young generation region of the heap is used for new objects. GC is performed in this region more often than in other regions. If the size for the young generation is too small, then a lot of minor garbage collections are performed. If the size is too large, then only full garbage collections are performed, which can take a long time to complete. Oracle recommends that you keep the size for the young generation greater than 25% and less than 50% of the overall heap size. The following examples show how to set the initial and maximum size of young generation to 256 MB using various units:

    -Xmn256m
    -Xmn262144k
    -Xmn268435456

    Instead of the -Xmn option to set both the initial and maximum size of the heap for the young generation, you can use -XX:NewSize to set the initial size and -XX:MaxNewSize to set the maximum size.



 - `-Xms size` - Sets the initial size (in bytes) of the heap. This value must be a multiple of 1024 and greater than 1 MB. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, g or G to indicate gigabytes. The following examples show how to set the size of allocated memory to 6 MB by using various units:

    -Xms6291456
    -Xms6144k
    -Xms6m

    If you don’t set this option, then the initial size is set as the sum of the sizes allocated for the old generation and the young generation. The initial size of the heap for the young generation can be set by using the -Xmn option or the -XX:NewSize option.

 - `-Xmx size` - Specifies the maximum size (in bytes) of the memory allocation pool in bytes. This value must be a multiple of 1024 and greater than 2 MB. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. The default value is chosen at runtime based on system configuration. For server deployments, -Xms and -Xmx are often set to the same value. The following examples show how to set the maximum allowed size of allocated memory to 80 MB by using various units:

    -Xmx83886080
    -Xmx81920k
    -Xmx80m

    The -Xmx option is equivalent to -XX:MaxHeapSize.

 - `-Xnoclassgc` - Disables garbage collection (GC) of classes. This can save some GC time, which shortens interruptions during the application run. When you specify -Xnoclassgc at startup, the class objects in the application are left untouched during GC and are always considered live. This can result in more memory being permanently occupied which, if not used carefully, throws an out-of-memory exception.

 - `-Xrs` - Reduces the use of operating system signals by the JVM. Shutdown hooks enable the orderly shutdown of a Java application by running user cleanup code (such as closing database connections) at shutdown, even if the JVM terminates abruptly.

        Oracle Solaris, Linux, and macOS:

            The JVM catches signals to implement shutdown hooks for unexpected termination. The JVM uses SIGHUP, SIGINT, and SIGTERM to initiate the running of shutdown hooks.

            Applications embedding the JVM frequently need to trap signals such as SIGINT or SIGTERM, which can lead to interference with the JVM signal handlers. The -Xrs option is available to address this issue. When -Xrs is used, the signal masks for SIGINT, SIGTERM, SIGHUP, and SIGQUIT aren’t changed by the JVM, and signal handlers for these signals aren’t installed.

        Windows:

            The JVM watches for console control events to implement shutdown hooks for unexpected termination. Specifically, the JVM registers a console control handler that begins shutdown-hook processing and returns TRUE for CTRL_C_EVENT, CTRL_CLOSE_EVENT, CTRL_LOGOFF_EVENT, and CTRL_SHUTDOWN_EVENT.

            The JVM uses a similar mechanism to implement the feature of dumping thread stacks for debugging purposes. The JVM uses CTRL_BREAK_EVENT to perform thread dumps.

            If the JVM is run as a service (for example, as a servlet engine for a web server), then it can receive CTRL_LOGOFF_EVENT but shouldn’t initiate shutdown because the operating system doesn’t actually terminate the process. To avoid possible interference such as this, the -Xrs option can be used. When the -Xrs option is used, the JVM doesn’t install a console control handler, implying that it doesn’t watch for or process CTRL_C_EVENT, CTRL_CLOSE_EVENT, CTRL_LOGOFF_EVENT, or CTRL_SHUTDOWN_EVENT.

    There are two consequences of specifying -Xrs:

        Oracle Solaris, Linux, and macOS: SIGQUIT thread dumps aren’t available.

        Windows: Ctrl + Break thread dumps aren’t available.

    User code is responsible for causing shutdown hooks to run, for example, by calling the System.exit() when the JVM is to be terminated.

 - `-Xshare:mode` - Sets the class data sharing (CDS) mode.

    Possible mode arguments for this option include the following:

    auto

        Uses CDS if possible. This is the default value for Java HotSpot 32-Bit Client VM.
    on

        Requires the use of CDS. This option prints an error message and exits if class data sharing can’t be used.

        Note:

        -Xshare:on is used for testing purposes only and can cause intermittent failures due to the use of address space layout randomization by the operation system. This option should not be used in production environments.
    off

        Instructs not to use CDS.


 - `-XshowSettings` - Shows all settings and then continues.

 - `-XshowSettings:category` - Shows settings and continues. Possible category arguments for this option include the following:

    all

        Shows all categories of settings. This is the default value.
    locale

        Shows settings related to locale.
    properties

        Shows settings related to system properties.
    vm

        Shows the settings of the JVM.
    system

        Linux: Shows host system or container configuration and continues.


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

 - `--add-reads module=target-module(,target-module)*` - Updates module to read the target-module, regardless of the module declaration. target-module can be all unnamed to read all unnamed modules.

 - `--add-exports module/package=target-module(,target-module)*` - Updates module to export package to target-module, regardless of module declaration. The target-module can be all unnamed to export to all unnamed modules.

 - `--add-opens module/package=target-module(,target-module)*` - Updates module to open package to target-module, regardless of module declaration.

 - `--illegal-access=parameter` - When present at run time, --illegal-access= takes a keyword parameter to specify a mode of operation:

    Note:

    This option will be removed in a future release.

        permit: This mode opens each package in each module in the run-time image to code in all unnamed modules (such as code on the class path), if that package existed in JDK 8. This enables both static access (for example, by compiled bytecode), and deep reflective access through the platform's various reflection APIs. The first reflective-access operation to any such package causes a warning to be issued. However, no warnings are issued after the first occurrence. This single warning describes how to enable further warnings. This mode is the default for the current JDK but will change in a future release.

        warn: This mode is identical to permit except that a warning message is issued for each illegal reflective-access operation.

        debug: This mode is identical to warn except that both a warning message and a stack trace are issued for each illegal reflective-access operation.

        deny: This mode disables all illegal-access operations except for those enabled by other command-line options, such as--add-opens. This mode will become the default in a future release.

    The default mode, --illegal-access=permit, is intended to make you aware of code on the class path that reflectively accesses any JDK-internal APIs at least once. To learn about all such accesses, you can use the warn or the debug modes. For each library or framework on the class path that requires illegal access, you have two options:

        If the component's maintainers have already released a fixed version that no longer uses JDK-internal APIs then you can consider upgrading to that version.

        If the component still needs to be fixed, then you can contact its maintainers and ask them to replace their use of JDK-internal APIs with the proper exported APIs.

    If you must continue to use a component that requires illegal access, then you can eliminate the warning messages by using one or more --add-opens options to open only those internal packages to which access is required.

    To verify that your application is ready for a future version of the JDK, run it with --illegal-access=deny along with any necessary --add-opens options. Any remaining illegal-access errors will most likely be due to static references from compiled code to JDK-internal APIs. You can identify those by running the jdeps tool with the --jdk-internals option. For performance reasons, the current JDK does not issue warnings for illegal static-access operations.

 - `--limit-modules module[,module...]` - Specifies the limit of the universe of observable modules.

 - `--patch-module module=file(;file)*` - Overrides or augments a module with classes and resources in JAR files or directories.

 - `--disable-@files` - Can be used anywhere on the command line, including in an argument file, to prevent further @filename expansion. This option stops expanding @-argfiles after the option.

 - `--source version` - Sets the version of the source in source-file mode.

Extra Options for macOS

The following extra options are macOS-specific.


 - `-XstartOnFirstThread` - Runs the main() method on the first (AppKit) thread.

 - `-Xdock:name=application_name` - Overrides the default application name displayed in dock.

 - `-Xdock:icon=path_to_icon_file` - Overrides the default icon displayed in dock.

Advanced Runtime Options for Java

These java options control the runtime behavior of the Java HotSpot VM.


 - `-XX:ActiveProcessorCount=x` - Overrides the number of CPUs that the VM will use to calculate the size of thread pools it will use for various operations such as Garbage Collection and ForkJoinPool.

    The VM normally determines the number of available processors from the operating system. This flag can be useful for partitioning CPU resources when running multiple Java processes in docker containers. This flag is honored even if UseContainerSupport is not enabled. See -XX:-UseContainerSupport for a description of enabling and disabling container support.

 - `-XteHeX:AllocaapAt=path` - Takes a path to the file system and uses memory mapping to allocate the object heap on the memory device. Using this option enables the HotSpot VM to allocate the Java object heap on an alternative memory device, such as an NV-DIMM, specified by the user.

    Alternative memory devices that have the same semantics as DRAM, including the semantics of atomic operations, can be used instead of DRAM for the object heap without changing the existing application code. All other memory structures (such as the code heap, metaspace, and thread stacks) continue to reside in DRAM.

    Some operating systems expose non-DRAM memory through the file system. Memory-mapped files in these file systems bypass the page cache and provide a direct mapping of virtual memory to the physical memory on the device. The existing heap related flags (such as -Xmx and -Xms) and garbage-collection related flags continue to work as before.

 - `-XX:-CompactStrings` - Disables the Compact Strings feature. By default, this option is enabled. When this option is enabled, Java Strings containing only single-byte characters are internally represented and stored as single-byte-per-character Strings using ISO-8859-1 / Latin-1 encoding. This reduces, by 50%, the amount of space required for Strings containing only single-byte characters. For Java Strings containing at least one multibyte character: these are represented and stored as 2 bytes per character using UTF-16 encoding. Disabling the Compact Strings feature forces the use of UTF-16 encoding as the internal representation for all Java Strings.

    Cases where it may be beneficial to disable Compact Strings include the following:

        When it’s known that an application overwhelmingly will be allocating multibyte character Strings

        In the unexpected event where a performance regression is observed in migrating from Java SE 8 to Java SE 9 or later and an analysis shows that Compact Strings introduces the regression

    In both of these scenarios, disabling Compact Strings makes sense.

 - `-XX:CompilerDirectivesFile=file` - Adds directives from a file to the directives stack when a program starts. See Compiler Directives and the Command Line.

 - `-XX:CompilerDirectivesPrint` - Prints the directives stack when the program starts or when a new directive is added..

 - `-XX:ConcGCThreads=n` - Sets the number of parallel marking threads. Sets n to approximately 1/4 of the number of parallel garbage collection threads (ParallelGCThreads).

 - `-XX:+DisableAttachMechanism` - Disables the mechanism that lets tools attach to the JVM. By default, this option is disabled, meaning that the attach mechanism is enabled and you can use diagnostics and troubleshooting tools such as jcmd, jstack, jmap, and jinfo.

    Note:

    The tools such as jcmd, jinfo, jmap, and jstack shipped with the JDK aren’t supported when using the tools from one JDK version to troubleshoot a different JDK version.

 - `-XX:ErrorFile=filename` - Specifies the path and file name to which error data is written when an irrecoverable error occurs. By default, this file is created in the current working directory and named hs_err_pidpid.log where pid is the identifier of the process that caused the error.

    The following example shows how to set the default log file (note that the identifier of the process is specified as %p):


 - `-XX:ErrorFile=./hs_err_pid%p.log` - Oracle Solaris, Linux, and macOS: The following example shows how to set the error log to /var/log/java/java_error.log:

-XX:ErrorFile=/var/log/java/java_error.log

Windows: The following example shows how to set the error log file to C:/log/java/java_error.log:

        -XX:ErrorFile=C:/log/java/java_error.log

    If the file can’t be created in the specified directory (due to insufficient space, a permission problem, or another issue), then the file is created in the temporary directory for the operating system:

        Oracle Solaris, Linux, and macOS: The temporary directory is /tmp.

        Windows: The temporary directory is specified by the value of the TMP environment variable. If that environment variable isn’t defined, then the value of the TEMP environment variable is used.

-XX:+ExtensiveErrorReports
    Enables the reporting of more extensive error information in the ErrorFile. This option can be turned on in environments where maximal information is desired - even if the resulting logs may be quite large and/or contain information that might be considered sensitive. The information can vary from release to release, and across different platforms. By default this option is disabled. 

 - `-XX:+FailOverToOldVerifier` - Enables automatic failover to the old verifier when the new type checker fails. By default, this option is disabled and it’s ignored (that is, treated as disabled) for classes with a recent bytecode version. You can enable it for classes with older versions of the bytecode.

 - `-XX:+FlightRecorder` - Enables the use of Java Flight Recorder (JFR) during the runtime of the application.

    Note:The -XX:+FlightRecorder option is no longer required to use JFR. This was a change made in JDK 8u40.

 - `-XX:FlightRecorderOptions=parameter=value` - Sets the parameters that control the behavior of JFR.

    The following list contains the available JFR parameter=value entries:

    allow_threadbuffers_to_disk={true|false}

        Specifies whether thread buffers are written directly to disk if the buffer thread is blocked. By default, this parameter is disabled.
    globalbuffersize=size

        Specifies the total amount of primary memory used for data retention. The default value is based on the value specified for memorysize. Change the memorysize parameter to alter the size of global buffers.
    maxchunksize=size

        Specifies the maximum size (in bytes) of the data chunks in a recording. Append m or M to specify the size in megabytes (MB), and g or G to specify the size in gigabytes (GB). By default, the maximum size of data chunks is set to 12 MB. The minimum allowed is 1 MB.
    memorysize=size

        Determines how much buffer memory should be used, and sets the globalbuffersize and numglobalbuffers parameters based on the size specified. Append m or M to specify the size in megabytes (MB), and g or G to specify the size in gigabytes (GB). By default, the memory size is set to 10 MB.
    numglobalbuffers

        Specifies the number of global buffers used. The default value is based on the memory size specified. Change the memorysize parameter to alter the number of global buffers.
    old-object-queue-size=number-of-objects

        Maximum number of old objects to track. By default, the number of objects is set to 256.
    repository=path

        Specifies the repository (a directory) for temporary disk storage. By default, the system's temporary directory is used.
    retransform={true|false}

        Specifies whether event classes should be retransformed using JVMTI. If false, instrumentation is added when event classes are loaded. By default, this parameter is enabled.
    samplethreads={true|false}

        Specifies whether thread sampling is enabled. Thread sampling occurs only if the sampling event is enabled along with this parameter. By default, this parameter is enabled.
    stackdepth=depth

        Stack depth for stack traces. By default, the depth is set to 64 method calls. The maximum is 2048. Values greater than 64 could create significant overhead and reduce performance.
    threadbuffersize=size

        Specifies the per-thread local buffer size (in bytes). By default, the local buffer size is set to 8 kilobytes. Overriding this parameter could reduce performance and is not recommended.

    You can specify values for multiple parameters by separating them with a comma.

 - `-XX:InitiatingHeapOccupancyPercent=n` - Sets the Java heap occupancy threshold that triggers a marking cycle. The default occupancy is 45 percent of the entire Java heap.

 - `-XX:LargePageSizeInBytes=size` - Oracle Solaris: Sets the maximum size (in bytes) for large pages used for the Java heap. The size argument must be a power of 2 (2, 4, 8, 16, and so on). Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. By default, the size is set to 0, meaning that the JVM chooses the size for large pages automatically. See Large Pages.

    The following example describes how to set the large page size to 4 megabytes (MB):

    -XX:LargePageSizeInBytes=4m


 - `-XX:MaxDirectMemorySize=size` - Sets the maximum total size (in bytes) of the java.nio package, direct-buffer allocations. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. By default, the size is set to 0, meaning that the JVM chooses the size for NIO direct-buffer allocations automatically.

    The following examples illustrate how to set the NIO size to 1024 KB in different units:

    -XX:MaxDirectMemorySize=1m
    -XX:MaxDirectMemorySize=1024k
    -XX:MaxDirectMemorySize=1048576


 - `-XX:-MaxFDLimit` - Disables the attempt to set the soft limit for the number of open file descriptors to the hard limit. By default, this option is enabled on all platforms, but is ignored on Windows. The only time that you may need to disable this is on Mac OS, where its use imposes a maximum of 10240, which is lower than the actual system maximum.

 - `-XX:MaxGCPauseMillis=ms` - Sets a target value for the desired maximum pause time. The default value is 200 milliseconds. The specified value doesn’t adapt to your heap size.

 - `-XX:NativeMemoryTracking=mode` - Specifies the mode for tracking JVM native memory usage. Possible mode arguments for this option include the following:

    off

        Instructs not to track JVM native memory usage. This is the default behavior if you don’t specify the -XX:NativeMemoryTracking option.
    summary

        Tracks memory usage only by JVM subsystems, such as Java heap, class, code, and thread.
    detail

        In addition to tracking memory usage by JVM subsystems, track memory usage by individual CallSite, individual virtual memory region and its committed regions.


 - `-XX:ObjectAlignmentInBytes=alignment` - Sets the memory alignment of Java objects (in bytes). By default, the value is set to 8 bytes. The specified value should be a power of 2, and must be within the range of 8 and 256 (inclusive). This option makes it possible to use compressed pointers with large Java heap sizes.

    The heap size limit in bytes is calculated as:

    4GB * ObjectAlignmentInBytes

    Note:

    As the alignment value increases, the unused space between objects also increases. As a result, you may not realize any benefits from using compressed pointers with large Java heap sizes.

 - `-XX:OnError=string` - Sets a custom command or a series of semicolon-separated commands to run when an irrecoverable error occurs. If the string contains spaces, then it must be enclosed in quotation marks.

        Oracle Solaris, Linux, and macOS: The following example shows how the -XX:OnError option can be used to run the gcore command to create the core image, and the debugger is started to attach to the process in case of an irrecoverable error (the %p designates the current process):

-XX:OnError="gcore %p;dbx - %p"

Windows: The following example shows how the -XX:OnError option can be used to run the userdump.exe utility to obtain a crash dump in case of an irrecoverable error (the %p designates the current process). This example assumes that the path to the userdump.exe utility is specified in the PATH environment variable:

        -XX:OnError="userdump.exe %p"


 - `-XX:OnOutOfMemoryError=string` - Sets a custom command or a series of semicolon-separated commands to run when an OutOfMemoryError exception is first thrown. If the string contains spaces, then it must be enclosed in quotation marks. For an example of a command string, see the description of the -XX:OnError option.

 - `-XX:ParallelGCThreads=n` - Sets the value of the STW worker threads. Sets the value of n to the number of logical processors. The value of n is the same as the number of logical processors up to a value of 8. If there are more than 8 logical processors, then this option sets the value of n to approximately 5/8 of the logical processors. This works in most cases except for larger SPARC systems where the value of n can be approximately 5/16 of the logical processors.

 - `-XX:+PerfDataSaveToFile` - If enabled, saves jstat binary data when the Java application exits. This binary data is saved in a file named hsperfdata_pid, where pid is the process identifier of the Java application that you ran. Use thejstat command to display the performance data contained in this file as follows:

jstat -class file:///path/hsperfdata_pid

    jstat -gc file:///path/hsperfdata_pid


 - `-XX:+PrintCommandLineFlags` - Enables printing of ergonomically selected JVM flags that appeared on the command line. It can be useful to know the ergonomic values set by the JVM, such as the heap space size and the selected garbage collector. By default, this option is disabled and flags aren’t printed.

 - `-XX:+PreserveFramePointer ` - Selects between using the RBP register as a general purpose register (-XX:-PreserveFramePointer) and using the RBP register to hold the frame pointer of the currently executing method (-XX:+PreserveFramePointer). If the frame pointer is available, then external profiling tools (for example, Linux perf) can construct more accurate stack traces.

 - `-XX:+PrintNMTStatistics` - Enables printing of collected native memory tracking data at JVM exit when native memory tracking is enabled (see -XX:NativeMemoryTracking). By default, this option is disabled and native memory tracking data isn’t printed.

 - `-XX:+RelaxAccessControlCheck` - Decreases the amount of access control checks in the verifier. By default, this option is disabled, and it’s ignored (that is, treated as disabled) for classes with a recent bytecode version. You can enable it for classes with older versions of the bytecode.

 - `-XX:SharedArchiveFile=path` - Specifies the path and name of the class data sharing (CDS) archive file

    See Application Class Data Sharing.

 - `-XX:SharedArchiveConfigFile=shared_config_file` - Specifies additional shared data added to the archive file.

 - `-XX:SharedClassListFile=file_name` - Specifies the text file that contains the names of the classes to store in the class data sharing (CDS) archive. This file contains the full name of one class per line, except slashes (/) replace dots (.). For example, to specify the classes java.lang.Object and hello.Main, create a text file that contains the following two lines:

    java/lang/Object
    hello/Main

    The classes that you specify in this text file should include the classes that are commonly used by the application. They may include any classes from the application, extension, or bootstrap class paths.

    See Application Class Data Sharing.

 - `-XX:+ShowMessageBoxOnError` - Enables the display of a dialog box when the JVM experiences an irrecoverable error. This prevents the JVM from exiting and keeps the process active so that you can attach a debugger to it to investigate the cause of the error. By default, this option is disabled.

 - `-XX:StartFlightRecording=parameter=value` - Starts a JFR recording for the Java application. This option is equivalent to the JFR.start diagnostic command that starts a recording during runtime. You can set the following parameter=value entries when starting a JFR recording:

    delay=time

        Specifies the delay between the Java application launch time and the start of the recording. Append s to specify the time in seconds, m for minutes, h for hours, and d for days. For example, specifying 10m means 10 minutes. By default, there’s no delay, and this parameter is set to 0.
    disk={true|false}

        Specifies whether to write data to disk while recording. By default, this parameter is enabled.
    dumponexit={true|false}

        Specifies if the running recording is dumped when the JVM shuts down. If enabled and a filename is not entered, the recording is written to a file in the directory where the process was started. The file name is a system-generated name that contains the process ID, recording ID, and current timestamp, similar to hotspot-pid-47496-id-1-2018_01_25_19_10_41.jfr. By default, this parameter is disabled.
    duration=time

        Specifies the duration of the recording. Append s to specify the time in seconds, m for minutes, h for hours, and d for days. For example, specifying 5h means 5 hours. By default, the duration isn’t limited, and this parameter is set to 0.
    filename=path

        Specifies the path and name of the file to which the recording is written when the recording is stopped, for example:

            recording.jfr
            /home/user/recordings/recording.jfr
            c:\recordings\recording.jfr

    name=identifier

        Takes both the name and the identifier of a recording.
    maxage=time

        Specifies the maximum age of disk data to keep for the recording. This parameter is valid only when the disk parameter is set to true. Append s to specify the time in seconds, m for minutes, h for hours, and d for days. For example, specifying 30s means 30 seconds. By default, the maximum age isn’t limited, and this parameter is set to 0s.
    maxsize=size

        Specifies the maximum size (in bytes) of disk data to keep for the recording. This parameter is valid only when the disk parameter is set to true. The value must not be less than the value for the maxchunksize parameter set with -XX:FlightRecorderOptions. Append m or M to specify the size in megabytes, and g or G to specify the size in gigabytes. By default, the maximum size of disk data isn’t limited, and this parameter is set to 0.
    path-to-gc-roots={true|false}

        Specifies whether to collect the path to garbage collection (GC) roots at the end of a recording. By default, this parameter is disabled.

        The path to GC roots is useful for finding memory leaks, but collecting it is time-consuming. Enable this option only when you start a recording for an application that you suspect has a memory leak. If the settings parameter is set to profile, the stack trace from where the potential leaking object was allocated is included in the information collected.
    settings=path

        Specifies the path and name of the event settings file (of type JFC). By default, the default.jfc file is used, which is located in JRE_HOME/lib/jfr. This default settings file collects a predefined set of information with low overhead, so it has minimal impact on performance and can be used with recordings that run continuously.

        A second settings file is also provided, profile.jfc, which provides more data than the default configuration, but can have more overhead and impact performance. Use this configuration for short periods of time when more information is needed.

    You can specify values for multiple parameters by separating them with a comma.

 - `-XX:ThreadStackSize=size` - Sets the Java thread stack size (in kilobytes). Use of a scaling suffix, such as k, results in the scaling of the kilobytes value so that -XX:ThreadStackSize=1k sets the Java thread stack size to 1024*1024 bytes or 1 megabyte. The default value depends on the platform:

        Linux: 1024 KB

        macOS: 1024 KB

        Oracle Solaris: 1024 KB

        Windows: The default value depends on the virtual memory.

    The following examples show how to set the thread stack size to 1 megabyte in different units:

    -XX:ThreadStackSize=1k
    -XX:ThreadStackSize=1024

    This option is similar to -Xss.

 - `-XX:-UseBiasedLocking` - Disables the use of biased locking. Some applications with significant amounts of uncontended synchronization may attain significant speedups with this flag enabled, but applications with certain patterns of locking may see slowdowns.

    By default, this option is enabled.

 - `-XX:-UseCompressedOops` - Disables the use of compressed pointers. By default, this option is enabled, and compressed pointers are used when Java heap sizes are less than 32 GB. When this option is enabled, object references are represented as 32-bit offsets instead of 64-bit pointers, which typically increases performance when running the application with Java heap sizes of less than 32 GB. This option works only for 64-bit JVMs.

    It’s also possible to use compressed pointers when Java heap sizes are greater than 32 GB. See the -XX:ObjectAlignmentInBytes option.

 - `-XX:-UseContainerSupport` - The VM now provides automatic container detection support, which allows the VM to determine the amount of memory and number of processors that are available to a Java process running in docker containers. It uses this information to allocate system resources. This support is only available on Linux x64 platforms. If supported, the default for this flag is true, and container support is enabled by default. It can be disabled with -XX:-UseContainerSupport.

    Unified Logging is available to help diagnose issues related to this support.

    Use -Xlog:os+container=trace for maximum logging of container information. See Enable Logging with the JVM Unified Logging Framework for a description of using Unified Logging.
XX:+UseGCLogRotation

    Handles large log files. This option must be used with -Xloggc:filename.

 - `-XX:NumberOfGClogFiles=number_of_files` - Handles large log files. The number_of_files must be greater than or equal to 1. The default is 1.

 - `-XX:GCLogFileSize=number` - Handles large log files. The number can be in the form of numberM or numberK. The default is set to 512K.

 - `-XX:+UseHugeTLBFS` - Linux only: This option is the equivalent of specifying -XX:+UseLargePages. This option is disabled by default. This option pre-allocates all large pages up-front, when memory is reserved; consequently the JVM can’t dynamically grow or shrink large pages memory areas. See -XX:UseTransparentHugePages if you want this behavior.

    See Large Pages.

 - `-XX:+UseLargePages` - Enables the use of large page memory. By default, this option is disabled and large page memory isn’t used.

    See Large Pages.

 - `-XX:+UseMembar` - Enables issuing of membars on thread-state transitions. This option is disabled by default on all platforms except ARM servers, where it’s enabled. (It’s recommended that you don’t disable this option on ARM servers.)

 - `-XX:+UsePerfData` - Enables the perfdata feature. This option is enabled by default to allow JVM monitoring and performance testing. Disabling it suppresses the creation of the hsperfdata_userid directories. To disable the perfdata feature, specify -XX:-UsePerfData.

 - `-XX:+UseTransparentHugePages` - Linux only: Enables the use of large pages that can dynamically grow or shrink. This option is disabled by default. You may encounter performance problems with transparent huge pages as the OS moves other pages around to create huge pages; this option is made available for experimentation.

 - `-XX:+AllowUserSignalHandlers` - Enables installation of signal handlers by the application. By default, this option is disabled and the application isn’t allowed to install signal handlers.

 - `-XX:VMOptionsFile=filename` - Allows user to specify VM options in a file, for example, java -XX:VMOptionsFile=/var/my_vm_options HelloWorld.

Advanced JIT Compiler Options for java

These java options control the dynamic just-in-time (JIT) compilation performed by the Java HotSpot VM.


 - `-XX:AllocateInstancePrefetchLines=lines` - Sets the number of lines to prefetch ahead of the instance allocation pointer. By default, the number of lines to prefetch is set to 1:

    -XX:AllocateInstancePrefetchLines=1

    Only the Java HotSpot Server VM supports this option.

 - `-XX:AllocatePrefetchDistance=size` - Sets the size (in bytes) of the prefetch distance for object allocation. Memory about to be written with the value of new objects is prefetched up to this distance starting from the address of the last allocated object. Each Java thread has its own allocation point.

    Negative values denote that prefetch distance is chosen based on the platform. Positive values are bytes to prefetch. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. The default value is set to -1.

    The following example shows how to set the prefetch distance to 1024 bytes:

    -XX:AllocatePrefetchDistance=1024

    Only the Java HotSpot Server VM supports this option.

 - `-XX:AllocatePrefetchInstr=instruction` - Sets the prefetch instruction to prefetch ahead of the allocation pointer. Only the Java HotSpot Server VM supports this option. Possible values are from 0 to 3. The actual instructions behind the values depend on the platform. By default, the prefetch instruction is set to 0:

    -XX:AllocatePrefetchInstr=0

    Only the Java HotSpot Server VM supports this option.

 - `-XX:AllocatePrefetchLines=lines` - Sets the number of cache lines to load after the last object allocation by using the prefetch instructions generated in compiled code. The default value is 1 if the last allocated object was an instance, and 3 if it was an array.

    The following example shows how to set the number of loaded cache lines to 5:

    -XX:AllocatePrefetchLines=5

    Only the Java HotSpot Server VM supports this option.

 - `-XX:AllocatePrefetchStepSize=size` - Sets the step size (in bytes) for sequential prefetch instructions. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. By default, the step size is set to 16 bytes:

    -XX:AllocatePrefetchStepSize=16

    Only the Java HotSpot Server VM supports this option.

 - `-XX:AllocatePrefetchStyle=style` - Sets the generated code style for prefetch instructions. The style argument is an integer from 0 to 3:

    0

        Don’t generate prefetch instructions.
    1

        Execute prefetch instructions after each allocation. This is the default parameter.
    2

        Use the thread-local allocation block (TLAB) watermark pointer to determine when prefetch instructions are executed.
    3

        Use BIS instruction on SPARC for allocation prefetch.

    Only the Java HotSpot Server VM supports this option.

 - `-XX:+BackgroundCompilation` - Enables background compilation. This option is enabled by default. To disable background compilation, specify -XX:-BackgroundCompilation (this is equivalent to specifying -Xbatch).

 - `-XX:CICompilerCount=threads` - Sets the number of compiler threads to use for compilation. By default, the number of threads is set to 2 for the server JVM, to 1 for the client JVM, and it scales to the number of cores if tiered compilation is used. The following example shows how to set the number of threads to 2:

    -XX:CICompilerCount=2


 - `-XX:CompileCommand=command,method[,option]` - Specifies a command to perform on a method. For example, to exclude the indexOf() method of the String class from being compiled, use the following:

-XX:CompileCommand=exclude,java/lang/String.indexOf

Note that the full class name is specified, including all packages and subpackages separated by a slash (/). For easier cut-and-paste operations, it’s also possible to use the method name format produced by the -XX:+PrintCompilation and -XX:+LogCompilation options:

-XX:CompileCommand=exclude,java.lang.String::indexOf

If the method is specified without the signature, then the command is applied to all methods with the specified name. However, you can also specify the signature of the method in the class file format. In this case, you should enclose the arguments in quotation marks, otherwise the shell treats the semicolon as a command end. For example, if you want to exclude only the indexOf(String) method of the String class from being compiled, use the following:

-XX:CompileCommand="exclude,java/lang/String.indexOf,(Ljava/lang/String;)I"

You can also use the asterisk (*) as a wildcard for class and method names. For example, to exclude all indexOf() methods in all classes from being compiled, use the following:

-XX:CompileCommand=exclude,*.indexOf

The commas and periods are aliases for spaces, making it easier to pass compiler commands through a shell. You can pass arguments to -XX:CompileCommand using spaces as separators by enclosing the argument in quotation marks:

-XX:CompileCommand="exclude java/lang/String indexOf"

Note that after parsing the commands passed on the command line using the -XX:CompileCommand options, the JIT compiler then reads commands from the .hotspot_compiler file. You can add commands to this file or specify a different file by using the -XX:CompileCommandFile option.

To add several commands, either specify the -XX:CompileCommand option multiple times, or separate each argument with the new line separator (\n). The following commands are available:

break

    Sets a breakpoint when debugging the JVM to stop at the beginning of compilation of the specified method.
compileonly

    Excludes all methods from compilation except for the specified method. As an alternative, you can use the -XX:CompileOnly option, which lets you specify several methods.
dontinline

    Prevents inlining of the specified method.
exclude

    Excludes the specified method from compilation.
help

    Prints a help message for the -XX:CompileCommand option.
inline

    Attempts to inline the specified method.
log

    Excludes compilation logging (with the -XX:+LogCompilation option) for all methods except for the specified method. By default, logging is performed for all compiled methods.
option

    Passes a JIT compilation option to the specified method in place of the last argument (option). The compilation option is set at the end, after the method name. For example, to enable the BlockLayoutByFrequency option for the append() method of the StringBuffer class, use the following:

    -XX:CompileCommand=option,java/lang/StringBuffer.append,BlockLayoutByFrequency

    You can specify multiple compilation options, separated by commas or spaces.
print

    Prints generated assembler code after compilation of the specified method.
quiet

    Instructs not to print the compile commands. By default, the commands that you specify with the -XX:CompileCommand option are printed. For example, if you exclude from compilation the indexOf() method of the String class, then the following is printed to standard output:

        CompilerOracle: exclude java/lang/String.indexOf

        You can suppress this by specifying the -XX:CompileCommand=quiet option before other -XX:CompileCommand options.


 - `-XX:CompileCommandFile=filename` - Sets the file from which JIT compiler commands are read. By default, the .hotspot_compiler file is used to store commands performed by the JIT compiler.

    Each line in the command file represents a command, a class name, and a method name for which the command is used. For example, this line prints assembly code for the toString() method of the String class:

    print java/lang/String toString

    If you’re using commands for the JIT compiler to perform on methods, then see the -XX:CompileCommand option.

 - `-XX:CompileOnly=methods` - Sets the list of methods (separated by commas) to which compilation should be restricted. Only the specified methods are compiled. Specify each method with the full class name (including the packages and subpackages). For example, to compile only the length() method of the String class and the size() method of the List class, use the following:

-XX:CompileOnly=java/lang/String.length,java/util/List.size

Note that the full class name is specified, including all packages and subpackages separated by a slash (/). For easier cut and paste operations, it’s also possible to use the method name format produced by the -XX:+PrintCompilation and -XX:+LogCompilation options:

-XX:CompileOnly=java.lang.String::length,java.util.List::size

Although wildcards aren’t supported, you can specify only the class or package name to compile all methods in that class or package, as well as specify just the method to compile the methods with this name in any class:

    -XX:CompileOnly=java/lang/String
    -XX:CompileOnly=java/lang
    -XX:CompileOnly=.length


 - `-XX:CompileThreshold=invocations` - Sets the number of interpreted method invocations before compilation. By default, in the server JVM, the JIT compiler performs 10,000 interpreted method invocations to gather information for efficient compilation. For the client JVM, the default setting is 1,500 invocations. This option is ignored when tiered compilation is enabled. See the option -XX:-TieredCompilation. The following example shows how to set the number of interpreted method invocations to 5,000:

    -XX:CompileThreshold=5000

    You can completely disable interpretation of Java methods before compilation by specifying the -Xcomp option.

 - `-XX:CompileThresholdScaling=scale` - Provides unified control of first compilation. This option controls when methods are first compiled for both the tiered and the nontiered modes of operation. The CompileThresholdScaling option has an integer value between 0 and +Inf and scales the thresholds corresponding to the current mode of operation (both tiered and nontiered). Setting CompileThresholdScaling to a value less than 1.0 results in earlier compilation while values greater than 1.0 delay compilation. Setting CompileThresholdScaling to 0 is equivalent to disabling compilation.

 - `-XX:+DoEscapeAnalysis` - Enables the use of escape analysis. This option is enabled by default. To disable the use of escape analysis, specify -XX:-DoEscapeAnalysis. Only the Java HotSpot Server VM supports this option.

 - `-XX:InitialCodeCacheSize=size` - Sets the initial code cache size (in bytes). Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. The default value is set to 500 KB. The initial code cache size shouldn’t be less than the system's minimal memory page size. The following example shows how to set the initial code cache size to 32 KB:

    -XX:InitialCodeCacheSize=32k


 - `-XX:+Inline` - Enables method inlining. This option is enabled by default to increase performance. To disable method inlining, specify -XX:-Inline.

 - `-XX:InlineSmallCode=size` - Sets the maximum code size (in bytes) for compiled methods that should be inlined. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. Only compiled methods with the size smaller than the specified size is inlined. By default, the maximum code size is set to 1000 bytes:

    -XX:InlineSmallCode=1000


 - `-XX:+LogCompilation` - Enables logging of compilation activity to a file named hotspot.log in the current working directory. You can specify a different log file path and name using the -XX:LogFile option.

    By default, this option is disabled and compilation activity isn’t logged. The -XX:+LogCompilation option has to be used together with the -XX:UnlockDiagnosticVMOptions option that unlocks diagnostic JVM options.

    You can enable verbose diagnostic output with a message printed to the console every time a method is compiled by using the -XX:+PrintCompilation option.

 - `-XX:MaxInlineSize=size` - Sets the maximum bytecode size (in bytes) of a method to be inlined. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. By default, the maximum bytecode size is set to 35 bytes:

    -XX:MaxInlineSize=35


 - `-XX:MaxNodeLimit=nodes` - Sets the maximum number of nodes to be used during single method compilation. By default, the maximum number of nodes is set to 65,000:

    -XX:MaxNodeLimit=65000


 - `-XX:NonNMethodCodeHeapSize=size` - Sets the size in bytes of the code segment containing nonmethod code.

    A nonmethod code segment containing nonmethod code, such as compiler buffers and the bytecode interpreter. This code type stays in the code cache forever. This flag is used only if —XX:SegmentedCodeCache is enabled.
—XX:NonProfiledCodeHeapSize=size

    Sets the size in bytes of the code segment containing nonprofiled methods. This flag is used only if —XX:SegmentedCodeCache is enabled.

 - `-XX:MaxTrivialSize=size` - Sets the maximum bytecode size (in bytes) of a trivial method to be inlined. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. By default, the maximum bytecode size of a trivial method is set to 6 bytes:

    -XX:MaxTrivialSize=6


 - `-XX:+OptimizeStringConcat` - Enables the optimization of String concatenation operations. This option is enabled by default. To disable the optimization of String concatenation operations, specify -XX:-OptimizeStringConcat. Only the Java HotSpot Server VM supports this option.

 - `-XX:+PrintAssembly` - Enables printing of assembly code for bytecoded and native methods by using the external hsdis-<arch>.so or .dll library. For 64-bit VM on Windows, it’s hsdis-amd64.dll. This lets you to see the generated code, which may help you diagnose performance issues.

    By default, this option is disabled and assembly code isn’t printed. The -XX:+PrintAssembly option has to be used together with the -XX:UnlockDiagnosticVMOptions option that unlocks diagnostic JVM options.

 - `-XX:ProfiledCodeHeapSize=size` - Sets the size in bytes of the code segment containing profiled methods. This flag is used only if -XX:SegmentedCodeCache is enabled.

 - `-XX:+PrintCompilation` - Enables verbose diagnostic output from the JVM by printing a message to the console every time a method is compiled. This lets you see which methods actually get compiled. By default, this option is disabled and diagnostic output isn’t printed.

    You can also log compilation activity to a file by using the -XX:+LogCompilation option.

 - `-XX:+PrintInlining` - Enables printing of inlining decisions. This let’s you see which methods are getting inlined.

    By default, this option is disabled and inlining information isn’t printed. The -XX:+PrintInlining option has to be used together with the -XX:+UnlockDiagnosticVMOptions option that unlocks diagnostic JVM options.

 - `-XX:ReservedCodeCacheSize=size` - Sets the maximum code cache size (in bytes) for JIT-compiled code. Append the letter k or K to indicate kilobytes, m or M to indicate megabytes, and g or G to indicate gigabytes. The default maximum code cache size is 240 MB, unless you disable tiered compilation with the option -XX:-TieredCompilation, then the default size is 48 MB. This option has a limit of 2 GB; otherwise, an error is generated. The maximum code cache size shouldn’t be less than the initial code cache size. See the option -XX:InitialCodeCacheSize.

 - `-XX:RTMAbortRatio=abort_ratio` - Specifies the RTM abort ratio as a percentage (%) of all executed RTM transactions. If a number of aborted transactions becomes greater than this ratio, then the compiled code is deoptimized. This ratio is used when the -XX:+UseRTMDeopt option is enabled. The default value of this option is 50. This means that the compiled code is deoptimized if 50% of all transactions are aborted.

 - `-XX:+SegmentedCodeCache` - Enables segmentation of the code cache. Without the -XX:+SegmentedCodeCache, the code cache consists of one large segment. With -XX:+SegmentedCodeCache, we have separate segments for nonmethod, profiled method, and nonprofiled method code. These segments aren’t resized at runtime. The feature is enabled by default if tiered compilation is enabled (-XX:+TieredCompilation) and -XX:ReservedCodeCacheSize >= 240 MB. The advantages are better control of the memory footprint, reduced code fragmentation, and better iTLB/iCache behavior due to improved locality. iTLB/iCache is a CPU-specific term meaning Instruction Translation Lookaside Buffer (ITLB). ICache is an instruction cache in the CPU. The implementation of the code cache can be found in the file: /share/vm/code/codeCache.cpp.

 - `-XX:StartAggressiveSweepingAt=percent` - Forces stack scanning of active methods to aggressively remove unused code when only the given percentage of the code cache is free. The default value is 10%.

 - `-XX:RTMRetryCount=number_of_retries` - Specifies the number of times that the RTM locking code is retried, when it is aborted or busy, before falling back to the normal locking mechanism. The default value for this option is 5. The -XX:UseRTMLocking option must be enabled.

 - `-XX:-TieredCompilation` - Disables the use of tiered compilation. By default, this option is enabled. Only the Java HotSpot Server VM supports this option.

 - `-XX:+UseAES` - Enables hardware-based AES intrinsics for Intel, AMD, and SPARC hardware. Intel Westmere (2010 and newer), AMD Bulldozer (2011 and newer), and SPARC (T4 and newer) are the supported hardware. The -XX:+UseAES is used in conjunction with UseAESIntrinsics. Flags that control intrinsics now require the option -XX:+UnlockDiagnosticVMOptions.

 - `-XX:+UseAESIntrinsics` - Enables -XX:+UseAES and -XX:+UseAESIntrinsics flags by default and are supported only for the Java HotSpot Server VM. To disable hardware-based AES intrinsics, specify -XX:-UseAES -XX:-UseAESIntrinsics. For example, to enable hardware AES, use the following flags:

    -XX:+UseAES -XX:+UseAESIntrinsics

    Flags that control intrinsics now require the option -XX:+UnlockDiagnosticVMOptions. To support UseAES and UseAESIntrinsics flags, use the -server option to select the Java HotSpot Server VM. These flags aren’t supported on Client VM.

 - `-XX:+UseCMoveUnconditionally` - Generates CMove (scalar and vector) instructions regardless of profitability analysis.

 - `-XX:+UseCodeCacheFlushing` - Enables flushing of the code cache before shutting down the compiler. This option is enabled by default. To disable flushing of the code cache before shutting down the compiler, specify -XX:-UseCodeCacheFlushing.

 - `-XX:+UseCondCardMark` - Enables checking if the card is already marked before updating the card table. This option is disabled by default. It should be used only on machines with multiple sockets, where it increases the performance of Java applications that rely on concurrent operations. Only the Java HotSpot Server VM supports this option.

 - `-XX:+UseCountedLoopSafepoints` - Keeps safepoints in counted loops. Its default value is false.

 - `-XX:+UseFMA` - Enables hardware-based FMA intrinsics for hardware where FMA instructions are available (such as, Intel, SPARC, and ARM64). FMA intrinsics are generated for the java.lang.Math.fma(a, b, c) methods that calculate the value of (a * b + c) expressions.

 - `-XX:+UseRTMDeopt` - Autotunes RTM locking depending on the abort ratio. This ratio is specified by the -XX:RTMAbortRatio option. If the number of aborted transactions exceeds the abort ratio, then the method containing the lock is deoptimized and recompiled with all locks as normal locks. This option is disabled by default. The -XX:+UseRTMLocking option must be enabled.

 - `-XX:+UseRTMLocking` - Generates Restricted Transactional Memory (RTM) locking code for all inflated locks, with the normal locking mechanism as the fallback handler. This option is disabled by default. Options related to RTM are available only for the Java HotSpot Server VM on x86 CPUs that support Transactional Synchronization Extensions (TSX).

    RTM is part of Intel's TSX, which is an x86 instruction set extension and facilitates the creation of multithreaded applications. RTM introduces the new instructions XBEGIN, XABORT, XEND, and XTEST. The XBEGIN and XEND instructions enclose a set of instructions to run as a transaction. If no conflict is found when running the transaction, then the memory and register modifications are committed together at the XEND instruction. The XABORT instruction can be used to explicitly abort a transaction and the XEND instruction checks if a set of instructions is being run in a transaction.

    A lock on a transaction is inflated when another thread tries to access the same transaction, thereby blocking the thread that didn’t originally request access to the transaction. RTM requires that a fallback set of operations be specified in case a transaction aborts or fails. An RTM lock is a lock that has been delegated to the TSX's system.

    RTM improves performance for highly contended locks with low conflict in a critical region (which is code that must not be accessed by more than one thread concurrently). RTM also improves the performance of coarse-grain locking, which typically doesn’t perform well in multithreaded applications. (Coarse-grain locking is the strategy of holding locks for long periods to minimize the overhead of taking and releasing locks, while fine-grained locking is the strategy of trying to achieve maximum parallelism by locking only when necessary and unlocking as soon as possible.) Also, for lightly contended locks that are used by different threads, RTM can reduce false cache line sharing, also known as cache line ping-pong. This occurs when multiple threads from different processors are accessing different resources, but the resources share the same cache line. As a result, the processors repeatedly invalidate the cache lines of other processors, which forces them to read from main memory instead of their cache.

 - `-XX:+UseSHA` - Enables hardware-based intrinsics for SHA crypto hash functions for SPARC hardware. The UseSHA option is used in conjunction with the UseSHA1Intrinsics, UseSHA256Intrinsics, and UseSHA512Intrinsics options.

    The UseSHA and UseSHA*Intrinsics flags are enabled by default, and are supported only for Java HotSpot Server VM 64-bit on SPARC T4 and newer.

    This feature is applicable only when using the sun.security.provider.Sun provider for SHA operations. Flags that control intrinsics now require the option -XX:+UnlockDiagnosticVMOptions.

    To disable all hardware-based SHA intrinsics, specify the -XX:-UseSHA. To disable only a particular SHA intrinsic, use the appropriate corresponding option. For example: -XX:-UseSHA256Intrinsics.

 - `-XX:+UseSHA1Intrinsics` - Enables intrinsics for SHA-1 crypto hash function. Flags that control intrinsics now require the option -XX:+UnlockDiagnosticVMOptions.

 - `-XX:+UseSHA256Intrinsics` - Enables intrinsics for SHA-224 and SHA-256 crypto hash functions. Flags that control intrinsics now require the option -XX:+UnlockDiagnosticVMOptions.

 - `-XX:+UseSHA512Intrinsics` - Enables intrinsics for SHA-384 and SHA-512 crypto hash functions. Flags that control intrinsics now require the option -XX:+UnlockDiagnosticVMOptions.

 - `-XX:+UseSuperWord` - Enables the transformation of scalar operations into superword operations. Superword is a vectorization optimization. This option is enabled by default. To disable the transformation of scalar operations into superword operations, specify -XX:-UseSuperWord. Only the Java HotSpot Server VM supports this option.
