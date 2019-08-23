# Setup Notes


## Workspace Settings

```json
    "files.exclude": {
      "**/.classpath": true,
      "**/.project": true,
      "**/.settings": true,
      "**/.factorypath": true
    },
    "files.associations": {
      "code-workspace" : "json",
      "code-snippets" : "json"
  },
  ```

## JSON Settings

  ```json
    "[json]":{
      "editor.wordBasedSuggestions": false
    },
  ```

  ```json


  ```
## Python Settings

  ```json

  ```
## R Settings

  ```json

  ```
## Java Settings

  ```json

  ```
## Markdown Settings

  ```json
      "editor.wordBasedSuggestions": false, 
      "editor.tabCompletion": "onlySnippets",
      "editor.snippetSuggestions": "top", 
            "editor.defaultFormatter": "jebbs.markdown-extended",
  ```
### Snippets


```json
"_Code Block with Choices": {
    "prefix": "cbc",
    "body": [
      "",
      "```${1|java,python,cmd,bash,R,js,json,C#,ps1,py3,py2,css|}",
      "$2",
      "```",
      "",
      "$0"
    ],
    "description": "Produce a Code Block"
  },
  "Paste Code": {
    "prefix": "code-clip",
    "body": [
      "",
      "```${TM_FILENAME/(.*)/${1:/downcase}/}",
      "${LINE_COMMENT}$1",
      "${CLIPBOARD}",
      "```",
      "",
      "$0"
    ],
    "description": "Produce a Code Block"
  },
  "Code From Selected": {
    "prefix": "_ConvertSelectedToCodeBlock",
    "body": [
      "```${TM_FILENAME/(.*)/${1:/downcase}/}",
      "${TM_SELECTED_TEXT}",
      "```",
      "",
      "$0"
    ],
    "description": "Converts the selected text to a code block."
  },
  "Link from Clipboard": {
    "prefix": "link-clip",
    "body": [
      // "[${1:${TM_SELECTED_TEXT}}](${2:${CLIPBOARD:?{^{http:,ftp:,file:}$3})",
      "[${1:${TM_SELECTED_TEXT}}](${2:${CLIPBOARD}})",
      "",
      "$0"
    ],
    "description": "insert a link from the clipboard"
  },
```





Name: Task Runner
Id: blazekill.task-runner
Description: Simple GUI for running npm scripts and vs code tasks
Version: 0.0.6
Publisher: BLaZeKiLL
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=BLaZeKiLL.task-runner

Name: Terminal Tabs
Id: tyriar.terminal-tabs
Description: Adds tabs for each terminal process to the status bar
Version: 0.2.0
Publisher: Daniel Imms
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Tyriar.terminal-tabs

Name: Shell launcher
Id: tyriar.shell-launcher
Description: Easily launch multiple shell configurations in the terminal
Version: 0.3.0
Publisher: Daniel Imms
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Tyriar.shell-launcher

Name: Shell launcher
Id: tyriar.shell-launcher
Description: Easily launch multiple shell configurations in the terminal
Version: 0.3.0
Publisher: Daniel Imms
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Tyriar.shell-launcher

Name: Settings Sync
Id: shan.code-settings-sync
Description: Synchronize Settings, Snippets, Themes, File Icons, Launch, Keybindings, Workspaces and Extensions Across Multiple Machines Using GitHub Gist.
Version: 3.2.9
Publisher: Shan Khan
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync

Name: Replace Rules
Id: bhughes339.replacerules
Description: Create search/replace rules using Javascript regular expressions
Version: 0.2.4
Publisher: bhughes339
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=bhughes339.replacerules

Name: Tasks
Id: actboy168.tasks
Description: Load VSCode Tasks into Status Bar.
Version: 0.1.8
Publisher: actboy168
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=actboy168.tasks

Name: External Tools
Id: lihui.vs-external-tools
Description: Allows you to easily launch many other applications
Version: 1.3.0
Publisher: lihui
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=lihui.vs-external-tools