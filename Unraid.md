# Unraid


## Bash Profile


      # History ignore and erase dupes
      export HISTCONTROL=ignoreboth:erasedups

      function cs() { curl -m 7 "http://cheat.sh/$1"; }

      alias log="tail /var/log/syslog"
      alias llg="tac /var/log/syslog | less"
      alias clr="clear"
      alias ip='ip -c'
      alias lir="ls -liR"

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


## Networking and Internet in Unraid / Linux

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


-   ip -4 route add 192.168.1.0/16 dev br0 metric 1
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1
-   ip -4 route add 192.168.1.0/16 dev br0 metric 1
-   ip -4 route add default via 192.168.1.1 metric 1
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1
-   ip -4 route del default via 192.168.1.1 dev br1 metric 1
Dec 2 21:07:16 Unraid dhcpcd[2941]: br1: pid 16315 deleted default route via 192.168.1.1
-   ip -4 route add 192.168.1.0/16 via 192.168.1.1 metric dev
-   ip -4 route add 192.168.1.0/16 via 192.168.1.1-eth0 metric 1
Dec 2 21:12:53 Unraid dhcpcd[3048]: br2: pid 0 deleted default route via 192.168.1.1
Dec 2 21:12:55 Unraid dhcpcd[3281]: br5: pid 0 deleted default route via 192.168.1.1
-   ip -4 route del 169.254.0.0/16 dev br4 metric 1
-   ip -4 route del 169.254.0.0/16 dev br4 metric 1
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1
-   ip -4 route del 192.168.1.0/24 dev br1 metric 3
Dec 2 21:13:21 Unraid dhcpcd[2941]: br1: pid 19141 deleted route to 192.168.1.0/24
-   ip -4 route del 192.168.1.0/24 dev br5 metric 5
Dec 2 21:13:23 Unraid dhcpcd[3281]: br5: pid 19171 deleted route to 192.168.1.0/24
-   ip -4 route del 192.168.1.0/24 dev br1 metric 50
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1
-   ip -4 route del 192.168.1.0/24 dev br1 metric 60
-   ip -6 route del ::1 dev lo metric 256
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1
-   ip -4 route del 192.168.1.0/24 dev br2 metric 4
Dec 2 21:13:44 Unraid dhcpcd[3048]: br2: pid 19408 deleted route to 192.168.1.0/24
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1
-   ip -4 route del 192.168.0.0/16 dev br3 metric 1

### Domain 

Stored in /etc/resolv.conf

            >cat /etc/resolv.conf 
            # Generated by dhcpcd from br0.dhcp
            # /etc/resolv.conf.head can replace this line
            domain Timmons.Family
            nameserver 192.168.1.1
            # /etc/resolv.conf.tail can replace this line

### Useful commands

#### Nginx

`/etc/rc.d/rc.nginx <command>`
Available commands: `start stop restart status`

#### PHP

`/etc/rc.d/rc.php-fpm <command>`

Available commands: `start stop restart status`

#### VM Service

`/etc/rc.d/rc.libvirt <command>`

Available commands: `start stop`


#### Domains

List all domains:

`virsh list --all`

`virsh <command> <domain>`
Available commands: `start shutdown reboot suspend`


### Renew IP Lease 


Online answer but doesnt work

            sudo dhclient -v -r eth0
            sudo dhclient -v eth0

This (sort of) works

            dhcpcd -k eth3
            dhcpcd -n eth3

### More commands (IP)

[IP](https://linux.die.net/HOWTO/Adv-Routing-HOWTO/lartc.iproute2.explore.html)
[Advanced Routing](https://linux.die.net/HOWTO/Adv-Routing-HOWTO/index.html)



ip link list
ip address show
ip route show
 ip neigh show
 ip rule list
  ip -d link list eth3 - show the details of eth3
  ip route ls
ip route list table local

ip -c address - add color, show addresses.
ip -c address show dev eth3 
ifconfig eth0 hw ether AA:BB:CC:DD:EE:FF

- ip
   - link 
      - add
      - delete
      - set
      - show
      - xstats
      - afstats
	- address 
      - add
      - change
      - replace
      - del
      - save
      - flush
      - show
      - showdump
      - restore
	- addrlabel 
      - add
      - del
      - list
      - flush
	- route 
      - list
      - flush
      - save
      - restore
      - showdump
      - get
      - add
      - del
      - change
      - append
      - replace
	- rule 
	- neigh 
	- ntable 
	- tunnel 
	- tuntap 
	- maddress 
	- mroute 
	- mrule 
	- monitor 
	- xfrm 
	- netns 
	- l2tp 
	- fou 
	- macsec 
	- tcp_metrics 
	- token 
	- netconf 
	- ila 
	- vrf 
	- sr 
	- nexthop

### Ping 

            ping −c 1 espa043

### Sysctl

sysctl -w net.ipv4.conf.eth3.arp_announce=2


### rtmon

Stores the ipmonitor data.  Its not readable

      rtmon file /var/log/rtmon.log

To view 
   
      ip monitor file ~/rtmon.log
      ip monitor file var/log/rtmon.log


### dns config 

 cat /etc/resolv.conf 

### resolv.conf
 
 No connection

 needed to update DNS

`Resolv.conf`

            # Generated DNSv4 entries:
            nameserver 192.168.1.1
            nameserver 192.168.1.200
            nameserver 1.1.1.1
            nameserver 1.0.0.1
            search local
            search timmons family

`hosts`

            169.254.0.1     DESKTOP
            192.168.1.25    DESKTOP


### Tools

Installing NSLookup, host, dig using nerd pack

need 
`bind`

requires kbd, libssagi, json-c and json-c is not working.  This fixes it

            wget http://slackware.cs.utah.edu/pub/slackware/slackware64-current/slackware64/l/json-c-0.15_20200726-x86_64-1.txz
            upgradepkg --install-new json-c-0.15_20200726-x86_64-1.txz

### Listening port

lsof -i -P -n

sudo lsof -i -P -n | grep LISTEN

sudo netstat -tulpn | grep LISTEN

 ss
 ss -tulw 


## Webservers


[Apache vs Nginx](https://www.digitalocean.com/community/tutorials/apache-vs-nginx-practical-considerations)
[Comparison](https://stackshare.io/stackups/apache-httpd-vs-lighttpd-vs-nginx)


## Docker

[Docker Networking](https://docs.docker.com/network/)


[Docker Networking Tutorial](https://docs.docker.com/network/network-tutorial-standalone/)

            $ docker network ls

            $ docker run -dit --name alpine1 alpine ash

            $ docker run -dit --name alpine2 alpine as

            $ docker network inspect bridge
            $ docker attach alpine1
            # ip addr show
            # ping -c 2 google.com

Detach from alpine1 without stopping it by using the detach sequence, [[CTRL]] + [[p]] [[CTRL]] + [[q]] (hold down [[CTRL]] and type [[p]] followed by [[[q]]]). If you wish, attach to alpine2 and repeat steps 4, 5, and 6 there, substituting alpine1 for alpine2.

            $ docker container stop alpine1 alpine2 alpine3 alpine4

            $ docker container rm alpine1 alpine2 alpine3 alpine4

            $ docker network rm alpine-net

## interesting

This DOES NOT WORK on Unraid, but has some interesting commands and bash examples./

      #!/bin/sh

      # host we want to "reach"
      host=google.com

      # get the ip of that host (works with dns and /etc/hosts. In case we get  
      # multiple IP addresses, we just want one of them
      host_ip=$(getent ahosts "$host" | awk '{print $1; exit}')

      # only list the interface used to reach a specific host/IP. We only want the part
      # between dev and src (use grep for that)
      ip route get "$host_ip" | grep -Po '(?<=(dev )).*(?= src| proto)'

more 

      ip route get 8.8.8.8 | sed -n 's/.*dev \([^\ ]*\) table.*/\1/p'


### get route

      ip route get 1.1.1.1



## Cheat.sh

git clone https://github.com/chubin/cheat.sh.git

## Appending a file

cat > fileName
Then type string here
[[Ctrl]] + [[D]]

!!!Warning This replaces a file
      Use `>>`

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

!!! Fail  : Did not succeed
      The underlying issue was that `/boot/config/go` I had moved the emhttpd command to the bottom and it was erroring out before running it.

                  # Start the Management Utility
            /usr/local/sbin/emhttp &

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

## tmux

[Man Page](https://linux.die.net/man/1/tmux)

Tons and tons of options.  Rather complex

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

### To reattach a pane thats been detached

`tmux attach-session`

`tmux`
[[ctrl]] + [[b]], [[%]]
Run Rsync
[[ctrl]] + [[b]], [[d]]
reattach with  : `tmux attach-session`

This should survive the closing of the window

This is now running in the background

Get a list of running processes  `tmux ls`
[[CTRL]]+[[b]]            Send the prefix key (C-b) through to theapplication.

[[CTRL]]+[[o]] Rotate the panes in the current window forwards.
[[CTRL]]+[[z]] Suspend the tmux client.
- +[[!]] - Break the current pane out of the window.
- +[["]] - Split the current pane into two, top and bottom.
- +[[#]] - List all paste buffers.
- +[[$]] - Rename the current session.
- +[[%]] - Split the current pane into two, left and right.
- +[[&]] - Kill the current window.
- +[[']] - Prompt for a window index to select.
- +[[,]] - **Rename the current window.**
- +[[-]] - Delete the most recently copied buffer of text.
- +[[.]] - Prompt for an index to move the current window.
- [[0]] to [[9]] - Select windows 0 to 9.
- +[[:]] - Enter the tmux command prompt.
- +[[;]] - Move to the previously active pane.
- +[[=]] - Choose which buffer to paste interactively from a list.
- +[[?]] - List all key bindings.
- +[[D]] - Choose a client to detach.
- +[[`[`]] - Enter copy mode to copy text or view the history.
- +[[`]`]] - Paste the most recently copied buffer of text.
- +[[c]] - Create a new window.
- +[[d]] - **Detach the current client.**
- +[[f]] - Pr1ompt to search for text in open windows.
- +[[i]] - Display some information about the current window.
- +[[l]] - Move to the previously selected window.
- +[[n]] - Change to the next window.
- +[[o]] - Select the next pane in the current window.
- +[[p]] - Change to the previous window.
- +[[q]] - Briefly display pane indexes.
- +[[r]] - Force redraw of the attached client.
- +[[s]] - Select a new session for the attached client interactively.
- +[[L]] - Switch the attached client back to the last session.
- +[[t]] - Show the time.
- +[[w]] - Choose the current window interactively.
- +[[x]] - Kill the current pane.
- +[[{]] - Swap the current pane with the previous pane.
- +[[}]] - Swap the current pane with the next pane.
- +[[~]] - Show previous messages from tmux, if any.
- +[[Page Up]] - Enter copy mode and scroll one page up.
- +[[Up]], [[Down]] -[[Left]], [[Right]] - Change to the pane above, below, to the left, or to the right of the current pane.


- [[ALT]] -[[1]] to - +[[ALT]] -[[5]]
Arrange panes in one of the five preset layouts: even-horizontal, even-vertical, main-horizontal, main-vertical, or tiled.
- [[ALT]] +[[n]] Move to the next window with a bell or activity marker.
- [[ALT]] +[[o]] Rotate the panes in the current window backwards.
- [[ALT]] +[[p]] Move to the previous window with a bell or activity marker.
- [[CTRL]] -[[Up]], [[CTRL]] -[[Down]], [[CTRL]] -[[Left]], [[CTRL]] -[[Right]] - Resize the current pane in steps of one cell.
- [[ALT]] -[[Up]], [[ALT]] -[[Down]], [[ALT]] -[[Left]], [[ALT]] -[[Right]] - Resize the current pane in steps of five cells. 



detach-client [-P] [-s target-session] [-t target-client]
(alias: detach) Detach the current client if bound to a key, the client specified with -t, or all clients currently attached to to the session specified by -s. If -P is given, send SIGHUP to the parent process of the client, typically causing it to exit.

has-session [-t target-session]
(alias: has) Report an error and exit with 1 if the specified session does not exist. If it does exist, exit with 0.

`kill-server`
Kill the tmux server and clients and destroy all sessions.

`kill-session` [-t target-session]
Destroy the given session, closing any windows linked to it and no other sessions, and detaching all clients attached to it.

`list-clients` [-t target-session]
(alias: `lsc`) List all clients attached to the server. If target-session is specified, list only clients connected to that session.

`list-commands`
(alias: `lscm`) List the syntax of all commands supported by tmux.

`list-sessions`
(alias: `ls`) List all sessions managed by the server.

`lock-client` [-t target-client]
(alias: `lockc`) Lock target-client, see the lock-server command.

`lock-session` [-t target-session]
(alias: `locks`) Lock all clients attached to target-session.

`new-session` [-d] [-n window-name] [-s session-name] [-t target-session] [-x width] [-y height] [shell-command]
(alias: `new`) Create a new session with name session-name. 


`refresh-client` [-t target-client]
(alias: `refresh`) Refresh the current client if bound to a key, or a single client if one is given with -t.

`rename-session `[-t target-session] new-name
(alias: `rename`) Rename the session to new-name.

`show-messages` [-t target-client]
(alias: `showmsgs`) Any messages displayed on the status line are saved in a per-client message log, up to a maximum of the limit set by the message-limit session option for the session attached to that client. This command displays the log for target-client.

`source-file` path
(alias: `source`) Execute commands from path.

`start-server`
(alias: `start`) Start the tmux server, if not already running, without creating any sessions.

`suspend-client `[-t target-client]
(alias: `suspendc`) Suspend a client by sending SIGTSTP (tty stop).

`switch-client` [-lnp] [-c target-client] [-t target-session]
(alias: `switchc`) Switch the current session for client target-client to target-session. If -l, -n or -p is used, the client is moved to the last, next or previous session respectively. 
        
- `break-pane` [-d] [-t target-pane] - (alias: `breakp`) Break target-pane off from its containing window to make it the only pane in a new window. If -d is given, the new window does not become the current window.

`capture-pane` [-b buffer-index] [-E end-line] [-S start-line] [-t target-pane]
(alias: `capturep`) Capture the contents of a pane to the specified buffer, or a new buffer if none is specified.

-S and -E specify the starting and ending line numbers, zero is the first line of the visible pane and negative numbers are lines in the history. The default is to capture only the visible contents of the pane.

`choose-client` [-t target-window] [template]
Put a window into client choice mode, allowing a client to be selected interactively from a list. After a client is chosen, '%%' is replaced by the client pty(4) path in template and the result executed as a command. If template is not given, "detach-client -t '%%'" is used. This command works only from inside tmux.

`choose-session` [-t target-window] [template]
Put a window into session choice mode, where a session may be selected interactively from a list. When one is chosen, '%%' is replaced by the session name in template and the result executed as a command. If template is not given, "switch-client -t '%%'" is used. This command works only from inside tmux.

`choose-window` [-t target-window] [template]
Put a window into window choice mode, where a window may be chosen interactively from a list. After a window is selected, '%%' is replaced by the session name and window index in template and the result executed as a command. If template is not given, "select-window -t '%%'" is used. This command works only from inside tmux.

`display-panes `[-t target-client]
(alias: displayp) Display a visible indicator of each pane shown by target-client. See the display-panes-time, display-panes-colour, and display-panes-active-colour session options. While the indicator is on screen, a pane may be selected with the '0' to '9' keys.

`find-window` [-t target-window] match-string
(alias: findw) Search for the fnmatch(3) pattern match-string in window names, titles, and visible content (but not history). If only one window is matched, it'll be automatically selected, otherwise a choice list is shown. This command only works from inside tmux.

`join-pane` [-dhv] [
-l size | -p percentage] [-s src-pane] [-t dst-pane]
(alias: `joinp`) Like split-window, but instead of splitting dst-pane and creating a new pane, split it and move src-pane into the space. This can be used to reverse break-pane.

`kill-pane` [-a] [-t target-pane]
(alias: `killp`) Destroy the given pane. If no panes remain in the containing window, it is also destroyed. The -a option kills all but the pane given with -t.

`kill-window` [-t target-window]
(alias: `killw`) Kill the current window or the window at target-window, removing it from any sessions to which it is linked.

`last-pane` [-t target-window]
(alias: `lastp`) Select the last (previously selected) pane.

`last-window` [-t target-session]
(alias: `last`) Select the last (previously selected) window. If no target-session is specified, select the last window of the current session.

`link-window `[-dk] [-s src-window] [-t dst-window]
(alias: `linkw`) Link the window at src-window to the specified dst-window. If dst-window is specified and no such window exists, the src-window is linked there. If -k is given and dst-window exists, it is killed, otherwise an error is generated. If -d is given, the newly linked window is not selected.

`list-panes` [-as] [-t target]
(alias: `lsp`) If -a is given, target is ignored and all panes on the server are listed. If -s is given, target is a session (or the current session). If neither is given, target is a window (or the current window).

`list-windows` [-a] [-t target-session]
(alias: `lsw`) If -a is given, list all windows on the server. Otherwise, list windows in the current session or in target-session.

`move-window` [-dk] [-s src-window] [-t dst-window]
(alias: `movew`) This is similar to link-window, except the window at src-window is moved to dst-window.

`new-window` [-adkP] [-n window-name] [-t target-window] [shell-command]
(alias: `neww`) Create a new window. With -a, the new window is inserted at the next index up from the specified target-window, moving windows up if necessary, otherwise target-window is the new window location.

If -d is given, the session does not make the new window the current window. target-window represents the window to be created; if the target already exists an error is shown, unless the -k flag is used, in which case it is destroyed. shell-command is the command to execute. If shell-command is not specified, the value of the default-command option is used.

When the shell command completes, the window closes. See the remain-on-exit option to change this behaviour.

The TERM environment variable must be set to ''screen'' for all programs running inside tmux. New windows will automatically have ''TERM=screen'' added to their environment, but care must be taken not to reset this in shell start-up files.

The -P option prints the location of the new window after it has been created.

`next-layout` [-t target-window]
(alias: `nextl`) Move a window to the next layout and rearrange the panes to fit.

`next-window` [-a] [-t target-session]
(alias: `next`) Move to the next window in the session. If -a is used, move to the next window with a bell, activity or content alert.

`pipe-pane` [-o] [-t target-pane] [shell-command]
(alias: `pipep`) Pipe any output sent by the program in target-pane to a shell command. A pane may only be piped to one command at a time, any existing pipe is closed before shell-command is executed. The shell-command string may contain the special character sequences supported by the status-left option. If no shell-command is given, the current pipe (if any) is closed.

The -o option only opens a new pipe if no previous pipe exists, allowing a pipe to be toggled with a single key, for example:

`bind-key` C-p pipe-pane -o 'cat >>~/output.#I-#P' 

      `previous-layout `[-t target-window]

(alias: `prevl`) Move to the previous layout in the session.

`previous-window` [-a] [-t target-session]
(alias: `prev`) Move to the previous window in the session. With -a, move to the previous window with a bell, activity or content alert.

`rename-window` [-t target-window] new-name
(alias: `renamew`) Rename the current window, or the window at target-window if specified, to new-name.

`resize-pane` [-DLRU] [-t target-pane] [adjustment]
(alias: `resizep`) Resize a pane, upward with -U (the default), downward with -D, to the left with -L and to the right with -R. The adjustment is given in lines or cells (the default is 1).

`respawn-pane` [-k] [-t target-pane] [shell-command]
(alias: `respawnp`) Reactivate a pane in which the command has exited (see the remain-on-exit window option). If shell-command is not given, the command used when the pane was created is executed. The pane must be already inactive, unless -k is given, in which case any existing command is killed.

`respawn-window` [-k] [-t target-window] [shell-command]
(alias: `respawnw`) Reactivate a window in which the command has exited (see the remain-on-exit window option). If shell-command is not given, the command used when the window was created is executed. The window must be already inactive, unless -k is given, in which case any existing command is killed.

`rotate-window` [-DU] [-t target-window]
(alias: `rotatew`) Rotate the positions of the panes within a window, either upward (numerically lower) with -U or downward (numerically higher).

`select-layout` [-np] [-t target-window] [layout-name]
(alias: `selectl`) Choose a specific layout for a window. If layout-name is not given, the last preset layout used (if any) is reapplied. -n and -p are equivalent to the next-layout and previous-layout commands.

`select-pane` [-lDLRU] [-t target-pane]
(alias: `selectp`) Make pane target-pane the active pane in window target-window. If one of -D, -L, -R, or -U is used, respectively the pane below, to the left, to the right, or above the target pane is used. -l is the same as using the last-pane command.

`select-window` [-lnp] [-t target-window]
(alias: `selectw`) Select the window at target-window. -l, -n and -p are equivalent to the last-window, next-window and previous-window commands.

`split-window` [-dhvP] [
-l size | -p percentage] [-t target-pane] [shell-command]
(alias: `splitw`) Create a new pane by splitting target-pane: -h does a horizontal split and -v a vertical split; if neither is specified, -v is assumed. The -l and -p options specify the size of the new pane in lines (for vertical split) or in cells (for horizontal split), or as a percentage, respectively. All other options have the same meaning as for the new-window command.

`swap-pane` [-dDU] [-s src-pane] [-t dst-pane]
(alias: `swapp`) Swap two panes. If -U is used and no source pane is specified with -s, dst-pane is swapped with the previous pane (before it numerically); -D swaps with the next pane (after it numerically). -d instructs tmux not to change the active pane.

`swap-window` [-d] [-s src-window] [-t dst-window]
(alias: `swapw`) This is similar to link-window, except the source and destination windows are swapped. It is an error if no window exists at src-window.

`unlink-window`[-k] [-t target-window]
(alias: `unlinkw`) Unlink target-window. Unless -k is given, a window may be unlinked only if it is linked to multiple sessions - windows may not be linked to no sessions; if -k is specified and the window is linked to only one session, it is unlinked and destroyed. 

## Backup and Sync

### Sync all the files 

rsync -rlthP --stats SRC /mnt/disks/Elements/ DEST .
rsync -rlthP --stats --size-only --progress --exclude '__Huge/*' --dry-run  /mnt/disks/Seagate_Expansion_Drive  /mnt/user/rDriveA/Seagate_Expansion_Drive
`rsync -rlthP --stats --size-only --progress --exclude '__Huge/*' /mnt/disks/Seagate_Expansion_Drive  /mnt/user/rDriveA/Seagate_Expansion_Drive`

`rsync -rlthP --stats --size-only --progress --exclude '__Huge/*' --exclude 'X\ backup*'  /mnt/disks/Elements/  /mnt/user/rDriveA/Elements/`

`rsync -rlthP --stats --size-only --progress --del  /mnt/disks/Elements/  /mnt/user/rDriveA/Elements/`


### Backup Restore using tar command

[Source](https://www.adminschoice.com/backup-commands-examples)



tar features:
1. tar ( tape  archive ) is used for single or multiple files backup and restore on/from  a tape or file.
2. tar can not backup special character & block device files , shows as 0 byte files with first letter of permissions as b or c for block or character.
3. tar Works only on mounted file system, it can not access the files on unmounted file system.

Backing up all files in a directory including subdirectories to a  tape device (/dev/rmt/0) or a file.


Example 1 :

            $tar    cvf    /dev/rmt/0   *

In the command above Options are  c -> create ; v -> Verbose ; f->file or archive device   ; * -> all files and directories . Together the commands means create a tar file on /dev/rmt/0 from all file and directories s in the current directory.

Example 2:

            $tar cvf /home/backup *

Create a tar  called backup in home directory , from all file and directories s in the current directory.

Viewing a tar backup on a tape or file
t option is used to see the table of content in a tar file.

            $tar    tvf    /dev/rmt/0  ## view files  backed up on a tape device.

            $tar tvf  /home/backup  ## view files  backed up inside the  backup

In the command above Options are  c -> create ; v -> Verbose ; f->file or archive device   ; * -> all files and directories . Together the commands means create a tar file on /dev/rmt/0 from all file and directories s in the current directory.

Extracting tar backup from the tape
x option is used to extract the files from tar file.

            $tar xvf /dev/rmt/0       ##extract /  restore files in to current directory.

            $tar xvf /home/backup ## extract / restore files in to current directory.

Note : Restoration will go to present directory or original backup path depending on
relative or absolute path names used for backup.

Some of useful tar options. 

Extract & keep the  file permissions (default for superuser)

            -p, –preserve-permissions

Filter the archive through gzip

            -z, –gzip

Filter the archive through bzip2

            -j, –bzip2

Only append files newer than copy in archive

            -u, –update

Append files to the end of an archive

            -r, –append

Delete from the archive (not on mag tapes!)

            –delete

Find differences between archive and file system
            
            -d, –diff, –compare

Test the archive volume label and exit

            –test-label

Change to directory DIR

            -C, –directory=DIR

## List the IP Addresses


`ip addr show |grep inet`t

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


    ## Chron jobs
    rsync -rlthP --stats --size-only --progress --exclude '__Huge/*' /mnt/disks/Seagate_Expansion_Drive  /mnt/user/rDriveA/Seagate_Expansion_Drive


    https://linuxconfig.org/how-to-schedule-tasks-using-at-command-on-linux

    `rsync -rlthP --stats --size-only --progress --del  /mnt/disks/BU3/  /mnt/user/rDriveA/BU3/`


## Finding Files


for directories visibility use:

```
find /mnt/user -type d -exec chmod 755 {} \;
```
 
and for files within a directory use:

```
find /mnt/user -type f -exec chmod 700 {} \;
```



## Less 


      
                              SUMMARY OF LESS COMMANDS

            Commands marked with * may be preceded by a number, N.
            Notes in parentheses indicate the behavior if N is given.
            A key preceded by a caret indicates the Ctrl key; thus ^K is ctrl-K.

            h  H                 Display this help.
            q  :q  Q  :Q  ZZ     Exit.
            ---------------------------------------------------------------------------

                                    MOVING

            e  ^E  j  ^N  CR  *  Forward  one line   (or N lines).
            y  ^Y  k  ^K  ^P  *  Backward one line   (or N lines).
            f  ^F  ^V  SPACE  *  Forward  one window (or N lines).
            b  ^B  ESC-v      *  Backward one window (or N lines).
            z                 *  Forward  one window (and set window to N).
            w                 *  Backward one window (and set window to N).
            ESC-SPACE         *  Forward  one window, but don't stop at end-of-file.
            d  ^D             *  Forward  one half-window (and set half-window to N).
            u  ^U             *  Backward one half-window (and set half-window to N).
            ESC-)  RightArrow *  Right one half screen width (or N positions).
            ESC-(  LeftArrow  *  Left  one half screen width (or N positions).
            ESC-}  ^RightArrow   Right to last column displayed.
            ESC-{  ^LeftArrow    Left  to first column.
            F                    Forward forever; like "tail -f".
            ESC-F                Like F but stop when search pattern is found.
            r  ^R  ^L            Repaint screen.
            R                    Repaint screen, discarding buffered input.
                  ---------------------------------------------------
                  Default "window" is the screen height.
                  Default "half-window" is half of the screen height.
            ---------------------------------------------------------------------------

                                    SEARCHING

            /pattern          *  Search forward for (N-th) matching line.
            ?pattern          *  Search backward for (N-th) matching line.
            n                 *  Repeat previous search (for N-th occurrence).
            N                 *  Repeat previous search in reverse direction.
            ESC-n             *  Repeat previous search, spanning files.
            ESC-N             *  Repeat previous search, reverse dir. & spanning files.
            ESC-u                Undo (toggle) search highlighting.
            &pattern          *  Display only matching lines
                  ---------------------------------------------------
                  A search pattern may begin with one or more of:
                  ^N or !  Search for NON-matching lines.
                  ^E or *  Search multiple files (pass thru END OF FILE).
                  ^F or @  Start search at FIRST file (for /) or last file (for ?).
                  ^K       Highlight matches, but don't move (KEEP position).
                  ^R       Don't use REGULAR EXPRESSIONS.
            ---------------------------------------------------------------------------

## SAS Controller

```
root@Unraid:/boot/config/plugins/enhanced.log/files# cat /var/log/syslog | grep 'isci'
```
          
          
            Nov 23 22:21:45 Unraid kernel: isci: Intel(R) C600 SAS Controller Driver - version 1.2.0
            Nov 23 22:21:45 Unraid kernel: isci 0000:07:00.0: driver configured for rev: 6 silicon
            Nov 23 22:21:45 Unraid kernel: isci 0000:07:00.0: Unable to obtain EFI var data for OEM parms
            Nov 23 22:21:45 Unraid kernel: isci 0000:07:00.0: OEM parameter table found in OROM
            Nov 23 22:21:45 Unraid kernel: isci 0000:07:00.0: [0]: invalid oem parameters detected, falling back to firmware
            Nov 23 22:21:45 Unraid kernel: isci 0000:07:00.0: OEM SAS parameters (version: 1.3) loaded (firmware)
            Nov 23 22:21:45 Unraid kernel: isci 0000:07:00.0: SCU controller 0: phy 3-0 cables: {short, short, short, short}
            Nov 23 22:21:45 Unraid kernel: scsi host13: isci

Intel(R) C600 SAS Controller Driver - version 1.2.0
driver configured for rev: 6 silicon
**Unable to obtain EFI var data for OEM parms** Do I need to make sure EFI mode is on,
OEM parameter table found in OROM
 invalid oem parameters detected, falling back to firmware
 OEM SAS parameters (version: 1.3) loaded (firmware)
 CU controller 0: phy 3-0 cables: {short, short, short, short}


[Link on C600 in SuperMicro](https://www.supermicro.com/support/resources/os/c600.cfm)

check that I match these params.  It looks like D and M are most common.  Rarely more than one.  SATA (without RAID, AHCI mode), SATA (without RAID, IDE enhance mode).

I can only do one at a time.

 
- ~~A. IDE Drive~~
- ~~B. SCSI Drive (without HostRAID)~~
- ~~C. SCSI Drive (with HostRAID)~~
- **D. SATA (without RAID, IDE enhance mode)**
- ~~E. SATA (w/ RAID, Adaptec/LSI code base/MCP55/Marvell)~~
- ~~F. SAS/SAS2 (IT mode)~~
- ~~G. SAS/SAS2 (SR/IMR mode)~~
- ~~H. ZCR~~
- ~~I. SAS/SAS2 (IR mode)~~
- ~~J. UIO (Controller: LSI 1068E(SR Mode))~~
- ~~K. UIO (Controller: LSI 1078)~~
- ~~L. UIO (Controller:Intel IOP348)~~
- **M. SATA (without RAID, AHCI mode)**
- **N. SATA (with RAID, Intel code base)**
- ~~O. UIO (Controller: LSI 2008(IR Mode))~~
- ~~P. UIO (Controller: LSI 2008(IMR Mode)~~
- ~~Q. UIO (Controller LSI 2108(SR Mode))~~
- **R. SAS (w/ RAID, Intel code base)**


[More info, unknown meaning](https://cateee.net/lkddb/web-lkddb/SCSI_ISCI.html)

## Backups


### Stop Docker:

      docker stop $(docker ps -a -q)
 
the -a switch lists all containers while without the -a only lists running containers.

!!!Question can I use this to restart those dockers?

## Notifications



```
/usr/local/sbin/notify -i normal -s "Appdata Backup Completed" -d " Appdata Backup completed at `date`"
```



## at command

This also works

      (sleep 10 ; echo "test" > ./testfile ) &
      (sleep 5 ; echo 'test\n' ) > /dev/stdout 2>&1  &
      (sleep 10 ; cat /boot/config/bashcustom >> /root/.bash_profile; echo "done")>/dev/stdout &
      (sleep 10 ; cat /boot/config/bashcustom >> /root/.bash_profile; source ~/.bash_profile; echo "done")>/dev/stdout &
for multiple commands using a file and at is better

The & makes it detach into the background
The parentheses makes sure they run together.

[at](https://www.computerhope.com/unix/uat.htm)

      at 9:30 PM Tue
      at> echo "It's 9:30 PM on Sunday."
      at> ^D
      [[Ctrl]] + [[D]]
      job 1 at Sun Nov 16 09:30:00 2014


| the expression:    | would translate to:       |
| ------------------ | ------------------------- |
| noon               | 12:00 PM October 18 2014  |
| midnight           | 12:00 AM October 19 2014  |
| teatime            | 4:00 PM October 18 2014   |
| tomorrow           | 10:00 AM October 19 2014  |
| noon tomorrow      | 12:00 PM October 19 2014  |
| next week          | 10:00 AM October 25 2014  |
| next monday        | 10:00 AM October 24 2014  |
| fri                | 10:00 AM October 21 2014  |
| NOV                | 10:00 AM November 18 2014 | 
| 2:30 PM            | 2:30 PM October 18 2014   |
| 1430               | 2:30 PM October 18 2014   |
| 2:30 PM tomorrow   | 2:30 PM October 19 2014   |
| 2:30 PM next month | 2:30 PM November 18 2014  |
| 2:30 PM Fri        | 2:30 PM October 21 2014   |
| 2:30 PM 10/21      | 2:30 PM October 21 2014   |
| 2:30 PM 21.10.14   | 2:30 PM October 21 2014   |
| now + 30 minutes   | 10:30 AM October 18 2014  |
| now + 1 hour       | 11:00 AM October 18 2014  |
| now + 4 months     | 10:00 AM February 18 2015 |
| now + 5 years      | 10:00 AM October 18 2019  |

NOV = now + 1 month


`atq` - view the queue

at [-V] [-q queue] [-f file] [-mMlv] timespec...
at [-V] [-q queue] [-f file] [-mMkv] [-t time]
at -c job [job...]
atq [-V] [-q queue]
at [-rd] job [job...]
atrm [-V] job [job...]
batch
at -b


`at -m 01:35 < my-at-jobs.txt`  Run the commands listed in the 'my-at-jobs.txt' file at 1:35 AM.

at


- `at` - executes commands at a specified time.
- `atq` - lists the user's pending jobs, unless the user is the superuser; in that case, everybody's jobs are listed. The format of the output lines (one for each job) is: job number, date, hour, year, queue, and username.
- `atrm` - deletes jobs, identified by their job number.
- `batch` - executes commands when system load levels permit; in other words, when the load average drops below 1.5, or the value specified in the invocation of atd.

 route add -net 192.168.1.0/24 gw 192.168.1.1 metric 10 dev br0
route add -host 169.254.0.1 metric 30 dev br 4

 route add -host 169.254.0.1 metric 30 dev br4
route add -net 192.168.2.0/24 metric 20 dev br3
ip -4 route del 192.168.0.0/16

 ip route show
default via 192.168.1.1 dev br2 proto dhcp src 192.168.1.242 metric 4
default via 192.168.1.1 dev br5 proto dhcp src 192.168.1.245 metric 5
default via 192.168.1.1 dev br0 proto dhcp src 192.168.1.240 metric 220
169.254.0.0/16 dev br4 proto kernel scope link src 169.254.0.2
169.254.0.1 dev br4 scope link metric 30
192.168.1.0/24 dev br2 proto dhcp scope link src 192.168.1.242 metric 4
192.168.1.0/24 dev br5 proto dhcp scope link src 192.168.1.245 metric 5
192.168.1.0/24 dev br0 proto dhcp scope link src 192.168.1.240 metric 220
192.168.2.0/24 dev br3 scope link metric 20

      root@Unraid:~# route del -net 192.168.1.0/24 br1
      root@Unraid:~# route del -net 192.168.1.0/24 br2
      root@Unraid:~# route del -net 192.168.1.0/24 br5
      root@Unraid:~# route del -net 192.168.1.0/24 br0
      root@Unraid:~# route add -net 192.168.1.0/24 metric 10 dev br0
      root@Unraid:~# route add -net default gw 192.168.1.1 metric 9 dev br0
      root@Unraid:~# route add -host 169.254.0.1 metric 30 dev br4
      root@Unraid:~# route add -net 192.168.2.0/24 metric 40 dev br3
      root@Unraid:~# ping -c 1 1.1.1.1


## Theme Engine

CSS to fix column (works but not overriding)

@media (max-width:1680px){
 table.share_status.dashboard.box1{width:28.6% !important;margin-left:0;margin-right:0;float:left}
 table.share_status.dashboard.box2{width:34.6% !important;margin-left:0;margin-right:0;float:right}
 table.share_status.dashboard.box3{width:34.6% !important;margin-left:20px;margin-right:0}
}


table.share_status thead tr:first-child td{font-size:1.2rem;letter-spacing:1px;text-transform:uppercase;color: #dd7055 !important;border-bottom:1px solid #606e7f;}


/*

table.share_status.dashboard tr>td{padding-left:4px;color: #e1dcdc;}




table thead td{line-height:normal; color: #303d45; }
td {
    color: #5d4744;
    background-color: #d7d0d2;
}
*/


table.share_status.dashboard {background-color: #899ba6; color: #e5c9b3;}

table.share_status.dashboard {background-color: #899ba6; color: #e5c9b3;}

table.share_status.dashboard tr>td.next {

## tar

 tar -xJf node-v10.23.0-linux-armv6l.tar.xz
