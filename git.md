

## Configure Git to manage Line Endings

`git config --global core.autocrlf input`

## get status (git status)

`gs` ; `git status`

## Environment

[[F5]]

Sources:

[Environment Variables](https://www.tutorialspoint.com/git/git_environment.htm)

[ https://git-scm.com/book/pl/v2/Git-Internals-Environment-Variables](https://www.tutorialspoint.com/git/git_environment.htm)

[Source on config](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)

> The final creation of a Git commit object is usually done by git-commit-tree, which uses these environment variables as its primary source of information, falling back to configuration values only if these aren’t present.


```r
export GIT_COMMITTER_EMAIL=15314341+altimmons@users.noreply.github.com
export GIT_AUTHOR_EMAIL=15314341+altimmons@users.noreply.github.com
export GIT_AUTHOR_NAME='A. Timmons'
export GIT_COMMITTER_NAME='A. Timmons'
export GIT_PAGER=$PAGER
export GIT_EDITOR=$EDITOR
#export GIT_CONFIG_PARAMETERS="'color.ui=true, color.branch=auto, color.status=auto'"
```

Though this doesnt seem to work, rather run

## Settings

```sh
git config --global user.name "A. Timmons"
git config --global user.email "15314341+altimmons@users.noreply.github.com"

git config --global color.ui true
git config --global color.branch auto
git config --global color.status auto
git config --global branch.autosetuprebase always


# git config --global color.branch true

# git config --global color.diff true
# git config --global color.diff.meta "blue black bold"
# #  normal, black, red, green, yellow, blue, magenta, cyan, or white. If you want an attribute like bold in the previous example, you can choose from bold, dim, ul (underline), blink, and reverse (swap foreground and background).
# git config --global color.interactive true

# git config --global color.status true
# git config --global merge.tool vimdiff
# git config --global core.editor vim
```

[Source on config](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)

or you can edit your `~/.gitconfig` file to add these lines:

```sh
[merge]
  tool = extMerge
[mergetool "extMerge"]
  cmd = extMerge "$BASE" "$LOCAL" "$REMOTE" "$MERGED"
  trustExitCode = false
[diff]
  external = extDiff

[color]
  ui = auto
[color "branch"]
  current = yellow reverse
  local = yellow
  remote = green
[color "diff"]
  meta = yellow bold
  frag = magenta bold
  old = red bold
  new = green bold
[color "status"]
  added = yellow
  changed = green
  untracked = cyan
Highlight whitespace in diffs
``` 

another example

```sh
[color]
  ui = true
[color "diff"]
  whitespace = red reverse
[core]
  whitespace=fix,-indent-with-non-tab,trailing-space,cr-at-eol
```
## Git Commands



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



## git submodule

Add other git projects to mine

    git submodule add [depth=1] https://github.com/<someUser>/<someProject>.git 

    #from another project I stole this possible command

git submodule update --init --recursive   # Pull in ~~dependencies~~



## Clone only a sub-directory

!!!warning Could Not Get this to work.


[Source](https://stackoverflow.com/questions/600079/how-do-i-clone-a-subdirectory-only-of-a-git-repository/52269934#52269934)

To perform- you still clone the repo.  But with `no-checkout` you start it

`git clone   --depth 1   --filter=blob:none   --no-checkout   https://github.com/bigtreetech/BIGTREETECH-OCTOPUS-V1.0.git ;`

then cd into it

``git config core.sparseCheckout `**true**``  or `git sparse-checkout init` needs to be run

git sparse-checkout set "A/B"
# same as:
# echo "A/B" >> .git/info/sparse-checkout

git sparse-checkout list
# same as:
# cat .git/info/sparse-checkout

The example in the link demonstrates a `sparse` option that only gives me an error.
## Contributing

Fork it
Create your feature branch (`git checkout -b my-new-feature`)
Commit your changes (`git commit -am 'Add some feature'`)
Push to the branch (`git push origin my-new-feature`)
Create `new Pull ~~Request`~~