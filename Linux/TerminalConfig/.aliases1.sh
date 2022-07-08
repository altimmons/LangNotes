# console coloring for kool kids
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# if this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# impersonate a user
alias user="su -ls /bin/bash"

alias v="ls -lA"
# History ignore and erase dupes
export HISTCONTROL=ignoreboth:erasedups
export TERM=xterm
export ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd
export PWD=$NNN_TEMPFILE
nnn_cd()
{
    if ! [ -z "$NNN_PIPE" ]; then
        printf "%s\0" "0c${PWD}" > "${NNN_PIPE}" !&
    fi
}


#return ^Q to the shell
stty start undef

#pushd ~
#curl https://getmic.ro | bash
#ln -s -t /usr/bin ~/micro
#popd
function cs() { curl -m 7 "http://cheat.sh/$1"; }
export LS=lsd
alias ~='cd ~'
#alias log="tail /var/log/syslog"
alias log='tail -20 /var/log/syslog | tac | ccat -G Decimal="blue" -G Punctuation="darkgreen" -G Type="darkgray"'
alias logc='tail -f -n 30 /var/log/syslog | tac | ccat -G Decimal="blue" -G Punctuation="darkgreen" -G Type="darkgray"'
alias llg="tac /var/log/syslog  | less"
alias clr="clear"
alias c=clear
alias ip='ip -c'
alias cat=ccat
alias ld='$LS -ldha'
alias lsdd='lsd -da'
#alias ll="$LS -lsFp"
alias ll="$LS -l"
alias lsdl='lsd -ls'
alias l='$LS -lFh'     #size,show type,human readable
alias lsdl='lsd -alR --tree'
#alias ls=$LS
alias lir='$LS -liR'
alias la='$LS -aFh'   #long list,show  all,show type,human readable
alias lsda='lsd -a'
alias lr='$LS -tRFh'   #sorted by date,recursive,show type,human readable
alias ltree='lsd -a --tree --depth 3'
alias ldtree='lsd -ad --tree --depth 3'
alias lt='$LS -ltFh'   #long list,sorted by date,show type,human readable
alias ll='$LS -lHa'      #long list
alias lS='$LS -1FSsh'
alias lart='$LS -Fcart'
alias lrt='$LS -Fcrt'
alias cd..='cd ..'
alias cd...='cd ..\..'
alias cd....='cd ..\..\..'
alias cd.....='cd ..\..\..\..'
#alias 'cd ...'='cd ..\..'
#alias 'cd ....'='cd ..\..\..'
#alias 'cd .....'='cd ..\..\..\..'
alias docker-compose='docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose:latest'

#Quick Shortcuts, system specific
alias byobu-help='ccat /usr/share/byobu/keybindings/common'
alias custom='micro /boot/config/bashcustom'
alias go='micro /boot/config/go'

#dirs
alias shares='cd /mnt/user && ls'
alias mnt='cd /mnt/ && ls'
alias config='cd /boot/config/ && ls'

#build a dir stack
pushd -n /boot/config
pushd -n /mnt/
pushd -n /mnt/disks
pushd -n /etc
alias dirs='dirs -v'
alias d=dirs
