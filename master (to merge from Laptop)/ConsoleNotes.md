terminal history

sudo snap install --classic dmd && sudo snap install --classic dub


Powertop
Joe --terminal editor
can use gedit
HTOP
snapd
powertop
joe
HTOp
Brave - web brower
Okular for PDF

Claibre
XNconvert


## faceid



```bash
sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update
sudo apt install howdy
sudo howdy add
```


Command 	Description
add 	Add a new face model for an user
clear 	Remove all face models for an user
config 	Open the config file in your default editor
disable 	Disable or enable howdy
list 	List all saved face models for an user
remove 	Remove a specific model for an user
test 	Test the camera and recognition methods


## Upgrade system

$ sudo apt update
$ sudo apt upgrade
$ sudo apt autoremove

Configure the release upgrader. Open and edit the /etc/update-manager/release-upgrades file and ensure that the Prompt variable is set to normal.
m
 sudo do-release-upgrade

 ```
 sudo add-apt-repository ppa:leaeasy/dde
 sudo apt-get update
 sudo apt-get install dde
sudo apt-get install dde-file-manager
sudo apt-get install dde-file-manager


do-release-upgrade -c command).



appstream-data-pop-icons-hidpi (version 0.0.2~1556635981~18.10~4a31e18) will be installed
backstep (version 0.3-0ubuntu7) will be installed
fatattr (version 1.0.1-14) will be installed
fusefat (version 0.1a-1.1build1) will be installed
libpython-dbg (version 2.7.15-3) will be installed
libpython2-dbg (version 2.7.15-3) will be installed
libpython2.7-dbg (version 2.7.16-2~18.10) will be installed
mypaint-brushes (version 1.3.0-1.1) will be installed
mypaint-data-extras (version 1.2.0-4.1) will be installed
python-dbg (version 2.7.15-3) will be installed
python-gi-cairo (version 3.30.1-1ubuntu1) will be installed
python-numpy (version 1:1.14.5-1ubuntu4) will be installed
python-numpy-dbg (version 1:1.14.5-1ubuntu4) will be installed
python-numpy-doc (version 1:1.14.5-1ubuntu4) will be installed
python2-dbg (version 2.7.15-3) will be installed
python2.7-dbg (version 2.7.16-2~18.10) will be installed




```

very helpful is tasksel

this allows installing a bunch of desktops- all the official ubunutu ones- mate, lubuntu, studio, as well as other packages for photo editing, 3d stuff, etc.


```
sudo apt install tasksel
sudo tasksel
```

## ways to install programs:

apt-get (apt, dpkg, synaptic, aptitude)
flatpack
snap
AppImage

[AppImage info](https://www.linuxuprising.com/2018/04/easily-run-and-integrate-appimage-files.html)
            With AppImageLauncher, these are problems of the past. The application lets you easily run AppImage files, without having to make them executable. But its most interesting feature is easily integrating AppImages with your system: AppImageLauncher can automatically add an AppImage application shortcut to your desktop environment's application launcher / menu (including the app icon and proper description).

            Here's an example. I want to use Kdenlive in Ubuntu but I don't want to install it from the repositories, because it has a large number of KDE dependencies, and I don't want them on my Gnome system. Since there are no Flatpak or Snap images for it, I'll go ahead and download the Kdenlive AppImage.

            Without making the downloaded Kdenline AppImage executable manually, the first time I double click it (having AppImageLauncher installed), AppImageLauncher presents two options: Run once or Integrate and run.

Need AppImageLauncher to install OCS-Store.

            OCS-Store is a Content Management App for OCS-compatible websites like opendesktop.org, gnome-look.org, etc.
            It allows to download, install and apply desktop themes, icon themes, wallpapers, or mouse cursors under various desktop environments using the "Install"-button.

            Currently supported are these desktop environments:
            KDE Plasma, Gnome, XFCE, Mate, Cinnamon, Budgie, LXQt, Elementary and Enlightenment.

git clone https://github.com/jsalatas/plasma-pstate
cd plasma-pstate
sudo ./install.sh


## nerdfonts

        usage: font-patcher [-h] [-v] [-s] [-l] [-q] [-w] [-c] [--fontawesome]
                            [--fontawesomeextension] [--fontlinux] [--octicons]
                            [--powersymbols] [--pomicons] [--powerline]
                            [--powerlineextra] [--material] [--weather]
                            [--custom [CUSTOM]] [--postprocess [POSTPROCESS]]
                            [--removeligs] [--configfile [CONFIGFILE]]
                            [--progressbars | --no-progressbars] [--careful]
                            [-ext [EXTENSION]] [-out [OUTPUTDIR]]
                            font

        Nerd Fonts Font Patcher: patches a given font with programming and development related glyphs

        * Website: https://www.nerdfonts.com
        * Version: 2.0.0
        * Development Website: https://github.com/ryanoasis/nerd-fonts
        * Changelog: https://github.com/ryanoasis/nerd-fonts/blob/master/changelog.md

        positional arguments:
        font                  The path to the font to patch (e.g., Inconsolata.otf)

        optional arguments:
        -h, --help            show this help message and exit
        -v, --version         show program's version number and exit
        -s, --mono, --use-single-width-glyphs
                                Whether to generate the glyphs as single-width not double-width (default is double-width)
        -l, --adjust-line-height
                                Whether to adjust line heights (attempt to center powerline separators more evenly)
        -q, --quiet, --shutup
                                Do not generate verbose output
        -w, --windows         Limit the internal font name to 31 characters (for Windows compatibility)
        -c, --complete        Add all available Glyphs
        --fontawesome         Add Font Awesome Glyphs (http://fontawesome.io/)
        --fontawesomeextension
                                Add Font Awesome Extension Glyphs (https://andrelzgava.github.io/font-awesome-extension/)
        --fontlinux, --fontlogos
                                Add Font Linux and other open source Glyphs (https://github.com/Lukas-W/font-logos)
        --octicons            Add Octicons Glyphs (https://octicons.github.com)
        --powersymbols        Add IEC Power Symbols (https://unicodepowersymbol.com/)
        --pomicons            Add Pomicon Glyphs (https://github.com/gabrielelana/pomicons)
        --powerline           Add Powerline Glyphs
        --powerlineextra      Add Powerline Glyphs (https://github.com/ryanoasis/powerline-extra-symbols)
        --material, --materialdesignicons, --mdi
                                Add Material Design Icons (https://github.com/templarian/MaterialDesign)
        --weather, --weathericons
                                Add Weather Icons (https://github.com/erikflowers/weather-icons)
        --custom [CUSTOM]     Specify a custom symbol font. All new glyphs will be copied, with no scaling applied.
        --postprocess [POSTPROCESS]
                                Specify a Script for Post Processing
        --removeligs, --removeligatures
                                Removes ligatures specified in JSON configuration file
        --configfile [CONFIGFILE]
                                Specify a file path for JSON configuration file (see sample: src/config.sample.json)
        --progressbars        Show percentage completion progress bars per Glyph Set
        --no-progressbars     Don't show percentage completion progress bars per Glyph Set
        --careful             Do not overwrite existing glyphs if detected
        -ext [EXTENSION], --extension [EXTENSION]
                                Change font file type to create (e.g., ttf, otf)
        -out [OUTPUTDIR], --outputdir [OUTPUTDIR]
                                The directory to output the patched font file to

for f in ./AllFonts/* ; do echo $f; done

-slwc --progressbars --careful -ext otf -out \new-patched\
