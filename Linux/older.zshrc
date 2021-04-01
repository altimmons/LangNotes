# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#	https://github.com/robbyrussell/oh-my-zsh
#	https://github.com/Powerlevel9k/powerlevel9k
#	https://github.com/romkatv/powerlevel10k
#	https://github.com/b-ryan/powerline-shell
#	https://github.com/ryanoasis/nerd-fonts


# Path to your oh-my-zsh installation.
export ZSH="/home/alt/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="/usr/share/powerlevel9k/"
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="powerlevel10k/powerlevel10k"
#source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
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
# DISABLE_MAGIC_FUNCTIONS=true

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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
# Example aliases
# alias zshconfig="mate ~/.zsh/rc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#https://github.com/Powerlevel9k/powerlevel9k
#https://github.com/robbyrussell/oh-my-zsh

#via curl
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#via wget
#   sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Load Custom Aliases
source ~/.aliases.sh

#Powerlevel9k Settings
#Prompt Default

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)

##Available Segments

### System Status Segments:

	#background_jobs - Indicator for background jobs.
	#battery - Current battery status.
	#context - Your username and host, conditionalized based on $USER and SSH status.
	#date - System date.
	#dir - Your current working directory.
	#dir_writable - Displays a lock icon, if you do not have write permissions on the current folder.
	#disk_usage - Disk usage of your current partition.
	#history - The command number for the current line.
	#host - Your current host name
	#ip - Shows the current IP address.
	#vpn_ip - Shows the current VPN IP address.
	#public_ip - Shows your public IP address.
	#load - Your machine's load averages.
	#os_icon - Display a nice little icon, depending on your operating system.
	#ram - Show free RAM.
	#root_indicator - An indicator if the user has superuser status.
	#status - The return code of the previous command.
	#swap - Prints the current swap size.
	#time - System time.
	#user - Your current username
	#vi_mode- Your prompt's Vi editing mode (NORMAL|INSERT).
	#ssh - Indicates whether or not you are in an SSH session.

##Language Segments:
    ###GoLang Segments:
        #go_version - Show the current GO version.
    ###Javascript / Node.js Segments:
        #node_version - Show the version number of the installed
    #Node.js. n
        #nodeenv - nodeenv prompt for displaying node version and environment name.
        #nvm - Show the version of Node that is currently active, if it differs from the version used by NVM
    ###PHP Segments:
        #php_version - Show the current PHP version.
        #laravel_version - Show the current Laravel version.
        #symfony2_tests - Show a ratio of test classes vs code classes for Symfony2.
        #symfony2_version - Show the current Symfony2 version, if you are in a Symfony2-Project dir.
    ###Python Segments:
        #virtualenv - Your Python VirtualEnv.
        #anaconda - Your active Anaconda environment.
        #pyenv - Your active python version as reported by the first word of pyenv version.
        #    Note that the segment is not displayed if that word is system i.e. the segment is inactive if you are using system python.
###Ruby Segments:
        #chruby - Ruby environment information using chruby (if one is active).
        #rbenv - Ruby environment information using rbenv (if one is active).
        #rspec_stats - Show a ratio of test classes vs code classes for RSpec.
        #rvm - Ruby environment information using $GEM_HOME and $MY_RUBY_HOME (if one is active).
#Rust Segments:
	#rust_version - Display the current rust version and logo.

#Swift Segments:
	#swift_version - Show the version number of the installed Swift.
#Java Segments:
	#java_version - Show the current Java version.

#Cloud Segments:

	#AWS Segments:
    	#aws - The current AWS profile, if active.
	    #aws_eb_env - The current Elastic Beanstalk Environment.
	    #docker_machine - The current Docker Machine.
	    #kubecontext - The current context of your kubectl configuration.
	    #dropbox - Indicates Dropbox directory and syncing status using dropbox-cli

#Other:
	#custom_command - Create a custom segment to display the output of an arbitrary command.
	#command_execution_time - Display the time the current command took to execute.
	#todo - Shows the number of tasks in your todo.txt tasks file.
	#detect_virt - Virtualization detection with systemd
	#newline - Continues the prompt on a new line.
	#openfoam - Shows the currently sourced OpenFOAM environment.


zsh_wifi_signal(){
    local signal=$(nmcli device wifi | grep \* | awk '{print $7}')
    local symbol=$(nmcli device wifi | grep \* | awk '{print $8}')
    local color='%F{yellow}'
    [[ $signal -gt 75 ]] && color='%F{green}'
    [[ $signal -lt 50 ]] && color='%F{red}'
    echo -n "%{$color%}\uf1eb  $signal $symbol%{%f%}" # \uf230 is 
}

POWERLEVEL9K_CUSTOM_WIFI_SIGNAL="zsh_wifi_signal"
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time battery dir vcs virtualenv custom_wifi_signal)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user time battery dir vcs virtualenv custom_wifi_signal)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_USER_ICON="\uF415" # 
POWERLEVEL9K_ROOT_ICON="#"
POWERLEVEL9K_SUDO_ICON=$'\uF09C' # 

# Variable							Default Value	Description
# DEFAULT_USER						None			Username to consider a "default context" (you can also set $USER).
# POWERLEVEL9K_ALWAYS_SHOW_CONTEXT	false			Always show this segment, including $USER and hostname.
# POWERLEVEL9K_ALWAYS_SHOW_USER		false			Always show the username, but conditionalize the hostname.
# POWERLEVEL9K_CONTEXT_TEMPLATE		%n@%m			Default context prompt (username@machine). Refer to the ZSH Documentation for all possible expansions, including deeper host depths.
# State		Meaning
# DEFAULT		You are a normal user
# ROOT		You are the root user
# SUDO		You are using elevated rights
# REMOTE_SUDO	You are SSH'ed into the machine and have elevated rights
# REMOTE	You are SSH'ed into the machine
# https://github.com/Powerlevel9k/powerlevel9k/wiki/Stylizing-Your-Prompt#special-segment-colors


DEFAULT_USER="alt"
POWERLEVEL9K_ALWAYS_SHOW_USER=false


 #For these segments you still can modify the color to your needs by setting a variable like POWERLEVEL9K_<name-of-segment>_<state>_[BACKGROUND|FOREGROUND].

# Segments with state are:

# Segment	States
# 	battery			LOW, CHARGING, CHARGED, DISCONNECTED
# 	context			DEFAULT, ROOT, SUDO, REMOTE, REMOTE_SUDO
# 	dir				HOME, HOME_SUBFOLDER, DEFAULT, ETC
# 	dir_writable	FORBIDDEN
# 	disk_usage		NORMAL, WARNING, CRITICAL
# 	host			LOCAL, REMOTE
# 	load			CRITICAL, WARNING, NORMAL
# 	rspec_stats		STATS_GOOD, STATS_AVG, STATS_BAD
# 	status			ERROR, OK (note: only, if verbose is not false)
# 	symfony2_tests	TESTS_GOOD, TESTS_AVG, TESTS_BAD
# 	user			DEFAULT, SUDO, ROOT
# 	vcs				CLEAN, UNTRACKED, MODIFIED
# 	vi_mode			NORMAL, INSERT, VISUAL
