
alias ll='ls -lF --colors=always'
alias ld='ls -ld --colors=always'
alias ll="ls -lsFup --color=yes"
alias sagi='sudo apt-get install'
alias sas='sudo apt search'
alias micro="~/usrbin/micro"
alias sagi="sudo apt-get install"
alias sas="sudo apt search"
alias cd..="cd .."
alias chmod="chomd -v"

https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases

# ls, the common ones I use a lot shortened for rapid fire usage
pyth

# to do alias log="tail (tac -length? /var/log/)

sudo apt-get install mc, ytree
#mc, ytree are file managers

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip --output ~/hack.zip


### Useful utils:

- info - simply named- adds the command for the GNU coreutils doc browser, has more info than man.
- micro -  a nicer nano - CURL https://getmic.ro | bash
- xclip 
- xsel - needed for clipboard in terminal
fzf - fuzzy line finder

sagi xclip xsel

echo "alias micro=\"~/usrbin/micro\"" >> .zshrc  (update path, quotes escaped)

to escape can do this:

'alias micro="~/usrbin/micro"'  Single quotes inside double.


### ZSH (Oh my ZSH) plugins:

https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins


### Other terminal treats

sagi colortest
 
 run as `colortest-16, colortest-8, colortest-256`

## ColorLS

https://github.com/athityakumar/colorls/issues/310

Install ruby:

 sagi ruby2.5

 Color and icons in
 
 sudo gem install colorls -- --use-system-libraries
 
sudo apt install ruby-dev

gem install colorls



Disregard below-  needs ruby-dev.

 https://github.com/athityakumar/colorls/issues/310

maybe add this?:
      
      
      source $(dirname $(gem which colorls))/tab_complete.sh >> ~/.zshrc


For WSL (Windows Subsystem for Linux) you need install build-essential package:


         $ sudo apt install build-essential


These are my aliases

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



Doesnt help



            -a, --all                        do not ignore entries starting with .
            -A, --almost-all                 do not list . and ..
            -d, --dirs                       show only directories
            -f, --files                      show only files
               --gs, --git-status           show git status for each file
               --report                     show brief report
               --format=WORD                use format: across (-x), horizontal (-x), long (-l), single-column (-1), vertical (-C)
            -1                               list one file per line
               --tree=[DEPTH]               shows tree view of the directory
            -x                               list entries by lines instead of by columns
            -C                               list entries by columns instead of by lines
            -l, --long                       use a long listing format
            -o                               use a long listing format without group information
            -g                               use a long listing format without owner information
            -G, --no-group                   show no group information in a long listing

         sorting options:

               --sd, --sort-dirs, --group-directories-first
                                             sort directories first
               --sf, --sort-files           sort files first
            -t                               sort by modification time, newest first
            -U                               do not sort; list entries in directory order
            -S                               sort by file size, largest first
            -X                               sort by file extension
               --sort=WORD                  sort by WORD instead of name: none, size (-S), time (-t), extension (-X)
            -r, --reverse                    reverse order while sorting

         options for compatiblity with ls (ignored):

            -h, --human-readable

         general options:

               --color=[WHEN]               colorize the output: auto, always (default if omitted), never
               --light                      use light color scheme
               --dark                       use dark color scheme
               --hyperlink

               --help                       prints this help
               --version                    show version
 ## Cheat.sh



## Install Gitub

[cli/install_linux.md at trunk · cli/cli](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

## Install enhanced session- HyperV

https://raw.githubusercontent.com/microsoft/linux-vm-tools/master/ubuntu/18.04/install.sh


Followed this instructions
https://francescotonini.medium.com/how-to-install-ubuntu-20-04-on-hyper-v-with-enhanced-session-b20a269a5fa7'
Ran This
https://github.com/microsoft/linux-vm-tools/blob/master/ubuntu/18.04/install.sh
(use this one- is no html)
https://raw.githubusercontent.com/microsoft/linux-vm-tools/master/ubuntu/18.04/install.sh 
Set-VM -VMName Pop-D_New_20.04 -EnhancedSessionTransportType HvSocket

https://www.hanselman.com/blog/using-enhanced-mode-ubuntu-1804-for-hyperv-on-windows-10

https://docs.microsoft.com/en-us/windows-server/virtualization/hyper-v/best-practices-for-running-linux-on-hyper-v

Info on quirks here
https://docs.microsoft.com/en-us/answers/questions/138093/hyper-v-advanced-session-doesn39t-work.html


http://ppa.launchpad.net/martinx/xrdp-hwe-18.04/ubuntu/pool/main/x/xrdp/xorgxrdp_0.9.5-2ppa1_amd64.deb
```sh
curl https://raw.githubusercontent.com/microsoft/linux-vm-tools/master/ubuntu/18.04/install.sh > ./install.sh

chmod +x 776 ./install.sh

./install.sh

//or

wget https://raw.githubusercontent.com/Microsoft/linux-vm-tools/master/ubuntu/18.04/install.sh
sudo chmod +x install.sh
sudo ./install.sh


```
polkit.addRule(function(action, subject) {
if ((action.id == “org.freedesktop.color-manager.create-device” || action.id == “org.freedesktop.color-manager.create-profile” || action.id == “org.freedesktop.color-manager.delete-device” || action.id == “org.freedesktop.color-manager.delete-profile” || action.id == “org.freedesktop.color-manager.modify-device” || action.id == “org.freedesktop.color-manager.modify-profile”) && subject.isInGroup(“{group}”))
{
return polkit.Result.YES;
}
});
``` 
>>/etc/polkit-1/localauthority.conf.d/02-allow-colord.conf 

e.g. save that there.


sudo systemctl restart xrdp
sudo systemctl restart xrdp.service

systemctl status xrdp.service
sudo groupadd tsusers
sudo groupadd tsadmins
sudo usermod -a -G tsusers andyt

sudo systemctl enable xrdp #permit it to startup 

ip add | grep inet
   172.18.130.143
   192.168.1.229

sudo ufw enable

sudo ufw allow 3389/tcp

sudo ufw default allow #risky fix me
 Stop apparmor service.

$ sudo systemctl stop apparmor

Disable apparmor from starting on system boot.

$ sudo systemctl disable apparmor
Synchronizing state of apparmor.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install disable apparmor

Remove apparmor package and dependencies. (optional)

$ sudo apt remove --assume-yes --purge apparmor
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  apparmor* snapd*
0 upgraded, 0 newly installed, 2 to remove and 0 not upgraded.
After this operation, 122 MB disk space will be freed.
##### snipped



```

This has the best info- still not working though [Pull 106](https://github.com/microsoft/linux-vm-tools/pull/106)
Set-VM -VMName <your_vm_name> -EnhancedSessionTransportType HvSocket
and

sudo apt install git
git clone https://github.com/microsoft/linux-vm-tools.git
cd linux-vm-tools
git fetch --all
git pull origin pull/106/head:pull_106
git checkout pull_106
cd ubuntu/20.04/
sudo bash ./install.sh


gnome-characters
gnome-calculator
gnome-font-viewer
gnome-extra-icons
gnome-genius - special calculator?
gnome-shell-extension-tilix-dropdown

gnome-calendar
gnome-documents
gnome-dust-icon-theme
gnome-extra-iocsn
gnome-logs
gnome-misoc
gnome-mmousetrap? -head tracking mouse ctrl


## DIalog boxes from shell scripts

Zenity
y..