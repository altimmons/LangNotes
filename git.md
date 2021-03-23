# VS Code Advanced Config


## VS Code Tips and Tricks

Right Click on bottom left to config status bar

## VS Code Extension Samples

[Link](https://github.com/microsoft/vscode-extension-samples)

## Language Configuration

[Link](https://github.com/microsoft/vscode-extension-samples/tree/master/language-configuration-sample/.vscode)

## Fixing the fonts in WSL

[here](https://token2shell.com/howto/x410/sharing-windows-fonts-with-wsl/)

```sh
code /etc/fonts/local.conf
```

then add

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
    <dir>/mnt/c/Windows/Fonts</dir>
</fontconfig>
```

## Git Commands


## Configure Git to manage Line Endings

`git config --global core.autocrlf input`

## get status (git status)

`gs` ; `git status`

## Environment

[[F5]]


## Git Commit

`Git Commit`

##  WSL

![](https://code.visualstudio.com/assets/docs/remote/wsl/architecture-wsl.png)

To get started, you need to:

1. Install the Windows Subsystem for Linux along with your preferred Linux distribution. (Note that Alpine Linux support is only available in VS Code Insiders.)

!!! Note: WSL does have some known limitations for certain types of development that can also affect your VS Code experience.

2. Install Visual Studio Code on the Windows side (not in WSL).
   
3. Note: When prompted to Select Additional Tasks during installation, be sure to check the Add to PATH option so you can easily open a folder in WSL using the code command.
   
4. Install the **Remote Development extension pack**.
   
5. Consider adding a `.gitattributes` file to your repos or disabling automatic line ending conversion for Git on the Windows side by using a command prompt to run: `git config --global core.autocrlf input` If left enabled, this setting can cause files that you have not edited to appear modified due to line ending differences. See [Tips and Tricks](https://code.visualstudio.com/docs/remote/troubleshooting#_resolving-git-line-ending-issues-in-containers-resulting-in-many-modified-files) for details.

`wslconfig /setdefault Ubuntu`

### WSL specific Settings 

you can also set WSL specific settings by running the `Preferences: Open Remote Settings` command from the **_Command Palette (F1)_** or by selecting the Remote tab in the settings editor. These will override any local settings you have in place whenever you open a folder in WSL.

### Extensions Installation

Extensions are typically designed and tested to either run locally or remotely, not both. However, if an extension supports it, you can force it to run in a particular location in your settings.json file.

For example, the setting below will force the Docker and Debugger for Chrome extensions to run remotely instead of their local defaults:

```json
"remote.extensionKind": {
    "msjsdiag.debugger-for-chrome": "workspace",
    "ms-azuretools.vscode-docker": "workspace"
}
```
A value of "ui" instead of "workspace" will force the extension to run on the local UI/client side instead. Typically, this should only be used for testing unless otherwise noted in the extension's documentation since it can break extensions. See the article on Supporting Remote Development for details.

## VS Code Connection Requirements

[Article](https://code.visualstudio.com/docs/setup/network#_common-hostnames)

## Git Hub CLI App


## Github
# create a repository under your account using the current directory name
$ git init my-project
$ cd my-project
$ gh repo create

# create a repository with a specific name
$ gh repo create my-project

# create a repository in an organization
$ gh repo create cli/my-project

# disable issues and wiki
$ gh repo create --enable-issues=false --enable-wiki=false

  -y, --confirm               Skip the confirmation prompt
  -d, --description string    Description of the repository
      --enable-issues         Enable issues in the new repository (default true)
      --enable-wiki           Enable wiki in the new repository (default true)
  -h, --homepage URL          Repository home page URL
      --internal              Make the new repository internal
      --private               Make the new repository private
      --public                Make the new repository public
  -t, --team name             The name of the organization team to be granted access
  -p, --template repository   Make the new repository based on a template repository


  With no arguments

Inside a git repository, and with no arguments, `gh` will automatically create a repository on GitHub on your account for your current directory, using the directory name.

# Create a repository for the current directory.
~/Projects/my-project$ gh repo create
✓ Created repository user/my-project on GitHub
✓ Added remote https://github.com/user/my-project.git
~/Projects/my-project$


## GH Commandline

❯ cat makefile | gh gist create -f "LibraryMakefile" -d "A mostly dynamic makefile to build libraries"

https://gist.github.com/31e0dd028c898f50386df8216dbb9210

