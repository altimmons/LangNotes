# Workspace Settings


TOC

[[TOC]]


## New Settings to update

```json
"code-runner.fileDirectoryAsCwd": true,
"code-runner.terminalRoot": "/mnt/",
"code-runner.saveAllFilesBeforeRun": true
 "breadcrumbs.enabled": true,

```External

[VSCode Docs Editing](https://code.visualstudio.com/docs/editor/codebasics)

[VSCode Doc-Navigation](https://code.visualstudio.com/docs/editor/editingevolved)


Replace Rules  bhughes339.replacerules

Favorite Themes:

Grigoryvp memory theme
Adapta Nokoto
Ark Dark
Atom One Dark
electron
Hopskotch (textmate)
Viow Darker


## Config
Nevermind the above:
This command returns all the installed extensions in a format that installs them in another:

```batch
code --list-extensions | xargs -L 1 echo code --install-extension
```

## Settings (Global)

For Extension info and setup- go to [Configurations](#Configurations)

!!!Attention GitHub GIST ID for Settings Sync Has Changed
    ~~60c9fd462ef31067f7c7c7dd1a89aafd~~ New Code Issued 3/24/19:

    !!!check 14f847af7982b94685f70da49cdf01f64f6f5c8a

```java
14f847af7982b94685f70da49cdf01f64f6f5c8a
```



!!!faq Personal Access Token on GitHub
      e253b1882c10bb5edea7dd8b91a26b8c9d47c33a

Currently Using Remark


### Keybindings

(Keys)[#Keys] -There are a number of key shortcuts in the .keybindings fi




### Fonts

"editor.fontFamily": "Fira, 'Fira Code Retina', monospace",
"editor.fontFamily": "RobotoMono, 'Roboto Mono Medium', monospace",

### By Device


#### Desktop

##### User Settings (Desktop)

?
###### Last Update ?

```json
{
  "folders": [
    {
      "path": "VS Code"
    }
  ],
  "settings": {
    //  "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
    "terminal.integrated.shell.windows": "C:\\Windows\\sysnative\\wsl.exe",
    "pasteImage.silence": true,
    "pasteImage.enableImgTag": true,
    "files.autoSave": "onFocusChange",
    "files.autoSaveDelay": 120000,
    "files.hotExit": "onExitAndWindowClose",
    "editor.formatOnSave": true,
    //"markdown-checkbox.typeOfBulletPoint": "-",
    "pasteImage.path": "${currentFileDir\\\\resource",
    "pasteImage.defaultName": "${currentFileNameWithoutExt} (Y-MM-DD-HH-mm-ss)",
    "pasteImage.encodePath": "urlEncode",
    //User Settings
    //"java.errors.incompleteClasspath.severity": "ignore",
    "workbench.colorTheme": "One Dark Pro",
    "markdown-preview-enhanced.printBackground": true,
    "editor.fontFamily": "Fira, 'Fira Code Retina', monospace",
    //"terminal.integrated.shell.windows": "C:\\Windows\\sysnative\\bash.exe"
    "[markdown]": {
      "editor.quickSuggestions": true
    }
  }
}
```

##### Workspace (Desktop)

ToDo

##### Folder (VS Code) (Desktop)

ToDo

#### Laptop

##### User (Laptop)

ToDo

##### Workspace (Laptop)

ToDo2

##### Folder (VS Code) (Laptop)

ToDo

#### VM

##### User (VM)

ToDo

##### Workspace (VM)

ToDo

##### Folder (VS Code) (VM)

ToDo

#### Work

##### User Settings (Work)

Last Update, 12/10/18

```json
//  Custom Settings Specifcs.

{
  "python.pythonPath": "C:\\Python37-32\\Python.exe",
  "editor.wordWrap": "bounded",
  "http.proxy": "http://m-proxy1.swmed.edu:3128",
  "editor.fontLigatures": true,
  "markdown-preview-enhanced.codeBlockTheme": "auto.css",

  "markdown-preview-enhanced.enableScriptExecution": true,
  // Enable smartypants and other sweet transforms.
  "markdown-preview-enhanced.enableTypographer": false,
  //    "editor.fontFamily": "Fira Code",
  //    "editor.fontFamily": "Monoisomne",
  //    "editor.fontFamily": "Monoid",
  //    "editor.fontFamily": "Fixedsys Excelsior",
  //    "editor.fontFamily": "DejaVu Sans Code",
  //    "editor.fontFamily": "Iosevka",
  "editor.fontFamily": "Hasklig",
  //"editor.fontFamily": "Iosevka, 'DejaVu Sans Code',  'Fira Code', Hasklig",
  "editor.renderControlCharacters": true,
  "editor.detectIndentation": true,
  "editor.occurrencesHighlight": true,
  "editor.acceptSuggestionOnEnter": "smart",
  "editor.autoClosingBrackets": true,
  "editor.acceptSuggestionOnCommitCharacter": true,
  "editor.cursorBlinking": "blink",
  "editor.wrappingIndent": "same",
  // "http.proxyStrictSSL": true,

  // pdf only. Paper width, accepts values labeled with units(mm, cm, in, px). If it is set, it overrides the markdown-pdf.format option.
  "markdown-pdf.width": "",
  "python.jediEnabled": false,
  "java.home": "java.home":"C:\\Program Files\\Java\\JDK-11",
  "markdown-preview-enhanced.previewTheme": "one-dark.css",
  "markdown-preview-enhanced.revealjsTheme": "black.css",
  "markdown-preview-enhanced.printBackground": true,
  "r.rterm.windows": "C:\\Program Files\\R\\R-3.5.0\\bin\\x64\\R.exe",
  "java.errors.incompleteClasspath.severity": "ignore",
  "workbench.colorTheme": "One Dark Pro Vivid",
  "sync.gist": "60c9fd462ef31067f7c7c7dd1a89aafd",
  "sync.quietSync": false,
  "sync.removeExtensions": true,
  "sync.syncExtensions": true,
  "sync.autoDownload": false,
  "sync.autoUpload": false,
  "sync.forceDownload": false,
  // "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\cmd.exe",
  //"terminal.integrated.shellArgs.windows": ["/K", "D:\\cmder\\vscode.bat"],
  // Command Prompt
  "terminal.integrated.shell.windows": "C:\\Windows\\System32\\cmd.exe",
  // PowerShell
  "terminal.integrated.shell.windows": "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
  //wsl
  "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\wsl.exe",
  // Git Bash
  "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe",
  // Bash on Ubuntu (on Windows)
  "terminal.integrated.shell.windows": "C:\\Windows\\System32\\bash.exe",
  "files.autoSave": "afterDelay",
  "editor.renderWhitespace": "boundary",
  "editor.cursorStyle": "block-outline",
  "editor.wordWrapColumn": 120,
  "editor.parameterHints.cycle": true,
  "editor.showFoldingControls": "always",
  "editor.smoothScrolling": true,
  "editor.tabCompletion": "on",
  //https://code.visualstudio.com/docs/getstarted/theme-color-reference#_editor-colors
  /*
"editor.tokenColorCustomizations": {
  []
},
"workbench.colorCustomizations": {

},
*/
  "files.autoSaveDelay": 120000,
  "editor.formatOnType": true,
  "editor.formatOnSave": true,
  "editor.suggest.localityBonus": true,
  "files.trimFinalNewlines": true,
  "files.trimTrailingWhitespace": true,
  "[ahk]": {}
  //Wait to implement until fixed. Add commma above
  // "local-history.path": "C:\\Users\\s163837\\Documents\\.vsCodeHistory"
}
```

##### Workspace (Work)

Last Update, 12/10/18

```json
{
  "folders": [
    {
      "path": "VS Code"
    }
  ],
  "settings": {
    //  "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"

    "terminal.integrated.shell.windows": "C:\\Windows\\sysnative\\wsl.exe",
    "pasteImage.silence": true,
    "pasteImage.enableImgTag": true,
    "files.autoSave": "afterDelay",
    "files.autoSaveDelay": 120000,
    "files.hotExit": "onExitAndWindowClose",
    "editor.formatOnSave": true
    //"terminal.integrated.shell.windows": "C:\\Windows\\sysnative\\bash.exe"
  }
}
```

##### Folder (VS Code) (Work)

Last Update 12-10-18

```json
{
  //"python.pythonPath": "C:\\Python27\\python.exe"
  "python.pythonPath": "C:\\Windows\\py.exe",
  "code-runner.executorMap": {
    "javascript": "node",
    "java": "cd $dir && javac $fileName && java $fileNameWithoutExt",
    "c": "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "cpp": "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "objective-c": "cd $dir && gcc -framework Cocoa $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt",
    "php": "php",
    "python": "python -u",
    "py3": "py -3 -c",
    "py2": "py -2 -c",
    "perl": "perl",
    "perl6": "perl6",
    "ruby": "ruby",
    "go": "go run",
    "lua": "lua",
    "groovy": "groovy",
    "powershell": "powershell -ExecutionPolicy ByPass -File",
    "bat": "cmd /c",
    "shellscript": "bash",
    "fsharp": "fsi",
    "csharp": "scriptcs",
    "vbscript": "cscript //Nologo",
    "typescript": "ts-node",
    "coffeescript": "coffee",
    "scala": "scala",
    "swift": "swift",
    "julia": "julia",
    "crystal": "crystal",
    "ocaml": "ocaml",
    "r": "Rscript",
    "applescript": "osascript",
    "clojure": "lein exec",
    "haxe": "haxe --cwd $dirWithoutTrailingSlash --run $fileNameWithoutExt",
    "rust": "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
    "racket": "racket",
    "ahk": "autohotkey",
    "autoit": "autoit3",
    "dart": "dart",
    "pascal": "cd $dir && fpc $fileName && $dir$fileNameWithoutExt",
    "d": "cd $dir && dmd $fileName && $dir$fileNameWithoutExt",
    "haskell": "runhaskell",
    "nim": "nim compile --verbosity:0 --hints:off --run"
  }
}
```

## Markdown

### Manual and Notes

Link Example

Go To
[Settings](#workspace-settings)

!!!Note Note - Case dosnt matter, can be Note note or NOTE after three ! (!!!). There can also be a space `!!! Note` or not `!!!note` or using any of the words below. The displayed word is replaced by the first word. To make it stay showing note, you have to say it twice. e.g. `!!!Note Note`
!!!warning They can also be embedded within like this, but it seems like you have to use TAB.

!!!Note

!!!Summary Summary Tldr Abstract

!!! Todo Todo | Info

!!! TIP Tip Hint

!!!success success | check | done
!!!question help | question | faq
!!!warning warning | caution
!!!attention
!!!failure failure | fail | missing
!!!danger
!!!error
!!!bug
!!!example example | snippet
!!!quote Quote | cite

Putting a dash under a bullet makes it big

- Home PC has- -
- WorkPC has-

```text
- Home PC has-
    -
- WorkPC has-
```

#### List of packages by official name

I need a cohesive Markdown setup...

Perhaps I need to read the instructions on each...

### Sources-

[Markdown-it](https://www.npmjs.com/package/markdown-it-table-of-contents)

[Python Markdown](https://python-markdown.github.io/)

[Instructions](https://thisdavej.com/build-an-amazing-markdown-editor-using-visual-studio-code-and-pandoc/)
Instructions using pandoc

[mkdocs](https://squidfunk.github.io/mkdocs-material/extensions/admonition/)

## Configurations


### Markdown Header Coloring


go here- `C:\Users\andyt\.vscode\extensions\satokaz.vscode-markdown-header-coloring-0.1.1`
https://www.w3schools.com/colors/colors_names.asp
see readme.md

Use Color Highlight [code --install-extension naumovs.color-highlight]
and Color Picker [code --install-extension anseki.vscode-color]

- red-yellow
  - #c02425, #f0cb35
  - #f46b45,#eea849
- grey, plum
  - #403A3E, #BE5869`
- green blue
  - #c2e59c, #64b3f4
  - #92FE9D,#00C9FF
  - #136a8a, #267871
  - #43cea2, #185a9d
- red dark
  - #8E0E00, #1F1C18
- purple, blue
  - #fc00ff,#00dbde
- purple red
  - #7b4397, #dc2430
- ivory,dark
  - #d7d2cc, #304352
- blue dark
  - #3498db, #2c3e50
- green dark
  - #00bf8f, #001510
- pink dark
  - (*) #ffa17f, #00223e
- lt blue white
  - #8e9eab, #eef2f3
  - #525252,#3d72b4
  - #2c3e50. #3498db
- Purp red orange
  - (*)#833ab4, #fd1d1d, #fcb045
- or pur blue
  - (*)#feac5e, #c779d0, #4bc0c8\
- Pur Blue
  - (*) #360033, #0b8793
- Or purp
  - #d38312, #a83279

### Color Picker

Color Picker
anseki.vscode-color

requires node.js and NPM

### History

Local History
xyz.local-history

  "local-history.daysLimit":  30  // A day number to purge local history. (0: no purge)
    "local-history.maxDisplay": 10  // A max files to display with local history commands
    "local-history.saveDelay":   0  // A delay in seconds to save file in local history. {0: no delay}
    "local-history.dateLocale":     // The locale to use when displaying date (e.g.: "fr-CH" or "en-GB" or ...)

    "local-history.path":     // Specify another location for .history folder (null: use workspaceFolder)
        This settings must be an abolute path. You can also start your path with:
        ${workspaceFolder}: current workspace folder
            e.g. ${workspaceFolder}/.vscode to save in each workspace folder .vscode/.history
        ${workspaceFolder: 0}: first workspace folder
            e.g. workspace folders A, B, C. But save always in A/.history
    "local-history.absolute": // Save absolute or relative path in local-history.path
        true:  (absolute) // <local-history.path>/.history/<absolutePath>
        false: (relative) // (default) <local-history.path>/.history/<workspaceFolder.basename>/<relativePath>

    "local-history.enabled":
        0: Never     // Possibillity to disabled the extension for some project
        1: Always    // (default) Save also single file with no workspaceFolder ("local-history.path" must be defined)
        2: Workspace // Save only files within workspaceFolder

    "local-history.exclude": // Files or folders to not save
        // (default) ['**/.history/**', '**/.vscode**', '**/node_modules/**', '**/typings/**', '**/out/**']

    "local-history.treeLocation": // Specify a location for tree view
        explorer (default): // Show tree in Explorer item
        localHistory:       // Show tree in a special active bar item
Commands

local-history.showAll // Show all history available to select (limited with maxDisplay settings)
local-history.showCurrent // Show current version (if history version is active)
local-history.compareToCurrent // compare current version with another version in history
local-history.compareToActive // compare active file with another version in history
local-history.compareToPrevious // compare a version in history with its previous version
Note






### Proxy

check http_proxy and https_proxy is set.
Also check internet explorer values set.

```bash
npm config set proxy http://proxy.company.com:8080
npm config set https-proxy http://proxy.company.com:8080
```



### Gen

!!!

Replace with below as it allows pasting text too;
[Markdown Paste]
telesoho.vscode-markdown-paste-image

!!! Note Note Using the following setup

- jebbs.markdown-extended
- statiolake.vscode-markdown-run-snippet
- X hnw.vscode-auto-open-markdown-preview
- satokaz.vscode-markdown-header-coloring
- X tomashubelbauer.vscode-markdown-link-suggestions
- davidanson.vscode-markdownlint
- X joshbax.mdhelper
- Replaced X'd ones with
- yzhang.markdown-all-in-one

!!! Check Current List (working well!)

- jebbs.markdown-extended - statiolake.vscode-markdown-run-snippet
- satokaz.vscode-markdown-header-coloring
- davidanson.vscode-markdownlint
- yzhang.markdown-all-in-one
  - Need to add some right click menu options though, perhaps via github sources
- mdickin.markdown-shortcuts -- added for the above
- ms-vscode.theme-markdownkit -- Just some themes

```cmd

code --install-extension satokaz.vscode-markdown-header-coloring
code --install-extension jebbs.markdown-extended
code --install-extension davidanson.vscode-markdownlint
code --install-extension yzhang.markdown-all-in-one
code --install-extension mdickin.markdown-shortcuts
code --install-extension ms-vscode.theme-markdownkit

code --install-extension sakryukov.markdown-it-plugin-development-framework
code --uninstall-extension tomashubelbauer.vscode-markdown-link-suggestions
#Not working
code --install-extension
code --install-extension
code --install-extension
code --install-extension

#Other extensions
code --install-extension vsciot-vscode.vscode-arduino
code --install-extension slevesque.vscode-autohotkey
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
code --install-extension
```

_Need to add back the following-_

- Pasting
- yUML
- Emojis?
- Badges?
- Try Prettier and Remark
- Exporter - e.g. md to PDF?

_Suggested Additions_

- MarkDown Link Suggestions - tomashubelbauer.vscode-markdown-link-suggestions
- Markdown-it Plugin Development Framework - sakryukov.markdown-it-plugin-development-framework
  - One setting which gives a file name that explains the chain of events in interpretation.
  - Setting is "markdown.extension.pluginDevelopment.debugConfigurationFileName"

!!!Warning Old Settings: - code --install-extension [module] - davidanson.vscode-markdownlint - -!- mushan.vscode-paste-image - telesoho.vscode-markdown-paste-image - esbenp.prettier-vscode Prettier - Code formatter - satokaz.vscode-markdown-header-coloring #This extension decorates the Markdown header on the editor

!!!Warning Work Old Settings

- unless otherwise specified the below have been uninstalled.
- (x=disabled) jasonroger.vscode-auto-open--markdown-preview
- (x) Auto-Open Markdown Preview hnw.vscode-auto-open-markdown-preview
- (x) Markdown All in One -yzhang.markdown-all-in-one
- (kept) Markdown Extended - jebbs.markdown-extended
- (kept) MarkDown Link Suggestions - tomashubelbauer.vscode-markdown-link-suggestions
- Markdown PDF yzane.markdown-pdf Not using
- (x)Markdown Preview Enhanced - jasonroger.markdown-preview-enhanced-fork
- (x) Markdown Preview Enhanced - shd101wyy.markdown-preview-enhanced
- Markdown Preview Enhanced with litvis gicentre.markdown-preview-enhanced-with-litvis
- (x) Markdown Preview Github Styling bierner.markdown-preview-github-styles
- (kept) (disabled) Markdown Preview Theme - One Dark - raegon.markdown-preview-theme-one-dark (unnecesarry? Still works at home without this.)
- (x) (re-enabled) Markdown Shortcuts mdickin.markdown-shortcuts
- (in) Markdown Theme Kit - ms-vscode.theme-markdownkit
- (x) Markdown TOC - alanwalk.markdown-toc
- (x) (Re-enabled) Markdown-it Plugin Development Framework - sakryukov.markdown-it-plugin-development-framework
- (disabled, but kept) Markdown+Math- goessner.mdmath - so far has been un-needed.
- (in) markdownlint - davidanson.vscode-markdownlint annoying as hell.

Other previously used packages

-!- mushan.vscode-paste-image
telesoho.vscode-markdown-paste-image
esbenp.prettier-vscode Prettier - Code formatter
satokaz.vscode-markdown-header-
[Paste Image](https://github.com/mushanshitiancai/vscode-paste-image)
mushan.vscode-paste-image

Replace with below as it allows pasting text too;
Markdown Paste

telesoho.vscode-markdown-paste-image

Desired State

code --install-extension statiolake.vscode-markdown-run-snippet - satokaz.vscode-markdown-header-coloring - yzhang.markdown-all-in-one

#### Decorations and Aesthetics

[Markdown Header Coloring](https://github.com/satokaz/vscode-markdown-header-coloring) -This extension decorates the Markdown header on the editor

- satokaz.vscode-markdown-header-coloring
- **I like this one**

[Markdown Theme Kit](https://github.com/Microsoft/vscode-themes.git) -Theme Kit for VS Code optimized for Markdown. Based on the TextMate themes.

- `ms-vscode.theme-markdownkit`
- Microsoft
- 187,516
- [VS-Code Themes Extension](https://github.com/Microsoft/vscode-themes)

[Remark](https://github.com/mrmlnc/vscode-remark) - Beautify markdown code with Remark

- Not sure if this works with or against prettier...
- mrmlnc.vscode-remark
- 3,710

[Reflow Markdown](https://github.com/marvhen/reflowmarkdown) Format lines in markdown headers, paragraphs, blockquotes, lists, etc. to a preferred line-length.

- marvhen.reflow-markdown
- 1,843

[Prettier Now](https://github.com/remimarsal/prettier-now-vscode) VS Code plugin for Prettier Miscellaneous / Code Formatter

- Not sure if this is complimentary to prettier or works against it
- remimarsal.prettier-now
- 37,031

[Prettier - Code formatter](https://github.com/prettier/prettier-vscode.git) VS Code plugin for prettier/prett ier

- esbenp.prettier-vscode
- **5,246,767**
- 4 stars
- Very complicated setup
- prettier-eslint and prettier-tslint are included with the installation of this extension. There is no need for a separate local or global install of either for functionality.
  - eslint, tslint, and all peer dependencies required by your specific configuration must be installed locally. Global installations will not be recognized.
  - `Unsure what this means`
- Requires: A whole ton of packages listed below. As does remark

[vscode-remark-lint](https://github.com/drewbourne/vscode-remark-lint) - Use remark & retext to lint Markdown

- drewbourne.vscode-remark-lint
- 145 (only)

[Markdown+Math](https://github.com/goessner/mdmath/blob/master/readme.md) LaTeX Math for Markdown

- Do I need this?
- Does it work with Pandoc, what is the relationship of pandoc to Latex
- goessner.mdmath
- 196,923
- 4.5 stars
- [mdmath](https://github.com/goessner/mdmath)
- Havent used yet, installed

[Markdown Todo](https://github.com/fabiospampinato/vscode-markdown-todo) Manage todo lists inside markdown files with ease.

- fabiospampinato.vscode-markdown-todo
- 734
- 5 stars
- Seems too similar to checkbox

[Color Highlight](https://github.com/sergiirocks/vscode-ext-color-highlight)

- naumovs.color-highlight
- Good

#### Functionality

[Markdown Extended](https://github.com/qjebbs/vscode-markdown-extended)
jebbs.markdown-extended
Markdownit not working

- has checkbox
- has paste table
- has table of contents
- has Admonition!
- Enhanced Anchor Link
- footnotes
- abbreviations
- superscript
- subscript
- internal shortcuts
- definition lists
- keyboard shortcuts
- doument attributes

[Markdown link extensions](https://github.com/TomasHubelbauer/vscode-markdown-link-suggestions)

[Markdown preview enhanced](https://github.com/shd101wyy/vscode-markdown-preview-enhanced) Markdown Preview Enhanced ported to vscode

- shd101wyy.markdown-preview-enhanced
- 731,341
  now replaced with @ work
  [Above w litvis](https://github.com/gicentre/vscode-markdown-preview-enhanced-with-litvis)
  needs further configuration -[Litvis](https://github.com/gicentre/litvis)

  **This one is apparently not working near as well as I'd hoped**

#### Live Code (Notebook Style)

[Run Snippets in Markdown](https://github.com/statiolake/vscode-markdown-run-snippet) Run code block inside your markdown file

- statiolake.vscode-markdown-run-snippet
- **132**

Markdown Script - A vscode extension to enhanced markdown code block

- Adds `click to copy | click to run` buttons.
  - Do I still need to use the code runner bit?
- axetroy.vscode-markdown-script
- 221

[Markdown Navigation](https://github.com/AlanWalk/markdown-navigation) Auto genreate markdown navigation panel to the activity bar.

- alanwalk.markdown-navigation
- 731
- Seems just like TOC
- Disabled
-
- jrieken.md-navigate

[Code Runner](https://github.com/formulahendry/vscode-code-runner.git) - Run code snippet or code file for multiple languages: C, C++, Java, JavaScript, PHP, Python, Perl, Perl 6, Ruby, Go, Lua, Groovy, PowerShell, BAT/CMD, BASH/SH, F# Script, F# (.NET Core), C# Script, C# (.NET Core), VBScript, TypeScript, CoffeeScript, Scala, Swift, Julia, Crystal, OCaml Script, R, AppleScript, Elixir, Visual Basic .NET, Clojure, Haxe, Objective-C, Rust, Racket, AutoHotkey, AutoIt, Kotlin, Dart, Free Pascal, Haskell, Nim, D, and custom command

- **Essential**
- formulahendry.code-runner
- 4.5 stars
- 4,180,703

#### Navigation

[Markdown Shortcuts](https://github.com/mdickin/vscode-markdown-shortcuts) Shortcuts for Markdown editing

- Disabled and replaced with Markdown Extended? which does have shortcutsMarkdown Shortcuts
- **mdickin.markdown-shortcuts**
- Uses the wrong bullets and italics by default.
- Does add icons for Bold, Italic, Strikethrough and Bullets to titlebar.
- 64,967
- Nope Markdown Extended needs this

Requires these Settings:

```json
    "markdownShortcuts.bullets.marker": "-",
    "markdownShortcuts.italics.marker": "*"
```

[Markdown TOC](https://github.com/AlanWalk/Markdown-TOC) -Markdown TOC(Table Of Contents) Plugin for Visual Studio Code.

- alanwalk.markdown-toc
- 82,759
- No longer needed disabled, but a repo for TOC



#### Additional Functions

[Markdown Checkbox](https://github.com/PKief/vscode-markdown-checkbox) -With this extension you can create checkboxes in markdown and mark them quickly.

- `pkief.markdown-checkbox`
- 29,610

**Draw Diagrams**

[yUML](https://github.com/jaime-olivares/vscode-yuml) - UML diagramming tool based on the yUML syntax

- jaimeolivares.yuml
- 25,868

[Markdown Table Prettifier](https://github.com/darkriszty/MarkdownTablePrettify-VSCodeExt)-Transforms markdown tables to be more readable.

- darkriszty.markdown-table-prettify
- 22,776
- Installed

* [ ] Home
* [ ] VM
* [ ] Work
* [ ] Laptop

[Auto-Open Markdown Preview](https://github.com/hnw/vscode-auto-open-markdown-preview) Open Markdown preview automatically when opening a Markdown file

- hnw.vscode-auto-open-markdown-preview
- 139,894
- 4.5 stars

[Badgen](https://github.com/idleberg/vscode-badgen) - Snippets to quickly insert Badgen badges into Markdown documents

- idleberg.badgen
- 59
- Unrated

```batch
> cd %USERPROFILE%\.vscode\extensions
$ cd ~/.vscode/extensions/
Clone repository as badgen:

$ git clone https://github.com/idleberg/vscode-badgen badgen
cd ~
mkdir .vscode
cd .vscode
mkdir extensions
 cd extensions
 git clone https://github.com/idleberg/vscode-badgen badgen
```

![npm:version](https://flat.badgen.net/npm/v/react)

#### Rendering and Viewing

[vscode-pandoc](https://github.com/dfinke/vscode-pandoc.git) Renders markdown through pandoc

- `dougfinke.vscode-pandoc`
- [Requires Pandoc](http://pandoc.org/installing.html)
  - But `choco install pandoc` works
- 23,333
- **Dont think I need this because of the other plugins I am using, I could try it**

[Probably need to pick apart this](https://code.visualstudio.com/docs/extensionAPI/api-markdown)
VS COde Docs

[vscode-markdownlint](https://github.com/DavidAnson/vscode-markdownlint) - Markdown linting and style checking for Visual Studio Code

- ?Essential
- markdownlint
- davidanson.vscode-markdownlint
- 2,572,173

[Prettier - Code formatter](https://github.com/prettier/prettier-vscode)
esbenp.prettier-vscode

#### Images

One of these was better than the rest. I need to do testing here.

[markdown image paste](https://github.com/njleonzhang/vscode-extension-mardown-image-paste) update tiny the picture, upload to github, and feedback you a link when paste a picture to markdown file (Translation, takes the picture, uploads the picture with a service called tinypng, then uploads it to github, and returns a web link)

**[Markdown Paste](https://github.com/telesoho/vscode-markdown-paste-image) A smartly paste for markdown.**

- telesoho.vscode-markdown-paste-image
- telesoho
- 12,034 users

[Paste Image](https://github.com/mushanshitiancai/vscode-paste-image) -paste image from clipboard directly

- `mushan.vscode-paste-image`
- mushan
- 26,782 users

> ```batch
> code --install-extension njleonzhang.markdown-image-paste
>
> npm install -g electron-image-ipc-server
>
> eiis # Needs to be run each time?
> ```

You can start the electron ipc server manually by command eiis

Markdown Imsize Support -Adds size-specified image syntax support to VS Code's builtin markdown preview

- Enable Image Resizing?
- amoosbr.markdown-imsize
- 486

#### Packs

[Markdown Extension Pack](https://marketplace.visualstudio.com/items?itemName=bat67.markdown-extension-pack)

- bat67.markdown-extension-pack
- 679,561
- 5 stars
- includes
  - Markdown All in One - All you need for Markdown (keyboard shortcuts, table of contents, auto preview and more).
  - markdownlint - Markdown/CommonMark linting and style checking for Visual Studio Code.
  - Markdown PDF - This extension convert Markdown file to pdf, html, png or jpeg file.
  - Markdown+Math - Mdmath allows to use Visual Studio Code as a markdown editor capable of typesetting and rendering TeX math. In fact it now reuses the built in markdown viewer. KaTeX works inside as a fast math renderer.
  - Markdown Preview Enhanced - Markdown Preview Enhanced is an extension that provides you with many useful functionalities such as automatic scroll sync, math typesetting, mermaid, PlantUML, pandoc, PDF export, code chunk, presentation writer, etc.
  - Markdown TOC - Generate TOC (table of contents) of headlines from parsed markdown file.
  - VS Live Share - Adds collaborative editing support directly into VS Code, which makes it possible to work on Markdown files with others in real-time!
  - Markdown Table Prettifier - Makes tables more readable for humans. Compatible with the Markdown writer plugin's table formatter feature in Atom.
  - Markdown Emoji - Adds :emoji: syntax support to VS Code's built-in Markdown **preview**

[Markdown All in One](https://github.com/neilsustc/vscode-markdown) All you need to write Markdown (keyboard shortcuts, table of contents, auto preview and more)

- yzhang.markdown-all-in-one
- 1,623,866
- 5 stars
- Includes
  - Shortcuts
  - TOC
  - List helpers
  - Github Flavored Markdown
  - Math
  - Autocompletions
  - Changes Open Preview to Toggle Preview (close with same command)
  - Adds AutoOpen
- **This is actually good**

#### Additional

[Copy Markdown as HTML](https://github.com/jerriep/copy-markdown-as-html)- Copies the selected text from a markdown document to the clipboard as HTML.

- jerriepelser.copy-markdown-as-html
- 18,115
- Only 3.5 Stars

Other Sources:

[Using]
Markdown Preview Enhanced with litvis
gicentre.markdown-preview-enhanced-with-litvis
giCentre574RepositoryLicense
Fork of markdown-preview-enhanced with added http://livis.org

Trying Markdown Preview Enhanced with Litvis
which also works with Prettier

Has these instructions

    Setup for VSCode users

    Via VSCode’s GUI

    Click on the extensions icon in the left panel, search for Markdown Preview Enhanced with litvis and click install.

    If you are using Markdown Preview Enhanced extension (from which this project was forked), temporary uninstall or disable it while you are trying out litvis.

    Via command line

    code --install-extension gicentre.markdown-preview-enhanced-with-litvis

    code --uninstall-extension shd101wyy.markdown-preview-enhanced
    VSCode does not support --disable-extension command, so if you want disable shd101wyy.markdown-preview-enhanced instead of uninstalling it, please do this via the app’s GUI.

    Getting started with litvis narratives

    Literate visualization uses Elm and Vega-Lite in the form of a declarative visualization language elm-vega. While you don't have to use elm-vega in a litvis document it does enable quick declarative generation of interactive data graphics and therefore considerably enhances the capability of a litvis document.

    Creating your own litvis narrative is as easy as writing a markdown file. You can start with exploring the examples available at https://github.com/gicentre/litvis/tree/master/examples.

    Formatting litvis narratives

    It is possible to automatically format litvis-enabled markdown files including embedded Elm code blocks with Prettier, which is an opinionated code formatting tool.

    Prettier is available in VSCode via prettier-vscode extension, but it does not format literate Elm code blocks in markdown files out of the box.

    Please follow these steps to enable full-featured formatting support for litvis in VSCode:

    Install esbenp.prettier-vscode package via VSCode’s Extensions panel or from a command line:

    code --install-extension esbenp.prettier-vscode
    Locally install Prettier and its Elm plugin via npm:

    npm init --yes
    npm install github:kachkaev/prettier#fix-global-plugin-api-dist prettier-plugin-elm
    Having a globally installed Prettier would be more convenient, but it is not supported by the VSCode extension yet.

    Installing from github:kachkaev/prettier#... instead of just prettier is necessary until prettier/prettier#4192 is merged.

    1) (optional) Configure Prettier by creating .prettierrc with the following yaml:

    ```yaml
    overrides:
    - files: "*.md"
    options:
        tabWidth: 4
    ```

    Doing this via bash:

    ```bash

c

    ```

    This will indent bullet point lists in markdowns with four spaces instead of two.

This works

Error is in Markdown extended
Nothing but admonition works

### Markdown Linting

Cycle through errors with **F8** and shift **F8**

#### Rules

MD001 heading-increment/header-increment - Heading levels should only increment by one level at a time
MD002 first-heading-h1/first-header-h1 - First heading should be a top level heading
MD003 heading-style/header-style - Heading style
MD004 ul-style - Unordered list style
MD005 list-indent - Inconsistent indentation for list items at the same level
**MD006 ul-start-left - Consider starting bulleted lists at the beginning of the line**
MD007 ul-indent - Unordered list indentation
**MD009 no-trailing-spaces - Trailing spaces**

**MD010 no-hard-tabs - Hard tabs**

**MD011 no-reversed-links - Reversed link syntax**
MD012 no-multiple-blanks - Multiple consecutive blank lines
MD013 line-length - Line length
MD014 commands-show-output - Dollar signs used before commands without showing output
**MD018 no-missing-space-atx - No space after hash on atx style heading**

**MD019 no-multiple-space-atx - Multiple spaces after hash on atx style heading**

**MD020 no-missing-space-closed-atx - No space inside hashes on closed atx style heading**

**MD021 no-multiple-space-closed-atx - Multiple spaces inside hashes on closed atx style heading**
MD022 blanks-around-headings/blanks-around-headers - Headings should be surrounded by blank lines
**MD023 heading-start-left/header-start-left - Headings must start at the beginning of the line**
MD024 no-duplicate-heading/no-duplicate-header - Multiple headings with the same content
MD025 single-h1 - Multiple top level headings in the same document
MD026 no-trailing-punctuation - Trailing punctuation in heading
**MD027 no-multiple-space-blockquote - Multiple spaces after blockquote symbol**

**MD028 no-blanks-blockquote - Blank line inside blockquote**
MD029 ol-prefix - Ordered list item prefix
MD030 list-marker-space - Spaces after list markers
MD031 blanks-around-fences - Fenced code blocks should be surrounded by blank lines
MD032 blanks-around-lists - Lists should be surrounded by blank lines
MD033 no-inline-html - Inline HTML
**MD034 no-bare-urls - Bare URL used**
MD035 hr-style - Horizontal rule style
MD036 no-emphasis-as-heading/no-emphasis-as-header - Emphasis used instead of a heading
**MD037 no-space-in-emphasis - Spaces inside emphasis markers**

**MD038 no-space-in-code - Spaces inside code span elements**

**MD039 no-space-in-links - Spaces inside link text**
MD040 fenced-code-language - Fenced code blocks should have a language specified
MD041 first-line-h1 - First line in file should be a top level heading
MD042 no-empty-links - No empty links
MD043 required-headings/required-headers - Required heading structure
MD044 proper-names - Proper names should have the correct capitalization
MD045 no-alt-text - Images should have alternate text (alt text)
See markdownlint's `Rules.md` (See link below) file for more details.

[`Rules.md`](https://github.com/DavidAnson/markdownlint/blob/master/doc/Rules.md)

**The bolded** rules above can be **automatically fixed** by moving the cursor to a rule violation (green underlined text) and typing `Ctrl+.` or clicking the light bulb icon.

#### Customization

Rules can be enabled, disabled, and customized by creating a JSON file named `.markdownlint.json` or a YAML file named `.markdownlint.yaml` in any directory of a project. The rules defined by `.markdownlint.{json,yaml}` apply to Markdown files in the same directory and any sub-directories without their own `.markdownlint.{json,yaml}.`

Note: .markdownlint.{json,yaml} is used only if a project has been opened. When no folder is open or a file is not part of the current project, normal user and workspace settings apply (see below). If both .markdownlint.json and .markdownlint.yaml are present in the same directory, only .markdownlint.json is used.

[Rule Definitions](https://github.com/DavidAnson/vscode-markdownlint)

A custom configuration is often defined by a .markdownlint.json file in the root of the project:

{
"default": true,
"MD003": { "style": "atx_closed" },
"MD007": { "indent": 4 },
"no-hard-tabs": false
}
To extend another configuration file, any configuration file can use the extends property to provide a relative path:

{
"extends": "../.markdownlint.json",
"no-hard-tabs": true
}
Files referenced via extends do not need to be part of the current project (but usually are).

Rules can also be configured using Code's support for user and workspace settings.

The earlier configuration might look like the following in Code's user settings:

{
"editor.someSetting": true,
"markdownlint.config": {
"default": true,
"MD003": { "style": "atx_closed" },
"MD007": { "indent": 4 },
"no-hard-tabs": false
}
}
Rule locations have the following precedence (in decreasing order):

.markdownlint.{json,yaml} file in the same directory
.markdownlint.{json,yaml} file in a parent directory
.markdownlint.{json,yaml} file in the root of the project
Visual Studio Code user/workspace settings
Default configuration (see above)
Changes saved to any of these locations take effect immediately. Files referenced via extends are not monitored for changes. Only the bottom two locations apply to files outside the project.

See markdownlint's options.config section for more information about rule configuration.

markdownlint.ignore

If a workspace contains generated content or other Markdown files that trigger warnings but cannot be fixed, it may be helpful to ignore (skip) those files when linting. This can be done by updating the user/workspace configuration with a glob expression matching the relevant file names.

An example from Code's workspace settings might be:

{
"editor.someSetting": true,
"markdownlint.ignore": [

"ignore.md",

"directory/ignore.md",

"\*\*/ignore.md",

"\*_/_.md"

]
}
The globbing library used for matching file names is minimatch with the dot and nocomment options enabled. Matching is case-sensitive and paths are resolved relative to the root of the workspace. The directory separator is /, even on Windows.

markdownlint.run

By default, linting is performed as you type or edit a document. Linting is fast and efficient and should not interfere with typical workflows.

If you find this distracting, linting can be configured to run only when the document is saved. This looks like the following in Code's user settings:

{
"editor.someSetting": true,
"markdownlint.run": "onSave"
}

## Other errors

### Proxy and Download or Connection errors

Cneck to see if proxy is used and user vs work settings

```json
    //anywhere but work
    "http.proxy": "",
    //work
    //"http.proxy": "https://swmed.proxy.edu:3128",
   // "https.proxy": "https://swmed.proxy.edu:3128",
```

#### **Classpass is Incomplete Error**

Check the **settings.json** `java.home` variable. I think its sharing settings and one computer has JDK 8 161 still.

- Laptop has
  - jdk/jre 1.8.0_162
  - jdk 1.8.0_181
  - jdk/jre 9.0.4
  - jdk/jre/jdk(open) 10
- Home PC has- -
- WorkPC has- -
- MiniLaptop has- -
- DevPC has: -
- NewDev has: -
  Like work PC- Laptop set to:

```json
        // On Windows, backslashes must be escaped, i.e.
        // "java.home":"C:\\Program Files\\Java\\jdk1.8.0_161"
        "java.home": null
//Changed To
 "java.home": "C:\\Program Files\\Java\\jdk-10",
```

Also the Java_Home Var.

[VS Code Docs](https://code.visualstudio.com/docs/editor/integrated-terminal#_changing-how-the-terminal-is-rendered)

[Prettier Configuration](https://prettier.io/docs/en/configuration.html)

requires: `.prettierrc.json` file.
[Remark GitHub](https://github.com/remarkjs/remark)


!!!warn GitHub GIST ID for Settings Sync
    60c9fd462ef31067f7c7c7dd1a89aafd

!!!warning Personal Access Token on GitHub
      e253b1882c10bb5edea7dd8b91a26b8c9d47c33a

Currently Using Remark

#### Error NPM ": not foundram Files/nodejs/npm:"

Need node.js, and npm

I get this error at work. Its because if a Windows and WSL installation side by side I think and they are competing.

```
: not foundram Files/nodejs/npm: 3: /mnt/c/Program Files/nodejs/npm:
: not foundram Files/nodejs/npm: 5: /mnt/c/Program Files/nodejs/npm:
/mnt/c/Program Files/nodejs/npm: 6: /mnt/c/Program Files/nodejs/npm: Syntax error: word unexpected (expecting "in")
```

To fix, used RapidEE and from path (User and System) had to remove:

`C:\Program Files\nodejs\`

`C:\Users\s163837\AppData\Roaming\npm`

and it worked again

(install WSL Windows linux subsystem)
Then Run: from bash:

```bash
sudo apt-get install node.js

sudo apt-get install npm

npm install --save unified prettier remark-frontmatter remark-retext retext-english retext-syntax-urls retext-spell dictionary-en-us retext-sentence-spacing retext-repeated-words retext-usage remark-preset-lint-consistent remark-preset-lint-recommended remark-preset-lint-markdown-style-guide remark-collapse

//npm install --save prettier remark-collapse
```

This apparently really should be run from within vscode! in the right directory.

```bash
Andy@VM-DEVENV : C:\ASUSsync\VS Code : 10/7/2018 10:41:44 PM : PS>npm install --save unified remark-frontmatter remark-retext retext-english retext-syntax-urls retext-spell dictionary-en-us retext-sentence-spacing retext-repeated-words retext-usage remark-preset-lint-consistent remark-preset-lint-recommended remark-preset-lint-markdown-style-guide prettier remark-collapse  remark-cli remark-preset-lint-markdown-style-guide
#??? --global flag?
# remark-cli
Extensions:

#yields:
npm http GET https://registry.npmjs.org/copy-descriptor
npm http GET https://registry.npmjs.org/isobject
npm http 304 https://registry.npmjs.org/copy-descriptor
npm http 304 https://registry.npmjs.org/isobject
npm http GET https://registry.npmjs.org/extend-shallow
npm http 304 https://registry.npmjs.org/extend-shallow
npm http GET https://registry.npmjs.org/co
npm http GET https://registry.npmjs.org/sliced
npm http 304 https://registry.npmjs.org/co
npm http 304 https://registry.npmjs.org/sliced
npm http GET https://registry.npmjs.org/sprintf-js
npm http 304 https://registry.npmjs.org/sprintf-js
npm http GET https://registry.npmjs.org/unist-util-visit-parents
npm http GET https://registry.npmjs.org/unist-util-is
npm http 304 https://registry.npmjs.org/unist-util-visit-parents
npm http 304 https://registry.npmjs.org/unist-util-is
npm http GET https://registry.npmjs.org/isarray
npm http 304 https://registry.npmjs.org/isarray
npm http GET https://registry.npmjs.org/assign-symbols
npm http 304 https://registry.npmjs.org/assign-symbols
npm http GET https://registry.npmjs.org/wrapped
npm http 304 https://registry.npmjs.org/wrapped
npm http GET https://registry.npmjs.org/is-buffer
npm http 304 https://registry.npmjs.org/is-buffer
npm http GET https://registry.npmjs.org/co
npm http GET https://registry.npmjs.org/sliced
npm http GET https://registry.npmjs.org/unist-util-visit-parents
npm http 304 https://registry.npmjs.org/sliced
npm http 304 https://registry.npmjs.org/co
npm http 304 https://registry.npmjs.org/unist-util-visit-parents
npm http GET https://registry.npmjs.org/unist-util-is
npm http 304 https://registry.npmjs.org/unist-util-is
npm http GET https://registry.npmjs.org/wrapped
npm http 304 https://registry.npmjs.org/wrapped
npm http GET https://registry.npmjs.org/co
npm http GET https://registry.npmjs.org/sliced
npm http GET https://registry.npmjs.org/unist-util-visit-parents
npm http 304 https://registry.npmjs.org/sliced
npm http 304 https://registry.npmjs.org/co
npm http 304 https://registry.npmjs.org/unist-util-visit-parents
npm http GET https://registry.npmjs.org/unist-util-is
npm http 304 https://registry.npmjs.org/unist-util-is
dictionary-en-us@2.0.0 node_modules\dictionary-en-us

remark-collapse@0.1.2 node_modules\remark-collapse
├── mdast-util-heading-range@2.1.0
└── mdast-util-to-string@1.0.5

retext-sentence-spacing@2.0.1 node_modules\retext-sentence-spacing
├── nlcst-to-string@2.0.2
├── unist-util-is@2.1.2
├── unist-util-visit@1.4.0 (unist-util-visit-parents@2.0.1)
└── plur@2.1.2 (irregular-plurals@1.4.0)

retext-syntax-urls@1.0.0 node_modules\retext-syntax-urls
├── unist-util-position@3.0.1
├── nlcst-to-string@2.0.2
└── unist-util-modify-children@1.1.2 (array-iterate@1.1.2)

unified@7.0.0 node_modules\unified
├── bail@1.0.3
├── is-plain-obj@1.1.0
├── trough@1.0.3
├── x-is-string@0.1.0
├── extend@3.0.2
└── vfile@3.0.0 (replace-ext@1.0.0, is-buffer@2.0.3, vfile-message@1.0.1, unist-util-stringify-position@1.1.2)

retext-repeated-words@1.2.1 node_modules\retext-repeated-words
├── unist-util-is@2.1.2
├── unist-util-visit@1.4.0 (unist-util-visit-parents@2.0.1)
└── nlcst-to-string@2.0.2

remark-frontmatter@1.3.0 node_modules\remark-frontmatter
├── xtend@4.0.1
└── fault@1.0.2 (format@0.2.2)

retext-spell@2.3.1 node_modules\retext-spell
├── lodash.includes@4.3.0
├── quotation@1.1.1
├── nlcst-is-literal@1.1.2
├── nlcst-to-string@2.0.2
├── unist-util-visit@1.4.0 (unist-util-visit-parents@2.0.1)
└── nspell@1.0.5 (is-buffer@1.1.6, trim@0.0.1)

retext-english@3.0.0 node_modules\retext-english
├── unherit@1.1.1 (inherits@2.0.3, xtend@4.0.1)
└── parse-english@4.1.1 (nlcst-to-string@2.0.2, unist-util-visit-children@1.1.2, unist-util-modify-children@1.1.2, parse-latin@4.1.1)

remark-retext@3.1.1 node_modules\remark-retext
└── mdast-util-to-nlcst@3.2.0 (unist-util-position@3.0.1, repeat-string@1.6.1, vfile-location@2.0.3, nlcst-to-string@2.0.2)

retext-usage@0.5.0 node_modules\retext-usage
├── array-differ@1.0.0
├── nlcst-to-string@1.1.0
├── quotation@1.1.1
├── object-keys@1.0.12
└── nlcst-search@1.5.0 (nlcst-normalize@2.1.2, unist-util-visit@1.4.0, nlcst-is-literal@1.1.2)

prettier@1.14.3 node_modules\prettier

remark-cli@5.0.0 node_modules\remark-cli
├── markdown-extensions@1.1.1
├── unified-args@5.1.0 (camelcase@4.1.0, json5@0.5.1, text-table@0.2.0, minimist@1.2.0, chalk@2.4.1, unified-engine@5.1.0, chokidar@1.7.0)
└── remark@9.0.0 (unified@6.2.0, remark-parse@5.0.0, remark-stringify@5.0.0)

remark-preset-lint-recommended@3.0.2 node_modules\remark-preset-lint-recommended
├── remark-lint@6.0.2 (remark-message-control@4.1.0)
├── remark-lint-no-shortcut-reference-link@1.0.3 (unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-no-auto-link-without-protocol@1.0.2 (mdast-util-to-string@1.0.5, unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-no-blockquote-without-marker@2.0.2 (vfile-location@2.0.3, unist-util-position@3.0.1, unist-util-visit@1.4.0, unified-lint-rule@1.0.3, unist-util-generated@1.1.2)
├── remark-lint-ordered-list-marker-style@1.0.2 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-no-literal-urls@1.0.2 (mdast-util-to-string@1.0.5, unist-util-position@3.0.1, unist-util-visit@1.4.0, unified-lint-rule@1.0.3, unist-util-generated@1.1.2)
├── remark-lint-final-newline@1.0.2 (unified-lint-rule@1.0.3)
├── remark-lint-no-undefined-references@1.0.2 (unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-no-inline-padding@1.0.2 (mdast-util-to-string@1.0.5, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-no-unused-definitions@1.0.2 (unified-lint-rule@1.0.3, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-no-shortcut-reference-image@1.0.2 (unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-list-item-indent@1.0.2 (plur@3.0.1, unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-list-item-bullet-indent@1.0.2 (plur@3.0.1, unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-hard-break-spaces@1.0.3 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-no-duplicate-definitions@1.0.2 (unist-util-stringify-position@1.1.2, unist-util-position@3.0.1, unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
└── remark-lint-no-heading-content-indent@1.0.2 (mdast-util-heading-style@1.0.4, plur@3.0.1, unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)

remark-preset-lint-consistent@2.0.2 node_modules\remark-preset-lint-consistent
├── remark-lint@6.0.2 (remark-message-control@4.1.0)
├── remark-lint-strong-marker@1.0.2 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-heading-style@1.0.2 (mdast-util-heading-style@1.0.4, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-code-block-style@1.0.2 (unist-util-visit@1.4.0, unist-util-generated@1.1.2, unist-util-position@3.0.1, unified-lint-rule@1.0.3)
├── remark-lint-link-title-style@1.0.2 (vfile-location@2.0.3, unist-util-visit@1.4.0, unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-generated@1.1.2)
├── remark-lint-checkbox-character-style@1.0.2 (vfile-location@2.0.3, unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-position@3.0.1)
├── remark-lint-emphasis-marker@1.0.2 (unified-lint-rule@1.0.3, unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-blockquote-indentation@1.0.2 (mdast-util-to-string@1.0.5, plur@3.0.1, unist-util-visit@1.4.0, unified-lint-rule@1.0.3, unist-util-position@3.0.1, unist-util-generated@1.1.2)
├── remark-lint-ordered-list-marker-style@1.0.2 (unist-util-visit@1.4.0, unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-generated@1.1.2)
├── remark-lint-list-item-content-indent@1.0.2 (plur@3.0.1, unist-util-visit@1.4.0, unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
├── remark-lint-rule-style@1.0.2 (unist-util-position@3.0.1, unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
├── remark-lint-fenced-code-marker@1.0.2 (unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-position@3.0.1, unist-util-visit@1.4.0)
└── remark-lint-table-cell-padding@1.0.2 (unist-util-visit@1.4.0, unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)

remark-preset-lint-markdown-style-guide@2.1.2 node_modules\remark-preset-lint-markdown-style-guide
├── remark-lint@6.0.2 (remark-message-control@4.1.0)
├── remark-lint-no-file-name-consecutive-dashes@1.0.2 (unified-lint-rule@1.0.3)
├── remark-lint-no-file-name-outer-dashes@1.0.3 (unified-lint-rule@1.0.3)
├── remark-lint-heading-increment@1.0.2 (unist-util-visit@1.4.0, unified-lint-rule@1.0.3, unist-util-generated@1.1.2)
├── remark-lint-no-file-name-articles@1.0.2 (unified-lint-rule@1.0.3)
├── remark-lint-link-title-style@1.0.2 (vfile-location@2.0.3, unist-util-visit@1.4.0, unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
├── remark-lint-table-pipe-alignment@1.0.2 (unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-position@3.0.1)
├── remark-lint-no-duplicate-headings@1.0.2 (unist-util-stringify-position@1.1.2, mdast-util-to-string@1.0.5, unist-util-visit@1.4.0, unist-util-generated@1.1.2, unist-util-position@3.0.1, unified-lint-rule@1.0.3)
├── remark-lint-hard-break-spaces@1.0.3 (unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-table-pipes@1.0.2 (unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0, unist-util-position@3.0.1)
├── remark-lint-no-heading-punctuation@1.0.2 (mdast-util-to-string@1.0.5, unified-lint-rule@1.0.3, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-maximum-line-length@1.1.0 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-heading-style@1.0.2 (mdast-util-heading-style@1.0.4, unified-lint-rule@1.0.3, unist-util-visit@1.4.0, unist-util-generated@1.1.2)
├── remark-lint-no-shell-dollars@1.0.2 (unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
├── remark-lint-ordered-list-marker-value@1.0.2 (unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-no-blockquote-without-marker@2.0.2 (vfile-location@2.0.3, unist-util-visit@1.4.0, unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-generated@1.1.2)
├── remark-lint-unordered-list-marker-style@1.0.2 (unified-lint-rule@1.0.3, unist-util-position@3.0.1, unist-util-visit@1.4.0, unist-util-generated@1.1.2)
├── remark-lint-rule-style@1.0.2 (unist-util-generated@1.1.2, unist-util-position@3.0.1, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-file-extension@1.0.2 (unified-lint-rule@1.0.3)
├── remark-lint-no-emphasis-as-heading@1.0.2 (unist-util-visit@1.4.0, unified-lint-rule@1.0.3, unist-util-generated@1.1.2)
├── remark-lint-fenced-code-marker@1.0.2 (unist-util-generated@1.1.2, unist-util-position@3.0.1, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-strong-marker@1.0.2 (unified-lint-rule@1.0.3, unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-final-definition@1.0.2 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-maximum-heading-length@1.0.2 (mdast-util-to-string@1.0.5, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-no-multiple-toplevel-headings@1.0.2 (unist-util-stringify-position@1.1.2, unified-lint-rule@1.0.3, unist-util-position@3.0.1, unist-util-visit@1.4.0, unist-util-generated@1.1.2)
├── remark-lint-no-auto-link-without-protocol@1.0.2 (mdast-util-to-string@1.0.5, unified-lint-rule@1.0.3, unist-util-generated@1.1.2, unist-util-position@3.0.1, unist-util-visit@1.4.0)
├── remark-lint-no-shortcut-reference-link@1.0.3 (unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-no-shortcut-reference-image@1.0.2 (unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-fenced-code-flag@1.0.2 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-list-item-content-indent@1.0.2 (plur@3.0.1, unist-util-generated@1.1.2, unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-table-cell-padding@1.0.2 (unist-util-generated@1.1.2, unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-definition-spacing@1.0.2 (unist-util-position@3.0.1, unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
├── remark-lint-list-item-indent@1.0.2 (plur@3.0.1, unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-code-block-style@1.0.2 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3, unist-util-visit@1.4.0)
├── remark-lint-blockquote-indentation@1.0.2 (mdast-util-to-string@1.0.5, plur@3.0.1, unified-lint-rule@1.0.3, unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-emphasis-marker@1.0.2 (unist-util-position@3.0.1, unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
├── remark-lint-no-table-indentation@1.0.2 (unist-util-position@3.0.1, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-no-inline-padding@1.0.2 (mdast-util-to-string@1.0.5, unist-util-generated@1.1.2, unist-util-visit@1.4.0, unified-lint-rule@1.0.3)
├── remark-lint-no-literal-urls@1.0.2 (mdast-util-to-string@1.0.5, unified-lint-rule@1.0.3, unist-util-generated@1.1.2, unist-util-position@3.0.1, unist-util-visit@1.4.0)
├── remark-lint-no-file-name-mixed-case@1.0.2 (unified-lint-rule@1.0.3)
├── remark-lint-definition-case@1.0.2 (unist-util-position@3.0.1, unified-lint-rule@1.0.3, unist-util-generated@1.1.2, unist-util-visit@1.4.0)
├── remark-lint-ordered-list-marker-style@1.0.2 (unist-util-generated@1.1.2, unist-util-visit@1.4.0, unist-util-position@3.0.1, unified-lint-rule@1.0.3)
├── remark-lint-no-file-name-irregular-characters@1.0.2 (unified-lint-rule@1.0.3)
├── remark-lint-no-consecutive-blank-lines@1.0.2 (plur@3.0.1, unist-util-visit@1.4.0, unist-util-position@3.0.1, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
└── remark-lint-list-item-spacing@1.1.2 (unist-util-position@3.0.1, unist-util-visit@1.4.0, unist-util-generated@1.1.2, unified-lint-rule@1.0.3)
Andy@VM-DEVENV : C:\ASUSsync\VS Code : 10/7/2018 10:47:32 PM : PS>

```

## MaxLint

MaxLint | yaksoy.maxlint | Fix errors from ESLint

    requires

Java Extension Pack | vscjava.vscode-java-pack

Atom One Dark Theme | akamud.vscode-theme-onedark

One Dark Pro | zhuangtongfa.material-theme

Auto-Open Markdon Preview | hnw.vscode-auto-open-markdown-preview

Code Runner | formulahendry.code-runner

Markdown Checkbox | pkief.markdown-checkbox

Markdown Emoji | bierner.markdown-emoji

Markdown Extension Pack\*| bat67.markdown-extension-pack

Markdown Header Coloring | satokaz.vscode-markdown-header-coloring

Auto Close Tag
formulahendry.auto-close-tag
Auto-Open Markdown Preview
hnw.vscode-auto-open-markdown-preview
Markdown Header Coloring
satokaz.vscode-markdown-header-coloring

By installing Java Extension Pack, the following extensions are installed:

- 📦 Language Support for Java™ by Red Hat
- 📦 Debugger for Java
- 📦 Java Test Runner
- 📦 Maven Project Explorer

- Markdown All in One - All you need for Markdown (keyboard shortcuts, table of contents, auto preview and more).
- markdownlint - Markdown/CommonMark linting and style checking for Visual Studio Code.
- Markdown PDF - This extension convert Markdown file to pdf, html, png or jpeg file.
- Markdown+Math - Mdmath allows to use Visual Studio Code as a markdown editor capable of typesetting and rendering TeX math. In fact it now reuses the built in markdown viewer. KaTeX works inside as a fast math renderer.
- Markdown Preview Enhanced - Markdown Preview Enhanced is an extension that provides you with many useful functionalities such as automatic scroll sync, math typesetting, mermaid, PlantUML, pandoc, PDF export, code chunk, presentation writer, etc.
- Markdown TOC - Generate TOC (table of contents) of headlines from parsed markdown file.
- VS Live Share - Adds collaborative editing support directly into VS Code, which makes it possible to work on Markdown files with others in real-time!
- Markdown Table Prettifier - Makes tables more readable for humans. Compatible with the Markdown writer plugin's table formatter feature in Atom.
- Markdown Emoji - Adds :emoji: syntax support to VS Code's built-in Markdown preview

```batch
code --install-extension akamud.vscode-theme-onedark
code --install-extension AlanWalk.markdown-navigation
code --install-extension AlanWalk.markdown-toc
code --install-extension bat67.markdown-extension-pack
code --install-extension bierner.markdown-emoji
code --install-extension darkriszty.markdown-table-prettify
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension drewbourne.vscode-remark-lint
code --install-extension esbenp.prettier-vscode
code --install-extension fabiospampinato.vscode-markdown-todo
code --install-extension formulahendry.code-runner
code --install-extension goessner.mdmath
code --install-extension hnw.vscode-auto-open-markdown-preview
code --install-extension jasonroger.markdown-preview-enhanced-fork
code --install-extension johnpapa.winteriscoming
code --install-extension josefpihrt-vscode.snippetica-markdown
code --install-extension joshbax.mdhelper
code --install-extension marvhen.reflow-markdown
code --install-extension mrmlnc.vscode-remark
code --install-extension ms-python.python
code --install-extension ms-vscode.PowerShell
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension nicollasricas.vscode-witcherscript
code --install-extension nicollasricas.vscode-witcherscript-addon
code --install-extension njLeonZhang.markdown-image-paste
code --install-extension PKief.markdown-checkbox
code --install-extension redhat.java
code --install-extension remimarsal.prettier-now
code --install-extension satokaz.vscode-markdown-header-coloring
code --install-extension shd101wyy.markdown-preview-enhanced
code --install-extension statiolake.vscode-markdown-run-snippet
code --install-extension TomasHubelbauer.vscode-markdown-link-suggestions
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-pack
code --install-extension vscjava.vscode-java-test
code --install-extension vscjava.vscode-maven
code --install-extension yzane.markdown-pdf
code --install-extension yzhang.markdown-all-in-one
code --install-extension zhuangtongfa.Material-theme

```

## Setup

xargs isnt working on this pc for some reason -Dev

Try

```
code --list-extensions > extensions-[compName].list
foreach($line in get-content extensions.list) {code --install-extension $($line)}

```

add :
code --list-extensions > extensions-WorkComputer.list
foreach($line in get-content extensions.list) {code --install-extension$(\$line)}

```vscode
code --install-extension jsaulou.theme-by-language
tomashubelbauer.vscode-markdown-link-suggestions

```

### Other Extensions

For Batch, cmd and other linting I've been using **batch format** zhaofinger.batch-format but there ought to be something better.

From work -
coenraads.bracket-pair-colorizer
alefragnani.bookmarks
shan.code-settings-sync
jsaulou.theme-by-language
tyriar.shell-launcher

Bookmarks alefragnani.bookmarks
Bracket Pair Colorizer coenraads.bracket-pair-colorizer
C/C++ ms-vscode.cpptools
Code Runner formulahendry.code-runner
Rainbow CSV mechatroner.rainbow-csv

Microsoft Go
Shell launcher tyriar.shell-launcher - good needs configuration
Theme by language
jsaulou.theme-by-language

### Sync Local Settings

[Sync Local Settings Docs](http://shanalikhan.github.io/2016/07/31/Visual-Studio-code-sync-setting-edit-manually.html)

[Older Settings](http://shanalikhan.github.io/2017/02/19/Option-to-ignore-settings-folders-code-settings-sync.html)

+++++ CRITICAL Settings Sync shan.code-settings-sync

filename syncLocalSettings.json
location C:\Users\s163837\AppData\Roaming\Code\User\syncLocalSettings.json

```json
{
  "ignoreUploadFiles": [
    "projects.json",
    "projects_cache_vscode.json",
    "projects_cache_git.json",
    "projects_cache_svn.json",
    "gpm_projects.json",
    "gpm-recentItems.json"
  ],
  "ignoreUploadFolders": ["workspaceStorage"],
  "ignoreExtensions": [],
  "replaceCodeSettings": {},
  "gistDescription": "Visual Studio Code Settings Sync Gist",
  "version": 322,
  "token": "42f036ddf09423c1c049c3c46ef3a06cb1705b68",
  "downloadPublicGist": false,
  "supportedFileExtensions": ["json", "code-snippets"],
  "openTokenLink": true,
  "disableUpdateMessage": false,
  "lastUpload": "2018-12-10T22:01:52.238Z",
  "lastDownload": null,
  "githubEnterpriseUrl": null,
  "askGistName": false,
  "customFiles": {},
  "hostName": null,
  "useCliBaseInstallation": true
}
```

Read-Only Indicator alefragnani.read-only-indicator
R ikuyadeu.r
R LSP Client
reditorsupport.r-lsp
Quokka.js
wallabyjs.quokka-vscode

=

-highly rated, unsure what it does
Python Extension Pack
donjayamanne.python-extension-pack
Python

Project Manager
alefragnani.project-manager
Prettier - Code formatter
esbenp.prettier-vscode
PowerShell
Path Intellisense
christian-kohler.path-intellisense
code --install-extension ms-python.python
code --install-extension donjayamanne.jupyter
code --install-extension donjayamanne.python-extension-pack
code --install-extension alefragnani.project-manager
code --install-extension
code --install-extension
Language Support for Java(TM) by Red Hat
redhat.java
Preview

Jupyter
donjayamanne.jupyter
Preview

Jupyter
donjayamanne.jupyter
Preview

## Other Extensions

Trailing Semicolon
naumovs.trailing-semicolon
Sergii Naumov3,681Repository
Provides the command to append semicolon to the end of current line.

Shell launcher
tyriar.shell-launcher
Daniel Imms33,499RepositoryLicense
Easily launch multiple shell configurations in the terminal
Reload to Activate

Start any shell
remcoros.startanyshell
Remco Ros29,180RepositoryLicense
Start any shell from VS Code, configurable from user settings.


### MAYBES

Selection Encase brandoncravener.selection-encase - i think this is the default behaviour, but if not get this.
Quick Task
lkytal.quicktask
npm
eg2.vscode-npm-script
-isnt this by default as well?

Maven for Java
vscjava.vscode-maven
Preview
Maven for Java
vscjava.vscode-maven
Preview

### Shell Launcher

Key Binding set to Ctrl + \` Ctrl + \` (Double Press)

```json
  "shellLauncher.shells.windows": [
    {
      "shell": "C:\\Windows\\System32\\cmd.exe",
      "args": [],
      "label": "CMD"
    },
    {
      "shell": "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe",
      "args": [],
      "label": "PowerShell"
    },
    {
      "shell": "C:\\Program Files\\Git\\bin\\bash.exe",
      "args": [],
      "label": "Git bash"
    },
    {
      "shell": "C:\\Windows\\System32\\bash.exe",
      "args": [],
      "label": "Bash"
    },
    {
      "shell": "C:\\Windows\\System32\\wsl.exe",
      "args": [],
      "label": "WSL"
    }
  ]
```

## Work Config

WSL alt 2639

hx

## Errors Encountered

### code-runner.run not found

Changed

```json
"code-runner.runInTerminal": true
```

Still not running.

Could be that terminal is wsl, and python in windows.

Tried:

```json
"py2": "/mnt/c/windows/py.exe -2 -c",
```

but still not working, may be this:

[Share ENV btw windows and wsl](https://blogs.msdn.microsoft.com/commandline/2017/12/22/share-environment-vars-between-wsl-and-windows/)

Trying to install python on wsl

sudo apt update
sudo apt install python python3 pip openjdk-11-jdk

### Using WSL - no such file or directory

```bash
andy@DESKTOP:/mnt/c/ASUSsync/VS Code$ C:/Windows/py.exe -m pip install -U jedi --user
-bash: C:/Windows/py.exe: No such file or directory
```

Changed to **/mnt/c/Windows/py.exe** -m pip install -U autopep8 --user

which worked

WSLENV=GOPATH/l:USERPROFILE/w:SOMEVAR/wp

## Appearance

make selected interface elements a different color
```json

  "workbench.colorCustomizations": {
    "titleBar.border": "#05080A",
    "list.activeSelectionBackground": "#05080A",
    "list.inactiveSelectionBackground": "#05080A",
    "tab.inactiveBackground": "#05080A",
    "editorGroupHeader.tabsBackground": "#05080A",
    "editorGroupHeader.noTabsBackground": "#05080A",
    "activityBar.background": "#05080A",
    "sideBar.background": "#05080A",
    "sideBarSectionHeader.background": "#05080A",
    "activityBar.border": "#0b1015",
    "tab.border": "#0b1015",
    "panel.border": "#05080A",
    "statusBar.border": "#05080A"
  }
  ```

  ```json
{
    "workbench.iconTheme": "vscode-icons",
    "editor.fontFamily": "Operator Mono SSM Lig",
    "editor.lineHeight": 25,
    "editor.fontLigatures": true,
    "explorer.decorations.badges": false,
    "editor.fontSize": 14,
    "editor.letterSpacing": 0.5,
    "editor.fontWeight": "400",
    "editor.renderWhitespace": "none",
    "workbench.statusBar.feedback.visible": false,
    "editor.rulers": [
        80,
        100,
        120
    ],
    "whiteviz.maximumLimit": 500,
    "whiteviz.expandedTabIndicator": false,
    "editor.occurrencesHighlight": true,
    "workbench.tree.horizontalScrolling": true,
    "editor.cursorStyle": "line-thin",
    "editor.showFoldingControls": "always",
    "editor.matchBrackets": true
}
```
### Font

```json
    "editor.fontSize": 16,
    "editor.fontWeight": "700",
    "editor.fontFamily": "'Roboto Mono', Hasklig",
       "editor.fontLigatures": true,
```

## Code Command Line

```batch
code -h

Visual Studio Code 1.29.1

Usage: code.exe [options] [paths...]

To read output from another program, append '-' (e.g. 'echo Hello World | code -')

Options:
  -d, --diff <file> <file>           Compare two files with each other.
  -a, --add <dir>                    Add folder(s) to the last active window.
  -g, --goto <file:line[:character]> Open a file at the path on the specified
                                     line and character position.
  -n, --new-window                   Force to open a new window.
  -r, --reuse-window                 Force to open a file or folder in an
                                     already opened window.
  -w, --wait                         Wait for the files to be closed before
                                     returning.
  --locale <locale>                  The locale to use (e.g. en-US or zh-TW).
  --user-data-dir <dir>              Specifies the directory that user data is
                                     kept in. Can be used to open multiple
                                     distinct instances of Code.
  -v, --version                      Print version.
  -h, --help                         Print usage.

Extensions Management:
  --extensions-dir <dir>
      Set the root path for extensions.
  --list-extensions
      List the installed extensions.
  --show-versions
      Show versions of installed extensions, when using --list-extension.
  --uninstall-extension (<extension-id> | <extension-vsix-path>)
      Uninstalls an extension.
  --install-extension (<extension-id> | <extension-vsix-path>)
      Installs or updates the extension. Use `--force` argument to avoid prompts.
  --enable-proposed-api (<extension-id>)
      Enables proposed API features for extensions. Can receive one or more extension IDs to enable individually.

Troubleshooting:
  --verbose                          Print verbose output (implies --wait).
  --log <level>                      Log level to use. Default is 'info'.
                                     Allowed values are 'critical', 'error',
                                     'warn', 'info', 'debug', 'trace', 'off'.
  -s, --status                       Print process usage and diagnostics
                                     information.
  -p, --performance                  Start with the 'Developer: Startup
                                     Performance' command enabled.
  --prof-startup                     Run CPU profiler during startup
  --disable-extensions               Disable all installed extensions.
  --disable-extension <extension-id> Disable an extension.
  --inspect-extensions               Allow debugging and profiling of
                                     extensions. Check the developer tools for
                                     the connection URI.
  --inspect-brk-extensions           Allow debugging and profiling of
                                     extensions with the extension host being
                                     paused after start. Check the developer
                                     tools for the connection URI.
  --disable-gpu                      Disable GPU hardware acceleration.
  --upload-logs                      Uploads logs from current session to a
                                     secure endpoint.
  --max-memory                       Max memory size for a window (in Mbytes).
```

## Backup

Will set an operation in task scheduler. Not working right now

```batch
Set Environment Variable on all machines

setx ASUSsync "D:\ASUSsync\"
mkdir %ASUSsync%\Backups



cd /d D:\

C:\"Program Files"\7-Zip\7z.exe a "VS Code Archive\_%Date%" %ASUSsync%\"VS Code"\* -w %ASUSsyncBU%\ -x @%ASUSsync%\"VS Code"\BackUpExclude.txt -m=bzip2 -r -sns -spf
7z.exe a[add][archive name] [what to add][flags]
```

Using WinRar

```batch
"C:\Program Files\WinRar\WinRAR.exe"
#To Add
cd d:\SaveDirectory
"C:\Program Files\WinRar\WinRAR.exe" a fileName.rar "D:\ASUSsync\VS Code\md\*

#Append date to filename with -ag
mkdir d:\asussync\backups\
"C:\Program Files\WinRar\WinRAR.exe" a -ag+YYMMDD "D:\ASUSsync\Backups\vsCodeBackUp.rar" "D:\ASUSsync\VS Code\md\*"  "D:\ASUSsync\ASUSVS-WorkSpace.code-workspace" "D:\ASUSsync\VS Code\.vscode\*"

#Using a file list and using version numbers and month string
"C:\Program Files\WinRar\WinRAR.exe" a -ag+YYMMM{v}nn-- -@+ "D:\ASUSsync\Backups\vsCodeBackUp.rar" @"D:\Asussync\backups\backups.txt"

#Make it universal using EnvVars
##Update for each machine...
setx ASUSsync "D:\ASUSsync\"
#if needed run:
mkdir %ASUSsync%\Backups
#finally:
"C:\Program Files\WinRar\WinRAR.exe" a -ag+YYMMM{.v}nn-- -@+ \Backups\vsCodeBackUp.rar @\backups\backups.txt
##Not Working...
cd %ASUSSync%
```

backups.txt

```text
D:\ASUSsync\VS Code\md\*
D:\ASUSsync\ASUSVS-WorkSpace.code-workspace
D:\ASUSsync\VS Code\.vscode\*
D:\ASUSsync\VS Code\AHK\*
D:\ASUSsync\VS Code\IOT\*
D:\ASUSsync\VS Code\java\*
D:\ASUSsync\VS Code\PowerShell\*
D:\ASUSsync\VS Code\Python\*
D:\ASUSsync\VS Code\qk-nts\*
D:\ASUSsync\VS Code\R\*
D:\ASUSsync\VS Code\Scripts\*
D:\ASUSsync\VS Code\WorkspaceSetup\*
```

## VS Code RegExp

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
  - \n new line (\u000A)
  - \e escape \u001b
  - `\###` | `\##` matches an **ASCII Character** in Octal | Hex
  - `\cC` matches CtrlC
  - \S+ -any non-White-Space (One or more)
  - \S non-whitespace
  - \D - Matches a nondigit char - equiv to `\P{Nd}`
  - \d{1,5}- Match from one to five decimal digits.
  - `\w` Alphanumeric
  - \w+
- Classes (`\p{...}`)
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
  - `^`  match must occur at the beginning of the string;
    - multiline mode, it must occur at the beginning of the line.
  - `$`  the match must occur at the end of the string or before \n at the end of the string;
    - in multiline mode, it must occur at the end of the line or before \n at the end of the line.
  - `\A`  The match must occur at the beginning of the string only (no multiline support).
  - `\Z`  The match must occur at the end of the string, or before \n at the end of the string.
  - `\z`  The match must occur at the end of the string only.
  - `\G`  The match must start at the position where the previous match ended.
  - `\b`  The match must occur on a word boundary.
  - `\B`  The match must not occur on a word boundary.

Advanced

The regular expression pattern \b`(?(\d{2}-)``\d{2}-\d{7}`|`\d{3}-\d{2}-\d{4}`)`\b` is interpreted as shown in the following table.

Pattern  Description
`\b`  Start at a word boundary.
`(?(\d{2}-)`  Determine whether the next three characters consist of two digits followed by a hyphen.
`\d{2}-\d{7}`  If the previous pattern matches, match two digits followed by a hyphen followed by seven digits.
`\d{3}-\d{2}-\d{4}`  If the previous pattern does not match, match three decimal digits, a hyphen, two decimal digits, another hyphen, and four decimal digits.
`\b`  Match a word boundary.

The regular expression pattern \b`(?<n2>\d{2}-)?``(?(n2)``\d{7}`|`\d{3}-\d{2}-\d{4}`)\b is interpreted as shown in the following table.

Pattern  Description
- `\b`  Start at a word boundary.
- `(?<n2>\d{2}-)?` Match zero or one occurrence of two digits followed by a hyphen. Name this capturing group n2.
- `(?(n2)`  Test whether n2 was matched in the input string.
- `)\d{7}`   If n2 was matched, match seven decimal digits.
- `|\d{3}-\d{2}-\d{4}` If n2 was not matched, match three decimal digits, a hyphen, two decimal digits, another hyphen, and four decimal digits.
- `\b`  Match a word boundary.
