

# keybindings


## Navigation through camel case and other sub words.


```jsonc
 {
    "key": "alt+t",
    "command": "toggle-tabout"
  },
  {
    "key": "alt+left",
    "command": "cursorWordPartStartLeft",
    "when": "textInputFocus"
  },
  {
    "key": "alt+right",
    "command": "cursorWordPartRight",
    "when": "textInputFocus"
  },
  {
    "key": "ctrl+alt+left",
    "command": "cursorWordStartLeft",
    "when": "textInputFocus"
  },
  {
    "key": "ctrl+alt+right",
    "command": "cursorWordStartRight",
    "when": "textInputFocus"
  },
  {
    "key": "shift+alt+left",
    "command": "cursorWordPartStartLeftSelect",
    "when": "textInputFocus"
  },
  {
    "key": "shift+alt+right",
    "command": "cursorWordPartRightSelect",
    "when": "textInputFocus"
  },
  {
    "key": "ctrl+shift+alt+right",
    "command": "cursorWordRightSelect",
    "when": "textInputFocus"
  },
  {
    "key": "ctrl+shift+alt+left",
    "command": "cursorWordStartLeftSelect",
    "when": "textInputFocus"
    
  }
```


## Terminal Navigation

```jsonc
 {
    "key": "ctrl+shift+\\",
    "command": "workbench.action.terminal.splitInActiveWorkspace",
    "when": "terminalFocus"
  },
  {
    "key": "ctrl+alt+right",
    "command": "terminalFocus && workbench.action.terminal.focusNext"
  },
  {
    "key": "ctrl+alt+left",
    "command": "workbench.action.terminal.focusPrevious",
    "when": "terminalFocus && terminalProcessSupported"
  },
  ```

  ## markdown

  - TOC

  - Footnotes

  - Abreviatons

  - Definitions

  - Bold

  - Italic

  - Underline

  -Superscript

  - Subscript

  - Checkbox

  - style
   -- template?

   -- kbd 
     keyboard

- math

- codeblock

- code

- paste link

- paste image



available commands

Markdown: Create Table of Contents
Markdown: Update Table of Contents
Markdown: Toggle code span
Markdown: Print current document to HTML
Markdown: Toggle math environment
Markdown: Toggle unordered list