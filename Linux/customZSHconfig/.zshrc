#! /bin/zsh
# Andy's Custom ZSH Install
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
ZSH_CUSTOM=$HOME/.zshconfig
if [[ -r "${XDG_CACHE_HOME:-$ZSH_CUSTOM/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$ZSH_CUSTOM/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export PATH=usr/local/bin:$HOME/.local/bin:$HOME/bin:$PATH
export LANG=en_US.UTF-8

export BAT_CONFIG_PATH=$ZSH_CUST_CONFIG/bat_config
export XDG_CONFIG_HOME=$ZSH_CUST_CONFIG
ZSH_CONFIG_OHMYZSH=$ZSH_CUSTOM/ohmyzsh
#'assumes that the ANTIGEN_DEFAULT_REPO_URL is set to the oh-my-zsh repo or a fork of that repo.'
ANTIGEN_DEFAULT_REPO_URL=$ZSH_CONFIG_OHMYZSH/oh-my-zsh.git
ZSH_CONFIG_OHMYZSH_PLUGINS=$ZSH_CONFIG_OHMYZSH/plugins
ZSH=$ZSH_CUSTOM
ZSH_CUSTOM_PLUGINS=$ZSH_CUSTOM/.plugins/
ZSH_CUS_ZSH_USERS=$ZSH_CUSTOM_PLUGINS/zsh-users
ZSH_CUST_CONFIG=$ZSH_CUSTOM/config
DEBUG=true
export TERM=xterm #make sure the keys work right
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export LANG=en_US.UTF-8

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# colored GCC warnings and errors

#todo check if everything is setup ? exprted var?
#this does eomething similar.  downloads if not existent.
#[[ ! -d "$HOME/.antigen" ]] && git clone https://github.com/zsh-users/antigen.git "$HOME/.antigen"
#source "$HOME/.antigen/antigen.zsh"

#add these extra paths.

#todo make sure this works if parent changes.




#ZSH_CUSTOM = $ZSH_CONFIG

## Use the local copy rather than downloading it.



#ZSH may need to point to ohmyzsh dir



ANTIGEN_BUNDLES=$ZSH_CUSTOM/config/antigen

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$ZSH_CUSTOM/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$ZSH_CUSTOM/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
source ~/.zshconfig/antigen/antigen.zsh
# 3 steps:
# Using Antigen in your .zshrc consists of three major parts.

    # source the previously downloaded antigen.zsh file
        # use the antigen functions to load desired stuff into your ZSH
            # Commit your configuration by invoking antigen apply
# source $ZSH_CUSTOM/p10k/powerline10k.zsh-theme
#source ~/.zshconfig/p10k/powerline10k.zsh-theme


# 1 -source antigen
# source $ZSH_CUSTOM/antigen/antigen.sh

if $DEBUG; then
  cat<<-EXPORT_LIST
    ANTIGEN_BUNDLES=$ZSH_CUSTOM/config/antigen
    ZSH_CONFIG_OHMYZSH=$ZSH_CUSTOM/ohmyzsh
    ANTIGEN_DEFAULT_REPO_URL=$ZSH_CONFIG_OHMYZSH/oh-my-zsh.git
    ZSH_CONFIG_OHMYZSH_PLUGINS=$ZSH_CONFIG_OHMYZSH/plugins
    ZSH_CUSTOM=$HOME/.zshconfig
    ZSH_CUSTOM_PLUGINS=$ZSH_CUSTOM/.plugins/
    ZSH_CUS_ZSH_USERS=$ZSH_CUSTOM_PLUGINS/zsh-users
    #ZSH may need to point to ohmyzsh dir
    ZSH=$ZSH_CUSTOM
EXPORT_LIST
fi



if $DEBUG; then cat <<< "1"; fi;
antigen bundle $ZSH_CONFIG_OHMYZSH/plugins/<<-BUNDLES
  git
  editor
  history
  prompt
  utility
  completions
  thefuck
BUNDLES

if $DEBUG; then cat <<< "2" ; fi;
for d in $ZSH_CUS_ZSH_USERS/*; do
  antigen bundle  ${d} --no-local-clone
  if $DEBUG; then echo load...$d; fi;
  # if [[$debug]]
done

antigen bundle $ZSH_CUSTOM/.plugins/zsh-users/zsh-users/zsh-completions
antigen bundle $ZSH_CUSTOM/.plugins/zsh-users/zsh-users/zsh-syntax-highlighting
antigen bundle $ZSH_CUSTOM/.plugins/zsh-users/zsh-users/zsh-history-substring-search
antigen bundle $ZSH_CUSTOM/.plugins/zsh-users/zs
antigen 
antigen apply

#loads powerlevel 10k in a rather convoluted way.
#if [[ -z ]]
#    if [[ ! -f "${$ZSH_CUSTOM:-/home/andy/.zshconfig/}.p10k.zsh"  ]] || [[ source $ZSH_CUSTOM/.p10k.zsh ]]; then {
#      echo "profile found";
#    } else {
#      echo "notfound trying something else";
#      if [[ -f ~/.p10k.zsh ]] || [[source ~/.p10k.zsh]]; then
#        echo "found default profile, check settings."
#      else {
#        echo "To customize prompt, run `p10k configure` or edit ~/.p10k.zsh."
#        sleep 2;
#        p10k_config_opts
#      } fi
#    } fi
#    else echo "powerlevel10k not found, check configuration.  Looked in ${$ZSH_CUSTOM/p10k/powerlevel10k.zsh-theme}"
source $ZSH_CUSTOM/.p10k.zsh
export POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

if [[ -f /home/andy/.zshconfig/p10k/powerlevel10k.zsh-theme ]]; then
    source /home/andy/.zshconfig/p10k/powerlevel10k.zsh-theme
fi

# $ZSH_CUSTOM/.assets/now
#~/.zshconfig/.assets/now
source $ZSH_CUSTOM/aliases

# Sane Limits for fzg

source $ZSH_CUSTOM/.fzf-autosize/auto-sized-fzf.sh
#FZF_DEFAULT_OPTS="$(fzf_sizer_preview_window_settings)"
#export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
# fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'

sleep 2

# clear
$ZSH_CUSTOM/.assets/now
