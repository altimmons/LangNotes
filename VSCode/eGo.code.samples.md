# eGo Script Extension Language

Name: Power Tools
Id: ego-digital.vscode-powertools
Description: A set of useful and handy tools for Visual Studio Code.
Version: 0.42.0
Publisher: e.GO Digital GmbH
VS Marketplace Link: https://marketplace.visualstudio.com/items?itemName=ego-digital.vscode-powertools




```js


    "ego.power-tools": {
      "user": {},
      "commands": {
        "testCommand": {
          "script": "jobsample.js",
          "button": {
            "color": "#46d2f7",
            "text": "Click here to enable"
          }
        }
      },
      "buttons": [
        {
          "text": "Power Mode Toggle1",
          "tooltip": "Press here to toggle Tool Tip",
          "color": "#ff0059",
          "action": {
            "type": "script",
            "script": "test_commands.js"
          }
        },
        {
          "color": "#8355e2",
          "text": "That button is called: '${buttonText}'",
          "tooltip": "${buttonTooltip}",
          "action" {
            "type": "script",
            "script": "test_commands.js"
          }

        }
      ],
      "values": {
        "buttonText": "MyButton",
        "buttonTooltip": "This is a button, click it!",
        "currentTime":{
          "code": "new Date()",
          "type": "code"
        }
      },
      "events": [
        {
          "type": "file.changed",
          "files": ["**/*.java"],
          "exclude": ["/test2.txt"],
          "action": {
            "script": "test_commands.js",
            "type": "script"
          }
        }
      ]
    },
    ```