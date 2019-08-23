


[Doc](https://code.visualstudio.com/api)

[See Doc](https://code.visualstudio.com/api/references/vscode-api#ThemableDecorationInstanceRenderOptions)

## Extension Host

[Doc](https://code.visualstudio.com/api/advanced-topics/extension-host)


Quick Pick
With the vscode.QuickPick API, you can easily collect user input or let the user make a selection from multiple options. The QuickInput Sample illustrates the API.


Code used for extension development.  Could it be used to load extensions?

```json
{
  "folders": [
    { "path": "hello1" },
    { "path": "hello2" }
  ],
  "launch": {
    "configurations": [
      {
        "type": "extensionHost",
        "request": "launch",
        "name": "Launch Two Extensions",
        "args": [
          "--extensionDevelopmentPath=${workspaceFolder:hello1}",
          "--extensionDevelopmentPath=${workspaceFolder:hello2}",
        ],
        "outFiles": [
          "${workspaceFolder:hello1}/out/**/*.js",
          "${workspaceFolder:hello2}/out/**/*.js"
        ]
      }
    ]
  }
}
```

Machine-specific settings
If you have settings that allow users to customize an executable path and if these paths need to be scoped to the machine they are running on, you can now classify such settings as machine scoped. Extension authors set the scope property when contributing to the configuration extension point. Machine-specific settings can only be configured for User settings.

"configuration": {
  "title": "Git",
  "properties": {
   "git.path": {
          "type": [
            "string",
            "null"
          ],
          "markdownDescription": "Path and filename of the git executable.",
          "default": null,
          "scope": "machine"
        },
  }
}