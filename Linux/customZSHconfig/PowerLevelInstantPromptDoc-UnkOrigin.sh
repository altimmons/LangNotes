# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/andy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME = gruvbox-zsh
# ZSH_THEME="alpharized"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

#vscode https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode

#theme   themes https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/themes
#  adds :
# - theme <theme_name> - Changes the ZSH theme to specified theme.
# - theme - Changes the ZSH theme to some random theme.
# - lstheme - Lists installed ZSH themes.

# ==thefuck https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/thefuck
# correct types on the cli, use [[Esc]][[Esc]]
# https://github.com/nvbn/thefuck#installation 

# - `vsc ` - eq.to[code . ] =
#                    Open the current folder in VS code 
# - `vsca dir ` - eq.to[code --add dir ] =
#                   Add folder(s) to the last active window 
# - `vscd file file ` - eq.to[code --diff file file ] =
#                    Compare two files with each other. 
# - `vscg file:line[:char] ` - eq.to[code --goto file:line[:char] ] =
#        Open a file at the path on the specified line and character position. 
# - `vscn ` - eq.to[code --new-window ] =
#                    Force to open a new window. 
# - `vscr ` - eq.to[code --reuse-window ] =
#                    Force to open a file or folder in the last active window. 
# - `vscw ` - eq.to[code --wait ] =
#                    Wait for the files to be closed before returning. 
# - `vscu dir ` - eq.to[code --user-data-dir dir ] =
#                    Specifies the directory that user data is kept in. 
#                     Can be used to open multiple distinct instances of Code. 
# - `vsced dir ` - eq.to[code --extensions-dir dir ] =
#                    Set the root path for extensions. 
# - `vscie id or vsix-path ` 
#          - eq.to[code --install-extension extension-id> 
#           or <extension-vsix-path ] = Installs an extension. 
# - `vscue id or vsix-path ` - eq.to[code --uninstall-extension id or 
#                                   vsix-path ] =
#                    Uninstalls an extension. 
# - `vscv ` - eq.to[code --verbose ] =
#                    Print verbose output (implies --wait). 
# - `vscl level ` - eq.to[code --log level ] =
#                    Log level to use. Default is 'info'. Allowed values are 
#              [['critical', 'error', 'warn', 'info', 'debug', 'trace', 'off'. ]
# - `vscde ` - eq.to[code --disable-extensions ] =
#                    Disable all installed extensions. 


# - wd = Warp Drive  https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/wd
#wd add foo adds foo to
# wd foo returns to foo

# see curated list at https://github.com/unixorn/awesome-zsh-plugins

# tutorials https://github.com/unixorn/awesome-zsh-plugins#generic-zsh

plugins=(git
common-aliases
colored-man-pages
alias-finder
thefuck
vscode
themes 
wd
python
)



source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme robbyrussel;
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

source $(dirname $(gem which colorls))/tab_complete.sh
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#alias ll='colorls -lF'
#alias ll='ls -lF --colors=always'
#alias ls=colorls
#alias ld='ls -d'

alias lc='colorls -laC --sd'
alias lf='colorls -af'
#alias ld='ls -ld --colors=always'
alias ld='colorls -ad'
#alias ll="colorls -lsFup"
alias ll="colorls -lah --sd"
alias la='colorls -ah --sd'
alias l='colorls --sd'
#alias ll="ls -lsFup --color=yes"


alias sagi='sudo apt-get install'
alias sas='sudo apt search'
alias micro="~/usrbin/micro"
alias cd..="cd .."


antigen use oh-my-zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export testbinary='/mnt/o/OneDrive/Programming/C++/CLionProj/MiniProj1.4/cmake-build-debug/MiniProj1_4'
export testbindir='/mnt/o/OneDrive/Programming/C++/CLionProj/MiniProj1.4/cmake-build-debug/'