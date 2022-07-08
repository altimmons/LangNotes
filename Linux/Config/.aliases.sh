#! /bin/bash

### append alias.
# cat /boot/config/bashcustom >> /root/.bash_profile

#A quick list of aliases for my profile

alias sagi='sudo apt-get install -y'
alias sagu='sudo apt-get update'
alias sn='sudo nano'
alias AS='apt search'
alias n='nano'
alias c='code'
alias cd..='cd ..'
alias cd...='cd ..\..'
alias cd....='cd ..\..\..'
alias cd.....='cd ..\..\..\..'
alias 'cd ...'='cd ..\..'
alias 'cd ....'='cd ..\..\..'
alias 'cd .....'='cd ..\..\..\..'

alias ls='lsd -ahH'
# alias la='lsd -ah'
# alias l='lsd -lah'
alias l='ls -aHlFh'     #size,show type,human readable
alias ll="ls -lsFAHup --color=yes"
alias la='ls -laAFhH'   #long list,show almost all,show type,human readable
alias lr='ls -tRFhH'   #sorted by date,recursive,show type,human readable
alias ld='ls -ldHa --colors=always'
# alias ll='lsd -lah --blocks name size date user permission'
alias lir="ls -liR"
# alias ld='lsd -ld'


# alias lla=ls -lah
# alias lt='ls -ltFhH'   #long list,sorted by date,show type,human readable
# alias ldot='ls -ld .*'
# alias lS='ls -1FSsh'
# alias lart='ls -1Fcart'
# alias lrt='ls -1Fcrt'

########Reqires lsd
# alias tree='lsd --tree --total-size -1ha' 
alias ld=lsd -ldh
alias lsd=lsd -ld


alias clr='clear'
alias cl='clear'


######## requies Debian
alias sagu=sudo apt-get update
alias sagup=sudo apt-get update
alias sagug=sudo apt-get upgrade
alias sagup=sudo apt-get update
alias sagu=sudo apt-get update
alias sagug=sudo apt-get upgrade
alias log=sudo tail /var/syslog (?)

#llg
#colorls

#alias log="tail /var/log/syslog"
alias log='tail -20 /var/log/syslog | tac | ccat -G Decimal="blue" -G Punctuation="darkgreen" -G Type="darkgray"'
alias llg="tac /var/log/syslog  | less"
alias logc='tail -f -n 30 /var/log/syslog | tac | ccat -G Decimal="blue" -G Punctuation="darkgreen" -G Type="darkgray"'

##### requires ccat
alias cat=ccat

alias ip='ip -c'

# alias ld='ls -ldHa --colors=always'
# alias ll="ls -lsFup --color=yes"
# alias l='ls -lFh'     #size,show type,human readable
# alias la='ls -lAFhH'   #long list,show almost all,show type,human readable
# alias lr='ls -tRFhH'   #sorted by date,recursive,show type,human readable
# alias lt='ls -ltFhH'   #long list,sorted by date,show type,human readable
# alias ll='ls -lHa'      #long list
# alias ldot='ls -ld .*'
# alias lS='ls -1FSsh'
# alias lart='ls -1Fcart'
# alias lrt='ls -1Fcrt'

alias docker-compose='docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose:latest'
