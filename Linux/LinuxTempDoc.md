## GRUB

```sh
ls
#> (hd0),(hd1,gpt1)...(hd3,msdos2)
#need to find the grub loc
set root=(hd1,msdos1)
ls /
#for windows
insmod ntfs
insmod fat

#OTHER POSSIBLY USEFUL MOD'S
ls /
# find grub
ls /grub/p386-pc/
#or
lsmod

#then 
insmod
      msdospart
      part_msdos
      ntfscomp
      
      disk
      ntfs
      fat
      ldm
      file
      scsi

      archelp
      uhci #!! (after this it stopped working...)
      ahci
      part_plan 
      gptsync
      
      mdraid09_be
      mdraid09
      raid6rec
      mdraid1x
      hfs
      hfsplus #mac
      part_apple.mod
      
      efiemu32.o (.o?)
      efiemu64.o (.o?)
      command.lst (? cat //grub/p386-pc/command.lst??)
      partmap.lst (? cat //grub/p386-pc/partmap.lst??)
      modinfo.sh (? cat //grub/p386-pc/partmap.lst??)
      
#none have been tested- name just sounds useful...



set root=(hd[x],[partN])
chainloader (${root})/efi/Microsoft/Boot/bootmgfw.efi
boot

search --label Recovery 
#finds the recovery label 
hd2,gpt1 #prob a good idea to label all
chainloader ...bootmgfw.efi #DOES NOT WORK


# for linux
linux vmlinuz-
initrd init
boot
aun
```

## Filesystem Hierarchy

- `/` - Primary hierarchy root and root directory of the entire file system hierarchy.
- `/bin` - Essential command binaries in single user mode;  all users, e.g., `cat`,  `ls`, `cp`.
- `/boot` - Boot loader files, e.g., kernels, *initrd*.
      - special startup files that appear in `/`
            - `/vmlinuz` -> `/boot/vmlinuz-(VER)`
            - `/vmlinuz.old` -> `/boot/vmlinuz-(VER)`
            - `/initrd.img` -> `/boot/initrd.img-(VER)`
            - `/initrd.img.old` -> `/boot/initrd.img-(VER)`
- `/dev` - device files, e.g., */dev/null*, */dev/disk0*, */dev/sda1*, */dev/tty*, */dev/random*.
- `/etc` - Host-specific system-wide configuration files 
      - `/etc/opt` - Configuration files for add-on packages that are stored in /opt.
      - `/etc/sgml` - Configuration files, such as catalogs, for software that processes SGML.
      - `/etc/X11` - Configuration files for the X Window System, version 11.
      - `/etc/xml` - Configuration files, such as catalogs, for software that processes XML.
      - `/etc/profile.d`  -  The expectation is that when a shell is initiated all scripts in /etc/profile.d are executed. Holds the shell start up scripts.  Config is usually in ~

- `/home` - Users' home directories, containing saved files, personal settings, etc.
      - `/home/.config` - Users' home  personal settings, .  
      - `/home/<user>` the current user home dir.
            - `/home/<user>/.local`
                  - `/home/<user>/.local/bin` - seems equivalent to /usr/bin? though even more local.  Some programs make use of this but its not always added to path.
                        - `export PATH="${PATH}:/home/andyt/.local/bin"` needed to be added.
                  - `/home/<user>/.local/share`
                        Fonts, for one are here.
- `/lib` - Libraries essential for the binaries in /bin and /sbin.
      - **/lib  <qual>**- Alternative format essential libraries. Such directories are optional, but if they exist, they have some requirements- e.g. `/lib32`, or `/lib64`.
            - In Debian - is a link to -> `/usr/lib[x]`
- `lost+found` - 
- `/media` - Mount points for removable media such as CD-ROMs
- `/mnt` - Temporarily mounted filesystems.
- `/opt` - Optional application software packages.
- `/proc` - Virtual filesystem providing process and kernel information as files.***
- `/root` - Home directory for the root user.
- `/run` - Run-time variable data: Information about the running system since last boot, e.g., currently logged-in users and running daemons. *
- `/sbin` - Essential system binaries, e.g., fsck, init, route. (Deb `/sbin` -> `/usr/sbin`)
- `/snap` - Like `/opt`? - Location for snap packs
- `/srv` - Site-specific data served by this system, such as data and scripts for web servers, data offered by FTP servers, and repositories for version control systems (appeared in FHS-2.3 in 2004).
- `/sys` - Contains information about devices, drivers, and some kernel features.
- `/tmp` - Temporary files (see also `/var/tmp`). Often not preserved between system reboots, and may be severely *size restricted*.
- `/usr` - Secondary hierarchy for read-only user data; contains the majority of (**multi-**)user utilities and applications.
      - `/usr/bin` - Non-essential command binaries (not needed in single user mode); _for all users_.
      - `/usr/include` - Standard include files.
      - `/usr/lib` - Libraries for the binaries in `/usr/bin` and `/usr/sbin`.
            - **/usr/lib<qual>** - Alternative format libraries, e.g. /usr/lib32 for 32-bit libraries on a 64-bit machine (optional).
      - `/usr/local` - Tertiary hierarchy for local data, specific to this host. Typically has further subdirectories, e.g., bin, lib, share.
      - `/usr/sbin` - **Non-essential system binaries,** e.g., daemons for various network-services.
      - `/usr/share` - Architecture-independent **(shared) data.**
            - `/usr/share/doc` - Local Documentation store.
      - `/usr/src` - **Source code,** e.g., the kernel source code with its header files.
      - `/usr/X11R6` - X Window System, Version 11, Release 6 (up to FHS-2.3, _optional_).
- `/var` - Variable files—expected to continually change during normal operation —such as logs
      - `/var/cache` - Application cache data. ****
      - `/var/lib` - **State information**. Persistent data modified by programs as they run, e.g., databases, packaging system metadata, etc.
      - `/var/lock` - **Lock files. Files keeping track of resources currently in use.**
      - `/var/log` - **Log files.** Various logs.
      - `/var/mail` - Mailbox files. In some distributions, (deprecated) `/var/spool/mail`.
      - `/var/opt` - Variable data** from add-on packages** that are stored in /opt.
      - var/run - (?deprecated) **Run-time variable data**. now usually just `/run` 
      - `/var/spool` - Spool for tasks waiting to be processed, e.g., print and outgoing mail queues.
      - /var/spool/mail - Deprecated location for users' mailboxes.[12]
      - `/var/tmp` - Temporary files to be preserved between reboots.

* Files under this directory must be either removed or truncated at the beginning of the boot process; but this is not necessary on systems that provide this directory as a temporary filesystem (tmpfs).

**a system should either continue to provide a /var/run directory, or provide a symbolic link from /var/run to /run, for backwards compatibility.

*** In Linux, corresponds to a procfs mount. Generally automatically generated and populated by the system, on the fly.

**** Such data are locally generated as a result of time-consuming I/O or calculation. The application must be able to regenerate or restore the data. The cached files can be deleted without loss of data.


## Useful Programs

### via apt-get

- info - simply named- adds the command for the GNU coreutils doc browser, has more info than man.
- zsh - Terminal replacement


### untested

- atop - process monitor tool
- ctop - container monitoring tool
- hatop - haproxy monitoring tool
- htop - interactive process viewer
- iotop - IO monitor
- irqtop - observe IRQ and SoftIRQ in top like fashion
- itop - interrupt load monitor 
- jnettop - view hosts/ports taking up network traffic
- kernaltop - Linux kernal function usage
- ntopng - Webtraffic analysis and Flow Collection tools
- numatop - NUMA runtime obs tool
- pgtop -PostgreSQL db perf monitoring tool
- pkgstat - top-like utility for network connections
- (?) - powerstat 0- laptop power monitoring tool
- powertop - diagnose issues with power consumption and management
- px - ps and top for human beings
- qtop - Windowed version of console top command
- sntop - top that polls hosts to determine connectivity
- tcptrack - TCP connection tracker with states and speeds
- tiptop - perf monitoring toolk for linux
- (?) - utop - Improved OCaml toplevel
- virt-top - show stats of virtualized domains
- wmtop - dockapp that displays 3 top memory or CPU using processes
- xrestop -x11 server resource manager
- xsysinfo - display some  Linux kernal params in Graphical form


~~- dasher - graphical predictive text input tool~~ - not what it sounds like.  Think paralyed/Hawkins
- dconf-cli, dconf-editor, dconf-service, *-cli, -gsettings-backend,  - config storage system
- design-desktop, -* (animation, graphics, strict, web) - debian desktop setups
- desklaunch - utility for desktop icons
- desktop-profiles
- desktopfolders
- j4-dmenu-desktop - faster replacement for i3-dmenu-desktop



- xtra-xdg-menus - add'l categories for Gnome/KDE
- fancontrol - utility for fanspeed
- psensors -graphical temp settings
```
sudo apt-get install lm-sensors
sudo sensors-detect
sensors
sudo apt-get install psensors
```

- fbpanel - lightweight x11 desktop panel

- fctix - flexible input method framework


- duc - High performance disk usage analyzer
- pagemon - interactive memory/page monitoring tool
-ncdu - curses based diskl usage viewer
- conky , conky-cli - highly configurable system monitor
- htop -
- yacpi - ncurses based acpi monitor for text mode
- darkstat - network traffic analyzer
- gip - gnome ip calc

- clex - command line file manager using the ncurses library
      - good
- vifm - flexible vi-like file manager using ncurses
- pico - visual file  browser- but in japanese
- vfu - versatile text based file manager
      - more complicated but in color

- mtr - full screen curses (`mtr-tiny` = curses only) and X11 traceroute tool
- nast - packet sniffer and lan analyzer
- iptraf-ng - Interactive Colorful IP LAN monitor

- iselect - interactive line selection tool

- geany - text editor- xwindow
- dav-text - ncurses based text editor
- gedit - gnome text editor

- ncurses-doc, ncurses-examples

- flatpak - deployment framework
- snapd - snap packs

- usbview, usbutils

### Setting Locale

Might get errors without setting, and `raspi-config` doesnt seem to do the job.


`/etc/default/locale` should equal

```sh
#  File generated by update-locale
LANG=en_US.UTF-8
```
`sudo nano /etc/locale.gen` should have `en_US.UTF-8` uncommented

then run: `sudo locale-gen en_US.UTF-8` & `sudo update-locale en_US.UTF-8`

This generates locales.

Also, update the .bashrc


### Config

.bashrc will look for .bash_aliases and load it if present

```sh
touch .bash_aliases
sudo nano .bash_aliases

#--------Text
#! /bin/bash

alias cd..='cd ..'
alias sn='sudo nano'
echo 'aliases loaded...'
#update as needed
```

### APT Sources

is stored in `/etc/apt/sources.list`
settings stored in `[?/etc/apt] /apt.conf`

There is a users guide in _/usr/share/doc/apt-doc/

!!! Note  The apt tool merges functionalities of apt-get and apt-cache.  Apt is actually newer. 

apt   
- list
- search
- show
- update
- install *pkg*
- remove *pkg*
- upgrade
- full-upgrade
- edit-sources
- -h,  --help
- -v, --version

apt-get
- update
- upgrade
- full-upgrade
- install
- reinstall
- remove
- purge
- autoremove

apt-cache
- search



apt-file
- search
- show
 
#### upgrade distribution

`sudo apt-get dist-upgrade`

#### Purge

`sudo apt-get purge wolfram-engine`

`sudo apt-get autoremove`

`sudo apt-get update`

`sudo apt-get upgrade`

### Openbox WM

`sudo apt-get install openbox obconf obmenu`
`sudo apt-get install tint2`
`~/.config/openbox`
`touch autostart.sh`

```sh
#! /bin/sh
compton --config ~/.config/compton/compton.conf & # --shadow-exclude-'n:a:Conky' -b &
#Shadow

#screensaver
xscreensaver -nosplash &
#background
nitrogen --restore &

sleep 1

tint2 &
# bmpanel2 &
# bmpanel2 & --config ~/.config/bmpanel2/bmpanel2rc_man1 &
# bmpanel2 & --config ~/.config/bmpanel2/bmpanel2rc_man2 &

/home/andy/.conky/conky_start_rings &
```

[Source](https://www.youtube.com/watch?v=247Y6nh93I4)




### Commands

File Commands
- `ls` - Directory listing
- `ls -al` - Formatted listing with hidden files
- `ls -lt` - Sorting the Formatted listing by time modification
- `cd` *dir* - Change directory to dir
- `cd` - Change to home directory
- `pwd` - Show current working directory
- `mkdir` *dir* - Creating a directory dir
- `cat >file` - Places the standard input into the file
- `more` *file* - Output the contents of the file
- `head` *file* - Output the first 10 lines of the file
- `tail` *file* - Output the last 10 lines of the file
- `tail -f` *file* - Output the contents of file as it grows,starting with the last 10 lines
- `touch` *file* - Create or update file
- `rm` *file* - Deleting the file
- `rm -r` *dir* - Deleting the directory
- `rm -f` *file* - Force to remove the file
- `rm -rf` *dir* - Force to remove the directory dir
- `cp` *file1 file2* - Copy the contents of file1 to file2
- `cp -r` *dir1 dir2* - Copy dir1 to dir2;create dir2 if not present
- `mv` *file1 file2* - Rename or move file1 to file2,if file2 is an existing directory
- `ln -s` *file link* - Create symbolic link link to file
Process management
- `ps` - To display the currently working processes
- `top` - Display all running process
- `kill` *pid* - Kill the process with given pid
- `killall` *proc* - Kill all the process named proc
- `pkill` *pattern* - Will kill all processes matching the pattern
- `bg` - List stopped or background jobs,resume a stopped
job in the background
- `fg` - Brings the most recent job to foreground
- `fg` *#* - Brings job n to the foreground
File permission
- `chmod` _[octal]_  *file* - Change the permission of file to octal,which can be found separately for user,group,world by adding,
   - [4]-read(r)
   - [2]-write(w)
   - [1]-execute(x)
Searching
- `grep pattern` *file* - Search for pattern in file
- `grep -r pattern` *dir* - Search recursively for pattern in dir
- _[command]_ `| grep` *pattern*` - Search pattern in the output of a command
- `locate` *file* - Find all instances of file
- `find . -name` *filename* - Searches in the current directory (represented by a period) and below it, for files and directories with names starting with filename
- `pgrep` *pattern* - Searches for all the named processes , that matches with the pattern and, by default, returns their ID
System Info
- `date` - Show the current date and time
- `cal` - Show this month's calender
- `uptime` - Show current uptime
- `w` - Display who is on line
- `whoami` - Who you are logged in as
- `finger user` - Display information about user
- `uname -a` - Show kernel information
- `cat /proc/cpuinfo` - Cpu information
- `cat proc/meminfo` - Memory information
- `man command` - Show the manual for command
- `df` - Show the disk usage
- `du` - Show directory space usage
- `free` - Show memory and swap usage
- `whereis app` - Show possible locations of app
- `which app` - Show which applications will be run by default
Compression
- `tar cf file.tar` *file* - Create tar named file.tar containing file
- `tar xf file.tar` - Extract the files from file.tar
- `tar czf file.tar.gz files` - Create a tar with Gzip compression
- `tar xzf file.tar.gz` - Extract a tar using Gzip
- `tar cjf` *file.tar.bz2* - Create tar with Bzip2 compression
- `tar xjf` *file.tar.bz2* - Extract a tar using Bzip2
- `gzip` *file* - Compresses file and renames it to file.gz
- `gzip -d file.gz` - Decompresses file.gz back to file

Network
- `ping host` - Ping host and output results
- `whois domain` - Get whois information for domains
- `dig domain` - Get DNS information for domain
- `dig -x host` - Reverse lookup host
- `wget` *file* - Download file
- `wget -c` *file* - Continue a stopped download

Shortcuts
- [[ctrl+c]] - Halts the current command
- [[ctrl+z]] - Stops the current command, resume with fg in the
foreground or bg in the background
- [[ctrl+d]] - Logout the current session, similar to exit
- [[ctrl+w]] - Erases one word in the current line
- [[ctrl+u]] - Erases the whole line
- [[ctrl+r]] - Type to bring up a recent command
- [[!!]] - Repeats the last command
- [[exit]] - Logout the current session


```regex
([0-9]{1,2}\. )([a-z -0-9>.|]+?)([A-Z].*)

- `$2` - $3

\b `
`
```

## Admin

sudo  -i to get to root

`visudo` to edit `/etc/sudoers` file which is what controls who has permission to use `s

```bash
su # to get to root
#Use Root Password

sudo usermod -aG sudo,adm andy #where andy is username
```
Admin Groups:

sudo (/etc/sudoers, /etc/sudoers.d)
adm

`sudo` is more more secure than `su` command. By default it logs `sudo` usage, command and arguments in *_/var/log/secure_* (Red Hat/Fedora / CentOS Linux) or _*/var/log/auth.log*_ (Ubuntu / Debian Linux).
vipw

passwd

gpasswd

groupadd

groupdel

sudo useradd USERNAME 

without shell access:

sudo useradd USERNAME --shell /bin/false

hide a user on the login screen of `lightdm`  (/etc/lightdm/users.conf) by adding to the line:

`hidden-users=USERNAME`


## Determine who is using a file

`fuser` 

      SYNOPSIS
            fuser [-fuv] [-a|-s] [-4|-6] [-c|-m|-n space] [ -k [-i] [-M] [-w] [-SIGNAL] ] name ...
            fuser -l
            fuser -V

      DESCRIPTION
            fuser  displays  the  PIDs of processes using the specified files or file systems.  In the default display
            mode, each file name is followed by a letter denoting the type of access:

      Usage: fuser [-fIMuvw] [-a|-s] [-4|-6] [-c|-m|-n SPACE]
                  [-k [-i] [-SIGNAL]] NAME...
            fuser -l
            fuser -V
      Show which processes use the named files, sockets, or filesystems.

      -a,--all              display unused files too
      -i,--interactive      ask before killing (ignored without -k)
      -I,--inode            use always inodes to compare files
      -k,--kill             kill processes accessing the named file
      -l,--list-signals     list available signal names
      -m,--mount            show all processes using the named filesystems or
                              block device
      -M,--ismountpoint     fulfill request only if NAME is a mount point
      -n,--namespace SPACE  search in this name space (file, udp, or tcp)
      -s,--silent           silent operation
      -SIGNAL               send this signal instead of SIGKILL
      -u,--user             display user IDs
      -v,--verbose          verbose output
      -w,--writeonly        kill only processes with write access
      -V,--version          display version information
      -4,--ipv4             search IPv4 sockets only
      -6,--ipv6             search IPv6 sockets only
      -                     reset options

      udp/tcp names: [local_port][,[rmt_host][,[rmt_port]]]


## Mounting a drive

```sh
cd ~
mkdir /share/sdd2
sudo mount /dev/sdd2 ./share/sdd2
```


      Usage:
      mount [-lhV]
      mount -a [options]
      mount [options] [--source] <source> | [--target] <directory>
      mount [options] <source> <directory>
      mount <operation> <mountpoint> [<target>]

      Mount a filesystem.

      Options:
      -a, --all               mount all filesystems mentioned in fstab
      -c, --no-canonicalize   don't canonicalize paths
      -f, --fake              dry run; skip the mount(2) syscall
      -F, --fork              fork off for each device (use with -a)
      -T, --fstab <path>      alternative file to /etc/fstab
      -i, --internal-only     don't call the mount.<type> helpers
      -l, --show-labels       show also filesystem labels
      -n, --no-mtab           don't write to /etc/mtab
      -o, --options <list>    comma-separated list of mount options
      -O, --test-opts <list>  limit the set of filesystems (use with -a)
      -r, --read-only         mount the filesystem read-only (same as -o ro)
      -t, --types <list>      limit the set of filesystem types
         --source <src>      explicitly specifies source (path, label, uuid)
         --target <target>   explicitly specifies mountpoint
      -v, --verbose           say what is being done
      -w, --rw, --read-write  mount the filesystem read-write (default)

      -h, --help              display this help
      -V, --version           display version

      Source:
      -L, --label <label>     synonym for LABEL=<label>
      -U, --uuid <uuid>       synonym for UUID=<uuid>
      LABEL=<label>           specifies device by filesystem label
      UUID=<uuid>             specifies device by filesystem UUID
      PARTLABEL=<label>       specifies device by partition label
      PARTUUID=<uuid>         specifies device by partition UUID
      <device>                specifies device by path
      <directory>             mountpoint for bind mounts (see --bind/rbind)
      <file>                  regular file for loopdev setup

      Operations:
      -B, --bind              mount a subtree somewhere else (same as -o bind)
      -M, --move              move a subtree to some other place
      -R, --rbind             mount a subtree and all submounts somewhere else
      --make-shared           mark a subtree as shared
      --make-slave            mark a subtree as slave
      --make-private          mark a subtree as private
      --make-unbindable       mark a subtree as unbindable
      --make-rshared          recursively mark a whole subtree as shared
      --make-rslave           recursively mark a whole subtree as slave
      --make-rprivate         recursively mark a whole subtree as private
      --make-runbindable      recursively mark a whole subtree as unbindable

-you can remount a drive elsewhere with

```bash
mount --bind OLDDIR NEWDIR
#or in fstab:
/OLDDIR /NEWDIR none bind
## THIS MOUNTS IN 2 places- see man
#to move:
mount --move OLDDIR NEWDIR
```

### Finding Drives

`findmnt` can be used to list already mounted drives

(cont below)

            findmnt - find a filesystem

            SYNOPSIS
                  findmnt [options]

                  findmnt [options] device|mountpoint

                  findmnt [options] [--source] device [--target|--mountpoint] mountpoint

            EXAMPLES
                  findmnt --fstab -t nfs
                        Prints all NFS filesystems defined in /etc/fstab.

                  findmnt --fstab /mnt/foo
                        Prints  all /etc/fstab filesystems where the mountpoint directory is /mnt/foo.  It also prints bind mounts where /mnt/foo is a source.

                  findmnt --fstab --target /mnt/foo
                        Prints all /etc/fstab filesystems where the mountpoint directory is /mnt/foo.

                  findmnt --fstab --evaluate
                        Prints all /etc/fstab filesystems and converts LABEL= and UUID= tags to the real device names.

                  findmnt -n --raw --evaluate --output=target LABEL=/boot
                        Prints only the mountpoint where the filesystem with label "/boot" is mounted.

                  findmnt --poll --mountpoint /mnt/foo
                        Monitors mount, unmount, remount and move on /mnt/foo.

                  findmnt --poll=umount --first-only --mountpoint /mnt/foo
                        Waits for /mnt/foo unmount.

                  findmnt --poll=remount -t ext3 -O ro
                        Monitors remounts to read-only mode on all ext3 filesystems.

[Good answer](https://serverfault.com/questions/190685/whats-the-best-way-to-get-info-about-currently-unmounted-drives)


suggests `fdisk -l`, `sfdisk -l`, `vol_id` (now `blkid`), `lshw -class disk`, `tune2fs -l /dev/sda1`, `parted /dev/sda print all` 

but none of those worked.  Only `lsblk` worked.

which gave excellent output.

### Format a drive

```bash
sudo mkfs.exfat -n "LABEL" /dev/sdk1
```


## samba share

Windows compatible file sharing

```sh
sudo apt-get update
sudo apt-get samba
#setup
sudo smbpasswd -a USERNAME

#if you need to take ownership
sudo chown USERNAME /var/opt/blah blah blah
sudo chown :USERNAME /var/opt/blah blah blah
#

# Create a user w/o shell access and remove from lightdm
sudo useradd USERNAME --shell /bin/false
#in /etc/lightdm/users.conf edit the line
hidden-users=USERNAME
#

#Create a share dir
mkdir ~/share

#backup the settings
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
1248
```

Netmask defines how "large" a network is or if yo're configuring a rule that requires an IP address and a Netmask, the Netmask will signify to what portion or range of the Network the rule will apply to:

            | IP                    | NETMASK         | DESCRIPTION                        |
            | -------------- | --------------- | ----------------------------------- |
            | 192.168.55.161 | 255.255.255.255 | Only applies to 192.168.55.161  |
            | 192.168.55.0     | 255.255.255.0     | 192.168.55.0 - 192.168.55.255 range |
            | 192.168.55.240 | 255.255.255.240 | 192.168.55.240 - 192.168.55.255  |
            | 192.168.55.161 | 255.255.255.0     | 192.168.55.0 - 192.168.55.255      |
            | 192.168.0.0       | 255.255.0.0         | 192.168.0.0 - 192.168.255.255      |


Sometimes you will see that a Netmask is defined by one number, e.g., 24. This number is the length of the Netmask in bits:


So, for example, a Netmask that is 24-bits long is 255.255.255.0:

            | Octet   | 1    | 2    | 3    | 4   |
            | ------- | ---- | ---- | ---- | --- |
            | NETMASK | 255. | 255. | 255. | 255 |
            | length  | 8    | 16   | 24   | 32  |
            | NETMASK | 255. | 255. | 255. | 0   |
            | length  | 8    | 16   | 24   | -   |
            | NETMASK | 255. | 255. | 0.   | 0   |
            | length  | 8    | 16   | -    | -   |

A Netmask that is 16-bits long is 255.255.0.0:

            | Class | network addresses           | net mask      | net mask /bits | # of subnets |
            | ----- | --------------------------- | ------------- | -------------- | ------------ |
            | A     | 10.x.x.x                    | 255.0.0.0     | /8             | 1            |
            | B     | 172.16.x.x — 172.31.x.x     | 255.255.0.0   | /16            | 16           |
            | C     | 192.168.0.x — 192.168.255.x | 255.255.255.0 | /24            | 256          |

The mDNS IPv4 link-local multicast address "224.0.0.251" or its IPv6 equivalent "FF02::FB" are used to make DNS query for a name ending with ".local".

```
sudo adduser USER netdev

#show devices
ip -brief link show
```

## Services

[Example from](https://docs.mainsail.xyz/setup/manual-setup/klipper#configuration--startup-service)


> After Klipper is installed, you will need to create a startup script to define log, config & UDS service > location:
> 
> To edit this file type:
> 
> `sudo nano /etc/systemd/system/klipper.service`
> fill in these lines:
> ```properties
>      #Systemd Klipper Service
>      
>      [Unit]
>            Description=Starts Klipper and provides klippy Unix Domain Socket API
>            Documentation=https://www.klipper3d.org/
>            After=network.target
>            Before=moonraker.service
>           Wants=udev.target
>      
>      [Install]
>            Alias=klippy
>          WantedBy=multi-user.target
>      
>      [Service]
>            Environment=KLIPPER_CONFIG=/home/pi/klipper_config/printer.cfg
>            Environment=KLIPPER_LOG=/home/pi/klipper_logs/klippy.log
>            Environment=KLIPPER_SOCKET=/tmp/klippy_uds
>            Type=simple
>            User=pi
>            RemainAfterExit=yes
>            ExecStart= /home/pi/klippy-env/bin/python /home/pi/klipper/klippy/klippy.py ${KLIPPER_CONFIG} -l $> {     KLIPPER_LOG} -a ${KLIPPER_SOCKET}
>           Restart=always
>           RestartSec=10
> ```
> 
> Save the file with CTRL+O and close the editor with CTRL+X.
> 
> Please check and modify the username!
> If you do not use the user pi, you must replace it in each path and in the variable user in the service > file.
> 
> To enable and start the Klipper service execute these commands:
> 
> sudo systemctl enable klipper.service