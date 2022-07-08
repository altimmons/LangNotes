##Unraid

## Network Settings

Change to Jumbo Frames:

https://wiki.unraid.net/Improving_unRAID_Performance#:~:text=You%20can%20set%20the%20MTU,experiment%20with%20different%20MTU%20settings.

ifconfig

Ive set eth 4/5 as the 10gb adapter.

Direct connection:

On linux- 192.168.99.2


Note, in retrospect, I wish I'd used a different subnet/ip

Ok changed to 169.254.0.1 & 2

on linux (unraid)

Set jumbo frames:

ifconfig eth4 mtu 9014

to make persistant append this to /boot/config/network.cfg

```
#added 10/31/20 alt
ifcongig eth4 mtu 9014
```

added a route


```
>> route add -host 169.254.0.1 gw 169.254.0.2 metric 0 dev eth4

169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth4
DESKTOP.local   Unraid.local    255.255.255.255 UGH   0      0        0 eth4
```
On windows:

Need to do `route print interface` to print the interfaces.

Then 
`>route -p add 192.168.99.2 192.168.99.1 IF 37`


## Nice to know commands



### Docker service

`/etc/rc.d/rc.docker <command>`

Available commands: `start stop restart status`

### Docker containers

`docker <command> <containername>`
Available commands: `start stop restart pasue logs`

Print all container names:


`docker ps --format ‘{{.Names}}’`

Print all container images:


`docker ps --format ‘{{.Image}}’`

### Nginx

`/etc/rc.d/rc.nginx <command>`
Available commands: `start stop restart status`

### PHP

`/etc/rc.d/rc.php-fpm <command>`

Available commands: `start stop restart status`

### VM Service

`/etc/rc.d/rc.libvirt <command>`

Available commands: `start stop`


### Domains

List all domains:

`virsh list --all`

`virsh <command> <domain>`
Available commands: `start shutdown reboot suspend`

### Samba

`/etc/rd.d/rc.samba <command>`

Available commands: `start stop`

### Unraid

- Shutdown/Reboot
   `/sbin/<command>`

   Available commands: `reboot poweroff shutdown`

   Note `poweroff` will gracefully shut everything down, even spin down the hard drives, but will not actually turn off the power supply.But there is a race condition in the code which could cause the system to power off before the Flash is updated indicating 'clean shutdown'. This can't cause data loss, but will cause parity-check to automatically start upon next reboot.

- Run diagnostics

   `diagnostics`

- Tail the syslog

   `tail -f /var/log/syslog`

- Look at the parameters in the config file

   `nano /boot/syslinux.cfg-`

- Create a backup image of your usb and store it on disk1

   `dd if=/dev/sda of=/mnt/disk1/unraid.img`

- Copy files using midnight commander

   `mc`
- Check power on hours for all drives

   `for drive in $(ls -la /dev | grep -Ev 'sda|sd[a-z][0-9]' | grep sd[a-z] | awk '{print $10}'); do hours=$(smartctl --all /dev/${drive} | grep Power_On_Hours | awk '{print $10}'); echo "Power on Hours for ${drive}: ${hours}"; echo ''; done`

(^- )([ ]*)(\S)  1$3
## Following on Services

- rc.0@
- rc.apcupsd*
- rc.cpufreq*
- rc.inet1*
- rc.local_shutdown*
- rc.ntpd*
- rc.setterm*
- rc.4*
- rc.atalk*
- rc.crond*
- rc.inet1.conf
- rc.loop*
- rc.php-fpm*
- rc.smartd
- rc.6*
- rc.atd*
- rc.diskinfo*
- rc.inet2*
- rc.messagebus*
- rc.rpc*
- rc.sshd*
- rc.K*
- rc.avahidaemon*
- rc.dnsmasq
- rc.inetd*
- rc.modules*
- rc.rsyslogd*
- rc.sysvinit*
- rc.M*
- rc.avahidnsconfd*
- rc.docker*
- rc.ip_forward
- rc.modules.local*
- rc.samba*
- rc.udev*
- rc.S*
- rc.cgconfig
- rc.fuse3*
- rc.libvirt*
- rc.nfsd*
- rc.saslauthd
- rc.vnstat*
- rc.acpid*
- rc.cgred
- rc.haveged*
- rc.local*
- rc.nginx*
- rc.serial
- rc.wireguard*

## Sharing error

[More on NFS](https://wiki.archlinux.org/index.php/NFS#Server)


initially `/etc/exports` was 

         #"/mnt/user/rA" -async,no_subtree_check,fsid=100 *(sec=sys,rw,insecure,anongid=100,anonuid=99,all_squash)

Which gave `
`May 9 22:30:01 Unraid mountd[30694]: refused mount request from 192.168.1.25 for /mnt/user/rA (/): not exported`

Or similar, lost original error, added this from another user and edited.

After much searching, and adding NFS rules in, I found that users go AFTER.  

as opposed to THIS example "#"/mnt/user/rA"    192.168.1.0/255.255.0.0(ro,async,no_subtree_check,fsid=100) *(sec=sys,rw,insecure,anongid=100,anonuid=99,all_squ>" 

```bash
  GNU nano 4.6                                                  exports                                                             
# See exports(5) for a description.
# This file contains a list of all directories exported to other computers.
# It is used by rpc.nfsd and rpc.mountd.


"/mnt/user/rA" -async,no_subtree_check,fsid=100 DESKTOP 169.254.0.0/255.255.255.248 192.168.1.0/24
"/mnt/user/"    -ro,sync,no_subtree_check,fsid=100 169.254.0.2/255.255.255.248 DESKTOP 192.168.1.0/24
```

This seems to work.  Usng multiple users.  Will have to add laptop.

## More NFS

 Samba was fraught with errors

 Decided to use NFS.

 Check Windows Features NFS Client is installed.

 ran the following on windows:

 ```cmd
>mount \\169.254.0.2\rA\ A:
Network Error - 53

>NET HELPMSG 53

The network path was not found.

>mount \\169.254.0.2\
Usage:  mount [-o options] [-u:username] [-p:<password | *>] <\\computername\sharename> <devicename | *>

-o rsize=size               To set the size of the read buffer in kilobytes.
-o wsize=size               To set the size of the write buffer in kilobytes.
-o timeout=time             To set the timeout value in seconds for an RPC call.
-o retry=number             To set the number of retries for a soft mount.
-o mtype=soft|hard          To set the mount type.
-o lang=euc-jp|euc-tw|euc-kr|shift-jis|big5|ksc5601|gb2312-80|ansi
                            To specify the encoding used for file and directory
                            names.
-o fileaccess=mode          To specify the permission mode of the file.
                            These are used for new files created on NFS
                            servers. Specified using UNIX style mode bits.
-o anon                     To mount as an anonymous user.
-o nolock                   To disable locking.
-o casesensitive=yes|no     To specify case sensitivity of file lookup on server.
-o sec=sys|krb5|krb5i|krb5p


>NET USE

New connections will be remembered.


Status       Local     Remote                    Network

-------------------------------------------------------------------------------
OK           V:        \\192.168.1.200\config    Microsoft Windows Network
Disconnected           \\169.254.0.2\rA          Microsoft Windows Network
Disconnected           \\UNRAID\Seagate_Expansion_Drive
                                                Microsoft Windows Network
OK                     \\UNRAID\IPC$             Microsoft Windows Network
The command completed successfully.

>NET USE /DELETE \\UNRAID\$IPC

>NET USE /DELETE \\169.254.0.2\rA
\\169.254.0.2\rA was deleted successfully.
>NET USE /DELETE \\UNRAID\Seagate_Expansion_Drive
\\UNRAID\Seagate_Expansion_Drive was deleted successfully.
>NET USE /DELETE \\UNRAID\IPC$
\\UNRAID\IPC$ was deleted successfully.


>ping UNRAID

Pinging Unraid.local [169.254.0.2] with 32 bytes of data:
Reply from 169.254.0.2: bytes=32 time<1ms TTL=64
Reply from 169.254.0.2: bytes=32 time<1ms TTL=64
Reply from 169.254.0.2: bytes=32 time<1ms TTL=64

Ping statistics for 169.254.0.2:
    Packets: Sent = 3, Received = 3, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 0ms, Maximum = 0ms, Average = 0ms

>mount -u:andyt -p:Lauren7! \\UNRAID\rA\ A:
Network Error - 31

>NET HELPMSG 31

A device attached to the system is not functioning.

 ```


 in syslog:

 ```bash
Nov 3 17:30:03 Unraid rpc.mountd[6459]: refused mount request from 169.254.0.1 for /rA/ (/rA): unmatched host
Nov 3 17:30:03 Unraid rpc.mountd[6459]: refused mount request from 169.254.0.1 for /rA/ (/rA): unmatched host
Nov 3 17:30:03 Unraid rpc.mountd[6459]: refused mount request from 169.254.0.1 for /rA/ (/rA): unmatched host

```

Reviewing `/etc/exports`

```sh
# See exports(5) for a description.
# This file contains a list of all directories exported to other computers.
# It is used by rpc.nfsd and rpc.mountd.

"/mnt/user/rA" -async,no_subtree_check,fsid=100 DESKTOP 

```

it has reverted to before my changes.

In addition, my changes were deleted on reboot.  Irritating, I may have to do this every time...


!!!Success Solution: 
      appended `169.254.0.0/28 192.168.1.0/24` to the end of `/etc/exports`.

      ```sh
      "/mnt/user/rA" -async,no_subtree_check,fsid=100 DESKTOP  169.254.0.0/28 192.168.1.0/24

      ```

      now running 
      ```cmd
      >mount -u:andyt -p:Lauren7! \\UNRAID\rA\ A:
      A: is now successfully connected to \\UNRAID\rA\


      >>mount

      Local    Remote                                 Properties
      -------------------------------------------------------------------------------
      A:       \\UNRAID\rA\                           UID=-2, GID=-2
                                                      rsize=1048576, wsize=1048576
                                                      mount=soft, timeout=1.6
                                                      retry=1, locking=yes
                                                      fileaccess=755, lang=ANSI
                                                      casesensitive=no
                                                      sec=sys
      ```

However, still getting very frequent

      Nov 3 17:33:40 Unraid rpc.mountd[6459]: Caught signal 15, un-registering and exiting.
      Nov 3 17:33:41 Unraid kernel: nfsd: last server has exited, flushing export cache
      Nov 3 17:33:42 Unraid rpc.mountd[29835]: Version 2.1.1 starting
      Nov 3 17:34:15 Unraid rpcbind[29911]: connect from 169.254.0.1 to null()
      Nov 3 17:34:15 Unraid rpcbind[29912]: connect from 169.254.0.1 to getport/addr(mountd)
      Nov 3 17:34:15 Unraid rpcbind[29913]: connect from 192.168.1.25 to null()
      Nov 3 17:34:15 Unraid rpcbind[29914]: connect from 192.168.1.25 to getport/addr(mountd)
      Nov 3 17:34:22 Unraid rpcbind[29918]: connect from 169.254.0.1 to getport/addr(mountd)
      Nov 3 17:34:24 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /rA/ (/): not exported
      Nov 3 17:52:34 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:52:34 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:52:42 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:52:42 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:52:50 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:52:50 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:53:46 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:53:46 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:53:46 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:53:46 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:53:46 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported
      Nov 3 17:53:46 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/): not exported

Can I share data?

In explorer A doesnt exist.

Trying to add it, gives:

```cmd
>mount -u:andyt -p:Lauren7! \\UNRAID\rA\ A:
Network Error - 85

Type 'NET HELPMSG 85' for more information.

C:\WINDOWS\system32>Net HELPMSG 85

The local device name is already in use.

>mount

Local    Remote                                 Properties
-------------------------------------------------------------------------------
A:       \\UNRAID\rA\                           UID=-2, GID=-2
                                                rsize=1048576, wsize=1048576
                                                mount=soft, timeout=1.6
                                                retry=1, locking=yes
                                                fileaccess=755, lang=ANSI
                                                casesensitive=no
                                                sec=sys
```
Explorer - navigating to A:\ gives cannot be found error.

However, oddly `cd /d A:` works fine...

[Google reveals](https://superuser.com/questions/599641/nfs-mount-not-showing-in-windows-explorer#:~:text=If%20you%20mount%20NFS%20shares,not%20required%20for%20NFS%20mounts.)


      If you mount NFS shares from an elevated command prompt (Run as administrator), the mount will not show up in the explorer running with normal user privileges. The solution is to unmount the share and remount it, either from explorer or from an ordinary command prompt. Admin privileges are not required for NFS mounts.


ok, unmount it

no dismount or unmount command, shows in NET USE.

```cmd
>net use
New connections will be remembered.


Status       Local     Remote                    Network

-------------------------------------------------------------------------------
             A:        \\UNRAID\rA\              NFS Network
OK           V:        \\192.168.1.200\config    Microsoft Windows Network
The command completed successfully.


>NET USE /DELETE \\UNRAID\rA\
The network connection could not be found.

More help is available by typing NET HELPMSG 2250.

> NET HELPMSG 2250

The network connection could not be found.

>NET USE /DELETE \\UNRAID\rA\
The network connection could not be found.

More help is available by typing NET HELPMSG 2250.

>NET USE /DELETE A:
There are open files and/or incomplete directory searches pending on the connection to A:.

Is it OK to continue disconnecting and force them closed? (Y/N) [N]: y
A: was deleted successfully.
```


Tried a whole lot of things.

Notably 

```sh
root@Unraid:~# mkdir mounts
root@Unraid:~# chmod 777 ./mounts
root@Unraid:~# mount localhost:/mnt/user/rA ~/mounts
mount.nfs: access denied by server while mounting localhost:/mnt/user/rA
```

unsure of that significance right now...

then tried the below based on [this](https://ubuntuforums.org/showthread.php?t=2055587)

```cmd
C:\>mount -u:andyt -p:Lauren7! \\UNRAID\mnt\user\rA\ A:
A: is now successfully connected to \\UNRAID\mnt\user\rA\

The command completed successfully.
```

Can I read it?

Ok yes I can read it for now....


## Restoring the computer

### First the connection

      root@Unraid:~# route
      Kernel IP routing table
      Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
      default         Unraid.local    0.0.0.0         UG    1      0        0 eth4
      default         Gateway         0.0.0.0         UG    2      0        0 eth0
      default         Gateway         0.0.0.0         UG    4      0        0 eth1
      default         Gateway         0.0.0.0         UG    5      0        0 eth5
      169.254.0.0     0.0.0.0         255.255.0.0     U     0      0        0 eth4
      192.168.1.0     0.0.0.0         255.255.255.0   U     2      0        0 eth0
      192.168.1.0     0.0.0.0         255.255.255.0   U     4      0        0 eth1
      192.168.1.0     0.0.0.0         255.255.255.0   U     5      0        0 eth5

ip route del 0/0
route del -net default dev eth4
route del -net default dev eth1
ip route del 0/0
route del -net default dev eth5
route del -net 169.254.0.0/16 dev eth4
ip route del 0/0
route add -host 169.254.0.1 gw 169.254.0.2 metric 0 dev eth4
route add -net default gw 192.168.1.1  metric 1 dev eth0
route add -net 0/0 gw 192.168.1.1 metric 2 dev eth0
route add -net 0/0 gw 192.168.1.1 metric 2 dev eth1

chmod -c 666 hosts
root@Unraid:~# cat /etc/hosts
      # Generated
      127.0.0.1       Unraid localhost
      54.149.176.35   keys.lime-technology.com
root@Unraid:~# cat >> /etc/hosts
      169.254.0.1     DESKTOP
      192.168.1.25    DESKTOP
      [[Ctrl]] + [[D]]
root@Unraid:~# cat /etc/hosts
# Generated
      127.0.0.1       Unraid localhost
      54.149.176.35   keys.lime-technology.com
      169.254.0.1     DESKTOP
      192.168.1.25    DESKTOP


git clone https://github.com/chubin/cheat.sh.git

## Appending a file

cat > fileName
Then type string here
[[Ctrl]] + [[D]]

Writes "Then type string here" to file

To append:
cat >> fileName
This is appended
[[Ctrl]] + [[D]]
cat fileName

         Then type string here
         This is appended

To put the output of a command into a file	`command_line > filename`
To use a file as input to a command	`command_line < filename`
To join files together  `cat file1 file2 file3 > newfile`
To append one file to another	`cat file >> logfile`
To send a file listing to the printer	`l | lp`
Number output lines `cat -n filename` `cat --number filename`
To display TAB characters as ^I, enter: `cat -T filename`
To display $ at end of each line, enter:

      `cat -E filename`
      `cat --show-ends filename`
Use ^ and M- notation, except for LFD and TAB and show all nonprinting:

      cat -v filename
      cat --show-nonprinting filename

To show all, enter:
            cat -A fileName

            OR
            cat -vET fileName

Show based on a glob `cat *.c`

cat options

| Option    | Meaning                                                              |
| --------- | -------------------------------------------------------------------- |
| -A        | Equivalent to -vET.                                                  |
| -b        | Number nonempty output lines.                                        |
| -e        | Equivalent to -vE.                                                   |
| -E        | Display $ at end of each line.                                       |
| -n        | Number all output lines.                                             |
| -s        | Suppress repeated empty output lines.                                |
| -t        | Equivalent to -vT.                                                   |
| -T        | Display TAB characters as ^I.                                        |
| -v        | Show nonprinting i.e. use ^ and M- notation, except for LFD and TAB. |
| --help    | Display this help and exit.                                          |
| --version | Output version information and exit.                                 |

Background processing
The ability to run commands in the background is one of the key benefits of the UNIX system. You can set any command line running in the background while you do something else at the prompt.

To set a command running in the background, type the command at the prompt as usual, but type & (ampersand) after it, before you press <Enter>. This tells the UNIX system you want the command to run in the background, so it immediately returns your prompt.

For example, if you have a lot of files to join together, or if the files are large, you can put the command in the background:

cat bigfile1 bigfile2 bigfile3 > bigfil

`echo "this is a new line" >> file.txt`

When used with the -e option the echo command interprets the backslash-escaped characters such as newline \n:

`echo -e "this is a new line \nthis is another new line" >> file.txt`

`printf "Hello, I'm %s.\n" $USER >> file.txt`

`date +"Year: %Y, Month: %m, Day: %d" >> file.txt`

`echo "this is a new line"  | tee -a file.txt`

If you don’t want tee to write to the standard output, redirect it to /dev/null:

`echo "this is a new line"  | tee -a file.txt >/dev/null`

## SSH Auth

1.) on local comp (client) generate a key pair

PuttyGen
OpenSSH-keygen
ssh-keygen

The password (passphrase) encrypts the private key only.

A passphrase is an optional addition. If you enter one, you will have to provide it every time you use this key (unless you are running SSH agent software that stores the decrypted key). We recommend using a passphrase, but if you do not want to set a passphrase, you can simply press ENTER to bypass this prompt.

2) copy public key to the server.

Instructions ([here](https://forums.unraid.net/topic/51160-passwordless-ssh-login/))

      1) If necessary, generate an SSH key on your Mac or Linux machines, using ssh-keygen.

      2) Create an authorized_keys file for the unRAID server, using the id_rsa.pub files on all the machines which require access.

      3) Copy this file to your server's /root/.ssh/ folder.
      

      

This will work until a reboot. To handle a persistent setup:

      1) Copy the authorized_keys file to /boot/config/ssh/.
      2) Add this to the end of.your /boot/config/go, using your preferred editor:
      
                  mkdir /root/.ssh
                  chmod 700 /root/.ssh
                  cp /boot/config/ssh/authorized_keys /root/.ssh/
                  chmod 600 /root/.ssh/authorized_keys
                  

Alternative Instructions

1. Create a script /boot/config/ssh/setup_ssh_client.sh:

            #!/bin/bash

            SSH_DIR=/root/.ssh

            mkdir ${SSH_DIR}
            chmod 755 ${SSH_DIR}
            cp /boot/config/ssh/authorized_keys ${SSH_DIR}/authorized_keys
            chmod 600 ${SSH_DIR}/authorized_keys
            

      and make it executable:
            
            chmod 755 /boot/config/ssh/setup_ssh_client.sh



2. Copy the previously created authorized_keys into /boot/config/ssh folder


       cp /root/.ssh/authorized_keys /boot/config/ssh/

 

3. Edit /boot/config/go and add the following line at the end, so that our setup script can be called during reboot:

 

    /boot/config/ssh/setup_ssh_client.sh

 
Still needing pw

Tried:
chmod -R -v g-rwx,o-rwx /root/.ssh



## Making the options persistant


### Append to file and write to stdout

 echo 'this is a test' | tee /dev/tty | tee >> test.txt

 actually this works easier

 echo '4' | tee -a test.txt


 ## Make the GUI The default view locally

Edit `/boot/syslinux/syslinux.cfg`
Add the line `menu default` to the desired entry.


## tops

-top
-bashtop
- iftop
- iotop
- ctop

add

Installing binutils-2.31.1 package.

 find / -name "limits.h"
/usr/include/limits.h
/usr/include/linux/limits.h
/usr/include/c++/9.2.0/tr1/limits.h
/usr/include/libspl/limits.h
/usr/lib64/gcc/x86_64-slackware-linux/9.2.0/install-tools/include/limits.h
/usr/lib64/gcc/x86_64-slackware-linux/9.2.0/include-fixed/limits.h


https://airsonic.github.io/docs/


## Recovering Nginx


### stop mover
`mover stop`

### Check whats wrong:

`nginx` 

```txt
Message from syslogd@Unraid at Nov 13 09:48:25 ...
 nginx: 2020/11/13 09:48:23 [emerg] 3614#3614: bind() to 0.0.0.0:80 failed (98: Address already in use)

Message from syslogd@Unraid at Nov 13 09:48:25 ...
 nginx: 2020/11/13 09:48:23 [emerg] 3614#3614: bind() to [::]:80 failed (98: Address already in use)

Message from syslogd@Unraid at Nov 13 09:48:25 ...
 nginx: 2020/11/13 09:48:23 [emerg] 3614#3614: bind() to [::]:80 failed (98: Address already in use)
nginx: [emerg] still could not bind()
```

`netstat -plant | grep 80`

List all the devices bound that show the number 80

```sh
ps
ps aux
#list the non-user programs
ps aux | grep 19763
 kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX

 kill -1 19763

```

| Signal Name | Single Value | Effect                  |
| ----------- | ------------ | ----------------------- |
| SIGHUP      | 1            | Hangup                  |
| SIGINT      | 2            | Interrupt from keyboard |
| SIGKILL     | 9            | Kill signal             |
| SIGTERM     | 15           | Termination signal      |
| SIGSTOP     | 17, 19, 23   | Stop the process        |


I just removed 9 that were stuck for 12 hours to 2 days with docker ps -a | grep Removal | cut -f1 -d' ' | xargs -rt docker rm - not the best / most robust, but they all went away without complaint this time. See also docker/for-linux#124


docker rm -f 7c3b09c65d66
 docker container ls
 docker kill dd05197aaf35
docker ps

docker ps -a | grep Removal | cut -f1 -d' ' | xargs -rt docker rm


```
 ps [options]

 Try 'ps --help <simple|list|output|threads|misc|all>'
  or 'ps --help <s|l|o|t|m|a>'
```

tmux

Commmand execution starts with [[Ctrl]] + [[b]]

### tmux split the screen

[[Ctrl]] + [[b]], [[%]]

### Switch between panes

[[Ctrl]] + [[b]], [[<-]]
[[Ctrl]] + [[b]], [[<Arrow Key>]]


### Close a pane

type exit or[[Ctrl]] + [[d]]

### Open a new window

[[Ctrl]] + [[b]], [[c]]

? same as just running `tmux`

### switch screens

- **Next** - [[Ctrl]] + [[b]], [[p]]

- **Previous** - [[Ctrl]] + [[b]], [[n]]

### Detach a pane

[[Ctrl]] + [[b]], [[d]] - detach the current pane

[[Ctrl]] + [[b]], [[D]] -  Decide which to detach

This is now running in the background

Get a list of running processes  `tmux ls`



## Sync all the files 

rsync -rlthP --stats SRC /mnt/disks/Elements/ DEST .
rsync -rlthP --stats --size-only --progress --exclude '__Huge/*' --dry-run  /mnt/disks/Seagate_Expansion_Drive  /mnt/user/rDriveA/Seagate_Expansion_Drive
rsync -rlthP --stats --size-only --progress --exclude '__Huge/*' /mnt/disks/Seagate_Expansion_Drive  /mnt/user/rDriveA/Seagate_Expansion_Drive

rsync -rlthP --stats --size-only --progress --exclude '__Huge/*' /mnt/disks/Elements/  /mnt/user/rDriveA/Elements/

## List the IP Addresses


`ip addr show |grep inet`

    inet 127.0.0.1/8 scope host lo
    inet6 ::1/128 scope host 
    inet 169.254.0.2/16 scope global eth4
    inet 192.168.1.220/24 brd 192.168.1.255 scope global dynamic noprefixroute eth2
    inet 192.168.1.224/24 scope global br0
    inet 192.168.1.249/24 scope global br1
    inet 192.168.1.251/24 scope global br3
    inet 192.168.1.250/24 brd 192.168.1.255 scope global dynamic noprefixroute br5
    inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
    inet6 fe80::42:5eff:fe0d:ca96/64 scope link 
    inet6 fe80::fc54:ff:fe82:194f/64 scope link 

    ifdata -pN br1
    192.168.1.0ifro