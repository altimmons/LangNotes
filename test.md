# This is a test

# Markdown Syntax and Shortcuts

# Table of Contents

`[[TOC]]`

[[TOC]]

## Bold Italic Underline

**Bold** -> `**Bold**`

_Italic_ -> `*Italic*`

_Underline_ -> `_Underline_`

Make a quote of a statement with `>`. See also [Admonitions](#Admonitions)

> This is a quote

A bullet list:

- first -> `- first`
- second -> `- second`
- third -> `- third`

Note the space. The hyphen MUST be a col 0. To add a level add **2** spaces.

## Code Spell Checker

All settings are prefixed with cSpell: or spell-checker:.

- `disable` -- turn off the spell checker for a section of code.
- `enable` -- turn the spell checker back on after it has been turned off.
- `ignore` -- specify a list of words to be ignored.
- `words` -- specify a list of words to be considered correct and will appear in the suggestions list.
- `ignoreRegExp` -- Any text matching the regular expression will NOT be checked for spelling.
- `includeRegExp` -- Only text matching the collection of includeRegExp will be checked.
- `enableCompoundWords` / `disableCompoundWords` -- Allow / disallow words like: "stringlength".

### Enable / Disable checking sections of code

It is possible to disable / enable the spell checker by adding comments to your code.

#### Disable Checking

- `/* cSpell:disable */`
- `/* spell-checker: disable */`
- `/* spellchecker: disable */`

#### Enable Checking

- `/* cSpell:enable */`
- `/* spell-checker: enable */`
- `/* spellchecker: enable */`

#### Example

```java
// cSpell:disable
const wackyWord = ['zaallano', 'wooorrdd', 'zzooommmmmmmm'];
/* cSpell:enable */

// Nest disable / enable is not Supported

// spell-checker:disable
// It is now disabled.

var liep = 1;

/* cspell:disable */
// It is still disabled

// cSpell:enable
// It is now enabled

const str = "goededag";  // <- will be flagged as an error.

// spell-checker:enable <- doesn't do anything

// cSPELL:DISABLE <-- also works.

// if there isn't an enable, spelling is disabled till the end of the file.
const str = "goedemorgen";  // <- will NOT be flagged as an error.
```

### Ignore

Ignore allows you the specify a list of words you want to ignore within the document.

```java
// cSpell:ignore zaallano, wooorrdd
// cSpell:ignore zzooommmmmmmm
const wackyWord = ['zaallano', 'wooorrdd', 'zzooommmmmmmm'];
```

!!!Note Note: words defined with ignore will be ignored for the entire file.

### Words

The words list allows you to add words that will be considered correct and will be used as suggestions.

```java
// cSpell:words woorxs sweeetbeat
const companyName = 'woorxs sweeetbeat';
```

!!!Note Note: words defined with words will be used for the entire file.

### Enable / Disable compound words

In some programing language it is common to glue words together.

```java
// cSpell:enableCompoundWords
char * errormessage;  // Is ok with cSpell:enableCompoundWords
int    errornumber;   // Is also ok.
```

!!!Note: Note: Compound word checking cannot be turned on / off in the same file. The last setting in the file determines the value for the entire file.

### Excluding and Including Text to be checked.

By default, the entire document is checked for spelling. cSpell:disable/cSpell:enable above allows you to block off sections of the document. ignoreRegExp and includeRegExp give you the ability to ignore or include patterns of text. By default the flags gim are added if no flags are given.

The spell checker works in the following way:

Find all text matching includeRegExp
Remove any text matching excludeRegExp
Check the remaining text.

#### Exclude Example

```java
// cSpell:ignoreRegExp 0x[0-9a-f]+     -- will ignore c style hex numbers
// cSpell:ignoreRegExp /0x[0-9A-F]+/g  -- will ignore upper case c style hex numbers.
// cSpell:ignoreRegExp g{5} h{5}       -- will only match ggggg, but not hhhhh or 'ggggg hhhhh'
// cSpell:ignoreRegExp g{5}|h{5}       -- will match both ggggg and hhhhh
// cSpell:ignoreRegExp /g{5} h{5}/     -- will match 'ggggg hhhhh'
/* cSpell:ignoreRegExp /n{5}/          -- will NOT work as expected because of the ending comment -> */
/*
   cSpell:ignoreRegExp /q{5}/          -- will match qqqqq just fine but NOT QQQQQ
*/
// cSpell:ignoreRegExp /[^\s]{40,}/    -- will ignore long strings with no spaces.
// cSpell:ignoreRegExp Email           -- this will ignore email like patterns -- see Predefined RegExp expressions
var encodedImage = 'HR+cPzr7XGAOJNurPL0G8I2kU0UhKcqFssoKvFTR7z0T3VJfK37vS025uKroHfJ9nA6WWbHZ/ASn...';
var email1 = 'emailaddress@myfancynewcompany.com';
var email2 = '<emailaddress@myfancynewcompany.com>';
```

!!!note Note: ignoreRegExp and includeRegExp are applied to the entire file. They do not start and stop.

#### Include Example

In general you should not need to use includeRegExp. But if you are mixing languages then it could come in helpful.

```python
# cSpell:includeRegExp #.*
# cSpell:includeRegExp ("""|''')[^\1]*\1
# only comments and block strings will be checked for spelling.
def sum_it(self, seq):
    """This is checked for spelling"""
    variabele = 0
    alinea = 'this is not checked'
    for num in seq:
        # The local state of 'value' will be retained between iterations
        variabele += num
        yield variabele
```

### Predefined RegExp expressions

#### Exclude patterns

- `Urls1` -- Matches urls
- `HexDigits` -- Matches hex digits: /^x?[0-1a-f]+\$/i
- `HexValues` -- Matches common hex format like #aaa, 0xfeef, \u0134
- `EscapeCharacters1` -- matches special characters: '\n', '\t' etc.
- `Base641` -- matches base64 blocks of text longer than 40 characters.
- `Email` -- matches most email addresses.

#### Include Patterns

- `Everything1` -- By default we match an entire document and remove the excludes.
- `string` -- This matches common string formats like '...', "...", and `...`
- `CStyleComment` -- These are C Style comments /\* \*/ and //
- `PhpHereDoc` -- This matches PHPHereDoc strings.

These patterns are part of the default include/exclude list for every file.

### Customization

#### Adding words to the Workspace Dictionary

You have the option to add you own words to the workspace dictionary. The easiest, is to put your cursor on the word you wish to add, when you lightbulb shows up, hit Ctrl+. (windows) / Cmd+. (Mac). You will get a list of suggestions and the option to add the word.

You can also type in a word you want to add to the dictionary: F1 add word -- select Add Word to Dictionary and type in the word you wish to add.

Settings are saved in **cSpell.json**

Words added to the dictionary are placed in the `cSpell.json` file in the .vscode folder found in the workspace. Note, the settings in `cSpell.json` will override the equivalent cSpell settings in `settings.json`.

Example `cSpell.json` file

```json
// cSpell Settings
{
  // Version of the setting file.  Always 0.1
  "version": "0.1",
  // language - current active spelling language
  "language": "en",
  // words - list of words to be always considered correct
  "words": [
    "mkdirp",
    "tsmerge",
    "githubusercontent",
    "streetsidesoftware",
    "vsmarketplacebadge",
    "visualstudio"
  ],
  // flagWords - list of words to be always considered incorrect
  // This is useful for offensive words and common spelling errors.
  // For example "hte" should be "the"
  "flagWords": ["hte"]
}
```

### Configuration Settings

```json
    //-------- Code Spell Checker Configuration --------
    // The Language local to use when spell checking. "en" and "en-GB" are currently supported.
    "cSpell.language": "en",

    // Controls the maximum number of spelling errors per document.
    "cSpell.maxNumberOfProblems": 100,

    // Controls the number of suggestions shown.
    "cSpell.numSuggestions": 8,

    // The minimum length of a word before checking it against a dictionary.
    "cSpell.minWordLength": 4,

    // Specify file types to spell check.
    "cSpell.enabledLanguageIds": [
        "csharp",
        "go",
        "javascript",
        "javascriptreact",
        "markdown",
        "php",
        "plaintext",
        "text",
        "typescript",
        "typescriptreact",
        "yml"
    ],

    // Enable / Disable the spell checker.
    "cSpell.enabled": true,

    // Display the spell checker status on the status bar.
    "cSpell.showStatus": true,

    // Words to add to dictionary for a workspace.
    "cSpell.words": [],

    // Enable / Disable compound words like 'errormessage'
    "cSpell.allowCompoundWords": false,

    // Words to be ignored and not suggested.
    "cSpell.ignoreWords": ["behaviour"],

    // User words to add to dictionary.  Should only be in the user settings.
    "cSpell.userWords": [],

    // Specify paths/files to ignore.
    "cSpell.ignorePaths": [
        "node_modules",        // this will ignore anything the node_modules directory
        "**/node_modules",     // the same for this one
        "**/node_modules/**",  // the same for this one
        "node_modules/**",     // Doesn't currently work due to how the current working directory is determined.
        "vscode-extension",    //
        ".git",                // Ignore the .git directory
        "*.dll",               // Ignore all .dll files.
        "**/*.dll"             // Ignore all .dll files
    ],

    // flagWords - list of words to be always considered incorrect
    // This is useful for offensive words and common spelling errors.
    // For example "hte" should be "the"`
    "cSpell.flagWords": ["hte"],

    // Set the delay before spell checking the document. Default is 50.
    "cSpell.spellCheckDelayMs": 50,
```

### Dictionaries

The spell checker includes a set of default dictionaries.

#### General Dictionaries

- `wordsEn` - Derived from Hunspell US English words.
- `wordsEnGb` - Derived from Hunspell GB English words.
- `companies` - List of well known companies
- `softwareTerms` - Software Terms and concepts like "coroutine", "debounce", "tree", etc.
- `misc` - Terms that do not belong in the other dictionaries.

#### Programming Language Dictionaries

- `typescript` - keywords for Typescript and Javascript
- `node` - terms related to using nodejs.
- `php` - php keywords and library methods
- `go` - go keywords and library methods
- `python` - python keywords
- `powershell` - powershell keywords
- `html` - html related keywords
- `css` - css, less, and scss related keywords

#### Miscellaneous Dictionaries

`fonts` - long list of fonts - to assist with css

Based upon the programming language, different dictionaries will be loaded.

Here are the default rules: "*" matches any language. "local" is used to filter based upon the

#### "cSpell.language" setting

```json
{
"cSpell.languageSettings": [
    { "languageId": '*',      "local": 'en',               "dictionaries": ['wordsEn'] },
    { "languageId": '*',      "local": 'en-US',            "dictionaries": ['wordsEn'] },
    { "languageId": '*',      "local": 'en-GB',            "dictionaries": ['wordsEnGb'] },
    { "languageId": '*',                                   "dictionaries": ['companies', 'softwareTerms', 'misc'] },
    { "languageId": "python", "allowCompoundWords": true,  "dictionaries": ["python"]},
    { "languageId": "go",     "allowCompoundWords": true,  "dictionaries": ["go"] },
    { "languageId": "javascript",                          "dictionaries": ["typescript", "node"] },
    { "languageId": "javascriptreact",                     "dictionaries": ["typescript", "node"] },
    { "languageId": "typescript",                          "dictionaries": ["typescript", "node"] },
    { "languageId": "typescriptreact",                     "dictionaries": ["typescript", "node"] },
    { "languageId": "html",                                "dictionaries": ["html", "fonts", "typescript", "css"] },
    { "languageId": "php",                                 "dictionaries": ["php", "html", "fonts", "css", "typescript"] },
    { "languageId": "css",                                 "dictionaries": ["fonts", "css"] },
    { "languageId": "less",                                "dictionaries": ["fonts", "css"] },
    { "languageId": "scss",                                "dictionaries": ["fonts", "css"] },
];
}
```

### How to add your own Dictionaries

#### Global Dictionary

To add a global dictionary, you will need change your user settings.

##### Define the Dictionary

In your user settings, you will need to tell the spell checker where to find your word list.

Example adding medical terms, so words like acanthopterygious can be found.

```json
// A List of Dictionary Definitions.
"cSpell.dictionaryDefinitions": [
    { "name": "medicalTerms", "path": "/Users/guest/projects/cSpell-WordLists/dictionaries/medicalterms-en.txt"}
],
// List of dictionaries to use when checking files.
"cSpell.dictionaries": [
    "medicalTerms"
]
```

**Explained:** In this example, we have told the spell checker where to find the word list file. Since it is in the user settings, we have to use absolute paths.

Once the dictionary is defined. We need to tell the spell checker when to use it. Adding it to cSpell.dictionaries advises the spell checker to always include the medical terms when spell checking.

Note: Adding large dictionary files to be always used will slow down the generation of suggestions.

#### Project / Workspace Dictionary

To add a dictionary at the project level, it needs to be in the cSpell.json file. This file can be either at the project root or in the .vscode directory.

Example adding medical terms, where the terms are checked into the project and we only want to use it for .md files.

```json
{
    "dictionaryDefinitions": [
        { "name": "medicalTerms", "path": "./dictionaries/medicalterms-en.txt"},
        { "name": "cities", "path": "./dictionaries/cities.txt"}
    ],
    "dictionaries": [
        "cities"
    ],
    "languageSettings": [
        { "languageId": "markdown", "dictionaries": ["medicalTerms"] },
        { "languageId": "plaintext", "dictionaries": ["medicalTerms"] }
    ]
}
```


**Explained:** In this example, two dictionaries were defined: cities and medicalTerms. The paths are relative to the location of the cSpell.json file. This allows for dictionaries to be checked into the project.

markdown-it-footnote


markdown-it-abbr

_[HTML]: Hyper Text Markup Language

_[W3C]: World Wide Web Consortium
The HTML specification
is maintained by the W3C.
The HTML specification is maintained by the W3C.
