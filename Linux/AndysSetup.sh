#! /bin/bash

#This is two things-
# 1- a log of the things I did to customize my machine
# 2- a quick setup script to recreate it

#   https://github.com/robbyrussell/oh-my-zsh
#
#   https://github.com/Powerlevel9k/powerlevel9k
#   https://github.com/romkatv/powerlevel10k
#   https://github.com/b-ryan/powerline-shell
#   https://github.com/ryanoasis/nerd-fonts
#   https://github.com/Peltoche/lsd
https://github.com/unixorn/awesome-zsh-plugins#plugins
#NOTE: You have to use one of the Nerd Fonts to see correct icons for some icon sets (Devicons, Font Awesome Extension, Font Linux), but other sets should work with their standard fonts too.

cd ~
touch .aliases.sh

add2zsh(){
    echo "$1" >> ~/.zshrc
}

isItInstalled(){
    local res=$(apt-cache policy $1 | grep Installed | awk {'print $2'})
    if [$res == "(none)"]
    then
        return 1
    else
        return 0
    fi
}


echo "alias sagu='sudo apt-get update'" >> .aliases.sh
echo "alias sagi='sudo apt-get install -y'" >> .aliases.sh
echo "alias sn='sudo nano'" >> .aliases.sh
echo "alias AS='apt search'">>.aliases.sh
echo "alias n=nano" >> .aliases.sh
echo "alias c=code" >> .aliases.sh
echo "alias cd..='cd ..'">> ~/.aliases.sh

source .aliases.sh

sagi zsh zsh-common zsh-syntax-highlighting zsh-theme-powerlevel9k zsh-antigen fonts-powerline

cp -r /usr/share/powerlevel9k ~/.oh-my-zsh/custom/themes/
add2zsh 'ZSH_THEME="powerlevel9k/powerlevel9k"'


#or via antigen...
echo "POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k" >> ~/.zshrc
#And this anywhere after:
echo "antigen theme bhilburn/powerlevel9k powerlevel9k" >> ~/.zshrc
echo "antigen apply" >> ~/.zshrc

#install oh-my-zsh
#via curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#via wget
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


#https://github.com/ryanoasis/nerd-fonts/blob/master/install.sh


#sh -c "$(curl -fsSL https://github.com/ryanoasis/nerd-fonts/blob/master/install.sh")

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ryanoasis/nerd-fonts/blob/master/install.sh")

#Template
#echo " " >> ~/.zshrc

cd ~/Downloads
mkdir nerd-fonts.d
#cd ./nerd-fonts.d
cd !!1
echo "This may take a while..."

git clone https://github.com/ryanoasis/nerd-fonts

#Need the whole thing,
    #curl -Lo nerd-fonts-install.sh https://github.com/ryanoasis/nerd-fonts/blob/master/install.sh
    #doesnt work.  Downloads webpage
    #curl -Lo nerd-fonts-install.sh https://raw.githubusercontent.com/ryanoasis/nerd-fonts/blob/master/install.sh
    #doesnt work.  Downloads 404
    #have to remove '/blob/'
    #curl -Lo nerd-fonts-install.sh https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/install.sh
    #install.sh
    #check to make sure it exists...
    # if (-x something something)
    #chmod +x nerd-fonts-install.sh

cd nerd-fonts

echo "installing Nerd Fonts"

if [-e ]

local file='install.sh'
if [-x $file]
then
    ./install.sh -q
    #defaults are fine.  Implied -Atcu (all, copy, user dir)
else
    chmod +x ./install.sh
    ./install.sh
fi


chsh ${which zsh}
echo 'source .aliases.sh' >> ~/.zshrc


sagi snapd

echo "Installing powerlevel 10k"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo 'source /usr/share/powerlevel9k/powerlevel9k.zsh-theme' >> ~/.zshrc

echo "POWERLEVEL9K_MODE='nerdfont-complete'" >> ~/.zshrc




# simple mode

echo "alias pl-off='prompt_powerlevel9k_teardown'" >> ~/.aliases
#You can then re-enable it by calling:
echo "alias pl-on='prompt_powerlevel9k_setup'" >> ~/.aliases

#Install LSD (Next Gen LS Command)


#sudo dpkg -i lsd_7.2.0_amd64.deb


## Install Font-Forge
echo "installing Font Forge (For Patching Fonts"
sudo apt-get install software-properties-common
echo "Already having this is expected..."
sudo add-apt-repository ppa:fontforge/fontforge;
sudo apt-get update;
sudo apt-get install fontforge

