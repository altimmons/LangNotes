#Textmate Ref

[Textmate References](https://macromates.com/textmate/manual/references#format-string)

[Texmate Snippets](https://macromates.com/manual/en/snippets)

[Textmate 1.5](https://macromates.com/manual/en/)

[Textmate2](https://macromates.com/textmate/manual/)

[VS Code Doc](https://code.visualstudio.com/docs/editor/userdefinedsnippets)



This is a draft of the TextMate 2 manual

References
==========

## Scope Selector
--------------

The scope selector syntax is as follows:

```
<code>atom:         «string» | '*'
scope:        «atom» ('.' «atom»)*
path:         '^'? «scope» ('>'? «scope»)* '/code>?
group:        '(' «selector» ')'
filter:       ("L:"|"R:"|"B:") («group» | «path»)
expression:   '-'? («filter» | «group» | «path»)
composite:    «expression» ([|&-] «expression»)*
selector:     «composite» (',' «composite»)*</code>
```

-   Left/right scope matching
-   Begin/end anchoring, ignoring attribute scopes
-   Wildcard matching
-   Descendent selector

Format String
-------------

```
<code>$«var»
${«var»}
${«var»:?«if»:«else»}
${«var»:+«if»}
${«var»:-«else»}
${«var»:«else»}
${«var»/«regexp»/«format»/«options»}
${«var»:[/upcase][/downcase][/capitalize][/asciify]}

(?«var»:«if»:«else»)
(?«var»:«if»)

\U, \L, \E, \u, \l
\t, \r, \n, \x{HHHH}, \xHH</code>
```

-   Used for: grammar names, `.tm_properties` values, Preferences → Variables, replacement strings

For nested replacements, use named captures as variables are inherited.

Glob String
-----------

```
<code>\«char»         -- Literal «char»
?               -- Match one character
*               -- Match zero or more characters¹
**              -- Match zero or more path components
{«a»,«b»,«c»}   -- Match «a» or «b» or «c»
[«a»«b»«c»]     -- Match an «a», «b» or «c» character
[«a»-«b»]       -- Match one character in the range «a»-«b»
[^«a»-«b»]      -- Match one character not in the range «a»-«b»
~«a» or !«a»    -- Do not match «a», e.g. to match all but *.h
                   files under src/ use `src/**~*.h`</code>
```

Negations (`~` or `!`) can be followed by more negations. E.g. to exclude both `lib*.a` and `*.o` use:

```
<code>~lib*.a~*.o</code>
```

Braces can be nested and contain other glob characters. Example:

```
<code>{*.{cc,mm,h},target,Makefile,.tm_properties}</code>
```

Will match these files:

```
<code>source.cc
source.mm
source.h
target
Makefile
.tm_properties</code>
```

¹ The asterisk will not match slashes nor a leading period.

-   Used in `.tm_properties`, Find in Folder

Selection String
----------------

```
<code>selection    = «range» ('&' «range»)*
range        = «pos» | «normal_range» | «column_range»
pos          = «line» (':' «column»)? ('+' «offset»)?
normal_range = «pos» '-' «pos»
column_range = «pos» 'x' «pos»
line         = [1-9][0-9]*
column       = [1-9][0-9]*
offset       = [1-9][0-9]*</code>
```

This can be used with `mate -l`, *Go to Line...*, and the `⌘T` dialog (by putting `:«selection string»` after the file name) --- as for the latter, if a string on the find clipboard has this format, it will be the default value in `⌘T`, this is useful if you have a line in Terminal like:

```
<code>main.cc:32: warning: no return statement.</code>
```

You can then select `main.cc:32` press `⌘E` and jump to Avian and press `⌘T` followed by `↩` (one shortcoming is that `⌘T` doesn't show the currently open file, so it will only work if `main.cc` is not already the active file).

Modified Property List
----------------------

See TextMate 1.x manual.

Regular Expression
------------------

[Concepts](https://macromates.com/textmate/manual/concepts)[Table of Contents](.)[Updating](https://macromates.com/textmate/manual/updating)

<main><style type="text/css">:root { --chapter-index: 5; }</style>[Text Editing](https://macromates.com/textmate/manual/text-editing)[Table of Contents](.)[Commands](https://macromates.com/textmate/manual/commands)This is a draft of the TextMate 2 manual

Snippets
========

A snippet is a piece of text that you would like to insert in your document. It can include code to run at insertion time, variables (like selected text), tab stops/placeholders for missing information (which you can tab through after insertion) and perform transformations on the data which you enter in the placeholders.

Snippets are created in the bundle editor and are often assigned a tab trigger for easy insertion.

Grammar
-------

Snippets support the following constructs:

```
<code>$«int»
${«int»}
${«int»:«any»}
${«int»/«regexp»/«format»/«options»}
${«int»|«choice 1»,...,«choice n»|}
`«code»`
«format»</code>
```

In the above, `«format»` is a format string and `«any»` refers to any of the above.

The next sections will give examples of each of the above.

Plain Text
----------

In the simplest case, you can use snippets to insert text that you do not want to type again and again, either because you type it a lot, or because the actual text to insert is hard to remember (like your bank account details or the HTML entities for the Apple modifier keys).

If you use snippets to insert plain text there is only one thing you should be aware of: `<main and ``` are reserved characters. So if you want to insert one of these, prefix it with an escape (i.e. `\<main). An escape not followed by one of these two characters (or followed by another escape) will be inserted as a literal character.

Variables
---------

You can use any of TextMate's defined variables by prefixing the name of the variable with `<main. All the normal dynamic variables are supported, the most useful probably being `TM_SELECTED_TEXT`. If for example we want to create a snippet which wraps the selection in a LaTeX `\textbf` command, we can make a snippet which is:

```
<code>\textbf{$TM_SELECTED_TEXT}</code>
```

If no text is selected the variable will not be set, so nothing will be inserted in its place. We can provide a default value by using format string syntax: `${«variable»:«default value»}`. For example:

```
<code>\textbf{${TM_SELECTED_TEXT:no text was selected}}</code>
```

The default value can itself contain variables or shell code. If you want the default text to contain a `}`, you need to escape it. But all other characters are used verbatim.

Variables also support regular expression replacements using this syntax: `${«variable»/«regexp»/«format»/«options»}`. If the variable is not set the replacement will be performed on the empty string. For example, to prepend a bullet to each non-empty line in the selection (and insert that) we can do:

```
<code>${TM_SELECTED_TEXT/^.+$/- $0/g}</code>
```

Interpolated Shell Code
-----------------------

You can use backticks to have shell code executed when the snippet is inserted. The result from running the code gets inserted into the snippet, though with the last newline in the result removed (if present). So for example to create a snippet that wraps the selection in an HTML link, where the URL of that link comes from the clipboard, we can do:

```
<code><a href="`pbpaste`">$TM_SELECTED_TEXT</a></code>
```

Since this is normal shell code, we can write a small program. For example we can let it verify that the clipboard contains only a single line of text like this:

```
<code><a href="`
    if [[ $(pbpaste|wc -l) -eq 0 ]]
        then pbpaste
        else echo http://example.com/
    fi
`">$TM_SELECTED_TEXT</a></code>
```

Inside shell code, the only character you need to escape is the backtick.

Tab Stops
---------

After insertion, the caret will be placed after the last character of the snippet. This is not always desirable and we can change that by using `$0` to mark where we want the caret to be. So if for example we make an HTML `div`-snippet and want the caret to end between the opening and closing tags, we could make it like this:

```
<code><div>
    $0
</div></code>
```

Often though we want to fill in text in several places in the snippet. Multiple tab stops can be provided by inserting `$1`-`$n`. The caret will start at `$1`, then when pressing tab it will move to `$2` and `$3` on next tab etc. until there are no more tab stops. If you do not explicitly set `$0`, the caret will be at the end of the snippet.

So we could for example change the above to:

```
<code><div$1>
    $0
</div></code>
```

This allows us to fill in an argument and then tab on to `$0`.

Placeholders
------------

Like variables, tab stops can also have default values (and are generally referred to as placeholders when they do). The syntax is the same: `${«tab stop»:«default value»}`. And the default value can contain both text, shell code and other placeholders. So we can refine the previous example further:

```
<code><div${1: id="${2:some_id}"}>
    $0
</div></code>
```

Inserting this snippet will insert a `div` tag with the `id` argument selected and we can then decide either to overtype the argument (i.e. delete it) and press tab again to reach `$0`, or we can press tab immediately to get to the second tab stop (the value part of the argument) and edit that.

When you edit the placeholder text, any embedded tab stops will be removed.

Mirrors
-------

There are times when you need to provide the same value several places in the inserted text and in these situations you can re-use the tab stop to signal that you want it mirrored at that location. So for example to create a LaTeX environment with a snippet, we can use:

```
<code>\begin{${1:enumerate}}
    $0
\end{$1}</code>
```

After inserting this snippet, `enumerate` will be selected and if we edit it, the changes will be reflected in the `\end` part as well.

Transformations
---------------

There are situations where we want our placeholder text mirrored but with slight changes or where we want some text to appear depending on the value/presence of a placeholder.

We can accomplish this by doing a regular expression substitution on the placeholder text (when mirroring it). The syntax for this is: `${«tab stop»/«regexp»/«format»/«options»}`.

As an example, the Objective-C getter/setter methods (prior to the `@property` keyword) often look like this (in the [thread-unsafe form](http://ticket.macromates.com/show?ticket_id=E11D9EAF)):

```
<code>- (id)foo
{
    return foo;
}

- (void)setFoo:(id)aValue
{
    [foo autorelease];
    foo = [aValue retain];
}</code>
```

In the format string we can use `${«var»:/upcase}` to uppercase the matched character, so a snippet that only asks for the name of the instance variable once could look like this:

```
<code>- (${1:id})${2:foo}
{
    return $2;
}

- (void)set${2/./${0:/upcase}/}:($1)aValue
{
    [$2 autorelease];
    $2 = [aValue retain];
}</code>
```

We can also use conditional insertions in the format string (`${«var»:+«if-set»}`) to make decisions. For example if we create a snippet for a method we can let the return type decide whether or not the method should include a `return` statement like this:

```
<code>- (${1:void})${2:methodName}
{${1/void$|(.+)/${1:+\n\treturn nil;}/}
}</code>
```

Here we match placeholder 1 against `void` or anything (`.+`) and put the latter match in capture register 1\. Then only if we did match something (other than `void`) will we insert a newline, tab and the `return nil;` text.

Multiple Choices
----------------

Sometimes a placeholder can only take a limited number of values in which case we may want to show a menu with these choices.

This can be done with the `${«int»|«choice 1»,...,«choice n»|}` syntax.

For example:

```
color: ${1|red,green,blue|}
```
[Text Editing](https://macromates.com/textmate/manual/text-editing)[Table of Contents](.)[Commands](https://macromates.com/textmate/manual/commands)


[Saving Files](https://macromates.com/manual/en/saving_files)

[Table of Contents](.)

[Calling TextMate from Other Applications](https://macromates.com/manual/en/using_textmate_from_terminal)

This manual covers TextMate 1.5.1 --- Go to [TextMate 2 manual](/textmate/manual/)

[Macros](https://macromates.com/manual/en/macros)[Table of Contents](.)[Shell Commands](https://macromates.com/manual/en/shell_commands)This manual covers TextMate 1.5.1 --- Go to [TextMate 2 manual](/textmate/manual/)

Snippets
========

A snippet is a piece of text that you would like to insert in your document. It can include code to run at insertion time, variables (like selected text), tab stops/placeholders for missing information (which you can tab through after insertion) and perform transformations on the data which you enter in the placeholders.

![Snippet Editor](../images/snippet_editor.png)

Plain Text
----------

In the simplest case, you can use snippets to insert text that you do not want to type again and again, either because you type it a lot, or because the actual text to insert is hard to remember (like your bank account details or the HTML entities for the Apple modifier keys).

If you use snippets to insert plain text there is only one thing you should be aware of: `$` and ``` are reserved characters. So if you want to insert one of these, prefix it with an escape (i.e. `\$`). An escape not followed by one of these two characters (or followed by another escape) will be inserted as a literal character.

Variables
---------

You can insert the value of a [variable](environment_variables) by prefixing the name of the variable with `$`. All the normal dynamic variables are supported, the most useful probably being `TM_SELECTED_TEXT`. If for example we want to create a snippet which wraps the selection in a LaTeX `\textbf` command, we can make a snippet which is:

```
<code>\textbf{$TM_SELECTED_TEXT}</code>
```

If no text is selected the variable will not be set, so nothing will be inserted in its place. We can provide a default value by using this syntax: `${«variable»:«default value»}`. For example:

```
<code>\textbf{${TM_SELECTED_TEXT:no text was selected}}</code>
```

The default value can itself contain variables or shell code. If you want the default text to contain a `}`, you need to escape it. But all other characters are used verbatim.

Variables also support [regular expression](regular_expressions) replacements using this syntax: `${«variable»/«regexp»/«format»/«options»}`. If the variable is not set the replacement will be performed on the empty string. For example, to prepend a bullet to each non-empty line in the selection (and insert that) we can do:

```
<code>${TM_SELECTED_TEXT/^.+$/- $0/g}</code>
```

Interpolated Shell Code
-----------------------

You can use backticks to have shell code executed when the snippet is inserted. The result from running the code gets inserted into the snippet, though with the last newline in the result removed (if present). So for example to create a snippet that wraps the selection in an HTML link, where the URL of that link comes from the clipboard, we can do:

```
<code><a href="`pbpaste`">$TM_SELECTED_TEXT</a></code>
```

Since this is normal bash code, we can write a small program. For example we can let it verify that the clipboard contains only a single line of text like this:

```
<code><a href="`
    if [[ $(pbpaste|wc -l) -eq 0 ]]
        then pbpaste
        else echo http://example.com/
    fi
`">$TM_SELECTED_TEXT</a></code>
```

Inside shell code, the only character you need to escape is the backtick.

Tab Stops
---------

After insertion, the caret will be placed after the last character of the snippet. This is not always desirable and we can change that by using `$0` to mark where we want the caret to be. So if for example we make an HTML div-snippet and want the caret to end between the opening and closing tags, we could make it like this:

```
<code><div>
    $0
</div></code>
```

Often though we want to fill in text in several places in the snippet. Multiple tab stops can be provided by inserting `$1`-`$n`. The caret will start at `$1`, then when pressing tab it will move to `$2` and `$3` on next tab etc. until there are no more tab stops. If you do not explicitly set `$0`, the caret will be at the end of the snippet.

So we could for example change the above to:

```
<code><div$1>
    $0
</div></code>
```

This allows us to fill in an argument and then tab on to `$0`.

Placeholders
------------

Like variables, tab stops can also have default values (and are generally referred to as placeholders when they do). The syntax is the same: `${«tab stop»:«default value»}`. And the default value can contain both text, shell code and other placeholders. So we can refine the previous example further:

```
<code><div${1: id="${2:some_id}"}>
    $0
</div></code>
```

Inserting this snippet will insert a `div` tag with the `id` argument selected and we can then decide either to overtype the argument (i.e. delete it) and press tab again to reach `$0`, or we can press tab immediately to get to the second tab stop (the value part of the argument) and edit that.

When you edit the placeholder text, any embedded tab stops will be removed.

Mirrors
-------

There are times when you need to provide the same value several places in the inserted text and in these situations you can re-use the tab stop to signal that you want it mirrored at that location. So for example to create a LaTeX environment with a snippet, we can use:

```
<code>\begin{${1:enumerate}}
    $0
\end{$1}</code>
```

After inserting this snippet, `enumerate` will be selected and if we edit it, the changes will be reflected in the `\end` part as well.

Transformations
---------------

There are situations where we want our placeholder text mirrored but with slight changes or where we want some text to appear depending on the value/presence of a placeholder.

We can accomplish this by doing a regular expression substitution on the placeholder text (when mirroring it). The syntax for this is: `${«tab stop»/«regexp»/«format»/«options»}`.

As an example, the Objective-C getter/setter methods (prior to the `@property` keyword) often look like this (in the [thread-unsafe form](http://ticket.macromates.com/show?ticket_id=E11D9EAF)):

```
<code>- (id)foo
{
    return foo;
}

- (void)setFoo:(id)aValue
{
    [foo autorelease];
    foo = [aValue retain];
}</code>
```

In the [format string](regular_expressions#replacement-string-syntax-format-strings) we can use `\u` to uppercase the next character, so a snippet that only asks for the name of the instance variable once could look like this:

```
<code>- (${1:id})${2:foo}
{
    return $2;
}

- (void)set${2/./\u$0/}:($1)aValue
{
    [$2 autorelease];
    $2 = [aValue retain];
}</code>
```

We can also use [conditional insertions](regular_expressions#conditional-insertions) in the format string to make decisions. For example if we create a snippet for a method we can let the return type decide whether or not the method should include a `return` statement like this:

```
<code>- (${1:void})${2:methodName}
{${1/void$|(.+)/(?1:\n\treturn nil;)/}
}</code>
```

Here we match placeholder 1 against `void` or anything (`.+`) and put the latter match in capture register 1\. Then only if we did match something (other than `void`) will we insert a newline, tab and the `return nil;` text.

[Macros](https://macromates.com/manual/en/macros)[Table of Contents](.)[Shell Commands](https://macromates.com/manual/en/shell_commands)

Regular Expressions
===================

Introduction
------------

A regular expression is a domain specific language for matching text. Naively we could write a small program to match text, but this is error-prone, tedious and not very portable or flexible.

Instead we use regular expressions which describe the match as a string which (in a simple case) consists of the character types to match and quantifiers for how many times we want to have the character type matched.

For example normal letters and digits match literally. Something like `\w` will match word characters, where `\s` will match whitespace characters (space, tab, newline, etc.). The period (`.`) will match any character (except newline).

The basic quantifiers are the asterisk (`*`) to specify that the match should happen zero or more times, plus (`+`) for one or more times, or a range can be given as `{min,max}`.

This alone gives us capabilities like finding words (`\w+`) or finding an image tag with an `alt` argument (`<img.*alt=".*">`).

Matching longer text sequences is one thing, but often we are interested in the subset of the match. For example, in the above example we may want to replace the `alt` argument text. If we enclose part of the regular expression with parentheses, we *capture* that part in a variable that can be used in the replacement string. The format of the replacement string is described at the end of this section, but to refer to the first capture, we use `$1`, `$2` for the second etc.

So to change the `alt` argument text we could search for `(<img.*alt=").*(">)` and replace that with `$1Text Intentionally Removed$2`.

*Note that in the examples above `.*` is used. The asterisk operator is however greedy, meaning that it will match as many characters as possible (which still allow a match to occur), so often we want to change it to non-greedy by adding `?`, making it `.*?`.*

### External Resources

-   [Regular-Expressions.info](http://www.regular-expressions.info/)
-   A.M. Kuchling's [Regular Expression HOWTO](http://www.amk.ca/python/howto/regex/)
-   Steve Mansour's [A Tao of Regular Expressions](http://linuxreviews.org/beginner/tao_of_regular_expressions/)
-   Jeffrey Friedl's [Mastering Regular Expressions](http://www.oreilly.com/catalog/regex2/) (book)

Regular Expressions in TextMate
-------------------------------

Here is a list of places where TextMate makes use of regular expressions:

-   Filtering which files should be shown in folder references (added to projects) is done by providing regular expressions.
-   Find and Find in Project both allow regular expression replacements.
-   Folding markers are found via regular expressions.
-   Indentation calculations are based on regular expression matches.
-   Language grammars are basically a tree (with cycles) that have regular expressions in each node.
-   Snippets allow regular expression replacements to be applied to variables and (in realtime) mirrored placeholders.

So needless to say, these play a big role in TextMate. While you can live a happy life without knowing about them, it is strongly recommended that you do pick up a book, tutorial or similar to get better acquainted with these (if you are not already).

In addition to TextMate, many common shell commands support regular expressions (`sed`, `grep`, `awk`, `find`) and popular scripting languages like Perl and Ruby have regular expressions ingrained deep into the language.

Syntax (Oniguruma)
------------------

TextMate uses the Oniguruma regular expression library by K. Kosako.

The following is taken from <http://www.geocities.jp/kosako3/oniguruma/doc/RE.txt>.

```
<code>Oniguruma Regular Expressions Version 5.6.0    2007/04/03

syntax: ONIG_SYNTAX_RUBY (default)

1\. Syntax elements

  \       escape (enable or disable meta character meaning)
  |       alternation
  (...)   group
  [...]   character class

2\. Characters

  \t           horizontal tab (0x09)
  \v           vertical tab   (0x0B)
  \n           newline        (0x0A)
  \r           return         (0x0D)
  \b           back space     (0x08)
  \f           form feed      (0x0C)
  \a           bell           (0x07)
  \e           escape         (0x1B)
  \nnn         octal char            (encoded byte value)
  \xHH         hexadecimal char      (encoded byte value)
  \x{7HHHHHHH} wide hexadecimal char (character code point value)
  \cx          control char          (character code point value)
  \C-x         control char          (character code point value)
  \M-x         meta  (x|0x80)        (character code point value)
  \M-\C-x      meta control char     (character code point value)

 (* \b is effective in character class [...] only)

3\. Character types

  .        any character (except newline)

  \w       word character

           Not Unicode:
             alphanumeric, "_" and multibyte char.

           Unicode:
             General_Category -- (Letter|Mark|Number|Connector_Punctuation)

  \W       non word char

  \s       whitespace char

           Not Unicode:
             \t, \n, \v, \f, \r, \x20

           Unicode:
             0009, 000A, 000B, 000C, 000D, 0085(NEL),
             General_Category -- Line_Separator
                              -- Paragraph_Separator
                              -- Space_Separator

  \S       non whitespace char

  \d       decimal digit char

           Unicode: General_Category -- Decimal_Number

  \D       non decimal digit char

  \h       hexadecimal digit char   [0-9a-fA-F]

  \H       non hexadecimal digit char

  Character Property

    * \p{property-name}
    * \p{^property-name}    (negative)
    * \P{property-name}     (negative)

    property-name:

     + works on all encodings
       Alnum, Alpha, Blank, Cntrl, Digit, Graph, Lower,
       Print, Punct, Space, Upper, XDigit, Word, ASCII,

     + works on EUC_JP, Shift_JIS
       Hiragana, Katakana

     + works on UTF8, UTF16, UTF32
       Any, Assigned, C, Cc, Cf, Cn, Co, Cs, L, Ll, Lm, Lo, Lt, Lu,
       M, Mc, Me, Mn, N, Nd, Nl, No, P, Pc, Pd, Pe, Pf, Pi, Po, Ps,
       S, Sc, Sk, Sm, So, Z, Zl, Zp, Zs,
       Arabic, Armenian, Bengali, Bopomofo, Braille, Buginese,
       Buhid, Canadian_Aboriginal, Cherokee, Common, Coptic,
       Cypriot, Cyrillic, Deseret, Devanagari, Ethiopic, Georgian,
       Glagolitic, Gothic, Greek, Gujarati, Gurmukhi, Han, Hangul,
       Hanunoo, Hebrew, Hiragana, Inherited, Kannada, Katakana,
       Kharoshthi, Khmer, Lao, Latin, Limbu, Linear_B, Malayalam,
       Mongolian, Myanmar, New_Tai_Lue, Ogham, Old_Italic, Old_Persian,
       Oriya, Osmanya, Runic, Shavian, Sinhala, Syloti_Nagri, Syriac,
       Tagalog, Tagbanwa, Tai_Le, Tamil, Telugu, Thaana, Thai, Tibetan,
       Tifinagh, Ugaritic, Yi

4\. Quantifier

  greedy

    ?       1 or 0 times
    *       0 or more times
    +       1 or more times
    {n,m}   at least n but not more than m times
    {n,}    at least n times
    {,n}    at least 0 but not more than n times ({0,n})
    {n}     n times

  reluctant

    ??      1 or 0 times
    *?      0 or more times
    +?      1 or more times
    {n,m}?  at least n but not more than m times
    {n,}?   at least n times
    {,n}?   at least 0 but not more than n times (== {0,n}?)

  possessive (greedy and does not backtrack after repeated)

    ?+      1 or 0 times
    *+      0 or more times
    ++      1 or more times

    ({n,m}+, {n,}+, {n}+ are possessive op. in ONIG_SYNTAX_JAVA only)

    ex. /a*+/ === /(?>a*)/

5\. Anchors

  ^       beginning of the line
  $       end of the line
  \b      word boundary
  \B      not word boundary
  \A      beginning of string
  \Z      end of string, or before newline at the end
  \z      end of string
  \G      matching start position

6\. Character class

  ^...    negative class (lowest precedence operator)
  x-y     range from x to y
  [...]   set (character class in character class)
  ..&&..  intersection (low precedence at the next of ^)

    ex. [a-w&&[^c-g]z] ==> ([a-w] AND ([^c-g] OR z)) ==> [abh-w]

  * If you want to use '[', '-', ']' as a normal character
    in a character class, you should escape these characters by '\'.

  POSIX bracket ([:xxxxx:], negate [:^xxxxx:])

    Not Unicode Case:

      alnum    alphabet or digit char
      alpha    alphabet
      ascii    code value: [0 - 127]
      blank    \t, \x20
      cntrl
      digit    0-9
      graph    include all of multibyte encoded characters
      lower
      print    include all of multibyte encoded characters
      punct
      space    \t, \n, \v, \f, \r, \x20
      upper
      xdigit   0-9, a-f, A-F
      word     alphanumeric, "_" and multibyte characters

    Unicode Case:

      alnum    Letter | Mark | Decimal_Number
      alpha    Letter | Mark
      ascii    0000 - 007F
      blank    Space_Separator | 0009
      cntrl    Control | Format | Unassigned | Private_Use | Surrogate
      digit    Decimal_Number
      graph    [[:^space:]] && ^Control && ^Unassigned && ^Surrogate
      lower    Lowercase_Letter
      print    [[:graph:]] | [[:space:]]
      punct    Connector_Punctuation | Dash_Punctuation | Close_Punctuation |
               Final_Punctuation | Initial_Punctuation | Other_Punctuation |
               Open_Punctuation
      space    Space_Separator | Line_Separator | Paragraph_Separator |
               0009 | 000A | 000B | 000C | 000D | 0085
      upper    Uppercase_Letter
      xdigit   0030 - 0039 | 0041 - 0046 | 0061 - 0066
               (0-9, a-f, A-F)
      word     Letter | Mark | Decimal_Number | Connector_Punctuation

7\. Extended groups

  (?#...)            comment

  (?imx-imx)         option on/off
                         i: ignore case
                         m: multi-line (dot(.) match newline)
                         x: extended form
  (?imx-imx:subexp)  option on/off for subexp

  (?:subexp)         not captured group
  (subexp)           captured group

  (?=subexp)         look-ahead
  (?!subexp)         negative look-ahead
  (?<=subexp)        look-behind
  (?<!subexp)        negative look-behind

                     Subexp of look-behind must be fixed character length.
                     But different character length is allowed in top level
                     alternatives only.
                     ex. (?<=a|bc) is OK. (?<=aaa(?:b|cd)) is not allowed.

                     In negative-look-behind, captured group isn't allowed,
                     but shy group(?:) is allowed.

  (?>subexp)         atomic group
                     don't backtrack in subexp.

  (?<name>subexp), (?'name'subexp)
                     define named group
                     (All characters of the name must be a word character.)

                     Not only a name but a number is assigned like a captured
                     group.

                     Assigning the same name as two or more subexps is allowed.
                     In this case, a subexp call can not be performed although
                     the back reference is possible.

8\. Back reference

  \n          back reference by group number (n >= 1)
  \k<name>    back reference by group name
  \k'name'    back reference by group name

  In the back reference by the multiplex definition name,
  a subexp with a large number is referred to preferentially.
  (When not matched, a group of the small number is referred to.)

  * Back reference by group number is forbidden if named group is defined
    in the pattern and ONIG_OPTION_CAPTURE_GROUP is not setted.

  back reference with nest level

    \k<name+n>     n: 0, 1, 2, ...
    \k<name-n>     n: 0, 1, 2, ...
    \k'name+n'     n: 0, 1, 2, ...
    \k'name-n'     n: 0, 1, 2, ...

    Destinate relative nest level from back reference position.

    ex 1.

      /\A(?<a>|.|(?:(?<b>.)\g<a>\k<b+0>))\z/.match("reer")

    ex 2.

      r = Regexp.compile(<<'__REGEXP__'.strip, Regexp::EXTENDED)
      (?<element> \g<stag> \g<content>* \g<etag> ){0}
      (?<stag> < \g<name> \s* > ){0}
      (?<name> [a-zA-Z_:]+ ){0}
      (?<content> [^<&]+ (\g<element> | [^<&]+)* ){0}
      (?<etag> </ \k<name+1> >){0}
      \g<element>
      __REGEXP__

      p r.match('<foo>f<bar>bbb</bar>f</foo>').captures

9\. Subexp call ("Tanaka Akira special")

  \g<name>    call by group name
  \g'name'    call by group name
  \g<n>       call by group number (n >= 1)
  \g'n'       call by group number (n >= 1)

  * left-most recursive call is not allowed.
     ex. (?<name>a|\g<name>b)   => error
         (?<name>a|b\g<name>c)  => OK

  * Call by group number is forbidden if named group is defined in the pattern
    and ONIG_OPTION_CAPTURE_GROUP is not setted.

  * If the option status of called group is different from calling position
    then the group's option is effective.

    ex. (?-i:\g<name>)(?i:(?<name>a)){0}  match to "A"

10\. Captured group

  Behavior of the no-named group (...) changes with the following conditions.
  (But named group is not changed.)

  case 1\. /.../     (named group is not used, no option)

     (...) is treated as a captured group.

  case 2\. /.../g    (named group is not used, 'g' option)

     (...) is treated as a no-captured group (?:...).

  case 3\. /..(?<name>..)../   (named group is used, no option)

     (...) is treated as a no-captured group (?:...).
     numbered-backref/call is not allowed.

  case 4\. /..(?<name>..)../G  (named group is used, 'G' option)

     (...) is treated as a captured group.
     numbered-backref/call is allowed.

  where
    g: ONIG_OPTION_DONT_CAPTURE_GROUP
    G: ONIG_OPTION_CAPTURE_GROUP

  ('g' and 'G' options are argued in ruby-dev ML)

-----------------------------
A-1\. Syntax depend options

   + ONIG_SYNTAX_RUBY
     (?m): dot(.) match newline

   + ONIG_SYNTAX_PERL and ONIG_SYNTAX_JAVA
     (?s): dot(.) match newline
     (?m): ^ match after newline, $ match before newline

A-2\. Original extensions

   + hexadecimal digit char type  \h, \H
   + named group                  (?<name>...), (?'name'...)
   + named backref                \k<name>
   + subexp call                  \g<name>, \g<group-num>

A-3\. Lacked features compare with perl 5.8.0

   + \N{name}
   + \l,\u,\L,\U, \X, \C
   + (?{code})
   + (??{code})
   + (?(condition)yes-pat|no-pat)

   * \Q...\E
     This is effective on ONIG_SYNTAX_PERL and ONIG_SYNTAX_JAVA.

A-4\. Differences with Japanized GNU regex(version 0.12) of Ruby 1.8

   + add character property (\p{property}, \P{property})
   + add hexadecimal digit char type (\h, \H)
   + add look-behind
     (?<=fixed-char-length-pattern), (?<!fixed-char-length-pattern)
   + add possessive quantifier. ?+, *+, ++
   + add operations in character class. [], &&
     ('[' must be escaped as an usual char in character class.)
   + add named group and subexp call.
   + octal or hexadecimal number sequence can be treated as
     a multibyte code char in character class if multibyte encoding
     is specified.
     (ex. [\xa1\xa2], [\xa1\xa7-\xa4\xa1])
   + allow the range of single byte char and multibyte char in character
     class.
     ex. /[a-<<any EUC-JP character>>]/ in EUC-JP encoding.
   + effect range of isolated option is to next ')'.
     ex. (?:(?i)a|b) is interpreted as (?:(?i:a|b)), not (?:(?i:a)|b).
   + isolated option is not transparent to previous pattern.
     ex. a(?i)* is a syntax error pattern.
   + allowed incompleted left brace as an usual string.
     ex. /{/, /({)/, /a{2,3/ etc...
   + negative POSIX bracket [:^xxxx:] is supported.
   + POSIX bracket [:ascii:] is added.
   + repeat of look-ahead is not allowed.
     ex. /(?=a)*/, /(?!b){5}/
   + Ignore case option is effective to numbered character.
     ex. /\x61/i =~ "A"
   + In the range quantifier, the number of the minimum is omissible.
     /a{,n}/ == /a{0,n}/
     The simultanious abbreviation of the number of times of the minimum
     and the maximum is not allowed. (/a{,}/)
   + /a{n}?/ is not a non-greedy operator.
     /a{n}?/ == /(?:a{n})?/
   + invalid back reference is checked and cause error.
     /\1/, /(a)\2/
   + Zero-length match in infinite repeat stops the repeat,
     then changes of the capture group status are checked as stop condition.
     /(?:()|())*\1\2/ =~ ""
     /(?:\1a|())*/ =~ "a"

A-5\. Disabled functions by default syntax

   + capture history

     (?@...) and (?@<name>...)

     ex. /(?@a)*/.match("aaa") ==> [<0-1>, <1-2>, <2-3>]

     see sample/listcap.c file.

A-6\. Problems

   + Invalid encoding byte sequence is not checked in UTF-8.

     * Invalid first byte is treated as a character.
       /./u =~ "\xa3"

     * Incomplete byte sequence is not checked.
       /\w+/ =~ "a\xf3\x8ec"

// END</code>
```

Replacement String Syntax (Format Strings)
------------------------------------------

When you perform a regular expression replace, the replace string is interpreted as a format string which can reference captures, perform case foldings, do conditional insertions (based on capture registers) and support a minimal amount of escape sequences.

### Captures

To reference a capture, use `$n` where `n` is the capture register number. Using `$0` means the entire match.

Example:

```
 <code>Find: <img src="(.*?)">
Replace: <img src="$1" alt="$1"></code>
```

### Case Foldings

It is possible to convert the next character to upper or lowercase by prepending it with `\u` or `\l`. This is mainly useful when the next character stems from a capture register. Example:

```
 <code>Find: (<a.*?>)(.*?)(</a>)
Replace: $1\u$2$3</code>
```

You can also convert a longer sequence to upper or lowercase by using `\U` or `\L` and then `\E` to disable the case folding again. Example:

```
 <code>Find: (<a.*?>)(.*?)(</a>)
Replace: $1\U$2\E$3</code>
```

### Conditional Insertions

There are times where the replacements depends on whether or not something was matched. This can be done using `(?«n»:«insertion»)` to insert `«insertion»` if capture `«n»` was matched. You can also use `(?«n»:«insertion»:«otherwise»)` to have `«otherwise»` inserted when capture `«n»` was not matched.

To make a capture conditional either place it in an alternation, e.g. `foo|(bar)|fud` or append a question mark to it: `(bar)?`. Note that `(.*)` will result in a match, even when zero characters are matched, so use `(.+)?` instead.

So for example if we wish to truncate text to eight words and insert ellipsis only if there were more than eight words, we can use:

```
 <code>Find: (\w+(?:\W+\w+){,7})\W*(.+)?
Replace: $1(?2:...)</code>
```

Here we first match a word (`\w+`) followed by up to seven words (`(?:\W+\w+){,7}`) each preceded by non-word characters (spacing). Then optionally put anything following that (separated by non-word characters) into capture register 2 (`(.+)?`).

The replacement first inserts the (up to) eight words matched (`$1`) and then only if capture 2 matched something, ellipsis (`(?2:...)`).

### Escape Codes

In addition to the case folding escape codes, you can insert a newline character with `\n`, a tab character with `\t` and a dollar sign with `\<main.

[Saving Files](https://macromates.com/manual/en/saving_files)[Table of Contents](.)[Calling TextMate from Other Applications](https://macromates.com/manual/en/using_textmate_from_terminal)