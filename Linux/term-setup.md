alias sagi='sudo apt-get install'
alias sagu='sudo apt-get update'

alias lc='colorls -laC --sd'
alias ld='colorls -d --sd'
alias lda='colorls -da --sd'
alias lld='colorls -ladh --sd'

alias lf='colorls -lf'
alias lfa='colorls -lfa'

alias ll='colorls -lah --sd'
alias la='colorls -ah --sd'
alias l='colorls --sd'
alias lc='colorls -laC --sd'

alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias pd=pushd
alias ud=popd

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k