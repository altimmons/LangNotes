
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/andyt/.oh-my-zsh"

ZSH_THEME="agnoster"
 ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

HYPHEN_INSENSITIVE="true"
export UPDATE_ZSH_DAYS=45

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=( git
		 textmate
		 colored-man-pages
		 dircycle
		 colorize
		 extract
		 history
		 screen
		 safe-paste
		 fasd
		 cake	
		 github
		 gnu-utils
			pip
			python
			debian
			thefuck
			zsh-colorls
		  )

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nano'
else
export EDITOR='micro'
fi

export ARCHFLAGS="-arch x86_64"

alias zshconfig="micro ~/.zshrc"
alias ohmyzsh="micro ~/.oh-my-zsh"
alias p10k="micro ~/.p10k.zsh"
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update'
alias sas='sudo apt search'

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

alias cd..='cd ..'
alias cd...='cd ../..' 
alias cd....='cd ../../..'
alias pd=pushd
alias ud=popd
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
