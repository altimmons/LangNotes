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

Legacy Names:

            Type of disk	Disk names	Commonly used disk names
            IDE	/dev/hd[a-h]	/dev/hda, /dev/hdb
            SCSI	/dev/sd[a-p]	/dev/sda, /dev/sdb
            ESDI	/dev/ed[a-d]	/dev/eda
            XT	/dev/xd[ab]	      /dev/xda





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

![](https://www.brainupdaters.net/wp-content/uploads/LVM-intro/LogicalVolumenManager.jpg)


The Linux Filesystem architecture

 <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/The_Linux_Storage_Stack_Diagram.svg/1920px-The_Linux_Storage_Stack_Diagram.svg.png" style="background-color: white;" >


Functions provided by the device mapper include linear, striped and error mappings, as well as crypt and multipath targets. For example, two disks may be concatenated into one logical volume with a pair of linear mappings, one for each disk. As another example, crypt target encrypts the data passing through the specified device, by using the Linux kernel's Crypto API.[1]

As of 2014, the following mapping targets are available:[1][5]

- `cache` - allows creation of hybrid volumes, by using solid-state drives (SSDs) as caches for hard disk drives (HDDs)
- `clone` - will permit usage before a transfer is complete.
- `crypt` - provides data encryption, by using the Linux kernel's Crypto API
- `delay` - delays reads and/or writes to different devices (used for testing)
- `era` - behaves in a way similar to the linear target, while it keeps track of blocks that were written to within a user-defined period of time[9]
- `error` - simulates I/O errors for all mapped blocks (used for testing)
- `flakey` - simulates periodic unreliable behaviour (used for testing)
- `linear` - maps a continuous range of blocks onto another block device
- `mirror` - maps a mirrored logical device, while providing data redundancy
- `multipath` - supports the mapping of multipathed devices, through usage of their path groups
- `raid` - offers an interface to the Linux kernel's software RAID driver (md)
- `snapshot and snapshot-origin` - used for creation of LVM snapshots, as part of the underlying copy-on-write scheme
- `striped` - stripes the data across physical devices, with the number of stripes and the striping chunk size as parameters
- `thin` - allows creation of devices larger than the underlying physical device, physical space is allocated only when written to
- `zero` - an equivalent of /dev/zero, all reads return blocks of zeros, and writes are discarded

### Applications

Linux kernel features and projects built on top of the device mapper include the following:

- `cryptsetup` - utility used to conveniently setup disk encryption based on dm-crypt
- `dm-crypt/LUKS` - mapping target that provides volume encryption
- `dm-cache` - mapping target that allows creation of hybrid volumes
- `dm-integrity` - mapping target that provides data integrity, either using checksumming or cryptographic verification,[10][11] also used with LUKS[12]
- `dm-log-writes` - mapping target that uses two devices, passing through the first device and logging the write operations performed to it on the second device[13]
- `dm-verity` - validates the data blocks contained in a file system against a list of cryptographic hash values, developed as part of the Chromium OS project[14]
- `dmraid`(8) - provides access to "fake" RAID configurations via the device mapper
- `DM Multipath` - provides I/O failover and load-balancing of block devices within the Linux kernel
- `Docker` - uses device mapper to create copy-on-write storage for software containers
- `DRBD` (Distributed Replicated Block Device)
- `EVMS` (deprecated)
- `kpartx`(8) - utility called from hotplug upon device maps creation and deletion
- `LVM2` - logical volume manager for the Linux kernel
Linux version of `TrueCrypt`
`VDO` - Virtual Data Optimizer

![](https://i.stack.imgur.com/l1Ikx.png)

![](http://www.brendangregg.com/Perf/linux_perf_tools_full.png?w=144)

![](https://www.brendangregg.com/blog/images/2019/bpf_performance_tools.png)
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
