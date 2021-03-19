
# Markdown Syntax and Shortcuts

@import "D:/ASUSsync/helper/markdown-it-admonition.css"
<link rel="stylesheet" href= "D:/ASUSsync/helper/markdown-it-admonition.css">
@import "D:/ASUSsync/helper/markdown-it-kbd.css"

## Most commonly looked up items

!!!note Admonitions:

    note |/
    summary, abstract, tldr |
    info, todo |
    tip, hint |
    success, check, done |
    question, help, faq |
    warning, attention, caution |
    failure, fail, missing |
    danger, error, bug |
    example, snippet |
    quote, cite

## Table of Contents

[[TOC]]

yzhang.markdown-all-in-one need autocorrection
Markdown Navigate
jrieken.md-navigate
MarkDown Link Suggestions
tomashubelbauer.vscode-markdown-link-suggestions

Markdown Header Coloring
satokaz.vscode-markdown-header-coloring
Markdown Preview Enhanced
shd101wyy.markdown-preview-enhanced
my own shortcuts
Bracket coloring pairs
Settings to over-ride textmate coloring

Docs Authoring Pack
docsmsft.docs-authoring-pack

vscode-remark-lint
drewbourne.vscode-remark-lint
Features
Use Unified, Remark, and Retext plugins to lint Markdown.

Plugins are available to:

Check spelling
Check readability
Avoid repeated words
Avoid profanity
Avoid passive words / phrases
Recommendations
Use Prettier and the Prettier VS Code extension for format Markdown.]

MDTasks
nobuhito.mdtasks

evilz.vscode-reveal
evilz26,948RepositoryLicense
Show markdown as revealJs presentation

Pandoc Citer
notzaki.pandocciter
notZaki4,163RepositoryLicense
Autocomplete bibtex citations for markdown/pandoc
Citations
Marp for VS Code
marp-team.marp-vscode
Marp team3,974RepositoryLicense
Create slide deck written in Marp Markdown on VS Code

MarkdownDox
penseleit.markdowndox
Peter Enseleit73RepositoryLicense
A simple documentation tool for Visual Studio Code

Looks promising

!!! Note Code SYntax

Markdown Preview Prism Highlighting
bierner.markdown-prism
Matt Bierner162RepositoryLicense
Uses Prism for VS Code's built-in markdown preview syntax highlighting


Example of injecting other things into markdown

Markdown Extension Pack
jebbs.markdown-extension-pack
jebbs357Repository
Markdown All-In-One, from editing to exporting, features & helpers collection.

Markdown Nomnoml Support
amoosbr.markdown-nomnoml
Alexander Moosbrugger960RepositoryLicense
Adds nomnoml support to VS Code's builtin markdown preview
Installed
Uninstall

Requirements

`[[TOC]]` example.

[[TOC]]

[[def]] *[TOC]: Table of contents

This is a TOC example


## Cold Folding Commands

C#: `#region` and `#endregion`
C/C++: `#pragma region` and `#pragma endregion`
CSS/Less/SCSS: `/*#region*/` and `/*#endregion*/`
Coffeescript: `#region` and `#endregion`
F#: `//#region` and `//#endregion` and `(#_region)` and `(#_endregion)`
Java: `//#region` and /`/ #endregion` and `//<editor-fold>` and `//</editor-fold>`
HTML:
PHP: `#region` and `#endregion`
Powershell: `#region` and `#endregion`
Python: `#region` and `#endregion`
TypeScript/JavaScript: `//#region` and `//#endregion` and `//region` and `//endregion`
VB: `#Region` and `#End Region`
Bat: `::#region` and `::#endregion`
Markdown: `<!-- #region -->` and `<!-- #endregion -->`

## Current Setup:

!!!check  **Markdown Extended**
    *jebbs.markdown-extended*

!!!check **Markdown All in One**
    *yzhang.markdown-all-in-one*

**Markdown Header Coloring**
    *satokaz.vscode-markdown-header-colorin*

    Adds:
    - Keyboard Shortcuts
    - Checkbox
    - TOC
    - Lists
    - Print to HTML
    - Github Theme
    - Table Formatting
      - [[Alt]] [[Shift]] [[L]] Windows
      - [[Ctrl]] [[Shift]] [[I]] Linux
    - Math
    - Images `![imagename](Url)`
    - AutoComplete
    - Paste Link on Text
    - "Toggle Preview"
      - [[Ctrl]] + [[Shift]] + [[V]] or [[Ctrl]] + [[K]] [[V]]).

Key - Command
[[Ctrl]] + [[B]] - Toggle bold
[[Ctrl]] + [[I]] - Toggle italic
[[`Ctrl`]] + [[`Shift`]] + [[`]`]] - Toggle heading (uplevel)
Ctrl + Shift + [ - Toggle heading (downlevel)
Ctrl + M - Toggle math environment
Alt + C - Check/Uncheck task list item
Ctrl + Shift + V - Toggle preview
Ctrl + K V - Toggle preview to side


## Bold Italic Underline

**Bold** -> `**Bold**`

_Italic_ -> `*Italic*`

_Underline_ -> `_Underline_`

Make a quote of a statement with `>`. See also [Admonitions](##Admonitions)

> This is a quote

A bullet list:

- first -> `- first`
- second -> `- second`
- third -> `- third`

Note the space. The hyphen MUST be a col 0. To add a level add **2** spaces.

## Random Notes

This code `<iframe></iframe>` creates a box like this: Maybe something could be done with it.

<iframe></iframe>

A backslash lets you put two lines in close proximity
without the line in between.

Example:\
A backslash lets you put two lines in close proximity
without the line in between.

Example
A backslash lets you put two lines in close proximity
without the line in between.

## Setup

### Keyboard Shortcuts

```json
 {
        "key": "ctrl+m ctrl+l",
        "command": "md-shortcut.toggleLink",
        "when": "editorTextFocus && markdownShortcuts:enabled"
    },

    {
        "key": "ctrl+m ctrl+o",
        "command": "markdownExtended.toggleOList",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+i",
        "command": "md-shortcut.toggleImage",
        "when": "editorTextFocus && markdownShortcuts:enabled"
    },
    {
        "key": "ctrl+m ctrl+u",
        "command": "markdownExtended.toggleUList",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+a",
        "command": "editor.action.selectHighlights",
        "when": "editorFocus"
    },
    {
        "key": "ctrl+m ctrl+-",
        "command": "markdownExtended.toggleSubscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+m ctrl+=",
        "command": "markdownExtended.toggleSuperscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
//end used ones
        {
        "key": "ctrl+l",
        "command": "-md-shortcut.toggleLink",
        "when": "editorTextFocus && markdownShortcuts:enabled"
    },
        {
        "key": "ctrl+l ctrl+o",
        "command": "-markdownExtended.toggleOList",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+l",
        "command": "-markdownExtended.toggleSubscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+u",
        "command": "-markdownExtended.toggleSuperscript",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
    {
        "key": "ctrl+shift+l",
        "command": "-editor.action.selectHighlights",
        "when": "editorFocus"
    },
      {
            "key": "ctrl+l ctrl+u",
        "command": "-markdownExtended.toggleUList",
        "when": "editorTextFocus && editorLangId == 'markdown'"
    },
        {
        "key": "ctrl+shift+l",
        "command": "-md-shortcut.toggleImage",
        "when": "editorTextFocus && markdownShortcuts:enabled"
    }
```


## Markdown Preview Enhanced

[Main Doc](https://shd101wyy.github.io/markdown-preview-enhanced/#/)

!!!warning Not this version Markdown Preview Enhanced jasonroger.markdown-preview-enhanced-fork
but this version:

/page
b
Features
- Automatic scroll sync
- [Import external files](#Import-External-Files)
- Code Chunk
- Pandoc
- Prince
- eBook
- Presentation Writer
- Extensible
- LaTeX math
- Export PDF, PNG, and JPEG by [PhantomJS](https://shd101wyy.github.io/markdown-preview-enhanced/#/phantomjs)
- Export PDF, PNG, and JPEG by [Puppeteer](https://shd101wyy.github.io/markdown-preview-enhanced/#/puppeteer)
- Export beautiful HTML (mobile device supported)
- Compile to GitHub Flavored Markdown
- [Customize Preview CSS](#Customize-CSS)
- TOC generation
- Flowchart / Sequence diagram and many other kinds of graphs
- Embed LaTeX, render TikZ, Chemfig etc
- Task List (Github Flavored)
- Image Helper
- Footnotes
- Front Matter


### Code Chunk
You can set class for your code blocks.

For example, to add class1 class2 to a code block

```javascript {.class1 .class}
function add(x, y) {
  return x + y
}
```
line-numbers
You can enable line number for a code block by adding line-numbers class.

For example:

```javascript {.line-numbers}
function add(x, y) {
  return x + y
}
```

highlighting rows
You can highlight rows by add highlight attribute:

                ```javascript {highlight=10}
                ```

                ```javascript {highlight=10-20}
                ```

                ```javascript {highlight=[1-10,15,20-22]}

```javascript {highlight=10}
see below
see below
see below
see below
see below
see below
see below
see below
see below
see below
```

```javascript {highlight=10-20}
```



### Slide Mode

[Example](https://rawgit.com/shd101wyy/markdown-preview-enhanced/master/docs/presentation-intro.html)

### Customize CSS

[Customize CSS](https://shd101wyy.github.io/markdown-preview-enhanced/#/customize-css)

**style.less**

To customize css for your markdown file, cmd-shift-p then run Markdown Preview Enhanced: Customize Css command.

The style.less file will open, and you can override existing style like this:

`style.less` file is located at `~/.mume/style.less`

```less {highlight=[1-10,15,20-22]}
//```less {highlight=[1-10,15,20-22]}
.markdown-preview.markdown-preview {
  // please write your custom style here
  // eg:
  //  color: blue;          // change font color
  //  font-size: 14px;      // change font size
  // custom pdf output style
  @media print {
  }

  // custom prince pdf export style
  &.prince {
  }

  // custom phantomjs png/jpeg export style
  &.phantomjs-image {
  }

  //custom phantomjs pdf export style
  &.phantomjs-pdf {
  }

  // custom presentation style
  .reveal .slides {
    // modify all slides
  }

  .slides > section:nth-child(1) {
    // this will modify `the first slide`
  }
}

.md-sidebar-toc.md-sidebar-toc {
  // sidebar TOC style
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

### Import external files

[Source Doc](https://shd101wyy.github.io/markdown-preview-enhanced/#/file-imports)

!!!note In example he used *.png, *.csv, *.js and *.md
doc-imports

just

`@import "your_file"`

easy, right :)

`<!-- @import "your_file" -->` is also valid.

#### Refresh button

Refresh button is now added at the right corner of preview.
Clicking it will clear file caches and refresh the preview.
It could be useful if you want to clear image cache.

#### Supported file types
- .jpeg(.jpg), .gif, .png, .apng, .svg, .bmp file will be treated as markdown image.
- .csv file will be converted to markdown table.
- .mermaid file will be rendered by mermaid.
- .dot file will be rendered by viz.js (graphviz).
- .plantuml(.puml) file will be rendered by PlantUML.
- .html file will be embedded directly.
- .js file will be included as <script src="your_js"></script>.
- .less and .css file will be included as style. Only local less file is currently supported. .css file will be included as <link rel="stylesheet" href="your_css">.
- .pdf file will be converted to svg files by pdf2svg and then be included.
- markdown file will be parsed and embedded directly.
- All other files will be rendered as code block.

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

#### Configure images

@import "test.png" {width="300px" height="200px" title="my title" alt="my alt"}
Import online files
For example:

@import "https://raw.githubusercontent.com/shd101wyy/markdown-preview-enhanced/master/LICENSE.md"
Import PDF file
To import PDF file, you need to have pdf2svg installed.
Markdown Preview Enhanced supports importing both local and online PDF files.
However, it is not recommended to import large PDF files.
For example:

@import "test.pdf"
PDF configuration
page_no
Display the nth page of PDF. 1-based indexing. For example {page_no=1} will display the 1st page of pdf.
page_begin, page_end
Inclusive. For example {page_begin=2 page_end=4} will display the number 2, 3, 4 pages.
Force to render as Code Block
@import "test.puml" {code_block=true class="line-numbers"}
@import "test.py" {class="line-numbers"}
As Code Block
@import "test.json" {as="vega-lite"}
Import file as Code Chunk
@import "test.py" {cmd="python3"}
## Markdown All in One
    *yzhang.markdown-all-in-one*

    Adds:
    - Keyboard Shortcuts
    - Checkbox
    - TOC
    - Lists
    - Print to HTML
    - Github Theme
    - Table Formatting
      - [[Alt]] [[Shift]] [[L]] Windows
      - [[Ctrl]] [[Shift]] [[I]] Linux
    - Math
    - Images `![imagename](Url)`
    - AutoComplete
    - Paste Link on Text
    - "Toggle Preview"
      - [[Ctrl]] + [[Shift]] + [[V]] or [[Ctrl]] + [[K]] [[V]]).

Key - Command
[[Ctrl]] + [[B]] - Toggle bold
[[Ctrl]] + [[I]] - Toggle italic
[[`Ctrl`]] + [[`Shift`]] + [[`]`]] - Toggle heading (uplevel)
Ctrl + Shift + [ - Toggle heading (downlevel)
Ctrl + M - Toggle math environment
Alt + C - Check/Uncheck task list item
Ctrl + Shift + V - Toggle preview
Ctrl + K V - Toggle preview to side

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

## Markdown Extended

Markdown Extended is an extension extends syntaxes and abilities to VSCode built-in markdown function.

Markdown Extended includes lots of editing helpers and a what you see is what you get exporter, which means export files are consistent to what you see in markdown preview, even it contains syntaxes and styles contributed by other plugins.

Features:

- Extended Language Features (View Detail):
- Admonition (built-in), View Document
- Enhanced Anchor Link (built-in), View Document
- markdown-it-table-of-contents
- markdown-it-footnote
- markdown-it-abbr
- markdown-it-deflist
- markdown-it-sup
- markdown-it-sub
- markdown-it-checkbox
- markdown-it-attrs
- markdown-it-kbd
- markdown-it-underline

### Exporter

Export to Self Contained HTML / PDF / PNG / JPEG
Export current document / workspace
Copy exported HTML to clipboard

Find in command palette, or right click on an editor / workspace folder, and execute:

`Markdown: Export to File`
`Markdown: Export Markdown to File`

The export files are organized in out directory in the root of workspace folder by default.

#### Export Configurations

You can configure exporting for multiple documents with user settings.

Further, you can add per-file settings inside markdown to override user settings, it has the highest priority:

```md
---
puppeteer:
    pdf:
        format: A4
        displayHeaderFooter: true
        margin:
            top: 1cm
            right: 1cm
            bottom: 1cm
            left: 1cm
    image:
        quality: 90
        fullPage: true
---
"contents goes here..."
```

See all available settings for [puppeteer.pdf](https://github.com/GoogleChrome/puppeteer/blob/v1.4.0/docs/api.md#pagepdfoptions), and [puppeteer.image](https://github.com/GoogleChrome/puppeteer/blob/v1.4.0/docs/api.md#pagescreenshotoptions)

### Editing Helpers (View Detail):

Paste, format table
.
Add, delete and move table columns & rows.

Toggle various formates, eg.: bold, italics, underline, strikethrough, code inline, code block, block quote, superscript, subscript, unordered list, ordered list.

| Command                       | Keyboard Shortcut          |
| ----------------------------- | -------------------------- |
| Format: Toggle Bold           | Ctrl+B                     |
| Format: Toggle Italics        | Ctrl+I                     |
| Format: Toggle Underline      | Ctrl+U                     |
| Format: Toggle Strikethrough  | Alt+S                      |
| Format: Toggle Code Inline    | Alt+`                      |
| Format: Toggle Code Block     | Alt+Shift+`                |
| Format: Toggle Block Quote    | Ctrl+Shift+Q               |
| Format: Toggle Superscript    | Ctrl+Shift+U               |
| Format: Toggle Subscript      | Ctrl+Shift+L               |
| Format: Toggle Unordered List | Ctrl+L, Ctrl+U             |
| Format: Toggle Ordered List   | Ctrl+L, Ctrl+O             |
| Table: Paste as Table         | Ctrl+Shift+T, Ctrl+Shift+P |
| Table: Format Table           | Ctrl+Shift+T, Ctrl+Shift+F |
| Table: Add Columns to Left    | Ctrl+Shift+T, Ctrl+Shift+L |
| Table: Add Columns to Right   | Ctrl+Shift+T, Ctrl+Shift+R |
| Table: Add Rows Above         | Ctrl+Shift+T, Ctrl+Shift+A |
| Table: Add Row Below          | Ctrl+Shift+T, Ctrl+Shift+B |
| Table: Delete Rows            | Ctrl+Shift+D, Ctrl+Shift+R |
| Table: Delete Columns         | Ctrl+Shift+D, Ctrl+Shift+C |
| Table: Move Columns Left      | alt+←                     |
| Table: Move Columns Right     | alt+→                     |



Helpers
- Table Editing
tableEdit
moveCols

#### Paste as Markdown Table

Copy a table from Excel, Web and other applications which support the format of Comma-Separated Values (CSV), then run the command `Paste as Markdown Table`, you will get the markdown table.

### Extended Syntaxes

#### Admonition
Inspired by MkDocs

Nesting supported (by indent) admonition, the following shows a danger admonition nested by a note admonition.

!!! note

    This is the **note** admonition body

    !!! danger Danger Title
        This is the **danger** admonition body
admonition-demo

Removing Admonition Title

!!! danger ""
    This is the danger admonition body

admonition-demo

Supported Qualifiers

- note
- summary, abstract, tldr
- info, todo
- tip, hint
- success, check, done
- question, help, faq
- warning, attention, caution
- failure, fail, missing
- danger, error, bug
- example, snippet
- quote, cite

!!!Note Syntax: `!!!note` Or using any of the words below. The displayed word is replaced by the first word.
    To make it stay showing note, you have to say it twice. e.g. `!!!Note Note`

        To make a sub heading it over.  It looks like two tabs creates a code block

##### Examples

!!!note
!!!summary
!!!abstract
!!!tldr
!!!info
!!!todo
!!!tip
!!!hint
!!!success
!!!check
!!!done
!!!question
!!!help
!!!faq
!!!warning
!!!attention
!!!caution
!!!failure
!!!fail
!!!missing
!!!danger
!!!error
!!!bug
!!!example
!!!snippet
!!!quote
!!!cite

### Internal Links (Anchors)

Enhanced Anchor Link

Now, you're able to write anchor links consistent to heading texts.

!!!Note Syntax of Anchor Links (Internal Links)-
    It is like a hyperlink `[text](url)` Where, the URL is given as `#`Name-Name, e.g.

    A single `#` regardless of level, there is no space before the name, and then spaces are replaced with hyphens.

    [This Section](#Enhanced-Anchor-Link)

        [This Section](#Enhanced-Anchor-Link)

```txt
Go to
[简体中文](#简体中文),
[Español Título](#Español-Título).

##_简体中文

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Aenean euismod bibendum laoreet.

##_Español Título

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Aenean euismod bibendum laoreet.
```

### Table of Contents

markdown-it-table-of-contents

Type  `Markdown- Create Table of Contents` in the command dialogue or just type `[[TOC]]` in the document


  - [Markdown Extended Readme](#Markdown-Extended-Readme)
    - [Features](#Features)
    - [Requirements](#Requirements)
    - [Demos](#Demos)

You can rebuild the TOC with a command- `Markdown- Update Table of Contents`

### Footnotes

markdown-it-footnote

Syntax = appears just matching terms inside `[^id]` [^1].  The definition has a colon following it,`[^id]:` The footnote reference appears to go to the end of the document, more like a citation. Helpfuly, if you wrote a paper you could id it by name.

```code
Here is a footnote reference,[^1] and another.[^longnote]

[^1]: Here is the footnote.
[^longnote]: Here's one with multiple blocks.
```
[^1]: A sample Footnote

There is a smaple footnote just above here that is not rendered.

### Abbreviations

markdown-it-abbr

Syntax is `*[Term]:` where the definition is placed anywhere and is then invisible.  It will highlight whereever the word (Case sensitive?) appears.  A mouse over shows the definition.

*[HTML]: Hyper Text Markup Language
*[W3C]:  World Wide Web Consortium

       * *[HTML]:* Hyper Text Markup Language
        *[W3C]:  World Wide Web Consortium

!!!Attention- Example: The HTML (<- mouse-over) specificationis maintained by the W3C(<- mouse-over) .


### Definitions

[markdown-it-deflist](https://www.npmjs.com/package/markdown-it-deflist)

Apple:   Pomaceous fruit of plants of the genus Malus in the family Rosaceae.

Apple
Pomaceous fruit of plants of the genus Malus in the family Rosaceae.

Apple


Syntax is based on pandoc definition lists.

Install
node.js, browser:

        npm install markdown-it-deflist --save
        bower install markdown-it-deflist --save


### Superscript, Subscript

- Superscript
  - [markdown-it-sup](https://www.npmjs.com/package/markdown-it-sub)
  - `^*^` or surrounded by carets `^`
    - `29^th^`
    - Yields- 29^th^
- Subscript
  - [markdown-it-sub](https://www.npmjs.com/package/markdown-it-sub)
  - Subscript Example:
    - `H~2~O`
    - Yields- H~2~O

!!!tldr tl;dr use `^` for super, and `~` for subscript.

### Checkboxes

[markdown-it-checkbox](https://www.npmjs.com/package/markdown-it-checkbox)

Create a checkbox with [[Ctrl]]+[[x]], [[Ctrl]]+[[m]], or type `[ ]` e.g. `[` [[Space]] `]`.

AS far as I can tell, you have to use x manually, typed in.

- [ ] unchecked
  - `[ ]` unchecked
- [x] checked
  - `[x]` checked


### Attributes

[markdown-it-attrs](https://www.npmjs.com/package/markdown-it-attrs)

item **bold red**{style="color:red"}

        item **bold red**{style="color:red"}

!!!tldr tldr after a `bold` symbol e.g. `**`...`**`, follow in braces a style `{style=` `}` with the command quoted `"color:red"`

Its unclear what commands are available.

It looks like all the [HTML Color Names](https://www.w3schools.com/colors/colors_names.asp) are available:

Also, [CSS Syntax](https://www.w3schools.com/css/css_syntax.asp) May also be relevant

- unstyled **style sample**{style="color:red"}
- unstyled **style sample**{style="color:black"}
- unstyled **style sample**{style="color:green"}
- unstyled **style sample**{style="color:cyan"}
- unstyled **style sample**{style="color:teal"}
- unstyled **style sample**{style="color:CornflowerBlue"} - so any of the 140 HTML color names can be used...
- unstyled **style sample**{.style-me} -sample from the site (first link) has no obvious effect.
- unstyled **style sample**{data-toggle=modal}
- unstyled **style sample**{style="color:green"}
- unstyled **style sample**{..green}
- `$ npm install --save markdown-it-attrs`{style="color:cyan"}
- _title_{style="color:cyan"}
- title{style="color:purple"} - so it doesnt need a delimiter if its on its own line, as below
- title{style="color:purple"}
- unstyled *style sample*{style="color:red"} - so it still renders the bold and italics normally
- unstyled **styled sample**{style="font-family:fantasy"}
- unstyled `styled sample`{style="font-style:italic; font-size:2.5em"}
- unstyled `styled sample`{style="font-style:italic; font-size:12vw; color:purple; font-weight:bold; font-variant:small-caps"}

styled sample{style="text-align:center"}

test{style="text-align:center"}

{style="text-align:center"} works if on a line by itself

Test2{..h1}

Another test{style="border: 5px solid red"}

Another test{style="border: dotted blue"}

Another test{style="border: ridge blue"}

Another test{style="border: 10px inset blue"}

Another test{style="border: 10px outset blue"}

Another test{style="border: 10px ridge blue"}

Another test{style="border: 10px groove blue ; margin: 0px 10px"}

Another test{style="border: outset purple"}

Another test{style="border: ridge; border-color : green;"}

test{style="background: -webkit-linear-gradient(60deg, #FFFFFF, #AAAAAA); border: inset; margin: 20px }

Another test{style="border: dotted blue; border-width: thin medium thick 10px;"}

Another test{style="border: dotted; border-color: blue green red orange; border-width: thin medium 5px 10px;"}

Another test{style="border: double"}

Another Test {style="color: red;  text-align: center;"}

Another Test {style="color: red;  text-align: center; margin:auto; border: medium inset green; width: 20vw; background: linear-gradient(to right, #f46b45,#eea849); height:3vw; padding-top:20px;font-size:150%; width-min:100px"}


test{style="<i class="material-icons">cloud</i>"}

tes
         {style="color: red;  text-align: center; font-weight:100"}

Text Test {style="font-family:'Times New Roman', Times, serif;"}

XML Tools


test{style="font-family:}
- text
  - text-align
  - text-decoration
    - overline
    - line-through
    - under-line
    - text-transform
      - upppercase
      - lowercase
      - capitalize
    - text-indent:
      - size
    - letter-spacing:
      - size
    - line-height:
      - size
    - direction
      - rtl
    - word-spacing
    - text-shadow
- font-style:
  - italic
  - normal
  - oblique (not always supported)
- color:
  - most color names- see link
  - probably Hex too
- font-size
  - expressed in
    - px (10px)
    - em (2 em)
    - percent (150%)
    - vw (view width- scales with window)
- font-weight
  - normal
  - bold
  - 100
  - ...
  - 1000
- font-variant
  - normal
  - small-caps
- font-family
  - Font Names - cant figure out names with spaces...(dashes)
  - Generic Names
    - Monospace
    - Serif
    - Sans-seriff
    - fantasy
    - cursive- doesnt work?
- font:
  - font: 15px arial, sans-serif;
  - font: italic bold 12px/30px Georgia, serif;
- border:  Always declare the border-style property before the border-width property.
  - border: 5px solid red;
  - border: 4px dotted blue;
  - border: double
  - border-width:
    - has 1-4 values, precedence is all, top/bottom, top/sides/bottom, top/right/bottom/left
  - border-color:
    - has 1-4 values, precedence is all, top/bottom, top/sides/bottom, top/right/bottom/left
  - border-style:
    - has 1-4 values, precedence is all, top/bottom, top/sides/bottom, top/right/bottom/left
    - dotted - Defines a dotted border
    - dashed - Defines a dashed border
    - solid - Defines a solid border
    - double - Defines a double border
    - groove - Defines a 3D grooved border. The effect depends on the border-color value
    - ridge - Defines a 3D ridged border. The effect depends on the border-color value
    - inset - Defines a 3D inset border. The effect depends on the border-color value
    - outset - Defines a 3D outset border. The effect depends on the border-color value
    - none - Defines no border
    - hidden - Defines a hidden border
  - border-*-**
    - *=
      - top
      - right
      - left
      - bottom
    - ** =
      - style
      - weight
      - size
- margin
  - margin-top
  - margin-bottom
  - margin-right
  - margin-left
  - margin: top right bottom left
  - auto
- padding
  - same as margin
- background
  - linear-gradient(to right, #f46b45,#eea849)
- background-color
- height
  - px
  - percent
  - vw
- outline
  - outline-color
  - outline-width
  - outline-offset
  - outline
    - 5px solid yellow;
    - thick ridge pink;
  - outline-style
    - dotted - Defines a dotted outline
    - dashed - Defines a dashed outline
    - solid - Defines a solid outline
    - double - Defines a double outline
    - groove - Defines a 3D grooved outline
    - ridge - Defines a 3D ridged outline
    - inset - Defines a 3D inset outline
    - outset - Defines a 3D outset outline
    - none - Defines no outline
    - hidden - Defines a hidden outline
  -  outline-offset:


#### Install

`$ npm install --save markdown-it-attrs`{style="color:cyan"}

not needed I dont think


Usage
var md = require('markdown-it')();
var markdownItAttrs = require('markdown-it-attrs');

md.use(markdownItAttrs);

var src = '# header {.green #id}\nsome text {with=attrs and="attrs with space"}';
var res = md.render(src);

console.log(res)

[markdown-it-kbd](https://www.npmjs.com/package/markdown-it-kbd)
[[Ctrl+Esc]]
Ctrl+Esc

[markdown-it-underline](https://www.npmjs.com/package/markdown-it-underline)
_underline_
underline

markdown-it-container

::::: container
:::: row
::: col-xs-6 alert alert-success
success text
:::
::: col-xs-6 alert alert-warning
warning text
:::
::::
:::::

container-demo.png

(Rendered with style bootstrap, to see the same result, you need the follow config)

"markdown.styles": [
    "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
]
Known Issues & Feedback
Please post and view issues on GitHub

Enjoy!

### Underline

_underline_
underline

### markdown-it-container

::::: container
:::: row
::: col-xs-6 alert alert-success
success text
:::
::: col-xs-6 alert alert-warning
warning text
:::
::::
:::::

!!!Error Definitely does not look like the example.


## Markdown Support for Visual Studio Code

COPIED FROM README.md, needs formatting.



version
installs
AppVeyor
GitHub stars

All you need for Markdown (keyboard shortcuts, table of contents, auto preview and more).

Features
Keyboard shortcuts (toggle bold, italic, code span, strikethrough and heading)

toggle bold (toggle bold)

toggle bold 2 (even when there is no word selected)

check task list (check/uncheck task list)

See full key binding list in keyboard shortcuts section

Table of contents

toc

The indentation rules (tab or spaces) of TOC will be the same of your current file (find it in the right bottom corner)

To make TOC compatible with GitHub, you need to set option githubCompatibility to true

Use <!-- omit in toc --> to ignore specific heading in TOC

List editing

on enter key 1 (Enter)

on enter key 2 (Enter)

on tab key (Tab)

on backspace key (Backspace)

marker fixing (auto fix ordered list markers)

Print Markdown to HTML

Command Markdown: Print current document to HTML

It's recommended to print the exported HTML to PDF with browser (e.g. Chrome) if you want to share your documents with others

GitHub Flavored Markdown

Table formatter

table-formatter

Task list

### Math

$$
f(x) = \int_{-\infty}^\infty
\hat f(\xi)\,e^{2 \pi i \xi x}
\,d\xi
$$



        f(x) = \int_{-\infty}^\infty
        \hat f(\xi)\,e^{2 \pi i \xi x}
        \,d\xi

$\And\int_{\epsilon}^\Phi \hat f(x ^{2\pi})$

+Markdown Support for Visual Studio Code
version
installs
AppVeyor
GitHub stars

All you need for Markdown (keyboard shortcuts, table of contents, auto preview and more).

Features
Keyboard shortcuts (toggle bold, italic, code span, strikethrough and heading)

toggle bold (toggle bold)

toggle bold 2 (even when there is no word selected)

check task list (check/uncheck task list)

See full key binding list in keyboard shortcuts section

Table of contents

toc

The indentation rules (tab or spaces) of TOC will be the same of your current file (find it in the right bottom corner)

To make TOC compatible with GitHub, you need to set option githubCompatibility to true

Use <!-- omit in toc --> to ignore specific heading in TOC

List editing

on enter key 1 (Enter)

on enter key 2 (Enter)

on tab key (Tab)

on backspace key (Backspace)

marker fixing (auto fix ordered list markers)

Print Markdown to HTML

Command Markdown: Print current document to HTML

It's recommended to print the exported HTML to PDF with browser (e.g. Chrome) if you want to share your documents with others

GitHub Flavored Markdown

Table formatter

table-formatter

Task list

Math

math

Auto completions

image paths (images paths)

math completions (math commands)

Others

Override "Open Preview" keybinding with "Toggle Preview", which means you can close preview using the same keybinding (Ctrl + Shift + V or Ctrl + K V).
Available Commands
Markdown: Create Table of Contents
Markdown: Update Table of Contents
Markdown: Toggle code span
Markdown: Print current document to HTML
Markdown: Toggle math environment
Markdown: Toggle unordered list
Keyboard Shortcuts
Table
Tip: **word|** -> **word**| (Ctrl + B)

Supported Settings
Table
Name | Default | Description
-|-|-
markdown.extension.toc.levels | 1..6 | Control the heading levels to show in the table of contents.
markdown.extension.toc.unorderedList.marker | - | Use -, * or + in the table of contents (for unordered list)
markdown.extension.toc.orderedList | false | Use ordered list in the table of contents.
markdown.extension.toc.plaintext | false | Just plain text.
markdown.extension.toc.updateOnSave | true | Automatically update the table of contents on save.
markdown.extension.toc.githubCompatibility | false | GitHub compatibility
markdown.extension.preview.autoShowPreviewToSide | false | Automatically show preview when opening a Markdown file.
markdown.extension.orderedList.marker | ordered | Or one: always use 1. as ordered list marker
markdown.extension.orderedList.autoRenumber | true | Auto fix list markers as you edits
markdown.extension.italic.indicator | * | Use * or _ to wrap italic text
markdown.extension.showExplorer | true | Show outline view in explorer panel
markdown.extension.print.absoluteImgPath | true | Convert image path to absolute path
markdown.extension.print.imgToBase64 | false | Convert images to base64 when printing to HTML
markdown.extension.syntax.decorations | true | Add decorations to strikethrough and code spans
markdown.extension.syntax.plainTheme | false | A distraction-free theme
markdown.extension.toc.tabSize | auto | Control the indentation size of TOC (auto or a number)
markdown.extension.list.indentationSize | adaptive | Use different indentation size for ordered and unordered list


## math

Auto completions

image paths (images paths)

math completions (math commands)

Others

Override "Open Preview" keybinding with "Toggle Preview", which means you can close preview using the same keybinding (Ctrl + Shift + V or Ctrl + K V).
Available Commands
Markdown: Create Table of Contents
Markdown: Update Table of Contents
Markdown: Toggle code span
Markdown: Print current document to HTML
Markdown: Toggle math environment
Markdown: Toggle unordered list
Keyboard Shortcuts
Table
Tip: **word|** -> **word**| (Ctrl + B)

Supported Settings
Table
Name | Default | Description
-|-|-
markdown.extension.toc.levels | 1..6 | Control the heading levels to show in the table of contents.
markdown.extension.toc.unorderedList.marker | - | Use -, * or + in the table of contents (for unordered list)
markdown.extension.toc.orderedList | false | Use ordered list in the table of contents.
markdown.extension.toc.plaintext | false | Just plain text.
markdown.extension.toc.updateOnSave | true | Automatically update the table of contents on save.
markdown.extension.toc.githubCompatibility | false | GitHub compatibility
markdown.extension.preview.autoShowPreviewToSide | false | Automatically show preview when opening a Markdown file.
markdown.extension.orderedList.marker | ordered | Or one: always use 1. as ordered list marker
markdown.extension.orderedList.autoRenumber | true | Auto fix list markers as you edits
markdown.extension.italic.indicator | * | Use * or _ to wrap italic text
markdown.extension.showExplorer | true | Show outline view in explorer panel
markdown.extension.print.absoluteImgPath | true | Convert image path to absolute path
markdown.extension.print.imgToBase64 | false | Convert images to base64 when printing to HTML
markdown.extension.syntax.decorations | true | Add decorations to strikethrough and code spans
markdown.extension.syntax.plainTheme | false | A distraction-free theme
markdown.extension.toc.tabSize | auto | Control the indentation size of TOC (auto or a number)
markdown.extension.list.indentationSize | adaptive | Use different indentation size for ordered and unordered list



## Markdown Math

[Symbol Reference](https://katex.org/docs/support_table.html)


What is it ...
`mdmath` allows to use Visual Studio Code as a markdown editor capable of typesetting and rendering TeX math. In fact it now reuses the built in markdown viewer. KaTeX works inside as a fast math renderer.

You can install the extension directly from Visual Studio Code Marketplace.

What is new in mdmath 2.3.5 ...
KaTeX macros are supported. Simply define them by user settings mdmath.macros. See FAQ's for details.
Save corresponding HTML source to the file system. The markdown file name is used for this (extension .html though). The destination folder is the same, which is the default. You can change this behavior with help of user setting mdmath.savePath.
Activate autosave feature (default: false), so whenever you are saving the markdown file, its corresponding HTML file is also saved (to mdmath.savePath). Simply set user setting mdmath.autosave: true for this.
Features
Simplify the process of authoring and live previewing markdown documents containing math formulas. This extension is a comfortable tool for scientists, engineers and students with markdown as their first choice document format.

Inline math
Display math
Formula numbering
Inline math with tables
Works offline.
Integrated in native markdown viewer. So after installing the extension, TeX math is properly displayed in the markdown preview window.
Based on markdown-it plugin markdown-it-texmath.
Using vscode's Markdown Extension API.
Editor view and Preview are synchronized while scrolling.
Copy resulting HTML code to the system clipboard.
Due to markdown-it-texmath's support of different formula delimiters, these are also available and user configurable with mdmath:

- **'dollars' (default)**{style="color:cyan"}
  - inline: `$...$`
  - display: `$$...$$`
  - display + equation number: `$$...$$` (1)
- **'brackets'**
  - inline: `\(...\)`
  - display: `\[...\]`
  - display + equation number: `\[...\] (1)`
- **'gitlab'**
  - inline: $`...`$`
  - display: `math ... `
  - display + equation number: `math ... ` (1)
- **'kramdown'**
  - inline: `$$...$$`
  - display: `$$...$$`
  - display + equation number: `$$...$$ (1)`


mdmath editing

        Installation ...
        ... from inside of VSCode
        Press F1 key inside of Visual Studio Code and type extension. Choose Extensions: Install Extension and then select the Markdown+Math extension from the list.

        ... from Mac & Linux Command Line
        cd $HOME/.vscode/extensions
        git clone https://github.com/goessner/mdmath.git
        cd mdmath
        npm install
        ... from Windows Command Line
        cd  %USERPROFILE%\.vscode\extensions
        git clone https://github.com/goessner/mdmath.git
        cd mdmath
        npm install
        Usage
        Launch VS Code, create or open a markdown file (.md).
        Open a preview window.
        Typeset in your markdown source window and see the preview window live updating.
        Press Ctrl+K , or run the command Save Markdown+Math to HTML to save the corresponding HTML source to the file system.
        Press Ctrl+K . or run the command Clip Markdown+Math to HTML to copy the corresponding HTML source to the underlying systems clipboard.
        Default User Settings
        // Path to custom stylesheet file (css).
        "mdmath.delimiters": "dollars",
        "mdmath.macros": {},
        "mdmath.savePath": "./${file.name}.html",
        "mdmath.autosave": false
        Dependencies
        markdown-it: The markdown renderer also used in VS Code.
        katex: This is where credits for fast rendering TeX math in HTML go to.
        clipboardy: Access the system clipboard (copy/paste).
        FAQ
        How to define and use macros ?

        Define them in user settings. For example ...
        "mdmath.macros": {
        "\\RR": "\\mathbb{R}",
        "\\vek": "{\\begin{pmatrix}#1\\\\#2\\end{pmatrix}}"
        }
        Use them in your markdown document. For example ... ` Vectors in $\RR^2$ have a shape of

        $$\vek{x}{y}$$

        Are there global predefined macros ?

        No. Macros are user defined with user settings mdmath.macros. So they are available in all user specific markdown documents.
        Can I write the HTML source to a file ?

        Yes. Use the Markdown: Save Markdown+Math to Html command or the key binding ('ctrl+K ,').
        The Html file is written to the folder where the markdown file resides in. This is the default.
        You can change the destination folder by specifying a relative path to your working directory with the help of the user setting mdmath.savePath. So for an example you might choose mdmath.savePath: "./html/${file.name}.html".
        Can I synchronously let the HTML source file update ?

        Yes. Simply set the user setting mdmath.autosave: true for this (default is false).
        Now, whenever you save your markdown file, the corresponding Html file is also saved.
        The destination folder mdmath.savePath is used for this.
        Formula highlighting is broken ?

        It is implemented only for $ delimiters at present.
        $ characters in markdown text are sometimes confused with math delimiters. Enclose them by backticks (`) then.
        Formula highlighting is possible only for formulas on a single line. It breaks with every newline character.
        Math highlighting is completely different from LaTeX math parsing.
        Which functions does KaTeX support ?

        See them listed at KaTeX Supported Functions and KaTeX Support Table.
        What if I need to use the currency symbol $ also in my markup ?

        It should be safe to use it. If in doubt escape it.
        What are the restrictions with inline formulas ?

        Whitespace after opening $ and before closing $ is not allowed.
        Numeric character before opening $ and after closing $ is not allowed.
        At least one character (whitespace ?) is required between two consecutive inline formulas.
        Line break inside is not allowed.
        What are the restrictions with display formulas ?

        Not allowed inline of text.
        Blank lines before and behind required.
        Restrictions for inline formulas do not apply.
        Can I use math markup in blockquotes ?

        We can use inline and display formulas in blockquote sections. Starting with version 2.3.8 display formulas have to be written on a single line in blockquote sections. This might break only rarely some recent documents.
        Can I use math markup in code blocks ?

        No, math markup in code blocks is shown - as expected - as markup. This is consistent now, but in contrast to mdmath versions prior to 2.0.
        Can I access the HTML source of the markdown file ?

        Yes. Use the Markdown: Clip Markdown+Math to Html command or the key binding ('ctrl+K .').
        The markdown preview window has to be opened once for this in order to function properly.
        You need to have the markdown source window activated here (not the preview window!).
        Please note, that the resulting HTML source references 'CDN'-located remote css files. Change those references to local URL's if necessary.
        Is PDF output supported ?

        Not directly. In order to create *.pdf output from your Markdown you can create a *.html document first and print it then using a PDF printer or use Pandoc.
        See Compiling Markdown into HTML.
        Can I use custom CSS styles for the preview window ?

        Yes. Set mdmath.style in user settings to the location of your custom CSS file. Its path must be relative to this extension root.
        Cannot copy to clipboard on Linux ?

        This may be because the upstream clipboardy needs xsel on Linux. Run sudo apt-get install xsel to install.
        Can we store Latex macros with mdmath ?

        Yes, there is a new section mdmath.globalMacros in package.json. Try to expand it with your own macros.


## Markdown Paste

Markdown Paste
telesoho.vscode-markdown-paste-image


Requirements

'xclip' command be required (Linux)
'powershell' command be required (Win32)
'pbpaste' command be required (Mac)
Features

Paste smart

Smartly paste in markdown by pressing 'Ctrl+Alt+V' ('Cmd+Alt+V' on Mac)

If you paste an image, the extension will create an new file for the image and insert link code to Markdown.
If you paste a text, it will test the text with customize regex, and replace matched content by regex.
If you paste a text contain HTML tag, it will try to convert the HTML content to Markdown.
If you paste a rich text, it will try to convert the rich text to Markdown.(Linux only)

!!!ERROR HOWEVER DOING THIS GIVES NO CODE ACTIONS AVAILABLE...

Ruby tag

Also if you want to write article for learning asian language like Chinese or Japanese, ruby tag(for example:聪明Cōngmíng) may be useful. Now a ruby tag snippet are prepare for you, select some text and press 'Ctrl+Alt+T'.

  <ruby>聪明<rp>(</rp><rt>pronunciation</rt><rp>)</rp></ruby>
This extension will not get the pronunciation for you in this version. You have to replace 'pronunciation' by yourself.

Insert latex math symbol and emoji

You can insert latex math symbol and emoji to any text file, such as Julia source file.

press 'Ctrl+Alt+\' or input "Insert latex math symbol" in vscode command panel, then input latex symbol name and choose symbol you want.

#### Config

**pasteImage.path**

The folder path that image will be saved. Support absolute path and relative path and the following predefined variables

${workspaceRoot} - the path of the folder opened in VS Code

${fileBasename} - the current opened file's basename

${fileBasenameNoExtension} - the current opened file's basename with no file extension

${fileExtname} - the current opened file's extension

${fileDirname} - the current opened file's dirname

!!!NOTE  ${workspaceRoot}\\Resources\\${fileDirname}-${fileBasename}.${fileExtname}
        or ${fileDirname}\\res\\${fileBasename}.${fileExtname}


**Default value is `./,`** [which] mean save [the] image in the folder contains current file.

ppasteImage.silence

enable/disable showing confirm box while paste image. Set this config option to true, filename confirm box will not be shown while paste image.

Default value is false

pasteImage.enableImgTag

enable/disable using HTML img tag with width and height for pasting image. If this option be enabled, you can input width and height by using <filepath>[,width,height] in filename confirm input box. for example input \abc\filename.png,200,100, then <img src='\abc\filename.png' width='200' height='100' /> will be inserted. Note that if pasteImage.silence be enabled, this option will be not work.

Default value is true

MarkdownPaste.rules

If you want to define your own regex to parse and replace content for pasting text. You can fill the following JSON, and set it to this option.

  [{
      // rule 1
      "regex": "(https?:\/\/.*)", // your javascript style regex
      "options": "ig",            // regex option
      "replace": "[](https://github.com/telesoho/vscode-markdown-paste-image/blob/master/$1)"         // replace string
  },
  {
      // rule 2
      "regex": "(https?:\/\/.*)", // your javascript style regex
      "options": "ig",            // regex option
      "replace": "[](https://github.com/telesoho/vscode-markdown-paste-image/blob/master/$1)"         // replace string
  },
  ...
  ]
The extension will try to test text content by regex defined in this option, if matched it whill replace content by using the TypeScript function string.replace().

Default value is

  [{
      "regex": "^(?:https?:\/\/)?(?:(?:(?:www\\.?)?youtube\\.com(?:\/(?:(?:watch\\?.*?v=([^&\\s]+).*)|))?))",
      "options": "g",
      "replace": "[![](https://img.youtube.com/vi/$1/0.jpg)](https://www.youtube.com/watch?v=$1)"
  },
  {
      "regex": "^(https?:\/\/.*)",
      "options": "ig",
      "replace": "[](https://github.com/telesoho/vscode-markdown-paste-image/blob/master/$1)"
  }]
Format

File name format

If you selected some text in editor, then extension will use it as the image file name. If not the image will be saved in this format: "Y-MM-DD-HH-mm-ss.png".

File link format

When you editing a markdown, it will pasted as markdown image link format ![](https://github.com/telesoho/vscode-markdown-paste-image/raw/master/imagePath), the imagePath will be resolve to relative path of current markdown file. In other file, it just paste the image's path.

FAQ

FAQ


[Extension not working on windows os.](https://github.com/telesoho/vscode-markdown-paste-image/issues/6)
Contact

If you have some any question or advice, [Welcome to issues here](https://github.com/telesoho/vscode-markdown-paste-image/issues)
z%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe

![]

## Advanced search options

In the input box below the search box, you can enter patterns to include or exclude from the search. If you enter example, that will match every folder and file named example in the workspace. If you enter ./example, that will match the folder example/ at the top level of your workspace. Use ! to exclude those patterns from the search. !example will skip searching any folder or file named example. Use , to separate multiple patterns. You can also use glob syntax:

`*` to match one or more characters in a path segment
`?` to match on one character in a path segment
`**` to match any number of path segments, including none
`{}` to group conditions (for example {**/*.html,**/*.txt} matches all HTML and text files)
`[]` to declare a range of characters to match (example.[0-9] to match on example.0, example.1, …)
VS Code excludes some folders by default to reduce the number of search results that you are not interested in (for example: node_modules). Open settings to change these rules under the files.exclude and search.exclude section.

Also note the Use Exclude Settings and Ignore Files toggle button in the files to exclude box. The toggle determines whether to exclude files that are ignored by your .gitignore files and/or matched by your files.exclude and search.exclude settings.

Tip: From the Explorer, you can right-click on a folder and select Find in Folder to search inside a folder only.

VS Code does support regular expression searches, however, backreferences and lookaround aren't supported by default. But you can enable these with the setting search.usePCRE2. This configures ripgrep to use the PCRE2 regex engine. While PCRE2 supports many other features, we only support regex expressions that are still valid in JavaScript, because open editors are still searched using the editor's JavaScript-based search.

Search and replace
You can also Search and Replace across files. Expand the Search widget to display the Replace text box.

search and replace

When you type text into the Replace text box, you will see a diff display of the pending changes. You can replace across all files from the Replace text box, replace all in one file or replace a single change.

search and replace diff view

Tip: You can quickly reuse a previous search term by using Down and Up to navigate through your search term history.

## RegExp

### RegExp Preview and Editor
l
e0zh.vscode-regexp-preivew
le0zh11,225Repository

### Regex Railroad Diagrams

kogai.regex-railroad-diagrams
kogai3,505Repository
Display railroad diagram of regex under cursor.
Disable
Uninstall

## Replace Rules

Version

Create search/replace rules. A "rule" is one or more search/replace patterns that can be applied to a selection of text (or the entire document).

Replace Rules uses Javascript regular expressions for searching and replacing. Some features, such as lookbehind (e.g. (?<=)), are not supported in Javascript regex. Click here for a quick primer on Javascript regex.

Inspired by the Sublime Text plugin RegReplace.

Getting started

Press Ctrl+Alt+R and select the rule you'd like to run across your selection or document. Alternatively, open the Command Palette (Ctrl+Shift+P) and select Replace Rules: Run Rule...

Configuration options

Rules

replacerules.rules is a dictionary of objects, each of which represents a single search/replace rule. A rule consists of the following components:

Object key - (Required) The description of the rule that will appear in the command palette.
find - (Required) A sequence of regular expressions to be searched on. Can be a single string or an array of strings.
replace - (Optional) A sequence of regular expressions used as replacements. Can be a single string or an array of strings. If this is an empty string or unspecified, each find will be deleted rather than replaced.
flags - (Optional) A set of regex flags to apply to the rule. If only one set of flags is specified, it will be applied to all finds in the rule. The default flags are gm (global, multiline).
languages - (Optional) An array of workspace language ids that the rule is restricted to. For example, a rule with languages set to 'typescript' will only appear in the Run Rule... menu if TypeScript is the active language on the active document.
Rulesets

replacerules.rulesets is a dictionary of objects that run a sequence of rules defined in replacerules.rules. The rules are run in the order they are listed in the rules option:

Object key - (Required) The description of the ruleset that will appear in the command palette.
rules - (Required) An array of rules to be run when the ruleset is called.
Example configuration

Note: The configuration format has changed in version 0.2.0. Your old configs will be automatically converted to the new format. Please see release notes for more details.
.
```json
"replacerules.rules": {
    "Tab Separated Definitions":{
        "find": "^(.+?)(\\t)(.+?)$",
        "replace": "`$1` - $3",
        "flags":"",
        "languages":[
            "markdown",
            "text",
            "javascript",
            "python"
        ]
    },
    "Object Key":{
        "find": "^(.+?)(\\t)(.+?)$",
        "replace": "`$1` - $3",
        "flags":"",
        "languages":[
            "markdown",
            "text",
            "javascript",
            "python"
        ]
    },
    "Object Key":{
        "find": "^(.+?)(\\t)(.+?)$",
        "replace": "`$1` - $3",
        "flags":"",
        "languages":[
            "markdown",
            "text",
            "javascript",
            "python"
        ]
    },
    "Object Key":{
        "find": "^(.+?)(\\t)(.+?)$",
        "replace": "`$1` - $3",
        "flags":"",
        "languages":[
            "markdown",
            "text",
            "javascript",
            "python"
        ]
    }
}

"replacerules.ruleSets": {
    "Object Key Major": {
        "rules": [
            "Remove trailing and leading whitespace",
            "Remove blank lines"
        ]
    }
}
```

Keyboard shortcuts

Bind a specific rule or ruleset to a key combination by adding an entry to keybindings.json

Rule:

```json
{
    "key": "ctrl+shift+/",
    "command": "replacerules.runRule",
    "when": "editorTextFocus && !editorReadonly",
    "args": {
        "ruleName": "Remove trailing and leading whitespace"
    }
}
```
Ruleset:

```json
{
    "key": "ctrl+shift+]",
    "command": "replacerules.runRuleSet",
    "when": "editorTextFocus && !editorReadonly",
    "args": {
        "ruleSet": "Remove lots of stuff"
    }
}
```


Rule definitions

replacerules.rules is an array of objects, each of which represents a single search/replace rule. A rule consists of the following components:

name - (Required) The description of the rule that will appear in the command palette.
find - (Required) A sequence of regular expressions to be searched on. Can be a single string or an array of strings.
replace - (Optional) A sequence of regular expressions used as replacements. Can be a single string or an array of strings. If this is an empty string or unspecified, each find will be deleted rather than replaced.
flags - (Optional) A set of regex flags to apply to the rule. If only one set of flags is specified, it will be applied to all finds in the rule. The default flags are gm (global, multiline).
languages - (Optional) A set of workspace language ids that the rule is restricted to. For example, a rule with languages set to 'typescript' will only appear in the Run Rule... menu if TypeScript is the active language on the active document.
Example ruleset

```json
"replacerules.rules": [
    {
        "name": "Remove trailing and leading whitespace",
        "find": "^\\s*(.*)\\s*$",
        "replace": "$1"
    }
]
```

### REGREPLACE RULES

```json
    "replacerules.rules": [
        {
            "name":"Tab Separated Definitions",
            "find": "^(.+?)(\\t)(.+?)$",
            "replace": "`$1` - $3",
            "flags":"",
            "languages":[
                "markdown",
                "text",
                "javascript",
                "python"
            ]
        },{
            "name":"Line Separated to Code",
            "find": "(^[\\b\\w., ]+?)([\\n]|[\\t\\n])(^.+?$)",
            "replace": "- `$1` - $3",
            "flags":"m",
            "languages":[
                "markdown",
                "text",
                "javascript",
                "python"
            ]
        },{
            "name":"Line Separated to Bold",
            "find": "(^[\\b\\w., ]+?)([\\n])(^.+?$)",
            "replace": "- **$1** - $3",
            "flags":"m",
            "languages":[
                "markdown",
                "text",
                "javascript",
                "python"
            ]
        },{
            "name":"Line Separated to UL",
            "find": " ^(.*?)(\\t\\n)(.*?$)(\\n) *",
            "replace": "- _$1_ - $3",
            "flags":"m",
            "languages":[
                "markdown",
                "text",
                "javascript",
                "python"
            ]
        },{
            "name":"Tabular Data to Code",
            "find": "^()(\\S+?)(([ ]{3,}|)\\t*([ ]{3,}|))(\\b.*)$",
            "replace": "$1- `$2` - $4",
            "flags":"m",
            "languages":[
                "markdown",
                "text",
                "javascript",
                "python"
            ]
        },{
            "name":"Line Separated to UL",
            "find": "(\\S*?)(\\t)(.*)",
            "replace": "$1- `$2` - $4",
            "flags":"m",
            "languages":[
                "markdown",
                "text",
                "javascript",
                "python"
            ]
        },{
            "name":"Line and Colon Separated Definitions",
            "find": "(^[a-z.]+?)(:)([\\n^.*])",
            "replace": "`$1` - $3",
            "flags":"",
            "languages":[
                "markdown",
                "text",
                "javascript",
                "python"
            ]

        },{
            "name":"Remove Tabs",
            "find": "[\t]",
            "replace": " - ",
            "flags":"",
            "languages":[
                "markdown",
                "text"
            ]
        },{
            "name":"Tabs to Tables",
            "find": "[\t]",
            "replace": " | ",
            "flags":"",
            "languages":[
                "markdown",
                "text"
            ]
        }

```
regreplace
domir.regreplace
DomiR631RepositoryLicense
Regular expressions replacing befor save.

regreplace README

Reg Replace is a plugin for Visual Studio Code that allows the creating of commands consisting of sequences of find and replace instructions.

It is heavily inspired from Reg Replace for Sublime Text

Often linters and code formatters cannot do this easily. usage

Features

Create find and replace rules that can then be used to create VSCode Commands to call at any time.
Chain multiple regex find and replace rules together.
Create rules that can filter regex results by filename.
Create rules that run on save.
Extension Settings

This extension contributes the following settings:

on-save - defaults to true, run commands on save.
suppress-warnings - (optional) Suppress warnings when regreplace fails.
commands - array of commands that will be run whenever a file is saved.
name - command name for debugging.
match - regex for matching files to run commands on. e.g. "\\.(ts|js|tsx)$" or ["\\.(ts|js|tsx)$"]
exclude - regex for matching files not to run commands on. e.g. "^\\.$" exclude dot files
language - used instead of match, exclude will still work e.g. "typescript"
priority - command priority determines order.
find - use simple find command. e.g. "** what"
regexp - use regexp find command. Needs to be escaped. e.g. "(\\n)*"
replace - replace text. Supports groups. e.g. "$2\n$1"
global - run command asynchronously.
Sample Config

This sample configuration will replace single quotes with double quotes.

"regreplace.commands": [
  {
      "name": "single to double quote",
      "match": "\\.html?$",    // html
      "regexp": "(')(.*?)(')", // single quotes
      "global": true,          // global
      "replace": "\"$2\""      // replace with double quotes
  }
This is another helper of mine

  {
      "name": "classname helper",        // name
      "language": "typescriptreact",     // use vscode language names
      "regexp": "className=\"(.+)\"",  // escaped regex
      "global": true,                    // global
      "replace": "className={styles.$1}" // replaced value
  },
]
Known Issues

Release Notes

1.3.0

Breaking Change: Renaming command RegReplace: Run all to RegReplace: Run all
Use diff patching, so we can keep the cursor position
Fix typos in readme, thanks @atnbueno
Add language config, thanks @atnbueno
Adding RegReplace: Run single rule, thanks @iammoen
1.2.0

Fix readme
1.1.0

Breaking Change: Renaming command Run RegReplace to RegReplace: Run
Adding RegReplace: Save without replacing
1.0.0

Initial release of regreplace.


### Highlight


fabiospampinato.vscode-highlight
Fabio Spampinato20,592RepositoryLicense
Advanced text highlighter based on regexes. Useful for todos, annotations etc.
Disable
Uninstall
Details
Contributions
Changelog

Logo

Advanced text highlighter based on regexes. Useful for todos, annotations etc.

There are other extensions that can be used for this, like TODO Highlight, but this is more generic, this can apply different styles to different capturing groups within the same regex, and this is focused on doing only one thing and doing it well.

Install

Follow the instructions in the Marketplace, or run the following in the command palette:

ext install fabiospampinato.vscode-highlight
Settings

{
  "highlight.decorations": { "rangeBehavior": 3 }, // Default decorations from which all others inherit from
  "highlight.regexFlags": "gi", // Default flags used when building the regexes
  "highlight.regexes": {}, // Object mapping regexes to options or an array of decorations to apply to the capturing groups
  "highlight.maxMatches": 250 // Maximum number of matches per regex to decorate
}
An example configuration could be:

"highlight.regexes": {
  "(//TODO)(:)": [ // A regex will be created from this string, don't forget to double escape it
    { "color": "yellow" }, // Decoration options to apply to the first capturing group, in this case "//TODO"
    { "color": "red" } // Decoration options to apply to the second capturing group, in this case ":"
  ]
}
If you want to have different regex flags for different regexes, or if you want to apply the decorations on a per-language/file basis you'll have to express your configuration like this:

"highlight.regexes": {
  "(//TODO)(:)": { // A regex will be created from this string, don't forget to double escape it
    "regexFlags": "g", // Flags used when building this regex
    "filterLanguageRegex": "markdown", // Apply only if current file's language matches this regex. Requires double escaping
    "filterFileRegex": ".*\\.ext", // Apply only if the current file's path matches this regex. Requires double escaping
    "decorations": [ // Decoration options to apply to the capturing groups
      { "color": "yellow" }, // Decoration options to apply to the first capturing group, in this case "//TODO"
      { "color": "red" } // Decoration options to apply to the second capturing group, in this case ":"
    ]
  }
}
Note: All characters of the matched string must be wrapped in a capturing group, and for each capturing group a decorations options object must be provided (empty decorations are allowed: {}), otherwise the actual decorations will be misaligned.

Note: Nested capturing groups are not supported.

A much more robust string for matching todos, with support for JavaScript/HTML-style comments, urls, multiple todos in a single line, common templating languages, and Todo+-style tags would look like this:

"((?:<!-- *)?(?:#|//|/\\*+|<!--|--|\\* @|\\{!|\\{\\{!--|\\{\\{!) *TODO(?:\\s*\\([^)]+\\))?:?)((?!\\w)(?: *-->| *\\*/| *!}| *--}}| *}}|(?= *(?:[^:]//|/\\*+|<!--|@|--|\\{!|\\{\\{!--|\\{\\{!))|(?: +[^\\n@]*?)(?= *(?:[^:]//|/\\*+|<!--|@|--(?!>)|\\{!|\\{\\{!--|\\{\\{!))|(?: +[^@\\n]+)?))"
All the supported decoration options are defined here.

Demo

The following configuration:

"highlight.regexes": {
  "(// ?TODO:?)(.*)": [
    {
      "overviewRulerColor": "#ffcc00",
      "backgroundColor": "#ffcc00",
      "color": "#1f1f1f",
      "fontWeight": "bold"
    },
    {
      "backgroundColor": "#d9ad00",
      "color": "#1f1f1f"
    }
  ],
  "(// ?FIXME:?)(.*)": [
    {
      "overviewRulerColor": "#ff0000",
      "backgroundColor": "#ff0000",
      "color": "#1f1f1f",
      "fontWeight": "bold"
    },
    {
      "backgroundColor": "#d90000",
      "color": "#1f1f1f"
    }
  ],
  "(// )(@\\w+)": [
    {},
    {
      "color": "#4de0ff"
    }
  ]
}
Transforms this:

Before

Into this:

After

Hints

Todo: If you're using this extension for highlighting todos, I recommend using Todo+ as well.
Contributing

If you found a problem, or have a feature request, please open an issue about it.

If you want to make a pull request you can debug the extension using Debug Launcher.

License


MIT © Fabio Spampinato
### Show Functions

qrti.funclist
qrti20,899Repository
List functions, symbols, bookmarks by configurable regular expressions
Reload
Uninstall
Please reload Visual Studio Code to complete the installation of this extension.

FuncList

Retrieves functions, symbols, bookmarks from text or source files and lists references in a side editor. Clicking a references will reveal the corresponding position in text or source file.

New Version -> History
reworked virtual document handling

Change of Behavior
source files can't have multiple reference lists anymore
only temporary lists with slanted (tab) titles are updated correctly

Short Test Drive

open a source file (.c .h .cpp .hpp .ts .php .ps1 .asm)
select F1 > Show Functions
a side editor opens and shows a reference list
click a reference
funclist in action

Settings

extensions
list of file extension strings

native
regular expression to match functions, symbols, bookmarks
(native does not allow regEx groups)

display
regular expression to trim matches of nativeFilter for clean display
(display allows regEx groups 0-9 in options, see examples)

sort
0 = unsorted, order of appearance (appear)
1 = sorted, ignore case (nocase)
2 = sorted, obey case (case)

doubleSpacing
extended space in symbol list
false = off
true = on

Settings should look like this

"funcList": {
    "doubleSpacing": false,

    "filters": [
        {
            "extensions": [
                ".c",
                ".h"
            ],
            "native": "/^[a-z]+\\s+\\w+\\(/mgi",
            "display": "/\\S* +(\\w+)/1",
            "sort": 0
        },
        {
            ...
        }
    ]
}
Add your own filetypes and filters
- open settings with 'Menu/File/Preferences/Settings'
- enter funcList in the search field
- choose User or Workspace Settings
- click 'Edit in settings.json'
- place the cursor to a fitting place
- type funcList and hit enter to insert predefined settings
- edit them after your needs
- check for correct bracing and commas
- see -> Hints for easy regEx testing

Examples

TypeScript/Php Function Filter

"native": "/(?:^|\\s)function\\s+\\w+\\(/mg"
function encodeLocation(
function dispose(
simple functions will be found

"display": "/\\s*function\\s+(\\w+)/1"
encodeLocation
dispose
function names without keyword and opening bracket will be displayed

(Thanks to Avol-V)

Simple C Function Filter

"native": "/^[a-z]+\\s+\\w+\\(/mgi"
int main(
void initSerial(
simple function headers will be found

"display": "/\\S* +(\\w+)/1"
main
initSerial
function names without return value and opening bracket will be displayed

Assembler Target Filter

"native": "/^\\w+:\\s*$/mg"
encodeByte:
doSleep:
standalone targets on beginning of lines are found

mar01: mov r0,r1
abc17: ;comment
targets with following instruction or comment are not found

"display": "/\\w+/"
encodeByte
doSleep
targets are listed without colon or trailing spaces

PowerShell Function Filter

"native": "/function\\s+\\w+-?\\w*\\s*{/img"
"display": "/function\\s+(\\w+-?\\w*)/1i"
(Thanks to Paradox355)

Bookmark Filter

"native": "/^bookmark .+$/mg"
bookmark my mark 123
bookmark huubaBooba
or similar will be found

"display": "/\\w+\\s+(.*\\w)/1"
my mark 123
huubaBooba
will be listed

Hints



### Bracket Pair Colorizer 2 (Beta)

This extension allows matching brackets to be identified with colours. The user can define which tokens to match, and which colours to use.

Screenshot:
Screenshot

F.A.Q.

Differences between v1 and v2?
v2 Uses the same bracket parsing engine as VSCode, greatly increasing speed and accuracy. A new version was released because settings were cleaned up, breaking backwards compatibility.
Release Notes

Settings

"bracket-pair-colorizer-2.colors"
Define the colors used to colorize brackets. Accepts valid color names, hex codes, and rgba() values.

"bracket-pair-colorizer-2.colors": [
    "Gold",
    "Orchid",
    "LightSkyBlue"
]
"bracket-pair-colorizer-2.forceUniqueOpeningColor"
Disabled Enabled

"bracket-pair-colorizer-2.forceIterationColorCycle"
Enabled

"bracket-pair-colorizer-2.colorMode"
Consecutive brackets share a color pool for all bracket types
Independent brackets allow each bracket type to use its own color pool
Consecutive Independent

"bracket-pair-colorizer-2.highlightActiveScope"
Should the currently scoped brackets always be highlighted?

"bracket-pair-colorizer-2.activeScopeCSS"
Choose a border style to highlight the active scope. Use {color} to match the existing bracket color
It is recommended to disable the inbuilt editor.matchBrackets setting if using this feature
BorderStyle

"bracket-pair-colorizer-2.activeScopeCSS": [
    "borderStyle : solid",
    "borderWidth : 1px",
    "borderColor : {color}",
    "opacity: 0.5"
]
"bracket-pair-colorizer-2.showBracketsInGutter"
Show active scope brackets in the gutter
Gutter

"bracket-pair-colorizer-2.showBracketsInRuler"
Show active scope brackets in the ruler

"bracket-pair-colorizer-2.rulerPosition"
Decoration position in the ruler

"bracket-pair-colorizer-2.showVerticalScopeLine"
Show a vertical line between the brackets? Enabled by default
Scope Line

"bracket-pair-colorizer-2.showHorizontalScopeLine"
Show a horizontal line between the brackets? Enabled by default
Scope Line

"bracket-pair-colorizer-2.scopeLineRelativePosition"
Disable this to show the vertical line in column 0
Scope Line

"bracket-pair-colorizer-2.scopeLineCSS"
Choose a border style to highlight the active scope. Use {color} to match the existing bracket color

"bracket-pair-colorizer-2.scopeLineCSS": [
    "borderStyle : solid",
    "borderWidth : 1px",
    "borderColor : {color}",
    "opacity: 0.5"
]
"bracket-pair-colorizer-2.excludedLanguages"
Exclude a language from being colorized

Commands

These commands will expand/undo the cursor selection to the next scope

"bracket-pair-colorizer-2.expandBracketSelection"
"bracket-pair-colorizer-2.undoBracketSelection"

Quick-start:

{
    "key": "shift+alt+right",
    "command": "bracket-pair-colorizer-2.expandBracketSelection",
    "when": "editorTextFocus"
},
{
    "key": "shift+alt+left",
    "command": "bracket-pair-colorizer-2.undoBracketSelection",
    "when": "editorTextFocus"
}

## Prettier



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

``` java
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
- `HexDigits` -- Matches hex digits: /^x?[0-1a-f]+$/i
- `HexValues` -- Matches common hex format like #aaa, 0xfeef, \u0134
- `EscapeCharacters1` -- matches special characters: '\n', '\t' etc.
- `Base641` -- matches base64 blocks of text longer than 40 characters.
- `Email` -- matches most email addresses.

#### Include Patterns

- `Everything1` -- By default we match an entire document and remove the excludes.
- `string` -- This matches common string formats like '...', "...", and `...`
- `CStyleComment` -- These are C Style comments /* */ and //
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
    "flagWords": [
        "hte"
    ]
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
