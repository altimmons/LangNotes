

## Configure Git to manage Line Endings

`git config --global core.autocrlf input`

## get status (git status)

`gs` ; `git status`

## Environment


    export GIT_COMMITTER_EMAIL=15314341+altimmons@users.noreply.github.com
    export GIT_AUTHOR_EMAIL=15314341+altimmons@users.noreply.github.com
    export GIT_AUTHOR_NAME='A. Timmons'
    export GIT_COMMITTER_NAME='A. Timmons'
    export GIT_PAGER=$PAGER
    export GIT_EDITOR=$EDITOR

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

 git help -a | clip >>

----

>See `git help <command>` to read about a specific subcommand
>
>- <u>Main Porcelain Commands</u>
>  `add`: Add file contents to the index 
>  `am`: Apply a series of patches from a mailbox 
>  `archive`: Create an archive of files from a named tree 
>  `bisect`: Use binary search to find the commit that introduced a bug 
>  `branch`: List, create, or delete branches 
>  `bundle`: Move objects and refs by archive 
>  `checkout`: Switch branches or restore working tree files 
>  `cherry-pick`: Apply the changes introduced by some existing commits 
>  `citool`: Graphical alternative to git-commit 
>  `clean`: Remove untracked files from the working tree 
>  `clone`: Clone a repository into a new directory 
>  `commit`: Record changes to the repository 
>  `describe`: Give an object a human readable name based on an available ref 
>  `diff`: Show changes between commits, commit and working tree, etc 
>  `fetch`: Download objects and refs from another repository 
>  `format-patch`: Prepare patches for e-mail submission 
>  `gc`: Cleanup unnecessary files and optimize the local repository 
>  `gitk`: The Git repository browser 
>  `grep`: Print lines matching a pattern 
>  `gui`: A portable graphical interface to Git 
>  `init`: Create an empty Git repository or reinitialize an existing one 
>  `log`: Show commit logs 
>  `merge`: Join two or more development histories together 
>  `mv`: Move or rename a file, a directory, or a symlink 
>  `notes`: Add or inspect object notes 
>  `pull`: Fetch from and integrate with another repository or a local branch 
>  `push`: Update remote refs along with associated objects 
>  `range-diff`: Compare two commit ranges (e.g. two versions of a branch) 
>  `rebase`: Reapply commits on top of another base tip 
>  `reset`: Reset current HEAD to the specified state 
>  `revert`: Revert some existing commits 
>  `rm`: Remove files from the working tree and from the index 
>  `shortlog`: Summarize 'git log' output 
>  `show`: Show various types of objects 
>  `stash`: Stash the changes in a dirty working directory away 
>  `status`: Show the working tree status 
>  `submodule`: Initialize, update or inspect submodules 
>  `tag`: Create, list, delete or verify a tag object signed with GPG 
>  `worktree`: Manage multiple working trees 
>
>- ~~<u>Ancillary~~ Commands / Manipulators</u>
>  `config`: Get and set repository or global options 
>  `fast-export`: Git data exporter 
>  `fast-import`: Backend for fast Git data importers 
>  `filter-branch`: Rewrite branches 
>  `mergetool`: Run merge conflict resolution tools to resolve merge conflicts 
>  `pack-refs`: Pack heads and tags for efficient repository access 
>  `prune`: Prune all unreachable objects from the object database 
>  `reflog`: Manage reflog information 
>  `remote`: Manage set of tracked repositories 
>  `repack`: Pack unpacked objects in a repository 
>  `replace`: Create, list, delete refs to replace objects 
>
>-<u> Ancillary Commands / Interrogators</u>
>  `annotate`: Annotate file lines with commit information 
>  `blame`: Show what revision and author last modified each line of a file 
>  `count-objects`: Count unpacked number of objects and their disk consumption 
>  `difftool`: Show changes using common diff tools 
>  `fsck`: Verifies the connectivity and validity of the objects in the database 
>  `gitweb`: Git web interface (web frontend to Git repositories) 
>  `help`: Display help information about Git 
>  `instaweb`: Instantly browse your working repository in gitweb 
>  `merge-tree`: Show three-way merge without touching index 
>  `rerere`: Reuse recorded resolution of conflicted merges 
>  `show-branch`: Show branches and their commits 
>  `verify-commit`: Check the GPG signature of commits 
>  `verify-tag`: Check the GPG signature of tags 
>  `whatchanged`: Show logs with difference each commit introduces 
>
>- <u>Interacting with Others</u>
>  `archimport`: Import a GNU Arch repository into Git 
>  `cvsexportcommit`: Export a single commit to a CVS checkout 
>  `cvsimport`: Salvage your data out of another SCM people love to hate 
>  `cvsserver`: A CVS server emulator for Git 
>  `imap-send`: Send a collection of patches from stdin to an IMAP folder 
>  `p4`: Import from and submit to Perforce repositories 
>  `quiltimport`: Applies a quilt patchset onto the current branch 
>  `request-pull`: Generates a summary of pending changes 
>  `send-email`: Send a collection of patches as emails 
>  `svn`: Bidirectional operation between a Subversion repository and Git 
>
>- <u>Low-level Commands / Manipulators</u>
>  `apply`: Apply a patch to files and/or to the index 
>  `checkout-index`: Copy files from the index to the working tree 
>  `commit-graph`: Write and verify Git commit-graph files 
>  `commit-tree`: Create a new commit object 
>  `hash-object`: Compute object ID and optionally creates a blob from a file 
>  `index-pack`: Build pack index file for an existing packed archive 
>  `merge-file`: Run a three-way file merge 
>  `merge-index`: Run a merge for files needing merging 
>  `mktag`: Creates a tag object 
>  `mktree`: Build a tree-object from ls-tree formatted text 
>  `multi-pack-index`: Write and verify multi-pack-indexes 
>  `pack-objects`: Create a packed archive of objects 
>  `prune-packed`: Remove extra objects that are already in pack files 
>  `read-tree`: Reads tree information into the index 
>  `symbolic-ref`: Read, modify and delete symbolic refs 
>  `unpack-objects`: Unpack objects from a packed archive 
>  `update-index`: Register file contents in the working tree to the index 
>  `update-ref`: Update the object name stored in a ref safely 
>  `write-tree`: Create a tree object from the current index 
>
>- <u>Low-level Commands / Interrogators</u>
>  `cat-file`: Provide content or type and size information for repository objects 
>  `cherry`: Find commits yet to be applied to upstream 
>  `diff-files`: Compares files in the working tree and the index 
>  `diff-index`: Compare a tree to the working tree or index 
>  `diff-tree`: Compares the content and mode of blobs found via two tree objects 
>  `for-each-ref`: Output information on each ref 
>  `get-tar-commit-id`: Extract commit ID from an archive created using git-archive 
>  `ls-files`: Show information about files in the index and the working tree 
>  `ls-remote`: List references in a remote repository 
>  `ls-tree`: List the contents of a tree object 
>  `merge-base`: Find as good common ancestors as possible for a merge 
>  `name-rev`: Find symbolic names for given revs 
>  `pack-redundant`: Find redundant pack files 
>  `rev-list`: Lists commit objects in reverse chronological order 
>  `rev-parse`: Pick out and massage parameters 
>  `show-index`: Show packed archive index 
>  `show-ref`: List references in a local repository 
>  `unpack-file`: Creates a temporary file with a blob's contents 
>  `var`: Show a Git logical variable 
>  `verify-pack`: Validate packed Git archive files 
>
>- <u>Low-level Commands / Synching Repositories</u>
>  `daemon`: A really simple server for Git repositories 
>  `fetch-pack`: Receive missing objects from another repository 
>  `http-backend`: Server side implementation of Git over HTTP 
>  `send-pack`: Push objects over Git protocol to another repository 
>  `update-server-info`: Update auxiliary info file to help dumb servers 
>
>- <u>Low-level Commands / Internal Helpers</u>
>  `check-attr`: Display gitattributes information 
>  `check-ignore`: Debug gitignore / exclude files 
>  `check-mailmap`: Show canonical names and email addresses of contacts 
>  `check-ref-format`: Ensures that a reference name is well formed 
>  `column`: Display data in columns 
>  `credential`: Retrieve and store user credentials 
>  `credential-cache`: Helper to temporarily store passwords in memory 
>  `credential-store`: Helper to store credentials on disk 
>  `fmt-merge-msg`: Produce a merge commit message 
>  `interpret-trailers`: add or parse structured information in commit messages 
>  `mailinfo`: Extracts patch and authorship from a single e-mail message 
>  `mailsplit`: Simple UNIX mbox splitter program 
>  `merge-one-file`: The standard helper program to use with git-merge-index 
>  `patch-id`: Compute unique ID for a patch 
>  `sh-i18n`: Git's i18n setup code for shell scripts 
>  `sh-setup`: Common Git shell script setup code 
>  `stripspace`: Remove unnecessary whitespace 
>
> - <u>External commands</u>
>   `clang-format`
>   `flow`
>   `lfs`
>
>- <u>Command aliases</u>
>  `br`: branch 
>  `ci`: commit 
>  `cl`: clone 
>  `co`: checkout 
>  `cp`: cherry-pick 
>  `dc`: diff --cached 
>  `last`: log -1 --stat 
>  `lg`: log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %Cblue<%an>%Creset' --abbrev-commit >--date=relative --all 
>  `root`: 'rev-parse 
>  `st`: status -sb 
>  `unstage`: reset HEAD -- 


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


## Head Missing 

error : `fatal: cannot lock ref 'HEAD': is at * but expected *` where * is a long hex string

Command `git gc` was suggested