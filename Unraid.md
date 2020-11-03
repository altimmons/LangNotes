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


