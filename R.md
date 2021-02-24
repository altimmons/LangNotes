# R Language Notes

[[TOC]]

 note | summary, abstract, tldr | info, todo | tip, hint | success, check, done | question, help, faq | warning, attention, caution | failure, fail, missing | danger, error, bug | example, snippet | quote, cite



## Entry

!!!note   A series of entries like this:
    It would not continue the match onto the following line for some reason.
        encoding:
        The name of an encoding, default "native.enc". See connections.
        encoding:
        The name of an encoding, default "native.enc". See connections.

        (^[a-z.]+?)(:)([\n^.*])
    and replace with    -

            `$1`

    Or also, though I am not sure this wasnt something else:

          (^[\w]*?)([\n])(^.*?$)
    replace with

            $1 $3


!!!attention Matches patterns with a single word, and then the next     line- like this
    !!!quote
        **timeout**\
        timeout in seconds, ignored if 0. This is a limit for the elapsed time running command in a separate process. Fractions of seconds are ignored.

        **show.output.on.console**\
        logical (not NA), indicates whether to capture the output of the command and show it on the R console (not used by Rterm, which shows the output in the terminal unless wait is false).

        **invisible**\
        logical (not NA), indicates whether a command window should be visible on the screen.**

    !!!done    Which returns text like this:
        - _timeout_ - timeout in seconds, ignored if 0. This is a limit for the elapsed time running command in a separate process. Fractions of seconds are ignored.
        - _show.output.on.console_ - logical (not NA), indicates whether to capture the output of the command and show it on the R console (not used by Rterm, which shows the output in the terminal unless wait is false).
        - _minimized_ - logical (not NA), indicates whether a command window should be displayed initially as a minimized window.

        !!!tip Use:

                (^[\b\w., ]+?)([\n]|[\t\n])(^.+?$)
                (^[\b\w., ]+?)([\n])(^.+?$)
                ^(.*?)(\t\n)(.*?$)(\n) *

            and replace with

                        - _$1_ - $3
                        - `$1` - $3
                        - **$1** - $3

!!!attention To match... [[TEMPLATE]]
    !!!quote Input from
        [[example]]

    !!!done    Which returns text like this:
        [[result]]

        !!!tip Use:
                <code>

            replace with

                <code>
                
                
                
            ```json






```

!!!example  Replace literal *'tabular'* data into an unordered list with code indicators around the first col.  This is for items that are generally:
    !!!quote Microsoft tabular documentation
        item    definition\
        item2   definition2\
        item3   definition3

        !!!tip Use:
                (\S*?)(\t)(.*) -most specific
                ^()(\S*?)(\t)(.*)$ -add empty group to make replacements match.
                ^([\s]*?)([\S]*?)(\t| )(.*)$
                ^([\s\t ]*?)(\b[\S]+?)(\t|[ ]*)(\b.*)$
                (\S*?)(\t|[ ]*)(\b\S.*)$
                ^()(\S+?)(([ ]{3,}|)\t*([ ]{3,}|))(\b.*)$

            replace with

                $1- `$2` - $4

            !!!done    Which returns text like this:
                - `item` - definition
                - `item2` - definition2
                - `item3` - definition3


!!!example  [[Replace]]
    !!!quote [[Source]]
        example\
        example\
        example\
        example

        !!!tip Use:
                <code>
                <code>
                <code>

            replace with

                <code>

            !!!done    Which returns text like this:
                - example
                - example
                - example
                - example


### Lemon

  knit_print.data.frame <- lemon_print
  knit_print.table <- lemon_print
  knit_print.grouped_df <- lemon_print # enableds dplyr results
  knit_print.tibble <- lemon_print
  knit_print.tbl <- lemon_print


## Resources

[Advanced R](http://adv-r.had.co.nz/)
[Advanced R 2](https://adv-r.hadley.nz/index.html)

## Start

You need to make sure that R is in your shell path. You can add it with something like

        Sys.setenv(PATH=paste(R.home("bin"), Sys.getenv("PATH"), sep=";"))



### Installing from source

[Source](https://stackoverflow.com/questions/30989027/how-to-install-a-package-from-a-download-zip-file)

#### ALso:

- `install.packages('C:/Users/Desktop/rvest-master.zip', repos = NULL, type = "win.binary")`
- `install.packages('https://cran.r-project.org/bin/windows/contrib/3.3/proxy_0.4-20.zip', repos = NULL, type = "win.binary")`
- if already a tar.gz  R CMD INSTALL package.tar.gz
- install_local method in devtools package. Unzip the zipped file and specify the folder which contains DESCRIPTION file of the package in the path argument or you can also make use of subdir argument.
- In R Studio Console, in Install Packages just choose Package Archive File from dropdown menu of Install from:. Redirect to the folder where zip is downloaded,select it

Main method (extraneous lines in dir() have been removed)

```r
    > Sys.setenv(PATH=paste(R.home("bin"), Sys.getenv("PATH"), sep=";"))
    > wd <- getwd()
    > setwd(choose.dir())
    > list.files()
    [4] "magrittr-master.zip"                                           "Markdown Template.Rmd"                                         "R Programming"
    > unzip("magrittr-master.zip")
    > dir()
    [4] "magrittr-master"                                               "magrittr-master.zip"                                           "Markdown Template.Rmd"
    > file.rename("magrittr-master", "magrittr")
    [1] TRUE
    > dir()
    [4] "magrittr"                                                      "magrittr-master.zip"                                           "Markdown Template.Rmd"
    > shell("R CMD build magrittr")
    * checking for file 'magrittr/DESCRIPTION' ... OK
    * preparing 'magrittr':
    * checking DESCRIPTION meta-information ... OK
    * installing the package to build vignettes
    * creating vignettes ... OK
    * checking for LF line-endings in source and make files and shell scripts
    * checking for empty or unneeded directories
    * building 'magrittr_1.5.0.9000.tar.gz'

    > dir()
    [4] "magrittr"                                                      "magrittr-master.zip"                                           "magrittr_1.5.0.9000.tar.gz"
    > install.packages(dir()[6], repos=NULL)
    Installing package into ‘C:/Users/s163837/Documents/R/win-library/3.5’
    (as ‘lib’ is unspecified)
    * installing *source* package 'magrittr' ...
    ** R
    ** inst
    ** byte-compile and prepare package for lazy loading
    ** help
    *** installing help indices
    converting help for package 'magrittr'
        finding HTML links ... done
        aliases                                 html
        compound                                html
        debug_fseq                              html
        debug_pipe                              html
        exposition                              html
        freduce                                 html
        fseq                                    html
        functions                               html
        magrittr-package                        html
        pipe                                    html
        print.fseq                              html
        tee                                     html
    *** copying figures
    ** building package indices
    ** installing vignettes
    ** testing if installed package can be loaded
    *** arch - i386
    *** arch - x64
    * DONE (magrittr)
    In R CMD INSTALL
```


  _______   ______    __    __     ______-   __     ______   ____  ____
 /"     "| /" _  "\  /" |  | "\   /    " \  |" \   /" _  "\ ("  _||_ " |
(: ______)(: ( \___)(:  (__)  :) // ____  \ ||  | (: ( \___)|   (  ) : |
 \/    |   \/ \      \/      \/ /  /    ) :)|:  |  \/ \     (:  |  | . )
 // ___)_  //  \ _   //  __  \\(: (____/ // |.  |  //  \ _   \\ \__/ //
(:      "|(:   _) \ (:  (  )  :)\        /  /\  |\(:   _) \  /\\ __ //\
 \_______) \_______) \__|  |__/  \"_____/  (__\_|_)\_______)(__________)




.######...####...##..##...####...........######...####...##..##.
.##......##..##..##..##..##..##............##....##..##..##..##.
.####....##......######..##..##..######....##....##......##..##.
.##......##..##..##..##..##..##............##....##..##..##..##.
.######...####...##..##...####...........######...####....####..
................................................................



ECHO-ICU
ECHO-ICU
ECHO-ICU
ECHO-ICU
ECHO-ICU
ECHO-ICU
ECHO-ICU

Input only version: Unimportant files tabbed.

```r
        > Sys.setenv(PATH=paste(R.home("bin"), Sys.getenv("PATH"), sep=";"))
        > wd <- getwd()
    > setwd(choose.dir())
    > list.files()
    > unzip("magrittr-master.zip")
        > dir()
    > file.rename("magrittr-master", "magrittr")
        > dir()
    > shell("R CMD build magrittr")
        > dir()
    > install.packages(dir()[6], repos=NULL)
```


## basics

### Getting Help



help.start();

browseURL("http://127.0.0.1:19078/doc/html/index.html",)

`?` will pull up the help on an item/

[[??]] is a more general search


? for shortcuts to help topics.

`help.search()` or `??` for finding help pages on a vague topic; `help.start()` which opens the *HTML* version of the R help pages; `library()` for *listing available packages* and the help objects they contain; `data()` for *listing available data sets;* `methods([class])`.

help(topic, package = NULL, lib.loc = NULL,
     verbose = getOption("verbose"),
     try.all.packages = getOption("help.try.all.packages"),
     help_type = getOption("help_type"))

help.search()
help.search(pattern, fields = c("alias", "concept", "title"),
            apropos, keyword, whatis, ignore.case = TRUE,
            package = NULL, lib.loc = NULL,
            help.db = getOption("help.db"),
            verbose = getOption("verbose"),
            rebuild = FALSE, agrep = NULL, use_UTF8 = FALSE,
            types = getOption("help.search.types"))
??pattern
field??pattern

help.request(subject = "",
             address = "r-help@R-project.org",
             file = "R.help.request", ...) %>% create.post() creates a request for help


`vignette()`
    `browseVignettes()`
     `RShowDoc()` - doc says this is better but its super finicky.
`example()` is supposed to show an example
`demo()` lists the example bits

### Installing Packages

Install.Packages("name"  , dependencies = c("Depends", "Imports", "LinkingTo", "Suggests", "Enhances").

`find.package("tex4ht", )` - this lists the local packages.

[[packagefinder]]

and

[[packagedocs]]
##
### Internal Methods and Functions

autoload(name, package, reset = FALSE, ...)
autoloader(name, package, ...)

.AutoloadEnv
.Autoloaded

require(stats)
autoload("interpSpline", "splines")
search()
ls("Autoloads")
.Autoloaded

utils::RSiteSearch("xls", restrict = c("functions"), matchesPerPage = 100)
##???string(maxPages)


z <- findFn("spline", maxPages = 2)
# alternative
zq <- ???spline(2)
### Characters

suffix = "\u2030", = 1/1000 - like percent `%` is `0/0` this is `0/00` or "per mille"

`%||%` - This infix function makes it easy to replace NULLs with a default value. It's inspired by the way that Ruby's or operation (||) works.

        x %||% y


- `!!` - Quasiquotation of an expression
- `!!!` - Quasiquotation of an expression
- `%@%` - Infix attribute accessor and setter
- `%@%<-` - Infix attribute accessor and setter
- `%|%` - Replace missing values
- `%||%` - Default value for 'NULL'
- `.data` - Data pronoun for tidy evaluation
- `:=` - Quasiquotation of an expression

#### Magrittr Chars

Description
magrittr provides a series of aliases which can be more pleasant to use when composing chains using the %>% operator.

Details
Currently implemented aliases are

| command                | operator       |               |
| ---------------------- | -------------- | ------------- |
| extract                | `[`            |               |
| extract2               | `[[`           |               |
| inset                  | `[<-`          |               |
| inset2                 | `[[<-`         |               |
| use_series             | `$`            |               |
| add                    | `+`            |               |
| subtract               | `-`            |               |
| multiply_by            | `*`            |               |
| raise_to_power         | `^`            |               |
| multiply_by_matrix     | `%*%`          |               |
| divide_by              | `/`            |               |
| divide_by_int          | `%/%`          | remainder div |
| mod                    | `%%`           | modulus       |
| is_in                  | `%in%`         |               |
| and                    | `&`            |               |
| or                     | `\|` **        |               |
| equals                 | `==`           |               |
| is_greater_than        | `>`            |               |
| is_weakly_greater_than | `>=`           |               |
| is_less_than           | `<`            |               |
| is_weakly_less_than    | `<=`           |               |
| not (`n'est pas`)      | `!`            |               |
| set_colnames           | `colnames<-`   |               |
| set_rownames           | `rownames<-`   |               |
| set_names              | `names<-`      |               |
| set_class              | `class<-`      |               |
| set_attributes         | `attributes<-` |               |
| set_attr               | `attr<-`       |               |
| ---------------------- | -------------- | --------------|
| c                      | `%+%`          | concatenate   |
| ---------------------- | -------------- | --------------|
| Matching operator     | %in%           |               |
| Integer division   | %/%
|                        | %*%	Matrix multiplication
%o%	Outer product
%x%	Kronecker product
|  exposition pipe       | `%>%          |               |
|                        |                |               |
|  exposition pipe       | `%T>%          |               |
|                        |                |               |
| ---------------------- | -------------- | --------------|
|                       |  |    |%%	Remainder operator

`:: :::` - access variables in a namespace
`$ @` - component / slot extraction
`[ [[` - indexing
`^` - exponentiation (right to left)
`- +` - unary minus and plus
`:` - sequence operator
`%any%` - special operators (including %% and %/%)
`* /` - multiply, divide
`+ -` - (binary) add, subtract
`< > <= >= == !=` - ordering and comparison
`!` - negation
`& &&` - and
`| ||` - or
`~` - as in formulae
`-> ->>` - rightwards assignment
`<- <<-` - assignment (right to left)
`=` - assignment (right to left)
`?` - help (unary and binary)

**Base**
- `!` - Logical Operators
- `!.hexmode` - Display Numbers in Hexadecimal
- `!.octmode` - Display Numbers in Octal
- `!=` - *Relational Operators*
- `"` - Quotes
- `$` - Extract or Replace Parts of an Object
- `$.data.frame` - Extract or Replace Parts of a Data Frame
- `$.DLLInfo` - Get DLLs Loaded in Current Session
- `$.package_version` - Numeric Versions
- `$<-` - Extract or Replace Parts of an Object
- `$<-.data.frame` - Extract or Replace Parts of a Data Frame
- `%%` - Arithmetic Operators
- `%*%` - Matrix Multiplication
- `%/%` - Arithmetic Operators
- `%in%` - Value Matching
- `%o%` - Outer Product of Arrays
- `%x%` - Kronecker Products on Arrays
- `&` - Logical Operators
- `&&` - Logical Operators
- `&.hexmode` - Display Numbers in Hexadecimal
- `&.octmode` - Display Numbers in Octal
- `'` - Quotes
- `(` - Parentheses and Braces
- `*` - Arithmetic Operators
- `**` - Arithmetic Operators
- `*.difftime` - Time Intervals / Differences
- `+` - Arithmetic Operators
- `+.Date` - Operators on the Date Class
- `+.POSIXt` - Date-Time Classes
- `-` - Arithmetic Operators
- `-.Date` - Operators on the Date Class
- `-.POSIXt` - Date-Time Classes
- `->` - Assignment Operators
- `->>` - Assignment Operators
- `...` - ..., '..1', etc used in Functions
- `...elt` - ..., '..1', etc used in Functions
- `...length` - ..., '..1', etc used in Functions
- `..1` - ..., '..1', etc used in Functions
- `..2` - ..., '..1', etc used in Functions
- `..deparseOpts` - Options for Expression Deparsing
- `.amatch_bounds` - Approximate String Matching (Fuzzy Matching)
- `.amatch_costs` - Approximate String Matching (Fuzzy Matching)
- `.Autoloaded` - On-demand Loading of Packages
- `.AutoloadEnv` - On-demand Loading of Packages
- `.BaseNamespaceEnv` - Environment Access
- `.bincode` - Bin a Numeric Vector
- `.C` - Foreign Function Interface
- `.Call` - Modern Interfaces to C/C++ code
- `.Class` - Class Methods
- `.col` - Column Indexes
- `.colMeans` - Form Row and Column Sums and Means
- `.colSums` - Form Row and Column Sums and Means
- `.conflicts.OK` - Attach Set of R Objects to Search Path
- `.decode_numeric_version` - Numeric Versions
- `.Defunct` - Marking Objects as Defunct
- `.deparseOpts` - Options for Expression Deparsing
- `.Deprecated` - Marking Objects as Deprecated
- `.Device` - Lists of Open/Active Graphics Devices
- `.Devices` - Lists of Open/Active Graphics Devices
- `.doTrace` - Interactive Tracing and Debugging of Calls to a Function or Method
- `.dynLibs` - Loading DLLs from Packages
- `.encode_numeric_version` - Numeric Versions
- `.expand_R_libs_env_var` - Search Paths for Packages
- `.External` - Modern Interfaces to C/C++ code
- `.First` - Initialization at Start of an R Session
- `.First.sys` - Initialization at Start of an R Session
- `.format.zeros` - Formatting Using C-style Formats
- `.Fortran` - Foreign Function Interface
- `.Generic` - Class Methods
- `.GlobalEnv` - Environment Access
- `.Group` - S3 Group Generic Functions
- `.handleSimpleError` - Condition Handling and Recovery
- `.Internal` - Call an Internal Function
- `.isOpen` - References to Source Files and Code
- `.kappa_tri` - Compute or Estimate the Condition Number of a Matrix
- `.kronecker` - Kronecker Products on Arrays
- `.Last` - Terminate an R Session
- `.Last.lib` - Hooks for Namespace Events
- `.Last.sys` - Terminate an R Session
- `.Last.value` - Value of Last Evaluated Expression
- `.leap.seconds` - Date-Time Classes
- `.libPaths` - Search Paths for Packages
- `.Library` - Search Paths for Packages
- `.Library.site` - Search Paths for Packages
- `.Machine` - Numerical Characteristics of the Machine
- `.makeMessage` - Diagnostic Messages
- `.make_numeric_version` - Numeric Versions
- `.Method` - Class Methods
- `.noGenerics` - Loading/Attaching and Listing of Packages
- `.NotYetImplemented` - Not Yet Implemented Functions and Unused Arguments
- `.NotYetUsed` - Not Yet Implemented Functions and Unused Arguments
- `.onAttach` - Hooks for Namespace Events
- `.onDetach` - Hooks for Namespace Events
- `.onLoad` - Hooks for Namespace Events
- `.onUnload` - Hooks for Namespace Events
- `.Options` - Options Settings
- `.OptRequireMethods` - Initialization at Start of an R Session
- `.packages` - Listing of Packages
- `.packageStartupMessage` - Diagnostic Messages
- `.Platform` - Platform Specific Variables
- `.Primitive` - Look Up a Primitive Function
- `.Random.seed` - Random Number Generation
- `.Renviron` - Initialization at Start of an R Session
- `.rmpkg` - Give Search Path for R Objects
- `.row` - Row Indexes
- `.rowMeans` - Form Row and Column Sums and Means
- `.rowSums` - Form Row and Column Sums and Means
- `.Rprofile` - Initialization at Start of an R Session
- `.S3PrimitiveGenerics` - Internal Generic Functions
- `.signalSimpleWarning` - Condition Handling and Recovery
- `.standard_regexps` - Miscellaneous Internal/Programming Utilities
- `.sys.timezone` - Time Zones
- `.Traceback` - Get and Print Call Stacks
- `.traceback` - Get and Print Call Stacks
- `.tryResumeInterrupt` - Condition Handling and Recovery
- `.userHooksEnv` - Functions to Get and Set Hooks for Load, Attach, Detach and Unload
- `.valid.factor` - Factors
- `.__H__.cbind` - Combine R Objects by Rows or Columns
- `.__H__.rbind` - Combine R Objects by Rows or Columns
- `/` - Arithmetic Operators
- `/.difftime` - Time Intervals / Differences
- `0x1` - Numeric Constants
- `1i` - Numeric Constants
- `1L` - Numeric Constants
- `:` - Colon Operator
- `::` - Double Colon and Triple Colon Operators
- `:::` - *Double Colon and Triple Colon Operators*
- `<` - *Relational Operators*
- `<-` - Assignment Operators
- `<<-` - **Assignment Operators**
- `<=` - *Relational Operators*
- `=` - Assignment Operators
- `==` - *Relational Operators*
- `>` - *Relational Operators*
- `>=` - *Relational Operators*
- `@` - **Extract or Replace A Slot**
- `@<-` - **Extract or Replace A Slot**
- `[` - **Extract or Replace Parts of an Object**
- `[.AsIs` - Inhibit Interpretation/Conversion of Objects
- `[.data.frame` - Extract or Replace Parts of a Data Frame
- `[.Date` - Date Class
- `[.difftime` - Time Intervals / Differences
- `[.Dlist` - **Extract or Replace Parts of an Object**
- `[.DLLInfoList` - Get DLLs Loaded in Current Session
- `[.factor` - Extract or Replace Parts of a Factor
- `[.hexmode` - Display Numbers in Hexadecimal
- `[.listof` - **Extract or Replace Parts of an Object**
- `[.noquote` - Class for 'no quote' Printing of Character Strings
- `[.numeric_version` - Numeric Versions
- `[.octmode` - Display Numbers in Octal
- `[.POSIXct` - Date-Time Classes
- `[.POSIXlt` - Date-Time Classes
- `[.simple.list` - **Extract or Replace Parts of an Object**
- `[.table` - Cross Tabulation and Table Creation
- `[.warnings` - Print Warning Messages
- `[<-` - **Extract or Replace Parts of an Object**
- `[<-.data.frame` - Extract or Replace Parts of a Data Frame
- `[<-.Date` - Date Class
- `[<-.factor` - Extract or Replace Parts of a Factor
- `[<-.numeric_version` - Numeric Versions
- `[<-.POSIXct` - Date-Time Classes
- `[<-.POSIXlt` - Date-Time Classes
- `[[` - **Extract or Replace Parts of an Object**
- `[[.data.frame` - Extract or Replace Parts of a Data Frame
- `[[.Date` - Date Class
- `[[.factor` - Extract or Replace Parts of a Factor
- `[[.numeric_version` - Numeric Versions
- `[[.POSIXct` - Date-Time Classes
- `[[.POSIXlt` - Date-Time Classes
- `^` - Arithmetic Operators
- ``` - Quotes
- `{` - Parentheses and Braces
- `|` - Logical Operators
- `|.hexmode` - Display Numbers in Hexadecimal
- `|.octmode` - Display Numbers in Octal
- `||` - Logical Operators
- `~` - Tilde Operator

The binary operators ::, :::, $ and @ require names or string constants on the right hand side, and the first two also require them on the left.
Arithmatic
[[+]] x
[[-]] x
x [[+]] y
x [[-]] y
x [[*]] y
x [[/]] y
x [[^]] y
x [[%%]] y
x [[%/%]] y
x [[**]]  y

[[**]] is translated in the parser to ^, but this was undocumented for many years. It appears as an index entry in Becker et al (1988), pointing to the help for Deprecated but is not actually mentioned on that page. Even though it had been deprecated in S for 20 years, it was still accepted in R in 2008.

        Examples
        ##Logical AND ("&&") has higher precedence than OR ("||"):
        TRUE || TRUE && FALSE   # is the same as
        TRUE || (TRUE && FALSE) # and different from
        (TRUE || TRUE) && FALSE

        ##Special operators have higher precedence than "!" (logical NOT).  You can use this for %in% but we strongly advise to use the "!( ... )" form in this case! :
        ! 1:10 %in% c(2, 3, 5, 7) # same as !(1:10 %in% c(2, 3, 5, 7))
        #


        ## '=' has lower precedence than '<-' ... so you should not mix them   (and '<-' is considered better style anyway): Consequently, this gives a ("non-catchable") error
        x <- y = 5  #->  Error in (x <- y) = 5 : ....


Arguments The unary and binary arithmetic operators are generic functions: methods can be written for them individually or via the Ops group generic function. (See Ops for how dispatch is computed.)


S4 methods
These operators are members of the S4 Arith group generic, and so methods can be written for them individually as well as for the group generic (or the Ops group generic), with arguments c(e1, e2) (with e2 missing for a unary operators.

Special mathematical functions related to the beta and gamma functions.
abs(x)
sqrt(x)

log(x, base = exp(1)) log computes logarithms, by default natural logarithms,
logb(x, base = exp(1))
log10(x) log10 computes common (i.e., base 10) logarithms
log2(x)

log1p(x) log1p(x) computes log(1+x) accurately also for |x| << 1.

exp(x)
expm1(x) expm1(x) computes exp(x) - 1 accurately also for |x| << 1.


_trig_ -cospi(x), sinpi(x), and tanpi(x), compute cos(pi*x), sin(pi*x), and tan(pi*x).  Angles are in radians, not degrees, for the standard versions (i.e., a right angle is π/2), and in ‘half-rotations’ for cospi etc.

cospi(x), sinpi(x), and tanpi(x) are accurate for x values which are multiples of a half.

cos(x)
sin(x)
tan(x)

acos(x)
asin(x)
atan(x)
atan2(y, x) returns the angle between the x-axis and the vector from the origin to (x, y), i.e., for positive arguments atan2(y, x) == atan(y/x).

cospi(x)
sinpi(x)
tanpi(x)

Usage
beta(a, b)
lbeta(a, b)

gamma(x)
lgamma(x)
psigamma(x, deriv = 0)
digamma(x)
trigamma(x)

choose(n, k)
lchoose(n, k)
factorial(x)
lfactorial(x)
Arguments


S3 Group Generic Functions
Description
Group generic methods can be defined for four pre-specified groups of functions, Math, Ops, Summary and Complex. (There are no objects of these names in base R, but there are in the methods package.)

A method defined for an individual member of the group takes precedence over a method defined for the group as a whole.

**`Group "Math":**

- abs, sign, sqrt,
- floor, ceiling, trunc,
- round, signif
- exp, log, expm1, log1p,
- cos, sin, tan,
- cospi, sinpi, tanpi,
- acos, asin, atan
- cosh, sinh, tanh,
- acosh, asinh, atanh
- lgamma, gamma, digamma, trigamma
- cumsum, cumprod, cummax, cummin

Members of this group dispatch on x. Most members accept only one argument, but members log, round and signif accept one or two arguments, and trunc accepts one or more.

**Group "Ops":**

- `+`, `-`, `*`, `/`, `^`, `%%`, `%/%`
- `&`, `|`, `!`
- `==`, `!=`, `<`, `<=`, `>=`, `>`

This group contains both binary and unary operators (+, - and !): when a unary operator is encountered the Ops method is called with one argument and e2 is missing.

The classes of both arguments are considered in dispatching any member of this group. For each argument its vector of classes is examined to see if there is a matching specific (preferred) or Ops method. If a method is found for just one argument or the same method is found for both, it is used. If different methods are found, there is a warning about ‘incompatible methods’: in that case or if no method is found for either argument the internal method is used.

Note that the data.frame methods for the comparison (`Compare`: ==, <, ...) and logic (`Logic`: & | and !) operators return a logical matrix instead of a data frame, for convenience and back compatibility.

If the members of this group are called as functions, any argument names are removed to ensure that positional matching is always used.

**Group "Summary":**
- all, any
- sum, prod
- min, max
- range

Members of this *group dispatch on the first argument supplied.*

**Group "Complex":**

Arg, Conj, Im, Mod, Re

Members of this group dispatch on z.

**base**
[[->>]] Global assignment
[[<<-]]
**rlang**

[[!!]]   - Quasiquotation of an expression
[[!!!]]  - Quasiquotation of an expression
[[%@%]]  - Infix attribute accessor and setter
[[%@%<-]]- Infix attribute accessor and setter
[[%|%]]  - Replace missing values
[[%||%]] - Default value for 'NULL'
[[.data]]- Data pronoun for tidy evaluation
[[:=]]   - Quasiquotation of an expression



**Magrittr**  Pipes (also in dplyr, and others.)
[[%$%]] - Exposition pipe
[[%<>%]]- Assignment pipe
[[%>%]] - Pipe
[[%T>%]]- Tee pipe  -Tee is confusing, but its as if the the next item to the Right isnt there.  The value is passed there, but then continues.  So the filename is passed to file.create, but then passed on to print.

**piper**
[[%>>%]]
1. Pipe to first unnamed argument: Whenever a function name or call with or without parameters follows the operator, the left-hand side value will be piped to the right-hand side function as the first unnamed argument.
2. Pipe to . in enclosed expression: Whenever an expression following the operator is enclosed by {} or () *(unless lambda or assignment)*, the expression will be evaluated with `.` representing the left-hand side value.
3. Pipe by lambda expression:A **lambda expression** is a formula whose left-hand side is a symbol used to represent the value being piped and right-hand side is an expression to be evaluated with the symbol.

                x %>>% (p ~ expr) as expr given p = x
If one only cares about the side effect (e.g. printing intermediate results, plotting graphics, assigning value to symbol) of an expression rather than its returned value, write a lambda expression that starts with ~ indicating side effect (or branching, in the sense of pipeline building).

        x %>>% (~ f(.)) evaluated as {f(x); x}.

        x %>>% (~ p ~ f(p)) evaluated as {f(x); x}

5. Pipe for assignment

    5a.  Assignment as side-effect

    In general, `x %>>% (~ y = ...)` is evaluated as `y <- x %>>% (...)` and returns `x`.
    `x %>>% (~ y)` evaluated as `y <- x` and returns `x`, where `y` must be a symbol.
    `x %>>% (~ y = f(.))` evaluated as `y <- f(x)` and returns `x`.
    `x %>>% (~ y = p ~ f(p))` evaluated as `y <- f(x)` and returns `x`.

    5b. Piping with assignment

            In general, `x %>>% (y = ...)` is evaluated as `y <- x %>>% (...)`.
            `x %>>% (y = f(.))` evaluated as `y <- f(x)` and returns `f(x)`.
            `x %>>% (y = p ~ f(p))` evaluated as `y <- f(x)` and returns `f(x)`.

The equal sign above can be interchangeably used as the assignment operator <-. Note that the global assignment operator <<- and ->> in a pipeline also performs global assignment that is subject to side-effect outside the calling environment.

In some cases, users might need to create a group of symbols. The following code calls assign to dynamically determine the symbol name when its value is evaluated.

    `for (i in 1:5) rnorm(i) %>>% (assign(paste0("rnorm", i), .))`

To avoid exporting a symbol to the calling environment, use a symbol name starting with . like

6. Pipe for element extraction:

If a symbol is enclosed within `()`, it tells the operator to extract element from the left-hand side value. It works with vector, list, environment and all other objects for which `[[]]` is defined. Moreover, it also works with S4 object.

`x %>>% (name)` as `x[["name"]]` when x is list, environment, data.frame, etc; and x@name when x is S4 object.

7. Pipe to string:

If an object is piped to a single character value, then the string will be `cat()` and starts a new paragraph. This is useful for indicating the executing process of a pipeline.

`x %>>%` "print something" `%>>% f(y)` will `cat("print something")` and then evaluate `f(x,y`).

8. Pipe for questioning:

If a lambda expression start with `?`, the expression will be a side effect printing the syntax and the value of the expression. This is a light-weight version of side-effect piping and can be useful for simple inspection and debugging for pipeline operations.

        `x %>>% (? expr)` will print the value of expr and return `x`, just like a question.

        `x %>>% ("title" ? expr)` will print "title" as the question, the value of expr, and return x.


!!!Note Debugging Pipe Ops:  [YouTube Example](https://www.youtube.com/watch?v=7Xifeq3-FGU&list=PLAKBwakacHbQp_Z66asDnjn-0qttTO-o9&index=4)
        "bizarro pipe" `->.;`  steps through the pipe operation.  Turn on the .Last.Value Show = True in Global Options.
            After debugging, replace with the tradditional pipe operator.


Building (unary) functions
Any pipeline starting with the . will return a function which can later be used to apply the pipeline to values. Building functions in magrittr is therefore similar to building other values.

        f <- . %>% cos %>% sin
        # is equivalent to
        f <- function(.) sin(cos(.))

```R
require(replyr); require(wrapr); require(magrittr)
"dfData.RDS" -> fN
fN %>% paste(getwd(), . , sep="/") %T>% file(open = "wb") %T>% saveRDS(object=df)
#passes the char string
fN %>% paste(getwd(), . , sep="/") %>% file(open = "wb") %T>% saveRDS(object=df) %T>% flush()
#This prints the connection because we passed it OVER
"dfData.RDS" %->% fN %>% paste(getwd(), . , sep="/") %>% file(open = "wb") %T>% saveRDS(object=df) %T>% flush %>% close
#now passes the connection
file.exists(fN)

require(replyr)
require(Hmisc)
getwd()
"dfData.RDS" %->% fN %>% file(open="rb") %->% con %>% readRDS() -> df
```

**wrapr**
`%>.%` - Pipe operator ("dot arrow", "dot pipe" or "dot arrow pipe").
`%.%` -  Pipe operator ("dot arrow", "dot pipe" or "dot arrow pipe").
`%.>%` - Pipe operator ("dot arrow", "dot pipe" or "dot arrow pipe").
`%.|%` - Use function to reduce or expand arguments.
    - `%|.%:` f reduce args
    - `%.|%`: args expand f
    -
                # basic examples
                1:10 %.|% sum
                1:10 %.|% base::sum
                1:10 %.|% function(...) { sum(...) }

                # simulate partial application of log(., base=2)
                1:4 %.>% do.call(log, list(., base = 2))

`%:=%` - Named map builder. Set names of right-argument to be left-argument, and return right argument. Called from := operator.
                g <- x~y := { x + 3*y }
                g(1,100)

                f <- ~x := x^2
                f(7)

                f <- x := { sqrt(x) }
                f(7)
`%?%` - Coalesce values (NULL/NA on left replaced by values on the right).
`%c%` - Inline list/array concatenate.
`%dot%` -Inline dot product.
`%in_block%` - Inline let-block notation.
`%p%` -  character paste0.

              `"a" %p% "b"` --> ab

`%qc%`	Inline quoting list/array concatenate.
                `qc(A,B,C)`          ->    [1] "A" "B" "C"
                `a %qc% b %qc% c`    ->    [1] "a" "b" "c
                `c("a", "b") %qc% d` ->    [1] "a" "b" "d"
                `1:2 %qc% 5:6`       ->    [1] "1:2" "5:6"

`%|.%` - Use function to reduce or expand arguments.
`:=` - Named map builder.

**replyr**
`%->%`	Land a value to variable from a pipeline.
`%->_%`	Land a value to variable from a pipeline.
`%land%`	Land a value to variable from a pipeline.
`%land_%`	Land a value to variable from a pipeline.


**zoo**
`$.zoo` - Z's Ordered Observations
`$<-.zoo` - Z's Ordered Observations
`-.yearmon` - An Index Class for Monthly Data
`-.yearqtr` - An Index Class for Quarterly Data
`[.yearmon` - An Index Class for Monthly Data
`[.yearqtr` - An Index Class for Quarterly Data
`[.zoo` - Z's Ordered Observations
`[<-.zoo` - Z's Ordered Observations
`[[.yearmon` - An Index Class for Monthly Data
`[[.yearqtr` - An Index Class for Quarterly Data


**lubridate**
[[%--%]]

S4 Group Generic Functions
Description
Methods can be defined for group generic functions. Each group generic function has a number of member generic functions associated with it.

Methods defined for a group generic function cause the same method to be defined for each member of the group, but a method explicitly defined for a member of the group takes precedence over a method defined, with the same signature, for the group generic.

The functions shown in this documentation page all reside in the methods package, but the mechanism is available to any programmer, by calling setGroupGeneric (provided package methods is attached).

Usage
- S4 group generics:
  - Arith(e1, e2)
  - Compare(e1, e2)
  - Ops(e1, e2)
  - Logic(e1, e2)
  - Math(x)
  - Math2(x, digits)
  - Summary(x, ..., na.rm = FALSE)
  - Complex(z)

Methods can be defined for the group generic functions by calls to setMethod in the usual way. Note that the group generic functions should never be called directly – a suitable error message will result if they are. When metadata for a group generic is loaded, the methods defined become methods for the members of the group, but only if no method has been specified directly for the member function for the same signature. The effect is that group generic definitions are selected before inherited methods but after directly specified methods. For more on method selection, see Methods_Details.

There are also S3 groups Math, Ops, Summary and Complex, see ?S3groupGeneric, with no corresponding R objects, but these are irrelevant for S4 group generic functions.

The members of the group defined by a particular generic can be obtained by calling getGroupMembers. For the group generic functions currently defined in this package the members are as follows:

Arith  `+`, `-`, `*`, `^`, `%%`, `%/%`, `/`

Compare  `==`, `>`, `<`, `!=`, `<=`, `>=`

Logic `&`, `|`.

Ops `Arith`, `Compare`, `Logic`

Math `abs`, `sign`, `sqrt`, `ceiling`, `floor`, `trunc`, `cummax`, `cummin`, `cumprod`, `cumsum`, `log`, `log10`, `log2`, `log1p`, `acos`, `acosh`, `asin`, `asinh`, `atan`, `atanh`, `exp`, `expm1`, `cos`, `cosh`, `cospi`, `sin`, `sinh`, `sinpi`, `tan`, `tanh`, `tanpi`, `gamma`, `lgamma`, `digamma`, `trigamma`

Math2 `round`, `signif`

Summary `max`, `min`, `range`, `prod`, `sum`, `any`, `all`

Complex `Arg`, `Conj`, `Im`, `Mod`, `Re`

Note that Ops merely consists of three sub groups.

All the functions in these groups (other than the group generics themselves) are basic functions in R. They are not by default S4 generic functions, and many of them are defined as primitives. However, you can still define formal methods for them, both individually and via the group generics. It all works more or less as you might expect, admittedly via a bit of trickery in the background. See Methods_Details for details.

Note that two members of the Math group, log and trunc, have ... as an extra formal argument. Since methods for Math will have only one formal argument, you must set a specific method for these functions in order to call them with the extra argument(s).



 exposition pipe - %$%  Expose the names in lhs to the rhs expression. This is useful when functions do not have a built-in data argument. Some functions, e.g. lm and aggregate, have a data argument, which allows the direct use of names inside the data as part of the call. This operator exposes the contents of the left-hand side object to the expression on the right to give a similar benefit, see the examples.

Tee pipe %T>% Pipe a value forward into a function- or call expression and return the original value instead of the result. This is useful when an expression is used for its side-effect, say plotting or printing.

Assignment pipe %<>% Pipe an object forward into a function or call expression and update the lhs object with the resulting value.
Arithmetic on type double in R is supposed to be done in ‘round to nearest, ties to even’ mode, but this does depend on the compiler and FPU being set up correctly.

Value

%.%	Pipe operator ("dot arrow", "dot pipe" or "dot arrow pipe").
%.>%	Pipe operator ("dot arrow", "dot pipe" or "dot arrow pipe").
%.|%	Use function to reduce or expand arguments.
%:=%	Named map builder.
%>.%	Pipe operator ("dot arrow", "dot pipe" or "dot arrow pipe").
%?%	Coalesce values (NULL/NA on left replaced by values on the right).
%c%	Inline list/array concatenate.
%dot%	Inline dot product.
%in_block%	Inline let-block notation.
%p%	Inline character paste0.
%qc%	Inline quoting list/array concatenate.
%|.%	Use function to reduce or expand arguments.
:=	Named map builder.

lubridate::interval
%--% Creates an interval that covers the range spanned by two dates. It replaces the original behavior of lubridate, which created an interval by default whenever two date-times were subtracted.

DescTools::Between/ DescTools::Outside

x %()% rng
x %(]% rng
x %[)% rng
x %[]% rng

x %][% rng
x %](% rng
x %)[% rng
x %)(% rng

x %overlaps% y DescTools::Overlap(x, y)


ifelse {base}
utils::str( ifelse(NA,    yes, no) ) # logical, length 1
utils::str( ifelse(TRUE,  yes, no) ) # integer, length 1
utils::str( ifelse(FALSE, yes, no) ) # double,  length 1


#### Conditional

if(cond) expr
if(cond) cons.expr  else  alt.expr

for(var in seq) expr
while(cond) expr
repeat expr
break
next

!!! braces {} Note that it is a common mistake to forget to put braces ({ .. }) around your statements, e.g., after if(..) or for(....). In particular, you should not have a newline between } and else to avoid a syntax error in entering a if ... else construct at the keyboard or via source. For that reason, one (somewhat extreme) attitude of defensive programming is to always use braces, e.g., for if clauses.

        for(n in c(2,5,10,20,50)) {
        x <- stats::rnorm(n)
        cat(n, ": ", sum(x^2), "\n", sep = "")
        }
        f <- factor(sample(letters[1:5], 10, replace = TRUE))
        for(i in unique(f)) print(i)


### variables

\` Backticks can be used as quotes for names for improper objects- e.g. names with spaces in them.

!!!tip to pass a ref `deparse(substitute(value))`

a variable vs `a variable` vs "a variable"

eval(parse(text="))

!!, called “unquote”, and pronounced bang-bang. !! tells a quoting function to drop the implicit quotes:

```r
paste("Good", "afternoon", "Alice")
#> [1] "Good afternoon Alice"
cement <- function(...) {
  args <- ensyms(...)
  paste(purrr::map(args, as_string), collapse = " ")
}

cement(Good, morning, Hadley)
#> [1] "Good morning Hadley"
cement(Good, afternoon, Alice)
#> [1] "Good afternoon Alice"
name <- "Hadley"
time <- "morning"

paste("Good", time, name)
#> [1] "Good morning Hadley"
cement(Good, time, name)
#> [1] "Good time name"
cement(Good, !!time, !!name)
#> [1] "Good morning Hadley"
```

## Standard Evaluation vs. Non-Standard Eval

dplyr uses this a lot.

`sym()` returns an object without quotes.  More than that- it finds the referenced object and passes it, but thats what it looks like.  Doc says the opposite is `as_string()`
Sometimes you only want to allow "the" user to specify a variable name, not an arbitrary expression. In this case, you can use `ensym()` or `ensyms()`. These are variants of `enexpr()` and `enexprs()` that check the captured expression is either symbol or a string (which is converted to a symbol67). `ensym()` and ensyms() throw an error if giv

The base equivalent of expr() is quote():

quote(x + y)
#> x + y

        substitute(expr, env)
        quote(expr)
        enquote(cl)
                Arguments
                expr
                any syntactically valid R expression

                cl
                a call, i.e., an R object of class (and mode) "call".

                env
                an environment or a list object. Defaults to the current evaluation environment.

        deparse(expr, width.cutoff = 60L,
                backtick = mode(expr) %in% c("call", "expression", "(", "function"),
                control = c("keepNA", "keepInteger", "niceNames", "showAttributes"),
                nlines = -1L)
                Arguments
                expr
                any R expression.

                width.cutoff
                integer in [20, 500] determining the cutoff (in bytes) at which line-breaking is tried.

                backtick
                logical indicating whether symbolic names should be enclosed in backticks if they do not follow the standard syntax.

                control
                character vector (or NULL) of deparsing options. See .deparseOpts.

                nlines
                integer: the maximum number of lines to produce. Negative values indicate no limit.


Currently implemented aliases are

- extract - `[`
- extract2 - `[[`
- inset - `[<-`
- inset2 - `[[<-`
- use_series - `$`
- add - `+`
- subtract - `-`
- multiply_by - `*`
- raise_to_power - `^`
- multiply_by_matrix - `%*%`
- divide_by - `/`
- divide_by_int - `%/%`
- mod - `%%`
- is_in - `%in%`
- and - `&`
- or - `|`
- equals - `==`
- is_greater_than - `>`
- is_weakly_greater_than - `>=`
- is_less_than - `<`
- is_weakly_less_than - `<=`
- not (`n'est pas`) - `!`
- set_colnames - `colnames<-`
- set_rownames - `rownames<-`
- set_names - `names<-`

### Paths

R takes unix paths. From working dir dont add a aslash.

getwd()
setwd()
Sys.glob() - The glob system call is not part of Windows, and we supply a partial emulation.
Doesnt work like expected.
path.expand - might work


## Package info

Some of the available package things are:

`methods(xtable)` or generally `methods(package name)` which gives the methods available for a package.

`help(package=pkg)` which returns help for the package.

sdfsfghf gh\

#### Options


options(...) - `options()` returns a list

getOption()
.Options

```r

op <- options(); utils::str(op)
options(max.print = 500)

options(defaultPackages = c(getOption("defaultPackages"), if(!"magrittr" %in% getOption("defaultPackages")){ "magrittr"}else{NULL}))
$#OR-

options(defaultPackages = if(!"magrittr" %in% getOption("defaultPackages")){c(getOption("defaultPackages"), "magrittr")}else{getOption("defaultPackages")})

># set the editor, and save previous value
old.o <- options(editor = "nedit")
```

- `add.smooth` - :typically logical, defaulting to TRUE. Could also be set to an integer for specifying how many (simulated) smooths should be added. This is currently only used by plot.lm.
- `askYesNo` - a function (typically set by a front-end) to ask the user binary response functions in a consistent way, or a vector of strings used by askYesNo to use as default responses for such questions.
- `browserNLdisabled` - logical: whether newline is disabled as a synonym for "n" in the browser.
- `checkPackageLicense` - logical, not set by default. If true, loadNamespace asks a user to accept any non-standard license at first load of the package.
- `check.bounds` - logical, defaulting to FALSE. If true, a warning is produced whenever a vector (atomic or list) is extended, by something like x <- 1:3; x[5] <- 6.
- `CBoundsCheck` - logical, controlling whether .C and .Fortran make copies to check for array over-runs on the atomic vector arguments.
  - Initially set from value of the environment variable R_C_BOUNDS_CHECK (set to yes to enable).
- `continue` - a non-empty string setting the prompt used for lines which continue over one line.
- `defaultPackages` - the packages that are attached by default when R starts up. Initially set from value of the environment variable R_DEFAULT_PACKAGES, or if that is unset to c("datasets", "utils", "grDevices", "graphics", "stats", "methods"). (Set R_DEFAULT_PACKAGES to NULL or a comma-separated list of package names.) It will not work to set this in a ‘.Rprofile’ file, as its value is consulted before that file is read.
- `deparse.cutoff` - integer value controlling the printing of language constructs which are deparsed. Default 60.
- `deparse.max.lines` - controls the number of lines used when deparsing in traceback, browser, and upon entry to a function whose debugging flag is set. Initially unset, and only used if set to a positive integer.
- `digits` - controls the number of significant digits to print when printing numeric values. It is a suggestion only. Valid values are 1...22 with default 7. See the note in print.default about values greater than 15.
- `digits.secs` - controls the maximum number of digits to print when formatting time values in seconds. Valid values are 0...6 with default 0. See strftime.
- `download.file.extra` - Extra command-line argument(s) for non-default methods: see download.file.
- `download.file.method` - Method to be used for download.file. Currently download methods "internal", "wininet" (Windows only), "libcurl", "wget" and "curl" are available. If not set, method = "auto" is chosen: see download.file.
- `echo` - logical. Only used in non-interactive mode, when it controls whether input is echoed. Command-line option --slave sets this to FALSE, but otherwise it starts the session as TRUE.
- `encoding` - The name of an encoding, default "native.enc". See connections.
- `error` - either a function or an expression governing the handling of non-catastrophic errors such as those generated by stop as well as by signals and internally detected errors. If the option is a function, a call to that function, with no arguments, is generated as the expression. The default value is NULL: see stop for the behaviour in that case. The functions dump.frames and recover provide alternatives that allow post-mortem debugging. Note that these need to specified as e.g. options(error = utils::recover) in startup files such as ‘.Rprofile’.
- `expressions` - sets a limit on the number of nested expressions that will be evaluated. Valid values are 25...500000 with default 5000. If you increase it, you may also want to start R with a larger protection stack; see --max-ppsize in Memory. Note too that you may cause a segfault from overflow of the C stack, and on OSes where it is possible you may want to increase that. Once the limit is reached an error is thrown. The current number under evaluation can be found by calling Cstack_info.
- `interrupt` - a function taking no arguments to be called on a user interrupt if the interrupt condition is not otherwise handled.
- `keep.source` - When TRUE, the source code for functions (newly defined or loaded) is stored internally allowing comments to be kept in the right places. Retrieve the source by printing or using deparse(fn, control = "useSource").
  - The default is interactive(), i.e., TRUE for interactive use.
- `keep.source.pkgs` - As for keep.source, used only when packages are installed. Defaults to FALSE unless the environment variable R_KEEP_PKG_SOURCE is set to yes.
- `matprod` - a string selecting the implementation of the matrix products %*%, crossprod, and tcrossprod for double and complex vectors:
- `"internal"` - uses an unoptimized 3-loop algorithm which correctly propagates NaN and Inf values and is consistent in precision with other summation algorithms inside R like sum or colSums (which now means that it uses a long double accumulator for summation if available and enabled, see capabilities).
- `"default"` - uses BLAS to speed up computation, but to ensure correct propagation of NaN and Inf values it uses an unoptimized 3-loop algorithm for inputs that may contain NaN or Inf values. When deemed beneficial for performance, "default" may call the 3-loop algorithm unconditionally, i.e., without checking the input for NaN/Inf values. The 3-loop algorithm uses (only) a double accumulator for summation, which is consistent with the reference BLAS implementation.
- `"blas"` - uses BLAS unconditionally without any checks and should be used with extreme caution. BLAS libraries do not propagate NaN or Inf values correctly and for inputs with NaN/Inf values the results may be undefined.
- `"default.simd"` - is experimental and will likely be removed in future versions of R. It provides the same behavior as "default", but the check whether the input contains NaN/Inf values is faster on some SIMD hardware. On older systems it will run correctly, but may be much slower than "default".
- `max.print` - integer, defaulting to 99999. print or show methods can make use of this option, to limit the amount of information that is printed, to something in the order of (and typically slightly less than) max.print entries.
- `OutDec` - character string containing a single character. The preferred character to be used as the decimal point in output conversions, that is in printing, plotting, format and as.character but not when deparsing nor by sprintf nor formatC (which are sometimes used prior to printing.)
- `pager` - the command used for displaying text files by file.show. Defaults to "internal", which uses a pager similar to the GUI console. Another possibility is "console" to use the console itself. Can be a character string or an R function, in which case it needs to accept the arguments (files, header, title, delete.file) corresponding to the first four arguments of file.show.
- `papersize` - the default paper format used by postscript; set by environment variable R_PAPERSIZE when R is started: if that is unset or invalid it defaults to "a4", or "letter" in US and Canadian locales.
- `PCRE_limit_recursion` - Logical: should grep(perl = TRUE) and similar limit the maximal recursion allowed when matching? PCRE can be built not to use a recursion stack (see pcre_config, but it is by default with a recursion limit of 10000000 which potentially needs a very large C stack: see the discussion at http://www.pcre.org/original/doc/html/pcrestack.html. If true, the limit is reduced using R's estimate of the C stack size available (if known), otherwise 10000. If NA, the limit is imposed only if any input string has 1000 or more bytes.
- `PCRE_study` - Logical or integer: should grep(perl = TRUE) and similar ‘study’ the patterns? Either logical or a numerical threshold for the minimum number of strings to be matched for the pattern to be studied (the default is 10)). Missing values and negative numbers are treated as false.
- `PCRE_use_JIT` - Logical: should grep(perl = TRUE), strsplit(perl = TRUE) and similar make use of PCRE's Just-In-Time compiler for studied patterns, if available? Missing values are treated as false.
- `pdfviewer` - default PDF viewer. The default is set from the environment variable R_PDFVIEWER, which defaults to the full path to open.exe, a utility supplied with R.
- `printcmd` - the command used by postscript for printing; set by environment variable R_PRINTCMD when R is started. This should be a command that expects either input to be piped to ‘stdin’ or to be given a single filename argument. Usually set to "lpr" on a Unix-alike.
- `prompt` - a non-empty string to be used for R's prompt; should usually end in a blank (" ").
- `save.defaults`, `save.image.defaults` - see save.
- `scipen` - integer. A penalty to be applied when deciding to print numeric values in fixed or exponential notation. Positive values bias towards fixed and negative towards scientific notation: fixed notation will be preferred unless it is more than scipen digits wider.
- `setWidthOnResize` - a logical. If set and TRUE, R run in a terminal using a recent readline library will set the width option when the terminal is resized.
- `showWarnCalls`, `showErrorCalls` - a logical. Should warning and error messages show a summary of the call stack? By default error calls are shown in non-interactive sessions.
- `showNCalls` - integer. Controls how long the sequence of calls must be (in bytes) before ellipses are used. Defaults to 40 and should be at least 30 and no more than 500.
- `show.error.locations` - Should source locations of errors be printed? If set to TRUE or "top", the source location that is highest on the stack (the most recent call) will be printed. "bottom" will print the location of the earliest call found on the stack.
  - Integer values can select other entries. The value 0 corresponds to "top" and positive values count down the stack from there. The value -1 corresponds to "bottom" and negative values count up from there.
- `show.error.messages` - a logical. Should error messages be printed? Intended for use with try or a user-installed error handler.
- `stringsAsFactors` - The default setting for arguments of data.frame and read.table.
- `texi2dvi` - used by functions texi2dvi and texi2pdf in package tools.
- `timeout` - integer. The timeout for some Internet operations, in seconds. Default 60 seconds. See download.file and connections.
- `topLevelEnvironment` - see topenv and sys.source.
- `url.method` - character string: the default method for url. Normally unset, which is equivalent to "default", which is "internal" except on Windows.
- `useFancyQuotes` - controls the use of directional quotes in sQuote, dQuote and in rendering text help (see Rd2txt in package tools). Can be TRUE, FALSE, "TeX" or "UTF-8".
- `verbose` - logical. Should R report extra information on progress? Set to TRUE by the command-line option --verbose.
- `warn` - sets the handling of warning messages. If warn is negative all warnings are ignored. If warn is zero (the default) warnings are stored until the top–level function returns. If 10 or fewer warnings were signalled they will be printed otherwise a message saying how many were signalled. An object called last.warning is created and can be printed through the function warnings. If warn is one, warnings are printed as they occur. If warn is two or larger all warnings are turned into errors.
- `warnPartialMatchArgs` - logical. If true, warns if partial matching is used in argument matching.
- `warnPartialMatchAttr` - logical. If true, warns if partial matching is used in extracting attributes via attr.
- `warnPartialMatchDollar` - logical. If true, warns if partial matching is used for extraction by $.
- `warning.expression` - an R code expression to be called if a warning is generated, replacing the standard message. If non-null it is called irrespective of the value of option warn.
- `warning.length` - sets the truncation limit for error and warning messages. A non-negative integer, with allowed values 100...8170, default 1000.
- `nwarnings` - the limit for the number of warnings kept when warn = 0, default 50. This will discard messages if called whilst they are being collected. If you increase this limit, be aware that the current implementation pre-allocates the equivalent of a named list for them, i.e., do not increase it to more than say a million.
- `width` - controls the maximum number of columns on a line used in printing vectors, matrices and arrays, and when filling by cat.


You may want to change this if you re-size the window that R is running in. Valid values are 10...10000 with default normally 80. (The limits on valid values are in file ‘Print.h’ and can be changed by re-compiling R.) Some R consoles automatically change the value when they are resized.

See the examples on Startup for one way to set this automatically from the terminal width when R is started.

The ‘factory-fresh’ default settings of some of these options are

| add.smooth          | TRUE          |
| ------------------- | ------------- |
| check.bounds        | FALSE         |
| continue            | +            |
| digits              | 7             |
| echo                | TRUE          |
| encoding            | native.enc    |
| error               | NULL          |
| expressions         | 5000          |
| keep.source         | interactive() |
| keep.source.pkgs    | FALSE         |
| max.print           | 99999         |
| OutDec              | .             |
| prompt              | >            |
| scipen              | 0             |
| show.error.messages | TRUE          |
| timeout             | 60            |
| verbose             | FALSE         |
| warn                | 0             |
| warning.length      | 1000          |
| width               | 80            |
^()(\S*?)([ ]*\t[ ]*)(\b.*)$

## Admin

- `tools::checkRdaFiles` - Report on Details of Saved Images or Re-saves them
- `tools::CRAN_package_db` - CRAN Package Repository Tools
- `utils::apropos` - Find Objects by (Partial) Name
- `utils::available.packages` - List Available Packages at CRAN-like Repositories
- `utils::bug.report` - Send a Bug Report
- `utils::contrib.url` - Find Appropriate Paths in CRAN-like Repositories
- `utils::download.packages` - Download Packages from CRAN-like Repositories
- `utils::install.packages` - Install Packages from Repositories or Local Files
- `utils::mirrorAdmin` - Managing Repository Mirrors
- `utils::object.size` - Report the Space Allocated for an Object
- `utils::setRepositories` - Select Package Repositories
- `utils::Sweave` - Automatic Generation of Reports
- `utils::update.packages` - Compare Installed Packages with CRAN-like Repositories
- `rstudioapi::rstudio-documents` - Interact with Documents open in RStudio

### Variables

`ls()` list the variables in environment
`rm()` remove a var
`rm(list=ls())` remove all vars.

reference a list with `[[ ]]`

class -> character, numeric, or factor
type ->
`numeric` Numeric data (approximations of the real numbers, ℝ)
`integer` Integer data (whole numbers, ℤ)
`factor` Categorical data (simple classifications, like gender)
`ordered` Ordinal data (ordered classifications, like educational level)
`character` Character data (strings)
`raw` Binary data

POSIX.datetime()


str

Types:

The atomic modes are "logical", "integer", "numeric" (synonym "double"), "complex", "character" and "raw".

Complex modes (so far I am aware of): expression

`mode()` Modes have the same set of names as types (see typeof) except that
- types "integer" and "double" are returned as "numeric".
- types "special" and "builtin" are returned as "function".
- type "symbol" is called mode "name".
- type "language" is returned as "(" or "call".

`storage.mode()`
type- `typeof()` A character string. The possible values are listed in the structure TypeTable in ‘src/main/util.c’. Current values are the vector types
- "logical"
- "integer"
- "double"
- "complex"
- "character"
- "raw"
- "list"
- "NULL"
- "closure" (function)
- "special"
- "builtin" (basic functions and operators)
- "environment"
- "S4" (some S4 objects) and others that are unlikely to be seen at user level ("symbol", "pairlist", "promise", "language", "char", "...", "any", "expression", "externalptr", "bytecode" and "weakref").
`isS4()`
`type.convert()`

**Dates and Times**
Class "POSIXct" represents the (signed) number of seconds since the beginning of 1970 (in the UTC time zone) as a numeric vector. Class "POSIXlt" is a named list of vectors representing

- sec -0–61: seconds.
- min 0–59: minutes.
- hour 0–23: hours.
- mday 1–31: day of the month
- mon 0–11: months after the first of the year.
- year years since 1900.
- wday 0–6 day of the week, starting on Sunday.
- yday 0–365: day of the year.
- isdst Daylight Saving Time flag. Positive if in force, zero if not, negative if unknown.
- zone (Optional.) The abbreviation for the time zone in force at that time: "" if unknown (but "" might also be used for UTC).
- gmtoff (Optional.) The offset in seconds from GMT: positive values are East of the meridian. Usually NA if unknown, but 0 could mean unknown.

**Names and Symbols** A ‘name’ (also known as a ‘symbol’) is a way to refer to R objects by name (rather than the value of the object, if any, bound to that name).

`as.name` and `as.symbol` are identical: they attempt to coerce the argument to a name.
`as.symbol(x)`
`is.symbol(x)`

`as.name(x)`
`is.name(x)`

**factor**
R has a number of (undocumented) convenience functions for converting factors:

as.character.factor
as.data.frame.factor
as.Date.factor
as.list.factor
as.vector.factor

In particular, as.numeric applied to a factor is meaningless, and may happen by implicit coercion. To transform a factor f to approximately its original numeric values, as.numeric(levels(f))[f] is recommended and slightly more efficient than  as.numeric(as.character(f)).
[Source](https://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-integer-numeric-without-loss-of-information)

**Expressions**  Creates or tests for objects of mode "expression". ‘Expression’ here is not being used in its colloquial sense, that of mathematical expressions. Those are calls (see call) in R, and an R expression vector is a list of calls, symbols etc, for example as returned by `parse`.
expression(...)

is.expression(x)
as.expression(x, ...)

**Functions** These functions provide the base mechanisms for defining new functions in the R language.

This type of function is not the only type in R: they are called closures (a name with origins in LISP) to distinguish them from primitive functions

function( arglist ) expr
return(value)

Related: `args`, `formals`, `body` and `environment` for accessing the component parts of a function. `debug` for debugging; using `invisible` inside return(.) for returning invisibly.

The atomic modes are "logical", "integer", "numeric" (synonym "double"), "complex", "character" and "raw".
`vector(mode = "logical", length = 0)`
`as.vector(x, mode = "any")`
`is.vector(x, mode = "any")`
`vector(mode="numeric", 6)`

`vector()` `c(x,y,z)`
`array()` -a vector which is stored with additional attributes giving the dimensions (attribute "dim") and optionally names for those dimensions (attribute "dimnames").
    - One-dimensional arrays often look like vectors, but may be handled differently by some functions: str does distinguish them in recent versions of R.
    - The "dim" attribute is an integer vector of length one or more containing non-negative values: the product of the values must match the length of the array.
    - The "dimnames" attribute is optional: if present it is a list with one component for each dimension, either NULL or a character vector of the length given by the element of the "dim" attribute for that dimension.
matrix() - A two-dimensional array is the same thing as a `matrix`.

Concatenation - `c(..., recursive = FALSE, use.names = TRUE)`

`list(...)`
`pairlist(...)`

`as.list(x, ...)`
`as.list(x, all.names = FALSE, sorted = FALSE, ...)`
`as.pairlist(x)`

`is.list(x)`
`is.pairlist(x)`

`alist(...)`
`unlist()` inverse to `as.list()`

Objects- two types S3 and S4 systems.  I think there was a third too.

`attributes(obj)` - returns the object's attribute list.
`attributes(obj) <- value` The replacement forms uses the list on the right-hand side of the assignment as the object's attributes (if appropriate).
`mostattributes(obj) <- value` - The mostattributes assignment takes special care for the dim, names and dimnames attributes, and assigns them only when known to be valid whereas an attributes assignment would give an error if any are not. It is principally intended for arrays, and should be used with care on classed objects. For example, it does not check that row.names are assigned correctly for data frames.
 `identical()`
Note that some attributes (namely class, comment, dim, dimnames, names, row.names and tsp) are treated specially and have restrictions on the values which can be set.

Unlike attr it is possible to set attributes on a NULL object: it will first be coerced to an empty list.
`attr(x, which, exact = FALSE)`
`attr(x, which) <- value`

**Examples and Usage**

`attributes(t1v)` prints a list - $names(length n), rownames, class
`attributes(xlstypes) <- NULL` strip the attributes off.

## DataFrame

dplyr

filter selects rows
select select columns

there are underscore methods for each method that will allow quoted names. Normally if you pass a column name its quoted.  dplyr doesnt like quotes.

sym() removes quotes.

rename()) will rename a single column.

Other single table verbs: arrange, filter, mutate, slice, summarise

`arrange()` orders a df.


The three scoped variants of select() (select_all(), select_if() and select_at()) and the three variants of rename() (rename_all(), rename_if(), rename_at()) m

## Debug

`debug(fun, text = "", condition = NULL, signature = NULL)`
`debugonce(fun, text = "", condition = NULL, signature = NULL)`
`undebug(fun, signature = NULL)`
`isdebugged(fun, signature = NULL)`
`debuggingState(on = NULL)`
If you want to debug a function not starting at the very beginning, use trace(..., at = *) or setBreakpoint.

consider adding some debugging to your .Rprofile; e.g. something like:

```r
.First <- function() {
  trace(base:::loadNamespace, quote({
    if (package == "rmarkdown")
      utils::str(sys.calls())
  }), print = FALSE)
})
```
(replacing utils::str() with a better call-stack printer if available)


## Time types

!!!Note: Also, when dealing with dates and times, a good rule to follow is: if you're only concerned with dates, use a `Date` class object. If you're concerned with time, but not specifics (e.g., timezone), use a `chron` class object. Otherwise, you want all the details, so use `POSIXlt` or `POSIXct` (the former is stored as a list). The time methods tend to work on all these objects.  [Src](https://stackoverflow.com/questions/10836503/convert-difftime-time-to-years-months-and-days)

`tsp()` Tsp Attribute of Time-Series-like Objects a vector or matrix or univariate or multivariate time-series
ts,
 time,
  start.


```r

  require(lubridate)
df$DOB %--%  Sys.Date() %>% int_length(.) %>% lubridate::as.duration() %>% as.numeric("years") -> df$Age.act

rep( chron::chron(Sys.time() %>% format.Date(format="%m/%d/%Y"),
                   Sys.time() %>% format.Date(format="%H:%M:%S") ,
                   format = c(dates = "m/d/y", times = "h:m:s")), dim(df)[1] ) -
   chron::chron(format.Date(df$DOB , format="%m/%d/%Y")) ->df$Days


```
## Packages

`library(package)`
`require(package)` - returns false if unable to load.
`install.packages(package)`
`find.package()`
`uninstall.package()`

## Un-organized methods

stopifnot()

## Vectors
 Current values are the vector types "logical", "integer", "double", "complex", "character", "raw" and "list", "NULL", "closure" (function), "special" and "builtin" (basic functions and operators), "environment", "S4" (some S4 objects) and others that are unlikely to be seen at user level ("symbol", "pairlist", "promise", "language", "char", "...", "any", "expression", "externalptr", "bytecode" and "weakref").

 The output type is determined from the highest type of the components in the hierarchy NULL < raw < logical < integer < double < complex < character < list < expression


### Get the last-

```r
x[length(x)]
Rcpp::cppFunction('double mylast(NumericVector x) { int n = x.size(); return x[n-1]; }')
mylast(x), #where mylast is a C++ function implemented through Rcpp,
base::tail(x, n=1)
dplyr::last(x)
x[stats::end(x)[1]]]
base::rev(x)[1]
```

## Functions


```r
>#             deparse(substitute(X))
summarize(X, by, FUN, ...,
          stat.name=deparse(substitute(X)),
          type=c('variables','matrix'), subset=TRUE,
          keepcolnames=FALSE)

```


## Importing Data

inbuilt methods

read.csv()
read.delim()
read.file()

readr - Importantly, can specify using a string representation

!!!quote from read.delim() "Alternatively, you can use a compact string representation where each character represents one column: c = character, i = integer, n = number, d = double, l = logical, f = factor, D = date, T = date time, t = time, ? = guess, or _/- to skip the column."
            #for a dataframe with 6 columns `col_types = "cdcDlf"` etc.

col_types is always a list-
read_delim()

```r
read.delim("ColTypes.txt", sep = "\t", quote= "\"'", stringsAsFactors = FALSE, header=T, colClasses = c("character"), as.is = T, na.strings = "") -> types
##colClasses one of the atomic vector classes (logical, integer, numeric, complex, character, raw), or "factor", "Date" or "POSIXct".
#as.is = !stringAsFactors
str = 'cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc'
#did this in python 'c'*133
read_delim("ColTypes.txt", delim = "\t",quote= "\"'", col_types = str)-> types2


fileName = "/Reull2escaped.csv"
   readr::read_csv(fileName, escape_backslash = TRUE, col_names = TRUE, col_types = NULL) -> newData4.guess
      spec(newData4.guess)->newData4.guess.spec
      problems(newData4.guess) -> newData4.guess.prob
   readr::read_csv(fileName, escape_backslash = TRUE, col_names = TRUE, col_types = D1) -> newData4
      spec(newData4)->newData4.spec
      problems(newData4) -> newData4.prob
   utils::read.delim(fileNmae, header=TRUE, sep = ","as.is=TRUE, na.strings="") -> newData6
   utils::read.delim(fileNmae, header=TRUE, sep = ","as.is=TRUE, na.strings="", colClasses = xlsvector) -> newData6.ass
      # */
   fileName =  "./ECHOICU-AnalyzedData.xlsx"
   readxl::read_excel(fileName, sheet=1, col_names = T, col_types = NULL)-> iniData
   # readxl::read_excel(fileName, sheet=1, col_names = T, col_types = readxl.vector )-> iniData.ass


   xlsx::read.xlsx(fileName,sheetIndex = 1, col_types="guess", guess_max = 100) -> iniData2
   # xlsx::read.xlsx(fileName,sheetIndex = 1, col_types = xlsvector, guess_max = 100) -> iniData2.ass


   xlsx::read.xlsx2(fileName,sheetIndex = 1, col_types="guess", guess_max = 100) -> iniData3
```

Apply et al

apply, tapply, mapply for applying a function to multiple arguments, and rapply for a recursive version of lapply(), eapply for applying a function to each entry in an environment.

`apply(X, MARGIN, FUN, ...)` -Returns a vector or array or list of values obtained by applying a function to margins of an array or matrix.

`tapply(X, INDEX, FUN = NULL, ..., default = NA, simplify = TRUE)` - Apply a function to each cell of a ragged array, that is to each (non-empty) group of values given by a unique combination of the levels of certain factors.


`lapply(X, FUN, ...)` - lapply returns a list of the same length as X, each element of which is the result of applying FUN to the corresponding element of X.

`sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)` - sapply is a user-friendly version and wrapper of lapply by  default returning a vector, matrix or, if simplify = "array", an array if appropriate, by applying simplify2array(). sapply(x, f, simplify = FALSE, USE.NAMES = FALSE) is the same as lapply(x, f).

    `sapply(*, simplify = FALSE, USE.NAMES = FALSE)` is equivalent to lapply(*).

`vapply(X, FUN, FUN.VALUE, ..., USE.NAMES = TRUE)` - vapply is similar to sapply, but has a pre-specified type of return value, so it can be safer (and sometimes faster) to use.

`rapply(object, f, classes = "ANY", deflt = NULL, how = c("unlist", "replace", "list"), ...)` rapply is a recursive version of lapply.  this function has two basic modes. If how = "replace", each element of the list which is not itself a list and has a class included in classes is replaced by the result of applying f to the element.

If the mode is how = "list" or how = "unlist", the list is copied, all non-list elements which have a class included in classes are replaced by the result of applying f to the element and all others are replaced by deflt. Finally, if how = "unlist", unlist(recursive = TRUE) is called on the result.

`dendrapply(X, FUN, ...)` - Apply function FUN to each node of a dendrogram recursively. When y <- dendrapply(x, fn), then y is a dendrogram of the same graph structure as x and for each node, y.node[j] <- FUN( x.node[j], ...) (where y.node[j] is an (invalid!) notation for the j-th node of y).

`by(data, INDICES, FUN, ..., simplify = TRUE)` - Function by is an object-oriented wrapper for tapply applied to data frames.

`simplify2array(x, higher = TRUE)` - simplify2array() is the utility called from sapply() when simplify is not false and is similarly called from mapply().


`replicate(n, expr, simplify = "array")` - replicate is a wrapper for the common use of sapply for repeated evaluation of an expression (which will usually involve random number generation).


`eapply(env, FUN, ..., all.names = FALSE, USE.NAMES = TRUE)` -eapply applies FUN to the named values from an environment and returns the results as a list. The user can request that all named objects are used (normally names that begin with a dot are not). The output is not sorted and no enclosing environments are searched.

`scale(x, center = TRUE, scale = TRUE)` - scale is generic function whose default method centers and/or scales the columns of a numeric matrix.

`sweep(x, MARGIN, STATS, FUN = "-", check.margin = TRUE, ...)` Return an array obtained from an input array by sweeping out a summary statistic. Splits the data into subsets, computes summary statistics for each, and returns the result in a convenient form.

`aggregate(x, ...)`

`aggregate(x, ...)` Default S3 method:

`aggregate(x, by, FUN, ..., simplify = TRUE, drop = TRUE)` S3 method for class 'data.frame' = aggregate.data.frame is the data frame method. If x is not a data frame, it is coerced to one, which must have a non-zero number of rows. Then, each of the variables (columns) in x is split into subsets of cases (rows) of identical combinations of the components of by, and FUN is applied to each such subset with further arguments in ... passed to it. The result is reformatted into a data frame containing the variables in by and x. The ones arising from by contain the unique combinations of grouping values used for determining the subsets, and the ones arising from x the corresponding summaries for the subset of the respective variables in x.

If simplify is true, summaries are simplified to vectors or matrices if they have a common length of one or greater than one, respectively; otherwise, lists of summary results according to subsets are obtained. Rows with missing values in any of the by variables will be omitted from the result. (Note that versions of R prior to 2.11.0 required FUN to be a scalar function.)

```r
require(stats)
groups <- as.factor(rbinom(32, n = 5, prob = 0.4))
tapply(groups, groups, length) #- is almost the same as
table(groups)

$#contingency table from data.frame : array with named dimnames
tapply(warpbreaks$breaks, warpbreaks[,-1], sum)
tapply(warpbreaks$breaks, warpbreaks[, 3, drop = FALSE], sum)

n <- 17; fac <- factor(rep_len(1:3, n), levels = 1:5)
table(fac)
tapply(1:n, fac, sum)
tapply(1:n, fac, sum, default = 0) # maybe more desirable
tapply(1:n, fac, sum, simplify = FALSE)
tapply(1:n, fac, range)
tapply(1:n, fac, quantile)
tapply(1:n, fac, length) ## NA's
tapply(1:n, fac, length, default = 0) # == table(fac)

$##example of ... argument: find quarterly means
tapply(presidents, cycle(presidents), mean, na.rm = TRUE)

ind <- list(c(1, 2, 2), c("A", "A", "B"))
table(ind)
tapply(1:3, ind) #-> the split vector
tapply(1:3, ind, sum)

X <- list(list(a = pi, b = list(c = 1:1)), d = "a test")
rapply(X, function(x) x, how = "replace")
rapply(X, sqrt, classes = "numeric", how = "replace")
rapply(X, nchar, classes = "character",
       deflt = as.integer(NA), how = "list")
rapply(X, nchar, classes = "character",
       deflt = as.integer(NA), how = "unlist")
rapply(X, nchar, classes = "character", how = "unlist")
rapply(X, log, classes = "numeric", how = "replace", base = 2)


require(stats); require(graphics)

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
$#compute the list mean for each list element
lapply(x, mean)
$#median and quartiles for each list element
lapply(x, quantile, probs = 1:3/4)
sapply(x, quantile)
i39 <- sapply(3:9, seq) # list of vectors
sapply(i39, fivenum)
vapply(i39, fivenum,
       c(Min. = 0, "1st Qu." = 0, Median = 0, "3rd Qu." = 0, Max. = 0))

$## sapply(*, "array") -- artificial example
(v <- structure(10*(5:8), names = LETTERS[1:4]))
f2 <- function(x, y) outer(rep(x, length.out = 3), y)
(a2 <- sapply(v, f2, y = 2*(1:5), simplify = "array"))
a.2 <- vapply(v, f2, outer(1:3, 1:5), y = 2*(1:5))
stopifnot(dim(a2) == c(3,5,4), all.equal(a2, a.2),
          identical(dimnames(a2), list(NULL,NULL,LETTERS[1:4])))

hist(replicate(100, mean(rexp(10))))

$## use of replicate() with parameters:
foo <- function(x = 1, y = 2) c(x, y)
#does not work: bar <- function(n, ...) replicate(n, foo(...))
bar <- function(n, x) replicate(n, foo(x = x))
bar(5, x = 3)

mapply(rep, 1:4, 4:1)

mapply(rep, times = 1:4, x = 4:1)

mapply(rep, times = 1:4, MoreArgs = list(x = 42))

mapply(function(x, y) seq_len(x) + y,
       c(a =  1, b = 2, c = 3),  # names from first
       c(A = 10, B = 0, C = -10))

word <- function(C, k) paste(rep.int(C, k), collapse = "")
utils::str(mapply(word, LETTERS[1:6], 6:1, SIMPLIFY = FALSE))


$# Compute row and column sums for a matrix:
x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
dimnames(x)[[1]] <- letters[1:8]
apply(x, 2, mean, trim = .2)
col.sums <- apply(x, 2, sum)
row.sums <- apply(x, 1, sum)
rbind(cbind(x, Rtot = row.sums), Ctot = c(col.sums, sum(col.sums)))

stopifnot( apply(x, 2, is.vector))

$#$# Sort the columns of a matrix
apply(x, 2, sort)

$#$# keeping named dimnames
names(dimnames(x)) <- c("row", "col")
x3 <- array(x, dim = c(dim(x),3),
	    dimnames = c(dimnames(x), list(C = paste0("cop.",1:3))))
identical(x,  apply( x,  2,  identity))
identical(x3, apply(x3, 2:3, identity))

$##- function with extra args:
cave <- function(x, c1, c2) c(mean(x[c1]), mean(x[c2]))
apply(x, 1, cave,  c1 = "x1", c2 = c("x1","x2"))

ma <- matrix(c(1:4, 1, 6:8), nrow = 2)
ma
apply(ma, 1, table)  #--> a list of length 2
apply(ma, 1, stats::quantile) # 5 x n matrix with rownames

stopifnot(dim(ma) == dim(apply(ma, 1:2, sum)))

mapply(rep, 1:4, 4:1)

mapply(rep, times = 1:4, x = 4:1)

mapply(rep, times = 1:4, MoreArgs = list(x = 42))

mapply(function(x, y) seq_len(x) + y,
       c(a =  1, b = 2, c = 3),  # names from first
       c(A = 10, B = 0, C = -10))

word <- function(C, k) paste(rep.int(C, k), collapse = "")
utils::str(mapply(word, LETTERS[1:6], 6:1, SIMPLIFY = FALSE)

$## Compute the averages for the variables in 'state.x77', grouped
$## according to the region (Northeast, South, North Central, West) that
$## each state belongs to.
aggregate(state.x77, list(Region = state.region), mean)

$## Compute the averages according to region and the occurrence of more
$## than 130 days of frost.
aggregate(state.x77,
          list(Region = state.region,
               Cold = state.x77[,"Frost"] > 130),
          mean)
$## (Note that no state in 'South' is THAT cold.)


$## example with character variables and NAs
testDF <- data.frame(v1 = c(1,3,5,7,8,3,5,NA,4,5,7,9),
                     v2 = c(11,33,55,77,88,33,55,NA,44,55,77,99) )
by1 <- c("red", "blue", 1, 2, NA, "big", 1, 2, "red", 1, NA, 12)
by2 <- c("wet", "dry", 99, 95, NA, "damp", 95, 99, "red", 99, NA, NA)
aggregate(x = testDF, by = list(by1, by2), FUN = "mean")

$# and if you want to treat NAs as a group
fby1 <- factor(by1, exclude = "")
fby2 <- factor(by2, exclude = "")
aggregate(x = testDF, by = list(fby1, fby2), FUN = "mean")


$## Formulas, one ~ one, one ~ many, many ~ one, and many ~ many:
aggregate(weight ~ feed, data = chickwts, mean)
aggregate(breaks ~ wool + tension, data = warpbreaks, mean)
aggregate(cbind(Ozone, Temp) ~ Month, data = airquality, mean)
aggregate(cbind(ncases, ncontrols) ~ alcgp + tobgp, data = esoph, sum)

$## Dot notation:
aggregate(. ~ Species, data = iris, mean)
aggregate(len ~ ., data = ToothGrowth, mean)

$## Often followed by xtabs():
ag <- aggregate(len ~ ., data = ToothGrowth, mean)
xtabs(len ~ ., data = ag)


$## Compute the average annual approval ratings for American presidents.
aggregate(presidents, nfrequency = 1, FUN = mean)
$## Give the summer less weight.
aggregate(presidents, nfrequency = 1,
          FUN = weighted.mean, w = c(1, 1, 0.5,

          require(stats)
by(warpbreaks[, 1:2], warpbreaks[,"tension"], summary)
by(warpbreaks[, 1],   warpbreaks[, -1],       summary)
by(warpbreaks, warpbreaks[,"tension"],
   function(x) lm(breaks ~ wool, data = x))

$## now suppose we want to extract the coefficients by group
tmp <- with(warpbreaks,
            by(warpbreaks, tension,
               function(x) lm(breaks ~ wool, data = x)))
sapply(tmp, coef)

require(stats); require(graphics)

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
$# compute the list mean for each list element
lapply(x, mean)
$# median and quartiles for each list element
lapply(x, quantile, probs = 1:3/4)
sapply(x, quantile)
i39 <- sapply(3:9, seq) # list of vectors
sapply(i39, fivenum)
vapply(i39, fivenum,
       c(Min. = 0, "1st Qu." = 0, Median = 0, "3rd Qu." = 0, Max. = 0))

$## sapply(*, "array") -- artificial example
(v <- structure(10*(5:8), names = LETTERS[1:4]))
f2 <- function(x, y) outer(rep(x, length.out = 3), y)
(a2 <- sapply(v, f2, y = 2*(1:5), simplify = "array"))
a.2 <- vapply(v, f2, outer(1:3, 1:5), y = 2*(1:5))
stopifnot(dim(a2) == c(3,5,4), all.equal(a2, a.2),
          identical(dimnames(a2), list(NULL,NULL,LETTERS[1:4])))
require(stats)

env <- new.env(hash = FALSE) # so the order is fixed
env$a <- 1:10
env$beta <- exp(-3:3)
env$logic <- c(TRUE, FALSE, FALSE, TRUE)
$# what have we there?
utils::ls.str(env)

$# compute the mean for each list element
       eapply(env, mean)
unlist(eapply(env, mean, USE.NAMES = FALSE))

$# median and quartiles for each element (making use of "..." passing):
eapply(env, quantile, probs = 1:3/4)
eapply(env, quantile)
```

### Extending ----------

`help()`
`??` keyword - search for help

[utils doc](https://www.rdocumentation.org/packages/utils/versions/3.5.3)
`util::Rsitesearch()`
`RShowDoc()`
`utils::help.search()`
`utils::example()`
`utils::dataentry()`
`utils::installed.packages()`
`utils::packageDesciption()`
`utils::askYesorNo`
`utils::help.start()`
trac

- `checkmate::checkAccess` - Check file system access rights
- `checkmate::checkDirectoryExists` - Check for existence and access rights of directories
- `checkmate::checkFileExists` - Check existence and access rights of files
- `checkmate::checkOS` - Check the operating system
- `checkmate::checkPathForOutput` - Check if a path is suited for creating an output file

`file.path(..., fsep = .Platform$file.sep)` Construct the path to a file from components in a platform-independent way.

`system.file()`
`system.time()`
`system()` and `system2()` - run system commands
`choose.dir()`, `file.choose()`, `choose.files()` for opening files.
`sys.sleep()`, `pause()`, `wait(PID)`

referencing tables or data frames -

DataFrame[row, col]

Reference by name:

`> DatePlot[, "weekday"] %>% head()`
[1] "Thursday"  "Friday"    "Sunday"    "Monday"    "Tuesday"   "Wednesday"
`> DatePlot[, "date"] %>% head()`
[1] "2015-01-01" "2015-01-02" "2015-01-04" "2015-01-05" "2015-01-06" "2015-01-07"

Or this way too:

``> DatePlot$date`

Reference by number:
`> DatePlot[1:5, 1:2]`
       Datef Count
1 2015-01-01     3
2 2015-01-02     2
3 2015-01-04     1
4 2015-01-05     1
5 2015-01-06     3

Reference Combination
First get column (returns as a vector) - then get index
`> DatePlot$date[1:5]`
[1] "2015-01-01" "2015-01-02" "2015-01-04" "2015-01-05" "2015-01-06"


```r


myvars <- c("v1", "v2", "v3") # select variables v1, v2, v3
newdata <- mydata[myvars]

myvars <- paste("v", 1:3, sep="")# another method

newdata <- mydata[c(1,5:10)]newdata <- mydata[myvars  $#select 1st and 5th thru 10th variables

> mtcars[1, 2]
[1] 6
> mtcars["Mazda RX4", "cyl"]
[1] 6                     #Moreover, we can use the row and column names instead of the numeric coordinates.
> nrow(mtcars)    # number of data rows
[1] 32               #Lastly, the number of data rows in the data frame is given by the nrow function.
> ncol(mtcars)
[1] 11              ##And the number of columns of a data frame is given by the ncol function.
> mtcars[[9]]
 [1]  1 1 1 0 0 0 0 0 0 0 0 ...
> mtcars[["am"]]   #We can retrieve the same column vector by its name using dbl bracked and "".
 [1]  1 1 1 0 0 0 0 0 0 0 0 ...  #This is the only place a variable works that I've found
 >mycars[[myvariable]]
> mtcars$am   #with the "$" operator in lieu of  double square bracket operator.
 [1]  1 1 1 0 0 0 0 0 0 0 0 ...
Yet another way to retrieve the same column vector is to use the single square bracket "[]" operator. We prepend the column name with a comma character, which signals a wildcard match for the row position.
> mtcars[,"am"]


newdata <- mydata[1:5,] #first 5 observations
newdata <- mydata[ which(mydata$gender=='F' & mydata$age > 65), ] # based on variable values

attach(mydata)
newdata <- mydata[ which(gender=='F' & age > 65),]
detach(mydata)

$#exclude variables v1, v2, v3
myvars <- names(mydata) %in% c("v1", "v2", "v3")
newdata <- mydata[!myvars]

$#exclude 3rd and 5th variable
newdata <- mydata[c(-3,-5)]

$#delete variables v3 and v5
mydata$v3 <- mydata$v5 <- NULL
```

[Reshape a dataframe:](https://www.r-statistics.com/tag/transpose/)

B.added.col[order(lubridate::ymd(B.added.col$Date.of.Surgery)),] -> Set
`D.F[order(D.F$colname),]` -  note the comma at the end.

Dynamic access and other methods.
[Relevant Source](https://stackoverflow.com/questions/18222286/dynamically-select-data-frame-columns-using-and-a-vector-of-column-names)

With: `var <- "mpg"` This doesn't work: `mtcars$var`

These both work, but note that what they return is different the first is a vector, the second is a data.frame

        mtcars[[var]] -> #vector
        mtcars[var] -> #Dataframe *

*Note: This works if var is a variable, but `mtcars[mpg]` does not work. it requires: `mtcars[, mpg]`. Likewise, `mtcars[, var]` doesn't work.

also- dynamically:  ``>>>`$`(df , V1)`` or indeed  ``>>>`$`(df , "V1")``




Random Dataset generated:
        set.seed(123)
        df <- data.frame( col1 = sample(5,10,repl=T) , col2 = sample(5,10,repl=T) , col3 = sample(5,10,repl=T) )

We want to sort by 'col3' then by 'col1'
        sort_list <- c("col3","col1")

Use 'do.call' to call order. Seccond argument in do.call is a list of arguments to pass to the first argument, in this case 'order'. Since  a data.frame is really a list, we just subset the data.frame according to the columns we want to sort in, in that order
            df[ do.call( order , df[ , match( sort_list , names(df) ) ]  ) , ]`

`colnames()` returns a vector of column names, and `rownames()` returns a vector of row names.  Have to be indexed numerically.

colnames()
col.names()
ncols()
rownames() -arrays
row.names() - data.frames - still works bc has a method that calls rownames for an array argument.
nrows()
dimnames()
Note: `variable.names(), case.names(), all.names(), all.vars()` are different things
method::allNames()
make.names()

Find a column -
`var %in% colnames(mtcars)`


make.unique()



#Assuming system package tex4ht is installed, easily convert advanced
#LaTeX tables to html
getHdata(pbc)
s <- summaryM(bili + albumin + stage + protime + sex + age + spiders ~ drug,
              data=pbc, test=TRUE)
w <- latex(s, npct='slash', file='s.tex')
z <- html(w)
browseURL(z$file)


data.frame.create.modify.check	Tips for Creating, Modifying, and Checking Data Frames
data.frame.labelled	Label Attribute of an Object
datadensity	One-Dimensional Scatter Diagram, Spike Histogram, or Density
datadensity.data.frame	One-Dimensional Scatter Diagram, Spike Histogram, or Density
dataframeReduce	Update a Data Frame or Cleanup a Data Frame after Importing
dataRep	Representativeness of Observations in a Data Set
deff	Design Effect and Intra-cluster Correlation
describe	Concise Statistical Description of a Vector, Matrix, Data Frame, or Formula
describe.data.frame	Concise Statistical Description of a Vector, Matrix, Data Frame, or Formula
describe.default	Concise Statistical Description of a Vector, Matrix, Data Frame, or Formula
describe.formula	Concise Statistical Description of a Vector, Matrix, Data Frame, or Formula
describe.matrix	Concise Statistical Description of a Vector, Matrix, Data Frame, or Formula
describe.vector	Concise Statistical Description of a Vector, Matrix, Data Frame, or Formula
dhistboxp	Use plotly to Draw Stratified Spike Histogram and Box Plot Statistics


## Environment

For an environment env, `names(env)` gives the names of the corresponding list, i.e., `names(as.list(env, all.names = TRUE))` which are also given by `ls(env, all.names = TRUE, sorted = FALSE)`. If the environment is used as a hash table, names(env) are its “keys”.
            names(env)
            names(as.list(env, all.names = TRUE))
            ls(env, all.names = TRUE, sorted = FALSE)

        sys.frames()
        sys.frame()
        sys.nframe()
returns the value of where you are

Evaluates in the global namespace

        eval(func, envir=.GlobalEnv)

Get can go grab a global variable.

   `dynGet`(x, ifnotfound = , minframe = 1L, inherits = FALSE)

   `exists`(x, where = -1, envir = , frame, mode = "any",
      inherits = TRUE)

   `get0`(x, envir = pos.to.env(-1L), mode = "any", inherits = TRUE,
   ifnotfound = NULL)

         get0("env.var") # Needs quoted name

   `get`(x, pos = -1, envir = as.environment(pos), mode = "any",
   inherits = TRUE)

   `mget`(x, envir = as.environment(-1), mode = "any", ifnotfound,
   inherits = FALSE)

Get, set, test for and create environments.

Usage:

   `environment(fun = NULL)`\
   `environment(fun) <- value`

   `is.environment(x)`

   `.GlobalEnv`\
   `globalenv()`\
   `.BaseNamespaceEnv`

   `emptyenv()`\
   `baseenv()`

   `new.env`(hash = TRUE, parent = parent.frame(), size = 29L)

   `parent.env(env)`\
   `parent.env(env)` <- value

   `environmentName(env)`

   `env.profile(env)`
`
Arguments

- `fun` - a function, a formula, or NULL, which is the default.
- `value` - an environment to associate with the function
- `x` - an arbitrary R object.
- `hash` - a logical, if TRUE the environment will use a hash table.
- `parent` - an environment to be used as the enclosure of the environment created.
env an environment
env.var <- get0(env.var, pos= -1, envir = as.environment(pos))
#note the as.environment(-1)
Arguments


x
a variable name (given as a character string).

where
where to look for the object (see the details section); if omitted, the function will search as if the name of the object appeared unquoted in an expression.

envir
an alternative way to specify an environment to look in, but it is usually simpler to just use the where argument.

frame
a frame in the calling list. Equivalent to giving where as sys.frame(frame).

mode
the mode or type of object sought: see the ‘Details’ section.

inherits
should the enclosing frames of the environment be searched?

ifnotfound
the return value of get0(x, *) when x does not exist.

The pos argument can specify the environment in which to look for the object in any of several ways: as a positive integer (the position in the search list); as the character string name of an element in the search list; or as an environment (including using sys.frame to access the currently active function calls). The default of -1 indicates the current environment of the call to get. The envir argument is an alternative way to specify an environment.

These functions look to see if each of the name(s) x have a value bound to it in the specified environment. If inherits is TRUE and a value is not found for x in the specified environment, the enclosing frames of the environment are searched until the name x is encountered. See environment and the ‘R Language Definition’ manual for details about the structure of environments and their enclosures.

```r
[R(5.3)~19:105:17:47:20]~/ECHOICU3>sys.frames()
NULL
[R(5.3)~19:105:17:48:34]~/ECHOICU3>sys.frame()
<environment: R_GlobalEnv>
[R(5.3)~19:105:17:48:45]~/ECHOICU3>sys.nframe()
[1] 0
```

## Dates and Times
Character input is first converted to class "POSIXlt" by strptime: numeric input is first converted to "POSIXct". Any conversion that needs to go between the two date-time classes requires a time zone: conversion from "POSIXlt" to "POSIXct" will validate times in the selected time zone. One issue is what happens at transitions to and from DST, for example in the UK

!!!tip There are two basic classes of date/times.  (`POSIXct`, `POSIXlt`) and their parent abstract class `POSIXt`

    Class **"POSIXct"** represents the (signed) number of seconds since the beginning of 1970 (in the UTC time zone) as a numeric vector.

    Class **"POSIXlt"** is a named list of vectors representing
    - _sec_ - 0–61: seconds.
    -
    - _min_ - 0–59: minutes.

    - _hour_ - 0–23: hours.

    - _mday_ - 1–31: day of the month

    - _mon_ - 0–11: months after the first of the year.

    - _year_ - years since 1900.

    - _wday_ - 0–6 day of the week, starting on Sunday.

    - _yday_ - 0–365: day of the year.

    - _isdst_ - Daylight Saving Time flag. Positive if in force, zero if not, negative if unknown.

    - _zone_ - (Optional.) The abbreviation for the time zone in force at that time: "" if unknown (but "" might also be used for UTC).

    - _gmtoff_ - (Optional.) The offset in seconds from GMT: positive values are East of the meridian. Usually NA if unknown, but 0 could mean unknown.

"POSIXct" is more convenient for including in data frames, and "POSIXlt" is closer to human-readable forms. A virtual class "POSIXt" exists from which both of the classes inherit: it is used to allow operations such as subtraction to mix the two classes.


Conversion to and from Character Representations

- `%a` - Abbreviated weekday name in the current locale on this platform. (Also matches full name on input: in some locales there are no abbreviations of names.)

- `%A` - Full weekday name in the current locale. (Also matches abbreviated name on input.)

- `%b` - Abbreviated month name in the current locale on this platform. (Also matches full name on input: in some locales there are no abbreviations of names.)

- `%B` - Full month name in the current locale. (Also matches abbreviated name on input.)

- `%c` - Date and time. Locale-specific on output, `%a %b %e %H:%M:%S %Y` on input.

- `%C` - Century (00–99): the integer part of the year divided by 100.

- `%d` - Day of the month as decimal number (01–31).

- `%D` - Date format such as `%m/%d/%y`: the C99 standard says it should be that exact format (but not all OSes comply).

- `%e` - Day of the month as decimal number (1–31), with a leading space for a single-digit number.

- `%F` - Equivalent to `%Y-%m-%d` (the ISO 8601 date format).

- `%g` - The last two digits of the week-based year (see `%V`). (Accepted but ignored on input.)

- `%G` - The week-based year (see `%V`) as a decimal number. (Accepted but ignored on input.)

- `%h` - Equivalent to `%b`.

- `%H` - Hours as decimal number (00–23). As a special exception strings such as 24:00:00 are accepted for input, since ISO 8601 allows these.

- `%I` - Hours as decimal number (01–12).

- `%j` - Day of year as decimal number (001–366).

- `%m` - Month as decimal number (01–12).

- `%M` - Minute as decimal number (00–59).

- `%n` - Newline on output, arbitrary whitespace on input.

- `%p` - AM/PM indicator in the locale. Used in conjunction with `%I` and not with `%H`. An empty string in some locales (for example on some OSes, non-English European locales including Russia). The behaviour is undefined if used for input in such a locale.

Some platforms accept `%P` for output, which uses a lower-case version (`%p` may also use lower case): others will output P.

- `%r` - For output, the 12-hour clock time (using the locale's AM or PM): only defined in some locales, and on some OSes misleading in locales which do not define an AM/PM indicator. For input, equivalent to `%I:%M:%S %p`.

- `%R` - Equivalent to `%H:%M`.

- `%S` - Second as integer (00–61), allowing for up to two leap-seconds (but POSIX-compliant implementations will ignore leap seconds).

- `%t` - Tab on output, arbitrary whitespace on input.

- `%T` - Equivalent to `%H:%M:%S`.

- `%u` - Weekday as a decimal number (1–7, Monday is 1).

- `%U` - Week of the year as decimal number (00–53) using Sunday as the first day 1 of the week (and typically with the first Sunday of the year as day 1 of week 1). The US convention.

- `%V` - Week of the year as decimal number (01–53) as defined in ISO 8601. If the week (starting on Monday) containing 1 January has four or more days in the new year, then it is considered week 1. Otherwise, it is the last week of the previous year, and the next week is week 1. (Accepted but ignored on input.)

- `%w` - Weekday as decimal number (0–6, Sunday is 0).

- `%W` - Week of the year as decimal number (00–53) using Monday as the first day of week (and typically with the first Monday of the year as day 1 of week 1). The UK convention.

- `%x` - Date. Locale-specific on output, `%y/%m/%d` on input.

- `%X` - Time. Locale-specific on output, `%H:%M:%S` on input.

- `%y` - Year without century (00–99). On input, values 00 to 68 are prefixed by 20 and 69 to 99 by 19 – that is the behaviour specified by the 2004 and 2008 POSIX standards, but they do also say ‘it is expected that in a future version the default century inferred from a 2-digit year will change’.

- `%Y` - Year with century. Note that whereas there was no zero in the original Gregorian calendar, ISO 8601:2004 defines it to be valid (interpreted as 1BC): see https://en.wikipedia.org/wiki/0_(year). Note that the standards also say that years before 1582 in its calendar should only be used with agreement of the parties involved.

For input, only years 0:9999 are accepted.

- `%z` - Signed offset in hours and minutes from UTC, so -0800 is 8 hours behind UTC. Values up to +1400 are accepted. (Standard only for output. For input R currently supports it on all platforms.)

- `%Z` - (Output only.) Time zone abbreviation as a character string (empty if not available). This may not be reliable when a time zone has changed abbreviations over the years.

Not in the standards and **less widely implemented** are

- `%k` - The 24-hour clock time with single digits preceded by a blank.

- `%l` - The 12-hour clock time with single digits preceded by a blank.

- `%s` - (Output only.) The number of seconds since the epoch.

- `%+` - (Output only.) Similar to `%c`, often `%a %b %e %H:%M:%S %Z %Y`. May depend on the locale.


Relevant Packages

lubridate-
- `DescTools` - Zoo

lubridate has these methods:

lubridate::interval		Utilities for creation and manipulation of 'Interval' objects
lubridate::%m+%		Add and subtract months to a date without exceeding the last day of the new month


has functions to class all sorts of formats- `ymd()`, `mdy()`, `my()`, `dmy()` etc.

`B.added.col[order(lubridate::ymd(B.added.col$Date.of.Surgery)),] -> Set`
`Pre <- Set[Set$Date.of.Surgery <= lubridate::ymd("2016-06-30"),]`

as.Date() - convert to date time object.

Set$date <- as.Date(lubridate::ymd(Set$Date.of.Surgery))

Year(x)
Quarter(x)
Month(x, fmt = c("m", "mm", "mmm"), lang = DescToolsOptions("lang"),
      stringsAsFactors = TRUE)
Week(x, method = c("iso", "us"))
Day(x)
Weekday(x, fmt = c("d", "dd", "ddd"), lang = DescToolsOptions("lang"),
        stringsAsFactors = TRUE)
YearDay(x)
YearMonth(x)

Day(x) <- value

IsWeekend(x)
IsLeapYear(x)

Hour(x)
Minute(x)
Second(x)
Timezone(x)

Now()
Today()

DiffDays360(start_d, end_d, method = c("eu", "us"))
LastDayOfMonth(x)

zoo-

yearmon()

```r
initial$DOS.original %>% as.numeric() %>% as.Date(origin = '1899-12-30', format="%m-%d-%Y")  -> initial$DOS
initial$DOS %>%  format.Date(format="%m-%d-%Y")  -> initial$DOS.c
initial$DOS %>% as.Date(format="%m-%d-%Y") %>% as.POSIXct.Date() ->initial$DOS.PSXct
initial$DOS %>% as.Date(format="%m-%d-%Y") %>% as.POSIXlt.Date() ->initial$DOS.PSXlt
> head(initial$DOS.PSXct)
[1] "2014-12-31 18:00:00 CST" "2014-12-31 18:00:00 CST" "2014-12-31 18:00:00 CST" "2015-01-01 18:00:00 CST" "2015-01-01 18:00:00 CST" "2015-01-03 18:00:00 CST"
> head(initial$DOS.PSXlt)
[1] "2015-01-01 UTC" "2015-01-01 UTC" "2015-01-01 UTC" "2015-01-02 UTC" "2015-01-02 UTC" "2015-01-04 UTC"


initial$DOS %>% as.POSIXlt.Date(tz=Sys.timezone()) ->initial$DOS.PSXlt
initial$DOS %>% as.POSIXct(tz=Sys.timezone()) ->initial$DOS.PSXct2
initial$DOS %>% as.POSIXct(tz="CDT") ->initial$DOS.2PSXct2
initial$DOS %>% as.POSIXct(tz="CST") ->initial$DOS.3PSXct2
initial$DOS %>% as.POSIXct(tz="UTC") ->initial$DOS.4PSXct2
initial$DOS %>% as.POSIXct() ->initial$DOS.5PSXct2
initial$DOS.PSXlt %>% as.POSIXct.POSIXlt() ->initial$DOS.PSXct3
```
!!!warning Note the error introduced by timezone.
#Many of these classes exist in several packages, so they need to be referenced that way.

```r
if(class(df$DOS)!="Date"){df$DOS %>% mdy() -> df$DOS}

Set <- read.csv("https://raw.githubusercontent.com/selva86/datasets/master/yahoo.csv")
t$date <- as.Date(lubridate::ymd(Set$Date.of.Surgery))
Set$yearmonth <- as.yearmon(Set$date)
Set$yearmonthf <- factor(Set$yearmonth)
Set$week <- lubridate::week(Set$Date.of.Surgery)
Set <- ddply(Set, .(yearmonthf), transform, monthweek=1+ week - min(week)) #compute week number
lubridate::quarter(Set$date) -> Set$quarter
data.table::as.IDate(Set$date) -> Set$idate
Set$date %>% base::weekdays(., abbreviate=FALSE) -> Set$weekday
Set$date %>% base::weekdays(., abbreviate=TRUE) -> Set$wkd
Set$date %>% lubridate::quarter(., with_year = TRUE, fiscal_start = 10) -> Set$FQ
```

## apply()

apply(D.F, 2, typeof) - calculate the type by columns
apply(D.F, 1, mean) - calculate the mean by rows.


## Matching things

`startsWith` for particular checking of initial matches; `grep` etc for more general (regexp) matching of strings.
`pmatch`
`%in%`
`match` These are equivalent
    match(x, table, nomatch = NA_integer_, incomparables = NULL)
    x %in% table
`charmatch`
is.element
union(x, y)
intersect(x, y)
setdiff(x, y)
setdiff(y, x)
setequal(x, y)
        > intersect("date", colnames(DatePlot))
        [1] "date"
        > is.element("date", colnames(DatePlot))
        [1] TRUE
        > charmatch("date", colnames(DatePlot))
        [1] 3
        > match("date", colnames(DatePlot))
        [1] 3
-these search the environment- like ls.  Not a vector like expected.

apropos(what, where = FALSE, ignore.case = TRUE, mode = "any") - returns a character vector giving the names of objects in the search list matching (as a regular expression) what.

find(what, mode = "any", numeric = FALSE, simple.words = TRUE) - find() returns where objects of a given name can be found.

A trick to search-

```r
factor(tf)-> tff
levels(tff)
tff==levels(tff)[2]
c(1:133)->count
c(1:133)[tff==levels(tff)[2]]


whereis<- function(sequence, findwhat=""){
   return( c(1:length(sequence))[sequence==findwhat] )
}


whereis(types[5,],"date")
replace(tlst, whereis(tlst, "date"), "Date")

stringi::stri_locate_all_fixed(type.string[5], "D")
stringi::stri_replace_all_fixed(type.string[5], "D", "c") -> type.string[6]


>#Replacing values
xlstypes[c(1:length(xlstypes))[xlstypes=="text"]] <- "character"
xlstypes[c(1:length(xlstypes))[xlstypes=="date"]]<-"Date"

lenght(xlstypes) #number of len
c(1:length(xlstypes)) #1: len
c(1:length(xlstypes))[xlstypes=="text"] #Keep values with matches (TRUE)
xlstypes[c(1:length(xlstypes))[xlstypes=="text"]] #Access those values "text" "text" "text"
xlstypes[c(1:length(xlstypes))[xlstypes=="text"]] <- "character" #and replace
```

### Opening a file


The first nine functions create connections. By default the connection is not opened (except for a socketConnection), but may be opened by setting a non-empty value of argument open.

The intention is that file and gzfile can be used generally for text input (from files, http:// and https:// URLs) and binary input respectively.

A maximum of 128 connections can be allocated (not necessarily open) at any one time. Three of these are pre-allocated (see stdout). The OS will impose limits on the numbers of connections of various types, but these are usually larger than 125.

`file(description = "", open = "", blocking = TRUE, encoding = getOption("encoding"), raw = FALSE, method = getOption("url.method", "default"))` For file the description is a path to the file to be opened or a complete URL (when it is the same as calling url), or "" (the default) or "clipboard" (see the ‘Clipboard’ section). Use "stdin" to refer to the C-level ‘standard input’ of the process (which need not be connected to anything in a console or embedded version of R, and is not in RGui on Windows). See also stdin() for the subtly different R-level concept of stdin.

`url(description, open = "", blocking = TRUE, encoding = getOption("encoding"), method = getOption("url.method", "default"))` For url the description is a complete URL including scheme (such as http://, https://, ftp:// or file://). Method "internal" is that available since connections were introduced, method "wininet" is only available on Windows (it uses the WinINet functions of that OS) and method "libcurl" (using the library of that name: http://curl.haxx.se/libcurl/) is required on a Unix-alike but optional on Windows. Method "default" uses method "internal" for file: URLs and "libcurl" for ftps: URLs. On a Unix-alike it uses "libcurl" for http:, https: and ftp: URLs; on Windows "wininet" for http:, ftp: and https: URLs. Proxies can be specified: see download.file

`gzfile(description, open = "", encoding = getOption("encoding"), compression = 6)`

`bzfile(description, open = "", encoding = getOption("encoding"), compression = 9)`
`xzfile(description, open = "", encoding = getOption("encoding"), compression = 6)`

`unz(description, filename, open = "", encoding = getOption("encoding"))`

`pipe(description, open = "", encoding = getOption("encoding"))`

`fifo(description, open = "", blocking = FALSE,  encoding = getOption("encoding"))` If for a file or (on most platforms) a fifo connection the description is "", the file/fifo is immediately opened (in "w+" mode unless open = "w+b" is specified) and unlinked from the file system. This provides a temporary file/fifo to write to and then read from.

`socketConnection(host = "localhost", port, server = FALSE, blocking = FALSE, open = "a+", encoding = getOption encoding"), timeout = getOption("timeout"))`

open, close and seek are generic functions: the following applies to the methods relevant to connections.

`open(con, ...)` open opens a connection. In general functions using connections will open them if they are not open, but then close them again, so to leave a connection open call open explicitly.
## S3 method for class 'connection'
`open(con, open = "r", blocking = TRUE, ...)`

`close(con, ...)` close closes and destroys a connection. This will happen automatically in due course (with a warning) if there is no longer an R object referring to the connection.
## S3 method for class 'connection'
`close(con, type = "rw", ...)`

`flush(con)` - flush flushes the output stream of a connection open for write/append (where implemented, currently for file and clipboard connections, stdout and stderr).


`isOpen(con, rw = "")`

`isIncomplete(con)`


Arguments

- _description_ - character string. A description of the connection: see ‘Details’.
- _open_ - character string. A description of how to open the connection (if it should be opened initially). See section ‘Modes’ for possible values.
- _blocking_ - logical. See the ‘Blocking’ section.
- _encoding_ - The name of the encoding to be assumed. See the ‘Encoding’ section.
- _raw_ - logical. If true, a ‘raw’ interface is used which will be more suitable for arguments which are not regular files, e.g. character devices. This suppresses the check for a compressed file when opening for text-mode reading, and asserts that the ‘file’ may not be seekable.
- _method_ - character string, partially matched to c("default", "internal", "wininet", "libcurl"): see ‘Details’.
- _compression_ - integer in 0–9. The amount of compression to be applied when writing, from none to maximal available. For xzfile can also be negative: see the ‘Compression’ section.
- _timeout_ - numeric: the timeout (in seconds) to be used for this connection. Beware that some OSes may treat very large values as zero: however the POSIX standard requires values up to 31 days to be supported.
- _filename_ - a filename within a zip file.
- _host_ - character string. Host name for the port.
- _port_ - integer. The TCP port number.
- _server_ - logical. Should the socket be a client or a server?
- _con_ - a connection.
- _type_ - character string. Currently ignored.
- _rw_ - character string. Empty or "read" or "write", partial matches allowed.
- _..._ - arguments passed to or from other methods.

`tempfile(pattern = "file", tmpdir = tempdir(), fileext = "")` tempfile returns a vector of character strings which can be used as names for temporary files.

  - _pattern_ a non-empty character vector giving the initial part of the name.
  - _tmpdir_ a non-empty character vector giving the directory name
  - _fileext_ a non-empty character vector giving the file extension
  - _check_ logical indicating if tmpdir() should be checked and recreated if no longer valid.





`tempdir(check = FALSE)`


`unlink(x, recursive = FALSE, force = FALSE)` unlink deletes the file(s) or directories specified by x.


- "r" or "rt" -Open for reading in text mode.
- "w" or "wt" - Open for writing in text mode.
- "a" or "at" -Open for appending in text mode.
- "rb"-Open for reading in binary mode.
- "wb" -Open for writing in binary mode.
- "ab" - Open for appending in binary mode.
- "r+", "r+b" - Open for reading and writing.
- "w+", "w+b" - Open for reading and writing, truncating file initially.
- "a+", "a+b" -Open for reading and appending.

Not all modes are applicable to all connections


These functions provide a low-level interface to the computer's file system.

`file.create(..., showWarnings = TRUE)`
`file.exists(...)`
`file.remove(...)`
`file.rename(from, to)`
`file.append(file1, file2)`
`file.copy(from, to, overwrite = recursive, recursive = FALSE, copy.mode = TRUE, copy.date = FALSE)`
`file.symlink(from, to)`
`file.link(from, to)`
`Sys.junction(from, to)`

Arguments

_...,_ _file1,_ _file2_
character vectors, containing file names or paths.
_from_, _to_  character vectors, containing file names or paths. For file.copy and file.symlink and Sys.junction to can alternatively be the path to a single existing directory.
_overwrite_ logical; should existing destination files be overwritten?
_showWarnings_ logical; should the warnings on failure be shown?
_recursive_ logical. If to is a directory, should directories in from be copied (and their contents)? (Like cp -R on POSIX OSes.)
_copy.mode_ logical: should file permission bits be copied where possible?
_copy.date_  logical: should file dates be preserved where possible? See Sys.setFileTime.


`path.expand(path)` Expand a path name, for example by replacing a leading tilde by the user's home directory (if defined on that platform).
Convert file paths to canonical form for the platform, to display them in a user-understandable form and so that relative and absolute paths can be compared.

`normalizePath(path, winslash = "\\", mustWork = NA)` Arguments:
        _path_ - character vector of file paths.
        _winslash_ - the separator to be used on Windows – ignored elsewhere. Must be one of c("/", "\\").
        _mustWork_ - logical: if TRUE then an error is given if the result cannot be determined; if NA then a warning.

`shortPathName(path)` - Convert file paths to the short form. This is an interface to the Windows API call GetShortPathName.

- `file.info`
  - `file.info(..., extra_cols = TRUE)`
  - `file.mode(...)`
  - `file.mtime(...)`
  - `file.size(...)`
- `file.access`
  - file.access(names, mode = 0)
    - 0 test for existence.
    - 1 test for execute permission.
    - 2 test for write permission.
    - 4 test for read permission.
- `file.path`
- `file.show`
- `list.files` default recursive=FALSE
- `list.dirs()` - default recursive = TRUE
- `unlink` (?delete?) Warning
- `basename`
- `path.expand`
- `dir.create`
- `Sys.glob` to expand wildcards in file specifications.
- `file_test`
- `Sys.readlink` (for ‘symlink’s).
- `dir()` list current directory
- `rename("initial.name", "new.name")`
- `unzip()`

```r
cat("file A\n", file = "A")
cat("file B\n", file = "B")
file.append("A", "B")
file.create("A") # (trashing previous)
file.append("A", rep("B", 10))
if(interactive()) file.show("A") # -> the 10 lines from 'B'
file.copy("A", "C")
dir.create("tmp")
file.copy(c("A", "B"), "tmp")
list.files("tmp") # -> "A" and "B"
unlink("tmp", recursive = TRUE)
file.remove("A", "B", "C")
read_file(file.path(R.home("doc"), "AUTHORS"))
read_file_raw(file.path(R.home("doc"), "AUTHORS"))
write_file(x, tmp)

zzfil <- tempfile(fileext=".data")
zz <- file(zzfil, "w")  # open an output file connection
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
cat("One more line\n", file = zz)
close(zz)
readLines(zzfil)
unlink(zzfil)

zzfil <- tempfile(fileext=".gz")
zz <- gzfile(zzfil, "w")  # compressed file
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
close(zz)
readLines(zz <- gzfile(zzfil))
close(zz)
unlink(zzfil)
zz # an invalid connection

zzfil <- tempfile(fileext=".bz2")
zz <- bzfile(zzfil, "w")  # bzip2-ed file
cat("TITLE extra line", "2 3 5 7", "", "11 13 17", file = zz, sep = "\n")
close(zz)
zz # print() method: invalid connection
print(readLines(zz <- bzfile(zzfil)))
close(zz)
unlink(zzfil)

$##An example of a file open for reading and writing
Tpath <- tempfile("test")
Tfile <- file(Tpath, "w+")
c(isOpen(Tfile, "r"), isOpen(Tfile, "w")) # both TRUE
cat("abc\ndef\n", file = Tfile)
readLines(Tfile)
seek(Tfile, 0, rw = "r") # reset to beginning
readLines(Tfile)
cat("ghi\n", file = Tfile)
readLines(Tfile)
Tfile # -> print() :  "valid" connection
close(Tfile)
Tfile # -> print() :  "invalid" connection
unlink(Tpath)

$##We can do the same thing with an anonymous file.
Tfile <- file()
cat("abc\ndef\n", file = Tfile)
readLines(Tfile)
close(Tfile)

$##Not run: $##fifo example -- may hang even with OS support for fifos
if(capabilities("fifo")) {
  zzfil <- tempfile(fileext="-fifo")
  zz <- fifo(zzfil, "w+")
  writeLines("abc", zz)
  print(readLines(zz))
  close(zz)
  unlink(zzfil)
}
$##End(Not run)

$##Not run:
$##Two R processes communicating via non-blocking sockets
$# R process 1
con1 <- socketConnection(port = 6011, server = TRUE)
writeLines(LETTERS, con1)
close(con1)

$# R process 2
con2 <- socketConnection(Sys.info()["nodename"], port = 6011)
$# as non-blocking, may need to loop for input
readLines(con2)
while(isIncomplete(con2)) {
   Sys.sleep(1)
   z <- readLines(con2)
   if(length(z)) print(z)
}
close(con2)

$$#$#examples of use of encodings
$# write a file in UTF-8
cat(x, file = (con <- file("foo", "w", encoding = "UTF-8"))); close(con)
$# read a 'Windows Unicode' file
A <- read.table(con <- file("students", encoding = "UCS-2LE")); close(con)
```
**system()**

`system(command, intern = FALSE, ignore.stdout = FALSE, ignore.stderr = FALSE, wait = TRUE, input = NULL, show.output.on.console = TRUE, minimized = FALSE, invisible = TRUE, timeout = 0)` - system invokes the OS command specified by command.

Arguments
  - _command_ - the system command to be invoked, as a character string.
  - _intern_ - a logical (not NA) which indicates whether to capture the output of the command as an R character vector.
  - _ignore.stdout, ignore.stderr_ - a logical (not NA) indicating whether messages written to ‘stdout’ or ‘stderr’ should be ignored.
  - _wait_ - a logical (not NA) indicating whether the R interpreter should wait for the command to finish, or run it asynchronously. This will be ignored (and the interpreter will always wait) if intern = TRUE.
  - _input_ - if a character vector is supplied, this is copied one string per line to a temporary file, and the standard input of command is redirected to the file.
  - _timeout_ - timeout in seconds, ignored if 0. This is a limit for the elapsed time running command in a separate process. Fractions of seconds are ignored.
  - _show.output.on.console_ - logical (not NA), indicates whether to capture the output of the command and show it on the R console (not used by Rterm, which shows the output in the terminal unless wait is false).
  - _minimized_ - logical (not NA), indicates whether a command window should be displayed initially as a minimized window.
  - _invisible_ - logical (not NA), indicates whether a command window should be visible on the screen.

This interface has become rather complicated over the years: see `system2` for a more portable and flexible interface which is recommended for new code.

There are many pitfalls in using system to ascertain if a command can be run — `Sys.which` is more suitable.

**system2()**

`system2(command, args = character(), stdout = "", stderr = "", stdin = "", input = NULL, env = character(), wait = TRUE,minimized = FALSE, invisible = TRUE, timeout = 0)` - system2 invokes the OS command specified by command.

Unlike system, command is always quoted by `shQuote`, so it must be a single command without arguments.

Arguments

    - _command_ - the system command to be invoked, as a character string.
    - _args_ - a character vector of arguments to command.
    - _stdout, stderr_ - where output to ‘stdout’ or ‘stderr’ should be sent. Possible values are "", to the R console (the default), NULL or FALSE (discard output), TRUE (capture the output in a character vector) or a character string naming a file.
    - _stdin_ - should input be diverted? "" means the default, alternatively a character string naming a file. Ignored if input is supplied.
    - _input_ - if a character vector is supplied, this is copied one string per line to a temporary file, and the standard input of command is redirected to the file.
    - _env_ - character vector of name=value strings to set environment variables.
    - _wait_ - a logical (not NA) indicating whether the R interpreter should wait for the command to finish, or run it asynchronously. This will be ignored (and the interpreter will always wait) if stdout = TRUE or stderr = TRUE.
    - _timeout_ - timeout in seconds, ignored if 0. This is a limit for the elapsed time running command in a separate process. Fractions of seconds are ignored.
    - _minimized_ - logical (not NA), indicates whether the command window should be displayed initially as a minimized window.
    - _invisible_ - logical (not NA), indicates whether the command window should be visible on the screen.



```r
># launch an editor, wait for it to quit
>## Not run: system("notepad myfile.txt")
># launch your favourite shell:
>## Not run: system(Sys.getenv("COMSPEC"))
>## Not run:
>## note the two sets of quotes here:
system(paste('"c:/Program Files/Mozilla Firefox/firefox.exe"',
             '-url cran.r-project.org'), wait = FALSE)
```

Quote Strings for Use in OS Shells


`shQuote(string, type = c("sh", "csh", "cmd", "cmd2"))`  - Quote a string to be passed to an operating system shell.

- _string_ - a character vector, usually of length one.
- _type_ - character: the type of shell quoting. Partial matching is supported. "cmd" and "cmd2" refer to the Windows shell. "cmd" is the default under Windows.
Details

The default type of quoting supported under Unix-alikes is that for the Bourne shell sh. If the string does not contain single quotes, we can just surround it with single quotes.

```r
test <- "abc$def`gh`i\\j"
cat(shQuote(test), "\n")
>##Not run: system(paste("echo", shQuote(test)))
test <- "don't do it!"
cat(shQuote(test), "\n")

tryit <- paste("use the", sQuote("-c"), "switch\nlike this")
cat(shQuote(tryit), "\n")
>##Not run: system(paste("echo", shQuote(tryit)))
cat(shQuote(tryit, type = "csh"), "\n")

>##Windows-only example, assuming cmd.exe:
perlcmd <- 'print "Hello World\\n";'
>##Not run:
shell(shQuote(paste("perl -e",
                    shQuote(perlcmd, type = "cmd")),
              type = "cmd2"))

>##End(Not run)
```


### Data Frame Manipulation

add_columns(), replace_crolumns()

set_na()
replace_na()

#### accessing another environment
```r
clear <-function(){
   rm(list=ls(envir = globalenv()), envir = globalenv())
   return(TRUE)
}
```

### Get the outside function name

`sys.function(sys.parent())`
match.call()
match.arg()
match.fun()
sys.call()

match, charmatch and match.arg, match.fun, match.call, for function argument matching etc

variable.names()
case.names()
all.names() -doesn't work like I expect- however- allNames() does
        `all.names(expression(sin(x+y)))` ->>>  [1] "sin" "+"   "x"   "y"
all.vars() --> `all.vars(expression(sin(x+y))) ->>>  [1] "x"   "y"`

 `findInterval` similarly returns a vector of positions, but finds numbers within intervals, rather than exact matches.
approx(*, method = "constant") which is a generalization of findInterval(
#### downloading a file

`utils::download.file('https://cran.rstudio.com/bin/windows/Rtools/Rtools35.exe', destfile = 'D:/ASUSsync/R/Rtools35.exe')`

#### Error Handling

Some sample code

```r
tryCatch.W.E <- function(expr)
{
    W <- NULL
    w.handler <- function(w){ # warning handler
	W <<- w
	invokeRestart("muffleWarning")
    }
    list(value = withCallingHandlers(tryCatch(expr, error = function(e) e),
				     warning = w.handler),
	 warning = W)
}

#used--
str( tryCatch.W.E( log( 2 ) ) )
str( tryCatch.W.E( log( -1) ) )
str( tryCatch.W.E( log("a") ) )
```

### String manipulation


[Long and good source](https://www.gastonsanchez.com/Handling_and_Processing_Strings_in_R.pdf)

```r
> RStudio.Version()$citation -> s
> format(s)
[1] "To cite RStudio in publications use:"
[2] "  RStudio Team (2016). RStudio: Integrated Development for R. RStudio, Inc., Boston, MA URL http://www.rstudio.com/.\n\nA BibTeX entry for LaTeX users is\n\n  @Manual{,\n    title = {RStudio: Integrated Development Environment for R},\n    author = {{RStudio Team}},\n    organization = {RStudio, Inc.},\n    address = {Boston, MA},\n    year = {2016},\n    url = {http://www.rstudio.com/},\n  }"
[3] ""
> format(s)[2]
[1] "  RStudio Team (2016). RStudio: Integrated Development for R. RStudio, Inc., Boston, MA URL http://www.rstudio.com/.\n\nA BibTeX entry for LaTeX users is\n\n  @Manual{,\n    title = {RStudio: Integrated Development Environment for R},\n    author = {{RStudio Team}},\n    organization = {RStudio, Inc.},\n    address = {Boston, MA},\n    year = {2016},\n    url = {http://www.rstudio.com/},\n  }"
> strsplit(format(s)[2], '\n')
[[1]]
 [1] "  RStudio Team (2016). RStudio: Integrated Development for R. RStudio, Inc., Boston, MA URL http://www.rstudio.com/."
 [2] ""
 ...[12]

> strsplit(format(s)[2], '\n')[1]
[[1]]
 [1] "  RStudio Team (2016). RStudio: Integrated Development for R. RStudio, Inc., Boston, MA URL http://www.rstudio.com/."
 [2] ""

> rm(s)
stringi::stri_locate_all_fixed(type.string[5], "D")
```

#### Printing Text

`print()`

`sprintf()`

`sprintf("The initial data contains %d entries, of which %d are unique, the new data contains %d entries, of which %d are unique.", length(Av), length(levels(Av)),length(Bv), length(levels(Bv)))`

a decimal might be written as `%.4f` for 4 points after the decimal.


- `d`, `i` - Integer value  Numeric variables with exactly integer values will be coerced to integer. Formats d and i can also be used for logical variables, which will be converted to 0, 1 or NA.
- `o` - octal
- `x`, `X` - hexadecimal (using the same case for a-f as the code).
- `f` - Double precision value, in “fixed point” decimal notation of the form `"[-]mmm.ddd"`. The number of decimal places ("d") is specified by the precision: the default is 6; a precision of 0 suppresses the decimal point.
- `e`, `E` - Double precision value, in “exponential” decimal notation of the form `[-]m.ddde[+-]xx` or `[-]m.dddE[+-]xx`.
- `g`, `G` - Double precision value, in `%e` or `%E` format if the exponent is less than -4 or greater than or equal to the precision, and `%f` format otherwise. (The precision **(default 6)** specifies the number of significant digits here, whereas in `%f`, `%e`, it is the number of digits after the decimal point.)
- `a`, `A` - Double precision value, in binary notation of the form `[-]0xh.hhhp[+-]d`. This is a binary fraction expressed in hex multiplied by a (decimal) power of 2.
- `s` - Character string. Character NAs are converted to "NA".
- `%` - Literal % (none of the extra formatting characters given below are permitted in this case).

In addition, between the initial % and the terminating conversion character there may be, in any order:

`m.n` Two numbers separated by a period, denoting the field width (m) and the precision (n).

`-` - Left adjustment of converted argument in its field.

`+` - Always print number with sign: by default only negative numbers are printed with a sign.

` ` [[Space]] Prefix a space if the first character is not a sign.

`0` - For numbers, pad to the field width with leading zeros. For characters, this zero-pads on some platforms and is ignored on others.

`#` - specifies “alternate output” for numbers, its action depending on the type: For x or X, 0x or 0X will be prefixed to a non-zero result. For `e`, `e`, `f`, `g` and `G`, the output will always have a decimal point; for `g` and `G`, trailing zeros will not be removed.
- #`$` immediately after `%` may come `1$` to `99$` to refer to a numbered argument


## Data Import

It is often necessary to import sample textbook data into R before you start working on your homework.

### Excel File
Quite frequently, the sample data is in Excel format, and needs to be imported into R prior to use. For this, we can use the function read.xls from the gdata package. It reads from an Excel spreadsheet and returns a data frame. The following shows how to load an Excel spreadsheet named "mydata.xls". This method requires Perl runtime to be present in the system.

```r
> library(gdata)                   # load gdata package
> help(read.xls)                   # documentation
> mydata = read.xls("mydata.xls")  # read from first sheet
```

Alternatively, we can use the function loadWorkbook from the XLConnect package to read the entire workbook, and then load the worksheets with readWorksheet. The XLConnect package requires Java to be pre-installed.

```r
> library(XLConnect)               # load XLConnect package
> wk = loadWorkbook("mydata.xls")
> df = readWorksheet(wk, sheet="Sheet1")
```

Packages -

    readxl - part of the tidyverse
    xlsx
    others
```r
fileName = "./LongNames-all.txt"
con <- file(fileName, open = 'rt') #must be text
utils::read.delim(con, header=T, sep=",", check.names=T, col.names = T, blank.lines.skip = T, stringsAsFactors = F, nrows =2 )   -> names2.long
utils::read.delim(con, header=T, sep=",", check.names=F, as.is = T, col.names = T, blank.lines.skip = T, stringsAsFactors = F, nrows =2 )   -> names2.long.uncorr
close(con)


con <- file(fileName, open = 'rb') #must be binary

readr::read.delim(con, delim= ",", col_names = TRUE, col_types = NULL) -> names.long

spec(names.long)->names.long.spec
problems(names.long) -> names.long.prob
close(con)

>$$read_lines
readfile <- function(fileName, from=0, to=-1, ...){
   pkgLoader("readr")
   require(readr)
   con <- file(fileName, open = 'rb') #must be binary

   # con <- file(file.choose(), open = 'r')
   read_lines(con, skip=from, n_max = to, ...) -> linedata
   close(con)
   return(linedata)
}

>##EXCEL FILES
   require(readxl)
   require(xlsx)
   xlsx::read.xlsx2(fileName,sheetIndex = 1, col_types="guess", guess_max = 100) -> newData
   readxl::read_excel(fileName, sheet=1, col_names = T, col_types = NULL, .name_repair = "universal", na=c(""))->newData2

```

   readxl::read_excel(fileName, sheet=1, col_names = T, col_types = NULL, .name_repair = T, na=c(""))->newData2
The number of rows, useful to create a 0-column tibble or just as an additional check.
.name_repair
Treatment of problematic column names:
"minimal": No name repair or checks, beyond basic existence,
"unique": Make sure names are unique and not empty,
"check_unique": (default value), no name repair, but check they are unique,
"universal": Make the names unique and syntactic
a function: apply custom name repair (e.g., .name_repair = make.names for names in the style of base R).
A purrr-style anonymous function, see rlang::as_function()

### Minitab File

If the data file is in Minitab Portable Worksheet format, it can be opened with the function read.mtp from the foreign package. It returns a list of components in the Minitab worksheet.

```r
> library(foreign)                 # load the foreign package
> help(read.mtp)                   # documentation
> mydata = read.mtp("mydata.mtp")  # read from .mtp file
```

### SPSS File

For the data files in SPSS format, it can be opened with the function read.spss also from the foreign package. There is a "to.data.frame" option for choosing whether a data frame is to be returned. By default, it returns a list of components instead.

```r
> library(foreign)                 # load the foreign package
> help(read.spss)                  # documentation
> mydata = read.spss("myfile", to.data.frame=TRUE)
```

### Table File

A data table can resides in a text file. The cells inside the table are separated by blank characters. Here is an example of a table with 4 rows and 3 columns.

```r
100   a1   b1
200   a2   b2
300   a3   b3
400   a4   b4
```

Now copy and paste the table above in a file named "mydata.txt" with a text editor. Then load the data into the workspace with the function read.table.

```r
> mydata = read.table("mydata.txt")  # read text file
> mydata                             # print data frame
   V1 V2 V3
1 100 a1 b1
2 200 a2 b2
3 300 a3 b3
4 400 a4 b4
```

For further detail of the function read.table, please consult the R documentation.

```r
> help(read.table)
```

### CSV File

The sample data can also be in comma separated values (CSV) format. Each cell inside such data file is separated by a special character, which usually is a comma, although other characters can be used as well.

The first row of the data file should contain the column names instead of the actual data. Here is a sample of the expected format.

```r
Col1,Col2,Col3
100,a1,b1
200,a2,b2
300,a3,b3
```

After we copy and paste the data above in a file named "mydata.csv" with a text editor, we can read the data with the function read.csv.

```r
> mydata = read.csv("mydata.csv")  # read csv file
> mydata
  Col1 Col2 Col3
1  100   a1   b1
2  200   a2   b2
3  300   a3   b3
```

In various European locales, as the comma character serves as the decimal point, the function read.csv2 should be used instead. For further detail of the read.csv and read.csv2 functions, please consult the R documentation.

`> help(read.csv)`

### Working Directory

Finally, the code samples above assume the data files are located in the R working directory, which can be found with the function getwd.

```r
> getwd()               # get current working directory
```

You can select a different working directory with the function setwd(), and thus avoid entering the full path of the data files.

```r
> setwd("<new path>")   # set working directory
```

Note that the forward slash should be used as the path separator even on Windows platform.

```r
> setwd("C:/MyDoc")
```

I always really like using `file.choose()`.  Works super well.  Returns a path, appropriately formated, after displaying the system file open box.




## Snippits

### Prompt Setter

Takes a numeric value, and if there is a time in it, updates the time each time

```r
setPrompt<-function(int_val = 1, added.space = FALSE){

   prompt <- list()
   # ">"
   prompt[[1]] <- function(added.space = FALSE) {paste0( ">",if(added.space){" "}else{""})}
   # "R>"
   prompt[[2]] <- function(added.space = FALSE) {paste0( "R>",if(added.space){" "}else{""})}

   prompt[[3]] <- function(added.space = FALSE){ paste0(  "[R]>",if(added.space){" "}else{""})}
   prompt[[4]] <- function(added.space = FALSE){paste0("[R-", paste(R.version$major,R.version$minor, sep="."),"]>",if(added.space){" "}else{""})}
   prompt[[5]] <-function(added.space = FALSE){paste0("[R", paste(R.version$minor, sep="."),"]>",if(added.space){" "}else{""})}
   prompt[[6]] <-function(added.space = FALSE){paste0("[R(", paste(R.version$minor, sep="."),")]>",if(added.space){" "}else{""})}
   prompt[[7]] <-function(added.space = FALSE){paste0( "[R(", paste(R.version$minor, sep="."), ")~",format(Sys.time(),"%y:%j:%R:%S"),"]>",if(added.space){" "}else{""})}
   prompt[[8]] <-function(added.space = FALSE){paste0( "[R(", paste(R.version$minor, sep="."), ")~",format(Sys.time(),"%y:%j:%R:%S"),"]~/",strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])], ">",if(added.space){" "}else{""})}
   prompt[[9]] <-function(added.space = FALSE){paste0( "[R(", "/", strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])],"/", ")]>",if(added.space){" "}else{""})}
   prompt[[10]] <-function(added.space = FALSE){paste0( "[", strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])], "/", "]>",if(added.space){" "}else{""})}
   prompt[[11]] <-function(added.space = FALSE){paste0( "[", strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])], "/","]>",if(added.space){" "}else{""})}
   prompt[[12]] <-function(added.space = FALSE){ paste0( strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])],"/", ">",if(added.space){" "}else{""})}

   if(!is.numeric(int_val)){
      warning(paste0("Required integer value 0-",length(prompt)))
      return()
   }

   if(int_val > length(prompt) | int_val<0){
      warning(paste0("Required integer value 0-",length(prompt)))
      return()
   }
   if(int_val==0){
      options(prompt=if(added.space){" "}else{""})
   }else{
      eval(f <- taskCallbackManager(), envir=.GlobalEnv)
      eval(
         f$add(function(expr, value, ok, visible){
            options(prompt=prompt[[int_val]](added.space));
            return(TRUE) },
         name="pmpt"),
         envir = .GlobalEnv
      )
   }
}
```

```r
setPrompt<-function(int_val = 1, added.space = FALSE, print.Opts=FALSE){
   #run this to see colors:
   # colours()

   NUM_ENTRIES = 18
   require(crayon)
   ltgrn<-make_style("lawngreen")
   dkred <-make_style("indianred3")
   stblue <-make_style("lightsteelblue")
   orange <- make_style("orange")
   cadet <- make_style("cadetblue1")
    azure<- make_style( "azure")
    cht<- make_style("chartreuse" )
    aqua<- make_style("aquamarine")
    # <- make_style()
    # <- make_style()
    # <- make_style()
    # <- make_style()
    # <- make_style()
    # <- make_style()
    # <- make_style()
    # <- make_style()
    # <- make_style()
      prompt <- list()
   hasTime <- vector(mode = "logical", length = NUM_ENTRIES)

   # ">"
   prompt[[1]] <-
      function(added.space = FALSE) {paste0( ">",if(added.space){" "}else{""})}
   # "R>"
   prompt[[2]] <-
      function(added.space = FALSE) {paste0( "R>",if(added.space){" "}else{""})}

   prompt[[3]] <-
      function(added.space = FALSE){ paste0(  "[R]>",if(added.space){" "}else{""})}
   prompt[[4]] <-
      function(added.space = FALSE){paste0("[R-", paste(R.version$major,R.version$minor, sep="."),"]>",if(added.space){" "}else{""})}
   prompt[[5]] <-
      function(added.space = FALSE){paste0("[R", paste(R.version$minor, sep="."),"]>",if(added.space){" "}else{""})}
   prompt[[6]] <-
      function(added.space = FALSE){paste0("[R(", paste(R.version$minor, sep="."),")]>",if(added.space){" "}else{""})}
   prompt[[7]] <-
      function(added.space = FALSE){paste0( "[R(", paste(R.version$minor, sep="."), ")~",format(Sys.time(),"%y:%j:%R:%S"),"]>",if(added.space){" "}else{""})}
   hasTime[7] <- T
   prompt[[8]] <-
      function(added.space = FALSE){paste0( "[R(", paste(R.version$major,R.version$minor, sep="."), ")~",format(Sys.time(),"%y:%j:%R:%S"),"]~/",strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])], ">",if(added.space){" "}else{""})}
   hasTime[8] <- T
   prompt[[9]] <-
      function(added.space = FALSE){paste0( "[R(", paste(R.version$minor, sep="."), ")~",format(Sys.time(),"%y:%j:%R:%S"),"]~/",strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])], ">",if(added.space){" "}else{""})}
   hasTime[9] <- T
   prompt[[10]] <-
      function(added.space = FALSE){paste0( "[R(", "/", strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])],"/", ")]>",if(added.space){" "}else{""})}
   prompt[[11]] <-
      function(added.space = FALSE){paste0( "[", strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])], "/", "]>",if(added.space){" "}else{""})}
   prompt[[12]] <-
      function(added.space = FALSE){paste0( "[", strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])], "/","]>",if(added.space){" "}else{""})}
   prompt[[13]] <-
      function(added.space = FALSE){ paste0( strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])],"/", ">",if(added.space){" "}else{""})}
   prompt[[14]] <-
      function(added.space = FALSE){ paste0( format(Sys.time(),"%y:%j:%R:%S"), ">",if(added.space){" "}else{""})}
   hasTime[14] <- T
   prompt[[15]] <-
      function(added.space = FALSE){ paste0( "(", format(Sys.time(),"%y:%j:%R:%S"), ")>",if(added.space){" "}else{""})}
   hasTime[15] <- T
   prompt[[16]] <-
      function(added.space = FALSE){ paste0( "(", format(Sys.time(),"%R:%S"), ")>",if(added.space){" "}else{""})}
   hasTime[16] <- T
   prompt[[17]] <-
      function(added.space = FALSE){ paste0( "(", format(Sys.time(),"%a, %d -%R:%S"), ")>",if(added.space){" "}else{""})}
   hasTime[17] <- T
   prompt[[18]] <-
      function(added.space = FALSE){ paste0( "(", blue(format(Sys.time(),"%r")), ")>",if(added.space){" "}else{""})}
   hasTime[18] <- T
   prompt[[19]] <-
      function(added.space = FALSE){ paste0( "(", format(Sys.time(),"%c"), ")>",if(added.space){" "}else{""})}
   hasTime[19] <- T
   prompt[[20]] <-
      function(added.space = FALSE){paste0( white("["),
                                            bold(cyan("R")),
                                            white("("),
                                            paste(red(R.version$major),magenta(R.version$minor), sep="."),
                                            white(")~"),
                                            green(format(Sys.time(),"%y:%j:")),
                                            bold(green(format(Sys.time(),"%R:%S"))),
                                            white("]~"),
                                            inverse(blue("/")),
                                            inverse(blue(strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])])),
                                            white(">"),
                                            if(added.space){" "}else{""})
         }
   hasTime[20] <- T
   prompt[[21]] <-
      function(added.space = FALSE){paste0( white("["),
                                            bold(cyan("R")),
                                            white("("),
                                            paste(red(R.version$major),stblue(R.version$minor), sep="."),
                                            white(")~"),
                                            green(format(Sys.time(),"%a:%b,%d")),
                                            bold(green(format(Sys.time(), "%R:"))),
                                            bold(underline(ltgrn(format(Sys.time(),"%S")))),
                                            white("]~"),
                                            azure("/"),
                                            aqua(strsplit(getwd(),"/")[[1]][length(strsplit(getwd(),"/")[[1]])]),
                                            white(">"),
                                            if(added.space){" "}else{""})
         }
   hasTime[21] <- T
   # prompt[[20]] <-
   # hasTime[20] <- T
   # prompt[[20]] <-
   # hasTime[20] <- T
   # prompt[[20]] <-
   # hasTime[20] <- T


   if(print.Opts){
      print("The available prompt options are:")
      for(i in 1:length(prompt)){
         warning(paste0("Option-[",i,"]:"))
         print(prompt[[i]](added.space))
      }
      return()
   }

   if(!is.numeric(int_val)){
      warning(paste0("Required integer value 0-",length(prompt)))
      return()
   }
   # print(sys.nframe())
   if(int_val > length(prompt) | int_val<0){
      warning(paste0("Required integer value 0-",length(prompt)))
      return()
   }
   if(int_val==0){
      options(prompt=eval((if(added.space){" "}else{""}), envir=parent.frame() )  )
   }else{
      if(hasTime[int_val]){

         eval(f <- taskCallbackManager(), envir=.GlobalEnv)
         eval(
            f$add(function(expr, value, ok, visible){
               options(prompt=prompt[[int_val]](eval(added.space, envir=parent.frame())));
               # print(sys.nframe())
               return(TRUE) },
            name="Prompt.Set...Success"),
            envir = .GlobalEnv
         )
      }else{
         eval(options(prompt=prompt[[int_val]](added.space)),envir = .GlobalEnv)
      }
   }
}

```

### Package Loader

```r
pkgLoader<- function(pkg){
  if(Sys.getenv("HTTPS_PROXY")=="" || Sys.getenv("HTTP_PROXY")==""){
    print("Your HTTP_PROXY and HTTPS_PROXY environment variables are unset, this may not work as expected to get the needed packages.  Check how to set these variables if there are errors.")
  }
  for(pkgi in pkg){  #allows this to support vectors or single pkgs
    if(!require(pkgi, quietly = TRUE, character.only=TRUE)){
        install.packages(pkgi) #check if the pkg CAN be loaded, returns FALSE if unable
        print("")
    }  #then, go get the package.
  }
}
errorhandler<-function(){
  print("error")
}
```

### Getting the Script Dir

<https://stackoverflow.com/questions/1815606/rscript-determine-path-of-the-executing-script>

This doesnt work on itself? or something,  Maybe on other scripts?

```r
script.dir <- dirname(sys.frame(1))
```

This didnt work either.

```r
thisFile <- function() {
        cmdArgs <- commandArgs(trailingOnly = FALSE)
        needle <- "--file="
        match <- grep(needle, cmdArgs)
        if (length(match) > 0) {
                # Rscript
                return(normalizePath(sub(needle, "", cmdArgs[match])))
        } else {
                # 'source'd via R console
                return(normalizePath(sys.frames()[[1]]$ofile))
        }
}
```
commandargs is just - `[1] "RStudio"       "--interactive"` at least in RMarkdown.

Finally, this works:

```r
rstudioapi::getActiveDocumentContext()
dirname(rstudioapi::getActiveDocumentContext()$path ) -> path
```

### Get Setup info

```r
sprintf("Data analyzed using %s, in RStudio version %s on a system running %s, at %s",
        R.version.string,
        RStudio.Version()$version,
        R.version$system,
        date())
        paste0('*', strsplit(format(RStudio.Version()$citation)[2], '\n')[[1]][1])
>>#and
Sys.getenv()[startsWith(names(Sys.getenv()), "R_") | startsWith(names(Sys.getenv()), "RSTUDIO")]
#Sys.getenv()-> envir
#envir[startsWith(names(envir), "R_") | startsWith(names(envir), "RSTUDIO")] -> envir
Sys.getenv()[startsWith(names(Sys.getenv()), "R_") | startsWith(names(Sys.getenv()), "RSTUDIO")] -> envir
envir <- as.list(envir)
envir$script.path <- rstudioapi::getActiveDocumentContext()$path
envir$initial.wd <- getwd()
envir$path <- dirname(envir$script.path)
setwd(envir$path)
devtools::session_info()

```

version2.0

```r
Sys.getenv()[startsWith(names(Sys.getenv()), "R_") | startsWith(names(Sys.getenv()), "RSTUDIO")] -> envir
envir <- as.list(envir)
envir$initial.wd <- getwd()

#ARE we in knitr or RStudio?
   #require(rstudioapi)
   #if (rstudioapi::isAvailable()){
   ##now we dont need the api unless were in RStudio
if(interactive()){
   require(rstudioapi)
   sprintf("Data analyzed using %s, in RStudio* version %s on a system running %s, at %s",
           R.version.string,
           #studioapi::RStudio.Version()$version,
           rstudioapi::versionInfo()$version,
           R.version$system,
           date())
   envir$script <- rstudioapi::getActiveDocumentContext()$path
   paste0('*', strsplit(format(RStudio.Version()$citation)[2], '\n')[[1]][1])
}else{
      envir$script <-knitr::current_input(dir = TRUE)
}
envir$path <- dirname(envir$script)
setwd(envir$path)
print(paste0("This script is running out of ", getwd(), " (Working Directory) [",  envir$path, "]"))
interactive()
```

### Clear  Env

```r
posResp = c("yes", "y", "Yes", "Y", 1)
negResp = c("no", "n", "No", "N", 0)
q <- readline(prompt = (paste0(" Clear Environment Data? There are ", length(ls()), " values in the worspace right now.")))

clear <-function(){
   rm(list=ls())
   return(TRUE)
}

if (q %in% posResp) {
   t <- clear(); rm(t)
   print("Memory Cleared.")
}
```

- A better way

```r
clear <-function(){
   rm(list=ls(envir = globalenv()), envir = globalenv())
   return(TRUE)
}
environment()
if (utils::askYesNo(paste0(" Clear Environment Data? There are ", length(ls()), " values in the worspace right now."))){
    t <- clear()
    rm(t)
   print("Memory Cleared.")
}
```

### MsgBox

[tcltk](http://www.sciviews.org/recipes/tcltk/toc/)
[PDF of TCLTK](http://www.sciviews.org/images2/recipes-tcltk/Rtcltk.pdf)

```r
require(tcltk)
msgBox <- tkmessageBox(title = "Title of message box",
                       message = "Hello, world!", icon = "info", type = "ok")
```
#### Other GUIs

```r
options(menu.graphics = TRUE)->menu.graphics.old

utils::select.list(dir())
choose.dir()
file.choose()
```

3#
### Magrittr

#### Installation

(1) The easiest way to get magrittr is to install the whole tidyverse. (2)Alternatively, install just magrittr, **(3)Or the development version from GitHub:**

```r
install.packages("tidyverse") #1

install.packages("magrittr") #2

install.packages("devtools") #3
devtools::install_github("tidyverse/magrittr")
```

#### Usage

##### Basic piping

`x %>% f` is equivalent to `f(x)`

`x %>% f(y)` is equivalent to `f(x, y)`

`x %>% f %>% g %>% h` is equivalent to `h(g(f(x)))`

Here, “equivalent” is not technically exact: evaluation is non-standard, and the left-hand side is evaluated before passed on to the right-hand side expression. However, in most cases this has no practical implication.

#### The argument placeholder

`x %>% f(y, .)` is equivalent to `f(y, x)`

`x %>% f(y, z = .)` is equivalent to `f(y, z = x)`

##### Re-using the placeholder for attributes

It is straightforward to use the placeholder several times in a right-hand side expression. However, when the placeholder only appears in a nested expressions magrittr will still apply the first-argument rule. The reason is that in most cases this results more clean code.

`x %>% f(y = nrow(.), z = ncol(.))` is equivalent to `f(x, y = nrow(x), z = ncol(x))`

The behavior can be overruled by enclosing the right-hand side in braces:

`x %>% {f(y = nrow(.), z = ncol(.))}` is equivalent to `f(y = nrow(x), z = ncol(x))`

##### Building (unary) functions

Any pipeline starting with the . will return a function which can later be used to apply the pipeline to values. Building functions in magrittr is therefore similar to building other values.

`f <- . %>% cos %>% sin `  is equivalent to `f <- function(.) sin(cos(.)) `

##### Pipe with exposition of variables

Many functions accept a data argument, e.g. lm and aggregate, which is very useful in a pipeline where data is first processed and then passed into such a function. There are also functions that do not have a data argument, for which it is useful to expose the variables in the data. This is done with the %$% operator:

```r
iris %>%
  subset(Sepal.Length > mean(Sepal.Length)) %$%
  cor(Sepal.Length, Sepal.Width)
#> [1] 0.3361992

data.frame(z = rnorm(100)) %$%
  ts.plot(z)
```

!!!Note: Interesting! shinystan::launch_shinystan_demo		'ShinyStan' demo
shinyWidgets::useShinydashboard		Use 'shinydashboard' in 'shiny'
shinyWidgets::useShinydashboardPlus		Use 'shinydashboardPlus' in 'shiny'

## Tables


- HTML
  - table1
  - ztable
  - xtable
  - texreg
- Latex
  - ztable
  - xtable
  - texreg


#initial[,c("DOS", "DOS.i", "DOS.original", "DOS.c", "Date of Surgery")] %>% head(10) %>% kable(format=G_FORMAT$Kable, caption="Comparison of Date Formats")
#initial[,c("DOS", "DOS.i", "DOS.original", "DOS.c", "Date of Surgery")] %>% Hmisc::describe() %>% html()

```r
table("one"=c("A", "B", "C"), "This is two"=c(1,2,4), "This is last"=c(111,2222,444))

```
Show in New WindowClear OutputExpand/Collapse Output
[1]
[1] Age.gt.75
[1]
   Length     Class      Mode
        1 character character
Error in eval(e, x, parent.frame()) : invalid 'envir' argument of type 'closure'
4.
eval(e, x, parent.frame())
3.
subset.data.frame(df, subset = !is.na(Gr2.f))
2.
pop() at StatFunctions.R#163
1.
X("Age.gt.75")
Show in New WindowClear OutputExpand/Collapse Output

Show in New WindowClear OutputExpand/Collapse Output
Loading required package: FormatR
there is no package called �FormatR�Loading required package: sjTable
there is no package called �sjTable�Loading required package: sjlabeled
there is no package called �sjlabeled�Loading required package:
Failed with error:  ‘invalid package name’
Loading required package:
Failed with error:  ‘invalid package name’
Loading required package:
Failed with error:  ‘invalid package name’
Loading required package:
Failed with error:  ‘invalid package name’
Loading required package:
Failed with error:  ‘invalid package name’
Loading required package:
Failed with error:  ‘invalid package name’
* __  _    __   .    o           *  .
 / /_(_)__/ /_ ___  _____ _______ ___
/ __/ / _  / // / |/ / -_) __(_-</ -_)
\__/_/\_,_/\_, /|___/\__/_/ /___/\__/
     *  . /___/      o      .       *
[1] "\033[1m\033[31mTidyverse Namespace Conflicts:\033[39m\033[22m"
-- Conflicts ------------------------------------------ tidyverse_conflicts() --
x rlang::%@%()              masks purrr::%@%()
x lemon::%||%()             masks rlang::%||%(), purrr::%||%()
x crayon::%+%()             masks ggplot2::%+%()
x rlang:::=()               masks data.table:::=()
x sjmisc::add_case()        masks tibble::add_case()
x lubridate::as.difftime()  masks base::as.difftime()
x rlang::as_function()      masks purrr::as_function()
x rlang::as_name()          masks lazyeval::as_name()
x data.table::between()     masks dplyr::between()
x sjstats::bootstrap()      masks broom::bootstrap()
x rlang::call_modify()      masks lazyeval::call_modify()
x rlang::call_standardise() masks lazyeval::call_standardise()
x crayon::chr()             masks rlang::chr()
x gridExtra::combine()      masks dplyr::combine()
x mice::complete()          masks tidyr::complete()
x lubridate::date()         masks base::date()
x rlang::expr_label()       masks lazyeval::expr_label()
x rlang::expr_text()        masks lazyeval::expr_text()
x magrittr::extract()       masks tidyr::extract()
x rlang::f_env()            masks lazyeval::f_env()
x rlang::f_env<-()          masks lazyeval::f_env<-()
x rlang::f_label()          masks lazyeval::f_label()
x rlang::f_lhs()            masks lazyeval::f_lhs()
x rlang::f_lhs<-()          masks lazyeval::f_lhs<-()
x rlang::f_rhs()            masks lazyeval::f_rhs()
x rlang::f_rhs<-()          masks lazyeval::f_rhs<-()
x rlang::f_text()           masks lazyeval::f_text()
x dplyr::filter()           masks stats::filter()
x data.table::first()       masks dplyr::first()
x rlang::flatten()          masks purrr::flatten()
x rlang::flatten_chr()      masks purrr::flatten_chr()
x rlang::flatten_dbl()      masks purrr::flatten_dbl()
x rlang::flatten_int()      masks purrr::flatten_int()
x rlang::flatten_lgl()      masks purrr::flatten_lgl()
x rlang::flatten_raw()      masks purrr::flatten_raw()
x lubridate::hour()         masks data.table::hour()
x lubridate::intersect()    masks base::intersect()
x rlang::invoke()           masks purrr::invoke()
x rlang::is_atomic()        masks lazyeval::is_atomic(), purrr::is_atomic()
x rlang::is_call()          masks lazyeval::is_call()
x sjmisc::is_empty()        masks rlang::is_empty(), purrr::is_empty()
x rlang::is_formula()       masks lazyeval::is_formula(), purrr::is_formula()
x rlang::is_lang()          masks lazyeval::is_lang()
x lubridate::isoweek()      masks data.table::isoweek()
x dplyr::lag()              masks stats::lag()
x data.table::last()        masks dplyr::last()
x rlang::list_along()       masks purrr::list_along()
x lubridate::mday()         masks data.table::mday()
x lubridate::minute()       masks data.table::minute()
x rlang::missing_arg()      masks lazyeval::missing_arg()
x rlang::modify()           masks purrr::modify()
x lubridate::month()        masks data.table::month()
x lubridate::quarter()      masks data.table::quarter()
x sjmisc::replace_na()      masks tidyr::replace_na()
x lubridate::second()       masks data.table::second()
x jmvcore::select()         masks dplyr::select()
x rlang::set_names()        masks magrittr::set_names(), purrr::set_names()
x lubridate::setdiff()      masks base::setdiff()
x rlang::splice()           masks purrr::splice()
x .GlobalEnv::src()         masks Hmisc::src(), dplyr::src()
x crayon::style()           masks formattable::style()
x Hmisc::summarize()        masks dplyr::summarize()
x data.table::transpose()   masks purrr::transpose()
x lubridate::union()        masks base::union()
x lubridate::wday()         masks data.table::wday()
x lubridate::week()         masks data.table::week()
x lubridate::yday()         masks data.table::yday()
x lubridate::year()         masks data.table::year()
[1] "\033[1m\033[32mIncluded tidyverse packages:\033[39m\033[22m"
 [1] "broom"       "cli"         "crayon"      "dplyr"       "dbplyr"      "forcats"     "ggplot2"     "haven"       "hms"         "httr"        "jsonlite"
[12] "lubridate"   "magrittr"    "modelr"      "purrr"       "readr"       "readxl\n(>=" "reprex"      "rlang"       "rstudioapi"  "rvest"       "stringr"
[23] "tibble"      "tidyr"       "xml2"        "tidyverse"
[1] "\033[1m\033[34mTidyverse package dependencies:\033[39m\033[22m"
[1] "SUCCESS...  Source from module added to project: 'lib/Header.R'."
NULL
Show in New WindowClear OutputExpand/Collapse Output
<locale>
Numbers:  123,456.78
Formats:  FALSE / %AT
Timezone: America/Denver
Encoding: UTF-8
<date_names>
Days:   Sunday (Sun), Monday (Mon), Tuesday (Tue), Wednesday (Wed), Thursday (Thu), Friday (Fri), Saturday (Sat)
Months: January (Jan), February (Feb), March (Mar), April (Apr), May (May), June (Jun), July (Jul), August (Aug), September (Sep), October (Oct),
        November (Nov), December (Dec)
AM/PM:  AM/PM
Show in New WindowClear OutputExpand/Collapse Output
[1] "The returned data is 3105 rows (patients) and 512 columns (variables)"
Show in New WindowClear OutputExpand/Collapse Output
[1] "The returned data is 2007 rows (patients) and 73 columns (variables)"
Show in New WindowClear OutputExpand/Collapse Output
 [1] "2015-01-01" "2015-01-01" "2015-01-01" "2015-01-02" "2015-01-02" "2015-01-04" "2015-01-05" "2015-01-06" "2015-01-06" "2015-01-06"
Show in New WindowClear OutputExpand/Collapse Output

Show in New WindowClear OutputExpand/Collapse Output
, , This is last = 111

   This is two
one 1 2 4
  A 1 0 0
  B 0 0 0
  C 0 0 0

, , This is last = 444

   This is two
one 1 2 4
  A 0 0 0
  B 0 0 0
  C 0 0 1

, , This is last = 2222

   This is two
one 1 2 4
  A 0 0 0
  B 0 1 0
  C 0 0 0

## Rmarkdown

namer	Names Your 'R Markdown' Chunks
2019-03-25	atable	Create Tables for Reporting Clinical Trials
2019-03-25	BTLLasso	Modelling Heterogeneity in Paired Comparison Data
2019-03-25	dataPreparation	Automated Data Preparation

### sjPlot

```r
library(sjPlot)
library(sjlabelled)
library(sjmisc)
library(sjstats)
require(magrittr)
sjPlot::set_theme()
options(bitmapType = 'cairo', device = 'png'
src<- df %>%  dplyr::select(Race, Gr2.f)
># pdf(file = "Rplots.pdf", width = 3, height = 4, title="Hisp. pop in Study Group", paper = "letter", encoding = "ISOLatin1")
src %>% sjtab(fun="xtab", var.labels=c("Race Breakdown","Study Group"),
               show.row.prc=T, show.col.prc=T, show.summary=T, show.exp=T, show.legend=T)# %>% sjPlot::save_plot(filename="Images/Hispchart.png")  #-> plt #%>% ggplot2::ggsave("Hisp", dpi = 200, path = "Images/", device = "pdf")
src<- df %>%  dplyr::select(Race.all, Gr2.f)
># pdf(file = "Rplots.pdf", width = 3, height = 4, title="Hisp. pop in Study Group", paper = "letter", encoding = "ISOLatin1")
src %>% sjtab(fun="xtab", var.labels=c("Race Breakdown - showing all sub groups","Study Group"),
               show.row.prc=T, show.col.prc=T, show.summary=T, show.exp=T, show.legend=T) # %>% sjPlot::save_plot(filename="Images/Hispchart.png")  #-> plt #%>% ggplot2::ggsave("Hisp", dpi = 200, path = "Images/", device = "pdf")
src %>% sjplot( fun = c("frq", "grpfrq", "xtab", "aov1", "likert",  "stackfrq"))-> p2
># ggThemeAssist::ggThemeAssistGadget(p1)
plot_grid(p1)
dev.off()
subset(df, select = c(Race.all, Gr2.f), subset = c(Gr2.f))
Hmisc::asNumericMatrix(src)->src
g <- function(x)c(Mean=mean(x,na.rm=TRUE),Median=median(x,na.rm=TRUE))
Hmisc::summarize(pop()$Race, by="Gr2.f", g) #Numeric only
Hmisc::summarize(pop()$Race, by="Gr2.f", smedian.hilow, conf.int=.5) #Numeric only
Hmisc::summarize(pop()$Race, by="Gr2.f",  (quantile, probs=c(.5,.25,.75),)) #Numeric only
src %>% sjtab(fun = c("xtab", "stackfrq"), var.labels=c("Race Breakdown - showing all sub groups","Study Group"),
               show.row.prc=T, show.col.prc=T, show.summary=T, show.exp=T, show.legend=T)#s
```

### Kable


### Huxtable

huxtable::huxtable-package		Huxtable: simply create  and HTML tables


### Datatable


### xtable



### Pixiedust

### Reportools

### Sparktable

### miscFuncs

### LatexPDF

### knitLatex

### htmlTable

### gTable

### formattable

### flextable

### dtables

### DT

### tables

### tableMatrix

### table1

### TableMonster

### tableone
### tableplot

### zTable

### kableExtra

### rpivotTable

###


Hmisc
DescTools
CBCgrps
ClinReport	Statistical Reporting in Clinical Trials
	RWsearch	Lazy Search in R Packages, Task Views, CRAN, the Web. All-in-One Download
    sdcTable	Methods for Statistical Disclosure Control in Tabular Data
easySdcTable	Easy Interface to the Statistical Disclosure Control Package 'sdcTable'
tableone	Create 'Table 1' to Describe Baseline Characteristics
forcats	Tools for Working with Categorical Variables (Factors)

carpenter	Build Common Tables of Summary Statistics for Reports

stable	Probability Functions and Generalized Regression Models for Stable Distributions

	odds.n.ends	Odds Ratios, Contingency Table, and Model Significance from a Generalized Linear Model Object
    iotables	Importing and Manipulating Symmetric Input-Output Tables
    TableToLongForm	Automatically Convert Hierarchical for-Human Tables to Machine-Readable LongForm Dataframes
    2019-01-09	demoGraphic	Providing Demographic Table with the P-Value, Standardized Mean Difference Value
2019-01-09	docxtractr	Extract Data Tables and Comments from 'Microsoft' 'Word' Document

	PivotalR	A Fast, Easy-to-Use Tool for Manipulating Tables in Databases and a Wrapper of MADlib
    	clinDR	Simulation and Analysis Tools for Clinical Dose Response Modeling
        maditr	Pipe-Style Interface for 'data.table'
        	papeR	A Toolbox for Writing Pretty Papers and Reports

            	rhandsontable	Interface to the 'Handsontable.js' Library
                	sparklyr.nested	A 'sparklyr' Extension for Nested Data
2018-11-14	tableschema.r	Frictionless Data Table Schema
ables	Formula-Driven Table Generation

DT	A Wrapper of the JavaScript Library 'DataTables'

export	Streamlined Export of Graphs and Data Tables
frequency	Easy Frequency Tables
codified	Produce Standard/Formalized Demographics Tables
	apaTables	Create American Psychological Association (APA) Style Tables

    	PoweR	Computation of Power and Level Tables for Hypothesis Tests
        twoway	Analysis of Two-Way Tables

        	ltable	Easy to Make (Lazy) Tables

            CANSIM2R	Directly Extracts Complete CANSIM Data Tablessyt	Standard Young Tableaux
            	exact2x2	Exact Tests and Confidence Intervals for 2x2 Tables

                rrtable	Reproducible Research with a Table of R Codes

                tabulizer	Bindings for 'Tabula' PDF Table Extractor Library
                	tangram	The Grammar of Tables

                    stargazer	Well-Formatted Regression and Summary Statistics Tables

                    	quantable	Streamline Descriptive Analysis of Quantitative Data Matrices
                        	LPower	Calculates Power, Sample Size, or Detectable Effect for Longitudinal Analyses

                            	pointblank	Validation of Local and Remote Data Tables
                                	TableMonster	Table Monster
                                    	svDialogs	'SciViews' - Standard Dialog Boxes for Windows, MacOS and Linuxes
                                        MortalityTables	A Framework for Various Types of Mortality / Life Tables

                                        relatable	Functions for Mapping Key-Value Pairs, Many-to-Many, One-to-Many, and Many-to-One Relations

                                        	rpivotTable	Build Powerful Pivot Tables and Dynamically Slice & Dice your Data	rpivotTable	Build Powerful Pivot Tables and Dynamically Slice & Dice your Data

                                            R2DT	Translation of Base R-Like Functions for 'data.table' Objects


                                            xltabr	Automatically Write Beautifully Formatted Cross Tabulations/Contingency Tables to Excel


                                            dixon	Nearest Neighbour Contingency Table Analysis
	atable	Create Tables for Reporting Clinical Trials
2019-03-25	BTLLasso	Modelling Heterogeneity in Paired Comparison Data
2019-03-25	clustcurv	Determining Groups in Multiples Curves
	basictabler	Construct Rich Tables for Output to 'HTML'/'Excel'

## Internet

rvest	Easily Harvest (Scrape) Web Pages
2019-02-28	SmallCountRounding	Small Count Rounding of Tabular Data
2019-02-28	xplorerr	Tools for Interactive Data Exploration
2019-02-27	adespatial	Multivariate Multiscale Spatial Analysis

tablerDash	'Tabler' API for 'Shiny'
jstable	Create Tables from Different Types of Regression
sdcTable	Methods for Statistical Disclosure Control in Tabular Data
DT::dataTableOutput
2019-04-13	CTAShiny	Interactive Application for Working with Contingency Tables
2019-04-10	ggquickeda	Quickly Explore Your Data Using 'ggplot2' and 'table1' Summary Tables
tidystats::inspect		Inspect the output of (a) statistical model(s) via an interactive Shiny app.leafpop	Include Tables, Images and Graphs in Leaflet Pop-Ups
cluster	"Finding Groups in Data": Cluster Analysis Extended Rousseeuw et al.
2019-05-01	cobalt	Covariate Balance Tables and Plots
	tabplot	Tableplot, a Visualization of Large Datasets
    \	desctable	Produce Descriptive and Comparative Tables Easily
    	EValue	Sensitivity Analyses for Unmeasured Confounding or Selection Bias in Observational Studies and Meta-Analyses
        lawstat	Tools for Biostatistics, Public Policy, and Law
        	finalfit	Quickly Create Elegant Regression Results Tables and Plots when Modelling
## Packages

### ggplot2

### EZR

RcmdrPlugin.EZR - mfor med data

classInt::classIntervals		Choose univariate class intervals
crosstalk::maintain_selection		Synchronize Shiny brush selection with shared data
DT::dataTableProxy		Manipulate an existing DataTables instance in a Shiny app
formatR::tidy_app		A Shiny app to format R code

ggThemeAssist::ggThemeAssistGadget(gg1) very good.  Changes colors.  Takes complete plots as args.
ggSave
- ggedit::ggedit		Interactive shiny gadget for editing ggplot layers and themes.  **takes already complete plots as input
ggplotAssist::ggplotAssist		A shiny app for learn ggplot2
ggplotgui::ggplot_shiny		Creating a graphical user interface for creating ggplot-graphs.

ggplotgui
plotly::plotlyProxy		Modify a plotly object inside a shiny app
rstanarm::launch_shinystan.stanreg		Using the ShinyStan GUI with rstanarm models

### shiny

type `??"shiny" to see examples.  Otherwise it takes you to shiny method.

### Learning


HH::HH-package		Statistical Analysis and Data Display: Heiberger and Holland
HH::NTplot		Specify plots to illustrate Normal and t Hypothesis Tests or Confidence Intervals, including normal approximation to the binomial.
HH::AEdotplot		AE (Adverse Events) dotplot of incidence and relative risk
HH::bivariateNormal		Plot the bivariate normal density using wireframe for specified rho.
HH::likert		Diverging stacked barcharts for Likert, semantic differential, rating scale data, and population pyramids.
HH::pyramidLikert		Print a Likert plot as a Population Triangle


### Markdown

#### Printing Tables

knitr::kable
kableExtra
pander::pander

### DT (Datatable)

[DT](https://rstudio.github.io/DT/)
[Examples using Bootstrap Style](https://rstudio.github.io/DT/005-bootstrap.html)
[Options](https://rstudio.github.io/DT/options.html)
[Default Styling Options](http://datatables.net/manual/styling/classes)
[Bootstrap Table Class Names](http://getbootstrap.com/css/#tables)

```r
DT::datatable(Set, editable = T, filter = 'top', options=list(pageLength = 5, audtowidth= T))

```


### Dplyr

dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% htmlTable::htmlTable()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% kable()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% huxtable::as_huxtable() %>% huxtable::as_FlexTable()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% huxtable::as_huxtable()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% formattable::formattable()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% formattable::format_table()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% pixiedust::dust()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% spbabel::sf()
dplyr::anti_join(SP, initial, "serial")%>% dplyr::select( DOS.c, RecID, MRN, Proc,OpType, OpCat) %>% sjPlot::tab_df()



[R Studio Packages](https://www.rstudio.com/products/rpackages/)


The **tidyverse** is an opinionated collection of R packages designed for data science. All packages share an underlying philosophy and common APIs.

**Shiny** makes it incredibly easy to build interactive web applications with R. Shiny has automatic “reactive” binding between inputs and outputs and extensive pre-built widgets.

**rmarkdown** lets you insert R code into a markdown document. R then generates a final document, in a wide variety of formats, that replaces the R code with its results.

**Sparklyr** is an R interface to Apache Spark, a fast and general engine for big data processing. This package connects to local and remote Apache Spark clusters, a ‘dplyr’ compatible back-end, and an interface to Spark’s ML algorithms.
**ggplot 2** is an enhanced data visualization package for R. Create stunning multi-layered graphics with ease.

**knitr** is an elegant, flexible and fast dynamic report generation package that combines R with TeX, Markdown, or HTML.

**tidyr** makes it easy to “tidy” your data. Tidy data is data that’s easy to work with: it’s easy to munge (with dplyr), visualise (with ggplot2 or ggvis) and model (with R’s hundreds of modelling packages).

**readr** makes it easy to read many types of tabular data including; Delimited files withread_delim(), read_csv(), read_tsv(), and read_csv2(), Fixed width files with read_fwf(), and read_table(), and Web log files with read_log().

The **readxl** package makes it easy to get data out of Excel and into R. readxl has no external dependencies, so it’s easy to install and use on all operating systems. It is designed to work with tabular data.

**lubridate** is an R package that makes it easier to work with dates and times. The link will bring you to a concise tour of some of the things lubridate can do for you.

The aim of **devtools** is to make your life as a package developer easier by providing R functions that simplify many common tasks.

**magrittr** provides a mechanism for chaining commands with a new forward-pipe operator, %>%.

**packrat** is a dependency management tool for R to make your R projects more isolated, portable, and reproducible.

The **stringr** package aims to provide a clean, modern interface to common string operations.

**dplyr** is the next iteration of plyr, focussing on only data frames. dplyr is faster and has a more consistent API.

The **broom** package takes the messy output of built-in functions in R, such as lm, nls, or t.test, and turns them into tidy data frames.

The goal of **roxygen2** is to make documenting your code as easy as possible. R provides a standard way of documenting packages: you write .Rd files in the man/ directory.

A **tibble,** or tbl_df, is a modern reimagining of the data.frame, keeping what time has proven to be effective, and throwing out what is not.

**Feather** is a fast, lightweight, and easy-to-use binary file format for storing data frames.

**for cats** Helper for reordering factor levels (including moving specified levels to front, ordering by first appearance, reversing, and randomly shuffling), and tools for modifying factor levels.

**hms** A simple class for storing durations or time-of-day values and displaying them in the hh:mm:ss format. Intended to simplify data exchange with databases, spreadsheets, and other data sources.

**plumber** A package that enables you to convert your existing R code into web APIs by merely adding a couple of special comments.

**test that** Testing your code is normally painful and boring. testthat tries to make testing as fun as possible, so that you get a visceral satisfaction from writing tests.

**purrr** enhances R’s functional programming (FP) toolkit by providing a complete and consistent set of tools for working with functions and vectors.

Readr

Requires a locale setting, with date format, and time zone.
```r
#Set the locale
locale(date_names = "en", date_format = "%m/%d/%Y", tz = "America/Denver")


```

Get a password
```r
.rs.askForPassword("Enter an Encryption Key")
```

Encrypt and Decrypt a file
```r


```

Write out a list of the library
```r
library()[[2]] %>% as.table() %>% as.data.frame() %>%write_csv("library.csv")

```


```r


```


```r


```
### Chunk Options

Take Rnw files as an example: usually we write chunk options in the form tag=value like this:

        ```{r, mychunk, cache=TRUE, eval=FALSE, dpi=100}
        ```

And `opts_chunk$set()` can change the default global options in a document (e.g. put this in a code chunk: `knitr::opts_chunk$set(comment=NA, fig.width=6, fig.height=6))`. A few special notes on the options:

!!!note - `eval` -  **(TRUE; logical)** whether to evaluate the code chunk;

!!!note - `echo` - **(TRUE; logical or numeric)** whether to include R source code in the output file;
    - `echo=2:3` means only echo the 2nd and 3rd expressions
    - `echo=-4` means to exclude the 4th expression

- `results` - `**('markup'; character)**` takes these possible values
  - `markup` -  mark up the results using the output hook, e.g. put results in a special LaTeX environment
  - `asis` -  output as-is, i.e., write raw results from R into the output document
  - `hold` -  hold all the output pieces and push them to the end of a chunk
- `hide` **(or FALSE)** -  hide results; this option only applies to normal R output
- `collapse` - **(FALSE; logical; applies to Markdown output only)** whether to, if possible, collapse all the source and output blocks from one code chunk into a single block
- `warning` -  **(TRUE; logical)** whether to preserve warnings (produced by warning()) in the output like we run R code in a terminal (if FALSE, all warnings will be printed in the console instead of the output document);
- `error` -  **(TRUE; logical)** whether to preserve errors (from stop()); by default, the evaluation will not stop even in case of errors!! if we want R to stop on errors, we need to set this option to FALSE
when the chunk option include = FALSE, error knitr will stop on error, because it is easy to overlook potential errors in this case
- `message` -  **(TRUE; logical)** whether to preserve messages emitted by message() (similar to warning)
- `split` -  **(FALSE; logical)** whether to split the output from R into separate files and include them into LaTeX by \input{} or HTML by <iframe></iframe>; this option only works for .Rnw, .Rtex, and .Rhtml documents (it does not work for R Markdown)
- `include` -  **(TRUE; logical)** whether to include the chunk output in the final output document; if include=FALSE, nothing will be written into the output document, but the code is still evaluated and plot files are generated if there are any plots in the chunk, so you can manually insert figures; note this is the only chunk option that is not cached, i.e., changing it will not invalidate the cache
- `strip.white` -  **(TRUE; logical)** whether to remove the white lines in the beginning or end of a source chunk in the output
- `render` -  (``knitr::knit_print; function(x, options, ...``)) the function which formats the result of the chunk for the final output format. Invoke in R: vignette `('knit_print', package = 'knitr')` and `?knitr::knit_print`.
- `class.output` -  **(NULL; character)** useful for HTML output from R Markdown, appends classes that can be used in conjunction with CSS, so you can apply custom formatting.
- `class.message`, `class.warning`, `class.error` -  **(NULL; character)** similar to class.output but applied to messages, warnings, and errors in R Markdown output.
- `tidy` -  **(FALSE)** whether to reformat the R code; other possible values are:
  - `TRUE (equivalent to 'formatR'):` use `formatR::tidy_source()` to reformat the code;
  - `'styler'`: use `styler::style_text()` to reformat the code;
  - a custom function of the form `function(code, ...) {} t`o return the reformatted code;
- `tidy.opts` -  **(NULL; list)** a list of options to be passed to the function determined by the tidy option, e.g., `tidy.opts = list(blank = FALSE, width.cutoff = 60)` for `tidy = 'formatR'` to remove blank lines and set the approximate line width to be 60
- `prompt` -  **(FALSE; logical)** whether to add the prompt characters in the R code (see prompt and continue in ?base::options;

!!!note  `comment` -  **('##'; character)** the prefix to be put before source code output; **(set comment=NA to disable this feature)**

- `highlight` -  **(TRUE; logical)** whether to highlight the source code **(it is FALSE by default if the output is Sweave or listings)**
- `size` -  **('normalsize'; character)** font size for the default LaTeX output
- `background` -  (`'#F7F7F7'`; character or numeric) background color of chunks in LaTeX output
- `class.source` -  **(NULL; character)** useful for HTML output,

!!!note `cache` -  **(FALSE; logical)** whether to cache a code chunk; w
  - `cache.path` -  **('cache/'; character)** a prefix to be used for the names of cache files
  - `cache.vars` -  **(NULL)** a character vector of variable names to be saved in the cache database;
  - `cache.globals` -  **(NULL)** a character vector of the names of variables that are not created from the current chunk;
  - `cache.lazy` -  **(TRUE)** whether to `lazyLoad()` or directly `load()` objects; for very large objects, lazyloading may not work, so `cache.lazy=FALSE` may be desirable (see #572)
  - `cache.comments` -  **(NULL)** if FALSE, changing comments in R code chunks will not invalidate the cache database
  - `cache.rebuild` -  **(FALSE)** if TRUE, the chunk is evaluated even if cache=TRUE and no changes are made. This is useful when given an R code argument. For example: `cache.rebuild=!file.exists("path/to/file.ext")`

- `dependson` -  **(NULL; character or numeric)** a character vector of chunk labels to specify which other chunks this chunk depends on; this option applies to cached chunks only
- `autodep` -  **(FALSE; logical)** whether to figure out the dependencies among chunks automatically by analyzing the global variables in the code (may not be reliable) so that dependson does not need to be set explicitly

#### Plots

!!!note `fig.path` -  **('figure/'; character)** prefix to be used for figure filenames (fig.path and chunk labels are concatenated to make filenames); it may contain a directory like figure/prefix- (will be created if it does not exist); this path is relative to the current working directory; if the prefix ends in a trailing slash, e.g. output/figures/, figures will be saved in the specified directory without any changes to filename prefix, thus providing a relative filepath alternative to the package-level option base.dir

- `fig.keep` -  **('high'; character)** how plots in chunks should be kept; it takes five possible character values or a numeric vector (see the end of this section for an example)
  - `high` -  only keep high-level plots (merge low-level changes into high-level plots);
  - `none` -  discard all plots;
  - `all` -  keep all plots (low-level plot changes may produce new plots)
  - `first` -  only keep the first plot
  - `last` -  only keep the last plot
- `c(##)` - if set to a numeric vector: interpret value as index of (low-level) plots to keep
- `fig.show` -  **('asis'; character)** how to show/arrange the plots; four possible values are
- `asis` -  show plots exactly in places where they were generated (as if the code were run in an R terminal);
- `hold` -  hold all plots and output them in the very end of a code chunk;
- `animate` -  wrap all plots into an animation if there are mutiple plots in a chunk;
- `hide` -  generate plot files but hide them in the output document
- `dev` -  ('pdf' for LaTeX output and 'png' for HTML/markdown; character) the function name which will be used as a graphical device to record plots; for the convenience of usage, this package has included all the graphics devices in base R as well as those in Cairo, cairoDevice and tikzDevice, e.g. if we set dev='CairoPDF', the function with the same name in the Cairo package will be used for graphics output; if none of the 20 built-in devices is appropriate, we can still provide yet another name as long as it is a legal function name which can record plots (it must be of the form function(filename, width, height));

    note the units for images are always inches (even for bitmap devices, in which DPI is used to convert between pixels and inches); currently available devices are bmp, postscript, pdf, png, svg, jpeg, pictex, tiff, win.metafile, cairo_pdf, cairo_ps, CairoJPEG, CairoPNG, CairoPS, CairoPDF, CairoSVG, CairoTIFF, Cairo_pdf, Cairo_png, Cairo_ps, Cairo_svg, tikz and a series of quartz devices including quartz_pdf, quartz_png, quartz_jpeg, quartz_tiff, quartz_gif, quartz_psd, quartz_bmp which are just wrappers to the function quartz() with different file types
the options dev, fig.ext, fig.width, fig.height and dpi can be vectors (shorter ones will be recycled), e.g. `<<foo, dev=c('pdf', 'png')>>=` creates two files for the same plot: `foo.pdf` and `foo.png`
- `dev.args` -  (NULL) more arguments to be passed to the device, e.g. dev.args=list(bg='yellow', pointsize=10); note this depends on the specific device (see the device documentation); when dev has multiple elements, dev.args can be a list of lists of arguments with each list of arguments to be passed to each single device, e.g. <<dev=c('pdf', 'tiff'), dev.args=list(pdf = list(colormodel = 'cmyk', useDingats = TRUE), tiff = list(compression = 'lzw'))>>=
- `fig.ext` -  **(NULL; character)** file extension of the figure output (if NULL, it will be derived from the graphical device; see knitr:::auto_exts for details)
- `dpi` -  **(72; numeric)** the DPI (dots per inch) for bitmap devices **(dpi * inches = pixels)**

- `fig.width` -  \
- `fig.height` -  **(both are 7; numeric)** width and height of the plot, to be used in the graphics device (in inches) and have to be numeric
- `fig.asp` -  **(NULL; numeric)** the aspect ratio of the plot, i.e. the ratio of height/width; when fig.asp is specified, the height of a plot (the chunk option fig.height) is calculated from fig.width * fig.asp
- `fig.dim` -  **(NULL; numeric)** if a numeric vector of length 2, it gives fig.width and fig.height, e.g., fig.dim = c(5, 7) is a shorthand of fig.width = 5, fig.height = 7; if both fig.asp and fig.dim are provided, fig.asp will be ignored (with a warning)

- `out.width` -
- `out.height` -  **(NULL; character)** width and height of the plot in the final output file (can be different with its real fig.width and fig.height, i.e. plots can be scaled in the output document); depending on the output format, these two options can take flexible values, e.g. for LaTeX output, they can be .8\\linewidth, 3in or 8cm and for HTML, they may be 300px (do not have to be in inches like fig.width and fig.height; backslashes must be escaped as \\); for LaTeX output, the default value for out.width will be changed to \\maxwidth which is defined here
out.width can also be a percentage, e.g. '40%' will be translated to 0.4\linewidth when the output format is LaTeX
- `out.extra` -  **(NULL; character)** extra options for figures, e.g. out.extra='angle=90' in LaTeX output will rotate the figure by 90 degrees; it can be an arbitrary string, e.g. you can write multiple figure options in this option; it also applies to HTML images (extra options will be written into the <img /> tag, e.g. out.extra='style="display:block;"')
- `fig.retina` -  **(1; numeric)** this option only applies to HTML output; for Retina displays, setting this option to a ratio (usually 2) will change the chunk option dpi to dpi * fig.retina, and out.width to fig.width * dpi / fig.retina internally; for example, the physical size of an image is doubled and its display size is halved when fig.retina = 2
- `resize.width` -  /
- `resize.height` -  **(NULL; character)** the width and height to be used in \resizebox{}{} in LaTeX; these two options are not needed unless you want to resize tikz graphics because there is no natural way to do it; however, according to tikzDevice authors, tikz graphics is not meant to be resized to maintain consistency in style with other texts in LaTeX; if only one of them is NULL, ! will be used (read the documentation of graphicx if you do not understand this)
- `fig.align` -  **('default'; character)** alignment of figures in the output document (possible values are left, right and center; default is not to make any alignment adjustments); note that for Markdown output, forcing figure alignments will lead to the HTML tag <img /> instead of the original Markdown syntax ![](), because Markdown does not have native support for figure alignments (see #611)
- `fig.env` -  **('figure')** the LaTeX environment for figures, e.g. set fig.env='marginfigure' to get \begin{marginfigure}
- `fig.cap` -  **(NULL; character)** figure caption to be used in a figure environment in LaTeX (in \caption{}); if NULL or NA, it will be ignored, otherwise a figure environment will be used for the plots in the chunk (output in \begin{figure} and \end{figure})
- `fig.scap` -  **(NULL; character)** short caption; if NULL, all the words before . or ; or : will be used as a short caption; if NA, it will be ignored
- `fig.lp` -  **('fig:'; character)** label prefix for the figure label to be used in \label{}; the actual label is made by concatenating this prefix and the chunk label, e.g. the figure label for <<foo-plot>>= will be fig:foo-plot by default
- `fig.pos` -  **(''; character)** a character string for the figure position arrangement to be used in \begin{figure}[fig.pos]
- `fig.subcap` -  **(NULL)** captions for subfigures; when there are multiple plots in a chunk, and neither fig.subcap nor fig.cap is NULL, \subfloat{} will be used for individual plots (you need to add \usepackage{subfig} in the preamble); see 067-graphics-options.Rnw for an example
- `fig.ncol` -  **(NULL; integer)** the number of columns of subfigures; see here for examples (note that fig.ncol and fig.sep only work for LaTeX output)
- `fig.sep` -  **(NULL; character)** a character vector of separators to be inserted among subfigures; when fig.ncol is specified, fig.sep defaults to a character vector of which every N-th element is \newline (where N is the number of columns), e.g., fig.ncol = 2 means fig.sep = c('', '', '\\newline', '', '', '\\newline', '', ...)
- `fig.process` -  **(NULL)** a function to post-process a figure file; it should take a filename, and return a character string as the new source of the figure to be inserted in the output
- `fig.showtext` -  **(NULL)** if TRUE, call showtext::showtext.begin() before drawing plots; see the documentation of the showtext package for details
- `external` -  **(TRUE; logical)** whether to externalize tikz graphics (pre-compile tikz graphics to PDF); it is only used for the tikz() device in the tikzDevice package (i.e., when dev='tikz') and it can save time for LaTeX compilation
- `sanitize` -  **(FALSE; character)** whether to sanitize tikz graphics (escape special LaTeX characters); see documentation in the tikzDevice package
Note any number of plots can be recorded in a single code chunk, and this package does not need to know how many plots are in a chunk in advance – it can figure out automatically, and name these images as fig.path-label-i where i is incremental from 1; if a code chunk does not actually produce any plots, knitr will not record anything either (the graphics device is open only when plots are really produced); in other words, it does not matter if fig.keep='high' but no plots were produced.

Low-level plotting commands include lines() and points(), etc. To better understand fig.keep, consider the following chunk:

        <<test-plot>>=
        plot(1)         # high-level plot
        abline(0, 1)    # low-level change
        plot(rnorm(10)) # high-level plot
        ##many low-level changes in a loop (a single R expression)
        for(i in 1:10) {
            abline(v = i, lty = 2)
        }
        @
Normally this produces 2 plots in the output (i.e. when fig.keep='high'); for fig.keep='none', no plots will be saved; for fig.keep='all', 4 plots are saved; for fig.keep='first', the plot produced by plot(1) is saved, and for fig.keep='last', the last plot with 10 vertical lines is saved.

There are two hidden options which are not designed to be set by the users: fig.cur (the current figure number or index when there are multiple figures) and fig.num (the total number of figures in a chunk). The purpose of these two options is to help knitr deal with the filenames of multiple figures as well as animations. In some cases, we can make use of them to write animations into the output using plot files which are saved manually (see the graphics manual for examples).

#### Animation

- `interval` -  **(1; numeric)** number of seconds to pause between animation frames
- `animation.hook` -  **(knitr::hook_ffmpeg_html; function or character)** a hook function to create animations in HTML output; the default hook uses FFmpeg to convert images to a WebM video
another hook function is knitr::hook_gifski **(available in knitr >= v1.20.13)** based on the gifski package to create a GIF animation
this option can also take a character string 'ffmpeg' or 'gifski' as a shorthand of the corresponding hook function (e.g., animation.hook = 'gifski' means animation.hook = knitr::hook_gifski)
- `aniopts` -  **('controls,loop')** extra options for animations; see the documentation of the animate package
ffmpeg.bitrate (1M; character) to be passed to the -b:v argument of FFmpeg to control the quality of WebM videos created from FFmpeg
ffmpeg.format **(webm; character)** the video format of FFmpeg, i.e. the filename extension of the video
Code Chunk
- `code` -  **(NULL; character)** if provided, it will override the code in the current chunk; this allows us to programmatically insert code into the current chunk; e.g. a chunk option code = capture.output(dump('fivenum', '')) will use the source code of the function fivenum to replace the current chunk; e.g. a chunk option code = readLines('test.r') will use the content of the file test.r as the current chunk.
- `ref.label` -  **(NULL; character)** a character vector of labels of the chunks from which the code of the current chunk is inherited (see the demo for chunk reference)
Child Documents
- `child` -  **(NULL; character)** a character vector of filenames of child documents to be run and input into the main document
Language Engines
- `engine` -  **('R'; character)** the language name of the code chunk; currently other possible values are 'python' and 'awk'/'gawk'; the object knit_engines in this package can be used to set up engines for other languages
- `engine.path **(NULL; character)**` -  the path to the executable of the engine; this option makes it possible to use alternative executables in your system, e.g., the default python may be at /usr/bin/python, and you may set engine.path = '~/anaconda/bin/python' to use a different version of Python

`engine.path` can also be a list of paths, which makes it possible to set different engine paths for different engines, e.g.,

        knitr::opts_chunk$set(engine.path = list(
        python = '~/anaconda/bin/python',
        ruby = '/usr/local/bin/ruby'
        ))

The names of the list correspond to the names of the engines.

#### Option templates

- `opts.label` -  **(NULL; character)** the label of options set in opts_template (see ?opts_template); this option can save some typing efforts for sets of frequently used chunk options
#### Extracting source code
- `purl` -  **(TRUE; logical)** when running purl() to extract source code from a source document, whether to include or exclude a certain code chunk

#### Other Chunk Options

!!!note - `R.options` -  **(NULL)** local R options for a code chunk; these options are set temporarily via options() before the code chunk, and restored after the chunk

#### Package Options

The package options can be changed using the object opts_knit; for example,

        opts_knit$set(progress = TRUE, verbose = TRUE)

See ?opts_knit for the alternative approach to setting package options using the R base function options().

#### All package options are:


- `aliases` -  **(NULL)** a named character vector to specify the aliases of chunk options, e.g. c(h = 'fig.height', w = 'fig.width') tells knitr that the chunk option h really means fig.height, and w is an alias for fig.width; this option can be used to save some typing efforts for long option names
    - `base.dir` -  **(NULL)** an absolute directory under which the plots are generated
    - `base.url` -  **(NULL)** the base url for HTML pages
    - `child.path` -  **('')** the search path for child documents; by default child documents are searched for relative to the directory of the parent document
    - `concordance` -  **(FALSE)** whether to write a concordance file to map the output line numbers to the input line numbers; this enables one to navigate from the output to the input and can be helpful especially when TeX error occurs (this feature is mainly for RStudio)
    - `eval.after` -  **(fig.cap)** a character vector of option names; these options will be evaluated after a chunk is evaluated, and all other options will be evaluated before a chunk (e.g. for chunk option fig.cap=paste('p-value is', t.test(x)$p.value), it will be evaluated after the chunk according to the value of x if eval.after='fig.cap')
    - `global.par` -  **(FALSE)** if TRUE, the par() settings from the last code chunk will be preserved and applied to the next code chunk (of course, this only applies to base graphics); by default, knitr opens a new graphics device to record plots and close it after evaluating the code, so par() settings will be discarded
    - `header` -  the text to be inserted into the output document before the document begins (e.g. after \documentclass{article} in LaTeX, or <head> in HTML); this is useful for defining commands and styles in the LaTeX preamble or HTML header; the beginning of document is found using the pattern defined in knit_patterns$get('document.begin')
    latex.options.color, latex.options.graphicx **(NULL)**: options for the LaTeX packages color and graphicx, respectively
- `out.format` -  **(NULL)** possible values are latex, sweave, html, markdown and jekyll; it will be automatically determined based on the input file, and this option will affect which set of hooks to use (see ?render_latex for example); note this option has to be set before knit() runs (i.e. it does not work if you set it in the document), or alternatively, you can use the render_* series inside the document to set up the hooks
- `progress` -  **(TRUE)** whether to display a progress bar when running knitr; note it also depends on the R option KNITR_PROGRESS (it this variable is set to FALSE via options(KNITR_PROGRESS = FALSE), the progress option will be set to FALSE when knitr is loaded)

!!!check - `root.dir` -  **(NULL)** the root directory when evaluating code chunks; if NULL, the directory of the input document will be used

  - `self.contained` -  **(TRUE)** whether the output document should be self-contained (TeX styles written in the tex document, and CSS styles in HTML document); this option only applies to Rnw and Rhtml documents, and does not apply to R Markdown documents (Rmd)
  - `unnamed.chunk.label` -  (unnamed-chunk) the label prefix for unnamed chunks
  - `upload.fun` -  **(identity)** a function that takes a filename as its input, processes it and returns a character string when the output format is HTML or Markdown; typically it is a function to upload a image and return the link to the image, e.g. opts_knit$set(upload.fun = imgur_upload) can upload a file to http://imgur.com (see ?imgur_upload)
  - `verbose` -  **(FALSE)** whether to show verbose information (e.g., R code in each chunk and message logs) or just show chunk labels and options
  - `width` -  **(75)** it is used to set the R session option width that may affect the width of source code and text output


names(knitr::knit_engines$get())
Show in New WindowClear OutputExpand/Collapse Output
"awk"       "bash"      "coffee"    "gawk"      "groovy"
"haskell"   "lein"      "mysql"     "node"      **"octave"**
"perl"      "psql"      "Rscript"   "ruby"      "sas"
"scala"     "sed"       "sh"        "stata"     "zsh"
"highlight" "Rcpp"      "tikz"      "dot"       "c"
"fortran"   "fortran95" "asy"       "cat"       "asis"
"stan"      "block"     "block2"    "js"        "css"
"sql"       **"go"**    **"python"**"julia"     "sass"
"scss"

[RMarkdown](https://bookdown.org/yihui/rmarkdown/)

# Short Chunk Options

## Knitr

[Good Knitr and Markdown Source](https://r4ds.had.co.nz/r-markdown.html)

[knittr examples](https://github.com/yihui/knitr-examples)

header options.

        ---
        title: Habits
        author: John Doe
        date: March 22, 2005
        output:
            html_document * set to change output
                toc: true  #change for TOC
                toc_depth: 2
                toc_float: true *HTML only?
                fontsize: 11pt
                geometry: margin=0.5in
                    template: quarterly_report.htm
                    collapsed: false
                    smooth_scroll: false
                    number_sections: true
                    theme: united
                    highlight: tango
                    css: styles.css
                    fig_width: 7 #set the defailt
                    fig_height: 6
                    fig_caption: true
                    keep_tex:true
                    latex_engine: xelatex
                        self_contained: false
    theme: united
    highlight: textmate
        pandoc_args: [
      "--title-prefix", "Foo",
      "--id-prefix", "Bar"
    ]
        md_extensions: -autolink_bare_uris+hard_line_breaks
                df_print: paged # tables are printed as HTML tables with support for pagination over rows and columns.
            pdf_document:
                fig_width: 7
                fig_height: 6
                fig_caption: true
                in_header: preamble.tex
                before_body: doc-prefix.tex
                after_body: doc-suffix.tex
---


TABLE 3.3: The possible values of the df_print option for the pdf_document format.
Option	Description
default	Call the print.data.frame generic method
kable	Use the knitr::kable() function
tibble	Use the tibble::print.tbl_df() function

            ## Quarterly Results `{.tabset}`
            ### By Product
            (tab content)
            ### By Region
            (tab content)
            ## Quarterly Results {.tabset .tabset-fade .tabset-pills}
            ## Next Steps {#nextsteps .emphasized}

        #nextsteps {
        color: blue;
        }

        .emphasized {
        font-size: 1.2em;
        }


                Option	Description
        max.print	The number of rows to print.
        rows.print	The number of rows to display.
        cols.print	The number of columns to display.
        cols.min.print	The minimum number of columns to display.
        pages.print	The number of pages to display under page navigation.
        paged.print	When set to FALSE turns off paged tables.
        rownames.print	When set to FALSE turns off row names.


TABLE 3.4: Available top-level YAML metadata variables for LaTeX output.
Variable	Description
lang	Document language code
fontsize	Font size (e.g., 10pt, 11pt, or 12pt)
documentclass	LaTeX document class (e.g., article)
classoption	Options for documentclass (e.g., oneside)
geometry	Options for geometry class (e.g., margin=1in)
mainfont, sansfont, monofont, mathfont	Document fonts (works only with xelatex and lualatex)
linkcolor, urlcolor, citecolor	Color for internal, external, and citation links
 citation_package: natbib
 latex_engine: xelatex
opts_template$set(o.fig = list(fig.height = 4, fig.width = 4))
opts_template$set(o.excl = list(include=FALSE))
opts_template$set(o.typ = list(collapse=CON.COLLAPSE,include=TRUE,fig.align='center',cache=TRUE))
opts_template$set(o.tab = list(background='#AAAAAA',cache=TRUE,include=TRUE, results=FALSE))

highlight specifies the syntax highlighting style. Supported styles include default, tango, pygments, kate, monochrome, espresso, zenburn, haddock, and textmate. Pass null to prevent syntax highlighting.

Options for printing objects-
    - kable
    - DT
    - xtable
    - printr  is a companion to knitr containing printing methods for some common objects like matrices and data frames.

Data frame printing
You can enhance the default display of data frames via the df_print option. Valid values are shown in Table 3.1.

TABLE 3.1: The possible values of the df_print option for the html_document format.
Option	Description
default	Call the print.data.frame generic method
kable	Use the knitr::kable function
tibble	Use the tibble::print.tbl_df function
paged	Use rmarkdown::paged_table to create a pageable table

Examples
opts_knit$get("verbose")
opts_knit$set(verbose = TRUE)  # change it
if (interactive()) {
    # for unnamed chunks, use 'fig' as the figure prefix
    opts_knit$set(unnamed.chunk.label = "fig")
    knit("001-minimal.Rmd")  # from https://github.com/yihui/knitr-examples
}

##
- opts.label='o.fig'

- opts_template$set(o.fig = list(fig.height = 4, fig.width = 4))

- opts.label='o.excl'

- opts_template$set(o.excl = list(include=FALSE))

- opts.label='o.typ'

- opts_template$set(o.typ = list(collapse=CON.COLLAPSE,include=TRUE,fig.align='center',cache=TRUE))\

- opts.label='o.tab'

- opts_template$set(o.tab = list(background='AAAAAA',cache=TRUE,include=TRUE, results=FALSE)

[R Chunk Options](https://bookdown.org/yihui/rmarkdown/r-code.html)

 of 53
 $ eval         : logi TRUE
 $ echo         : logi TRUE
 $ results      : chr "markup" #hide
 $ tidy         : logi FALSE
 $ tidy.opts    : NULL
 $ collapse     : logi FALSE
 $ prompt       : logi FALSE
 $ comment      : chr "##"
 $ highlight    : logi TRUE
 $ strip.white  : logi TRUE
 $ size         : chr "normalsize"
 $ background   : chr "#F7F7F7"
 $ cache        : logi FALSE
 $ cache.path   : chr "cache/"
 $ cache.vars   : NULL
 $ cache.lazy   : logi TRUE
 $ dependson    : NULL
 $ autodep      : logi FALSE
 $ cache.rebuild: logi FALSE
 $ fig.keep     : chr "high"
 $ fig.show     : chr "asis"
 $ fig.align    : chr "default"
 $ fig.path     : chr "figure/"
 $ dev          : NULL
 $ dev.args     : NULL
 $ dpi          : num 72
 $ fig.ext      : NULL
 $ fig.width    : num 7
 $ fig.height   : num 7
 $ fig.env      : chr "figure"
 $ fig.cap      : NULL
 $ fig.scap     : NULL
 $ fig.lp       : chr "fig:"
 $ fig.subcap   : NULL
 $ fig.pos      : chr ""
 $ out.width    : NULL
 $ out.height   : NULL
 $ out.extra    : NULL
 $ fig.retina   : num 1
 $ external     : logi TRUE
 $ sanitize     : logi FALSE
 $ interval     : num 1
 $ aniopts      : chr "controls,loop"
 $ warning      : logi TRUE
 $ error        : logi TRUE
 $ message      : logi TRUE
 $ render       : NULL
 $ ref.label    : NULL
 $ child        : NULL
 $ engine       : chr "R"
 $ split        : logi FALSE
 $ include      : logi TRUE
 $ purl         : logi TRUE


[Figure sizing](https://r4ds.had.co.nz/graphics-for-communication.html#saving-your-plots)
The biggest challenge of graphics in R Markdown is getting your figures the right size and shape. There are five main options that control figure sizing: fig.width, fig.height, fig.asp, out.width and out.height. Image sizing is challenging because there are two sizes (the size of the figure created by R and the size at which it is inserted in the output document), and multiple ways of specifying the size (i.e., height, width, and aspect ratio: pick two of three).

#### Templates

`opts_template$set(myfigures = list(fig.height = 4, fig.width = 4))`

later you can reuse these chunk options by 'opts.label', e.g.

        <<foo, opts.label='myfigures'>>=

the above is equivalent to `<<foo, fig.height=4, fig.width=4>>=`

`names(knitr::knit_engines$get())`


`opts_chunk$set()` can change the default global options in a document
`knitr::opts_chunk$set(comment=NA, fig.width=6, fig.height=6))`.
 A few special notes on the options:
1. Chunk options must be written in one line.
2. no line breaks are allowed inside chunk options;
3. Avoid spaces and periods.n chunk labels and directory names; **use alphabetic characters with words separated by -**
`setup-options`,. `fig.path='figures/mcmc-'` `fig.path="abc"` `out.width='\\textwidth'`
convenience it will be automatically quoted(e.g.  \`\`\``{r, 2a}` will become \`\`\`\``{r, '2a'})`
   1. for logical options, `TRUE` and `FALSE`

#### Code Evaluation


- `eval` -  **(TRUE; logical)** whether to evaluate the code chunk;
#### Text Results

- `echo` - **(TRUE; logical or numeric)** whether to include R source code in the output file; b
  - `echo=2:3` means only echo the 2nd and 3rd expressions
  - `echo=-4` means to exclude the 4th expression
- `results` - `**('markup'; character)**` takes these possible values
  - `markup` -  mark up the results using the output hook,
  - `asis` -  output as-is, i.e., write raw results from R into the output document
  - `hold` -  hold all the output pieces and push them to the end of a chunk
  - `hide` **(or FALSE)** -  hide results;
- `collapse` - **(FALSE;** logical; if possible, collapse all the source and output blocks from one code chunk into a single block (by default, they are written to separate `<pre></pre>`blocks)
- `warning` -  **(TRUE; logical)** whether to preserve warnings (produced by warning()) (if FALSE, all warnings will be printed in the console instead of the output document);
- `error` -  **(TRUE; logical)** whether to preserve errors (from stop());
- `message` -  **(TRUE; logical)** whether to preserve messages emitted by message()
- `split` -  **(FALSE; logical)** whether to split the output from R into separate files and include them into LaTeX by \input{} or HTML by `<iframe></iframe>`; this option only works for .Rnw, .Rtex, and .Rhtml documents ~~Rmd~~


!!!note `include` -  **(TRUE; logical)** whether to include the chunk output in the final output document;
    the code is still evaluated and plot files are generated if there are any plots in the chunk,

- `strip.white` -  **(TRUE; logical)** whether to remove the white lines in the beginning or end
- `render` -  **(knitr::knit_print; function(x, options, ...)**) the function which formats the result of the chunk for the final output format. type in R:
            vignette ('knit_print', package = 'knitr')
            ?knitr::knit_print.
- `class.output` -  **(NULL; character)** useful for HTML output from R Markdown, appends classes that can be used in conjunction with CSS, so you can apply custom formatting.
- `class.message` -
- `class.warning` -
- `class.error` -  **(NULL; character)** similar to class.output but applied to messages, warnings, and errors in R Markdown output.

#### Code Decoration

- `tidy` -  **(FALSE)** whether to reformat the R code; other possible values are:
  - `TRUE (equivalent to 'formatR'):` use `formatR::tidy_source()` to reformat the code;
  - `'styler'`: use `styler::style_text()` to reformat the code;
  - a custom function of the form `function(code, ...) {} t`o return the reformatted code;
- `tidy.opts` -  **(NULL; list)** a list of options to be passed to the function determined by the tidy option, e.g., tidy.opts = list**(blank = FALSE, width.cutoff = 60)** for tidy = 'formatR' to remove blank lines and set the approximate line width to be 60
- `prompt` -  **(FALSE; logical)** whether to add the prompt characters in the R code (see prompt and continue in ?base::options; note that adding prompts can make it difficult for readers to copy R code from the output, so prompt=FALSE may be a better choice
this option may not work well when the chunk option engine is not R (#1274)
- `comment` -  **('##'; character)** the prefix to be put before source code output; default is to comment out the output by ##, which is good for readers to copy R source code since output is masked in comments **(set comment=NA to disable this feature)**
- `highlight` -  **(TRUE; logical)** whether to highlight the source code **(it is FALSE by default if the output is Sweave or listings)**
- `size` -  **('normalsize'; character)** font size for the default LaTeX output (see `?highlight` in the highlight package for a list of possible values)
- `background` -  (`'#F7F7F7'`; character or numeric) background color of chunks in LaTeX output (passed to the LaTeX package framed); the color model is rgb; it can be either a numeric vector of length 3, with each element between 0 and 1 to denote red, green and blue, or any built-in color in R like red or springgreen3 (see `colors()` for a full list), or a hex string like `#FFFF00`, or an integer (all these colors will be converted to the RGB model; see `?col2rgb` for details)
- `class.source` -  **(NULL; character)** useful for HTML output, appends classes that can be used in conjunction with css, so you can apply custom formatting.
There is a hidden option indent which stores the possible leading white spaces of the chunk, e.g. for the chunk below, indent is a character string of two spaces:

        ```{r}
        rnorm(10)
        ```
Currently this option is only used to indent markdown output, because leading white spaces have special meanings in markdown.

#### Cache

- `cache` -  **(FALSE; logical)** whether to cache a code chunk; when evaluating code chunks, the cached chunks are skipped, but the objects created in these chunks are (lazy-) loaded from previously saved databases (.rdb and .rdx) files, and these files are saved when a chunk is evaluated for the first time, or when cached files are not found (e.g. you may have removed them by hand); note the filename consists of the chunk label with an MD5 digest of the R code in the chunk (the MD5 string is a summary of the chunk text, and any changes in the chunk will produce a different MD5 digest); unlike the cacheSweave package which uses stashR, this package directly uses internal functions in base R for cache, and another difference is that results of the code will still be included in the output even when cache is used (whereas cacheSweave has no output when a chunk is cached), because knitr also caches the printed output of a code chunk as a character string
for advanced users, cache can be more granular and takes numeric values 0, 1, 2, 3; see the cache example page for “More granular cache”
- `cache.path` -  **('cache/'; character)** a prefix to be used for the names of cache files (by default they are saved to a directory named cache relative to the current working directory; you can also use an absolute dir here, e.g. `/home/foo/bar-` or `D:\\abc\\mycache`, but it is not recommended since such absolute directories may not exist in other people’s systems, therefore it is recommended to use relative directories)
- `cache.vars` -  **(NULL)** a character vector of variable names to be saved in the cache database; by default all variables created in the current chunks are identified and saved, but we can manually set the variables to be saved
- `cache.globals` -  **(NULL)** a character vector of the names of variables that are not created from the current chunk; this option is mainly for autodep = TRUE to work more precisely – a chunk B depends on chunk A when any of B’s global variables are A’s local variables; by default, the detection of global variables in a chunk is very conservative – it detects all possible variables in the chunk, no matter if they are local or global
- `cache.lazy` -  **(TRUE)** whether to `lazyLoad()` or directly `load()` objects; for very large objects, lazyloading may not work, so `cache.lazy=FALSE` may be desirable (see #572)
- `cache.comments` -  **(NULL)** if FALSE, changing comments in R code chunks will not invalidate the cache database
- `cache.rebuild` -  **(FALSE)** if TRUE, the chunk is evaluated even if cache=TRUE and no changes are made. This is useful when given an R code argument. For example: cache.rebuild=!file.exists**("path/to/file.ext")** (see #238).
- `dependson` -  **(NULL; character or numeric)** a character vector of chunk labels to specify which other chunks this chunk depends on; this option applies to cached chunks only – sometimes the objects in a cached chunk may depend on other cached chunks, so when other chunks are changed, this chunk must be updated accordingly
if dependson is a numeric vector, it means the indices of chunk labels, e.g. dependson=1 means this chunk depends on the first chunk in the document, and `dependson=c(-1, -2)` means it depends on the previous two chunks (negative indices stand for numbers of chunks before this chunk, and note they are always relative to the current chunk)
please note this option does not work when set as a global chunk option via `opts_chunk$set()`; it must be set as a local chunk option
- `autodep` -  **(FALSE; logical)** whether to figure out the dependencies among chunks automatically by analyzing the global variables in the code (may not be reliable) so that dependson does not need to be set explicitly

#### Plots

- `fig.path` -  **('figure/'; character)** prefix to be used for figure filenames (fig.path and chunk labels are concatenated to make filenames); it may contain a directory like figure/prefix- (will be created if it does not exist); this path is relative to the current working directory; if the prefix ends in a trailing slash, e.g. output/figures/, figures will be saved in the specified directory without any changes to filename prefix, thus providing a relative filepath alternative to the package-level option base.dir
- `fig.keep` -  **('high'; character)** how plots in chunks should be kept; it takes five possible character values or a numeric vector (see the end of this section for an example)
- `high` -  only keep high-level plots (merge low-level changes into high-level plots);
- `none` -  discard all plots;
- `all` -  keep all plots (low-level plot changes may produce new plots)
- `first` -  only keep the first plot
- `last` -  only keep the last plot
- `c(##)` - if set to a numeric vector: interpret value as index of (low-level) plots to keep
- `fig.show` -  **('asis'; character)** how to show/arrange the plots; four possible values are
- `asis` -  show plots exactly in places where they were generated (as if the code were run in an R terminal);
- `hold` -  hold all plots and output them in the very end of a code chunk;
- `animate` -  wrap all plots into an animation if there are mutiple plots in a chunk;
- `hide` -  generate plot files but hide them in the output document
- `dev` -  ('pdf' for LaTeX output and 'png' for HTML/markdown; character) the function name which will be used as a graphical device to record plots; for the convenience of usage, this package has included all the graphics devices in base R as well as those in Cairo, cairoDevice and tikzDevice, e.g. if we set dev='CairoPDF', the function with the same name in the Cairo package will be used for graphics output; if none of the 20 built-in devices is appropriate, we can still provide yet another name as long as it is a legal function name which can record plots (it must be of the form function(filename, width, height)); note the units for images are always inches (even for bitmap devices, in which DPI is used to convert between pixels and inches); currently available devices are bmp, postscript, pdf, png, svg, jpeg, pictex, tiff, win.metafile, cairo_pdf, cairo_ps, CairoJPEG, CairoPNG, CairoPS, CairoPDF, CairoSVG, CairoTIFF, Cairo_pdf, Cairo_png, Cairo_ps, Cairo_svg, tikz and a series of quartz devices including quartz_pdf, quartz_png, quartz_jpeg, quartz_tiff, quartz_gif, quartz_psd, quartz_bmp which are just wrappers to the function quartz() with different file types
the options dev, fig.ext, fig.width, fig.height and dpi can be vectors (shorter ones will be recycled), e.g. `<<foo, dev=c('pdf', 'png')>>=` creates two files for the same plot: `foo.pdf` and `foo.png`
- `dev.args` -  (NULL) more arguments to be passed to the device, e.g. dev.args=list(bg='yellow', pointsize=10); note this depends on the specific device (see the device documentation); when dev has multiple elements, dev.args can be a list of lists of arguments with each list of arguments to be passed to each single device, e.g. <<dev=c('pdf', 'tiff'), dev.args=list(pdf = list(colormodel = 'cmyk', useDingats = TRUE), tiff = list(compression = 'lzw'))>>=
- `fig.ext` -  **(NULL; character)** file extension of the figure output (if NULL, it will be derived from the graphical device; see knitr:::auto_exts for details)
- `dpi` -  **(72; numeric)** the DPI (dots per inch) for bitmap devices **(dpi * inches = pixels)**
- `fig.width` -  \
- `fig.height` -  **(both are 7; numeric)** width and height of the plot, to be used in the graphics device (in inches) and have to be numeric
- `fig.asp` -  **(NULL; numeric)** the aspect ratio of the plot, i.e. the ratio of height/width; when fig.asp is specified, the height of a plot (the chunk option fig.height) is calculated from fig.width * fig.asp
- `fig.dim` -  **(NULL; numeric)** if a numeric vector of length 2, it gives fig.width and fig.height, e.g., fig.dim = c(5, 7) is a shorthand of fig.width = 5, fig.height = 7; if both fig.asp and fig.dim are provided, fig.asp will be ignored (with a warning)
- `out.width` -
- `out.height` -  **(NULL; character)** width and height of the plot in the final output file (can be different with its real fig.width and fig.height, i.e. plots can be scaled in the output document); depending on the output format, these two options can take flexible values, e.g. for LaTeX output, they can be .8\\linewidth, 3in or 8cm and for HTML, they may be 300px (do not have to be in inches like fig.width and fig.height; backslashes must be escaped as \\); for LaTeX output, the default value for out.width will be changed to \\maxwidth which is defined here
out.width can also be a percentage, e.g. '40%' will be translated to 0.4\linewidth when the output format is LaTeX
- `out.extra` -  **(NULL; character)** extra options for figures, e.g. out.extra='angle=90' in LaTeX output will rotate the figure by 90 degrees; it can be an arbitrary string, e.g. you can write multiple figure options in this option; it also applies to HTML images (extra options will be written into the <img /> tag, e.g. out.extra='style="display:block;"')
- `fig.retina` -  **(1; numeric)** this option only applies to HTML output; for Retina displays, setting this option to a ratio (usually 2) will change the chunk option dpi to dpi * fig.retina, and out.width to fig.width * dpi / fig.retina internally; for example, the physical size of an image is doubled and its display size is halved when fig.retina = 2
- `resize.width` -  /
- `resize.height` -  **(NULL; character)** the width and height to be used in \resizebox{}{} in LaTeX; these two options are not needed unless you want to resize tikz graphics because there is no natural way to do it; however, according to tikzDevice authors, tikz graphics is not meant to be resized to maintain consistency in style with other texts in LaTeX; if only one of them is NULL, ! will be used (read the documentation of graphicx if you do not understand this)
- `fig.align` -  **('default'; character)** alignment of figures in the output document (possible values are left, right and center; default is not to make any alignment adjustments); note that for Markdown output, forcing figure alignments will lead to the HTML tag <img /> instead of the original Markdown syntax `![]()`, because Markdown does not have native support for figure alignments (see #611)
- `fig.env` -  **('figure')** the LaTeX environment for figures, e.g. set fig.env='marginfigure' to get \begin{marginfigure}
- `fig.cap` -  **(NULL; character)** figure caption to be used in a figure environment in LaTeX (in \caption{}); if NULL or NA, it will be ignored, otherwise a figure environment will be used for the plots in the chunk (output in \begin{figure} and \end{figure})
- `fig.scap` -  **(NULL; character)** short caption; if NULL, all the words before . or ; or : will be used as a short caption; if NA, it will be ignored
- `fig.lp` -  **('fig:'; character)** label prefix for the figure label to be used in \label{}; the actual label is made by concatenating this prefix and the chunk label, e.g. the figure label for <<foo-plot>>= will be fig:foo-plot by default
- `fig.pos` -  **(''; character)** a character string for the figure position arrangement to be used in \begin{figure}[fig.pos]
- `fig.subcap` -  **(NULL)** captions for subfigures; when there are multiple plots in a chunk, and neither fig.subcap nor fig.cap is NULL, \subfloat{} will be used for individual plots (you need to add \usepackage{subfig} in the preamble); see 067-graphics-options.Rnw for an example
- `fig.ncol` -  **(NULL; integer)** the number of columns of subfigures; see here for examples (note that fig.ncol and fig.sep only work for LaTeX output)
- `fig.sep` -  **(NULL; character)** a character vector of separators to be inserted among subfigures; when fig.ncol is specified, fig.sep defaults to a character vector of which every N-th element is \newline (where N is the number of columns), e.g., fig.ncol = 2 means fig.sep = c('', '', '\\newline', '', '', '\\newline', '', ...)
- `fig.process` -  **(NULL)** a function to post-process a figure file; it should take a filename, and return a character string as the new source of the figure to be inserted in the output
- `fig.showtext` -  **(NULL)** if TRUE, call showtext::showtext.begin() before drawing plots; see the documentation of the showtext package for details
- `external` -  **(TRUE; logical)** whether to externalize tikz graphics (pre-compile tikz graphics to PDF); it is only used for the tikz() device in the tikzDevice package (i.e., when dev='tikz') and it can save time for LaTeX compilation
- `sanitize` -  **(FALSE; character)** whether to sanitize tikz graphics (escape special LaTeX characters); see documentation in the tikzDevice package
Note any number of plots can be recorded in a single code chunk, and this package does not need to know how many plots are in a chunk in advance – it can figure out automatically, and name these images as fig.path-label-i where i is incremental from 1; if a code chunk does not actually produce any plots, knitr will not record anything either (the graphics device is open only when plots are really produced); in other words, it does not matter if fig.keep='high' but no plots were produced.

Low-level plotting commands include lines() and points(), etc. To better understand fig.keep, consider the following chunk:

        <<test-plot>>=
        plot(1)         # high-level plot
        abline(0, 1)    # low-level change
        plot(rnorm(10)) # high-level plot
        ##many low-level changes in a loop (a single R expression)
        for(i in 1:10) {
            abline(v = i, lty = 2)
        }
        @
Normally this produces 2 plots in the output (i.e. when fig.keep='high'); for fig.keep='none', no plots will be saved; for fig.keep='all', 4 plots are saved; for fig.keep='first', the plot produced by plot(1) is saved, and for fig.keep='last', the last plot with 10 vertical lines is saved.

There are two hidden options which are not designed to be set by the users: fig.cur (the current figure number or index when there are multiple figures) and fig.num (the total number of figures in a chunk). The purpose of these two options is to help knitr deal with the filenames of multiple figures as well as animations. In some cases, we can make use of them to write animations into the output using plot files which are saved manually (see the graphics manual for examples).

#### Animation

- `interval` -  **(1; numeric)** number of seconds to pause between animation frames
- `animation.hook` -  **(knitr::hook_ffmpeg_html; function or character)** a hook function to create animations in HTML output; the default hook uses FFmpeg to convert images to a WebM video
another hook function is knitr::hook_gifski **(available in knitr >= v1.20.13)** based on the gifski package to create a GIF animation
this option can also take a character string 'ffmpeg' or 'gifski' as a shorthand of the corresponding hook function (e.g., animation.hook = 'gifski' means animation.hook = knitr::hook_gifski)
- `aniopts` -  **('controls,loop')** extra options for animations; see the documentation of the animate package
ffmpeg.bitrate (1M; character) to be passed to the -b:v argument of FFmpeg to control the quality of WebM videos created from FFmpeg
ffmpeg.format **(webm; character)** the video format of FFmpeg, i.e. the filename extension of the video
Code Chunk
- `code` -  **(NULL; character)** if provided, it will override the code in the current chunk; this allows us to programmatically insert code into the current chunk; e.g. a chunk option code = capture.output(dump('fivenum', '')) will use the source code of the function fivenum to replace the current chunk; e.g. a chunk option code = readLines('test.r') will use the content of the file test.r as the current chunk.
- `ref.label` -  **(NULL; character)** a character vector of labels of the chunks from which the code of the current chunk is inherited (see the demo for chunk reference)
Child Documents
- `child` -  **(NULL; character)** a character vector of filenames of child documents to be run and input into the main document
Language Engines
- `engine` -  **('R'; character)** the language name of the code chunk; currently other possible values are 'python' and 'awk'/'gawk'; the object knit_engines in this package can be used to set up engines for other languages
- `engine.path **(NULL; character)**` -  the path to the executable of the engine; this option makes it possible to use alternative executables in your system, e.g., the default python may be at /usr/bin/python, and you may set engine.path = '~/anaconda/bin/python' to use a different version of Python

`engine.path` can also be a list of paths, which makes it possible to set different engine paths for different engines, e.g.,

    knitr::opts_chunk$set(engine.path = list(
    python = '~/anaconda/bin/python',
    ruby = '/usr/local/bin/ruby'
    ))

The names of the list correspond to the names of the engines.

#### Option templates

- `opts.label` -  **(NULL; character)** the label of options set in opts_template (see ?opts_template); this option can save some typing efforts for sets of frequently used chunk options
#### Extracting source code
- `purl` -  **(TRUE; logical)** when running purl() to extract source code from a source document, whether to include or exclude a certain code chunk

#### Other Chunk Options

- `R.options` -  **(NULL)** local R options for a code chunk; these options are set temporarily via options() before the code chunk, and restored after the chunk
#### Package Options

The package options can be changed using the object opts_knit; for example,

opts_knit$set(progress = TRUE, verbose = TRUE)
See ?opts_knit for the alternative approach to setting package options using the R base function options().

#### All package options are:


- `aliases` -  **(NULL)** a named character vector to specify the aliases of chunk options, e.g. c(h = 'fig.height', w = 'fig.width') tells knitr that the chunk option h really means fig.height, and w is an alias for fig.width; this option can be used to save some typing efforts for long option names
- `base.dir` -  **(NULL)** an absolute directory under which the plots are generated
- `base.url` -  **(NULL)** the base url for HTML pages
- `child.path` -  **('')** the search path for child documents; by default child documents are searched for relative to the directory of the parent document
- `concordance` -  **(FALSE)** whether to write a concordance file to map the output line numbers to the input line numbers; this enables one to navigate from the output to the input and can be helpful especially when TeX error occurs (this feature is mainly for RStudio)
- `eval.after` -  **(fig.cap)** a character vector of option names; these options will be evaluated after a chunk is evaluated, and all other options will be evaluated before a chunk (e.g. for chunk option fig.cap=paste('p-value is', t.test(x)$p.value), it will be evaluated after the chunk according to the value of x if eval.after='fig.cap')
- `global.par` -  **(FALSE)** if TRUE, the par() settings from the last code chunk will be preserved and applied to the next code chunk (of course, this only applies to base graphics); by default, knitr opens a new graphics device to record plots and close it after evaluating the code, so par() settings will be discarded
- `header` -  the text to be inserted into the output document before the document begins (e.g. after \documentclass{article} in LaTeX, or <head> in HTML); this is useful for defining commands and styles in the LaTeX preamble or HTML header; the beginning of document is found using the pattern defined in knit_patterns$get('document.begin')
latex.options.color, latex.options.graphicx **(NULL)**: options for the LaTeX packages color and graphicx, respectively
- `out.format` -  **(NULL)** possible values are latex, sweave, html, markdown and jekyll; it will be automatically determined based on the input file, and this option will affect which set of hooks to use (see ?render_latex for example); note this option has to be set before knit() runs (i.e. it does not work if you set it in the document), or alternatively, you can use the render_* series inside the document to set up the hooks
- `progress` -  **(TRUE)** whether to display a progress bar when running knitr; note it also depends on the R option KNITR_PROGRESS (it this variable is set to FALSE via options(KNITR_PROGRESS = FALSE), the progress option will be set to FALSE when knitr is loaded)
- `root.dir` -  **(NULL)** the root directory when evaluating code chunks; if NULL, the directory of the input document will be used
- `self.contained` -  **(TRUE)** whether the output document should be self-contained (TeX styles written in the tex document, and CSS styles in HTML document); this option only applies to Rnw and Rhtml documents, and does not apply to R Markdown documents (Rmd)
- `unnamed.chunk.label` -  (unnamed-chunk) the label prefix for unnamed chunks
- `upload.fun` -  **(identity)** a function that takes a filename as its input, processes it and returns a character string when the output format is HTML or Markdown; typically it is a function to upload a image and return the link to the image, e.g. opts_knit$set(upload.fun = imgur_upload) can upload a file to http://imgur.com (see ?imgur_upload)
- `verbose` -  **(FALSE)** whether to show verbose information (e.g., R code in each chunk and message logs) or just show chunk labels and options
- `width` -  **(75)** it is used to set the R session option width that may affect the width of source code and text output

## RMarkdown

Markdown Basics
This document provides quick references to the most commonly used R Markdown syntax. See the following articles for more in-depth treatment of all the capabilities of R Markdown:

#### Emphasis

`*italic*`
`**bold**`
`_italic_`
`__bold__`

#### Headers

`# Header 1`

`## Header 2`

`### Header 3`


#### Lists

Unordered List:
    * Item 1
    * Item 2
        + Item 2a
        + Item 2b

Ordered List:
    1. Item 1
    2. Item 2
    3. Item 3
        + Item 3a
        + Item 3b

#### R Code Chunks

R code will be evaluated and printed

        ```{r}
        summary(cars$dist)
        summary(cars$speed)
        ```
Inline R Code
        There were `r nrow(cars)` cars studied

R chuncks can be given options

[Documentation on Options](https://yihui.name/knitr/options/)

        ```{r, chunk-label, results='hide', fig.height=4}

The value of a chunk option can be an arbitrary R expression, which makes chunk options extremely flexible. For example, the chunk option eval controls whether to evaluate (execute) a code chunk, and you may conditionally evaluate a chunk via a variable defined previously, e.g.,

        ```{r}
        # execute code if the date is later than a specified day
        do_it = Sys.Date() > '2018-02-14'
        ```

        ```{r, eval=do_it}
        x = rnorm(100)
        ```

#### Links

Use a plain http address or add a link to a phrase:

        http://example.com

        [linked phrase](http://example.com)

#### Images

Images on the web or local files in the same directory:

        ![](http://example.com/logo.png)

        ![optional caption text](figures/img.png)

#### Blockquotes

A friend once said:

        > It's always better to give
        > than to receive.

#### Plain Code Blocks

Plain code blocks are displayed in a fixed-width font but not evaulated

        ```
        This text is displayed verbatim / preformatted
        ```

#### Inline Code

    We defined the `add` function to compute the sum of two numbers.

#### LaTeX Equations

Inline equation: `$equation$`
Display equation: `$$ equation $$`

#### Horizontal Rule / Page Break

Three or more asterisks or dashes:

        ******
or
        ------

#### Tables

        First Header  | Second Header
        ------------- | -------------
        Content Cell  | Content Cell
        Content Cell  | Content Cell

#### Reference Style Links and Images

##### Links
        A [linked phrase][id].

At the bottom of the document:

        [id]: http://example.com/ "Title"
        Images
        ![alt text][id]

At the bottom of the document:

        [id]: figures/img.png "Title"

#### Manual Line Breaks

End a line with two or more spaces:

        Roses are red,
        Violets are blue.

#### Miscellaneous

        superscript^2^

        ~~strikethrough~~

## Packages for Data Exploration and Summary
summarytools
explor
explorer
HMisc
Desctools
xplorr
esquisse
prettyR	Pretty Descriptive Stats

xray
vecsets	Like base::sets Tools But Keeps Duplicate Elements
descr	Descriptive Statistics
pwr	Basic Functions for Power Analysis
subtee	Subgroup Treatment Effect Estimation in Clinical Trials

PBSmodelling	GUI Tools Made Easy: Interact with Models and Explore Data


EHRtemporalVariability	Delineating Reference Changes in Electronic Health Records over Time

EventStudy	Event Study Analysis
fsdaR	Robust Data Analysis Through Monitoring and Dynamic Visualization
ggpol	Visualizing Social Science Data with 'ggplot2'
incidence	Compute, Handle, Plot and Model Incidence of Dated Events

PBSmodelling	GUI Tools Made Easy: Interact with Models and Explore Data
bayesCT	Simulation and Analysis of Adaptive Bayesian Clinical Trials
sjstats	Collection of Convenient Functions for Common
Statistical Computations

CARRoT	Predicting Categorical and Continuous Outcomes Using One in Ten Rule

arules	Mining Association Rules and Frequent Itemsets
2019-03-08	TestDataImputation	Missing Item Responses Imputation for Test and Assessment Data
2019-03-08	tidylog	Logging for 'dplyr' Functions
2019-03-08	validatetools	Checking and Simplifying Validation Rule Sets
2019-03-08	yardstick	Tidy Characterizations of Model Performance
	xplorerr	Tools for Interactive Data Exploration
sampler	Sample Design, Drawing & Data Analysis Using Data Frames
Hmisc	Harrell Miscellaneous
compareDF compareGroups compare CompareTests


## Shiny

Shiny Apps

Radiant
Argon
Shiny.dashboard
shiny
flexdashboard

tablerDash	'Tabler' API for 'Shiny'
htmlTable htmltools HTMLUtils htmlwidgets htmltidy
## tools
gWidgets	gWidgets API for Building Toolkit-Independent, Interactive GUIs
gplots	Various R Programming Tools for Plotting Data
caTools	Tools: moving window statistics, GIF, Base64, ROC AUC, etc
tidyr	Easily Tidy Data with 'spread()' and 'gather()' Function
dispRity	Measuring Disparity
	cloudSimplifieR	Fetch Data from Amazon AWS
infer	Tidy Statistical Inference
profvis	Interactive Visualizations for Profiling R Code
RCmdr.*
sys
filesstrings	Handy File and String Manipulation

formula.tools	Programmatic Utilities for Manipulating Formulas, Expressions, Calls, Assignments and Other R Objects
fuzzyjoin	Join Tables Together on Inexact Matching
ezpickr	Easy Data Import Using GUI File Picker and Seamless Communication Between an Excel and R
quotedargs	A Way of Writing Functions that Quote
their Arguments
	RSuite	Supports Developing, Building and Deploying R Solutio
sampler	Sample Design, Drawing & Data Analysis Using Data Frames
tools4uplift	Tools for Uplift Modeling
	weibulltools	Statistical Methods for Life Data Analysis
simr	Power Analysis for Generalised Linear Mixed Models by Simulation
## Lists
listviewer
listr

rainbow	Bagplots, Boxplots and Rainbow Plots for Functional Data
## Tables
jstable	Create Tables from Different Types of Regression
	flextable	Functions for Tabular Reporting
 DT dtables tablaxlsx taber table1 Table1Heatmap table1xls tableHTML tableMatrix TableMonster tableone tableplot tablerDash




## Graphs
gplots ggfan ggfittext ggfocus ggforce ggformula ggfortify ggghost ggguitar gghalfnorm gghighlight GGIR ggimage gginference gginnards ggjoy ggloop gglogo ggmosaic ggmap ggnetwork ggpage ggparallel ggparliament gganimate ggperiodic ggplot2 **ggplotAssist** **ggplotgui** **ggplotify** ggpmisc ggpol ggpolypath ggpubr ggpval ggQC ggquickeda ggquiver ggRandomForests ggraph ggraptR ggrasp ggrepel ggridges ggroc ggroups ggspatial ggsom ggstance ggstatsplot ggtern **ggThemeAssist** ggthemes ggTimeSeries ggtern ggupset ggversa ggvis ggvoronoi ggwordcloud ggcorrplot gge ggdemetra ggbeeswarm
memapp	The Moving Epidemic Method Web Applicatio
DEVis	A Differential Expression Analysis Toolkit for Visual Analytics and Data Aggregatio
	catseyes	Create Catseye Plots Illustrating the Normal Distribution of the Means
gplots	Various R Programming Tools for Plotting Data
d3r	'd3.js' Utilities for R
07	ggfan	Summarise a Distribution Through Coloured Intervals
fsdaR	Robust Data Analysis Through Monitoring and Dynamic Visualization
ggpol	Visualizing Social Science Data with 'ggplot2'
	plothelper	New Plots Based on 'ggplot2' and Functions to Create Regular Shapes
	igraph	Network Analysis and Visualization
DiagrammeR	Graph/Network Visualization
pals	Color Palettes, Colormaps, and Tools to Evaluate Them
	dygraphs	Interface to 'Dygraphs' Interactive Time Series Charting Library
plotly
ggedit
ggbuildr
ggraptR	Allows Interactive Visualization of Data Through a Web Browser GUI
iplots
manipulate
vcd	Visualizing Categorical Data
	RJSplot	Interactive Graphs with R
    jsTree	Create Interactive Trees with the 'jQuery' 'jsTree' Plugin
    threejs
manhattanly	Interactive Q-Q and Manhattan Plots Using 'plotly.js'
refund.shiny	Interactive Plotting for Functional Data Analyses
plotluck	'ggplot2' Version of "I'm Feeling Lucky!"
d3heatmap
ECharts2Shiny	Embedding Interactive Charts Generated with ECharts Library into Shiny Applications
	randomcoloR	Generate Attractive Random Color
	gTests	Graph-Based Two-Sample Tests

svgViewR	3D Animated Interactive Visualizations Using SVG
RPMG	Graphical User Interface (GUI) for Interactive R Analysis
tkRplotR	Display Resizable Plots
visreg	Visualization of Regression Models
slickR	Create Interactive Carousels with the JavaScript 'Slick' Library
	TTAinterfaceTrendAnalysis	Temporal Trend Analysis Graphical Interface
    visreg	Visualization of Regression Models
Rcssplot	Styling of Graphics using Cascading Style Sheets
fingertipscharts	Produce Charts that you See on the Fingertips Websi
plot.matrix	Visualizes a Matrix as Heatmap
Turtle Graphics
vistributions	Visualize Probability Distributions
visdat
vistime
visTree
visualFields
visNetwork visreg
VisuClust
visualize vistributions visualR



## Geographic
geofacet	'ggplot2' Faceting Utilities for Geographical Data
mapview	Interactive Viewing of Spatial Data in R
mapsRinteractive	Local Adaptation and Evaluation of Digital Soil Maps
geomedb	Functions for Fetching 'GeOMe-db' Data
popsom	Functions for Constructing and Evaluating Self-Organizing Maps

	intamapInteractive	Interactive Add-on Functionality for 'intamap'
    webglobe
datamaps	Create Interactive Web Maps with the
'JavaScript Datamaps' Library
intamapInteractive	Interactive Add-on Functionality for 'intamap'

FedData	Functions to Automate Downloading Geospatial Data Available from Several Federated Data Sources
rgdal	Bindings for the 'Geospatial' Data Abstraction Library

## Eduction
shinystan	Interactive Visual and Numerical Diagnostics and Posterior Analysis for Bayesian Models
LearnBayes learnr learnrbook learnstats

## datasets
	boxoffice	Downloads Box Office Information for Given Dates
FedData	Functions to Automate Downloading Geospatial Data Available from Several Federated Data Sources

shinyaframe shinyalert shinyanimate shinybotstrap2 shinyBS shinybusy shinycssloaders shinydashboard shinycustomloader shinydashboardPlus shinyDND shinyEffects shinyEventLogger shinyFeedback shinyFiles shinyHeatmaply ShinyImage ShinyItemAnalysis shinyjqui shinyjs shinyKGode shinylogs shinyLP shinymaterial shinyMatrix shinyrecap shinyRGL shinyShortcut shinystan shinytest ShinyTester shinythemes shinyTime shinytoastr shinyTree shinyWidgets radiant radiant.basics radiant.data radiant.design radiant.model radiant.multivariate jsmodule BLRShiny KNNShiny magick magickGUI UCSCXenaShiny UCSCXenaTools NBShiny CTShiny airGRteaching ANOVAShiny periscope CLUSTShiny MLDAShiny NBShiny, PREPShiny PROBShiny ASSOCShiny MLRShiny CTAShiny bs4Dash crunchy MNLR reactlog shinyHeatmaply shinyhelper shinyhttr AnthropMMD pushbar rclipboard waiter tablerDash mwshiny noteMD  auth0  carbonate D3GB d3heatmap d3Network D3partitionR d3plus d3r d3Tree jsmodule jstable dqrng dqshiny abstractr  mephas RLumModel RLumShiny Luminescence voronoiTreemap rsconnect Rsconctdply argon2 argonDash argonR wiseR TAShiny PDShiny stminsights semantic.dashboard semdrw  factoshiny ttestshiny MtreeRing RInno RtutoR CTT CTTinShiny CTTShiny cocktailApp  shinyjqui ERSA tippy autoshiny dragulaR teachingApps TeachingDemos TeachingSampling miniGUI miniUI bigQueryR dashboard semantic.dashboard bsplus ICS ICSNP ICSOutlier ICSShiny ICsurv KappaGUI KappaV paramGUI ParamHelpers ade4TkGUI adegenet adegraphics adehabitatHR ade4 adehabitatHS adehabitatLT adehabitatMA adephylo adepro adeptdata adespatial bullwhipgame ECharts2Shiny echarts4r plotly msaR colourpicker regexPipes regexSelect SpatialEpiApp  Mavis midas midasr midastouch IRTShiny lavaan lavaan.shiny lavaan.survey lavaanPlot stmgui refund refund.shiny shinyTime QRAGadget gwdegree  shinytoatr ChannelAttributionApp NACHO cromwellDashboard flexdashboard processanimateR processcheckR processmapR processmonitR processR CLUSTShiny  g3viz sdcHierarchies sdcTable sdcTarget sdcMicro  explor exploreR FastRWeb chromoMap ggimage ggiraph ggiraphExtra ExPanDaR sleepwalk STAT NDP bnviewer bipartite bipartiteD3 unitizer  loon plainview BioCircos iheatmapr mapedit cubeview mapsapi mapsRinteractive xplorerr Xplortext qtlcharts safetyGraphics gWidgets gWidgets2 gWidgets2RGtk2 gWidgets2tcltk gWidgetsRGtk2 gWidgetstcltk maodecj timevis trelliscopejs netCoin  rfviz esquisse directotree listviewer GUIDE GUIgems GUILDS GUIProfiler uiucthemes wilson datadigest leaflet leaflet.esri leaflet.extras leaflet.minicharts leaflet.opacity leafletCN leafletR CollapseLevels collapsibleTree dygraphs GGEBiplotGUI ggbuildr ggedit LearnBayes learnr learnrbook learnstats plotROC plot3D plot3Drgl iplots manipulate manipulateWidget iplots  iqlearn data.table dataGraph DataExplorer datamap datamaps  rpanel xplain  imap InteractiveIGraph timeline sendplot twiddler TSTutorial meifly clusterfly IBrokers MDSGUI LinRegInteractive REST restatapi restfulr restimizeapi reshape reshape2 reshapeGUI migui hive LDAvis learnstats metricsgraphics manhattanly dynBiplotGUI idendr0 focusedMDS D3GB zooaRchGUI exCon threejs gradientPickerD3 jsTree phylocanvas RPMG svgViewR  zooaRchGUI zoomgrid d3Tree webglobe MetaAnalyser dynamicGraph DynaRankR GGally ggasym IMP imageData imager imagerExtra intamapInteractive Interact interactions interactionTest interAdapt exCon  descr fivethirtyeight rcss Rcssplot tidybayes tidyboot tidygraph tidyimpute tidystats tidyselect tidystringdist tidytext tidybayes tidymv tidyLPA tidytidbits tidytransit tidyverse tibbletime RtutoR R.utils profvis plothelper ez ezec ezglm ezknitr ezpickr ezplot ezsim JFE plot.matrix plotlyGeoAssets plotscale plotwidgets DiagrammeR DiallelAnalysisR d3Network maGUI PBSadmb pdftools PDShiny PBSmapping pbs PBSmodelling PBSddesolve dextergui visdat vistime visTree visualFields visNetwork visreg VisuClust visualize vistributions visualR RSuite caTools  sanoker Hmisc  memapp sampler compareDF compareGroups compare CompareTests DT dtables tablaxlsx taber table1 Table1Heatmap table1xls tableHTML tableMatrix TableMonster tableone tableplot tablerDash htmlTable htmltools HTMLUtils htmlwidgets htmltidy gplots ggfan ggfittext ggfocus ggforce ggformula ggfortify ggghost ggguitar gghalfnorm gghighlight GGIR ggimage gginference gginnards ggjoy ggloop gglogo ggmosaic ggmap ggnetwork ggpage ggparallel ggparliament gganimate ggperiodic ggplot2 ggplotAssist ggplotgui ggplotify ggpmisc ggpol ggpolypath ggpubr ggpval ggQC ggquickeda ggquiver ggRandomForests ggraph ggraptR ggrasp ggrepel ggridges ggroc ggroups ggspatial ggsom ggstance ggstatsplot ggtern ggThemeAssist ggthemes ggTimeSeries ggtern ggupset ggversa ggvis ggvoronoi ggwordcloud ggcorrplot gge ggdemetra ggbeeswarm ggbuildr ggdistribute GGally ggallin


ro", "explor", "exploreR", "FastRWeb", "chromoMap", "ggimage", "ggiraph", "ggiraphExtra", "ExPanDaR", "sleepwalk", "STAT", "NDP", "bnviewer", "bipartite", "bipartiteD3", "unitizer", "loon", "plainview", "BioCircos", "iheatmapr", "mapedit", "cubeview", "mapsapi", "mapsRinteractive", "xplorerr", "Xplortext", "qtlcharts", "safetyGraphics", "gWidgets", "gWidgets2", "gWidgets2RGtk2", "gWidgets2tcltk", "gWidgetsRGtk2", "gWidgetstcltk", "maodecj", "timevis", "trelliscopejs", "netCoin", "rfviz", "esquisse", "directotree", "listviewer", "GUIDE", "GUIgems", "GUILDS", "GUIProfiler", "uiucthemes", "wilson", "datadigest", "leaflet", "leaflet.esri", "leaflet.extras", "leaflet.minicharts", "leaflet.opacity", "leafletCN", "leafletR", "CollapseLevels", "collapsibleTree", "dygraphs", "GGEBiplotGUI", "ggbuildr", "ggedit", "LearnBayes", "learnr", "learnrbook", "learnstats", "plotROC", "plot3D", "plot3Drgl", "iplots", "manipulate", "manipulateWidget", "iplots", "iqlearn", "data.table", "dataGraph", "DataExplorer", "datamap", "datamaps", "rpanel", "xplain", "imap", "InteractiveIGraph", "timeline", "sendplot", "twiddler", "TSTutorial", "meifly", "clusterfly", "IBrokers", "MDSGUI", "LinRegInteractive", "REST", "restatapi", "restfulr", "restimizeapi", "reshape", "reshape2", "reshapeGUI", "migui", "hive", "LDAvis", "learnstats", "metricsgraphics", "manhattanly", "dynBiplotGUI", "idendr0", "focusedMDS", "D3GB", "zooaRchGUI", "exCon", "threejs", "gradientPickerD3", "jsTree", "phylocanvas", "RPMG", "svgViewR", "zooaRchGUI", "zoomgrid", "d3Tree", "webglobe", "MetaAnalyser", "dynamicGraph", "DynaRankR", "GGally", "ggasym", "IMP", "imageData", "imager", "imagerExtra", "intamapInteractive", "Interact", "interactions", "interactionTest", "interAdapt", "exCon", "descr", "fivethirtyeight", "rcss", "Rcssplot", "tidybayes", "tidyboot", "tidygraph", "tidyimpute", "tidystats", "tidyselect", "tidystringdist", "tidytext", "tidybayes", "tidymv", "tidyLPA", "tidytidbits", "tidytransit", "tidyverse", "tibbletime", "RtutoR", "R.utils", "profvis", "plothelper", "ez", "ezec", "ezglm", "ezknitr", "ezpickr", "ezplot", "ezsim", "JFE", "plot.matrix", "plotlyGeoAssets", "plotscale", "plotwidgets", "DiagrammeR", "DiallelAnalysisR", "d3Network", "maGUI", "PBSadmb", "pdftools", "PDShiny", "PBSmapping", "pbs", "PBSmodelling", "PBSddesolve", "dextergui", "visdat", "vistime", "visTree", "visualFields", "visNetwork", "visreg", "VisuClust", "visualize", "vistributions", "visualR", "RSuite", "caTools", "sanoker", "Hmisc", "memapp", "sampler", "compareDF", "compareGroups", "compare", "CompareTests", "DT", "dtables", "tablaxlsx", "taber", "table1", "Table1Heatmap", "table1xls", "tableHTML", "tableMatrix", "TableMonster", "tableone", "tableplot", "tablerDash", "htmlTable", "htmltools", "HTMLUtils", "htmlwidgets", "htmltidy", "gplots", "ggfan", "ggfittext", "ggfocus", "ggforce", "ggformula", "ggfortify", "ggghost", "ggguitar", "gghalfnorm", "gghighlight", "GGIR", "ggimage", "gginference", "gginnards", "ggjoy", "ggloop", "gglogo", "ggmosaic", "ggmap", "ggnetwork", "ggpage", "ggparallel", "ggparliament", "gganimate", "ggperiodic", "ggplot2", "ggplotAssist", "ggplotgui", "ggplotify", "ggpmisc", "ggpol", "ggpolypath", "ggpubr", "ggpval", "ggQC", "ggquickeda", "ggquiver", "ggRandomForests", "ggraph", "ggraptR", "ggrasp", "ggrepel", "ggridges", "ggroc", "ggroups", "ggspatial", "ggsom", "ggstance", "ggstatsplot", "ggtern", "ggThemeAssist", "ggthemes", "ggTimeSeries", "ggtern", "ggupset", "ggversa", "ggvis", "ggvoronoi", "ggwordcloud", "ggcorrplot", "gge", "ggdemetra", "ggbeeswarm", "ggbuildr", "ggdistribute", "GGally", "ggallin"))
## Shortcuts

| Console                                             |                                          |
| --------------------------------------------------- | ---------------------------------------- |
| Description                                         | Windows & Linux                          |
| Move cursor to Console                              | Ctrl+2                                   |
| Clear console                                       | Ctrl+L                                   |
| Move cursor to beginning of line                    | Home                                     |
| Move cursor to end of line                          | End                                      |
| Navigate command history                            | Up/Down                                  |
| Popup command history                               | Ctrl+Up                                  |
| Interrupt currently executing command               | Esc                                      |
| Change working directory                            | Ctrl+Shift+H                             |
| Source                                              |                                          |
| Description                                         | Windows & Linux                          |
| Goto File/Function                                  | Ctrl+.                                   |
| Move cursor to Source Editor                        | Ctrl+1                                   |
| New document (except on Chrome/Windows)             | Ctrl+Shift+N                             |
| New document (Chrome only)                          | Ctrl+Alt+Shift+N                         |
| Open document                                       | Ctrl+O                                   |
| Save active document                                | Ctrl+S                                   |
| Close active document (except on Chrome)            | Ctrl+W                                   |
| Close active document (Chrome only)                 | Ctrl+Alt+W                               |
| Close all open documents                            | Ctrl+Shift+W                             |
| Preview HTML (Markdown and HTML)                    | Ctrl+Shift+K                             |
| Knit Document (knitr)                               | Ctrl+Shift+K                             |
| Compile Notebook                                    | Ctrl+Shift+K                             |
| Compile PDF (TeX and Sweave)                        | Ctrl+Shift+K                             |
| Insert chunk (Sweave and Knitr)                     | Ctrl+Alt+I                               |
| Insert code section                                 | Ctrl+Shift+R                             |
| Run current line/selection                          | Ctrl+Enter                               |
| Run current line/selection (retain cursor position) | Alt+Enter                                |
| Re-run previous region                              | Ctrl+Shift+P                             |
| Run current document                                | Ctrl+Alt+R                               |
| Run from document beginning to current line         | Ctrl+Alt+B                               |
| Run from current line to document end               | Ctrl+Alt+E                               |
| Run the current function definition                 | Ctrl+Alt+F                               |
| Run the current code section                        | Ctrl+Alt+T                               |
| Run previous Sweave/Rmd code                        | Ctrl+Alt+P                               |
| Run the current Sweave/Rmd chunk                    | Ctrl+Alt+C                               |
| Run the next Sweave/Rmd chunk                       | Ctrl+Alt+N                               |
| Source a file                                       | Ctrl+Shift+O                             |
| Source the current document                         | Ctrl+Shift+S                             |
| Source the current document (with echo)             | Ctrl+Shift+Enter                         |
| Fold Selected                                       | Alt+L                                    |
| Unfold Selected                                     | Shift+Alt+L                              |
| Fold All                                            | Alt+O                                    |
| Unfold All                                          | Shift+Alt+O                              |
| Go to line                                          | Shift+Alt+G                              |
| Jump to                                             | Shift+Alt+J                              |
| Switch to tab                                       | Ctrl+Shift+.                             |
| Previous tab                                        | Ctrl+F11                                 |
| Next tab                                            | Ctrl+F12                                 |
| First tab                                           | Ctrl+Shift+F11                           |
| Last tab                                            | Ctrl+Shift+F12                           |
| Navigate back                                       | Ctrl+F9                                  |
| Navigate forward                                    | Ctrl+F10                                 |
| Extract function from selection                     | Ctrl+Alt+X                               |
| Extract variable from selection                     | Ctrl+Alt+V                               |
| Reindent lines                                      | Ctrl+I                                   |
| Comment/uncomment current line/selection            | Ctrl+Shift+C                             |
| Reflow Comment                                      | Ctrl+Shift+/                             |
| Reformat Selection                                  | Ctrl+Shift+A                             |
| Show Diagnostics                                    | Ctrl+Shift+Alt+P                         |
| Transpose Letters                                   |                                          |
| Move Lines Up/Down                                  | Alt+Up/Down                              |
| Copy Lines Up/Down                                  | Shift+Alt+Up/Down                        |
| Jump to Matching Brace/Paren                        | Ctrl+P                                   |
| Expand to Matching Brace/Paren                      | Ctrl+Shift+E                             |
| Select to Matching Brace/Paren                      | Ctrl+Shift+Alt+E                         |
| Add Cursor Above Current Cursor                     | Ctrl+Alt+Up                              |
| Add Cursor Below Current Cursor                     | Ctrl+Alt+Down                            |
| Move Active Cursor Up                               | Ctrl+Alt+Shift+Up                        |
| Move Active Cursor Down                             | Ctrl+Alt+Shift+Down                      |
| Find and Replace                                    | Ctrl+F                                   |
| Find Next                                           | Win: F3, Linux: Ctrl+G                   |
| Find Previous                                       | Win: Shift+F3, Linux: Ctrl+Shift+G       |
| Use Selection for Find                              | Ctrl+F3                                  |
| Replace and Find                                    | Ctrl+Shift+J                             |
| Find in Files                                       | Ctrl+Shift+F                             |
| Check Spelling                                      | F7                                       |
| Editing (Console and Source)                        |                                          |
| Description                                         | Windows & Linux                          |
| Undo                                                | Ctrl+Z                                   |
| Redo                                                | Ctrl+Shift+Z                             |
| Cut                                                 | Ctrl+X                                   |
| Copy                                                | Ctrl+C                                   |
| Paste                                               | Ctrl+V                                   |
| Select All                                          | Ctrl+A                                   |
| Jump to Word                                        | Ctrl+Left/Right                          |
| Jump to Start/End                                   | Ctrl+Home/End or Ctrl+Up/Down            |
| Delete Line                                         | Ctrl+D                                   |
| Select                                              | Shift+[Arrow]                            |
| Select Word                                         | Ctrl+Shift+Left/Right                    |
| Select to Line Start                                | Alt+Shift+Left                           |
| Select to Line End                                  | Alt+Shift+Right                          |
| Select Page Up/Down                                 | Shift+PageUp/PageDown                    |
| Select to Start/End                                 | Ctrl+Shift+Home/End or Shift+Alt+Up/Down |
| Delete Word Left                                    | Ctrl+Backspace                           |
| Delete Word Right                                   |                                          |
| Delete to Line End                                  |                                          |
| Delete to Line Start                                |                                          |
| Indent                                              | Tab (at beginning of line)               |
| Outdent                                             | Shift+Tab                                |
| Yank line up to cursor                              | Ctrl+U                                   |
| Yank line after cursor                              | Ctrl+K                                   |
| Insert currently yanked text                        | Ctrl+Y                                   |
| Insert assignment operator                          | Alt+-                                    |
| Insert pipe operator                                | Ctrl+Shift+M                             |
| Show help for function at cursor                    | F1                                       |
| Show source code for function at cursor             | F2                                       |
| Find usages for symbol at cursor (C++)              | Ctrl+Alt+U                               |
| Completions (Console and Source)                    |                                          |
| Description                                         | Windows & Linux                          |
| Attempt completion                                  | Tab or Ctrl+Space                        |
| Navigate candidates                                 | Up/Down                                  |
| Accept selected candidate                           | Enter, Tab, or Right                     |
| Dismiss completion popup                            | Esc                                      |
| Views                                               |                                          |
| Description                                         | Windows & Linux                          |
| Move focus to Source Editor                         | Ctrl+1                                   |
| Move focus to Console                               | Ctrl+2                                   |
| Move focus to Help                                  | Ctrl+3                                   |
| Show History                                        | Ctrl+4                                   |
| Show Files                                          | Ctrl+5                                   |
| Show Plots                                          | Ctrl+6                                   |
| Show Packages                                       | Ctrl+7                                   |
| Show Environment                                    | Ctrl+8                                   |
| Show Git/SVN                                        | Ctrl+9                                   |
| Show Build                                          | Ctrl+0                                   |
| Sync Editor & PDF Preview                           | Ctrl+F8                                  |
| Show Keyboard Shortcut Reference                    | Alt+Shift+K                              |
| Build                                               |                                          |
| Description                                         | Windows & Linux                          |
| Build and Reload                                    | Ctrl+Shift+B                             |
| Load All (devtools)                                 | Ctrl+Shift+L                             |
| Test Package (Desktop)                              | Ctrl+Shift+T                             |
| Test Package (Web)                                  | Ctrl+Alt+F7                              |
| Check Package                                       | Ctrl+Shift+E                             |
| Document Package                                    | Ctrl+Shift+D                             |
| Debug                                               |                                          |
| Description                                         | Windows & Linux                          |
| Toggle Breakpoint                                   | Shift+F9                                 |
| Execute Next Line                                   | F10                                      |
| Step Into Function                                  | Shift+F4                                 |
| Finish Function/Loop                                | Shift+F6                                 |
| Continue                                            | Shift+F5                                 |
| Stop Debugging                                      | Shift+F8                                 |
| Plots                                               |                                          |
| Description                                         | Windows & Linux                          |
| Previous plot                                       | Ctrl+Alt+F11                             |
| Next plot                                           | Ctrl+Alt+F12                             |
| Git/SVN                                             |                                          |
| Description                                         | Windows & Linux                          |
| Diff active source document                         | Ctrl+Alt+D                               |
| Commit changes                                      | Ctrl+Alt+M                               |
| Scroll diff view                                    | Ctrl+Up/Down                             |
| Stage/Unstage (Git)                                 | Spacebar                                 |
| Stage/Unstage and move to next (Git)                | Enter                                    |
| Session                                             |                                          |
| Description                                         | Windows & Linux                          |
| Quit Session (desktop only)                         | Ctrl+Q                                   |
| Restart R Session                                   | Ctrl+Shift+F10                           |
| Terminal                                            |                                          |
| Description                                         | Windows & Linux                          |
| New Terminal                                        | Shift+Alt+T                              |
| Rename Current Terminal                             | Shift+Alt+R                              |
| Clear Current Terminal                              | Ctrl+Shift+L                             |
| Move Focus to Terminal                              | Ctrl+Shift+T                             |
| Previous Terminal                                   | Ctrl+Alt+F11                             |
| Next Terminal                                       | Ctrl+Alt+F12                             |

## RStudio API



- `addTheme` - Add a Custom Editor Theme
- `applyTheme` - Apply an Editor Theme to RStudio
- `as.document_position` - Create a Document Position
- `as.document_range` - Create a Range
- `askForPassword` - Ask the user for a password interactively
- `askForSecret` - Show Prompt for Secret Dialog
- `build-tools` - Build Tools
- `buildToolsCheck` - Build Tools
- `buildToolsExec` - Build Tools
- `buildToolsInstall` - Build Tools
- `callFun` - Call an RStudio API function
- `convertTheme` - Convert a tmTheme to an RStudio Theme
- `createProjectTemplate` - Create a Project Template
- `dictionaries` - Interact with RStudio's Dictionaries
- `dictionariesPath` - Interact with RStudio's Dictionaries
- `documentNew` - Interact with Documents open in RStudio
- `documentSave` - Interact with Documents open in RStudio
- `documentSaveAll` - Interact with Documents open in RStudio
- `document_position` - Create a Document Position
- `document_range` - Create a Range
- `file-dialogs` - Select a File / Folder
- `findFun` - Exists/get for RStudio functions
- `getActiveDocumentContext` - Retrieve Information about an RStudio Editor
- `getActiveProject` - Path to Active RStudio Project
- `getConsoleEditorContext` - Retrieve Information about an RStudio Editor
- `getPersistentValue` - Persistent Keys and Values
- `getSourceEditorContext` - Retrieve Information about an RStudio Editor
- `getThemeInfo` - Retrieve Themes
- `getThemes` - Get Theme List
- `getVersion` - Return the current version of the RStudio API
- `hasColorConsole` - Check if Console Supports ANSI Color Escapes
- `hasFun` - Exists/get for RStudio functions
- `initializeProject` - Open a Project in RStudio
- `insertText` - Interact with Documents open in RStudio
- `is.document_position` - Create a Document Position
- `is.document_range` - Create a Range
- `isAvailable` - Check if RStudio is running.
- `jobAdd` - Add a Job
- `jobAddOutput` - Add Job Output
- `jobAddProgress` - Add Job Progress
- `jobRemove` - Remove a Job
- `jobRunScript` - Run R Script As Job
- `jobSetProgress` - Set Job Progress
- `jobSetState` - Set Job State
- `jobSetStatus` - Set Job Status
- `modifyRange` - Interact with Documents open in RStudio
- `navigateToFile` - Navigate to File
- `openProject` - Open a Project in RStudio
- `persistent-values` - Persistent Keys and Values
- `previewRd` - Preview an Rd topic in the Help pane
- `previewSql` - Preview SQL statement
- `primary_selection` - Extract the Primary Selection
- `projects` - Open a Project in RStudio
- `readPreference` - Read Preference
- `removeTheme` - Remove a custom theme from RStudio.
- `restartSession` - Restart the R Session
- `rstudio-documents` - Interact with Documents open in RStudio
- `rstudio-editors` - Retrieve Information about an RStudio Editor
- `savePlotAsImage` - Save Active RStudio Plot as an Image
- `selectDirectory` - Select a File / Folder
- `selectFile` - Select a File / Folder
- `sendToConsole` - Send Code to the R Console
- `setCursorPosition` - Interact with Documents open in RStudio
- `setDocumentContents` - Interact with Documents open in RStudio
- `setPersistentValue` - Persistent Keys and Values
- `setSelectionRanges` - Interact with Documents open in RStudio
- `showDialog` - Show Dialog Box
- `showPrompt` - Show Prompt Dialog Box
- `showQuestion` - Show Question Dialog Box
- `sourceMarkers` - Display Source Markers
- `terminalActivate` - Activate Terminal
- `terminalBuffer` - Get Terminal Buffer
- `terminalBusy` - Is Terminal Busy
- `terminalClear` - Clear Terminal Buffer
- `terminalContext` - Retrieve Information about RStudio Terminals
- `terminalCreate` - Create a Terminal
- `terminalExecute` - Execute Command
- `terminalExitCode` - Terminal Exit Code
- `terminalKill` - Kill Terminal
- `terminalList` - Get All Terminal Ids
- `terminalRunning` - Is Terminal Running
- `terminalSend` - Send Text to a Terminal
- `terminalVisible` - Get Visible Terminal
- `translateLocalUrl` - Translate Local URL
- `updateDialog` - Updates a Dialog Box
- `userDictionariesPath` - Interact with RStudio's Dictionaries
- `verifyAvailable` - Check if RStudio is running.
- `versionInfo` - RStudio Version Information
- `viewer` - View local web content within RStudio
- `writePreference` - Write Preference

## Base functions (from Rcore)

### utils

Functions in utils
[utils](https://www.rdocumentation.org/packages/utils/versions/3.5.3)
- `PkgUtils` - Utilities for Building and Checking Add-on Packages
- `Question` - Documentation Shortcuts
- `View` - Invoke a Data Viewer
- `adist` - Approximate String Distances
- `askYesNo` - Ask a Yes/No Question
- `browseVignettes` - List Vignettes in an HTML Browser
- `RShowDoc` - Show R Manuals and Other Documentation
- `RSiteSearch` - Search for Key Words or Phrases in Documentation
- `SweaveUtils` - Sweave Driver Utilities
- `URLencode` - Encode or Decode a (partial) URL
- `browseEnv` - Browse Objects in Environment
- `alarm` - Alert the User
- `BATCH` - Batch Execution of R
- `bug.report` - Send a Bug Report
- `apropos` - Find Objects by (Partial) Name
- `Rprof` - Enable Profiling of R's Execution
- `browseURL` - Load URL into an HTML Browser
- `Rprofmem` - Enable Profiling of R's Memory Use
- `download.file` - Download File from the Internet
- `contrib.url` - Find Appropriate Paths in CRAN-like Repositories
- `count.fields` - Count the Number of Fields per Line
- `download.packages` - Download Packages from CRAN-like Repositories
- `getFromNamespace` - Utility Functions for Developing Namespaces
- `INSTALL` - Install Add-on Packages
- `cite` - Cite a Bibliography Entry
- `close.socket` - Close a Socket
- `RweaveLatex` - R/LaTeX Driver for Sweave
- `debugger` - Post-Mortem Debugging
- `fix` - Fix an Object
- `Sweave` - Automatic Generation of Reports
- `SHLIB` - Build Shared Object/DLL for Dynamic Loading
- `getParseData` - Get Detailed Parse Information from Object
- `demo` - Demonstrations of R Functionality
- `help.request` - Send a Post to R-help
- `REMOVE` - Remove Add-on Packages
- `capture.output` - Send Output to a Character String or File
- `changedFiles` - Detect which Files Have Changed
- `help.search` - Search the Help System
- `RHOME` - R Home Directory
- `example` - Run an Examples Section from the Online Help
- `dataentry` - Spreadsheet Interface for Entering Data
- `file.edit` - Edit One or More Files
- `aspell-utils` - Spell Check Utilities
- `globalVariables` - Declarations Used in Checking a Package
- `SweaveSyntConv` - Convert Sweave Syntax
- `aspell` - Spell Check Interface
- `available.packages` - List Available Packages at CRAN-like Repositories
- `debugcall` - Debug a Call
- `citEntry` - Bibliography Entries (Older Interface)
- `object.size` - Report the Space Allocated for an Object
- `citation` - Citing R and R Packages in Publications
- `flush.console` - Flush Output to a Console
- `package.skeleton` - Create a Skeleton for a New Source Package
- `packageStatus` - Package Management Tools
- `hasName` - Check for Name
- `create.post` - Ancillary Function for Preparing Emails and Postings
- `getS3method` - Get an S3 Method
- `bibentry` - Bibliography Entries
- `chooseBioCmirror` - Select a Bioconductor Mirror
- `data` - Data Sets
- `edit.data.frame` - Edit Data Frames and Matrices
- `edit` - Invoke a Text Editor
- `isS3method` - Is 'method' the Name of an S3 Method?
- `format` - Format Unordered and Ordered Lists
- `glob2rx` - Change Wildcard or Globbing Pattern into Regular Expression
- `localeToCharset` - Select a Suitable Encoding Name from a Locale Name
- `getAnywhere` - Retrieve an R Object, Including from a Namespace
- `isS3stdGeneric` - Check if a Function Acts as an S3 Generic
- `page` - Invoke a Pager on an R Object
- `install.packages` - Install Packages from Repositories or Local Files
- `ls.str` - List Objects and their Structure
- `installed.packages` - Find Installed Packages
- `maintainer` - Show Package Maintainer
- `make.socket` - Create a Socket Connection
- `methods` - List Methods for S3 Generic Functions or Classes
- `removeSource` - Remove Stored Source from a Function
- `make.packages.html` - Update HTML Package List
- `chooseCRANmirror` - Select a CRAN Mirror
- `mirrorAdmin` - Managing Repository Mirrors
- `combn` - Generate All Combinations of n Elements, Taken m at a Time
- `packageDescription` - Package Description
- `packageName` - Find Package Associated with an Environment
- `compareVersion` - Compare Two Package Version Numbers
- `menu` - Menu Interaction Function
- `read.fwf` - Read Fixed Width Format Files
- `prompt` - Produce Prototype of an R Documentation File
- `read.DIF` - Data Input from Spreadsheet
- `read.socket` - Read from or Write to a Socket
- `file_test` - Shell-style Tests on Files
- `findLineNum` - Find the Location of a Line of Source Code, or Set a Breakpoint There
- `promptData` - Generate Outline Documentation for a Data Set
- `select.list` - Select Items from a List
- `roman` - Roman Numerals
- `relist` - Allow Re-Listing an unlist()ed Object
- `remove.packages` - Remove Installed Packages
- `rtags` - An Etags-like Tagging Utility for R
- `savehistory` - Load or Save or Display the Commands History
- `update.packages` - Compare Installed Packages with CRAN-like Repositories
- `head` - Return the First or Last Part of an Object
- `read.fortran` - Read Fixed-Format Data in a Fortran-like Style
- `stack` - Stack or Unstack Vectors from a Data Frame or List
- `str` - Compactly Display the Structure of an Arbitrary R Object
- `sessionInfo` - Collect Information About the Current R Session
- `help` - Documentation
- `promptPackage` - Generate a Shell for Documentation of a Package
- `rcompgen` - A Completion Generator for R
- `help.start` - Hypertext Documentation
- `read.table` - Data Input
- `untar` - Extract or List Tar Archives
- `recover` - Browsing after an Error
- `strcapture` - Capture String Tokens into a data.frame
- `url.show` - Display a Text URL
- `unzip` - Extract or List Zip Archives
- `warnErrList` - Collect and Summarize Errors From List
- `hsearch-utils` - Help Search Utilities
- `write.table` - Data Output
- `tar` - Create a Tar Archive
- `modifyList` - Recursively Modify Elements of a List
- `txtProgressBar` - Text Progress Bar
- `summaryRprof` - Summarise Output of R Sampling Profiler
- `news` - Build and Query R or Package News Information
- `toLatex` - Converting R Objects to BibTeX or LaTeX
- `person` - Persons
- `process.events` - Trigger Event Handling
- `type.convert` - Convert Data to Appropriate Type
- `setRepositories` - Select Package Repositories
- `sourceutils` - Source Reference Utilities
- `utils-defunct` - Defunct Functions in Package utils
- `utils-package` - The R Utils Package
- `vignette` - View, List or Get R Source of Package Vignettes
- `utils-deprecated` - Deprecated Functions in Package utils
- `zip` - Create Zip Archives
- `Rscript` - Scripting Front-End for R
- `Rtangle` - R Driver for Stangle
- `aregexec` - Approximate String Match Positions

### tools

Functions in tools
[tools](https://www.rdocumentation.org/packages/tools/versions/3.5.3)
- `Rd2txt_options` - Set Formatting Options for Text Help
- `RdTextFilter` - Select Text in an Rd File
- `Rdindex` - Generate Index from Rd Files
- `checkMD5sums` - Check and Create MD5 Checksum Files
- `checkFF` - Check Foreign Function Calls
- `HTMLheader` - Generate a Standard HTML Header for R Help
- `Rdutils` - Rd Utilities
- `bibstyle` - Select or Define a Bibliography Style
- `SweaveTeXFilter` - Strip R Code out of Sweave File
- `Rcmd` - R CMD Interface
- `checkRdaFiles` - Report on Details of Saved Images or Re-saves them
- `buildVignette` - Build One Vignette
- `delimMatch` - Delimited Pattern Matching
- `checkTnF` - Check R Packages or Code for T/F
- `add_datalist` - Add a datalist File to a Package
- `checkRd` - Check an Rd Object
- `checkPoFiles` - Check Translation Files for Inconsistent Format Strings
- `md5sum` - Compute MD5 Checksums
- `Rd2HTML` - Rd Converters
- `package_dependencies` - Computations on the Dependency Hierarchy of Packages
- `make_translations_pkg` - Package the Current Translations in the R Sources
- `dependsOnPkgs` - Find Reverse Dependencies
- `checkVignettes` - Check Package Vignettes
- `HTMLlinks` - Collect HTML Links from Package Documentation
- `assertCondition` - Asserting Error Conditions
- `makevars` - User and Site Compilation Variables
- `tools-package` - Tools for Package Development
- `QC` - QC Checks for R Code and/or Documentation
- `check_packages_in_dir` - Check Source Packages and Their Reverse Dependencies
- `encoded_text_to_latex` - Translate non-ASCII Text to LaTeX Escapes
- `buildVignettes` - List and Build Package Vignettes
- `charsets` - Conversion Tables between Character Sets
- `startDynamicHelp` - Start the Dynamic HTML Help System
- `package_native_routine_registration_skeleton` - Write Skeleton for Adding Native Routine Registration to a Package
- `undoc` - Find Undocumented Objects
- `fileutils` - File Utilities
- `testInstalledPackage` - Test Installed Packages
- `parseLatex` - Experimental Functions to Work with LaTeX Code
- `codoc` - Check Code/Documentation Consistency
- `toRd` - Generic Function to Convert Object to a Fragment of Rd Code
- `find_gs_cmd` - Find a GhostScript Executable
- `getVignetteInfo` - Get Information on Installed Vignettes
- `toTitleCase` - Convert Titles to Title Case
- `read.00Index` - Read 00Index-style Files
- `compactPDF` - Compact PDF Files
- `vignetteEngine` - Set or Get a Vignette Processing Engine
- `parse_Rd` - Parse an Rd File
- `write_PACKAGES` - Generate PACKAGES Files
- `showNonASCII` - Pick Out Non-ASCII Characters
- `.print.via.format` - Printing Utilities
- `update_pkg_po` - Prepare Translations for a Package
- `loadRdMacros` - Load User-defined Rd Help System Macros
- `vignetteDepends` - Retrieve Dependency Information for a Vignette
- `makeLazyLoading` - Lazy Loading of Packages
- `pskill` - Kill a Process
- `xgettext` - Extract Translatable Messages from R Files in a Package
- `psnice` - Get or Set the Priority (Niceness) of a Process
- `tools-defunct` - Defunct Objects in Package tools
- `tools-deprecated` - Deprecated Objects in Package tools
- `texi2dvi` - Compile LaTeX Files
- `toHTML` - Display an Object in HTML
- `Rdiff` - Difference R Output Files
- `CRANtools` - CRAN Package Repository Tools

### stats4

Functions in stats4
[stats4](https://www.rdocumentation.org/packages/stats4)
- `coef-methods` - Methods for Function coef in Package stats4
- `show-methods` - Methods for Function show in Package stats4
- `stats4-package` - Statistical Functions using S4 Classes
- `update-methods` - Methods for Function update in Package stats4
- `mle` - Maximum Likelihood Estimation
- `confint-methods` - Methods for Function confint in Package stats4
- `vcov-methods` - Methods for Function vcov in Package stats4
- `profile.mle-class` - Class "profile.mle"; Profiling information for "mle" object
- `profile-methods` - Methods for Function profile in Package stats4
- `plot-methods` - Methods for Function plot in Package stats4
- `summary-methods` - Methods for Function summary in Package stats4
- `summary.mle-class` - Class "summary.mle", Summary of "mle" Objects
- `logLik-methods` - Methods for Function logLik in Package stats4
- `mle-class` - Class "mle" for Results of Maximum Likelihood Estimation

### methods

Functions in methods
[methods](https://www.rdocumentation.org/packages/methods/versions/3.5.3)
- `Classes_Details` - Class Definitions
- `Documentation` - Using and Creating On-line Documentation for Classes and Methods
- `language-class` - Classes to Represent Unevaluated Language Objects
- `MethodWithNext-class` - Class MethodWithNext
- `BasicClasses` - Classes Corresponding to Basic Data Types
- `Classes` - S4 Class Documentation
- `MethodsList-class` - Class MethodsList, Defunct Representation of Methods
- `MethodsList` - MethodsList Objects
- `EmptyMethodsList-class` - Internal Class representing Empty Methods List
- `StructureClasses` - Classes Corresponding to Basic Structures
- `MethodDefinition-class` - Classes to Represent Method Definitions
- `Methods` - S4 Class Documentation
- `environment-class` - Class "environment"
- `S4groupGeneric` - S4 Group Generic Functions
- `TraceClasses` - Classes Used Internally to Control Tracing
- `evalSource` - Use Function Definitions from a Source File without Reinstalling a Package
- `MethodSupport` - Additional (Support) Functions for Methods
- `findMethods` - Description of the Methods Defined for a Generic Function
- `fixPre1.8` - Fix Objects Saved from R Versions Previous to 1.8
- `findClass` - Find Class Definitions
- `SClassExtension-class` - Class to Represent Inheritance (Extension) Relations
- `LinearMethodsList-class` - Class "LinearMethodsList"
- `getMethod` - Get or Test for the Definition of a Method
- `nonStructure-class` - A non-structure S4 Class for basic types
- `promptClass` - Generate a Shell for Documentation of a Formal Class
- `Methods_for_S3` - Methods For S3 and S4 Dispatch
- `Methods_Details` - General Information on Methods
- `callNextMethod` - Call an Inherited Method
- `Methods_for_Nongenerics` - Methods for Non-Generic Functions in Other Packages
- `as` - Force an Object to Belong to a Class
- `getPackageName` - The Name associated with a Given Package
- `ObjectsWithPackage-class` - A Vector of Object Names, with associated Package Names
- `genericFunction-class` - Generic Function Objects
- `getClass` - Get Class Definition
- `RClassUtils` - Utilities for Managing Class Definitions
- `methods-package` - Formal Methods and Classes
- `callGeneric` - Call the Current Generic Function from a Method
- `canCoerce` - Can an Object be Coerced to a Certain S4 Class?
- `setGeneric` - Create a Generic Version of a Function
- `setGroupGeneric` - Create a Group Generic Version of a Function
- `classesToAM` - Compute an Adjacency Matrix for Superclasses of Class Definitions
- `dotsMethods` - The Use of ... in Method Signatures
- `new` - Generate an Object from a Class
- `GenericFunctions` - Tools for Managing Generic Functions
- `Introduction` - Basic use of S4 Methods and Classes
- `cbind2` - Combine two Objects by Columns or Rows
- `inheritedSlotNames` - Names of Slots Inherited From a Super Class
- `showMethods` - Show all the methods for the specified function(s) or class
- `RMethodUtils` - Method Utilities
- `promptMethods` - Generate a Shell for Documentation of Formal Methods
- `S3Part` - S4 Classes that Contain S3 Classes
- `ReferenceClasses` - Objects With Fields Treated by Reference (OOP-style)
- `initialize-methods` - Methods to Initialize New Objects from a Class
- `className` - Class names including the corresponding package
- `setMethod` - Create and Save a Method
- `signature-class` - Class "signature" For Method Definitions
- `classRepresentation-class` - Class Objects
- `setOldClass` - Register Old-Style (S3) Classes and Inheritance
- `validObject` - Test the Validity of an Object
- `.BasicFunsList` - List of Builtin and Special Functions
- `methods-defunct` - Defunct Functions in Package methods
- `hasArg` - Look for an Argument in the Call
- `is` - Is an Object from a Class?
- `implicitGeneric` - Manage Implicit Versions of Generic Functions
- `isSealedMethod` - Check for a Sealed Method or Class
- `methods-deprecated` - Deprecated Functions in Package methods
- `method.skeleton` - Create a Skeleton File for a New Method
- `methodUtilities` - Utility Functions for Methods and S-Plus Compatibility
- `languageEl` - Elements of Language Objects
- `LocalReferenceClasses` - Localized Objects based on Reference Classes
- `setClass` - Create a Class Definition
- `setClassUnion` - Classes Defined as the Union of Other Classes
- `removeMethod` - Remove a Method
- `representation` - Construct a Representation or a Prototype for a Class Definition
- `selectSuperClasses` - Super Classes (of Specific Kinds) of a Class
- `setIs` - Specify a Superclass Explicitly
- `setLoadActions` - Set Actions For Package Loading
- `setAs` - Methods for Coercing an Object to a Class
- `slot` - The Slots in an Object from a Formal Class
- `envRefClass-class` - Class "envRefClass"
- `makeClassRepresentation` - Create a Class Definition
- `show` - Show an Object
- `substituteDirect` - SubstituteDirect
- `testInheritedMethods` - Test for and Report about Selection of Inherited Methods

### base

Functions in base
[Base](https://www.rdocumentation.org/packages/base/versions/3.5.3)
Search
- `Colon` - Colon Operator
- `Encoding` - Read or Set the Declared Encodings for a Character Vector
- `Bessel` - Bessel Functions
- `CallExternal` - Modern Interfaces to C/C++ code
- `InternalMethods` - Internal Generic Functions
- `La_library` - LAPACK Library
- `Dates` - Date Class
- `Arithmetic` - Arithmetic Operators
- `LongVectors` - Long Vectors
- `Defunct` - Marking Objects as Defunct
- `Extract` - Extract or Replace Parts of an Object
- `EnvVar` - Environment Variables
- `AsIs` - Inhibit Interpretation/Conversion of Objects
- `La_version` - LAPACK Version
- `MathFun` - Miscellaneous Mathematical Functions
- `Reserved` - Reserved Words in R
- `Foreign` - Foreign Function Interface
- `Last.value` - Value of Last Evaluated Expression
- `NumericConstants` - Numeric Constants
- `Ops.Date` - Operators on the Date Class
- `ISOdatetime` - Date-time Conversion Functions from Numeric Representations
- `RdUtils` - Utilities for Processing Rd Files
- `Recall` - Recursive Calling
- `Hyperbolic` - Hyperbolic Functions
- `Sys.glob` - Wildcard Expansion on File Paths
- `Sys.info` - Extract System and User Information
- `Cstack_info` - Report Information on C Stack Size and Usage
- `UseMethod` - Class Methods
- `Rhome` - Return the R Home Directory
- `DateTimeClasses` - Date-Time Classes
- `Extract.data.frame` - Extract or Replace Parts of a Data Frame
- `Extract.factor` - Extract or Replace Parts of a Factor
- `log` - Logarithms and Exponentials
- `Sys.localeconv` - Find Details of the Numerical and Monetary Representations in the Current Locale
- `Sys.readlink` - Read File Symbolic Links
- `Memory-limits` - Memory Limits in R
- `Memory` - Memory Available for Data Storage
- `Primitive` - Look Up a Primitive Function
- `Logic` - Logical Operators
- `Quotes` - Quotes
- `Internal` - Call an Internal Function
- `Constants` - Built-in Constants
- `Paren` - Parentheses and Braces
- `NA` - ‘Not Available’ / Missing Values
- `.Platform` - Platform Specific Variables
- `Round` - Rounding of Numbers
- `agrep` - Approximate String Matching (Fuzzy Matching)
- `NULL` - The Null Object
- `Sys.sleep` - Suspend Execution for a Time Interval
- `Sys.time` - Get Current Date and Time
- `Special` - Special Functions of Mathematics
- `all` - Are All Values True?
- `Sys.getenv` - Get Environment Variables
- `Syntax` - Operator Syntax and Precedence
- `Sys.getpid` - Get the Process ID of the R Session
- `as.Date` - Date Conversion Functions to and from Character
- `Startup` - Initialization at Start of an R Session
- `append` - Vector Merging
- `assignOps` - Assignment Operators
- `apply` - Apply Functions Over Array Margins
- `Sys.which` - Find Full Paths to Executables
- `Control` - Control Flow
- `Vectorize` - Vectorize a Scalar Function
- `as.POSIX*` - Date-time Conversion Functions
- `as.function` - Convert Object to Function
- `all.equal` - Test if Two Objects are (Nearly) Equal
- `attr` - Object Attributes
- `Trig` - Trigonometric Functions
- `all.names` - Find All Names in an Expression
- `Extremes` - Maxima and Minima
- `attributes` - Object Attribute Lists
- `attach` - Attach Set of R Objects to Search Path
- `assign` - Assign a Value to a Name
- `any` - Are Some Values True?
- `as.environment` - Coerce to an Environment Object
- `as.data.frame` - Coerce to a Data Frame
- `basename` - Manipulate File Paths
- `base-defunct` - Defunct Functions in Package base
- `base-deprecated` - Deprecated Functions in Package base
- `aperm` - Array Transposition
- `.bincode` - Bin a Numeric Vector
- `base-internal` - Internal Objects in Package base
- `base-package` - The R Base Package
- `Foreign-internal` - Internal Versions of the Foreign Function Interface
- `chol2inv` - Inverse from Choleski (or QR) Decomposition
- `cat` - Concatenate and Print
- `class` - Object Classes
- `browserText` - Functions to Retrieve Values Supplied by Calls to the Browser
- `browser` - Environment Browser
- `cbind` - Combine R Objects by Rows or Columns
- `bindenv` - Binding and Environment Locking, Active Bindings
- `bitwise` - Bitwise Logical Operations
- `Random` - Random Number Generation
- `Random.user` - User-supplied Random Number Generation
- `Sys.setFileTime` - Set File Time
- `Sys.setenv` - Set or Unset Environment Variables
- `contributors` - R Project Contributors
- `connections` - Functions to Manipulate Connections (Files, URLs, ...)
- `char.expand` - Expand a String with Respect to a Target Table
- `R.Version` - Version Information
- `abbreviate` - Abbreviate Strings
- `character` - Character Vectors
- `args` - Argument List of a Function
- `array` - Multi-way Arrays
- `callCC` - Call With Current Continuation
- `autoload` - On-demand Loading of Packages
- `backsolve` - Solve an Upper or Lower Triangular System
- `date` - System Date and Time
- `conditions` - Condition Handling and Recovery
- `dcf` - Read and Write Data in DCF Format
- `conflicts` - Search for Masked Objects on the Search Path
- `deparse` - Expression Deparsing
- `data.matrix` - Convert a Data Frame to a Numeric Matrix
- `deparseOpts` - Options for Expression Deparsing
- `capabilities` - Report Capabilities of this Build of R
- `dataframeHelpers` - Data Frame Auxiliary Functions
- `builtins` - Returns the Names of All Built-in Objects
- `body` - Access to and Manipulation of the Body of a Function
- `do.call` - Execute a Function Call
- `bquote` - Partial substitution in expressions
- `dontCheck` - Identity Function to Suppress Checking
- `eapply` - Apply a Function Over Values in an Environment
- `by` - Apply a Function to a Data Frame Split by Factors
- `c` - Combine Values into a Vector or List
- `duplicated` - Determine Duplicate Elements
- `call` - Function Calls
- `dyn.load` - Foreign Function Interface
- `chkDots` - Warn About Extraneous Arguments in the "..." of Its Caller
- `chol` - The Choleski Decomposition
- `eigen` - Spectral Decomposition of a Matrix
- `file.info` - Extract File Information
- `debug` - Debug a Function
- `delayedAssign` - Delay Evaluation
- `col` - Column Indexes
- `charmatch` - Partial String Matching
- `chartr` - Character Translation and Casefolding
- `dim` - Dimensions of an Object
- `dimnames` - Dimnames of an Object
- `files2` - Manipulation of Directories and File Permissions
- `colSums` - Form Row and Column Sums and Means
- `eval` - Evaluate an (Unevaluated) Expression
- `exists` - Is an Object Defined?
- `row+colnames` - Row and Column Names
- `file.path` - Construct Path to File
- `find.package` - Find Packages
- `getDLLRegisteredRoutines` - Reflectance Information for C/Fortran routines in a DLL
- `comment` - Query or Set a "comment" Attribute
- `copyright` - Copyrights of Files Used to Build R
- `complex` - Complex Numbers and Basic Functionality
- `commandArgs` - Extract Command Line Arguments
- `formatC` - Formatting Using C-style Formats
- `data.class` - Object Classes
- `function` - Function Definition
- `crossprod` - Matrix Crossproduct
- `funprog` - Common Higher-Order Functions in Functional Programming Languages
- `data.frame` - Data Frames
- `file.show` - Display One or More Text Files
- `files` - File Manipulation
- `findInterval` - Find Interval Numbers or Indices
- `diff` - Lagged Differences
- `gc` - Garbage Collection
- `force` - Force Evaluation of an Argument
- `cumsum` - Cumulative Sums, Products, and Extremes
- `difftime` - Time Intervals / Differences
- `dots` - …, ..1, etc used in Functions
- `getLoadedDLLs` - Get DLLs Loaded in Current Session
- `groupGeneric` - S3 Group Generic Functions
- `curlGetHeaders` - Retrieve Headers from URLs
- `cut.POSIXt` - Convert a Date or Date-Time Object to a Factor
- `interaction` - Compute Factor Interactions
- `interactive` - Is R Running Interactively?
- `grouping` - Grouping Permutation
- `double` - Double-Precision Vectors
- `identical` - Test Objects for Exact Equality
- `gc.time` - Report Time Spent in Garbage Collection
- `gctorture` - Torture Garbage Collector
- `expand.grid` - Create a Data Frame from All Combinations of Factor Variables
- `identity` - Identity Function
- `cut` - Convert Numeric to Factor
- `kappa` - Compute or Estimate the Condition Number of a Matrix
- `grep` - Pattern Matching and Replacement
- `grepRaw` - Pattern Matching for Raw Vectors
- `expression` - Unevaluated Expressions
- `extSoftVersion` - Report Versions of Third-Party Software
- `factor` - Factors
- `det` - Calculate the Determinant of a Matrix
- `kronecker` - Kronecker Products on Arrays
- `lapply` - Apply a Function over a List or Vector
- `forceAndCall` - Call a function with Some Arguments Forced
- `lazyLoad` - Lazy Load a Database of R Objects
- `is.function` - Is an Object of Type (Primitive) Function?
- `list2env` - From A List, Build or Add To an Environment
- `formals` - Access to and Manipulation of the Formal Arguments
- `is.language` - Is an Object a Language Object?
- `detach` - Detach Objects from the Search Path
- `.Device` - Lists of Open/Active Graphics Devices
- `dput` - Write an Object to a File or Recreate it
- `drop` - Drop Redundant Extent Information
- `encodeString` - Encode Character Vector as for Printing
- `is.object` - Is an Object ‘internally classed’?
- `isSymmetric` - Test if a Matrix or other Object is Symmetric (Hermitian)
- `diag` - Matrix Diagonals
- `jitter` - ‘Jitter’ (Add Noise) to Numbers
- `is.recursive` - Is an Object Atomic or Recursive?
- `get` - Return the Value of a Named Object
- `load` - Reload Saved Datasets
- `levels` - Levels Attributes
- `mat.or.vec` - Create a Matrix or a Vector
- `match.fun` - Extract a Function Specified by Name
- `libPaths` - Search Paths for Packages
- `getCallingDLL` - Compute DLL for Native Interface Call
- `match` - Value Matching
- `list` - Lists -- Generic and Dotted Pairs
- `mean` - Arithmetic Mean
- `environment` - Environment Access
- `droplevels` - Drop Unused Levels from Factors
- `file.access` - Ascertain File Accessibility
- `memCompress` - In-memory Compression and Decompression
- `list.files` - List the Files in a Directory/Folder
- `matmult` - Matrix Multiplication
- `file.choose` - Choose a File Interactively
- `gzcon` - (De)compress I/O Through Connections
- `names` - The Names of an Object
- `noquote` - Class for ‘no quote’ Printing of Character Strings
- `nargs` - The Number of Arguments to a Function
- `hexmode` - Display Numbers in Hexadecimal
- `make.names` - Make Syntactically Valid Names
- `pmatch` - Partial String Matching
- `is.R` - Are we using R, rather than S?
- `make.unique` - Make Character Strings Unique
- `isS4` - Test for an S4 object
- `polyroot` - Find Zeros of a Real or Complex Polynomial
- `memory.profile` - Profile the Usage of Cons Cells
- `dump` - Text Representations of R Objects
- `format.pval` - Format P Values
- `norm` - Compute the Norm of a Matrix
- `formatDL` - Format Description Lists
- `ns-topenv` - Top Level Environment
- `l10n_info` - Localization Information
- `merge` - Merge Two Data Frames
- `prop.table` - Express Table Entries as Fraction of Marginal Table
- `getwd` - Get or Set Working Directory
- `normalizePath` - Express File Paths in Canonical Form
- `numeric` - Numeric Vectors
- `NotYet` - Not Yet Implemented Functions and Unused Arguments
- `labels` - Find Labels from Object
- `library.dynam` - Loading DLLs from Packages
- `ns-hooks` - Hooks for Namespace Events
- `ns-internals` - Namespace Internals
- `pushBack` - Push Text Back on to a Connection
- `license` - The R License Terms
- `print` - Print Values
- `gl` - Generate Factor Levels
- `parse` - Parse Expressions
- `match.arg` - Argument Verification Using Partial Matching
- `match.call` - Argument Matching
- `format` - Encode in a Common Format
- `ifelse` - Conditional Element Selection
- `paste` - Concatenate Strings
- `quit` - Terminate an R Session
- `format.info` - format(.) Information
- `range` - Range of Values
- `regex` - Regular Expressions as used in R
- `regmatches` - Extract or Replace Matched Substrings
- `print.data.frame` - Printing Data Frames
- `mode` - The (Storage) Mode of an Object
- `remove` - Remove Objects from a Specified Environment
- `integer` - Integer Vectors
- `readChar` - Transfer Character Strings To and From Connections
- `round.POSIXt` - Round / Truncate Data-Time Objects
- `getNativeSymbolInfo` - Obtain a Description of one or more Native (C/Fortran) Symbols
- `rowsum` - Give Column Sums of a Matrix or Data Frame, Based on a Grouping Variable
- `seq.Date` - Generate Regular Sequences of Dates
- `readLines` - Read Text Lines from a Connection
- `rev` - Reverse Elements
- `seq.POSIXt` - Generate Regular Sequences of Times
- `rle` - Run Length Encoding
- `gettext` - Translate Text Messages
- `is.single` - Is an Object of Single Precision Type?
- `sQuote` - Quote Text
- `is.unsorted` - Test if an Object is Not Sorted
- `row` - Row Indexes
- `iconv` - Convert Character Vector between Encodings
- `row.names` - Get and Set Row Names for Data Frames
- `icuSetCollate` - Setup Collation by ICU
- `libcurlVersion` - Report Version of libcurl
- `invisible` - Change the Print Mode to Invisible
- `is.finite` - Finite, Infinite and NaN Numbers
- `name` - Names and Symbols
- `library` - Loading/Attaching and Listing of Packages
- `length` - Length of an Object
- `lengths` - Lengths of List or Vector Elements
- `search` - Give Search Path for R Objects
- `sprintf` - Use C-style String Formatting Commands
- `seq` - Sequence Generation
- `locales` - Query or Set Aspects of the Locale
- `logical` - Logical Vectors
- `on.exit` - Function Exit Code
- `srcfile` - References to Source Files and Code
- `seek` - Functions to Reposition Connections
- `sequence` - Create A Vector of Sequences
- `mapply` - Apply a Function to Multiple List or Vector Arguments
- `lower.tri` - Lower and Upper Triangular Part of a Matrix
- `options` - Options Settings
- `sys.parent` - Functions to Access the Function Call Stack
- `split` - Divide into Groups and Reassemble
- `strwrap` - Wrap Character Strings to Format Paragraphs
- `source` - Read R Code from a File, a Connection or Expressions
- `writeLines` - Write Lines to a Connection
- `margin.table` - Compute table margin
- `ls` - List Objects
- `matrix` - Matrices
- `subset` - Subsetting Vectors, Matrices and Data Frames
- `weekdays` - Extract Parts of a POSIXt or Date Object
- `switch` - Select One of a List of Alternatives
- `message` - Diagnostic Messages
- `xtfrm` - Auxiliary Function for Sorting and Ranking
- `nrow` - The Number of Rows/Columns of an Array
- `maxCol` - Find Maximum Position in Matrix
- `system.file` - Find Names of R System Files
- `system.time` - CPU Time Used
- `tempfile` - Create Names for Temporary Files
- `missing` - Does a Formal Argument have a Value?
- `nchar` - Count the Number of Characters (or Bytes or Width)
- `solve` - Solve a System of Equations
- `sort` - Sorting or Ordering Vectors
- `textConnection` - Text Connections
- `unlist` - Flatten Lists
- `nlevels` - The Number of Levels of a Factor
- `ns-dblcolon` - Double Colon and Triple Colon Operators
- `numeric_version` - Numeric Versions
- `ns-load` - Loading and Unloading Name Spaces
- `ns-reflect.Rd` - Namespace Reflection Support
- `traceback` - Get and Print Call Stacks
- `pos.to.env` - Convert Positions in the Search Path to Environments
- `tracemem` - Trace Copying of Objects
- `octmode` - Display Numbers in Octal
- `unname` - Remove names or dimnames
- `path.expand` - Expand File Paths
- `userhooks` - Functions to Get and Set Hooks for Load, Attach, Detach and Unload
- `pcre_config` - Report Configuration Options for PCRE
- `pretty` - Pretty Breakpoints
- `order` - Ordering Permutation
- `outer` - Outer Product of Arrays
- `qr` - The QR Decomposition of a Matrix
- `QR.Auxiliaries` - Reconstruct the Q, R, or X Matrices from a QR Object
- `print.default` - Default Printing
- `proc.time` - Running Time of R
- `utf8Conversion` - Convert Integer Vectors to or from UTF-8-encoded Character Vectors
- `prmatrix` - Print Matrices, Old-style
- `rawConversion` - Convert to or from Raw Vectors
- `readBin` - Transfer Binary Data To and From Connections
- `raw` - Raw Vectors
- `rawConnection` - Raw Connections
- `prod` - Product of Vector Elements
- `readRDS` - Serialization Interface for Single Objects
- `which` - Which indices are TRUE?
- `rep` - Replicate Elements of Vectors and Lists
- `replace` - Replace Values in a Vector
- `readRenviron` - Set Environment Variables from a File
- `rank` - Sample Ranks
- `zutils` - Miscellaneous Internal/Programming Utilities
- `sample` - Random Samples and Permutations
- `rapply` - Recursively Apply a Function to a List
- `save` - Save R Objects
- `readline` - Read a Line from the Terminal
- `stop` - Stop Function Execution
- `reg.finalizer` - Finalization of Objects
- `stopifnot` - Ensure the Truth of R Expressions
- `scale` - Scaling and Centering of Matrix-like Objects
- `sets` - Set Operations
- `sink` - Send R Output to a File
- `scan` - Read Data Values
- `shQuote` - Quote Strings for Use in OS Shells
- `slice.index` - Slice Indexes in an Array
- `strsplit` - Split the Elements of a Character Vector
- `serialize` - Simple Serialization Interface
- `sum` - Sum of Vector Elements
- `setTimeLimit` - Set CPU and/or Elapsed Time Limits
- `strptime` - Date-time Conversion Functions to and from Character
- `summary` - Object Summaries
- `system2` - Invoke a System Command
- `slotOp` - Extract or Replace A Slot
- `tabulate` - Tabulation for Vectors
- `table` - Cross Tabulation and Table Creation
- `showConnections` - Display Connections
- `sign` - Sign Function
- `socketSelect` - Wait on Socket Connections
- `standardGeneric` - Formal Method System -- Dispatching S4 Methods
- `trace` - Interactive Tracing and Debugging of Calls to a Function or Method
- `unique` - Extract Unique Elements
- `startsWith` - Does String Start or End With Another String?
- `warnings` - Print Warning Messages
- `zapsmall` - Rounding of Numbers: Zapping Small Ones to Zero
- `tilde` - Tilde Operator
- `.Machine` - Numerical Characteristics of the Machine
- `tapply` - Apply a Function Over a Ragged Array
- `substitute` - Substituting and Quoting Expressions
- `timezones` - Time Zones
- `substr` - Substrings of a Character Vector
- `unlink` - Delete Files and Directories
- `zpackages` - Listing of Packages
- `taskCallback` - Add or Remove a Top-Level Task Callback
- `system` - Invoke a System Command
- `svd` - Singular Value Decomposition of a Matrix
- `structure` - Attribute Specification
- `warning` - Warning Messages
- `strtrim` - Trim Character Strings to Specified Display Widths
- `strtoi` - Convert Strings to Integers
- `toString` - Convert an R Object to a Character String
- `try` - Try an Expression Allowing Error Recovery
- `trimws` - Remove Leading/Trailing Whitespace
- `sys.source` - Parse and Evaluate Expressions from a File
- `withVisible` - Return both a Value and its Visibility
- `write` - Write Data to a File
- `strrep` - Repeat the Elements of a Character Vector
- `validUTF8` - Check if a Character Vector is Validly Encoded
- `transform` - Transform an Object, for Example a Data Frame
- `typeof` - The Type of an Object
- `sweep` - Sweep out Array Summaries
- `.Script` - Scripting Language Interface
- `which.min` - Where is the Min() or Max() or first TRUE or FALSE ?
- `taskCallbackNames` - Query the Names of the Current Internal Top-Level Task Callbacks
- `t` - Matrix Transpose
- `taskCallbackManager` - Create an R-level Task Callback Manager
- `vector` - Vectors
- `with` - Evaluate an Expression in a Data Environment
- `Comparison` - *Relational Operators*
- `Deprecated` - Marking Objects as Deprecated

### graphics

Functions in graphics
[Graphics](https://www.rdocumentation.org/packages/graphics/versions/3.5.3)
- `plot.default` - The Default Scatterplot Function
- `pie` - Pie Charts
- `stripchart` - 1-D Scatter Plots
- `axis` - Add an Axis to a Plot
- `barplot` - Bar Plots
- `axis.POSIXct` - Date and Date-time Plotting Functions
- `box` - Draw a Box around a Plot
- `hist.POSIXt` - Histogram of a Date or Date-Time Object
- `curve` - Draw Function Plots
- `dotchart` - Cleveland's Dot Plots
- `polygon` - Polygon Drawing
- `plot.window` - Set up World Coordinates for Graphics Window
- `plot.xy` - Basic Internal Plot Function
- `hist` - Histograms
- `strwidth` - Plotting Dimensions of Character Strings and Math Expressions
- `persp` - Perspective Plots
- `sunflowerplot` - Produce a Sunflower Scatter Plot
- `xspline` - Draw an X-spline
- `polypath` - Path Drawing
- `Axis` - Generic Function to Add an Axis to a Plot
- `plot.design` - Plot Univariate Effects of a Design or Model
- `stem` - Stem-and-Leaf Plots
- `plot` - Generic X-Y Plotting
- `filled.contour` - Level (Contour) Plots
- `rect` - Draw One or More Rectangles
- `identify` - Identify Points in a Scatter Plot
- `spineplot` - Spine Plots and Spinograms
- `axTicks` - Compute Axis Tickmark Locations
- `fourfoldplot` - Fourfold Plots
- `panel.smooth` - Simple Panel Plot
- `stars` - Star (Spider/Radar) Plots and Segment Diagrams
- `legend` - Add Legends to Plots
- `boxplot` - Box Plots
- `arrows` - Add Arrows to a Plot
- `graphics-package` - The R Graphics Package
- `bxp` - Draw Box Plots from Summaries
- `image` - Display a Color Image
- `layout` - Specifying Complex Plot Arrangements
- `boxplot.matrix` - Draw a Boxplot for each Column (Row) of a Matrix
- `cdplot` - Conditional Density Plots
- `frame` - Create / Start a New Plot Frame
- `plot.factor` - Plotting Factor Variables
- `segments` - Add Line Segments to a Plot
- `mosaicplot` - Mosaic Plots
- `lines` - Add Connected Line Segments to a Plot
- `par` - Set or Query Graphical Parameters
- `smoothScatter` - Scatterplots with Smoothed Densities Color Representation
- `plot.table` - Plot Methods for table Objects
- `mtext` - Write Text into the Margins of a Plot
- `abline` - Add Straight Lines to a Plot
- `plot.formula` - Formula Notation for Scatterplots
- `plot.data.frame` - Plot Method for Data Frames
- `title` - Plot Annotation
- `pairs` - Scatterplot Matrices
- `rug` - Add a Rug to a Plot
- `plot.raster` - Plotting Raster Images
- `points` - Add Points to a Plot
- `convertXY` - Convert between Graphics Coordinate Systems
- `clip` - Set Clipping Region
- `graphics-defunct` - Defunct Functions in Package graphics
- `rasterImage` - Draw One or More Raster Images
- `plot.histogram` - Plot Histograms
- `contour` - Display Contours
- `symbols` - Draw Symbols (Circles, Squares, Stars, Thermometers, Boxplots)
- `screen` - Creating and Controlling Multiple Screens on a Single Device
- `text` - Add Text to a Plot
- `locator` - Graphical Input
- `assocplot` - Association Plots
- `units` - Graphical Units
- `grid` - Add Grid to a Plot
- `matplot` - Plot Columns of Matrices
- `coplot` - Conditioning Plots

### datasets

Functions in datasets
[Datasets](https://www.rdocumentation.org/packages/datasets/versions/3.5.3)
- `BOD` - Biochemical Oxygen Demand
- `USArrests` - Violent Crime Rates by US State
- `LakeHuron` - Level of Lake Huron 1875--1972
- `anscombe` - Anscombe's Quartet of ‘Identical’ Simple Linear Regressions
- `Titanic` - Survival of passengers on the Titanic
- `airmiles` - Passenger Miles on Commercial US Airlines, 1937--1960
- `airquality` - New York Air Quality Measurements
- `ToothGrowth` - The Effect of Vitamin C on Tooth Growth in Guinea Pigs
- `Harman74.cor` - Harman Example 7.4
- `attenu` - The Joyner--Boore Attenuation Data
- `AirPassengers` - Monthly Airline Passenger Numbers 1949-1960
- `beavers` - Body Temperature Series of Two Beavers
- `BJsales` - Sales Data with Leading Indicator
- `euro` - Conversion Rates of Euro Currencies
- `eurodist` - Distances Between European Cities and Between US Cities
- `cars` - Speed and Stopping Distances of Cars
- `Orange` - Growth of Orange Trees
- `Nile` - Flow of the River Nile
- `Formaldehyde` - Determination of Formaldehyde
- `USJudgeRatings` - Lawyers' Ratings of State Judges in the US Superior Court
- `OrchardSprays` - Potency of Orchard Sprays
- `DNase` - Elisa assay of DNase
- `HairEyeColor` - Hair and Eye Color of Statistics Students
- `LifeCycleSavings` - Intercountry Life-Cycle Savings Data
- `USPersonalExpenditure` - Personal Expenditure Data
- `crimtab` - Student's 3000 Criminals Data
- `morley` - Michelson Speed of Light Data
- `datasets-package` - The R Datasets Package
- `EuStockMarkets` - Daily Closing Prices of Major European Stock Indices, 1991--1998
- `longley` - Longley's Economic Regression Data
- `islands` - Areas of the World's Major Landmasses
- `quakes` - Locations of Earthquakes off Fiji
- `warpbreaks` - The Number of Breaks in Yarn during Weaving
- `pressure` - Vapor Pressure of Mercury as a Function of Temperature
- `lh` - Luteinizing Hormone in Blood Samples
- `mtcars` - Motor Trend Car Road Tests
- `Indometh` - Pharmacokinetics of Indomethacin
- `lynx` - Annual Canadian Lynx trappings 1821--1934
- `InsectSprays` - Effectiveness of Insect Sprays
- `PlantGrowth` - Results from an Experiment on Plant Growth
- `UKDriverDeaths` - Road Casualties in Great Britain 1969--84
- `discoveries` - Yearly Numbers of Important Discoveries
- `UCBAdmissions` - Student Admissions at UC Berkeley
- `esoph` - Smoking, Alcohol and (O)esophageal Cancer
- `faithful` - Old Faithful Geyser Data
- `freeny` - Freeny's Revenue Data
- `Loblolly` - Growth of Loblolly pine trees
- `npk` - Classical N, P, K Factorial Experiment
- `sunspots` - Monthly Sunspot Numbers, 1749--1983
- `swiss` - Swiss Fertility and Socioeconomic Indicators (1888) Data
- `women` - Average Heights and Weights for American Women
- `UKLungDeaths` - Monthly Deaths from Lung Diseases in the UK
- `UKgas` - UK Quarterly Gas Consumption
- `occupationalStatus` - Occupational Status of Fathers and their Sons
- `state` - US State Facts and Figures
- `stackloss` - Brownlee's Stack Loss Plant Data
- `Puromycin` - Reaction Velocity of an Enzymatic Reaction
- `Theoph` - Pharmacokinetics of Theophylline
- `WorldPhones` - The World's Telephones
- `ability.cov` - Ability and Intelligence Tests
- `VADeaths` - Death Rates in Virginia (1940)
- `co2` - Mauna Loa Atmospheric CO2 Concentration
- `WWWusage` - Internet Usage per Minute
- `infert` - Infertility after Spontaneous and Induced Abortion
- `chickwts` - Chicken Weights by Feed Type
- `precip` - Annual Precipitation in US Cities
- `presidents` - Quarterly Approval Ratings of US Presidents
- `iris` - Edgar Anderson's Iris Data
- `rock` - Measurements on Petroleum Rock Samples
- `treering` - Yearly Treering Data, -6000--1979
- `trees` - Girth, Height and Volume for Black Cherry Trees
- `attitude` - The Chatterjee--Price Attitude Data
- `austres` - Quarterly Time Series of the Number of Australian Residents
- `sleep` - Student's Sleep Data
- `sunspot.month` - Monthly Sunspot Data, from 1749 to "Present"
- `CO2` - Carbon Dioxide Uptake in Grass Plants
- `sunspot.year` - Yearly Sunspot Data, 1700--1988
- `nhtemp` - Average Yearly Temperatures in New Haven
- `nottem` - Average Monthly Temperatures at Nottingham, 1920--1939
- `randu` - Random Numbers from Congruential Generator RANDU
- `uspop` - Populations Recorded by the US Census
- `rivers` - Lengths of Major North American Rivers
- `volcano` - Topographic Information on Auckland's Maunga Whau Volcano
- `JohnsonJohnson` - Quarterly Earnings per Johnson & Johnson Share
- `ChickWeight` - Weight versus age of chicks on different diets
- `USAccDeaths` - Accidental Deaths in the US 1973--1978
- `Harman23.cor` - Harman Example 2.3

### rlang

Functions in rlang
[rlang](https://www.rdocumentation.org/packages/rlang/versions/0.2.2)
- `dots_values` - Evaluate dots with preliminary splicing
- `has_name` - Does an object have an element with this name?
- `as_overscope` - Create an overscope
- `as_pairlist` - Coerce to pairlist
- `abort` - Signal an error, warning, or message
- `as_quosure` - Coerce object to quosure
- `are_na` - Test for missing values
- `inherits_any` - Does an object inherit from a set of classes?
- `is_frame` - Is object a frame?
- `as_utf8_character` - Coerce to a character vector and attempt encoding conversion
- `is_function` - Is object a function?
- `is_quosureish` - Test for or coerce to quosure-like objects
- `as_data_mask` - Create a data mask
- `deprecated-cnd` - Deprecated condition constructors
- `call_fn` - Extract function from a call
- `is_reference` - Is an object referencing another?
- `as_environment` - Coerce to an environment
- `env_get` - Get an object in an environment
- `f_rhs` - Get or set formula components
- `eval_tidy` - Evaluate an expression with quosures and pronoun support
- `eval_bare` - Evaluate an expression in an environment
- `dictionary` - Create a dictionary
- `env_depth` - Depth of an environment chain
- `as_function` - Convert to function or closure
- `call_inspect` - Inspect a call
- `as_env` - Coerce to an environment
- `call_standardise` - Standardise a call
- `f_text` - Turn RHS of formula into a string or label
- `invoke` - Invoke a function with a list of arguments
- `is_call` - Is object a call?
- `is_namespace` - Is an object a namespace environment?
- `call2` - Create a call
- `caller_env` - Get the environment of the caller frame
- `empty_env` - Get the empty environment
- `call_args` - Extract arguments from a call
- `arg_match` - Match an argument to a character vector
- `env` - Create a new environment
- `is_pairlist` - Is object a node or pairlist?
- `mut_node_car` - Mutate node components
- `mut_utf8_locale` - Set the locale's codeset for testing
- `names2` - Get names of a vector
- `catch_cnd` - Catch a condition
- `op-definition` - Definition operator
- `env_poke` - Poke an object in an environment
- `chr_unserialise_unicode` - Translate unicode points to UTF-8
- `as_bytes` - Coerce to a raw vector
- `env_bury` - Mask bindings by defining symbols deeper in a scope
- `env_clone` - Clone an environment
- `new-vector-along` - Create vectors matching the length of a given vector
- `env_unbind` - Remove bindings from an environment
- `new-vector` - Create vectors matching a given length
- `op-get-attr` - Infix attribute accessor
- `call_modify` - Modify the arguments of a call
- `call_name` - Extract function name of a call
- `dots_n` - How many arguments are currently forwarded in dots?
- `dots_definitions` - Capture definition objects
- `bare-type-predicates` - Bare type predicates
- `env_bind` - Bind symbols to objects in an environment
- `new_call` - Create a new call from components
- `quo_squash` - Squash a quosure
- `env_bind_exprs` - Bind lazy or active bindings
- `env_has` - Does an environment have or see bindings?
- `quosure` - Quosure getters, setters and testers
- `env_names` - Names of symbols bound in an environment
- `prim_name` - Name of a primitive function
- `fn_env` - Return the closure environment of a function
- `fn_fmls` - Extract arguments from a function
- `string` - Create a string
- `tidy-dots` - Collect dots tidily
- `switch_lang` - Dispatch on call type
- `tidyeval-data` - Data pronoun for tidy evaluation
- `quasiquotation` - Quasiquotation of an expression
- `env_parent` - Get parent environments
- `box` - Box a value
- `env_inherits` - Does environment inherit from another environment?
- `is_expression` - Is an object an expression?
- `cnd` - Create a condition object
- `with_restarts` - Establish a restart point on the stack
- `is_formula` - Is object a formula?
- `lang_head` - Return the head or tail of a call
- `scoped_env` - Scoped environments
- `lang_modify` - Manipulate or access a call
- `scoped_options` - Change global options
- `quotation` - Quotation
- `expr_interp` - Process unquote operators in a captured expression
- `cnd_signal` - Signal a condition
- `eval_tidy_` - Tidy evaluation in a custom environment
- `frame_position` - Find the position or distance of a frame on the evaluation stack
- `expr_label` - Turn an expression to a label
- `is_callable` - Is an object callable?
- `is_condition` - Is object a condition?
- `friendly_type` - Format a type for error messages
- `is_installed` - Is a package installed in the library?
- `restarting` - Create a restarting handler
- `is_copyable` - Is an object copyable?
- `set_attrs` - Add attributes to an object
- `seq2` - Increasing sequence of integers in an interval
- `exiting` - Create an exiting or in place handler
- `set_names` - Set names of a vector
- `expr_print` - Print an expression
- `exprs_auto_name` - Ensure that list of expressions are all named
- `splice` - Splice lists
- `is_empty` - Is object an empty vector or NULL?
- `vec_poke_n` - Poke values into a vector
- `vector-coercion` - Coerce an object to a base type
- `has_length` - How long is an object?
- `get_env` - Get or set the environment of an object
- `is_integerish` - Is a vector integer-like?
- `is_true` - Is object identical to TRUE or FALSE?
- `is_env` - Is object an environment?
- `is_expr` - Is an object an expression?
- `lang` - Create a call
- `new_node` - Helpers for pairlist and language nodes
- `is_stack` - Is object a stack?
- `is_lang` - Is object a call?
- `is_symbol` - Is object a symbol?
- `lifecycle` - Life cycle of the rlang package
- `new_formula` - Create a formula
- `missing` - Missing values
- `new_function` - Create a function
- `parse_quosure` - Parse text into a quosure
- `ns_env` - Get the namespace of a package
- `quo_expr` - Squash a quosure
- `prepend` - Prepend a vector
- `rst_list` - Restarts utilities
- `rst_muffle` - Jump to a muffling restart
- `stack` - Call stack information
- `quo_label` - Format quosures for printing or labelling
- `stack_trim` - Trim top call layers from the evaluation stack
- `return_from` - Jump to or from a frame
- `vector-construction` - Create vectors
- `is_named` - Is object named?
- `vector-old-ctors` - Retired vector construction by length
- `rst_abort` - Jump to the abort restart
- `missing_arg` - Generate or handle a missing argument
- `modify` - Modify a vector
- `set_chr_encoding` - Set encoding of a string or character vector
- `set_expr` - Set and get an expression
- `type-predicates` - Type predicates
- `type_of` - Base type of an object
- `with_env` - Evaluate an expression within a given environment
- `op-na-default` - Replace missing values
- `with_handlers` - Establish handlers on the stack
- `op-null-default` - Default value for NULL
- `overscope_eval_next` - Evaluate next quosure in a data mask
- `parse_quosures` - Parse R code
- `scalar-type-predicates` - Scalar type predicates
- `scoped_bindings` - Temporarily change bindings of an environment
- `sym` - Create a symbol or list of symbols
- `switch_type` - Dispatch on base types
- `duplicate` - Duplicate an R object
- `flatten` - Flatten or squash a list of lists into a simpler vector
- `fn_body` - Get or set function body

### tcltk

Functions in tcltk
[tcltk](https://www.rdocumentation.org/packages/tcltk/versions/3.5.3)
- `TkWidgetcmds` - Tk widget commands
- `tcltk-package` - Tcl/Tk Interface
- `tkProgressBar` - Progress Bars via Tk
- `TkWidgets` - Tk widgets
- `tkpager` - Page file using Tk text widget
- `tk_select.list` - Select Items from a List
- `TclInterface` - Low-level Tcl/Tk Interface
- `tclServiceMode` - Allow Tcl events to be serviced or not
- `tcltk-defunct` - Defunct Functions in Package tcltk
- `tk_choose.files` - Choose a List of Files Interactively
- `TkCommands` - Tk non-widget commands
- `tk_messageBox` - Tk Message Box
- `tkStartGUI` - Tcl/Tk GUI startup
- `tk_choose.dir` - Choose a Folder Interactively

### grDevices

Functions in grDevices
[grDevices](https://www.rdocumentation.org/packages/grDevices/versions/3.5.3)
- `cairo` - Cairographics-based SVG, PDF and PostScript Graphics Devices
- `contourLines` - Calculate Contour Lines
- `colorRamp` - Color interpolation
- `col2rgb` - Color to RGB Conversion
- `cm` - Unit Transformation
- `devAskNewPage` - Prompt before New Page
- `grDevices-package` - The R Graphics Devices and Support for Colours and Fonts
- `dev2bitmap` - Graphics Device for Bitmap Files via Ghostscript
- `getGraphicsEvent` - Wait for a mouse or keyboard event from a graphics window
- `pdf` - PDF Graphics Device
- `embedFonts` - Embed Fonts in PostScript and PDF
- `densCols` - Colors for Smooth Density Plots
- `convertColor` - Convert between Colour Spaces
- `hsv` - HSV Color Specification
- `palette` - Set or View the Graphics Palette
- `make.rgb` - Create colour spaces
- `extendrange` - Extend a Numerical Range by a Small Percentage
- `pdf.options` - Auxiliary Function to Set/View Defaults for Arguments of pdf
- `check.options` - Set Options with Consistency Checks
- `rgb` - RGB Color Specification
- `colors` - Color Names
- `rgb2hsv` - RGB to HSV Conversion
- `dev.size` - Find Size of Device Surface
- `pictex` - A PicTeX Graphics Driver
- `xyz.coords` - Extracting Plotting Structures
- `Palettes` - Color Palettes
- `chull` - Compute Convex Hull of a Set of Points
- `dev.flush` - Hold or Flush Output on an On-Screen Graphics Device.
- `plotmath` - Mathematical Annotation in R
- `dev.interactive` - Is the Current Graphics Device Interactive?
- `xy.coords` - Extracting Plotting Structures
- `xyTable` - Multiplicities of (x,y) Points, e.g., for a Sunflower Plot
- `pretty.Date` - Pretty Breakpoints for Date-Time Classes
- `gray.colors` - Gray Color Palette
- `hcl` - HCL Color Specification
- `dev2` - Copy Graphics Between Multiple Devices
- `dev` - Control Multiple Devices
- `dev.capabilities` - Query Capabilities of the Current Graphics Device
- `n2mfrow` - Compute Default mfrow From Number of Plots
- `ps.options` - Auxiliary Function to Set/View Defaults for Arguments of postscript
- `trans3d` - 3D to 2D Transformation for Perspective Plots
- `nclass` - Compute the Number of Classes for a Histogram
- `postscript` - PostScript Graphics
- `xfig` - XFig Graphics Device
- `postscriptFonts` - PostScript and PDF Font Families
- `grSoftVersion` - Report Versions of Graphics Software
- `dev.capture` - Capture device output as a raster image
- `gray` - Gray Level Specification
- `recordGraphics` - Record Graphics Operations
- `recordPlot` - Record and Replay Plots
- `as.graphicsAnnot` - Coerce an Object for Graphics Annotation
- `Type1Font` - Type 1 and CID Fonts
- `adjustcolor` - Adjust Colors in One or More Directions Conveniently.
- `Hershey` - Hershey Vector Fonts in R
- `Japanese` - Japanese characters in R
- `Devices` - List of Graphical Devices
- `axisTicks` - Compute Pretty Axis Tick Scales
- `boxplot.stats` - Box Plot Statistics
- `as.raster` - Create a Raster Object

### grid

Functions in grid
[grid](https://www.rdocumentation.org/packages/grid/versions/3.5.3)
- `grid.bezier` - Draw a Bezier Curve
- `getNames` - List the names of grobs on the display list
- `gpar` - Handling Grid Graphical Parameters
- `grid.null` - Null Graphical Object
- `grid.pack` - Pack an Object within a Frame
- `grid.rect` - Draw rectangles
- `depth` - Determine the number of levels in an object.
- `grid.refresh` - Refresh the current grid scene
- `grid.clip` - Set the Clipping Region
- `grid.xaxis` - Draw an X-Axis
- `grid.xspline` - Draw an Xspline
- `drawDetails` - Customising grid Drawing
- `stringWidth` - Create a Unit Describing the Width and Height of a String or Math Expression
- `grid.copy` - Make a Copy of a Grid Graphical Object
- `grid.convert` - Convert Between Different grid Coordinate Systems
- `grid.curve` - Draw a Curve Between Locations
- `unit` - Function to Create a Unit Object
- `grid.grill` - Draw a Grill
- `grid.grob` - Create Grid Graphical Objects, aka "Grob"s
- `grid.function` - Draw a curve representing a function
- `unit.pmin` - Parallel Unit Minima and Maxima
- `unit.rep` - Replicate Elements of Unit Objects
- `grid.show.viewport` - Draw a Diagram of a Grid Viewport
- `grid.text` - Draw Text
- `vpPath` - Concatenate Viewport Names
- `widthDetails` - Width and Height of a grid grob
- `grid.get` - Get a Grid Graphical Object
- `grid.move.to` - Move or Draw to a Specified Position
- `grid.newpage` - Move to a New Page on a Grid Device
- `grid.raster` - Render a raster object
- `grid.record` - Encapsulate calculations and drawing
- `grid.yaxis` - Draw a Y-Axis
- `Grid` - Grid Graphics
- `editDetails` - Customising grid Editing
- `explode` - Explode a path into its components.
- `absolute.size` - Absolute Size of a Grob
- `grid-defunct` - Defunct Functions in Package grid
- `grobName` - Generate a Name for a Grob
- `plotViewport` - Create a Viewport with a Standard Plot Layout
- `grid-internal` - Internal Grid Functions
- `grid-package` - The Grid Graphics Package
- `grid.DLapply` - Modify the Grid Display List
- `grid.delay` - Encapsulate calculations and generating a grob
- `resolveRasterSize` - Utility function to resolve the size of a raster grob
- `grid.cap` - Capture a raster image
- `grid.display.list` - Control the Grid Display List
- `grid.grab` - Grab the current grid output
_Querying the Viewport Tree	Get_ the Current Grid Viewport (Tree)
- `dataViewport` - Create a Viewport with Scales based on Data
- `gEdit` - Create and Apply Edit Objects
- `grid.grep` - Search for grobs
- `gPath` - Concatenate Grob Names
- `grid.circle` - Draw a Circle
_Grid Viewports	Create_ a Grid Viewport
- `grid.layout` - Create a Grid Layout
_Working with Viewports	Maintaining_ and Navigating the Grid Viewport Tree
- `grid.draw` - Draw a grid grob
- `grid.edit` - Edit the Description of a Grid Graphical Object
- `grid.lines` - Draw Lines in a Grid Viewport
- `grid.plot.and.legend` - A Simple Plot and Legend Demo
- `grid.force` - Force a grob into its components
- `grid.points` - Draw Data Symbols
- `grid.frame` - Create a Frame for Packing Objects
- `grid.polygon` - Draw a Polygon
- `grid.locator` - Capture a Mouse Click
- `roundrect` - Draw a rectangle with rounded corners
- `grid.pretty` - Generate a Sensible Set of Breakpoints
- `unit.c` - Combine Unit Objects
- `unit.length` - Length of a Unit Object
- `validDetails` - Customising grid grob Validation
- `grid.path` - Draw a Path
- `grid.set` - Set a Grid Graphical Object
- `grid.ls` - List the names of grobs or viewports
- `valid.just` - Validate a Justification
- `grid.reorder` - Reorder the children of a gTree
- `grid.remove` - Remove a Grid Graphical Object
- `xDetails` - Boundary of a grid grob
- `makeContent` - Customised grid Grobs
- `xsplinePoints` - Return the points that would be used to draw an Xspline (or a Bezier curve).
- `grid.place` - Place an Object within a Frame
- `grobWidth` - Create a Unit Describing the Width of a Grob
- `grid.segments` - Draw Line Segments
- `legendGrob` - Constructing a Legend Grob
- `grobX` - Create a Unit Describing a Grob Boundary Location
- `grid.show.layout` - Draw a Diagram of a Grid Layout
- `showGrob` - Label grid grobs.
- `showViewport` - Display grid viewports.
- `grid.add` - Add a Grid Graphical Object
- `arrow` - Describe arrows to add to a line.
- `calcStringMetric` - Calculate Metric Information for Text

### parallel

Functions in parallel
[parallel](https://www.rdocumentation.org/packages/parallel/versions/3.5.3)
- `RNGstreams` - Implementation of Pierre L'Ecuyer's RngStreams
- `detectCores` - Detect the Number of CPU Cores
- `makeCluster` - Create a Parallel Socket Cluster
- `parallel-package` - Support for Parallel Computation
- `splitIndices` - Divide Tasks for Distribution in a Cluster
- `clusterApply` - Apply Operations using Clusters

### nlme

Functions in nlme
[nlme](https://www.rdocumentation.org/packages/nlme/versions/3.1-137)
- `Cefamandole` - Pharmacokinetics of Cefamandole
- `Dim.corSpatial` - Dimensions of a corSpatial Object
- `Earthquake` - Earthquake Intensity
- `Dim.pdMat` - Dimensions of a pdMat Object
- `ACF` - Autocorrelation Function
- `Dim.corStruct` - Dimensions of a corStruct Object
- `Initialize.corStruct` - Initialize corStruct Object
- `ACF.gls` - Autocorrelation Function for gls Residuals
- `Glucose2` - Glucose Levels Following Alcohol Ingestion
- `Assay` - Bioassay on Cell Culture Plate
- `Gun` - Methods for firing naval guns
- `Initialize.glsStruct` - Initialize a glsStruct Object
- `BodyWeight` - Rat weight over time for different diets
- `Gasoline` - Refinery yield of gasoline
- `Glucose` - Glucose levels over time
- `ACF.lme` - Autocorrelation Function for lme Residuals
- `Initialize` - Initialize Object
- `Dim` - Extract Dimensions from an Object
- `IGF` - Radioimmunoassay of IGF-I Protein
- `Dialyzer` - High-Flux Hemodialyzer
- `Alfalfa` - Split-Plot Experiment on Varieties of Alfalfa
- `Initialize.varFunc` - Initialize varFunc Object
- `Machines` - Productivity Scores for Machines and Workers
- `LDEsysMat` - Generate system matrix for LDEs
- `Muscle` - Contraction of heart muscle sections
- `Names` - Names Associated with an Object
- `Matrix.pdMat` - Assign Matrix to a pdMat or pdBlocked Object
- `[.pdMat` - Subscript a pdMat Object
- `Fatigue` - Cracks caused by metal fatigue
- `MathAchSchool` - School demographic data for MathAchieve
- `Names.reStruct` - Names of an reStruct Object
- `Names.pdMat` - Names of a pdMat Object
- `Matrix.reStruct` - Assign reStruct Matrices
- `Nitrendipene` - Assay of nitrendipene
- `Initialize.lmeStruct` - Initialize an lmeStruct Object
- `MathAchieve` - Mathematics achievement scores
- `Matrix` - Assign Matrix Values
- `Oats` - Split-plot Experiment on Varieties of Oats
- `Rail` - Evaluation of Stress in Railway Rails
- `Initialize.reStruct` - Initialize reStruct Object
- `Ovary` - Counts of Ovarian Follicles
- `Orthodont` - Growth curve data on an orthdontic measurement
- `RatPupWeight` - The weight of rat pups
- `Relaxin` - Assay for Relaxin
- `Names.formula` - Extract Names from a formula
- `Variogram.corSpatial` - Calculate Semi-variogram for a corSpatial Object
- `Variogram.corSpher` - Calculate Semi-variogram for a corSpher Object
- `Names.pdBlocked` - Names of a pdBlocked Object
- `Meat` - Tenderness of meat
- `Remifentanil` - Pharmacokinetics of remifentanil
- `Variogram.corLin` - Calculate Semi-variogram for a corLin Object
- `Variogram.corRatio` - Calculate Semi-variogram for a corRatio Object
- `Milk` - Protein content of cows' milk
- `Pixel` - X-ray pixel intensities over time
- `Quinidine` - Quinidine Kinetics
- `Phenobarb` - Phenobarbitol Kinetics
- `PBG` - Effect of Phenylbiguanide on Blood Pressure
- `Tetracycline2` - Pharmacokinetics of tetracycline
- `Tetracycline1` - Pharmacokinetics of tetracycline
- `Variogram.corExp` - Calculate Semi-variogram for a corExp Object
- `anova.lme` - Compare Likelihoods of Fitted Objects
- `as.matrix.corStruct` - Matrix of a corStruct Object
- `allCoef` - Extract Coefficients from a Set of Objects
- `anova.gls` - Compare Likelihoods of Fitted Objects
- `Variogram.corGaus` - Calculate Semi-variogram for a corGaus Object
- `as.matrix.pdMat` - Matrix of a pdMat Object
- `as.matrix.reStruct` - Matrices of an reStruct Object
- `Oxboys` - Heights of Boys in Oxford
- `Oxide` - Variability in Semiconductor Manufacturing
- `augPred` - Augmented Predictions
- `Wheat` - Yields by growing conditions
- `coef.varFunc` - varFunc Object Coefficients
- `balancedGrouped` - Create a groupedData object from a matrix
- `collapse` - Collapse According to Groups
- `Wheat2` - Wheat Yield Trials
- `corExp` - Exponential Correlation Structure
- `Variogram.default` - Calculate Semi-variogram
- `Variogram.gls` - Calculate Semi-variogram for Residuals from a gls Object
- `Soybean` - Growth of soybean plants
- `bdf` - Language scores
- `corAR1` - AR(1) Correlation Structure
- `coef.gnls` - Extract gnls Coefficients
- `comparePred` - Compare Predictions
- `coef.corStruct` - Coefficients of a corStruct Object
- `corFactor` - Factor of a Correlation Matrix
- `coef.lmList` - Extract lmList Coefficients
- `VarCorr` - Extract variance and correlation components
- `coef.pdMat` - pdMat Object Coefficients
- `Variogram` - Calculate Semi-variogram
- `Spruce` - Growth of Spruce Trees
- `coef.reStruct` - reStruct Object Coefficients
- `collapse.groupedData` - Collapse a groupedData Object
- `corClasses` - Correlation Structure Classes
- `ergoStool` - Ergometrics experiment with stool types
- `corARMA` - ARMA(p,q) Correlation Structure
- `fdHess` - Finite difference Hessian
- `corCompSymm` - Compound Symmetry Correlation Structure
- `compareFits` - Compare Fitted Objects
- `Variogram.lme` - Calculate Semi-variogram for Residuals from an lme Object
- `corMatrix.corStruct` - Matrix of a corStruct Object
- `corCAR1` - Continuous AR(1) Correlation Structure
- `Wafer` - Modeling of Analog MOS Circuits
- `corSpher` - Spherical Correlation Structure
- `corSymm` - General Correlation Structure
- `formula.pdBlocked` - Extract pdBlocked Formula
- `asOneFormula` - Combine Formulas of a Set of Objects
- `fitted.lmList` - Extract lmList Fitted Values
- `corMatrix.pdMat` - Extract Correlation Matrix from a pdMat Object
- `asTable` - Convert groupedData to a matrix
- `formula.pdMat` - Extract pdMat Formula
- `fitted.lme` - Extract lme Fitted Values
- `fitted.lmeStruct` - Calculate lmeStruct Fitted Values
- `fitted.nlmeStruct` - Calculate nlmeStruct Fitted Values
- `formula.reStruct` - Extract reStruct Object Formula
- `corFactor.corStruct` - Factor of a corStruct Object Matrix
- `coef.lme` - Extract lme Coefficients
- `getCovariate.data.frame` - Extract Data Frame Covariate
- `gapply` - Apply a Function by Groups
- `corGaus` - Gaussian Correlation Structure
- `getGroups.gls` - Extract gls Object Groups
- `getCovariate.varFunc` - Extract varFunc Covariate
- `getGroups.lmList` - Extract lmList Object Groups
- `coef.modelStruct` - Extract modelStruct Object Coefficients
- `getResponseFormula` - Extract Formula Specifying Response Variable
- `getVarCov` - Extract variance-covariance matrix
- `corSpatial` - Spatial Correlation Structure
- `corRatio` - Rational Quadratic Correlation Structure
- `corLin` - Linear Correlation Structure
- `fitted.glsStruct` - Calculate glsStruct Fitted Values
- `corMatrix` - Extract Correlation Matrix
- `fitted.gnlsStruct` - Calculate gnlsStruct Fitted Values
- `getCovariateFormula` - Extract Covariates Formula
- `getCovariate` - Extract Covariate from an Object
- `getGroupsFormula` - Extract Grouping Formula
- `getData` - Extract Data from an Object
- `getCovariate.corStruct` - Extract corStruct Object Covariate
- `corMatrix.reStruct` - Extract Correlation Matrix from Components of an reStruct Object
- `getResponse` - Extract Response Variable from an Object
- `corNatural` - General correlation in natural parameterization
- `getGroups.lme` - Extract lme Object Groups
- `getGroups.varFunc` - Extract varFunc Groups
- `glsStruct` - Generalized Least Squares Structure
- `getGroups.corStruct` - Extract corStruct Groups
- `gnls` - Fit Nonlinear Model Using Generalized Least Squares
- `gls-internal` - Auxiliary functions used by gls
- `getGroups.data.frame` - Extract Groups from a Data Frame
- `gls` - Fit Linear Model Using Generalized Least Squares
- `gsummary` - Summarize by Groups
- `fixed.effects` - Extract Fixed Effects
- `gnlsStruct` - Generalized Nonlinear Least Squares Structure
- `fixef.lmList` - Extract lmList Fixed Effects
- `intervals` - Confidence Intervals on Coefficients
- `getData.gls` - Extract gls Object Data
- `getData.lmList` - Extract lmList Object Data
- `groupedData` - Construct a groupedData Object
- `lme.groupedData` - LME fit from groupedData Object
- `gnlsControl` - Control Values for gnls Fit
- `lmList.groupedData` - lmList Fit from a groupedData Object
- `gnlsObject` - Fitted gnls Object
- `lme` - Linear Mixed-Effects Models
- `lme.lmList` - LME fit from lmList Object
- `intervals.gls` - Confidence Intervals on gls Parameters
- `intervals.lme` - Confidence Intervals on lme Parameters
- `getData.lme` - Extract lme Object Data
- `logLik.gnlsStruct` - Log-Likelihood of a gnlsStruct Object
- `logLik.reStruct` - Calculate reStruct Log-Likelihood
- `getGroups` - Extract Grouping Factors from an Object
- `isBalanced` - Check a Design for Balance
- `logLik.varFunc` - Extract varFunc logLik
- `glsControl` - Control Values for gls Fit
- `logLik.lmList` - Log-Likelihood of an lmList Object
- `glsObject` - Fitted gls Object
- `logDet.corStruct` - Extract corStruct Log-Determinant
- `logDet.pdMat` - Extract Log-Determinant from a pdMat Object
- `intervals.lmList` - Confidence Intervals on lmList Coefficients
- `pairs.lme` - Pairs Plot of an lme Object
- `pdClasses` - Positive-Definite Matrix Classes
- `pdBlocked` - Positive-Definite Block Diagonal Matrix
- `nlmeControl` - Control Values for nlme Fit
- `model.matrix.reStruct` - reStruct Model Matrix
- `nlme.nlsList` - NLME fit from nlsList Object
- `logDet.reStruct` - Extract reStruct Log-Determinants
- `lmeStruct` - Linear Mixed-Effects Structure
- `pdConstruct` - Construct pdMat Objects
- `needUpdate` - Check if Update is Needed
- `isInitialized` - Check if Object is Initialized
- `logDet` - Extract the Logarithm of the Determinant
- `lmList` - List of lm Objects with a Common Model
- `pdCompSymm` - Positive-Definite Matrix with Compound Symmetry Structure
- `logLik.corStruct` - Extract corStruct Log-Likelihood
- `nlmeStruct` - Nonlinear Mixed-Effects Structure
- `phenoModel` - Model function for the Phenobarb data
- `nlmeObject` - Fitted nlme Object
- `logLik.glsStruct` - Log-Likelihood of a glsStruct Object
- `update.varFunc` - Update varFunc Object
- `predict.gnls` - Predictions from a gnls Object
- `pdMatrix.reStruct` - Extract Matrix or Square-Root Factor from Components of an reStruct Object
- `splitFormula` - Split a Formula
- `pdSymm` - General Positive-Definite Matrix
- `lmeControl` - Specifying Control Values for lme Fit
- `plot.ACF` - Plot an ACF Object
- `pdNatural` - General Positive-Definite Matrix in Natural Parametrization
- `plot.nffGroupedData` - Plot an nffGroupedData Object
- `random.effects` - Extract Random Effects
- `predict.lmList` - Predictions from an lmList Object
- `lmeObject` - Fitted lme Object
- `logLik.gnls` - Log-Likelihood of a gnls Object
- `nlme` - Nonlinear Mixed-Effects Models
- `summary.corStruct` - Summarize a corStruct Object
- `needUpdate.modelStruct` - Check if a modelStruct Object Needs Updating
- `plot.lme` - Plot an lme or nls object
- `recalc.modelStruct` - Recalculate for a modelStruct Object
- `plot.Variogram` - Plot a Variogram Object
- `pairs.compareFits` - Pairs Plot of compareFits Object
- `plot.augPred` - Plot an augPred Object
- `predict.gls` - Predictions from a gls Object
- `recalc.corStruct` - Recalculate for corStruct Object
- `logLik.lme` - Log-Likelihood of an lme Object
- `pooledSD` - Extract Pooled Standard Deviation
- `pairs.lmList` - Pairs Plot of an lmList Object
- `recalc.reStruct` - Recalculate for an reStruct Object
- `residuals.gnlsStruct` - Calculate gnlsStruct Residuals
- `recalc.varFunc` - Recalculate for varFunc Object
- `varIdent` - Constant Variance Function
- `summary.lme` - Summarize an lme Object
- `residuals.nlmeStruct` - Calculate nlmeStruct Residuals
- `quinModel` - Model function for the Quinidine data
- `varPower` - Power Variance Function
- `pdMatrix` - Extract Matrix or Square-Root Factor from a pdMat Object
- `residuals.lmList` - Extract lmList Residuals
- `varConstPower` - Constant Plus Power Variance Function
- `pdConstruct.pdBlocked` - Construct pdBlocked Objects
- `logLik.lmeStruct` - Log-Likelihood of an lmeStruct Object
- `varClasses` - Variance Function Classes
- `summary.nlsList` - Summarize an nlsList Object
- `varComb` - Combination of Variance Functions
- `pdFactor.reStruct` - Extract Square-Root Factor from Components of an reStruct Object
- `summary.modelStruct` - Summarize a modelStruct Object
- `nlsList` - List of nls Objects with a Common Model
- `plot.gls` - Plot a gls Object
- `varWeights` - Extract Variance Function Weights
- `pdFactor` - Square-Root Factor of a Positive-Definite Matrix
- `plot.compareFits` - Plot a compareFits Object
- `pdIdent` - Multiple of the Identity Positive-Definite Matrix
- `nlsList.selfStart` - nlsList Fit from a selfStart Function
- `plot.nmGroupedData` - Plot an nmGroupedData Object
- `ranef.lme` - Extract lme Random Effects
- `print.summary.pdMat` - Print a summary.pdMat Object
- `pdDiag` - Diagonal Positive-Definite Matrix
- `reStruct` - Random Effects Structure
- `pdMat` - Positive-Definite Matrix
- `print.varFunc` - Print a varFunc Object
- `predict.lme` - Predictions from an lme Object
- `ranef.lmList` - Extract lmList Random Effects
- `varExp` - Exponential Variance Function
- `plot.ranef.lme` - Plot a ranef.lme Object
- `pdLogChol` - General Positive-Definite Matrix
- `plot.nfnGroupedData` - Plot an nfnGroupedData Object
- `residuals.lme` - Extract lme Residuals
- `varFunc` - Variance Function Structure
- `residuals.lmeStruct` - Calculate lmeStruct Residuals
- `recalc` - Recalculate Condensed Linear Model Object
- `qqnorm.gls` - Normal Plot of Residuals from a gls Object
- `plot.intervals.lmList` - Plot lmList Confidence Intervals
- `predict.nlme` - Predictions from an nlme Object
- `summary.pdMat` - Summarize a pdMat Object
- `residuals.glsStruct` - Calculate glsStruct Residuals
- `plot.ranef.lmList` - Plot a ranef.lmList Object
- `residuals.gls` - Extract gls Residuals
- `simulate.lme` - Simulate Results from lme Models
- `qqnorm.lme` - Normal Plot of Residuals or Random Effects from an lme Object
- `update.modelStruct` - Update a modelStruct Object
- `plot.lmList` - Plot an lmList Object
- `solve.pdMat` - Calculate Inverse of a Positive-Definite Matrix
- `summary.varFunc` - Summarize varFunc Object
- `summary.lmList` - Summarize an lmList Object
- `summary.gls` - Summarize a Generalized Least Squares gls Object
- `varFixed` - Fixed Variance Function
- `solve.reStruct` - Apply Solve to an reStruct Object
- `varWeights.glsStruct` - Variance Weights for glsStruct Object
- `varWeights.lmeStruct` - Variance Weights for lmeStruct Object
- `Covariate.varFunc` - Assign varFunc Covariate
- `Coef` - Assign Values to Coefficients
- `Covariate` - Assign Covariate Values

### Splines

Functions in splines
[splines](https://www.rdocumentation.org/packages/splines/versions/3.5.3)
- `splines-package` - Regression Spline Functions and Classes
- `polySpline` - Piecewise Polynomial Spline Representation
- `predict.bSpline` - Evaluate a Spline at New Values of x
- `asVector` - Coerce an Object to a Vector
- `bs` - B-Spline Basis for Polynomial Splines
- `interpSpline` - Create an Interpolation Spline
- `predict.bs` - Evaluate a Spline Basis
- `backSpline` - Monotone Inverse Spline
- `splineDesign` - Design Matrix for B-splines
- `ns` - Generate a Basis Matrix for Natural Cubic Splines
- `periodicSpline` - Create a Periodic Interpolation Spline
- `splineKnots` - Knot Vector from a Spline
- `splineOrder` - Determine the Order of a Spline
- `xyVector` - Construct an xyVector Object

