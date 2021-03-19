
alias ll='ls -lF --colors=always'
alias ld='ls -ld --colors=always'
alias ll="ls -lsFup --color=yes"
alias sagi='sudo apt-get install'
alias sas='sudo apt search'
alias micro="~/usrbin/micro"
alias sagi="sudo apt-get install"
alias sas="sudo apt search"
alias cd..="cd .."

https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases

# ls, the common ones I use a lot shortened for rapid fire usage
pyth

# to do alias log="tail (tac -length? /var/log/)

sudo apt-get install mc, ytree
#mc, ytree are file managers

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip --output ~/hack.zip


### Useful utils:

- info - simply named- adds the command for the GNU coreutils doc browser, has more info than man.
- micro -  a nicer nano - CURL https://getmic.ro | bash
- xclip 
- xsel - needed for clipboard in terminal

sagi xclip xsel

echo "alias micro=\"~/usrbin/micro\"" >> .zshrc  (update path, quotes escaped)

to escape can do this:

'alias micro="~/usrbin/micro"'  Single quotes inside double.


### ZSH (Oh my ZSH) plugins:

https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins


### Other terminal treats

sagi colortest
 
 run as `colortest-16, colortest-8, colortest-256`

## ColorLS

https://github.com/athityakumar/colorls/issues/310

Install ruby:

 sagi ruby2.5

 Color and icons in
 
 sudo gem install colorls -- --use-system-libraries
 
gem install colorls

 https://github.com/athityakumar/colorls/issues/310

maybe add this?:
      
      
      source $(dirname $(gem which colorls))/tab_complete.sh >> ~/.zshrc


For WSL (Windows Subsystem for Linux) you need install build-essential package:


         $ sudo apt install build-essential


These are my aliases

alias lc='colorls -laC --sd'
alias ld='colorls -d --sd'
alias lda='colorls -da --sd'
alias lld='colorls -ladh --sd'

alias lf='colorls -lf'
alias lfa='colorls -lfa'

alias ll='colorls -lah --sd'
alias la='colorls -a --sd'
alias l='colorls --sd'
alias lc='colorls -laC --sd'



Doesnt help



            -a, --all                        do not ignore entries starting with .
            -A, --almost-all                 do not list . and ..
            -d, --dirs                       show only directories
            -f, --files                      show only files
               --gs, --git-status           show git status for each file
               --report                     show brief report
               --format=WORD                use format: across (-x), horizontal (-x), long (-l), single-column (-1), vertical (-C)
            -1                               list one file per line
               --tree=[DEPTH]               shows tree view of the directory
            -x                               list entries by lines instead of by columns
            -C                               list entries by columns instead of by lines
            -l, --long                       use a long listing format
            -o                               use a long listing format without group information
            -g                               use a long listing format without owner information
            -G, --no-group                   show no group information in a long listing

         sorting options:

               --sd, --sort-dirs, --group-directories-first
                                             sort directories first
               --sf, --sort-files           sort files first
            -t                               sort by modification time, newest first
            -U                               do not sort; list entries in directory order
            -S                               sort by file size, largest first
            -X                               sort by file extension
               --sort=WORD                  sort by WORD instead of name: none, size (-S), time (-t), extension (-X)
            -r, --reverse                    reverse order while sorting

         options for compatiblity with ls (ignored):

            -h, --human-readable

         general options:

               --color=[WHEN]               colorize the output: auto, always (default if omitted), never
               --light                      use light color scheme
               --dark                       use dark color scheme
               --hyperlink

               --help                       prints this help
               --version                    show version
 ## Cheat.sh



## Install Gitub

[cli/install_linux.md at trunk · cli/cli](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh