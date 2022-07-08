#!/bin/bash

echo run

echo alias sagi='sudo apt-get install'
cat testtext <<TESTHERE
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
    alias la='colorls -ah --sd'
    alias l='colorls --sd'
    alias lc='colorls -laC --sd'

    alias cd..='cd ..'
    alias cd...='cd ../..'
    alias cd....='cd ../../..'
    alias pd=pushd
    alias ud=popd


    alias lf='colorls -lf'
    alias lfa='colorls -lfa'

    alias ll='colorls -lah --sd'
    alias la='colorls -a --sd'
    alias l='colorls --sd'ec
    alias lc='colorls -laC --sd'
TESTHERE > ~\testtext


echo $var
