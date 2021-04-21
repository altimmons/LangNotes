# Reg Ex


[Javascript Regex](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions#advanced_searching_with_flags)



## Reference


Character classes
- `.` - any character except newline
- `\w\d\s` - word, digit, whitespace
- `\W\D\S` - not word, digit, whitespace
- `[abc]` - any of a, b, or c
- `[^abc]` - not a, b, or c
- `[a-g]` - character between a & g
Anchors
- `^abc$` - start / end of the string
- `\b\B` - word, not-word boundary
Escaped characters
- `\.\*\\` - escaped special characters
- `\t\n\r` - tab, linefeed, carriage return
Groups & Lookaround
- `(abc)` - capture group
- `\1` - backreference to group #1
- `(?:abc)` - non-capturing group
- `(?=abc)` - positive lookahead
- `(?!abc)` - negative lookahead
Quantifiers & Alternation
- `a*a+a?` - 0 or more, 1 or more, 0 or 1
- `a{5}a{2,}` - exactly five, two or more
- `a{1,3}` - between one & three
- `a+?a{2,}?` - match as few as possible
- `ab|cd` - match ab or cd
Substitution
- `$&` -  match
- `$1` -  capture group
- ```$` ``` -  (backtick) before match
- `$'` - (single quote) after match
- `$$` - escaped `$`
- `\n` - other escaped chars






(?=ABC) positive lookahead - Matches a group after the main expression without including it in the result.

    Example

        \d(?=px)
        1pt 2px 3em 4px  # matches 2 and 4

(?!ABC) negative lookahead - Specifies a group that can not match after the main expression (if it matches, the result is discarded).

    Example

        \d(?!px)
        1pt 2px 3em 4px # matches 1 and 3
Flags
- `i` - ignore case
- `g` - global search - Retain the index of the last match, allowing subsequent searches to start from the end of the previous match.
- `m` - multiline - When the multiline flag is enabled, beginning and end anchors (`^` and `$`) will match the start and end of a line, instead of the start and end of the whole string.
- `u` - unicode - When the unicode flag is enabled, you can use extended unicode escapes in the form `\x{FFFFF}`.
- `y` - sticky - The expression will only match from its lastIndex position and ignores the global (g) flag if set. Because each search in RegExr is discrete, this flag has no further impact on the displayed results.

Expression flags change how the expression is interpreted. Flags follow the closing forward slash of the expression (ex. /.+/igm ).

!!!note Patterns such as `/^[\s\S]+$/m` may return matches that span multiple lines because the anchors will match the start/end of any line.


## word list to individual lines

input

        basename cat chcon chgrp chmod chown chroot cksum comm cp
        csplit cut date dd df dir dircolors dirname du echo env expand

regex:

        (\b.+?)(\s)
        ((\b|^).+?)(\s|\n)  # improved new line handling
        ((\b|^\s*?)\w+?)(\s|\n)  # doesnt turn spaces into lines
        (\b|^\s*?)(\w+?)(\s|\n) # now handles indents
        (\b|^\s*?)(\w+?)(\s|\n|,) # now handles commas

terms

        - `$1`\n
        - `$2`\n #v.4+

result example

- `cat`
- `chcon`
- `chgrp`
- `chmod`
- `chown`
- `chroot`
- `cksum`
- `comm`
- `cp`
- `csplit`
- `cut`
- `date`
- `dd`
- `df`
- `dir`
- `dircolors`
- `dirname`
- `du`
- `echo`
- `env`
expand

## example - explination list separated by whitespace


example

        \w\d\s	word, digit, whitespace
        \W\D\S	not word, digit, whitespace
        [abc]	any of a, b, or c
        [^abc]	not a, b, or c
        [a-g]	character between a & g

(^)(\S*?)(\s+?)(.*$)

- `$2` - $4

result- at top

[Balancing Exp](https://www.regular-expressions.info/balancing.html)


[Tutorials](https://www.regular-expressions.info/tutorialcnt.html)



[Reference 1](https://stackoverflow.com/questions/42179046/what-flavor-of-regex-does-visual-studio-code-use/42184299#42184299)

There are many flavors of RegExp- VS Code uses Rust [Rust RegExp](https://docs.rs/regex/0.2.10/regex/) specifically [Here](https://docs.rs/regex/0.2.10/regex/#syntax)

[Microsoft VS RegExp](https://docs.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/2k3te2cs(v=vs.110))
exe64=x64\\(.*?)(

[Substitutions in Reg Exp](https://docs.microsoft.com/en-us/dotnet/standard/base-types/substitutions-in-regular-expressions)

[File](..)

[GOOD- Quick Reference](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
[PDF Version](https://download.microsoft.com/download/D/2/4/D240EBF6-A9BA-4E4F-A63F-AEB6DA0B921C/Regular%20expressions%20quick%20reference.pdf)



!!!Note Note- The link- `Microsoft VS RegExp` suggests an older easier form of RegExp thats worth checking out if this isnt working

- Wildcards
  - `.` - 1   match a single char (any, except new line `\n`)
  - `*` - 0+  - zero or more occurances.
  - `+` - 1+  -one or more occurances.  Requires its occurance.
  - `?` - match 0 or more, but as few characters as possible (?).
    - `.+`  = one or more of any char **As above- this is a (non-null) Wildcard**
    - `.*` = zero or more of any char.  **This is a wildcard functionally**
    - `*?`,`+?`, `??`, `{#...}?` Lazy modifiers of the above.
  - {#} - specify the number of times something *preceeding* should occur.  Goes after. `[0-9]{3} = 142 or 999`
    - {#,#} - specify a range of occurances.  e.g. [0-9]{2,4}  match 10 - 9999
    - {#,} - match at least # times
- Anchors
  - `^` - anchor to front
  - `\r?$` -anchor to rear.  Old character was just `$`
    - this just says match a carriage return or not if it exists.  This has gotten me on linux once.
- Parens and brackets
  - [...] - give characters to match.
    - [\], [c] - match a single char
    - [a-f], [0-9] - match a range
    - [pre], [.)-] - match a single character in a set. [abc] = a, b, c not d, matches a in aa.
  - (...) - specify a string to search for
    - (...) -> `\1` define a pattern then Reference it later (in the same pattern) with \1 (\2, \3) etc.  `({3}[x])z\1 = xxxzxxx`
    - (...) -> `$1` - in replacements, VS 2011+ replaced \1 with $1.
- Logic
  - `?!` = NOT , `real(?!ity)` matched real and really but not reality.
  - [^...] - NOT in set - as above for brackets, but invalidates `be[^abc]` does not match bear but would match bee.
  - `|` = OR - Match either the sequence before or after. `([0-9]|[a-f]|[^g-z])` - to find hex `#([0-9]|[a-f]){6}` find hex colors
- Types
  - `(\b\S+\s?){1,}`  USEFUL- find words - start at word boundary -repeat to go to non-space- find 0 or 1 space- then all of it {1,}- one or more words.
  - `\p{...}` match a type
  - `\b` -specifies a word boundary- usually a space `\bin` matches inside but not bin.
  - `\r?\n` - line break carriage return.   This is system independent - 0 or more \r (returns), then \n.  Or at least Unix/Win
  - `(?([^\r\n])\s)` Whitespace
  - `\d` digit
  - \u#### -unicode (specific char)
  - `((\".+?\")|('.+?'))` = quoted string
  - `\b0[xX]([0-9a-fA-F])\b` matches hex- Matches "0xc67f" but not "0xc67fc67f".
  - `\b[0-9]*\.*[0-9]+\b` int and floats.
- Characters
  - `\` -escape character - e.g. `\.` is a literal `.` not anychar.
  - \b - word boundary
  - \t tab character (\u0009)
  - \r carriage return \u000D
  - \v vert tab
  - \f form feed
  - `\n` new line (\u000A)
  - `\e` escape \u001b
  - `\###` | `\##` matches an **ASCII Character** in Octal | Hex
  - `\cC` matches CtrlC
  - `\octal` 2-3 digit octal character code
  - `\x` hex 2-digit hex character code
  - `\u` hex 4-digit hex character code
  - `\b` Backspace \u0008 NOTE-This is redundant with word boundry, not sure how it'd work.
  - `\e` Escape \u001B
- Classes- generally UPPER CASE is NOT a category.
  - \S -any non-White-Space
  - \s - any whitespace character
  - \D - Matches a nondigit char - equiv to `\P{Nd}`
  - \d - a decimal digit (e.g number 0-9)
    - \d{1,5}- Match from one to five decimal digits.
  - `\w` Alphanumeric ('Word character')
  - \W non word character
  - \p{**} - is in a category
  - \P{**} is NOT in a category
  - Categories (more specific classes) (`\p{...}`)
    - Ll  -Letter, Lowercase
    - Lu  -Letter, Uppercase
    - Lt  -Letter, Titlecase
    - Lo  -Letter, Other
    - Lm  -Letter, Modifier
    - Mn  -Mark, Nonspacing
    - Nd  -Number, Decimal Digit
    - Pc  -Punctuation, Connector. This category includes ten characters, the most commonly used of which is the LOWLINE character (_), u+005F.
    - L -Any letter
    - Mn - Mark, Nonspacing
    - Mc - Mark, Spacing Combining
    - Me - Mark, Enclosing
    - M - All diacritic marks. This includes the Mn, Mc, and Me categories.
    - Nd - Number, Decimal Digit
    - Nl - Number, Letter
    - No - Number, Other
    - N - All numbers. This includes the Nd, Nl, and No categories.
    - Pc - Punctuation, Connector
    - Pd - Punctuation, Dash
    - Ps - Punctuation, Open
    - Pe - Punctuation, Close
    - Pi - Punctuation, Initial quote (may behave like Ps or Pe depending on usage)
    - Pf - Punctuation, Final quote (may behave like Ps or Pe depending on usage)
    - Po - Punctuation, Other
    - P - All punctuation characters. This includes the Pc, Pd, Ps, Pe, Pi, Pf, and Po categories.
    - Sm - Symbol, Math
    - Sc - Symbol, Currency
    - Sk - Symbol, Modifier
    - So - Symbol, Other
    - S - All symbols. This includes the Sm, Sc, Sk, and So categories.
    - Zs - Separator, Space
    - Zl - Separator, Line
    - Zp - Separator, Paragraph
    - Z - All separator characters. This includes the Zs, Zl, and Zp categories.
    - Cc - Other, Control
    - Cf - Other, Format
    - Cs - Other, Surrogate
    - Co - Other, Private Use
    - Cn - Other, Not Assigned (no characters have this property)
    - C - All control characters. This includes the Cc, Cf, Cs, Co, and Cn categories.

- Anchors
  - `^`  match must occur at the _beginning_ of the string;
    - multiline mode, it must occur at the beginning of the line.
  - `$`  the match must occur at _the end of the string or before \n_ at the end of the string;
    - in multiline mode, it must occur at the end of the line or before \n at the end of the line.
  - `\A`  The match must occur at the beginning of the string only (no multiline support).
  - `\Z`  The match must occur at the end of the string, or before \n at the end of the string.
  - `\z`  The match must occur at the end of the string only.
  - `\G`  The match must start at the position where the previous match ended.
  - `\b`  The match must occur on a **word boundary.**
  - `\B`  The match must not occur on a word boundary.


^()(\S+?)([ ]{2,}\t*[ ]{2,})(\b.*)$
^()(\S+?)(([ ]{3,}|)\t*([ ]{3,}|))(\b.*)$

## Group Referencing (Reusing a previously used group)
- `(exp)` Indexed group
- `(?<name>exp)` -  Named group
- `(?<name1-name2>exp)` - Balancing group
- `(?:exp)` - Noncapturing group
- `(?=exp)` - Zero-width positive lookahead
- `(?!exp)` - Zero-width negative lookahead
- `(?<=exp)` - Zero-width positive lookbehind
- `(?<!exp)` - Zero-width negative lookbehind
- `(?>exp)` - Non-backtracking (greedy)
-  `?!` = NOT , `real(?!ity)` matched real and really but not reality.

## Use To substitute
- `$n` - Substring matched by group number n
- `${` - name}     Substring matched by group
- `$$` - Literal $ character
- `$&` - Copy of whole match
- ``  $` `` ([[DollarSign + Backtick]]- Text before the match
- `$'` - Text after the match
- `$+` - Last captured group
- `$` - _   Entire input string

## Conditionals

- `a |b` - Either a or b
- `(?(exp) yes | no)` -> `yes` if exp is matched and  =`no` if exp isn't matched
- `(?(name) yes | no)` -> `yes` if name is matched  and  = `no` if name isn't matched

## Comments
- `(?# comment)` Add inline comment
- `#` Add x-mode comment


## backreferencing
- `\n` - Indexed group
- `\k<name>` - Named group


## Options
- `(?imnsximnsx)` Set or disable the specified options
- `(?imnsximnsx:exp)` Set or disable the specified options within the expression
  - `i` - Case-insensitive
  - `m` - Multiline mode
  - `n` - Explicit (named)
  - `s` - Single-line mode
  - `x` - Ignore white space


## Another set of flags

[Mozilla Docs on RegEx](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_Expressions#advanced_searching_with_flags)



| Flag | Description                               | Corresponding property      |
| ---- | ----------------------------------------- | --------------------------- |
| d    | Generate indices for substring matches.   | RegExp.prototype.hasIndices |
| g    | Global search.                            | RegExp.prototype.global     |
| i    | Case-insensitive search.                  | RegExp.prototype.ignoreCase |
| m    | Multi-line search.                        | RegExp.prototype.multiline  |
| s    | Allows . to match newline characters.     | RegExp.prototype.dotAll     |
| u    | "unicode";[2]                             | RegExp.prototype.unicode    |
| y    | Perform a "sticky" search [1] See sticky. | RegExp.prototype.sticky     |

1. that matches starting at the current position in the target string.
2.  treat a pattern as a sequence of unicode code points.


Greedy Lazy Matches
0 or more times | `*` Greedy `*?`  Lazy
1 or more times | `+` Greedy  `+?`  Lacy
 `?` |  `??` Lazy 0 or 1 time |
`{n}` `{n}?` Exactly n times
`{n,}` `{n,}?` At least n times
`{n,m}` `{n,m}?` From n to m times

| Greedy    | Lazy       | Matches           |
| --------- | ---------- | ----------------- |
| `*`       | `*?`       | 0 or more times   |
| `+`       | `+?`       | 1 or more times   |
| `?`       | `??`       | 0 or 1 time       |
| `{`n`}`   | `{`n`}?`   | Exactly n times   |
| `{`n,`}`  | `{`n,`}?`  | At least n times  |
| `{`n,m`}` | `{`n,m`}?` | From n to m times |

Note- `{n,m}` and similar are recorded weird because they disappear from table when entered verbatim, it must be the format of the table code.


The regular expression pattern \b`(?<n2>\d{2}-)?``(?(n2)``\d{7}`|`\d{3}-\d{2}-\d{4}`)\b is interpreted as shown in the following table.

Pattern  Description
- `\b`  Start at a word boundary.
- `(?<n2>\d{2}-)?` Match zero or one occurrence of two digits followed by a hyphen. Name this capturing group n2.
- `(?(n2)`  Test whether n2 was matched in the input string.
- `)\d{7}`   If n2 was matched, match seven decimal digits.
- `|\d{3}-\d{2}-\d{4}` If n2 was not matched, match three decimal digits, a hyphen, two decimal digits, another hyphen, and four decimal digits.
- `\b`  Match a word boundary.



### Lookaheads and Lookbehinds

Lookarounds at a glance

When the regular expression engine hits a lookaround expression, it takes a substring reaching from the current position to the start (lookbehind) or end (lookahead) of the original string, and then runs Regex.IsMatch on that substring using the lookaround pattern. Success of this subexpression's result is then determined by whether it's a positive or negative assertion.

Lookarounds at a glance
Lookaround 	Name 	Function
(?=check) 	Positive Lookahead 	Asserts that what immediately follows the current position in the string is "check"
(?<=check) 	Positive Lookbehind 	Asserts that what immediately precedes the current position in the string is "check"
(?!check) 	Negative Lookahead 	Asserts that what immediately follows the current position in the string is not "check"
(?<!check) 	Negative Lookbehind 	Asserts that what immediately precedes the current position in the string is not "check"

| Lookaround | Name                | Function                                                                                 |
| ----------- | -------------------- | ---------------------------------------------------------------------------------------- |
| (?=check)  | Positive Lookahead  | Asserts that what immediately follows the current position in the string is "check"      |
| (?<=check) | Positive Lookbehind | Asserts that what immediately precedes the current position in the string is "check"     |
| (?!check)  | Negative Lookahead  | Asserts that what immediately follows the current position in the string is not "check"  |
| (?<!check) | Negative Lookbehind | Asserts that what immediately precedes the current position in the string is not "check" |


Once they have matched, atomic groups won't be re-evaluated again, even when the remainder of the pattern fails due to the match. This can significantly improve performance when quantifiers occur within the atomic group or the remainder of the pattern.



### Examples

Verifying Email:

```c#
 public static void Main()
   {
      Stopwatch sw;
      string[] addresses = { "AAAAAAAAAAA@contoso.com",
                             "AAAAAAAAAAaaaaaaaaaa!@contoso.com" };
      // The following regular expression should not actually be used to
      // validate an email address.
      string pattern = @"^[0-9A-Z]([-.\w]*[0-9A-Z])*$";
      string input;

      foreach (var address in addresses) {
         string mailBox = address.Substring(0, address.IndexOf("@"));
         int index = 0;
         for (int ctr = mailBox.Length - 1; ctr >= 0; ctr--) {
            index++;

            input = mailBox.Substring(ctr, index);
            sw = Stopwatch.StartNew();
            Match m = Regex.Match(input, pattern, RegexOptions.IgnoreCase);
            sw.Stop();
            if (m.Success)
               Console.WriteLine("{0,2}. Matched '{1,25}' in {2}",
                                 index, m.Value, sw.Elapsed);
            else
               Console.WriteLine("{0,2}. Failed  '{1,25}' in {2}",
                                 index, input, sw.Elapsed);
         }
         Console.WriteLine();
      }
   }
```

Example with open and close paren- might need this someday.

<https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference>

[Better Source](https://docs.microsoft.com/en-us/dotnet/standard/base-types/grouping-constructs-in-regular-expressions#balancing_group_definition)

(?< name1 - name2 > subexpression )

Defines a balancing group definition. For more information, see the "Balancing Group Definition" section in Grouping Constructs.

`(((?'Open'\()[^\(\)]*)+((?'Close-Open'\))[^\(\)]*)+)*(?(Open)(?!))$`

"((1-3)*(3-1))" in "3+2^((1-3)*(3-1))"


[Parsing a string - Serial No Example in C#](https://stackoverflow.com/questions/18229939/regex-check-and-pad-string-to-ensure-certain-string-format-is-use)

# My Examples

## 1

(-{1,2}[\w-]*)
([-]{1,2}\w+)
`$1`

alternative :
/([\n]^|[\s])(([-]{1,2}.*?)(\s|[,]+))*?(.*$)/
$1`$2`$3
(-{1,2}[^\s{2,},]+)(,| {2,})
(-{1,2}[^\s,]+)(,|\s)

Best One:

         (-{1,2})(.+?)(,| {2,}|\t)

        `$1$2`$3  Followed by a ruleset


Main operation mode:

-A, --catenate, --concatenate   append tar files to an archive
-c, --create               create a new archive
-d, --diff, --compare      find differences between archive and file system
    --delete               delete from the archive (not on mag tapes!)
-r, --append               append files to the end of an archive
-t, --list                 list the contents of an archive
    --test-label           test the archive volume label and exit
-u, --update               only append files newer than copy in archive
-x, --extract, --get       extract files from an archive

`-A`, `--catenate`, `--concatenate`   append tar files to an archive
`-c`, `--create`               create a new archive
`-d`, `--diff`, `--compare`      find differences between archive and file system
    `--delete`               delete from the archive (not on mag tapes!)
`-r`, `--append`               append files to the end of an archive
`-t`, `--list`                 list the contents of an archive
    `--test-label`           test the archive volume label and exit
`-u`, `--update`               only append files newer than copy in archive
`-x`, `--extract`, `--get`       extract files from an archive


## 2

xargs also takes various options:
◊ −nx −−− will group the first x commands together
◊ −lx −−− xargs will execute the command for every x number of lines of input
◊ −p −−− prompt whether or not to execute this particular string
◊ −t −−− (tell) be verbose, echo each command before performing it
◊ −i −−− will use substitution similar to find's −exec option, it will execute certain commands
on something.

(◊ )(−[a-z]{1,2})( −−−)
- `$2`-

## 3
---

([\s]{3,})

Find more than 3 spaces. Replace with

' - '\
    ([{]+)(?<in>.*?)([}]+)(\k<in>)

This code had tis weird duplication inside braces.  But not all, some were just in braces.

So I final all the things bracketed by a brack that immedietly match the same thing after.   Like `{ABC}ABC`  It is written such that everything must match,

    {A\cup B=B\cup A}
    {A\cap B=B\cap A}
    Associative property:
    {(A\cup B)\cup C=A\cup (B\cup C)}
    {(A\cap B)\cap C=A\cap (B\cap C)}
    Distributive property:
    {A\cup (B\cap C)=(A\cup B)\cap (A\cup C)}A\cup (B\cap C)=(A\cup B)\cap (A\cup C)
    {A\cap (B\cup C)=(A\cap B)\cup (A\cap C)}

(^[a-zA-Z]*?) Standard

Finding a table

`(^\|)(.*?)(\|)(.*?)(\|$)`

!!!example For parsing tables:
    Intention is to find `^| ... | ... |$`

        `(^[\[\_.\:\+\*-\w]*)([\t]{2})(.*?$)` -
    convert input from R into (- `xxxx` - xxxx)


!!!code Convert var: text -
         (^[.$\w\s\(\;\)]*)([:])

!!!note Bold betweem the parentheses (xxx) -> **(xxx)**
            ([(])(.*?)([)])
            **$1$2$3**





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

                (^[\b\w., ]+?)([\n]|[\t\n]*)(^.+?$)
                (^[\b\w., ]+?)([\n])(^.+?$)

            and replace with

                        - _$1_ - $3
                        - `$1` - $3
                        - **$1** - $3

!!!example  [[Replace]]
    !!!quote Used for grabbing flags and commenting them
        -d --diff <file> <file>           Compare two files with each other.
        -a --add <folder>                 Add folder(s) to the last active window.
        -g --goto <file:line[:character]> Open a file at the path on the specified
                                            line and character position.
        -n --new-window                   Force to open a new window.
        -r --reuse-window                 Force to open a file or folder in an


        !!!tip Use:
                (-{1,2}[\w\S]+)(( \<.{3,30}\>)|)

            replace with

               `$1$3`

            !!!done    Which returns text like this:
       `-d` `--diff <file> <file>`           Compare two files with each other.
        `-a` `--add <folder>`                 Add folder(s) to the last active window.
        `-g` `--goto <file:line[:character]>` Open a file at the path on the specified
                                            line and character position.
        `-n` `--new-window`                   Force to open a new window.
        `-r` `--reuse-window`                 Force to open a file or folder in an


``(`)([ ]{3,})(\S)`` -> `$1 | $3`



!!!Example To handle the escapes that the Firefox Auto Markdown plugin generates:
    `\\([><*\]\[\-\\])`
    `$1`
    Replaces `\_ \\, \< \> \] \[ \*` with just the character