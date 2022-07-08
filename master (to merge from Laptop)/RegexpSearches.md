# Reg Ex

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

---

([\s]{3,})

Find more than 3 spaces. Replace with

' - '

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
