# Linux System Notes



[The Linux Doc Project](https://tldp.org/docs.html#howto)

[List of How TOs](https://tldp.org/HOWTO/html_single/)


[TLDP Guides Good stuff](https://tldp.org/guides.html)


[The Linux Filesystem Hierarchy](https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/Linux-Filesystem-Hierarchy.html)



## SCSI subsystem

### Identifiers


Block devices vs Char devices

[SCSI How To](https://tldp.org/HOWTO/SCSI-2.4-HOWTO/arch.html)



`Sd` is a member of the generic disk family, as is the hd device from the IDE subsystem. Apart from mounting sd devices, the fdisk command is available to view or modify a disk's partition table. Although the hdparm command is primarily intended for ATA disks (also known as IDE or EIDE disks), some options work on SCSI disks.

`Sr` is a member of the CD-ROM subsystem. Apart from mounting file systems (e.g. iso9660), audio CDs can also be read. The latter action does not involve mounting a file system but typically by invoking some ioctls. General purpose Linux commands such as dd cannot be used on audio CDs.

`St` is a char device for reading and writing **tapes.** Typically the mt command is used to perform data transfers and other control functions.

`Sg` is a SCSI command pass through device that uses a char device interface. General purpose Linux commands should not be used on `sg` devices. Applications such as SANE (for scanners), cdrecord and cdrdao (for cd writers) and cdparanoia (for reading audio CDs digitally) use sg.

   lsscsi lists scsi dev

`md` lists array devices\






lsblk --sort NAME -d -o NAME,VENDOR,MODEL,SERIAL,TRAN,MAJ:MIN,PTUUID,PTTYPE,SIZE,MIN-IO,LOG-SEC,ROTA,HCTL,REV,WWN


Linux has a four level hierarchical addressing scheme for SCSI devices:

`<h:c:t:l>`

- SCSI adapter number [host]
The SCSI adapter number is typically an arbitrary numbering of the adapter cards on the internal IO buses (e.g. PCI, PCMCIA, ISA etc) of the computer. Such adapters are sometimes termed as HBAs (host bus adapters). SCSI adapter numbers are issued by the kernel in ascending order starting with 0.


- channel number [bus]

- id number [target]

- lun [lun]

Eight block major numbers are reserved for SCSI **disks: 8, 65, 66, 67, 68, 69, 70 and 71.** Each major can accommodate 256 minor numbers which, in the case of SCSI disks, are subdivided as follows:

      

      [b,65,0]   /dev/sdq
      [b,65,1]   /dev/sdq1
      ....
      [b,65,159] /dev/sdz15
      [b,65,160] /dev/sdaa
      [b,65,161] /dev/sdaa1
      ....
      [b,65,255] /dev/sdaf15
      [b,66,0]   /dev/sdag
      [b,66,1]   /dev/sdag1
      ....
      [b,66,255] /dev/sdav15
      ....
      [b,71,255] /dev/sddx15

The SCSI generic (sg) devices are allocated the char major number of 21. There are 256 possible SCSI generic (sg) devices:



      [c,21,0]   /dev/sg0
      [c,21,1]   /dev/sg1
      ....
      [c,21,255] /dev/sg255


If 15 partitions is too limiting then the Logical Volume Manager (LVM) might be considered. See /usr/src/linux/Documentation/LVM-HOWTO . LVM will also allow a logical partition to span multiple block devices.

## LVM, DM MD

Block Major for LVM seems to be 254.

DM is device mapper
MD is mapped devices

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

Layers of LVM

1. [volume group (VG)](https://tldp.org/HOWTO/LVM-HOWTO/vg.html)

2. [physical volume (PV)](https://tldp.org/HOWTO/LVM-HOWTO/pv.html)

3. [logical volume (LV)](https://tldp.org/HOWTO/LVM-HOWTO/lv.html)

4. [physical extent (PE)](https://tldp.org/HOWTO/LVM-HOWTO/pe.html)

5. [logical extent (LE)](https://tldp.org/HOWTO/LVM-HOWTO/le.html)

![](https://www.brainupdaters.net/wp-content/uploads/LVM-intro/LogicalVolumenManager.jpg)]

## Linux Networking


###   Show ip address

`ip address show`

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
