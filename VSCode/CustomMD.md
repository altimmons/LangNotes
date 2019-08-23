
https://code.visualstudio.com/api/get-started/your-first-extension

https://code.visualstudio.com/api/working-with-extensions/publishing-extension

https://code.visualstudio.com/api

https://github.com/search?q=markdown-it

[Extension API](https://code.visualstudio.com/api/references/extension-manifest)

[Activation Events](https://code.visualstudio.com/api/references/activation-events)

[Contribution Points](https://code.visualstudio.com/api/references/contribution-points)

[VS Code API](https://code.visualstudio.com/api/references/vscode-api)

[Commands](https://code.visualstudio.com/api/references/commands)

[Theme Color](https://code.visualstudio.com/api/references/theme-color)

[Icons in Labels](https://code.visualstudio.com/api/references/icons-in-labels)

[Document Selector](https://code.visualstudio.com/api/references/document-selector)

[References](https://code.visualstudio.com/api/references/extension-manifest#references-articles) 

[Overview](https://code.visualstudio.com/api)







!!!note:  Can use this to make my own custom build using other peoples borrowed scripts.

Name: Markdown-it Plugin Development Framework
Id: sakryukov.markdown-it-plugin-development-framework
Description: Framework for development of node.js modules used as plug-ins for markdown-it module
Version: 4.0.0
Publisher: Sergey A Kryukov
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=sakryukov.markdown-it-plugin-development-framework



Where are extensions installed?#
Extensions are installed in a per user extensions folder. Depending on your platform, the location is in the following folder:

Windows %USERPROFILE%\.vscode\extensions
macOS ~/.vscode/extensions
Linux ~/.vscode/extensions
You can change the location by launching VS Code with the --extensions-dir <dir> command line option.



```json
"colorize.languages": [
      "css",
      "sass",
      "scss",
      "less",
      "postcss",
      "sss",
      "stylus",
      "xml",
      "svg",
      "json",
      "jsonc"
    ],
    "colorize.include": [
      "*/**.code-workspace",
      "*/**.language-configuration.json",
      "*/**.icon-theme.json",
      "*/**.color-theme.json",
      "*/**.code-snippets",
      "*/**.hintrc",
      "*/**.babelrc",
      "*/**.jsonc",
      "*/**.md",
      "*/**.json"
    ],

    ```

    ```json
    "markdown-header-coloring.userDefinedHeaderColor" : {
      "enabled": true,
      "Header_1": {
          "backgroundColor": "color: rgba(100,179,244,1); background: radial-gradient(circle at 20%,#0007, #3336, 50%, #5555 80%, #0000 80%), url('https://pngimage.net/wp-content/uploads/2018/05/carbon-fiber-png-4.png');  background-position: bottom; background-origin: content-box;  " ,
          "textDecoration": "font-weight: 600; font-size: 2.0em; font-family: '1942 Report'; background: -webkit-linear-gradient(0deg,  #9cecfb, #65c7f7, #0052d4);-webkit-background-clip: text;-webkit-text-fill-color: transparent;"
        },
        "Header_2": {
          // "backgroundColor": "background: #833ab4; background: linear-gradient(to right, #833ab4 30%, #fd1d1d 60%, #fcb045 90%, #0000 90%);opacity: 0.5; box-shadow: -90px 10px #BBBBBB70;",
          "backgroundColor": "background: #833ab4; background: linear-gradient(to right, #833ab4 30%, #fd1d1d 60%, #fcb045 90%, #0000 90%);opacity: 0.5; ",
          "textDecoration": "font-weight: 600; text-indent: 30px; font-size: 2.6em; font-family: Airstream ; background: #8BF ;-webkit-background-clip: text;-webkit-text-fill-color: transparent;"
          // "textDecoration": "font-weight: 600; text-indent: 30px; font-size: 1.6em; font-family: Unispace; background: #8BF ;-webkit-background-clip: text;-webkit-text-fill-color: transparent;  justify-content: right; text-shadow: 0px 0px 14px #FFF9; "
        },
        "Header_3": {
          "color": "",
          "backgroundColor": "color: rgba(100,179,244,1); background: radial-gradient(circle at 10%,rgba(100,179,244,1), rgba(100,179,244,.3) 50%, rgba(35,9,125,.7) 80%, rgba(100,179,244,.0) 80%), url('https://mdn.mozillademos.org/files/11307/bubbles.png');  background-position: bottom; background-origin: content-box;  " ,
          // "textDecoration": "font-weight: 600; font-size: 1.8em; font-variant: small-caps; font-family: 'Capture it 2';  background: -webkit-linear-gradient(60deg, #000, #CCC); -webkit-background-clip: text; -webkit-text-fill-color: transparent;text-shadow: 6px 12px #7FC;"
          "textDecoration": "font-weight: 600; font-size: 2.4em;  font-family: CarbonType;  background: #FFFFFF;-webkit-background-clip: text;-webkit-text-fill-color: transparent;"
        },
        "Header_4": {
          "backgroundColor": "background: #833ab4; background: radial-gradient(circle at 0%, #BE5869  10%,#00223e 18%,rgba(255, 161, 127,0.9) 35%,rgba(254,193,127, 0.6)  40%, rgba(24,80,175,.2) 50%, rgba(24,80,175,.0) 70%);",
          // "textDecoration": "font-weight: 300; font-size: 1.7em;font-family: 'Bauhaus 93';text-shadow: 2px 2px e832f288;  background: -webkit-radial-gradient(rgba(146,254,157, 1) 11%,#125556 15%,  rgba(146,254,157, 1) 17%, #126656 20%, rgba(146,254,157, 1) 23%,rgba(146,254,157, 1) 35%, #127756 40%,  rgba(146,254,157, 1) 45%, #128856 55%,  rgba(146,254,157, 1) 60%,rgba(146,254,157, 1) 65%, #129956 75%,  rgba(146,254,157, 1) 85%);-webkit-background-clip: text;-webkit-text-fill-color: transparent;"
          "textDecoration": "font-weight: 300; font-size: 1.5em;font-family: 'Capture it 2'; background: #000;"
        },
        "Header_5": {
          "backgroundColor": "background: #234567; background: radial-gradient(circle at 0%, rgba(146,254,157,0) 8%, rgba(146,254,157,1) 10%, rgba(100,179,244,.2) 20%, rgba(100,179,244,1) 50%, rgba(0,0,0,0) 75%);",
          // "textDecoration": "font-weight: 900; font-family: 'Segoe script'; font-face: bold; font-size: 1.4em;background: -webkit-linear-gradient(90deg, #000000FF, #DDDDFF9F, #000f );-webkit-background-clip: text;-webkit-text-fill-color: transparent; text-shadow: 2px 2px #FFF8;"
          "textDecoration": "font-weight: 900; font-family: 'Mom's Typewriter'; font-face: bold; font-size: 1.4em;background: ;-webkit-background-clip: text;-webkit-text-fill-color: transparent;"
        },
        "Header_6": {
          "backgroundColor": "background: rgb(116,17,255); background: radial-gradient(circle at 0%, #0000 6%, #177a 6%, #66c 20%, #227a 25%, #fff 25%,  #227a 35%, #0000 35%);",
          "textDecoration": "font-weight: 900; font-size: 0.9em; font-variant: small-caps; background:#FFF; background: -webkit-linear-gradient(to right, rgba(0,109,184,1), rgba(150,229,254,1)); -webkit-background-clip: text; -webkit-text-fill-color: transparent;"
        }

      },
      ```


      Name: markender
Id: mjwsteenbergen.markender
Description: Creating beautiful markdown documents
Version: 1.4.0
Publisher: Martijn Steenbergen
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=mjwsteenbergen.markender


Name: vscode-remark-lint
Id: drewbourne.vscode-remark-lint
Description: Use remark & retext to lint Markdown
Version: 1.0.0
Publisher: Drew Bourne
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=drewbourne.vscode-remark-lint

Name: UNOTES - Markdown Notes WYSIWYG
Id: ryanmcalister.unotes
Description:
Version: 1.0.6
Publisher: Ryan McAlister
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=ryanmcalister.Unotes

Name: EasyMarkdown
Id: jaume-ferrarons.easymarkdown
Description: A GUI to edit Markdown in Visual Studio Code
Version: 0.5.0
Publisher: jaume-ferrarons
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=jaume-ferrarons.easymarkdown

Name: Typewriter Sounds
Id: timreilly.typewriter-sounds
Description: This extension makes keystroke and carriage return noises as you type your readme and then everywhere else
Version: 0.0.7
Publisher: timreilly
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=timreilly.typewriter-sounds



Name: vscode-textlint
Id: taichi.vscode-textlint
Description: Integrates Textlint into VS Code.
Version: 0.6.8
Publisher: taichi
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=taichi.vscode-textlint

The extension uses the textlint library installed in the opened workspace folder. If the folder doesn't provide one the extension looks for a global install version. If you haven't installed textlint either locally or globally do so by running npm install textlint in the workspace folder for a local install or npm install -g textlint for a global install.

On new folders you might also need to create a .textlintrc configuration file. You can do this by either running textlint --init in a terminal or by using the VS Code command Create '.textlintrc' file.

Settings Options
textlint.autoFixOnSave
by default is false. if you set true, Automatically fix auto-fixable errors on save.
textlint.run
run the linter onSave or onType, default is onType.
textlint.nodePath
use this setting if an installed textlint package can't be detected, for example /myGlobalNodePackages/node_modules.
textlint.trace
Traces the communication between VSCode and the textlint linter service.
textlint.configPath
absolute path to textlint config file.
workspace settings are prioritize.
Commands
This extension contributes the following commands to the Command palette.

Create '.textlintrc' File
creates a new .eslintrc.json file.
Fix all auto-fixable Problems
applies textlint auto-fix resolutions to all fixable problems.

Name: LaTeX Workshop
Id: james-yu.latex-workshop
Description: Boost LaTeX typesetting efficiency with preview, compile, autocomplete, colorize, and more.
Version: 7.0.0
Publisher: James Yu
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop
