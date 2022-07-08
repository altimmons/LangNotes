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


### On Windows, DC Setup

```ps
Get-NetRoute 
# lists all windows routes

Get-NetAdapter
# lists the following columns Name- InterfaceDescription- ifIndex Status- MacAddress- LinkSpeed
```
Ethernet 5                Intel(R) Ethernet Server Adapter X...#3      33 Disconnected 90-E2-BA-48-4B-F0          0 bps

I removed the vEthernets that covered the Server Adapters.
To do this I went to device manager, network adapters, then uninstalled the ones that that had *vEthernet (Ethernet 5)* for the example above.

For convienence I renamed the Names

 `Rename-NetAdapter -Name "Ethernet 5" -NewName IntelX520_10Gbs#1`

I removed the Routes that applied to the interfaces that were server cards, 21, 33

`Remove-NetRoute -InterfaceIndex 21 -DestinationPrefix 169.254.0.0/16`

Eventaually `Remove-NetRoute -InterfaceIndex 21`

`Get-NetRoute -InterfaceIndex 33` to get all the routes for that adapter

Added a new route

`New-NetRoute -DestinationPrefix 169.254.0.0/16 -InterfaceIndex 33 -AddressFamily IPv4 -NextHop 169.254.0.2 -PolicyStore ActiveStore -RouteMetric 10 -Publish Yes`

` New-NetRoute -DestinationPrefix 169.254.0.0/16 -InterfaceIndex 21 -AddressFamily IPv4 -NextHop 169.254.0.2 -PolicyStore ActiveStore -RouteMetric 10 -Publish Yes`


Then I neeeded to raise the metric of this card.

`Get-NetIPInterface`

ifIndex InterfaceAlias   AddressFamily NlMtu(Bytes) InterfaceMetric Dhcp     ConnectionState PolicyStore
------- --------------   ------------- ------------ --------------- ----     --------------- -----------
113     vEthernet (WSL)   IPv6           1500              15       Enabled  Connected       ActiveStore


`Set-NetIPInterface -InterfaceIndex 33 -AddressFamily IPv4 -NlMtuBytes 9014  `

Tried the above to set the MTU, but didnt work. So I went to the device, in Network Adapters and Enabled Jumbo Frames 9014.

## Nice to know commands



### Docker service

`/etc/rc.d/rc.docker <command>`

Available commands: `start stop restart status`

### Docker containers

`docker <command> <containername>`
Available commands: `start stop restart pasue logs`

Print all container names:


`docker ps --format '{{.Names}}'`

Print all container images:


`docker ps --format '{{.Image}}'`

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

[More on NFS](https://wiki.
rchlinux.org/index.php/NFS#Server)


initially `/etc/exports` wa
 

         #"/mnt/user/rA" -a
         ync,no_subtree_check,fsid=100 *(sec=sys,rw,insecure,anongid=100,anonuid=99,all_squash)

Which gave

      `May 9 22:30:01 Unraid mountd[30694]: refused mount request from 192.168.1.25 for /mnt/user/rA (/): not exported`

Or similar, lost original error, added this from another user and edited.

After much searching, and adding NFS rules in, I found that users go AFTER.  

as opposed to THIS example 

      "#"/mnt/user/rA"    192.168.1.0/255.255.0.0(ro,async,no_subtree_check,fsid=100) *(sec=sys,rw,insecure,anongid=100,anonuid=99,all_squ>" 

```bash
  GNU nano 4.6                                                  exports                                                             
		#> See exports(5) for a description.
		#> This file contains a list of all directories exported to other computers.
		#> It is used by rpc.nfsd and rpc.mountd.


"/mnt/user/rA" -async,no_subtree_check,fsid=100 DESKTOP 169.254.0.0/255.255.255.248 192.168.1.0/24
"/mnt/user/"    -ro,sync,no_subtree_check,fsid=100 169.254.0.2/255.255.255.248 DESKTOP 192.168.1.0/24
```

This seems to work.  Usng multiple users.  Will have to add laptop.


## More NFS

!!! Attention These are Windows Specific Commands

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

`>NET USE /DELETE \\UNRAID\$IPC`

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
		#> See exports(5) for a description.
		#> This file contains a list of all directories exported to other computers.
		#> It is used by rpc.nfsd and rpc.mountd.

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
      Nov 3 17:52:50 Unraid rpc.mountd[29835]: refused mount request from 169.254.0.1 for /IPC/ (/)

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



      If you mount **NFS shares from an elevated command prompt** (Run as administrator), the mount will not show up in the explorer running with normal user privileges. The solution is to unmount the share and remount it, either from explorer or from an ordinary command prompt. Admin privileges are not required for NFS mounts.


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


!!! Important This Worked
      
      mount -u:andyt -p:Lauren7! \\UNRAID\mnt\user\rA\ A:

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


### ip route format

ip route del default via 192.168.1.1 dev br1 metric 3

The config files are here:

/lib/dhcpcd/dhcpcd-hooks#

 
ini=/var/local/emhttp/network.ini
cfg=/boot/config/network.cfg
tmp=/var/tmp/network.cfg

### More Commands 

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


### Check Port Binding

[Source](https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/)


Any of the following


`sudo lsof -i -P -n | grep LISTEN2`

`sudo netstat -tulpn | grep LISTEN2`
The netstat command deprecated for some time on Linux. Therefore, you need to use the ss command as follows:

      sudo ss -tulw
      sudo ss -tulwn
      sudo ss -tulwn | grep LISTEN

`sudo ss -tulpn | grep LISTEN2`

`sudo lsof -i:22 ## see a specific port such as 22 ##2`

`sudo nmap -sTU -O IP-address-Here2`

Viewing the Internet network services list
The /etc/services is a text file mapping between human-friendly textual names for internet services and their underlying assigned port numbers and protocol types. Use the cat command or more command/less command to view it:
`less /etc/services`

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


## Getting 10gb connection up

            ip route add 169.254.0.1 scope host metric 1 dev eth4
            ip route del default dev eth4

   ## interesting

This DOES NOT WORK on Unraid, but has some interesting commands and bash examples./

```sh
      #!/bin/sh

      # host we want to "reach"
      host=google.com

      # get the ip of that host (works with dns and /etc/hosts. In case we get  
      # multiple IP addresses, we just want one of them
      host_ip=$(getent ahosts "$host" | awk '{print $1; exit}')

      # only list the interface used to reach a specific host/IP. We only want the part
      # between dev and src (use grep for that)
      ip route get "$host_ip" | grep -Po '(?<=(dev )).*(?= src| proto)'
```

more 

      ip route get 8.8.8.8 | sed -n 's/.*dev \([^\ ]*\) table.*/\1/p'


#### get route

      ip route get 1.1.1.1

      ip route get 8.8.8.8
8.8.8.8 via 192.168.1.1 dev br0 src 192.168.1.240 uid 0
ip route get 169.254.0.1
169.254.0.1 dev eth4 src 169.254.0.2 uid 0
    cache
     ip route get 192.168.1.25
192.168.1.25 dev shim-br1 src 192.168.1.241 uid 0
    cache

### Matching a route

ip -c route show to match 169.222.0.1

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

If you don't want tee to write to the standard output, redirect it to /dev/null:

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

20-45  49-53 56-155 211

1-18 
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


## bpytop

cant remember what all needed ot be added

but pybtop can be installed with pip install bpytop


## Sensors

sensors-detect - looks for sensors

sensors - lists data


## Arch Details

### Using PACMAN
[Pacman Main article](https://wiki.archlinux.org/index.php/Pacman)

[Pacman Tips and Tricks](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks)



[Info on arch](https://wiki.archlinux.org/index.php/Mirrors)


`pacman -Syyuu` to sync (I thought this was sync package lists, but it instead installed 400 mb of stuff...)  Maybe like apt-get upgrade?

Installing specific packages

To install a single package or list of packages, including dependencies, issue the following command:

            # pacman -S package_name1 package_name2 ...

To install a list of packages with regex (see this forum thread):

            # pacman -S $(pacman -Ssq package_regex)

Sometimes there are multiple versions of a package in different repositories (e.g. extra and testing). To install the version from the extra repository in this example, the repository needs to be defined in front of the package name:

            # pacman -S extra/package_name

To install a number of packages sharing similar patterns in their names one can use curly brace expansion. For example:

            # pacman -S plasma-{desktop,mediacenter,nm}

This can be expanded to however many levels needed:

            # pacman -S plasma-{workspace{,-wallpapers},pa}

#### Removing

Removing packages

To remove a single package, leaving all of its dependencies installed:

		#> pacman -R package_name

To remove a package and its dependencies which are not required by any other installed package:

		#> pacman -Rs package_name

The above may sometimes refuse to run when removing a group which contains otherwise needed packages. In this case try:

		#> pacman -Rsu package_name

To remove a package, its dependencies and all the packages that depend on the target package:
Warning: This operation is recursive, and must be used with care since it can remove many potentially needed packages.

		#> pacman -Rsc package_name

To remove a package, which is required by another package, without removing the dependent package:
Warning: The following operation can break a system and should be avoided. See System maintenance		#>Avoid certain pacman commands.

		#> pacman -Rdd package_name

Pacman saves important configuration files when removing certain applications and names them with the extension: .pacsave. To prevent the creation of these backup files use the -n option:

		#> pacman -Rn package_name

Note: Pacman will not remove configurations that the application itself creates (for example "dotfiles" in the home folder).

#### Querying package databases

Pacman queries the **local package database** with the `-Q` flag, **the sync database** with the `-S` flag and **the files database** with the `-F` flag. See `pacman -Q --help`, `pacman -S --help` and `pacman -F --help` for the respective suboptions of each flag.

Pacman can search for packages in the database, searching both in packages' names and descriptions:

		$> pacman -Ss string1 string2 ...

Sometimes, -s's builtin ERE (Extended Regular Expressions) can cause a lot of unwanted results, so it has to be limited to match the package name only; not the description nor any other field:

		$> pacman -Ss '^vim-'

To search for already installed packages:

		$> pacman -Qs string1 string2 ...

To search for package file names in remote packages:

		$> pacman -F string1 string2 ...

To display extensive information about a given package:

		$> pacman -Si package_name

For locally installed packages:

		$> pacman -Qi package_name

Passing two -i flags will also display the list of backup files and their modification states:

		$> pacman -Qii package_name

To retrieve a list of the files installed by a package:

		$> pacman -Ql package_name

To retrieve a list of the files installed by a remote package:

		$> pacman -Fl package_name

To verify the presence of the files installed by a package:

		$> pacman -Qk package_name

Passing the k flag twice will perform a more thorough check.

To query the database to know which package a file in the file system belongs to:

		$> pacman -Qo /path/to/file_name

To query the database to know which remote package a file belongs to:

		$> pacman -F /path/to/file_name

To list all packages no longer required as dependencies (orphans):

		$> pacman -Qdt

Additional commands

Download a package without installing it:

		#> pacman -Sw package_name

Install a 'local' package that is not from a remote repository (e.g. the package is from the AUR):

		#> pacman -U /path/to/package/package_name-version.pkg.tar.zst

To keep a copy of the local package in pacman's cache, use:

		#> pacman -U file:///path/to/package/package_name-version.pkg.tar.zst

Install a 'remote' package (not from a repository stated in pacman's configuration files):

		#> pacman -U http://www.example.com/repo/example.pkg.tar.zst

To inhibit the -S, -U and -R actions, -p can be used.

Pacman always lists packages to be installed or removed a

Search for a package that contains a specific file

Sync the files database:

# pacman -Fy

Search for a package containing a file, e.g.:

$ pacman -F pacman



##  Docker

docker run  --network macvlan3 --name=alptest --ip 192.168.1.43 --dns 1.1.1.1,9.9.9.9 -h alpinetest -it --rm alpine /bin/sh
 -it instructs Docker to allocate a pseudo-TTY connected to the

 --ip assigns a static ip- dhcp doesnt work
 --dns should assign dns servers,
 -- rm removes upon exit
 --net assigns the network
 -h sets the hostname

 So in Unraid, additional parameters would be this:

 -net macvlan3 --ip 192.168.1.xx --dns 1.1.1.1 -h hostname -name ?
--net macvlan3 --ip 192.168.1.xx --dns 1.1.1.1 -h hostname --name hostname -l hostname --net-alias hostname --device USB -- dns-search local  Timmons Family --domainname Timmons..Family

 also consider:
 --expose  Expose a port or a range of ports
--gpus		API 1.40+
GPU devices to add to the container ('all' to pass all GPUs)
--label , -l		Set meta data on a container
--link-local-ip		Container IPv4/IPv6 link-local addresses
--link		Add link to another container
--mount		Attach a filesystem mount to the container
--net-alias		Add network-scoped alias for the container
-env VAR1=value1 --env VAR2=value2 
--publish , -p		Publish a container's port(s) to the host
--publish-all , -P		Publish all exposed ports to random ports
--device		Add a host device to the container

                  --device=/dev/sdc:/dev/xvdc \
             --device=/dev/sdd --device=/dev/zero:/dev/nulo \
             -i -t \
             ubuntu ls -l /dev/{xvdc,sdd,nulo}
--dns-search		Set custom DNS search domains  
--domainname		Container NIS domain name
--dns add dns servers
            Syntax for multiple  --dns="1.0.0.1" --dns="1.1.1.1" 
 ** Your container will use the same DNS servers as the host by default, but you can override this with --dns.
Add entries to container hosts file (--add-host)

--add-host=docker:93.184.216.34

!!!Note Note: On options above- with multiple values
                        
                        `--dns` -The IP address of a DNS server. To specify multiple DNS servers, use multiple --dns flags. If the container cannot reach any of the IP addresses you specify, Google's public DNS server 8.8.8.8 is added, so that your container can resolve internet domains.
                        `--dns-search` -> A DNS search domain to search non-fully-qualified hostnames. To specify multiple DNS search prefixes, use multiple --dns-search flags.
                        `--dns-opt` -> A key-value pair representing a DNS option and its value. See your operating system's documentation for resolv.conf for valid options.
                        `--hostname` -> The hostname a container uses for itself. Defaults to the container's ID if not specified.
      




The flags you pass to ip addr show depend on whether you are using IPv4 or IPv6 networking in your containers. Use the following flags for IPv4 address retrieval for a network device named eth0:

 HOSTIP=`ip -4 addr show scope global dev eth0 | grep inet | awk '{print $2}' | cut -d / -f 1 | sed -n 1p`
 docker run  --add-host=docker:${HOSTIP} --rm -it debian


[](https://docs.docker.com/engine/reference/run/)


#### Network: host

With the network set to `host` a container will share the host's network stack and all interfaces from the host will be available to the container. The container's hostname will match the hostname on the host system. Note that `--mac-address` is invalid in `host` netmode. Even in `host` network mode a container has its own UTS namespace by default. As such `--hostname` and `--domainname` are allowed in `host` network mode and will only change the hostname and domain name inside the container. Similar to `--hostname`, the `--add-host`, `--dns`, `--dns-search`, and `--dns-option` options can be used in `host` network mode. These options update `/etc/hosts` or `/etc/resolv.conf` inside the container. No change are made to `/etc/hosts` and `/etc/resolv.conf` on the host.

Compared to the default `bridge` mode, the `host` mode gives *significantly* better networking performance since it uses the host's native networking stack whereas the bridge has to go through one level of virtualization through the docker daemon. It is recommended to run containers in this mode when their networking performance is critical, for example, a production Load Balancer or a High Performance Web Server.

> Note
>
> `--network="host"` gives the container full access to local system services such as D-bus and is therefore considered insecure.

#### Network: container

With the network set to `container` a container will share the network stack of another container. The other container's name must be provided in the format of `--network container:<name|id>`. Note that `--add-host` `--hostname` `--dns` `--dns-search` `--dns-option` and `--mac-address` are invalid in `container` netmode, and `--publish` `--publish-all` `--expose` are also invalid in `container` netmode.

Example running a Redis container with Redis binding to `localhost` then running the `redis-cli` command and connecting to the Redis server over the `localhost` interface.

```
$ docker run -d --name redis example/redis --bind 127.0.0.1
$ # use the redis container's network stack to access localhost
$ docker run --rm -it --network container:redis example/redis-cli -h 127.0.0.1

```

#### User-defined network

You can create a network using a Docker network driver or an external network driver plugin. You can connect multiple containers to the same network. Once connected to a user-defined network, the containers can communicate easily using only another container's IP address or name.

For `overlay` networks or custom plugins that support multi-host connectivity, containers connected to the same multi-host network but launched from different Engines can also communicate in this way.

The following example creates a network using the built-in `bridge` network driver and running a container in the created network

```
$ docker network create -d bridge my-net
$ docker run --network=my-net -itd --name=container3 busybox

```

### Managing /etc/hosts[](https://docs.docker.com/engine/reference/run/#managing-etchosts)

Your container will have lines in `/etc/hosts` which define the hostname of the container itself as well as `localhost` and a few other common things. The `--add-host` flag can be used to add additional lines to `/etc/hosts`.

```
$ docker run -it --add-host db-static:86.75.30.9 ubuntu cat /etc/hosts

172.17.0.22     09d03f76bf2c
fe00::0         ip6-localnet
ff00::0         ip6-mcastprefix
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
127.0.0.1       localhost
::1	            localhost ip6-localhost ip6-loopback
86.75.30.9      db-static

```

If a container is connected to the default bridge network and `linked` with other containers, then the container's `/etc/hosts` file is updated with the linked container's name.

> Note
>
> Since Docker may live update the container's `/etc/hosts` file, there may be situations when processes inside the container can end up reading an empty or incomplete `/etc/hosts` file. In most cases, retrying the read again should fix the problem.
>
>



## Mount luks Volume

```sh
cryptsetup luksOpen /dev/sdag1 Removed
# should ask for password PID
# cryptsetup luksOpen mountpoint+partition# Name/Handlels

#should now show up here
ls /dev/mapper
# create a place to mount it
mkdir /mnt/Removed
mount /dev/mapper/Removed /mnt/Removed
```

```
udisksctl unlock -b /dev/sdb5
udisksctl mount -b /dev/mapper/ubuntu--vg-root
```


`mount` lists mounted drives
`column` breaks output into readable columns

`mount | column -t` gives a table of mounted devices

### fix 'BTRFS error (device dm-5): parent transid verify failed on 7138349416448 wanted 41114 found 41104'
____

[souce stack overflow](https://stackoverflow.com/questions/46472439/fix-btrfs-btrfs-parent-transid-verify-failed-on)

BTRFS warning (device dm-0): 'usebackuproot' is deprecated, use 'rescue=usebackuproot' instead

```
cryptsetup luksOpen /dev/sdx1 sdx
mkdir /mnt/sdx
 cd /dev/mapper/
mount -t btrfs -o ro usebackuproot /dev/mapper/sdx /mnt/sdx
 pushd /mnt/sdx
cryptsetup luksOpen /dev/sdh1 target
ls /dev/mapper
 mkdir /mnt/target
btrfs scrub start /mnt/sdx

mount -t btrfs /dev/mapper/target /mnt/target

du -d 1 -h /mnt/target

```

## Fixing Log Issues


log is full

`# df -h /var/log`

            Filesystem      Size  Used Avail Use% Mounted on
            tmpfs           384M  384M     0 100% /var/log    

!!!note Note: This command is pretty useful
            `# du -sm /var/log/*`


`# du -sm /var/log/*`

            0       /var/log/apcupsd.events
            28      /var/log/atop
            0       /var/log/btmp
            0       /var/log/cron
            0       /var/log/debug
            1       /var/log/diskinfo.log
            1       /var/log/dmesg
            1       /var/log/docker.log
            0       /var/log/faillog
            0       /var/log/lastlog
            1       /var/log/libvirt
            0       /var/log/maillog
            0       /var/log/messages
            0       /var/log/nfsd
            1       /var/log/nginx
            0       /var/log/packages
            1       /var/log/pkgtools
            1       /var/log/plugins
            0       /var/log/preclear.disk.log
            0       /var/log/pwfail
            0       /var/log/removed_packages
            0       /var/log/removed_scripts
            0       /var/log/removed_uninstall_scripts
            1       /var/log/samba
            0       /var/log/scripts
            0       /var/log/secure
            0       /var/log/setup
            0       /var/log/spooler
            0       /var/log/swtpm
            353     /var/log/syslog
            2       /var/log/syslog.1
            2       /var/log/syslog.2
            0       /var/log/tmp
            0       /var/log/vfio-pci
            1       /var/log/wtmp

This shows 353MB in  /var/log/syslog
tried:

`mount -o remount, size=512m  /var/log `
`mount -o remount, size=770m  /var/log ` since I wanted at least double the size

usage immedietly shoots to 770m
changed it to 2048 and in less than a second its alread 796 (generating 26MB a second or so)

root@Unraid:/var/log# wc -l /var/log/syslog
5135382 /var/log/syslog


Then 
```
root@Unraid:/var/log# gawk '!/ Unraid kernel: md: disk13 read error, sector=/' /var/log/syslog | wc -l
9877
root@Unraid:/var/log# wc -l /var/log/syslog
5135382 /var/log/syslog
```

            Bad drives are 13, 17, and 4

`gawk -i inplace '!/ Unraid kernel: md: disk13 read error, sector=/' /var/log/syslog `


gawk '!/ Unraid kernel: md: disk17 read error, sector=/' /var/log/syslog  |wc -l
2619666
mount -o remount,size=4048m /var/log

`root@Unraid:/var/log# gawk -i inplace '!/ Unraid kernel: md: disk17 read error, sector=/' /var/log/syslog `
gawk: cmd. line:1: (FILENAME=/var/log/syslog FNR=1) fatal: print to "standard output" failed (No space left on device)
`root@Unraid:/var/log# gawk -i inplace '!/ Unraid kernel: md: disk17 read error, sector=/' /var/log/syslog `
`root@Unraid:/var/log# wc -l ./syslog`
2619666 ./syslog

`root@Unraid:~# mount -o remount,size=4048m /var/log`
`root@Unraid:~# df -h /var/log `
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           4.0G  2.3G  1.8G  57% /var/log


`root@Unraid:~# df -h /var/log `
Filesystem      Size  Used Avail Use% Mounted on
tmpfs           4.0G  2.5G  1.5G  63% /var/log
`root@Unraid:~# du -sm /var/log/*`
0       /var/log/apcupsd.events
28      /var/log/atop
0       /var/log/btmp
0       /var/log/cron
0       /var/log/debug
1       /var/log/diskinfo.log
1       /var/log/dmesg
1       /var/log/docker.log
0       /var/log/faillog
0       /var/log/lastlog
1       /var/log/libvirt
0       /var/log/maillog
0       /var/log/messages
0       /var/log/nfsd
1       /var/log/nginx
0       /var/log/packages
1       /var/log/pkgtools
1       /var/log/plugins
0       /var/log/preclear.disk.log
0       /var/log/pwfail
0       /var/log/removed_packages
0       /var/log/removed_scripts
0       /var/log/removed_uninstall_scripts
1       /var/log/samba
0       /var/log/scripts
0       /var/log/secure
0       /var/log/setup
0       /var/log/spooler
0       /var/log/swtpm
2       /var/log/syslog
2       /var/log/syslog.1
2       /var/log/syslog.2
0       /var/log/tmp
0       /var/log/vfio-pci
1       /var/log/wtmp


lsblk --sort NAME -d -o NAME,VENDOR,MODEL,SERIAL,TRAN,MAJ:MIN,PTUUID,PTTYPE,SIZE,MIN-IO,LOG-SEC,ROTA,HCTL,REV,WWN --include 8,65,66
lsblk --sort NAME -d -o NAME,TRAN,VENDOR,MODEL,SERIAL,SIZE,MAJ:MIN --include 8,65,66
lsblk --sort NAME -d -o NAME,VENDOR,MODEL,SERIAL,TRAN,MAJ:MIN,PTUUID,PTTYPE,SIZE,MIN-IO,LOG-SEC,ROTA,HCTL,REV,WWN | grep  ^sd


## CryptSetup

  !!! Abstract cryptsetup 2.3.4;

            Usage: cryptsetup [OPTION...] <action> <action-specific>
            -v, --verbose                         Shows more detailed error messages
                  --debug                           Show debug messages
                  --debug-json                      Show debug messages including JSON metadata
            -c, --cipher=STRING                   The cipher used to encrypt the disk (see /proc/crypto)
            -h, --hash=STRING                     The hash used to create the encryption key from the passphrase
            -y, --verify-passphrase               Verifies the passphrase by asking for it twice
            -d, --key-file=STRING                 Read the key from a file
                  --master-key-file=STRING          Read the volume (master) key from file.
                  --dump-master-key                 Dump volume (master) key instead of keyslots info
            -s, --key-size=BITS                   The size of the encryption key
            -l, --keyfile-size=bytes              Limits the read from keyfile
                  --keyfile-offset=bytes            Number of bytes to skip in keyfile
                  --new-keyfile-size=bytes          Limits the read from newly added keyfile
                  --new-keyfile-offset=bytes        Number of bytes to skip in newly added keyfile
            -S, --key-slot=INT                    Slot number for new key (default is first free)
            -b, --size=SECTORS                    The size of the device
                  --device-size=bytes               Use only specified device size (ignore rest of device). DANGEROUS!
            -o, --offset=SECTORS                  The start offset in the backend device
            -p, --skip=SECTORS                    How many sectors of the encrypted data to skip at the beginning
            -r, --readonly                        Create a readonly mapping
            -q, --batch-mode                      Do not ask for confirmation
            -t, --timeout=secs                    Timeout for interactive passphrase prompt (in seconds)
                  --progress-frequency=secs         Progress line update (in seconds)
            -T, --tries=INT                       How often the input of the passphrase can be retried
                  --align-payload=SECTORS           Align payload at <n> sector boundaries - for luksFormat
                  --header-backup-file=STRING       File with LUKS header and keyslots backup
                  --use-random                      Use /dev/random for generating volume key
                  --use-urandom                     Use /dev/urandom for generating volume key
                  --shared                          Share device with another non-overlapping crypt segment
                  --uuid=STRING                     UUID for device to use
                  --allow-discards                  Allow discards (aka TRIM) requests for device
                  --header=STRING                   Device or file with separated LUKS header
                  --test-passphrase                 Do not activate device, just check passphrase
                  --tcrypt-hidden                   Use hidden header (hidden TCRYPT device)
                  --tcrypt-system                   Device is system TCRYPT drive (with bootloader)
                  --tcrypt-backup                   Use backup (secondary) TCRYPT header
                  --veracrypt                       Scan also for VeraCrypt compatible device
                  --veracrypt-pim=INT               Personal Iteration Multiplier for VeraCrypt compatible device
                  --veracrypt-query-pim             Query Personal Iteration Multiplier for VeraCrypt compatible device
            -M, --type=STRING                     Type of device metadata: luks, luks1, luks2, plain, loopaes, tcrypt, bitlk
                  --force-password                  Disable password quality check (if enabled)
                  --perf-same_cpu_crypt             Use dm-crypt same_cpu_crypt performance compatibility option
                  --perf-submit_from_crypt_cpus     Use dm-crypt submit_from_crypt_cpus performance compatibility option
                  --perf-no_read_workqueue          Bypass dm-crypt workqueue and process read requests synchronously
                  --perf-no_write_workqueue         Bypass dm-crypt workqueue and process write requests synchronously
                  --deferred                        Device removal is deferred until the last user closes it
                  --serialize-memory-hard-pbkdf     Use global lock to serialize memory hard PBKDF (OOM workaround)
            -i, --iter-time=msecs                 PBKDF iteration time for LUKS (in ms)
                  --pbkdf=STRING                    PBKDF algorithm (for LUKS2): argon2i, argon2id, pbkdf2
                  --pbkdf-memory=kilobytes          PBKDF memory cost limit
                  --pbkdf-parallel=threads          PBKDF parallel cost
                  --pbkdf-force-iterations=LONG     PBKDF iterations cost (forced, disables benchmark)
                  --priority=STRING                 Keyslot priority: ignore, normal, prefer
                  --disable-locks                   Disable locking of on-disk metadata
                  --disable-keyring                 Disable loading volume keys via kernel keyring
            -I, --integrity=STRING                Data integrity algorithm (LUKS2 only)
                  --integrity-no-journal            Disable journal for integrity device
                  --integrity-no-wipe               Do not wipe device after format
                  --integrity-legacy-padding        Use inefficient legacy padding (old kernels)
                  --token-only                      Do not ask for passphrase if activation by token fails
                  --token-id=INT                    Token number (default: any)
                  --key-description=STRING          Key description
                  --sector-size=INT                 Encryption sector size (default: 512 bytes)
                  --iv-large-sectors                Use IV counted in sector size (not in 512 bytes)
                  --persistent                      Set activation flags persistent for device
                  --label=STRING                    Set label for the LUKS2 device
                  --subsystem=STRING                Set subsystem label for the LUKS2 device
                  --unbound                         Create or dump unbound (no assigned data segment) LUKS2 keyslot
                  --json-file=STRING                Read or write the json from or to a file
                  --luks2-metadata-size=bytes       LUKS2 header metadata area size
                  --luks2-keyslots-size=bytes       LUKS2 header keyslots area size
                  --refresh                         Refresh (reactivate) device with new parameters
                  --keyslot-key-size=BITS           LUKS2 keyslot: The size of the encryption key
                  --keyslot-cipher=STRING           LUKS2 keyslot: The cipher used for keyslot encryption
                  --encrypt                         Encrypt LUKS2 device (in-place encryption).
                  --decrypt                         Decrypt LUKS2 device (remove encryption).
                  --init-only                       Initialize LUKS2 reencryption in metadata only.
                  --resume-only                     Resume initialized LUKS2 reencryption only.
                  --reduce-device-size=bytes        Reduce data device size (move data offset). DANGEROUS!
                  --hotzone-size=bytes              Maximal reencryption hotzone size.
                  --resilience=STRING               Reencryption hotzone resilience type (checksum,journal,none)
                  --resilience-hash=STRING          Reencryption hotzone checksums hash
                  --active-name=STRING              Override device autodetection of dm device to be reencrypted

            Help options:
            -?, --help                            Show this help message
                  --usage                           Display brief usage
            -V, --version                         Print package version

            <action> is one of:
                  open <device> [--type <type>] [<name>] - open device as <name>
                  close <name> - close device (remove mapping)
                  resize <name> - resize active device
                  status <name> - show device status
                  benchmark [--cipher <cipher>] - benchmark cipher
                  repair <device> - try to repair on-disk metadata
                  reencrypt <device> - reencrypt LUKS2 device
                  erase <device> - erase all keyslots (remove encryption key)
                  convert <device> - convert LUKS from/to LUKS2 format
                  config <device> - set permanent configuration options for LUKS2
                  luksFormat <device> [<new key file>] - formats a LUKS device
                  luksAddKey <device> [<new key file>] - add key to LUKS device
                  luksRemoveKey <device> [<key file>] - removes supplied key or key file from LUKS device
                  luksChangeKey <device> [<key file>] - changes supplied key or key file of LUKS device
                  luksConvertKey <device> [<key file>] - converts a key to new pbkdf parameters
                  luksKillSlot <device> <key slot> - wipes key with number <key slot> from LUKS device
                  luksUUID <device> - print UUID of LUKS device
                  isLuks <device> - tests <device> for LUKS partition header
                  luksDump <device> - dump LUKS partition information
                  tcryptDump <device> - dump TCRYPT device information
                  bitlkDump <device> - dump BITLK device information
                  luksSuspend <device> - Suspend LUKS device and wipe key (all IOs are frozen)
                  luksResume <device> - Resume suspended LUKS device
                  luksHeaderBackup <device> - Backup LUKS device header and keyslots
                  luksHeaderRestore <device> - Restore LUKS device header and keyslots
                  token <add|remove|import|export> <device> - Manipulate LUKS2 tokens

            You can also use old <action> syntax aliases:
                  open: create (plainOpen), luksOpen, loopaesOpen, tcryptOpen, bitlkOpen
                  close: remove (plainClose), luksClose, loopaesClose, tcryptClose, bitlkClose

            <name> is the device to create under /dev/mapper
            <device> is the encrypted device
            <key slot> is the LUKS key slot number to modify
            <key file> optional key file for the new key for luksAddKey action

            Default compiled-in metadata format is LUKS2 (for luksFormat action).

            Default compiled-in key and passphrase parameters:
                  Maximum keyfile size: 8192kB, Maximum interactive passphrase length 512 (characters)
            Default PBKDF for LUKS1: pbkdf2, iteration time: 2000 (ms)
            Default PBKDF for LUKS2: argon2i
                  Iteration time: 2000, Memory required: 1048576kB, Parallel threads: 4

            Default compiled-in device cipher parameters:
                  loop-AES: aes, Key 256 bits
                  plain: aes-cbc-essiv:sha256, Key: 256 bits, Password hashing: ripemd160
                  LUKS: aes-xts-plain64, Key: 256 bits, LUKS header hashing: sha256, RNG: /dev/urandom
                  LUKS: Default keysize with XTS mode (two internal keys) will be doubled.

!!! Abstract dmsetup

            dmsetup
                  [--version] [-h|--help [-c|-C|--columns]]
                  [-v|--verbose [-v|--verbose ...]] [-f|--force]
                  [--checks] [--manglename {none|hex|auto}]
                  [-r|--readonly] [--noopencount] [--noflush] [--nolockfs] [--inactive]
                  [--udevcookie <cookie>] [--noudevrules] [--noudevsync] [--verifyudev]
                  [-y|--yes] [--readahead {[+]<sectors>|auto|none}] [--retry]
                  [-c|-C|--columns] [-o <fields>] [-O|--sort <sort_fields>]
                  [-S|--select <selection>] [--nameprefixes] [--noheadings]
                  [--separator <separator>]

                  help [-c|-C|--columns]
                  create <dev_name>
                        [-j|--major <major> -m|--minor <minor>]
                        [-U|--uid <uid>] [-G|--gid <gid>] [-M|--mode <octal_mode>]
                        [-u|--uuid <uuid>] [--addnodeonresume|--addnodeoncreate]
                        [--readahead {[+]<sectors>|auto|none}]
                        [-n|--notable|--table {<table>|<table_file>}]
                  create --concise [<concise_device_spec_list>]
                  remove [--deferred] [-f|--force] [--retry] <device>...
                  remove_all [-f|--force]
                  suspend [--noflush] [--nolockfs] <device>...
                  resume [--noflush] [--nolockfs] <device>...
                        [--addnodeonresume|--addnodeoncreate]
                        [--readahead {[+]<sectors>|auto|none}]
                  load <device> [<table>|<table_file>]
                  clear <device>
                  reload <device> [<table>|<table_file>]
                  wipe_table [-f|--force] [--noflush] [--nolockfs] <device>...
                  rename <device> [--setuuid] <new_name_or_uuid>
                  message <device> <sector> <message>
                  ls [--target <target_type>] [--exec <command>] [-o <options>] [--tree]
                  info [<device>...]
                  deps [-o <options>] [<device>...]
                  stats <command> [<options>] [<device>...]
                  status [<device>...] [--noflush] [--target <target_type>]
                  table [<device>...] [--concise] [--target <target_type>] [--showkeys]
                  wait <device> [<event_nr>] [--noflush]
                  mknodes [<device>...]
                  mangle [<device>...]
                  udevcreatecookie
                  udevreleasecookie [<cookie>]
                  udevflags <cookie>
                  udevcomplete <cookie>
                  udevcomplete_all [<age_in_minutes>]
                  udevcookies
                  target-version [<target>...]
                  targets
                  version
                  setgeometry <device> <cyl> <head> <sect> <start>
                  splitname <device> [<subsystem>]

            <device> may be device name or (if only one) -u <uuid> or -j <major> -m <minor>
            <mangling_mode> is one of 'none', 'auto' and 'hex'.
            <fields> are comma-separated.  Use 'help -c' for list.
            <concise_device_specification> has single-device entries separated by semi-colons:
            <name>,<uuid>,<minor>,<flags>,<table>
                  where <flags> is 'ro' or 'rw' (the default) and any of <uuid>, <minor>
                  and <flags> may be empty. Separate extra table lines with commas.
            E.g.: dev1,,,,0 100 linear 253:1 0,100 100 error;dev2,,,ro,0 1 error
            Table_file contents may be supplied on stdin.
            Options are: devno, devname, blkdevname.
            Tree specific options are: ascii, utf, vt100; compact, inverted, notrunc;
                                    blkdevname, [no]device, active, open, rw and uuid.

            Mapped Device Name Fields
      -------------------------
      name_all              - All fields in this section.
      name                  - Name of mapped device.
      mangled_name          - Mangled name of mapped device.
      unmangled_name        - Unmangled name of mapped device.
      uuid                  - Unique (optional) identifier for mapped device.
      mangled_uuid          - Mangled unique (optional) identifier for mapped device.
      unmangled_uuid        - Unmangled unique (optional) identifier for mapped device.
      read_ahead            - Read ahead value.

      Mapped Device Information Fields
      --------------------------------
      info_all              - All fields in this section.
      blkdevname            - Name of block device.
      attr                  - (L)ive, (I)nactive, (s)uspended, (r)ead-only, read-(w)rite.
      tables_loaded         - Which of the live and inactive table slots are filled.
      suspended             - Whether the device is suspended.
      readonly              - Whether the device is read-only or writeable.
      devno                 - Device major and minor numbers
      major                 - Block device major number.
      minor                 - Block device minor number.
      open                  - Number of references to open device, if requested.
      segments              - Number of segments in live table, if present.
      events                - Number of most recent event.

      Mapped Device Relationship Information Fields
      ---------------------------------------------
      deps_all              - All fields in this section.
      device_count          - Number of devices used by this one.
      devs_used             - List of names of mapped devices used by this one.
      devnos_used           - List of device numbers of devices used by this one.
      blkdevs_used          - List of names of block devices used by this one.
      device_ref_count      - Number of mapped devices referencing this one.
      names_using_dev       - List of names of mapped devices using this one.
      devnos_using_dev      - List of device numbers of mapped devices using this one.

      Mapped Device Name Components Fields
      ------------------------------------
      splitname_all         - All fields in this section.
      subsystem             - Userspace subsystem responsible for this device.
      vg_name               - LVM Volume Group name.
      lv_name               - LVM Logical Volume name.
      lv_layer              - LVM device layer.

      Mapped Device Statistics Fields
      -------------------------------
      stats_all             - All fields in this section.
      read_count            - Count of reads completed.
      reads_merged_count    - Count of read requests merged.
      read_sector_count     - Count of sectors read.
      read_time             - Accumulated duration of all read requests (ns).
      write_count           - Count of writes completed.
      writes_merged_count   - Count of write requests merged.
      write_sector_count    - Count of sectors written.
      write_time            - Accumulated duration of all writes (ns).
      in_progress_count     - Count of requests currently in progress.
      io_ticks              - Nanoseconds spent servicing requests.
      queue_ticks           - Total nanoseconds spent in queue.
      read_ticks            - Nanoseconds spent servicing reads.
      write_ticks           - Nanoseconds spent servicing writes.
      reads_merged_per_sec  - Read requests merged per second.
      writes_merged_per_sec - Write requests merged per second.
      reads_per_sec         - Reads per second.
      writes_per_sec        - Writes per second.
      read_size_per_sec     - Size of data read per second.
      write_size_per_sec    - Size of data written per second.
      avg_request_size      - Average request size.
      queue_size            - Average queue size.
      await                 - Averate wait time.
      read_await            - Averate read wait time.
      write_await           - Averate write wait time.
      throughput            - Throughput.
      service_time          - Service time.
      util                  - Utilization.
      hist_count            - Latency histogram counts.
      hist_count_bounds     - Latency histogram counts with bin boundaries.
      hist_count_ranges     - Latency histogram counts with bin ranges.
      hist_percent          - Relative latency histogram.
      hist_percent_bounds   - Relative latency histogram with bin boundaries.
      hist_percent_ranges   - Relative latency histogram with bin ranges.
      interval_ns           - Sampling interval in nanoseconds.
      interval              - Sampling interval.

      Mapped Device Statistics Region Information Fields
      --------------------------------------------------
      region_all            - All fields in this section.
      region_id             - Region ID.
      region_start          - Region start.
      region_len            - Region length.
      area_id               - Area ID.
      area_start            - Area offset from start of device.
      area_len              - Area length.
      area_offset           - Area offset from start of region.
      area_count            - Area count.
      group_id              - Group ID.
      program_id            - Program ID.
      user_data             - Auxiliary data.
      precise               - Set if nanosecond precision counters are enabled.
      hist_bins             - The number of histogram bins configured.
      hist_bounds           - Latency histogram bin boundaries.
      hist_ranges           - Latency histogram bin ranges.
      stats_name            - Stats name of current object.
      obj_type              - Type of stats object being reported.

      Special Fields
      --------------
      selected              - Set if item passes selection criteria.
      help                  - Show help.
      ?                     - Show help.


none of these work

```
root@Unraid:~# cryptsetup isLuks /dev/sdae
root@Unraid:~# cryptsetup isLuks /dev/sdae1
root@Unraid:~# cryptsetup isLuks /dev/mapper/md
md1   md11  md12  md13  md14  md15  md16  md17  md2   md3   md4   md5   md6   md8   md9   
root@Unraid:~# cryptsetup isLuks /dev/mapper/md1
```


~# cryptsetup luksDump /dev/sdaf1

root@Unraid:~# cryptsetup luksDump /dev/sdaf1
LUKS header information
Version:        2
Epoch:          3
Metadata area:  16384 [bytes]
Keyslots area:  16744448 [bytes]
UUID:           7d6d47f9-f860-401d-a35a-4bd0ff85a4a7
Label:          (no label)
Subsystem:      (no subsystem)
Flags:          (no flags)

Data segments:
  0: crypt
        offset: 16777216 [bytes]
        length: (whole device)
        cipher: aes-xts-plain64
        sector: 512 [bytes]

Keyslots:
  0: luks2
        Key:        512 bits
        Priority:   normal
        Cipher:     aes-xts-plain64
        Cipher key: 512 bits
        PBKDF:      argon2i
        Time cost:  4
        Memory:     886326
        Threads:    4
        Salt:       33 72 29 e1 b3 11 17 5d de 13 b6 5b fd 56 c7 b6 
                    41 68 1f 7c 84 7e 89 f7 8b 3a 7f 85 1e db 7e 07 
        AF stripes: 4000
        AF hash:    sha256
        Area offset:32768 [bytes]
        Area length:258048 [bytes]
        Digest ID:  0
Tokens:
Digests:
  0: pbkdf2
        Hash:       sha256
        Iterations: 44582
        Salt:       84 be d9 d3 65 5e 95 2a c8 37 40 00 e5 8c bb 17 
                    82 02 a6 12 ca f5 f3 56 43 80 5d 4f 50 1b d8 d7 
        Digest:     3a e6 21 d0 80 88 e6 c8 42 1d 97 b8 69 aa f7 d9 
                    48 77 29 a3 bb 44 77 85 e2 ec e6 5d 99 6e e7 28
                    

cryptsetup luksDump /dev/sdh1 > t2
cryptsetup luksDump /dev/sdo1 > t1
cryptsetup luksDump /dev/sdaf1 > t3
cryptsetup luksDump /dev/sdr1 > t4
colordiff t1 t3
colordiff t1 t4



for VAR in {1..17} ; do btrfs balance status -v /mnt/disk$VAR; done
No balance found on '/mnt/disk1'
No balance found on '/mnt/disk2'
No balance found on '/mnt/disk3'
No balance found on '/mnt/disk4'
No balance found on '/mnt/disk5'
No balance found on '/mnt/disk6'
No balance found on '/mnt/disk7'
No balance found on '/mnt/disk8'
No balance found on '/mnt/disk9'
No balance found on '/mnt/disk10'
No balance found on '/mnt/disk11'
No balance found on '/mnt/disk12'
No balance found on '/mnt/disk13'
No balance found on '/mnt/disk14'
No balance found on '/mnt/disk15'
No balance found on '/mnt/disk16'
No balance found on '/mnt/disk17'


nOT A BALANCE, MAYBE A SCRUB


root@Unraid:~# for VAR in {1..17} ; do btrfs scrub status /mnt/disk$VAR; done
                  
                  UUID:             4feb617c-e1e5-4b48-9999-0e5002f77a4e
                        no stats available
                  Total to scrub:   5.32TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             3ab2af0a-3ebe-4172-b4db-51a4b9abf355
                        no stats available
                  Total to scrub:   5.25TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             2f27ac4b-8270-427c-a31c-53e13fd33843
                        no stats available
                  Total to scrub:   3.46TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             e57057df-e1f4-4637-9cbd-2721dbf74e29
                  Scrub started:    Wed Feb  9 11:02:05 2022
                  Status:           running
                  Duration:         4:25:10
                  Time left:        4:37:04
                  ETA:              Wed Feb  9 20:04:19 2022
                  Total to scrub:   3.64TiB
                  Bytes scrubbed:   1.78TiB  (48.90%)
                  Rate:             117.20MiB/s
                  Error summary:    no errors found
                  UUID:             2a4d6174-f4c8-4dfd-a8d0-9115b7fc37ac
                        no stats available
                  Total to scrub:   3.41TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             2d3bc7db-9949-45fc-ad90-2ec46618514b
                        no stats available
                  Total to scrub:   3.45TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             2ec5b57a-04ba-4990-ba44-115c8a45234c
                        no stats available
                  Total to scrub:   7.02TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             bd6fc8b4-d44c-4bce-b444-fc9d8881474f
                        no stats available
                  Total to scrub:   6.07TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             d8d1f4d9-2840-4363-83de-513b376db609
                        no stats available
                  Total to scrub:   5.68TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             c65d1de0-6a59-4c09-b023-c23d9ffdc511
                        no stats available
                  Total to scrub:   288.00KiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             d8f68959-89f0-4c97-bc3e-2e79c6224e48
                        no stats available
                  Total to scrub:   6.92TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             ee130c07-e740-4ee6-bf33-0e376ede251c
                        no stats available
                  Total to scrub:   7.95TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             8e903c20-ed05-43f5-8a56-4add337d3cfe
                        no stats available
                  Total to scrub:   2.59TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             e8421b41-a64a-4e11-b173-998bb2a5867b
                        no stats available
                  Total to scrub:   2.37TiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             f573adb4-6321-48b0-b052-8641c6cbf20d
                        no stats available
                  Total to scrub:   288.00KiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             373dcd33-62aa-44a3-84a7-dc614eadc534
                        no stats available
                  Total to scrub:   288.00KiB
                  Rate:             0.00B/s
                  Error summary:    no errors found
                  UUID:             5e5031ab-60b6-454b-b4bf-c0754fcc0c47
                        no stats available
                  Total to scrub:   288.00KiB
                  Rate:             0.00B/s
                  Error summary:    no errors found

NEED TO FIND WHICH DISK IS IN OPERATION

root@Unraid:~# `blkid | grep  2f27ac4b-8270-427c-a31c-53e13fd33843`
/dev/mapper/md3: UUID="2f27ac4b-8270-427c-a31c-53e13fd33843" UUID_SUB="42838760-29b9-4349-bb88-5f78fdb7acf2" BLOCK_SIZE="4096" TYPE="btrfs"

#drive check


Command used: badblocks -wsv -b 4096 /dev/sde

SMART short test showed no errors after badblocks

Command used: fio --filename=/dev/sde --name=randwrite --ioengine=sync --iodepth=1 --rw=randrw --rwmixread=50 --rwmixwrite=50 --bs=4k --direct=0 --numjobs=8 --size=300G --runtime=7200 --group_reporting


### Errors

Mar 4 12:54:45 Unraid kernel: BTRFS error (device dm-2): parent transid verify failed on 7138349907968 wanted 41053 found 41047 


/dev/mapper/md*

`dmsetup ls`  to see whats behind it. `dmsetup info /dev/dm-2`
 
      #> dmsetup ls
      md5     (254:4)
      md16    (254:14)
      md4     (254:3)
      md15    (254:13)
      md3     (254:2)
      md14    (254:12)
      md2     (254:1)
      md13    (254:11)
      md1     (254:0)
      md12    (254:10)
      md11    (254:9)
      md10    (254:8)
      md9     (254:7)
      WD-WCC7K5DSLFPY (254:17)
      md8     (254:6)
      md6     (254:5)
      md17    (254:15)



LVM Logical Volume Management
`sudo lvdisplay|awk  '/LV Name/{n=$3} /Block device/{d=$3; sub(".*:","dm-",d); print d,n;}'`

This doesnt work for me.

`lsd -l` maps *dm-x* to *md-x*, they dont correlate.  However, md-x generally correlates where x is a disk number in the array.  E.g. md-7 is the disk mounted at /mnt/disk7/  which you can get from `lsblk`

       control              Mon Mar 14 00:57:51 2022 0B root root crw-------
       md1@ ⇒ ../dm-0       Tue Mar 22 21:00:52 2022 7B root root lrwxrwxrwx
       md10@ ⇒ ../dm-7      Tue Mar 22 21:01:03 2022 7B root root lrwxrwxrwx
       md11@ ⇒ ../dm-8      Tue Mar 22 21:01:04 2022 7B root root lrwxrwxrwx
       md12@ ⇒ ../dm-9      Tue Mar 22 21:01:06 2022 7B root root lrwxrwxrwx
       md13@ ⇒ ../dm-10     Tue Mar 22 21:01:07 2022 8B root root lrwxrwxrwx
       md14@ ⇒ ../dm-11     Tue Mar 22 21:01:09 2022 8B root root lrwxrwxrwx
       md2@ ⇒ ../dm-1       Tue Mar 22 21:00:54 2022 7B root root lrwxrwxrwx
       md3@ ⇒ ../dm-2       Tue Mar 22 21:00:55 2022 7B root root lrwxrwxrwx
       md4@ ⇒ ../dm-3       Tue Mar 22 21:00:57 2022 7B root root lrwxrwxrwx
       md6@ ⇒ ../dm-4       Tue Mar 22 21:00:59 2022 7B root root lrwxrwxrwx
       md8@ ⇒ ../dm-5       Tue Mar 22 21:01:00 2022 7B root root lrwxrwxrwx
       md9@ ⇒ ../dm-6       Tue Mar 22 21:01:02 2022 7B root root lrwxrwxrwx
       PCG8ZT1S@ ⇒ ../dm-13 Fri Mar 18 16:31:26 2022 8B root root lrwxrwxrwx


`lsblk` will convert *md-x* values to Array disk numbers.  But still not on back to devices *sdX*

This is more succinct than ls -l:

`for x in /dev/mapper/*; do echo "$(realpath $x) -> $x"; done;`

            /dev/mapper/control -> /dev/mapper/control
            /dev/dm-0 -> /dev/mapper/md1
            /dev/dm-7 -> /dev/mapper/md10
            /dev/dm-8 -> /dev/mapper/md11
            /dev/dm-9 -> /dev/mapper/md12
            /dev/dm-10 -> /dev/mapper/md13
            /dev/dm-11 -> /dev/mapper/md14
            /dev/dm-1 -> /dev/mapper/md2


`dmsetup ls --tree -o blkdevname`

            md4 <dm-3> (254:3)
            └─ <md4> (9:4)
            md3 <dm-2> (254:2)
            └─ <md3> (9:3)
            md14 <dm-11> (254:11)
            └─ <md14> (9:14)

When I mount it myself:

            md2 <dm-2> (254:2)
            └─ <md2> (9:2)
            md1 <dm-1> (254:1)
            └─ <md1> (9:1)
            disk4 <dm-0> (254:0)
            └─ <sdk1> (8:161)
            md7 <dm-6> (254:6)
            └─ <md7> (9:7)


## DD


Create 10GB file with random data
dd if=/dev/random of="/mnt/cache/DiskSpeed_fq9.junk" bs=1MB count=10000 conv=noerror status=progress 2> /boot/cache_write.txt



### Mount a VDisk

`modprobe nbd max_part=8`  This is Network Block Device, and the maximum likely partitions on each VDisk.

`qemu-nbd --format=raw --connect=/dev/nbd0 /mnt/address/to/vm.img`
 Raw = .img, other is qcow2

 `                                                     `
            get the partition # for # below

`mkdir /mnt/disks/vdiskmount`

`mount /dev/nbd0p# /mnt/dsks/vdiskmount`

if you get a dirty drive error -shut down correctly or 
      run `ntfsfix /dev/nbd0p#`

`ls /mnt/dsks/vdiskmount`

`umount  /mnt/disks/vdiskmount`

`qemu-nbd --disconnect /dev/nbd0`

`rmmod nbd`


## Delete a Disk

parted and fdisk can be used.  fdisk seems easier

fdisk /dev/sdai 


## BTRFS Guide

[Source](https://www.christitus.com/btrfs-guide)


**Creating a BTRFS Filesystem**

Create the file system on an empty btrfs partition

> `mkfs.btrfs /dev/sda1`  
> _Note: You will need to mount this file system after_

Now we need to make a subvolume _before_ we add data to the device

> btrfs subvolume create /mnt/sda1 _/mnt/subvolumelabel is the mount point!_

After this is complete you can now write data to your BTRFS volume and use all it capabilities. I recommend the label `@` as that is the required label for Timeshift snapshot restores.


### List Subvolumes

`btrfs subv list /`

> root@Unraid:# btrfs subv list /
> ERROR: not a btrfs filesystem: /
> ERROR: can't access '/'
> root@Unraid:# btrfs subv list /mnt/
> ERROR: not a btrfs filesystem: /mnt/
> ERROR: can't access '/mnt/'
> root@Unraid:# btrfs subv list /mnt/disk1

sudo btrfs subv list /home
      will list all the sub-volumes in home.

      To replace a snapshot, relpace in */etc/fstab* in the options `rw,exec,subvolid=###` with the number of the subvolume listed by the above subv list command.

      Flipping back to the last subvolume, by changing the subvolumeid and reboot


To mount a subvol -  `sudo mount -o subvolid=321 /dev/sde /mnt`
 -  to undo - `sudo umount /mnt`


To get the view in the array details--
      `sudo btrfs fi df /home -h`

      `sudo btrfs f i show`


**Disk Usage**
`sudo btrfs fi du /` Note: you can make / any other mount point

Size of btrfs -  `df -h` but for disk usage, the `-s` command in 
      `sudo btrfs fi du /home -s`
To get the view in the array details--
      `sudo btrfs fi df /home -h`

**Scrub SubVolume** Recommended running every week!
`sudo btrfs scrub start /`
*Balance Subvolume* for Performance
`sudo btrfs balance start -musage=50 -dusage=50 /`
Note: Use the *musgae* and *dusage* filters to only balance used blocks above 50 percent utilization
`sudo btrfs balance cancel /` **Stops running balance**
**List Subvolumes** based on mountpoint
``sudo btrfs subv list /home``


**Snapshots**

Snapshots are one of the best things about BTRFS and I absolutely love them. They are incredible powerful and beneficial.

So Lets run through some scenarios when you use Snapshots.

#### Create Snapshot
`sudo btrfs subv snapshop /home /home/.snapshots/2020-01-13`
Using this you can revert the snapshop by simply editing the /etc/fstab and changing the `subvol=2020-01-13` or the corresponding _subvolid_ you get from `sudo btrfs subv list /home`

#### Restore Snapshot

Restore Snapshop after reboot and successful rollback

`sudo btrfs subv delete /home`
`sudo btrfs subv snapshot /home/.snapshots/2020-01-13 /home`

### Must know commands for multiple disks:

Add Disks before creating subvolume: `sudo btrfs device add /dev/sda1 /dev/sdb1`

Add Disk to existing subvolume: `sudo btrfs device add /dev/sdb1 /home`

Delete Disk from subvolume: `sudo btrfs device delete /dev/sdb1 /home`

Creating the RAID File System:

**RAID 1:** `sudo btrfs -m raid1 -d raid1 /dev/sda1 /dev/sdb1`
**RAID 10:** `sudo btrfs -m raid10 -d raid10 /dev/sda1 /dev/sdb1 /dev/sdc1 /dev/sdd1`
**Convert to to RAID 1 after adding disk to existing subvolume**
`btrfs balance start -mconvert=raid1 -dconvert=raid1 /home`

I could put RAID 0 here… but honestly you should just use EXT4 or XFS if you are looking for performance. It would be better than using BTRFS!


reverse lookup, from file offset to inode, `btrfs inspect-internal logical-resolve`

resolve inode number to list of name, `btrfs inspect-internal inode-resolve`

informative, about devices, space allocation or the whole filesystem, many of which is also exported in /sys/fs/btrfs


`tree /sys/fs/btrfs/*/devices/` lists UUID to devices.


### Balance

The primary purpose of the balance feature is to spread block groups across all devices so they match constraints defined by the respective profiles. See mkfs.btrfs(8) section PROFILES for more details. The scope of the balancing process can be further tuned by use of filters that can select the block groups to process. Balance works only on a mounted filesystem. Extent sharing is preserved and reflinks are not broken. Files are not defragmented nor recompressed, file extents are preserved but the physical location on devices will change.

!!!Warning Balance
      Running balance without filters will take a lot of time as it basically move data/metadata from the whole filesystem and needs to update all block pointers.

### How to enable compression


Typically the compression can be enabled on the whole filesystem, specified for the mount point. Note that the compression mount options are shared among all mounts of the same filesystem, either bind mounts or subvolume mounts. Please refer to section MOUNT OPTIONS.

`$ mount -o compress=zstd /dev/sdx /mnt`


## BTRFS Repair

 
[Source Example](https://btrfs.wiki.kernel.org/index.php/Restore)


`/dev/mapper# btrfsck -p /dev/mapper/md7`

If mounted, would have to use `--force` 

This is read only unless `--repair`

as in `root@Unraid:/dev/mapper# btrfsck --repair --force -p /dev/mapper/md7`

      root@Unraid:/dev/mapper# btrfsck -p /dev/mapper/md7
            Opening filesystem to check...
            Checking filesystem on /dev/mapper/md7
            UUID: 2f27ac4b-8270-427c-a31c-53e13fd33843
            parent transid verify failed on 7138349432832 wanted 41006 found 40982items checked)
            parent transid verify failed on 7138349432832 wanted 41006 found 40982
            parent transid verify failed on 7138349432832 wanted 41006 found 40982
            Ignoring transid failure
            [1/7] checking root items                      (0:00:03 elapsed, 367579 items checked)
            parent transid verify failed on 7138349432832 wanted 41006 found 40982
            Ignoring transid failure
            leaf parent key incorrect 7138349432832
            bad block 7138349432832
            [2/7] checking extents                         (0:00:00 elapsed, 123 items checked)
            ERROR: errors found in extent allocation tree or chunk allocation
            cache and super generation don't match, space cache will be invalidated
            [3/7] checking free space tree                 (0:00:00 elapsed)
            [4/7] checking fs roots                        (0:02:24 elapsed, 932 items checked)
            [5/7] checking csums (without verifying data)  (0:00:00 elapsed, 290611 items checked)
            [6/7] checking root refs                       (0:00:00 elapsed, 3 items checked)
            [7/7] checking quota groups skipped (not enabled on this FS)
            ERROR: transid errors in file system
            found 39097171968 bytes used, error(s) found
            total csum bytes: 0
            total tree bytes: 1966080
            total fs tree bytes: 0
            total extent tree bytes: 557056
            btree space waste bytes: 255924
            file data blocks allocated: 0
            referenced 0

root@Unraid:/dev/mapper# mkdir /mnt/md7temp
root@Unraid:/dev/mapper# mount -t btrfs -o usebackuproot /dev/mapper/md7 /mnt/md7temp/
root@Unraid:/dev/mapper# btrfsck --repair -p /mnt/md7temp/


btrfs scrub start -B /dev/mapper/md7


I ran the below and it ran for literal days.  I figured out that the output was counting up, and each time by a multiple of 4096.  Using that, I calculated the number of sectors.  Since it seemed to move sequentially, it seemed it was 35% after 4 days.  I stopped it early

` btrfs -v check --repair --init-extent-tree /dev/mapper/disk4`

>     ref mismatch on [4964993294336 12288] extent item 0, found 1
>     data backref 4964993294336 parent 8669857120256 owner 0 offset 0 >    num_refs 0 not found in extent tree
>     incorrect local backref count on 4964993294336 parent 8669857120256 >owner 0 offset 0 found 1 wanted 0 back 0x3674cf0
>     backpointer mismatch on [4964993294336 12288]
>     adding new data backref on 4964993294336 parent 8669857120256 owner 0 > offset 0 found 1
>     Repaired extent references for 4964993294336
>     ref mismatch on [4964993306624 12288] extent item 0, found 1
>     data backref 4964993306624 parent 8669857120256 owner 0 offset 0 >    num_refs 0 not found in extent tree
>     incorrect local backref count on 4964993306624 parent 8669857120256 >owner 0 offset 0 found 1 wanted 0 back 0x3674e20
>     backpointer mismatch on [4964993306624 12288]
>     adding new data backref on 4964993306624 parent 8669857120256 owner 0 >offset 0 found 1
>     Repaired extent references for 4964993306624

Prior to that I had run: this should have been v2 though

      btrfs -v check -b --repair -p /dev/mapper/disk4
      btrfs -v check --clear-space-cache v1 /dev/mapper/disk4
      btrfs -v check -b --repair --init-extent-tree /dev/mapper/disk4
      btrfs -v check --repair --clear-space-cache v1 /dev/mapper/disk4
      btrfs -v check --repair --init-extent-tree /dev/mapper/disk4

per my logs.  This means the extent tree took forever after clearing the space cache.  Space cache is `V2`

running this:

`btrfs -v check --repair /dev/mapper/disk4`
a second time made it start up the same thing. Only now its *much* faster for some reason.

>		data backref 5009034027008 parent 8507116109824 owner 0 offset 0 num_refs 0 not found in extent tree
>		incorrect local backref count on 5009034027008 parent 8507116109824 owner 0 offset 0 found 1 wanted 0 back 0x13957d0
>		backpointer mismatch on [5009034027008 4096]
>		adding new data backref on 5009034027008 parent 8507116109824 owner 0 offset 0 found 1
>		Repaired extent references for 5009034027008
>		ref mismatch on [5009034031104 12288] extent item 0, found 1
>		data backref 5009034031104 parent 8507116109824 owner 0 offset 0 num_refs 0 not found in extent tree
>		incorrect local backref count on 5009034031104 parent 8507116109824 owner 0 offset 0 found 1 wanted 0 back 0x1395900
>		backpointer mismatch on [5009034031104 12288]
>		adding new data backref on 5009034031104 parent 8507116109824 owner 0 offset 0 found 1
>		Repaired extent references for 5009034031104

So perhaps it still needs to run this, output looks the same, but at least its going faster

 md: unRAID driver removed
>	 md: unRAID driver 2.9.17 installed
>	 mdcmd (1): import 0 sdf 64 13672382412 0 ST14000NM001G-2KJ103_ZTM0CGQ0
>	 md: import disk0: (sdf) ST14000NM001G-2KJ103_ZTM0CGQ0 size: 13672382412 
>	 mdcmd (2): import 1 sdg 64 13672382412 0 WDC_WD140EDFZ-11A0VA0_Y5J1E95C
>	 md: import disk1: (sdg) WDC_WD140EDFZ-11A0VA0_Y5J1E95C size: 13672382412 
>	 mdcmd (3): import 2 sdh 64 13672382412 0 WDC_WD140EDFZ-11A0VA0_9MG7WPVJ
>	 md: import disk2: (sdh) WDC_WD140EDFZ-11A0VA0_9MG7WPVJ size: 13672382412 

... does that for each *array* disk

>	 mdcmd (9): import 8
>	 mdcmd (10): import 9
>	 mdcmd (11): import 10

...does this for other disks?

>	 mdcmd (30): import 29 sde 64 13672382412 0 ST14000NM001G-2KJ103_ZTM0C8M7
>	 md: import disk29: (sde) ST14000NM001G-2KJ103_ZTM0C8M7 size: 13672382412 
>	 mdcmd (5): import 4
>	 md: import_slot: 4 missing

>	 mdcmd (5): import 4 sdv 64 13672382412 1 WDC_WUH721414ALE6L4_9MGHM3LU
>	 md: import disk4: (sdv) WDC_WUH721414ALE6L4_9MGHM3LU size: 13672382412 erased
>	 md: import_slot: 4 wrong
>	 mdcmd (9): import 8
... 8-29
>	 mdcmd (30): import 29 sde 64 13672382412 0 ST14000NM001G-2KJ103_ZTM0C8M7
>	 md: import disk29: (sde) ST14000NM001G-2KJ103_ZTM0C8M7 size: 13672382412 
>	 mdcmd (31): set md_num_stripes 1280
>	 mdcmd (32): set md_queue_limit 80
>	 mdcmd (33): set md_sync_limit 5
>	 mdcmd (34): set md_write_method
>	 mdcmd (35): start RECON_DISK
>	 unraid: allocating 46470K for 1280 stripes (9 disks)
>	 md1: running, size: 13672382412 blocks
>	 md2: running, size: 13672382412 blocks
>	 md3: running, size: 13672382412 blocks
>	 md4: running, size: 13672382412 blocks
>	 md5: running, size: 13672382412 blocks
>	 md6: running, size: 11718885324 blocks
>	 md7: running, size: 9766436812 blocks
>	  sdv: sdv1
>	  sdv: sdv1
>	  sdv: sdv1
>	  sdv: sdv1
>	 BTRFS info (device dm-1): using free space tree
>	 BTRFS info (device dm-1): has skinny extents
>	 BTRFS info (device dm-2): using free space tree
>	 BTRFS info (device dm-2): has skinny extents
>	 BTRFS info (device dm-3): using free space tree
>	 BTRFS info (device dm-3): has skinny extents
>	 XFS (md5): Mounting V5 Filesystem
>	 XFS (md5): Ending clean mount
>	 xfs filesystem being mounted at /mnt/disk5 supports timestamps until 2038 (0x7fffffff)
>	 BTRFS info (device dm-5): using free space tree
>	 BTRFS info (device dm-5): has skinny extents
>	 BTRFS info (device dm-6): using free space tree
>	 BTRFS info (device dm-6): has skinny extents
>	 BTRFS info (device sdal1): turning on async discard
>	 BTRFS info (device sdal1): allowing degraded mounts
>	 BTRFS info (device sdal1): using free space tree
>	 BTRFS info (device sdal1): has skinny extents
>	 BTRFS info (device sdal1): bdev /dev/sdbk1 errs: wr 103, rd 9, flush 3, corrupt 0, gen 0
>	 BUG: kernel NULL pointer dereference, address: 0000000000000000
>	 #PF: supervisor read access in kernel mode
>	 #PF: error_code(0x0000) - not-present page
>	 PGD 80000015bbc0f067 P4D 80000015bbc0f067 PUD df445d067 PMD 0 
>	 Oops: 0000 [#1] SMP PTI
>	 CPU: 17 PID: 20713 Comm: btrfs Tainted: P        W  O      5.10.28-Unraid #1
>	 Hardware name: ASUSTeK Computer INC. Z9PR-D12 Series/Z9PR-D12 Series, BIOS 6002 04/18/2018
>	 RIP: 0010:strcmp+0x2/0x1a
>	 Code: ef 4c 89 c0 c3 48 89 f8 48 89 fa 8a 0a 48 89 d7 48 8d 52 01 84 c9 75 f3 31 d2 8a 0c 16 88 0c 17 48 ff c2 84 c9 75 f3 c3 31 c0 <8a> 14 07 3a 14 06 74 06 19 c0 83 c8 01 c3 48 ff c0 84 d2 75 eb 31
>	 RSP: 0018:ffffc90020d9fd78 EFLAGS: 00010246
>	 RAX: 0000000000000000 RBX: ffff888132202a00 RCX: 0000000000000000
>	 RDX: 0000000000000001 RSI: ffffffff81d92a5e RDI: 0000000000000000
>	 RBP: fffffffffffffffe R08: 0000000000000001 R09: 0000000000004000
>	 R10: ffffc90020d9ff08 R11: 0000000000000000 R12: 0000000000000006
>	 R13: ffff888385f3c000 R14: 0000000000000000 R15: 000000000000a0ed
>	 FS:  0000154d1faead40(0000) GS:ffff88981fc40000(0000) knlGS:0000000000000000
>	 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>	 CR2: 0000000000000000 CR3: 00000017bcccc006 CR4: 00000000000606e0
>	 Call Trace:
>	  btrfs_rm_device+0x10b/0x4ad
>	  btrfs_ioctl+0xced/0x2c28
>	  ? getname_flags+0x44/0x146
>	  ? vfs_statx+0x72/0x105
>	  ? vfs_ioctl+0x19/0x26
>	  vfs_ioctl+0x19/0x26
>	  __do_sys_ioctl+0x51/0x74
>	  do_syscall_64+0x5d/0x6a
>	  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>	 RIP: 0033:0x154d1fc02417
>	 Code: 00 00 90 48 8b 05 79 2a 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 49 2a 0d 00 f7 d8 64 89 01 48
>	 RSP: 002b:00007ffc85502878 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>	 RAX: ffffffffffffffda RBX: 00007ffc85504a30 RCX: 0000154d1fc02417
>	 RDX: 00007ffc855038a0 RSI: 000000005000943a RDI: 0000000000000004
>	 RBP: 0000000000000001 R08: 1999999999999999 R09: 0000000000000000
>	 R10: 0000154d1fc84ac0 R11: 0000000000000246 R12: 0000000000000002
>	 R13: 00007ffc855038a0 R14: 0000000000000004 R15: 00007ffc85504a78


`btrfs restore`
btrfs restore: not enough arguments: 0 but at least 2 expected
usage: btrfs restore [options] <device> <path> | -l <device>

    Try to restore files from a damaged filesystem (unmounted)

    -s|--snapshots       get snapshots
    -x|--xattr           restore extended attributes
    -m|--metadata        restore owner, mode and times
    -S|--symlink         restore symbolic links
    -i|--ignore-errors   ignore errors
    -o|--overwrite       overwrite
    -t <bytenr>          tree location
    -f <bytenr>          filesystem location
    -u|--super <mirror>  super mirror
    -r|--root <rootid>   root objectid
    -d                   find dir
    -l|--list-roots      list tree roots
    -D|--dry-run         dry run (only list files that would be recovered)
    --path-regex <regex>
                         restore only filenames matching regex,
                         you have to use following syntax (possibly quoted):
                         ^/(|home(|/username(|/Desktop(|/.*))))$
    -c                   ignore case (--path-regex only)
    -v|--verbose         deprecated, alias for global -v option

    Global options:
    -v|--verbose       increase output verbosity


root@Unraid:/mnt# btrfs-find-root /dev/mapper/md7
Superblock thinks the generation is 41166
Superblock thinks the level is 1
Found tree root at 7138339700736 gen 41166 level 1
Well block **7138266349568** (gen: *41165* level: 1) seems good, but generation/level doesn't match, want gen: *41166* level: 1
Well block **7138339094528** (gen: *41164* level: 1) seems good, but generation/level doesn't match, want gen: *41166* level: 1
Well block **7138266398720** (gen: *40951* level: 0) seems good, but generation/level doesn't match, want gen: *41166* level: 1


root@Unraid:/mnt# btrfs-find-root /dev/mapper/md7
Superblock thinks the generation is 41167
Superblock thinks the level is 1
Found tree root at **7138338799616** gen 41167 level 1
Well block **7138266398720** (gen: *40951* level: 0) seems good, but generation/level doesn't match, want gen: 41167 level: 1

Try `7138339094528` which is gen 41164 (want 41166)
Running it a second time found only `7138266398720(gen: 40951 level: 0)`

Update- the original disk seems  toast.  Rebuilding the array seems to have created a copy-- with the exact issue.

Nothing works, and it will not mount, but doing 

`btrfs restore /dev/dm-0 /ztst/ds1/dm0`

into my zfs pool is writing a TON of data.  Hard to tell if its  working yet. but its doing something.

I tried recover before without benefit.

I do get these errors: It slowed down the writes and then asked:

            We seem to be looping a lot on /ztst/ds1/dm0/rDriveA/Seagate_Expansion_Drive/My Backup(1)/My Backup(1)332.adi, do you want to keep going on ? (y/N/a): N
            We seem to be looping a lot on /ztst/ds1/dm0/rDriveA/Seagate_Expansion_Drive/My Backup(1)/My Backup(1)336.adi, do you want to keep going on ? (y/N/a): N
            We seem to be looping a lot on /ztst/ds1/dm0/rDriveA/Seagate_Expansion_Drive/My Backup(1)/My Backup(1)337.adi, do you want to keep going on ? (y/N/a): N\
            We seem to be looping a lot on /ztst/ds1/dm0/rDriveA/Seagate_Expansion_Drive/My Backup(1)/My Backup(1)338.adi, do you want to keep going on ? (y/N/a): n
            We seem to be looping a lot on /ztst/ds1/dm0/rDriveA/Seagate_Expansion_Drive/My Backup(1)/My Backup(1)339.adi, do you want to keep going on ? (y/N/a):
            We seem to be looping a lot on /ztst/ds1/dm0/rDriveA/Seagate_Expansion_Drive/My Backup(1)/My Backup(1)34.adi, do you want to keep going on ? (y/N/a):

## BTRFS

[Examples](https://unixsheikh.com/articles/battle-testing-zfs-btrfs-and-mdadm-dm.html#btrfs-raid-5)



!!!Info Info: BTRFS Commands
    usage: btrfs [--help] [--version] [--format <format>] [-v|--verbose] [-q|--quiet] <group> [<group>...] <command> [<args>]
    - **balance**
       - `btrfs balance start [options] <path>` ) Balance chunks across the device
       - `btrfs balance pause <path>` ) Pause running balance
       - `btrfs balance cancel <path>` ) Cancel running or paused balance
       - `btrfs balance resume <path>` ) Resume interrupted balance
       - `btrfs balance status [-v] <path>` ) Show status of running or paused balance
    - **check**
        - `btrfs check [options] <device>` ) Check structural integrity of a filesystem (unmounted).
    - **device**
        - `btrfs device add [options] <device> [<device>...] <path>` ) Add one or more devices to a mounted filesystem.
        -``btrfs device delete <device>|<devid> [<device>|<devid>...] <path>```
        - `btrfs device remove <device>|<devid> [<device>|<devid>...] <path>` ) Remove a device from a filesystem
        - `btrfs device scan [-d|--all-devices] <device> [<device>...]` ) 
        - `btrfs device scan -u|--forget [<device>...]` ) Scan or forget (unregister) devices of btrfs filesystems
        - `btrfs device ready <device>` ) Check and wait until a group of devices of a filesystem is ready for mount
        - `btrfs device stats [options] <path>|<device>` ) Show device IO error statistics
        - `btrfs device usage [options] <path> [<path>..]` ) Show detailed information about internal allocations in    devices.
    - **filesystem**
        - `btrfs filesystem df [options] <path>` ) Show space usage information for a mount point
        - `btrfs filesystem du [options] <path> [<path>..]` ) Summarize disk usage of each file.
        - `btrfs filesystem show [options] [<path>|<uuid>|<device>|label]` ) Show the structure of a filesystem
        - `btrfs filesystem sync <path>` ) Force a sync on a filesystem
        - `btrfs filesystem defragment [options] <file>|<dir> [<file>|<dir>...]` ) Defragment a file or a directory
        - `btrfs filesystem resize [options] [devid:][+/-]<newsize>[kKmMgGtTpPeE]|[devid:]max <path>` ) Resize a    filesystem
        - `btrfs filesystem label [<device>|<mount_point>] [<newlabel>]` ) Get or change the label of a filesystem
        - `btrfs filesystem usage [options] <path> [<path>..]` ) Show detailed information about internal filesystem    usage .
    - **inspect-internal**
        - `btrfs inspect-internal inode-resolve [-v] <inode> <path>` ) Get file system paths for the given inode
        - `btrfs inspect-internal logical-resolve [-Pvo] [-s bufsize] <logical> <path>` ) Get file system paths for   the  given logical address
      - `btrfs inspect-internal subvolid-resolve <subvolid> <path>` ) Get file system paths for the given subvolume  ID.
      - `btrfs inspect-internal rootid <path>` ) Get tree ID of the containing subvolume of path.
      - `btrfs inspect-internal min-dev-size [options] <path>` ) Get the minimum size the device can be shrunk to. The
      - `btrfs inspect-internal dump-tree [options] <device> [<device> ..]` ) Dump tree structures from a given device
      - `btrfs inspect-internal dump-super [options] device [device...]` ) Dump superblock from a device in a textual  form
      - `btrfs inspect-internal tree-stats [options] <device>` ) Print various stats for trees
    - **property**
      - `btrfs property get [-t <type>] <object> [<name>]` ) Get a property value of a btrfs object
      - `btrfs property set [-t <type>] <object> <name> <value>` ) Set a property on a btrfs object
      - `btrfs property list [-t <type>] <object>` ) Lists available properties with their descriptions for the given  object
    - **qgroup**
      - `btrfs qgroup assign [options] <src> <dst> <path>` ) Assign SRC as the child qgroup of DST
      - `btrfs qgroup remove [options] <src> <dst> <path>` ) Remove a child qgroup SRC from DST.
      - `btrfs qgroup create <qgroupid> <path>` ) Create a subvolume quota group.
      - `btrfs qgroup destroy <qgroupid> <path>` ) Destroy a quota group.
      - `btrfs qgroup show [options] <path>` ) Show subvolume quota groups.
      - `btrfs qgroup limit [options] <size>|none [<qgroupid>] <path>` ) Set the limits a subvolume quota group.
    - **quota**
      - `btrfs quota enable <path>` ) Enable subvolume quota support for a filesystem.
      - `btrfs quota disable <path>` ) Disable subvolume quota support for a filesystem.
      - `btrfs quota rescan [-sw] <path>` ) Trash all qgroup numbers and scan the metadata again with the current  config.
    -  **restore**
       - `btrfs receive [options] <mount>` ) 
       - `btrfs receive --dump [options]` ) Receive subvolumes from a stream
    - **replace**
      - `btrfs replace start [-Bfr] <srcdev>|<devid> <targetdev> <mount_point>` ) Replace device of a btrfs  filesystem.
      - `btrfs replace status [-1] <mount_point>` ) Print status and progress information of a running device replace  operation
      - `btrfs replace cancel <mount_point>` ) Cancel a running device replace operation.
    - **rescue**
      - `btrfs rescue chunk-recover [options] <device>` ) Recover the chunk tree by scanning the devices one by one.
      - `btrfs rescue super-recover [options] <device>` ) Recover bad superblocks from good copies
      - `btrfs rescue zero-log <device>` ) Clear the tree log. Usable if it's corrupted and prevents mount.
      - `btrfs rescue fix-device-size <device>` ) Re-align device and super block sizes. Usable if newer kernel  refuse to mount it due to mismatch super size
    - **restore**
      - `btrfs restore [options] <device> <path> | -l <device>` ) Try to restore files from a damaged filesystem  (unmounted)
    - **restore**
      - `btrfs scrub start [-BdqrRf] [-c ioprio_class -n ioprio_classdata] <path>|<device>` ) Start a new scrub. If a  scrub is already running, the new one fails.
      - `btrfs scrub cancel <path>|<device>` ) Cancel a running scrub
      - `btrfs scrub resume [-BdqrR] [-c ioprio_class -n ioprio_classdata] <path>|<device>` ) Resume previously  canceled or interrupted scrub
      - `btrfs scrub status [-dR] <path>|<device>` ) Show status of running or finished scrub
    - **send**  
      - `btrfs send [-ve] [-p <parent>] [-c <clone-src>] [-f <outfile>] <subvol> [<subvol>...]` ) Send the subvolume (s) to stdout.
    - **subvolume** 
      - `btrfs subvolume create [-i <qgroupid>] [<dest>/]<name>` ) Create a subvolume
      - `btrfs subvolume delete [options] <subvolume> [<subvolume>...]` ) 
      - `btrfs subvolume delete [options] -i|--subvolid <subvolid> <path>` ) Delete subvolume(s)
      - `btrfs subvolume list [options] <path>` ) List subvolumes and snapshots in the filesystem.
      - `btrfs subvolume snapshot [-r] [-i <qgroupid>] <source> <dest>|[<dest>/]<name>` ) Create a snapshot of the  subvolume
      - `btrfs subvolume get-default <path>` ) Get the default subvolume of a filesystem
      - `btrfs subvolume set-default <subvolume>` ) 
      - `btrfs subvolume set-default <subvolid> <path>` ) Set the default subvolume of the filesystem mounted as  default.
      - `btrfs subvolume find-new <path> <lastgen>` ) List the recently modified files in a filesystem
      - `btrfs subvolume show [options] <path>` ) Show more information about the subvolume (UUIDs, generations,  times, snapshots)
      - `btrfs subvolume sync <path> [<subvol-id>...]` ) Wait until given subvolume(s) are completely removed from  the filesystem.
    - `btrfs help [--full] [--box]` ) Display help information
    - `btrfs version` ) Display btrfs-progs version

usage: btrfs [--help] [--version] [--format <format>] [-v|--verbose] [-q|--quiet] <group> [<group>...] <command> [<args>]

- btrfs
  - **balance**
    - `start [options] <path>`
        Balance chunks across the devices
    - `pause <path>`
        Pause running balance
    - `cancel <path>`
        Cancel running or paused balance
    - `resume <path>`
        Resume interrupted balance
    - `status [-v] <path>`
        Show status of running or paused balance
  - ` check [options] <device>` 
      - Check structural integrity of a filesystem (unmounted).
  - **device**
    - ` add [options] <device> [<device>...] <path>`
      - Add one or more devices to a mounted filesystem.- 
    - `delete <device>|<devid> [<device>|<devid>...] <path>`
    - ` remove <device>|<devid> [<device>|<devid>...] <path>`
      - Remove a device from a filesystem- 
    - `scan [-d|--all-devices] <device> [<device>...]`
    - ` scan -u|--forget [<device>...]`
      - Scan or forget (unregister) devices of btrfs filesystems- 
    - ` ready <device>`
      - Check and wait until a group of devices of a filesystem is ready for mount- 
    - ` stats [options] <path>|<device>`
      - Show device IO error statistics- 
    - ` usage [options] <path> [<path>..]`
      - Show detailed information about internal allocations in devices.- 
  - **filesystem** 
    - ` df [options] <path>`
      - Show space usage information for a mount point- 
    - ` du [options] <path> [<path>..]`
      - Summarize disk usage of each file.- 
    - ` show [options] [<path>|<uuid>|<device>|label]`
      - Show the structure of a filesystem- 
    - ` sync <path>`
      - Force a sync on a filesystem- 
    - ` defragment [options] <file>|<dir> [<file>|<dir>...]`
      - Defragment a file or a directory- 
    - ` resize [options] [devid:][+/-]<newsize>[kKmMgGtTpPeE]|[devid:]max <path>`
      - Resize a filesystem- 
    - ` label [<device>|<mount_point>] [<newlabel>]`
      - Get or change the label of a filesystem- 
    - ` usage [options] <path> [<path>..]`
      - Show detailed information about internal filesystem usage .- 

  - **inspect-internal** 
    - ` inode-resolve [-v] <inode> <path>`
      - Get file system paths for the given inode- 
    - ` logical-resolve [-Pvo] [-s bufsize] <logical> <path>`
      - Get file system paths for the given logical address- 
    - ` subvolid-resolve <subvolid> <path>`
      - Get file system paths for the given subvolume ID.- 
    - ` rootid <path>`
      - Get tree ID of the containing subvolume of path.- 
    - ` min-dev-size [options] <path>`
      - Get the minimum size the device can be shrunk to. The- 
    - ` dump-tree [options] <device> [<device> ..]`
      - Dump tree structures from a given device- 
    - ` dump-super [options] device [device...]`
      - Dump superblock from a device in a textual form- 
    - ` tree-stats [options] <device>`
      - Print various stats for trees- 

  - **property** 
    - `get [-t <type>] <object> [<name>]`
      - Get a property value of a btrfs object- 
    - `set [-t <type>] <object> <name> <value>`
      - Set a property on a btrfs object- 
    - `list [-t <type>] <object>`
      - Lists available properties with their descriptions for the given object- 
  - **qgroup** 
    - `assign [options] <src> <dst> <path>`
      - Assign SRC as the child qgroup of DST- 
    - `remove [options] <src> <dst> <path>`
      - Remove a child qgroup SRC from DST.- 
    - `create <qgroupid> <path>`
      - Create a subvolume quota group.- 
    - `destroy <qgroupid> <path>`
      - Destroy a quota group.- 
    - `show [options] <path>`
      - Show subvolume quota groups.- 
    - `limit [options] <size>|none [<qgroupid>] <path>`
      - Set the limits a subvolume quota group.- 
  - **quota** 
    - `enable <path>`
      - Enable subvolume quota support for a filesystem.- 
    - `disable <path>`
      - Disable subvolume quota support for a filesystem.- 
    - `rescan [-sw] <path>`
      - Trash all qgroup numbers and scan the metadata again with the current config
  - **receive** 
    btrfs receive [options] <mount>
    - `--dump [options]`
      - Receive subvolumes from a stream- 
  - **replace** 
    - `start [-Bfr] <srcdev>|<devid> <targetdev> <mount_point>`
      - Replace device of a btrfs filesystem.- 
    - `status [-1] <mount_point>`
      - Print status and progress information of a running device replace operation- 
    - `cancel <mount_point>`
      - Cancel a running device replace operation.- 
  - **rescue** 
    - `chunk-recover [options] <device>`
      - Recover the chunk tree by scanning the devices one by one.- 
    - `super-recover [options] <device>`
      - Recover bad superblocks from good copies- 
    - `zero-log <device>`
      - Clear the tree log. Usable if it's corrupted and prevents mount.- 
    - `fix-device-size <device>`
      - Re-align device and super block sizes. Usable if newer kernel refuse to mount it due to mismatch super size- 

  - `restore [options] <device> <path> | -l <device>` 
        Try to restore files from a damaged filesystem (unmounted)
  - **scrub** 
    - `start [-BdqrRf] [-c ioprio_class -n ioprio_classdata] <path>|<device>`
      - Start a new scrub. If a scrub is already running, the new one fails.- 
    - `cancel <path>|<device>`
      - Cancel a running scrub- 
    - `resume [-BdqrR] [-c ioprio_class -n ioprio_classdata] <path>|<device>`
      - Resume previously canceled or interrupted scrub- 
    - `status [-dR] <path>|<device>`
      - Show status of running or finished scrub- 

  - `send [-ve] [-p <parent>] [-c <clone-src>] [-f <outfile>] <subvol> [<subvol>...]`
      - Send the subvolume(s) to stdout.- 
  - **subvolume** 
    - `create [-i <qgroupid>] [<dest>/]<name>`
      - Create a subvolume- 
    - `subvolume delete [options] <subvolume> [<subvolume>...]`
    - `delete [options] -i|--subvolid <subvolid> <path>`
      - Delete subvolume(s)- 
    - `list [options] <path>`
      - List subvolumes and snapshots in the filesystem.- 
    - `snapshot [-r] [-i <qgroupid>] <source> <dest>|[<dest>/]<name>`
      - Create a snapshot of the subvolume- 
    - `get-default <path>`
      - Get the default subvolume of a filesystem- 
    - `subvolume set-default <subvolume>`
    - `set-default <subvolid> <path>`
      - Set the default subvolume of the filesystem mounted as default.- 
    - `find-new <path> <lastgen>`
      - List the recently modified files in a filesystem- 
    - `show [options] <path>`
      - Show more information about the subvolume (UUIDs, generations, times, snapshots)- 
    - `sync <path> [<subvol-id>...]`
      - Wait until given subvolume(s) are completely removed from the filesystem.- 

  - `help [--full] [--box]`
        Display help information
  - `btrfs version`
        Display btrfs-progs version




        usage: btrfstune [options] device
Tune settings of filesystem features on an unmounted device

Options:
  change feature status:
        -r          enable extended inode refs (mkfs: extref, for hardlink limits)
        -x          enable skinny metadata extent refs (mkfs: skinny-metadata)
        -n          enable no-holes feature (mkfs: no-holes, more efficient sparse file representation)
        -S <0|1>    set/unset seeding status of a device
  uuid changes:
        -u          rewrite fsid, use a random one
        -U UUID     rewrite fsid to UUID
        -m          change fsid in metadata_uuid to a random UUID
                    (incompat change, more lightweight than -u|-U)
        -M UUID     change fsid in metadata_uuid to UUID
  general:
        -f          allow dangerous operations, make sure that you are aware of the dangers
        --help      print this help

### BTRFS Example

#### add a label
            btrfs filesystem label [<device>|<mount_point>] [<newlabel>]
                  Get or change the label of a filesystem

` btrfs fi label /mnt/ssds  ssds` 



### Find BTRFS Drives

`btrfs -v  device scan -d`

            Scanning for Btrfs filesystems
            registered: /dev/nvme1n1p1
            registered: /dev/nvme2n1p1
            registered: /dev/nvme3n1p1
            registered: /dev/nvme0n1p1
            registered: /dev/sdl1
            registered: /dev/sdn1
            registered: /dev/sdo1
            registered: /dev/sdq1
            registered: /dev/sdr1
            registered: /dev/sds1
            registered: /dev/sdal1
            registered: /dev/sdu1
            registered: /dev/sday1
            registered: /dev/sdbf1
            registered: /dev/sdar1
            registered: /dev/sdau1
            registered: /dev/sdm1
            registered: /dev/sdbk1
            registered: /dev/sdp1


## ZFS

[Source](https://klarasystems.com/articles/choosing-the-right-zfs-pool-layout/)

!!! Abstract  Abstract:  zfs
    usage: zfs command args ...
    where 'command' is one of the following:

        version

        create [-Pnpuv] [-o property=value] ... <filesystem>
        create [-Pnpsv] [-b blocksize] [-o property=value] ... -V <size> <volume>
        destroy [-fnpRrv] <filesystem|volume>
        destroy [-dnpRrv] <filesystem|volume>@<snap>[%<snap>][,...]
        destroy <filesystem|volume>#<bookmark>

        snapshot [-r] [-o property=value] ... <filesystem|volume>@<snap> ...
        rollback [-rRf] <snapshot>
        clone [-p] [-o property=value] ... <snapshot> <filesystem|volume>
        promote <clone-filesystem>
        rename [-f] <filesystem|volume|snapshot> <filesystem|volume|snapshot>
        rename -p [-f] <filesystem|volume> <filesystem|volume>
        rename -u [-f] <filesystem> <filesystem>
        rename -r <snapshot> <snapshot>
        bookmark <snapshot|bookmark> <newbookmark>
        program [-jn] [-t <instruction limit>] [-m <memory limit (b)>]
            <pool> <program file> [lua args...]

        list [-Hp] [-r|-d max] [-o property[,...]] [-s property]...
            [-S property]... [-t type[,...]] [filesystem|volume|snapshot] ...

        set <property=value> ... <filesystem|volume|snapshot> ...
        get [-rHp] [-d max] [-o "all" | field[,...]]
            [-t type[,...]] [-s source[,...]]
            <"all" | property[,...]> [filesystem|volume|snapshot|bookmark] ...
        inherit [-rS] <property> <filesystem|volume|snapshot> ...
        upgrade [-v]
        upgrade [-r] [-V version] <-a | filesystem ...>

        userspace [-Hinp] [-o field[,...]] [-s field] ...
            [-S field] ... [-t type[,...]] <filesystem|snapshot|path>
        groupspace [-Hinp] [-o field[,...]] [-s field] ...
            [-S field] ... [-t type[,...]] <filesystem|snapshot|path>
        projectspace [-Hp] [-o field[,...]] [-s field] ...
            [-S field] ... <filesystem|snapshot|path>

        project [-d|-r] <directory|file ...>
        project -c [-0] [-d|-r] [-p id] <directory|file ...>
        project -C [-k] [-r] <directory ...>
        project [-p id] [-r] [-s] <directory ...>

        mount
        mount [-flvO] [-o opts] <-a | filesystem>
        unmount [-fu] <-a | filesystem|mountpoint>
        share [-l] <-a [nfs|smb] | filesystem>
        unshare <-a [nfs|smb] | filesystem|mountpoint>

        send [-DnPpRvLecwhb] [-[i|I] snapshot] <snapshot>
        send [-DnvPLecw] [-i snapshot|bookmark] <filesystem|volume|snapshot>
        send [-DnPpvLec] [-i bookmark|snapshot] --redact <bookmark> <snapshot>
        send [-nvPe] -t <receive_resume_token>
        send [-Pnv] --saved filesystem
        receive [-vMnsFhu] [-o <property>=<value>] ... [-x <property>] ...
            <filesystem|volume|snapshot>
        receive [-vMnsFhu] [-o <property>=<value>] ... [-x <property>] ...
            [-d | -e] <filesystem>
        receive -A <filesystem|volume>

        allow <filesystem|volume>
        allow [-ldug] <"everyone"|user|group>[,...] <perm|@setname>[,...]
            <filesystem|volume>
        allow [-ld] -e <perm|@setname>[,...] <filesystem|volume>
        allow -c <perm|@setname>[,...] <filesystem|volume>
        allow -s @setname <perm|@setname>[,...] <filesystem|volume>

        unallow [-rldug] <"everyone"|user|group>[,...]
            [<perm|@setname>[,...]] <filesystem|volume>
        unallow [-rld] -e [<perm|@setname>[,...]] <filesystem|volume>
        unallow [-r] -c [<perm|@setname>[,...]] <filesystem|volume>
        unallow [-r] -s @setname [<perm|@setname>[,...]] <filesystem|volume>

        hold [-r] <tag> <snapshot> ...
        holds [-rH] <snapshot> ...
        release [-r] <tag> <snapshot> ...
        diff [-FHt] <snapshot> [snapshot|filesystem]
        load-key [-rn] [-L <keylocation>] <-a | filesystem|volume>
        unload-key [-r] <-a | filesystem|volume>
        change-key [-l] [-o keyformat=<value>]
            [-o keylocation=<value>] [-o pbkdf2iters=<value>]
            <filesystem|volume>
        change-key -i [-l] <filesystem|volume>
        redact <snapshot> <bookmark> <redaction_snapshot> ...
        wait [-t <activity>] <filesystem>

    Each dataset is of the form: pool/[dataset/]*dataset[@name]

    For the property list, run: zfs set|get

    For the delegated permission list, run: zfs allow|unallow

    
!!! Abstract zpool
    where 'command' is one of the following:

        version

        create [-fnd] [-o property=value] ...
            [-O file-system-property=value] ...
            [-m mountpoint] [-R root] <pool> <vdev> ...
        destroy [-f] <pool>

        add [-fgLnP] [-o property=value] <pool> <vdev> ...
        remove [-npsw] <pool> <device> ...

        labelclear [-f] <vdev>

        checkpoint [-d [-w]] <pool> ...

        list [-gHLpPv] [-o property[,...]] [-T d|u] [pool] ...
            [interval [count]]
        iostat [[[-c [script1,script2,...][-lq]]|[-rw]] [-T d | u] [-ghHLpPvy]
            [[pool ...]|[pool vdev ...]|[vdev ...]] [[-n] interval [count]]
        status [-c [script1,script2,...]] [-igLpPstvxD]  [-T d|u] [pool] ...
            [interval [count]]

        online [-e] <pool> <device> ...
        offline [-f] [-t] <pool> <device> ...
        clear [-nF] <pool> [device]
        reopen [-n] <pool>

        attach [-fsw] [-o property=value] <pool> <device> <new-device>
        detach <pool> <device>
        replace [-fsw] [-o property=value] <pool> <device> [new-device]
        split [-gLnPl] [-R altroot] [-o mntopts]
            [-o property=value] <pool> <newpool> [<device> ...]

        initialize [-c | -s] [-w] <pool> [<device> ...]
        resilver <pool> ...
        scrub [-s | -p] [-w] <pool> ...
        trim [-dw] [-r <rate>] [-c | -s] <pool> [<device> ...]

        import [-d dir] [-D]
        import [-o mntopts] [-o property=value] ...
            [-d dir | -c cachefile] [-D] [-l] [-f] [-m] [-N] [-R root] [-F [-n]] -a
        import [-o mntopts] [-o property=value] ...
            [-d dir | -c cachefile] [-D] [-l] [-f] [-m] [-N] [-R root] [-F [-n]]
            [--rewind-to-checkpoint] <pool | id> [newpool]
        export [-af] <pool> ...
        upgrade
        upgrade -v
        upgrade [-V version] <-a | pool ...>
        reguid <pool>

        history [-il] [<pool>] ...
        events [-vHf [pool] | -c]

        get [-Hp] [-o "all" | field[,...]] <"all" | property[,...]> <pool> ...
        set <property=value> <pool>
        sync [pool] ...

        wait [-Hp] [-T d|u] [-t <activity>[,...]] <pool> [interval]

!!!Abstract  ztest --help
    Usage: ztest [OPTIONS...]

        -v --vdevs=INTEGER                    Number of vdevs (default: 5)
        -s --vdev-size=INTEGER                Size of each vdev (default: 256M)
        -a --alignment-shift=INTEGER          Alignment shift; use 0 for random (default: 9)
        -m --mirror-copies=INTEGER            Number of mirror copies (default: 2)
        -r --raid-disks=INTEGER               Number of raidz/draid disks (default: 4)
        -R --raid-parity=INTEGER              Raid parity (default: 1)
        -K --raid-kind=raidz|draid|random     Raid kind (default: random)
        -D --draid-data=INTEGER               Number of draid data drives (default: 4)
        -S --draid-spares=INTEGER             Number of draid spares (default: 1)
        -d --datasets=INTEGER                 Number of datasets (default: 7)
        -t --threads=INTEGER                  Number of ztest threads (default: 23)
        -g --gang-block-threshold=INTEGER     Metaslab gang block threshold (default: 64K)
        -i --init-count=INTEGER               Number of times to initialize pool (default: 1)
        -k --kill-percentage=INTEGER          Kill percentage (default: 70%)
        -p --pool-name=STRING                 Pool name (default: ztest)
        -f --vdev-file-directory=PATH         File directory for vdev files (default: /tmp)
        -M --multi-host                       Multi-host; simulate pool imported on remote host
        -E --use-existing-pool                Use existing pool instead of creating new one
        -T --run-time=INTEGER                 Total run time (default: 300 sec)
        -P --pass-time=INTEGER                Time per pass (default: 60 sec)
        -F --freeze-loops=INTEGER             Max loops in spa_freeze() (default: 50)
        -B --alt-ztest=PATH                   Alternate ztest path
        -C --vdev-class-state=on|off|random   vdev class state (default: random)
        -o --option="OPTION=INTEGER"          Set global variable to an unsigned 32-bit integer value
        -G --dump-debug-msg                   Dump zfs_dbgmsg buffer before exiting due to an error
        -V --verbose                          Verbose (use multiple times for ever more verbosity)
        -h --help                             Show this help


!!!Summary zfs_ids_to_path `[-v] <pool> <objset id> <object id>`

!!!Summary zhack
    Usage: zhack [-c cachefile] [-d dir] <subcommand> <args> ...
    where <subcommand> <args> is one of the following:

        feature stat <pool>
            print information about enabled features
        feature enable [-r] [-d desc] <pool> <feature>
            add a new enabled feature to the pool
            -d <desc> sets the feature's description
            -r set read-only compatible flag for feature
        feature ref [-md] <pool> <feature>
            change the refcount on the given feature
            -d decrease instead of increase the refcount
            -m add the feature to the label if increasing refcount

        <feature> : should be a feature guid
    
!!!Summary zdb --help
        
        Usage:  zdb [-AbcdDFGhikLMPsvXy] [-e [-V] [-p <path> ...]] [-I <inflight I/Os>]
                [-o <var>=<value>]... [-t <txg>] [-U <cache>] [-x <dumpdir>]
                [<poolname>[/<dataset | objset id>] [<object | range> ...]]
        zdb [-AdiPv] [-e [-V] [-p <path> ...]] [-U <cache>]
                [<poolname>[/<dataset | objset id>] [<object | range> ...]
        zdb [-v] <bookmark>
        zdb -C [-A] [-U <cache>]
        zdb -l [-Aqu] <device>
        zdb -m [-AFLPX] [-e [-V] [-p <path> ...]] [-t <txg>] [-U <cache>]
                <poolname> [<vdev> [<metaslab> ...]]
        zdb -O <dataset> <path>
        zdb -r <dataset> <path> <destination>
        zdb -R [-A] [-e [-V] [-p <path> ...]] [-U <cache>]
                <poolname> <vdev>:<offset>:<size>[:<flags>]
        zdb -E [-A] word0:word1:...:word15
        zdb -S [-AP] [-e [-V] [-p <path> ...]] [-U <cache>] <poolname>

    Dataset name must include at least one separator character '/' or '@'
    If dataset name is specified, only that dataset is dumped
    If object numbers or object number ranges are specified, only those
    objects or ranges are dumped.

    Object ranges take the form `<start>:<end>[:<flags>]`

        start    Starting object number
        end      Ending object number, or -1 for no upper bound
        flags    Optional flags to select object types:
            A     All objects (this is the default)
            d     ZFS directories
            f     ZFS files
            m     SPA space maps
            z     ZAPs
            -     Negate effect of next flag

    Options to control amount of output:

        -b block statistics
        -c checksum all metadata (twice for all data) blocks
        -C config (or cachefile if alone)
        -d dataset(s)
        -D dedup statistics
        -E decode and display block from an embedded block pointer
        -h pool history
        -i intent logs
        -l read label contents
        -k examine the checkpointed state of the pool
        -L disable leak tracking (do not load spacemaps)
        -m metaslabs
        -M metaslab groups
        -O perform object lookups by path
        -r copy an object by path to file
        -R read and display block from a device
        -s report stats on zdb's I/O
        -S simulate dedup to measure effect
        -v verbose (applies to all others)
        -y perform livelist and metaslab validation on any livelists being deleted

    Below options are intended for use with other options:

        -A ignore assertions (-A), enable panic recovery (-AA) or both (-AAA)
        -e pool is exported/destroyed/has altroot/not in a cachefile
        -F attempt automatic rewind within safe range of transaction groups
        -G dump zfs_dbgmsg buffer before exiting
        -I <number of inflight I/Os> -- specify the maximum number of
           checksumming I/Os [default is 200]
        -o <variable>=<value> set global variable to an unsigned 32-bit integer
        -p <path> -- use one or more with -e to specify path to vdev dir
        -P print numbers in parseable form
        -q don't print label contents
        -t <txg> -- highest txg to use when searching for uberblocks
        -u uberblock
        -U <cachefile_path> -- use alternate cachefile
        -V do verbatim import
        -x <dumpdir> -- dump all read blocks into specified directory
        -X attempt extreme rewind (does not work with dataset)
        -Y attempt all reconstruction combinations for split blocks
        -Z show ZSTD headers

        Specify an option more than once (e.g. -bb) to make only that option verbose
        Default is to dump everything non-verbosely
    




Add aliases through - `/etc/zfs/vdev_id.conf`


        alias ztest0  /dev/disk/by-id/ata-HUA722010CLA330_J835T27L
        alias ztest1  /dev/disk/by-id/ata-HUA722010CLA330_J82TMSTV
        alias ztest2  /dev/disk/by-id/ata-HUA722010CLA330_J82TVRXV
        alias ztest3  /dev/disk/by-id/ata-HUA722010CLA330_J83577EL
        alias ztest4  /dev/disk/by-id/ata-HUA722010CLA330_HZ2GSA4L
        alias ztest5  /dev/disk/by-id/ata-HUA722010CLA330_J82TNXPV
        alias ztest6  /dev/disk/by-id/ata-HUA722010CLA330_HZ2GLJZL
        alias ztest7  /dev/disk/by-id/ata-HUA722010CLA330_J82TNKYV
        alias ztest8  /dev/disk/by-id/ata-HUA722010CLA330_J82TVSVV
        alias ztest9  /dev/disk/by-id/ata-HUA722010CLA330_J82TJ3YV


This will print only disks and not partitions.

                  ❯ ls -1 /dev/disk/by-id | grep -E -i -v '([\.\/]{6}[a-z]{3,4}([0-9]+))'    



Then run ` zpool create -f ztestpool mirror ztest{0..4} mirror ztest{5..9}`
need to echo this and then run it, brace expansion doesnt work in zfs commands[Source]()


The above command actully creates 5 mirrors x2 e.g. 0,1,2,3,4 are all a mirror of each other. And the only the two are raided

 ~#> zpool create testpool mirror da0 da1
If we need more space, we just add more pairs of disks:

~#> zpool add testpool mirror da2 da3


Let’s decode the nomenclature that describes the geometry of a dRAID vdev. A string such as “dRAID2:3d:14c:1s” encodes the following about a dRAID vdev.

            -dRAID[<parity>][:<data>d][:<children>c][:<spares>s]
                 -dRAID[<parity>][:<data>d][:<children>c][:<spares>s]

            -parity: Required, the number of spindles to use to store parity information. Eg: A dRAID3 can survive until a fourth disk failure without losing data. Parity may be 1,2 or 3.

            -[d] data: (spindles per RAID group): Determines the width of the data stripe, 8 is the default. Larger values will increase the stripe width and reduce total parity.

            -[c] children: This parameter should match the number of device entries that you feed to the vdev. A helpful check will warn you if you don’t get the right number of disks named correctly: “invalid number of dRAID children; 14 required but 13 provided”

            -[s] spares: The number of disk areas to mix in as distributed spares. No spares are created by default, a maximum of four are welcome. Each spare will remove a fraction of space from every disk.


Mirror

[Source](https://klarasystems.com/articles/choosing-the-right-zfs-pool-layout/)

>Let’s see some practical examples; first we create a simple pool with 2 disks:

`# zpool create testpool mirror da0 da1`

>If we need more space, we just add more pairs of disks:

`# zpool add testpool mirror da2 da3`

>Now the pool looks like this:

`~#> zpool status testpool`

        pool: testpool
        state: ONLINE
        config:
            NAME        STATE     READ WRITE CKSUM
            testpool    ONLINE       0     0     0
            mirror-0    ONLINE       0     0     0
                da0     ONLINE       0     0     0
                da1     ONLINE       0     0     0
            mirror-1    ONLINE       0     0     0
                da2     ONLINE       0     0     0
                da3     ONLINE       0     0     0


>It is also possible to add additional disks to a mirror increasing the IOPS (mostly the reading performance):

`~#> zpool attach testpool da1 da4`

`~#> zpool attach testpool da3 da5`

`~#> zpool status testpool`

        pool: testpool
        state: ONLINE
        status: One or more devices is currently being resilvered.  The pool will
                continue to function, possibly in a degraded state.
        action: Wait for the resilver to complete.
        scan: resilver in progress since [...]
        config:
        NAME        STATE     READ WRITE CKSUM
        testpool    ONLINE       0     0     0
        mirror-0    ONLINE       0     0     0
            da0     ONLINE       0     0     0
            da1     ONLINE       0     0     0
            da4     ONLINE       0     0     0  (resilvering)
        mirror-1    ONLINE       0     0     0
            da2     ONLINE       0     0     0
            da3     ONLINE       0     0     0
            da5     ONLINE       0     0     0  (resilvering)

>If for some reason our needs change, we can easily remove a mirror vdev from the pool:

`~#> zpool remove testpool mirror-1`

`~#> zpool status testpool`

        pool: testpool
        state: ONLINE
        scan: resilvered 60K in 00:00:02 with 0 errors on Mon May 17 13:10:34 2021
        remove: Removal of vdev 1 copied 39.5K in 0h0m, completed on Mon May 17 13:20:11 2021
            264 memory used for removed device mappings config:
        NAME          STATE     READ WRITE CKSUM
        testpool      ONLINE       0     0     0
          mirror-0    ONLINE       0     0     0
            da0       ONLINE       0     0     0
            da1       ONLINE       0     0     0
            da4       ONLINE       0     0     0

> We could also remove the third disk from the above mirror:

`~#> zpool detach testpool da4` 

### Another ZFS Example


I'm going to create a pool using the `-f` option because ZFS will detect that the attached drives used to belong to an old pool and will not allow for it to be used in a new pool unless forced to do so (I have used the drives in a previous setup).

```
# zpool create -f -O xattr=sa -O dnodesize=auto -O atime=off -o ashift=12 pool1 raidz ata-ST31000340NS_9QJ0F2YQ ata-ST31000340NS_9QJ0EQ1V ata-ST31000340NS_9QJ089LF
```

I'm then going to create a ZFS dataset on the pool with [lz4](https://lz4.github.io/lz4/) compression enabled.

```
# zfs create -o compress=lz4 pool1/pub
# zfs list
NAME        USED  AVAIL  REFER  MOUNTPOINT
pool1       575K  1.75T   128K  /pool1
pool1/pub   128K  1.75T   128K  /pool1/pub
```

### ZFS working commands

`zpool create -f ztst mirror ztest8 ztest9 ` gives an error

So we create it by device id-

 `zpool create -f ztst mirror /dev/sdbt /dev/sdbs`

 Then migrate to UUID

` $ sudo zpool export ztst`
`$ sudo zpool import -d /dev/disk/by-id ztst`
That will switch all /dev/sdx drives to the full ID.

Then to add more

`❯ zpool add ztst mirror ztest7 ztest6`
`❯ zfs list`

            NAME   USED  AVAIL     REFER  MOUNTPOINT
            ztst   156K  1.76T       24K  /ztst
`❯ zpool status ztst`

            pool: ztst
            state: ONLINE
            config:

                  NAME                              STATE     READ WRITE CKSUM
                  ztst                              ONLINE       0     0     0
                  mirror-0                        ONLINE       0     0     0
                        ata-HUA722010CLA330_J82TJ3YV  ONLINE       0     0     0
                        ata-HUA722010CLA330_J82TVSVV  ONLINE       0     0     0
                  mirror-1                        ONLINE       0     0     0
                        ztest7                        ONLINE       0     0     0
                        ztest6                        ONLINE       0     0     0

            errors: No known data errors

Then repeat the export/import cycle


`❯ zpool export ztst`                                                                                                                                                             
`❯ zpool import -d /dev/disk/by-id ztst`
`❯ zpool status ztst`

      pool: ztst
      state: ONLINE
      config:

            NAME                              STATE     READ WRITE CKSUM
            ztst                              ONLINE       0     0     0
            mirror-0                        ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TJ3YV  ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TVSVV  ONLINE       0     0     0
            mirror-1                        ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TNKYV  ONLINE       0     0     0
                  ata-HUA722010CLA330_HZ2GLJZL  ONLINE       0     0     0

      errors: No known data errors

      Then do the remainder.

`❯ zpool add ztst mirror ztest5 ztest4`
`❯ zpool add ztst mirror ztest3 ztest2`
`❯ zpool add ztst mirror ztest1 ztest0`
`❯ zpool export ztst`
`❯ zpool import -d /dev/disk/by-id ztst`
`❯ zpool status ztst`

      pool: ztst
      state: ONLINE
      config:

            NAME                              STATE     READ WRITE CKSUM
            ztst                              ONLINE       0     0     0
            mirror-0                        ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TJ3YV  ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TVSVV  ONLINE       0     0     0
            mirror-1                        ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TNKYV  ONLINE       0     0     0
                  ata-HUA722010CLA330_HZ2GLJZL  ONLINE       0     0     0
            mirror-2                        ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TNXPV  ONLINE       0     0     0
                  ata-HUA722010CLA330_HZ2GSA4L  ONLINE       0     0     0
            mirror-3                        ONLINE       0     0     0
                  ata-HUA722010CLA330_J83577EL  ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TVRXV  ONLINE       0     0     0
            mirror-4                        ONLINE       0     0     0
                  ata-HUA722010CLA330_J82TMSTV  ONLINE       0     0     0
                  ata-HUA722010CLA330_J835T27L  ONLINE       0     0     0


## XFS Repair

[Info](https://serverfault.com/questions/777299/proper-way-to-deal-with-corrupt-xfs-filesystems)

fsck.xfs does nothing buy say to run xfs_repair
