#!/bin/bash

sudo apt install git

sudo apt install build-essential
sagi xclip xsel fzf

sudo apt install python3 python3-pip python3-setuptools python3-distutils-extra  python-setuptools-doc python3-pygments 

#Ubuntu set python3 as default
sudo update-alternatives --install /usr/bin/python python $(which python3) 1


# install tilix
##todo get quake style tmux

#this is needed to patch func missing in some ubuntu dists.
 sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh

## Update path to include some extra dirs

echo 'export PATH="$PATH:/home/.local/bin"' >> ~/.zshrc
echo 'export PATH="$PATH:/home/.local/bin"' >> ~/.bashrc


#get mouse to work  NOTWORKING
sudo apt-get install xbindkeys xautomation x11-utils
#havent finished this

#network tool
sudo apt install iftop vnstat cbm bmon iptraf
sudo apt install icinga2 icingacli icingaweb2


#random libraries 
sudo apt install libreadline8 libreadline-java libreadline-java-doc

sudo apt install fonts-unifont 
sudo apt install timewarrior taskwarrior vit 

#install github cli?

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

wget https://github.com/jingweno/ccat/releases/download/v1.1.0/linux-amd64-1.1.0.tar.gz 
tar xfz linux-amd64-1.1.0.tar.gz
sudo cp linux-amd64-1.1.0/ccat /usr/local/bin
rm ./linux-amd64-1.1.0/*
rm -d linux-amd64-1.1.0/
rm ./linux-amd64-1.1.0.tar.gz 


#custom tmux
#https://www.byobu.org/
sudo apt install byobu

# File Managers, 
sudo apt install nnn mc -

#CMake v3.17  v3.20 is latest, machines always have earlier.
# https://github.com/Kitware/CMake/releases?after=v3.18.4
# https://pypi.org/project/cmake/
# https://snapcraft.io/cmake
# sudo snap install cmake --channel=3.17/stable --classic
#download the github one
chmod +x ./cmake-3.17.5-Linux-x86_64.sh
pushd /opt
sudo mkdir cmake
cd cmake
sudo bash ~/Downloads/cmake-3.17.5-Linux-x86_64.sh 


# y then n to install in current dir
#needed for pop desktop
sudo ln -f ./bin/* /usr/bin/

sudo update-alternatives --install /usr/bin/cmale cmake /opt/cmake/bin/cmake 60

##zsh plugins
#  https://github.com/unixorn/awesome-zsh-plugins#plugins

sudo apt install node-typescript make git
git clone https://github.com/pop-os/shell
cd shell
make local-install

git clone https://github.com/pop-os/shell-shortcuts
cd shell-shortcuts
make
sudo make install

sudo apt-get install zsh zsh-common 


sudo apt install zsh-antigen
mkdir ~/.antigen
cd ~/.antigen
git init .
git submodule add https://github.com/zsh-users/antigen.git antigen
touch ./.zshrc


#or oh-my zsh:
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"




sudo apt install zsh-theme-powerlevel9k fonts-powerline 
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf



git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

git clone https://github.com/Kallahan23/zsh-colorls ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-colorls

#install samba?
sudo apt-get samba
sudo smbpasswd -a USERNAME

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

#toilet fonts
#https://sequoia.makes.software/fun-with-toilet/

#
# while read -r filt;
#    do echo "$filt";
#    toilet -f mono12 $USER -F "$filt";
#done < <(toilet -F list | sed -n 's/\"\(.*\)\".*/\1/p')

#ryanoasis/nerd-fonts
git clone https://github.com/ryanoasis/nerd-fonts.git
sudo ./install.sh -S -C -c -O -A
#this takes a while


 sudo apt install ttf-mscorefonts-installer
sudo apt-get install toilet toilet-fonts
#color ls

sagi ruby ruby-dev
sudo gem install colorls
######################

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
###############################

sudo apt-get install mc, ytree


sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


pushd /opt/

sudo sh -c "$(curl -fsSL https://getmic.ro)"
sudo ln -s /opt/micro /usr/local/bin/
#or whatever path its installed to- careful will install to current dir.


#sudo curl https://getmic.ro | bash
echo 'alias micro="~/usrbin/micro"'  >> ~/.bash_aliases



# https://github.com/romkatv/powerlevel10k
#to do. gist to append.
#.bashrc will look for .bash_aliases and load it if present
touch .bash_aliases


alias cd..='cd ..'
alias sn='sudo nano'
alias sagi='sudo apt-get install'
alias sai='sudo apt install'


alias ll='ls -lF --colors=always'
alias ld='ls -ld --colors=always'
alias ll="ls -lsFup --color=yes"
alias sagi='sudo apt-get install'
alias sas='sudo apt search'
alias micro="~/usrbin/micro"
alias sagi="sudo apt-get install"
alias sas="sudo apt search"
alias cd..="cd .."


echo 'aliases loaded...'
#update as needed


#https://midnight-commander.org/

#make a new ssl cert 
sudo openssl req -x509 -newkey rsa:2048 -nodes -keyout key.pem -out cert.pem -days 365
#add xrdp
sudo adduser xrdp ssl-cert
sudo ufw allow 3389
#put hole in fierewalll

Make sure something is running for VNC?
Ubuntu has gnome-remote-desktop gnome-remote-d
sudo systemctl status gnome-remote-desktop
#not found
sudo systemctl show
#reveals directories
cd /etc/systemd/
ls
#here a few potentials
logind.conf
sudo systemctl status xrdp.service
#this seems equiv to
sudo service xrdp status

sudo systemctl restart xrdp.service
#Gives the change Resolution screen! but fails :<
netstat -lvp | grep vnc
ps -fe #show daemons

# https://askubuntu.com/questions/234856/unable-to-do-remote-desktop-using-xrdp
# edit the "/etc/xrdp/xrdp.ini" file to include the line:
#     address=0.0.0.0
#     right under #background=626x72 line. 0.0.0.0 is the local server address of xrdp
# - Restart xrdp service
# - allow xrdp port (probably 3389) through firewall
# - We also need a VNC server. Install tightvncserver on Linux server machine. 
# - run tightvncserver (no need to create a view-only password)
# - "netstat -lvp | grep vnc" to check out the ports that tightvnc is listening on for 
#     connections
# - allow the vncserver port from the firewall: sudo ufw allow #

#fix missing securetty error
sudo edit /etc/pam.d/common-auth
#replace this line to remove nullok_secure
# auth [success=1 defauilt = ignore] pam_unix.so `nullok_secure`
#requires reboot
#https://askubuntu.com/questions/1239503/ubuntu-20-04-and-20-10-etc-securetty-no-such-file-or-directory


################################
##new setup

mkdir .zshconfig
cd .zshconfig
git init . 
git submodule add https://github.com/zsh-users/antigen.git antigen
touch .zshrc
git add .zshrc
ln -s ./.zshrc ~/.zshrc