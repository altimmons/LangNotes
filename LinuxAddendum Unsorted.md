 $## Apt get
 To list all the available packages,
$ apt-cache pkgnames

To find out the package name and with it description before installing, use the ‘search‘ flag. Using “search” with apt-cache will display a list of matched packages with short description. Let’s say you would like to find out description of package ‘vsftpd‘, then command would be.

$ apt-cache search vsftpd

To find and list down all the packages starting with ‘vsftpd‘, you could use the following command.

$ apt-cache pkgnames vsftpd
vsttpd

3. Check Package Information?
For example, if you would like to check information of package along with it short description say (version number, check sums, size, installed size, category etc). Use ‘show‘ sub command as shown below.

        $ apt-cache show netcat

4.  **Check Dependencies for Specific Packages?**  the ‘showpkg‘ sub command checks the dependencies for particular software packages. whether those dependencies packages are installed or not. For example, use the `‘showpkg‘` command along with package-name.

            $ apt-cache showpkg vsftpd
            Package: vsftpd

1.  **I Check statistics of Cache**
The ‘stats‘ sub command will display overall statistics about the cache. For example, the following command will display Total package names is the number of packages have found in the cache.

        $ apt-cache stats

6. How to **Update System Packages**
The ‘update‘ command is used to resynchronize the package index files from the their sources specified in /etc/apt/sources.list file. The update command fetched the packages from their locations and update the packages to newer version.

        $ sudo apt-get update
7. How to **Upgrade Software Packages**
The ‘upgrade‘ command is used to upgrade all the currently installed software packages on the system. Under any circumstances currently installed packages are not removed or packages which are not already installed neither retrieved and installed to satisfy upgrade dependencies.

$ sudo apt-get upgrade

However, if you want to upgrade, unconcerned of whether software packages will be added or removed to fulfill dependencies, use the ‘dist-upgrade‘ sub command.
$ sudo apt-get dist-upgrade

8. How Do I Install or Upgrade Specific Packages?
The ‘install‘ sub command is tracked by one or more packages wish for installation or upgrading.

$ sudo apt-get install netcat

9. How I can Install Multiple Packages?
You can add more than one package name along with the command in order to install multiple packages at the same time. For example, the following command will install packages ‘nethogs‘ and ‘goaccess‘.

$ sudo apt-get install nethogs goaccess

10. How to Install Several Packages using Wildcard
With the help of regular expression you can add several packages with one string. For example, we use * wildcard to install several packages that contains the ‘*name*‘ string, name would be ‘package-name’.

$ sudo apt-get install '*name*'

11. How to install Packages without Upgrading
Using sub ‘–no-upgrade‘ command will prevent already installed packages from upgrading.

$ sudo apt-get install packageName --no-upgrade

12. How to Upgrade Only Specific Packages
The ‘–only-upgrade‘ command do not install new packages but it only upgrade the already installed packages and disables new installation of packages.

13. How Do I Install Specific Package Version?
Let’s say you wish to install only specific version of packages, simply use the ‘=‘ with the package-name and append desired version.

$ sudo apt-get install vsftpd=2.3.5-3ubuntu1

To un-install software packages without removing their configuration files (for later re-use the same configuration). Use the ‘remove‘ command as shown.

$ sudo apt-get remove vsftpd
15. How Do I Completely Remove Packages
To remove software packages including their configuration files, use the ‘purge‘ sub command as shown below.

$ sudo apt-get purge vsftpd

Alternatively, you can combine both the commands together as shown below.

$ sudo apt-get remove --purge vsftpd

16. How I Can Clean Up Disk Space
The ‘clean‘ command is used to free up the disk space by cleaning retrieved (downloaded) .deb files (packages) from the local repository.

$ sudo apt-get clean

17. How Do I Download Only Source Code of Package
To download only source code of particular package, use the option ‘–download-only source‘ with ‘package-name’ as shown.

$ sudo apt-get --download-only source vsftpd

18. How Can I Download and Unpack a Package
To download and unpack source code of a package to a specific directory, type the following command.

$ sudo apt-get source vsftpd

19.  `Download, Unpack and Compile a Package` You can also download, unpack and compile the source code at the same time, using option ‘–compile‘ as shown below.

            $ sudo apt-get --compile source goaccess

1.  How Do I Download a Package Without Installing
Using ‘download‘ option, you can download any given package without installing it. For example, the following command will only download ‘nethogs‘ package to current working directory.

            $ sudo apt-get download nethogs

21. How Do I Check Change Log of Package?
The ‘changelog‘ flag downloads a package change-log and shows the package version that is installed.

            $ sudo apt-get changelog vsftpd

22. How Do I Check Broken Dependencies?
The ‘check‘ command is a diagnostic tool. It used to update package cache and checks for broken dependencies.

            $ sudo apt-get check

23. How Do I Search and Build Dependencies?
This ‘build-dep‘ command searches the local repositories in the system and install the build dependencies for package. If the package does not exists in the local repository it will return an error code.

$ sudo apt-get build-dep netcat

24. How I Can Auto clean Apt-Get Cache?
The ‘autoclean‘ command deletes all .deb files from /var/cache/apt/archives to free-up significant volume of disk space.

$ sudo apt-get autoclean

25. How I Can Auto remove Installed Packages?
The ‘autoremove‘ sub command is used to auto remove packages that were certainly installed to satisfy dependencies for other packages and but they were now no longer required. For example, the following command will remove an installed package with its dependencies.

$ sudo apt-get autoremove vsftpd

I’ve covered most of the available options with apt-get and apt-cache commands, but still there are more options available, you can check them out using ‘man apt-get‘ or ‘man apt-cache‘ from the terminal. I hope you enjoyed reading this article, If I’ve missed anything and you would like me to add to the list. Please feel free to mention in the comment below.

This following command will download all installed packages to directory /var/cache/apt/archives.

$ sudo dpkg -l | grep "^ii"| awk ' {print $2} ' | xargs sudo apt-get -y install --reinstall --download-only

## fd command

Most of the Linux users are well familiar with the find command and the many cases it can be used. Today we are going to review an alternative to find command, called fd.

fd, is a simple, fast and user-friendly tool meant to simply perform faster compared to find. It is not meant to completely replace find, but rather give you an easy to use alternative that performs slightly faster.

Some of the notable features of fd:

Easy to use syntax – fd *pattern* instead of find -iname *pattern*.
Colorful output similar to the one of ls command.
Fast performance. Developer’s benchmarks are available here.
Smart search with case-insensitive by default and switches to case sensitive if patter containers an uppercase symbol.
Does not look in hidden files and directories by default.
Does not look into .gitignore by default.
Unicode awareness.

How to Install fd in Linux

For Ubuntu and Debian based distros, you will need to download the latest fd version from the release page and install it using following commands.

$ wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-musl_7.3.0_amd64.deb
$ sudo dpkg -i fd-musl_7.3.0_amd64.deb

On Other Linux distributions, you can install fd from the default repository using package manager as shown.

$# dnf install fd-find  [On Fedora]
$# pacman -S fd         [On Arch Linux]
$# emerge -av fd        [On Gentoo]
$# zypper in fd         [On OpenSuse]

How to Use fd in Linux
Similar to find command, fd has many uses cases, but let’s start at checking the available options:

$# fd -h
OR
$# fd --help

You can run fd without any arguments, the output is very similar to ls -R command.

$# fd
In the next fd examples, I will use a default WordPress installation located in /var/www/html/ to search for different files and folders.

In the example below, I have taken only the first 10 results for shorter output of the command.

$# fd | head

Let’s say we want to find all jpg files. We can use the “-e” flag to filter by file extension:

$# fd -e jpg

The “-e” flag can be used in combination with a pattern like this:

$# fd -e php index
The above command will look for files with extension php and have the string “index” in them: "*index*.php"


If you want to exclude some results, you can use the “-E” flag like this:

$# fd -e php index -E wp-content
This command will look for all files with php extension, containing the string “index” and will exclude results from the “wp-content” directory.

If you want to specify a search directory, you simply need to give it as argument:

$# fd <pattern> <directory>

Just as find, you can use -x or --exec arguments to perform parallel command execution with the search results.

Here is an example where we will use chmod to change permissions of the image files

$# fd -e jpg -x chmod 644 {}
The above will find all files with extension jpg and will run chmod 644 <path-to-file>.

Here is some useful explanation and usage of the brackets:

{} – A placeholder which will be changed with the path of the search result (wp-content/uploads/01.jpg).
{.} – similar to {}, but without using the file extension (wp-content/uploads/01).
{/}: A placeholder that will be replaced by the basename of the search result (01.jpg).
{//}: Parent directory of the discovered path (wp-content/uploads).
{/.}: Only the basename, without the extension (01).


## find

Find all the files whose name is tecmint.txt in a current working directory.

$# find . -name tecmint.txt

Find all the files under /home directory with name tecmint.txt.

$# find /home -name tecmint.txt

/home/tecmint.txt

Find all the files whose name is tecmint.txt and contains both capital and small letters in /home directory.

$# find /home -iname tecmint.txt

./tecmint.txt
./Tecmint.txt

4. Find Directories Using Name is Tecmint in / directory.

$# find / -type d -name Tecmint

/Tecmint

5. Find PHP Files Using Name is tecmint.php in a current working directory.

$# find . -type f -name tecmint.php

./tecmint.php

Find all php files in a directory.

$# find . -type f -name "*.php"

./tecmint.php
./login.php
./index.php


Part II – Find Files Based on their Permissions
7. Find Files With 777 Permissions

$# find . -type f -perm 0777 -print

8. Find Files Without 777 Permissions

$# find / -type f ! -perm 777

9. Find all the SGID bit files whose permissions set to 644.

$# find / -perm 2644

10. Find all the Sticky Bit set files whose permission are 551.

$# find / -perm 1551

11. Find SUID Files

$# find / -perm /u=s

12. Find SGID Files

$# find / -perm /g=s

13. Find Read Only Files

$# find / -perm /u=r

14. Find Executable Files

$# find / -perm /a=x

15. Find all 777 permission files and use chmod command to set permissions to 644.

$# find / -type f -perm 0777 -print -exec chmod 644 {} \;

16. Find all 777 permission directories and use chmod command to set permissions to 755.

$# find / -type d -perm 777 -print -exec chmod 755 {} \;

17. To find a single file called tecmint.txt and remove it.

$# find . -type f -name "tecmint.txt" -exec rm -f {} \;

18. To find and remove multiple files such as .mp3 or .txt, then use.

$# find . -type f -name "*.txt" -exec rm -f {} \;

OR

$# find . -type f -name "*.mp3" -exec rm -f {} \;

19. To find all empty files under certain path.

$# find /tmp -type f -empty

20. To file all empty directories under certain path.

$# find /tmp -type d -empty


21. To find all hidden files, use below command.

$# find /tmp -type f -name ".*"


Part III – Search Files Based On Owners and Groups
22. To find all or single file called tecmint.txt under / root directory of owner root.

$# find / -user root -name tecmint.txt

23. To find all files that belongs to user Tecmint under /home directory.

$# find /home -user tecmint

24. To find all files that belongs to group Developer under /home directory.
$# find /home -group developer

25. To find all .txt files of user Tecmint under /home directory.
$# find /home -user tecmint -iname "*.txt"
Part IV – Find Files and Directories Based on Date and Time

26. To find all the files which are modified 50 days back.
$# find / -mtime 50

27. To find all the files which are accessed 50 days back.
$# find / -atime 50

28. To find all the files which are modified more than 50 days back and less than 100 days.
$# find / -mtime +50 –mtime -100

29. To find all the files which are changed in last 1 hour.
$# find / -cmin -60

30. To find all the files which are modified in last 1 hour.
$# find / -mmin -60

31. To find all the files which are accessed in last 1 hour.
$# find / -amin -60
Part V – Find Files and Directories Based on Size

32. To find all 50MB files, use.
$# find / -size 50M

33. To find all the files which are greater than 50MB and less than 100MB.
$# find / -size +50M -size -100M

34. To find all 100MB files and delete them using one single command.
$# find / -size +100M -exec rm -rf {} \;

35. Find all .mp3 files with more than 10MB and delete them using one single command.
$# find / -type f -name *.mp3 -size +10M -exec rm {} \;

##Fun - nms no more secrets
https://github.com/bartobri/no-more-secrets

Install:
$ git clone https://github.com/bartobri/no-more-secrets.git
$ cd ./no-more-secrets
$ make nms
$ make sneakers             ## Optional
$ sudo make install
Uninstall:
$ sudo make uninstall



Install with Ncurses Support
If your terminal does not support ANSI/VT100 escape sequences, the effect may not render properly. This project provides a ncurses implementation for such cases. You will need the ncurses library installed. Install this library from your package manager. Next, follow these instructions:

$ git clone https://github.com/bartobri/no-more-secrets.git
$ cd ./no-more-secrets
$ make nms-ncurses
$ make sneakers-ncurses     ## Optional
$ sudo make install


Building and installing cmatrix
To install cmatrix, use either of the following methods from within the cmatrix directory.

Using configure (recommended for most linux user)
autoreconf -i  # skip if using released tarball
./configure
make
make install
Using CMake
Here we also show an out-of-source build in the sub directory "build".

mkdir -p build
cd build
$# to install to "/usr/local"
cmake ..
$# or to install to "/usr"
#cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make
make install
Running cmatrix
After you have installed cmatrix just run cmatrix to run cmatrix :)

To get the program to look most like the movie, use cmatrix -lba To get the program to look most like the Win/Mac screensaver, use cmatrix -ol

1. Command: sl (Steam Locomotive)
Install sl
root@tecmint:~# apt-get install sl 		(In Debian like OS)
root@tecmint:~# yum -y install sl 		(In Red Hat like OS)

2. Command: telnet
root@tecmint:~# telnet towel.blinkenlights.nl

what about getting your random fortune, sometimes funny in terminal.

Install fortune
root@tecmint:~# apt-get install fortune 	(for aptitude based system)
root@tecmint:~# yum install fortune 		(for yum based system)

4. Command: rev (Reverse)
It reverse every string given to it, is not it funny.

5. Command: factor
Time for some Mathematics, this command output all the possible factors of a given number.

Install Cowsay
root@tecmint:~# apt-get install cowsay 		(for Debian based OS)
root@tecmint:~# yum install cowsay		(for Red Hat based OS)

apt-get install xcowsay
yum install xcowsay

apt-get install cowthink
yum install cowthink

Install toilet
root@tecmint:~# apt-get install toilet
root@tecmint:~# yum install toilet

root@tecmint:~# toilet -f mono12 -F metal Tecmint.com

11. Command: oneko
OK so you believe that mouse pointer of Linux is the same silly black/white pointer where no animation lies then I fear you could be wrong. “oneko“ is a package that will attach a “Jerry“ with you mouse pointer and moves along with you pointer.

Install oneko
root@tecmint:~# apt-get install oneko
root@tecmint:~# yum install oneko

12. Fork Bomb
This is a very nasty piece of code. Run this at your own risk. This actually is a fork bomb which exponentially multiplies itself till all the system resource is utilized and the system hangs. (To check the power of above code you should try it once, but all at your own risk, close and save all other programs and file before running fork bomb).

root@tecmint:~# :(){ :|:& }:

13. Command: while
The below “while” command is a script which provides you with colored date and file till you interrupt (ctrl + c). Just copy and paste the below code in terminal.

root@tecmint:~# while true; do echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done

Note: The above script when modified with following command, will gives similar output but with a little difference, check it in your terminal.

root@tecmint:~# while true; do clear; echo "$(date '+%D %T' | toilet -f term -F border --gay)"; sleep 1; done

15. Command: aafire
How about fire in your terminal. Just type “aafire” in the terminal, without quotes and see the magic. Press any key to interrupt the program.

Install aafire
root@tecmint:~# apt-get install libaa-bin
Output
root@tecmint:~# aafire
6. Command: bb
First install “apt-get insatll bb” and then, type “bb” in terminal and see what happens.

root@tecmint:~# bb
17. Command: url
Won’t it be an awesome feeling for you if you can update you twitter status from command line in front of your friend and they seems impressed. OK just replace username, password and your status message with your’s username, password and “your status message“.

root@tecmint:~# url -u YourUsername:YourPassword -d status="Your status message" http://twitter.com/statuses/update.xml
18. ASCIIquarium
How it will be to get an aquarium in terminal.

root@tecmint:~# apt-get install libcurses-perl
root@tecmint:~# cd /tmp
root@tecmint:~# wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz
root@tecmint:~# tar -zxvf Term-Animation-2.4.tar.gz
root@tecmint:~# cd Term-Animation-2.4/
root@tecmint:~# perl Makefile.PL &&  make &&   make test
root@tecmint:~# make install

Install ASCIIquarium
Now Download and Install ASCIIquarium.

root@tecmint:~# cd /tmp
root@tecmint:~# wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
root@tecmint:~# tar -zxvf asciiquarium.tar.gz
root@tecmint:~# cd asciiquarium_1.1/
root@tecmint:~# cp asciiquarium /usr/local/bin
root@tecmint:~# chmod 0755 /usr/local/bin/asciiquarium
And finally run “asciiquarium” or “/usr/local/bin/asciiquarium“ in terminal without quotes and be a part of magic that will be taking place in front of your eyes.

root@tecmint:~# asciiquarium
I made an sh file to install asciiquarium if anybody wants to use it, here is the code:

apt install tar
apt install wget
apt install make

apt install libcurses-perl
cd /tmp
wget http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.4.tar.gz
tar -zxvf Term-Animation-2.4.tar.gz
cd Term-Animation-2.4/
perl Makefile.PL && make && make test
make install

cd /tmp
wget http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz --no-check-certificate
tar -zxvf asciiquarium.tar.gz
cd asciiquarium_1.1/
cp asciiquarium /usr/local/bin
chmod 0755 /usr/local/bin/asciiquarium
Reply
19. Command: funny manpages
First install “apt-get install funny-manpages” and then run man pages for the commands below. Some of them may be 18+, run at your own risk, they all are too funny.
20. Linux Tweaks
It is time for you to have some one liner tweaks.

. Linux Tweaks
It is time for you to have some one liner tweaks.

root@tecmint:~# world

bash: world: not found
root@tecmint:~# touch girls\ boo**

touch: cannot touch `girls boo**': Permission denied
root@tecmint:~# nice man woman

No manual entry for woman


root@tecmint:~# ^How did the sex change operation go?^

bash: :s^How did the sex change operation go?^ : substitution failed
root@tecmint:~# %blow

bash: fg: %blow: no such job
root@tecmint:~# make love

make: *** No rule to make target `love'.  Stop.
$ [ whereis my brain?
sh: 2: [: missing ]
% man: why did you get a divorce?
man:: Too many arguments.
% !:say, what is saccharine?
Bad substitute.
server@localhost:/srv$ \(-
bash: (-: command not found
Linux is sexy: who | grep -i blonde | date; cd ~; unzip; touch; strip; finger; mount; gasp; yes; uptime; umount; sleep (If you know what i mean)

There are certain other but these don’t work on all the system and hence not included in this article. Some of them are man dog , filter, banner, etc.
## Lesser Known Commands

This article was highly appreciated by our readers, which contains simple yet very important commands. The article summaries as.

1. sudo!! : Forgot to run a command with sudo? You need not re-write the whole command, just type “sudo!!” and the last command will run with sudo.
2. Python -m SimpleHTTPServer : Creates a simple web page for the current working directory over port 8000.
3. mtr : A command which is a combination of ‘ping’ and ‘traceroute’ command.
4. Ctrl+x+e : This key combination fires up, an editor in the terminal, instantaneously.
5. nl : Outputs the content of text file with lines Numbered.
6. shuf : Randomly selects line/file/folder from a file/folder.
7. ss : Outputs Socket Statistics.
8. Last: Want to know history of last logged in users? This command comes to rescue here.
9. curl ifconfig.me : Shows machine’s external IP Address.
10. tree : Prints files and folders in tree like fashion, recursively.
11. Pstree : Prints running processes with child processes, recursively.
12. <space> command : A space before a bash command, is not recorded in history.
13. stat : Shows the status information of a file as well as of a file system.
14. <alt>. And <esc>. : A tweak which put the last command argument at prompt, in the order of last entered command, appearing first.
15. Pv : outputs simulating text, similar to hollywood movies.
16. Mount | column -t : Lists mounted file system, in nice formatting with specification.
17. Ctrl + l: clear shell prompt, instantaneously.
18. curl -u gmail_id –silent “https://mail.google.com/mail/feed/atom” | perl -ne ‘print “\t” if //; print “$2\n” if /(.*)/;’. This simple scripts, opens up, unread mail of an user, in the terminal itself.
19. screen : Detach and Reattach, long running process from a session.
20. file : Outputs information, regarding types of file.
21. id : Print User and Group Id.
22. ^foo^bar : Run last command with modification, without the need of rewriting the whole command again.
23. > file.txt : Flush the content of a text file, in a single go, from the command prompt.
24. at : Run a particular command, time based.
25. du -h –max-depth=1 Command : Outputs the size of all the files and folders within current folder, in human readable format.
26. expr : Solve simple mathematical calculations from the terminal.
27. look: Check for an English word, from the dictionary, in case of confusion, right from the shell.
28. yes : continues to print a sting, till interrupt instruction is given.
29. factor: Gives all the possible factors of a decimal number.
30. ping -i 60 -a IP_address : Pings the provided IP_address, and gives audible sound when host comes alive.
31. tac : Prints content of a file, in reverse order.
32. strace : A debugging tool.
33. disown -a && exit Command : Run a command in background, even after terminal session is closed.
34. getconf LONG_BIT Command : Output Machine Architecture, very clearly.
35. while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done & : The script outputs date and time on the top right corner of shell/ terminal.
36. convert : converts the output of a command in picture, automatically.
37. watch -t -n1 “date +%T|figlet” : Show animated digital clock at the prompt.
38. host and dig : DNS lookup utility.
39. dstat : Generates statistics regarding system resource.
40. bind -p : Shows all the shortcuts available in Bash.
41. Touch /forcefsck : Force file-system check on next boot.
42. 42. lsb_release : Prints distribution specification information.
43. nc -ZV localhost port_number : Check if a specific port is open or not.
44. curl ipinfo.io : Outputs Geographical Information, regarding an ip_address.
45. find .-user xyz : Lists all file owned by user ‘xyz’
46. apt-get build-dep package_name: Build all the dependency, automatically while installing any specific package.
47. lsof -iTCP:80 -sTCP:LISTEN. The script, outputs all the service/process using port 80.
48. find -size +100M : This command combination, Lists all the files/folders the size of which is 100M or more.
49. pdftk : A nice way to concatenate a lot of pdf files, into one.
50. ps -LF -u user_name : Outputs Processes and Threads of a user.
51. Startx — :1 (This command creates another new X session).


If mtr not installed, you can install it on your respective Linux distributions using your default package manager as shown.

$ sudo apt install mtr
$ sudo yum install mtr
$ sudo dnf install mtr
10 MTR Network Diagnostics Tool Usage Examples
1. The simplest example of using mtr is to provide the domain name or IP address of the remote machine as an argument, for example google.com or 216.58.223.78. This command will show you a traceroute report updated in real-time, until you exit the program (by pressing q or Ctrl + C).

$ mtr google.com
OR
$ mtr 216.58.223.78

Start: Thu Jun 28 12:10:13 2018
HOST: TecMint                     Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 192.168.0.1                0.0%     5    0.3   0.3   0.3   0.4   0.0
  2.|-- 5.5.5.211                  0.0%     5    0.7   0.9   0.7   1.3   0.0
  3.|-- 209.snat-111-91-120.hns.n 80.0%     5    7.1   7.1   7.1   7.1   0.0
  4.|-- 72.14.194.226              0.0%     5    1.9   2.9   1.9   4.4   1.1
  5.|-- 108.170.248.161            0.0%     5    2.9   3.5   2.0   4.3   0.7
  6.|-- 216.239.62.237             0.0%     5    3.0   6.2   2.9  18.3   6.7
  7.|-- bom05s12-in-f14.1e100.net  0.0%     5    2.1   2.4   2.0   3.8   0.5
2. You can force mtr to display numeric IP addresses instead of host names (typically FQDNs – Fully Qualified Domain Names), using the -n flag as shown.

$ mtr -n google.com

Start: Thu Jun 28 12:12:58 2018
HOST: TecMint                     Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 192.168.0.1                0.0%     5    0.3   0.3   0.3   0.4   0.0
  2.|-- 5.5.5.211                  0.0%     5    0.9   0.9   0.8   1.1   0.0
  3.|-- ???                       100.0     5    0.0   0.0   0.0   0.0   0.0
  4.|-- 72.14.194.226              0.0%     5    2.0   2.0   1.9   2.0   0.0
  5.|-- 108.170.248.161            0.0%     5    2.3   2.3   2.2   2.4   0.0
  6.|-- 216.239.62.237             0.0%     5    3.0   3.2   3.0   3.3   0.0
  7.|-- 172.217.160.174            0.0%     5    3.7   3.6   2.0   5.3   1.4
3. If you would like mtr to display both host names as well as numeric IP numbers use the -b flag as shown.

$ mtr -b google.com

Start: Thu Jun 28 12:14:36 2018
HOST: TecMint                     Loss%   Snt   Last   Avg  Best  Wrst StDev
  1.|-- 192.168.0.1                0.0%     5    0.3   0.3   0.3   0.4   0.0
  2.|-- 5.5.5.211                  0.0%     5    0.7   0.8   0.6   1.0   0.0
  3.|-- 209.snat-111-91-120.hns.n  0.0%     5    1.4   1.6   1.3   2.1   0.0
  4.|-- 72.14.194.226              0.0%     5    1.8   2.1   1.8   2.6   0.0
  5.|-- 108.170.248.209            0.0%     5    2.0   1.9   1.8   2.0   0.0
  6.|-- 216.239.56.115             0.0%     5    2.4   2.7   2.4   2.9   0.0
  7.|-- bom07s15-in-f14.1e100.net  0.0%     5    3.7   2.2   1.7   3.7   0.9
4. To limit the number of pings to a specific value and exit mtr after those pings, use the -c flag. If you observe from the Snt column, once the specified number of pings is reached, the live update stops and the program exits.

$ mtr -c5 google.com
5. You can set it into report mode using the -r flag, a useful option for producing statistics concerning network quality. You can use this option together with the -c option to specify the number of pings. Since the statistics are printed to std output, you can redirect them to a file for later analysis.

$ mtr -r -c 5 google.com >mtr-report

The -w flag enables wide report mode for a clearer output.

$ mtr -rw -c 5 google.com >mtr-report

6. You can also re-arrange the output fields the way you wish, this is made possible by the -o flag as shown (see the mtr man page for meaning of field labels).

$ mtr -o "LSDR NBAW JMXI" 216.58.223.78

7. The default interval between ICMP ECHO requests is one second, you can specify interval between ICMP ECHO requests by changing the value using the -i flag as shown.

$ mtr -i 2 google.com

8. You can use TCP SYN packets or UDP datagrams instead of the default ICMP ECHO requests as shown.

$ mtr --tcp test.com
OR
$ mtr --udp test.com

9. To specify the maximum number of hops (default is 30) to be probed between the local system and the remote machine, use the -m flag.

$ mtr -m 35 216.58.223.78

10. While probing network quality, you can set the packet size used in bytes using the -s flag like so.

$ mtr -r -s PACKETSIZE -c 5 google.com >mtr-report

With these examples, you should be good to go with using mtr, see man page for more usage options.

$ man mtr


1. ifconfig
ifconfig (interface configurator) command is use to initialize an interface, assign IP Address to interface and enable or disable interface on demand. With this command you can view IP Address and Hardware / MAC address assign to interface and also MTU (Maximum transmission unit) size.

`$# ifconfig`

`$# ifconfig eth0`

`$# ifconfig eth0 192.168.50.5 netmask 255.255.255.0`

Enable or Disable Specific Interface
To enable or disable specific Interface, we use example command as follows.

Enable eth0
`$# ifup eth0`
Disable eth0
`$# ifdown eth0`
Setting MTU Size
By default MTU size is 1500. We can set required MTU size with below command. Replace XXXX with size.

`$# ifconfig eth0 mtu XXXX`

Set Interface in Promiscuous mode
Network interface only received packets belongs to that particular NIC. If you put interface in promiscuous mode it will received all the packets. This is very useful to capture packets and analyze later. For this you may require superuser access.

`$# ifconfig eth0 - promisc`

1. PING Command
PING (Packet INternet Groper) command is the best way to test connectivity between two nodes. Whether it is Local Area Network (LAN) or Wide Area Network (WAN). Ping use ICMP (Internet Control Message Protocol) to communicate to other devices. You can ping host name of ip address using below command.

$# ping 4.2.2.2

OR

$# ping www.tecmint.com

$# ping -c 5 www.tecmint.com

1. TRACEROUTE Command
traceroute is a network troubleshooting utility which shows number of hops taken to reach destination also determine packets traveling path. Below we are tracing route to global DNS server IP Address and able to reach destination also shows path of that packet is traveling.

$# traceroute 4.2.2.2

4. NETSTAT Command
Netstat (Network Statistic) command display connection info, routing table information etc. To displays routing table information use option as -r.

$# netstat -r

1. Listing all the LISTENING Ports of TCP and UDP connections
Listing all ports (both TCP and UDP) using netstat -a option.

# netstat -a | more
2. Listing TCP Ports connections
Listing only TCP (Transmission Control Protocol) port connections using netstat -at.

# netstat -at
3. Listing UDP Ports connections


Listing only UDP (User Datagram Protocol ) port connections using netstat -au.

# netstat -au

4. Listing all LISTENING Connections
Listing all active listening ports connections with netstat -l.

# netstat -l

5. Listing all TCP Listening Ports
Listing all active listening TCP ports by using option netstat -lt.

# netstat -lt
6. Listing all UDP Listening Ports
Listing all active listening UDP ports by using option netstat -lu.

# netstat -lu
7. Listing all UNIX Listening Ports
Listing all active UNIX listening ports using netstat -lx.

# netstat -lx

9. Showing Statistics by TCP Protocol
Showing statistics of only TCP protocol by using option netstat -st.

# netstat -st
8. Showing Statistics by Protocol
Displays statistics by protocol. By default, statistics are shown for the TCP, UDP, ICMP, and IP protocols. The -s parameter can be used to specify a set of protocols.

# netstat -s

10. Showing Statistics by UDP Protocol
# netstat -su
11. Displaying Service name with PID
Displaying service name with their PID number, using option netstat -tp will display “PID/Program Name”.

# netstat -tp
12. Displaying Promiscuous Mode
Displaying Promiscuous mode with -ac switch, netstat print the selected information or refresh screen every five second. Default screen refresh in every second.

# netstat -ac 5 | grep tcp
13. Displaying Kernel IP routing
Display Kernel IP routing table with netstat and route command.

# netstat -r
14. Showing Network Interface Transactions
Showing network interface packet transactions including both transferring and receiving packets with MTU size.

# netstat -i


15. Showing Kernel Interface Table
Showing Kernel interface table, similar to ifconfig command.

# netstat -ie

16. Displaying IPv4 and IPv6 Information
Displays multicast group membership information for both IPv4 and IPv6.

# netstat -g

17. Print Netstat Information Continuously
To get netstat information every few second, then use the following command, it will print netstat information continuously, say every few seconds.

# netstat -c

18. Finding non supportive Address
Finding un-configured address families with some useful information.

# netstat --verbose
19. Finding Listening Programs
Find out how many listening programs running on a port.

# netstat -ap | grep http

20. Displaying RAW Network Statistics
# netstat --statistics --raw


5. DIG Command
Dig (domain information groper) query DNS related information like A Record, CNAME, MX Record etc. This command mainly use to troubleshoot DNS related query.

$# dig www.tecmint.com; <<>> DiG 9.8.2rc1-RedHat-9.8.2-0.10.rc1.el6 <<>> www.tecmint.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<
For more examples of Dig Command, please read the article on 10 Linux Dig Commands to Query DNS.

6. NSLOOKUP Command
nslookup command also use to find out DNS related query. The following examples shows A Record (IP Address) of tecmint.com.

$# nslookup www.tecmint.com
Server:         4.2.2.2
Address:        4.2.2.2$#53

7. ROUTE Command
route command also shows and manipulate ip routing table. To see default routing table in Linux, type the following command.

$# route


Adding, deleting routes and default Gateway with following commands.

Route Adding
`$# route add -net 10.10.10.0/24 gw 192.168.0.1`
Route Deleting
`$# route del -net 10.10.10.0/24 gw 192.168.0.1`
Adding default Gateway
`$# route add default gw 192.168.0.1`

8. HOST Command
host command to find name to IP or IP to name in IPv4 or IPv6 and also query DNS records.

`$# host www.google.com`

Using -t option we can find out DNS Resource Records like CNAME, NS, MX, SOA etc.

`$# host -t CNAME www.redhat.com`

9. ARP Command
ARP (Address Resolution Protocol) is useful to view / add the contents of the kernel’s ARP tables. To see default table use the command as.

`$# arp -e`

10. ETHTOOL Command
ethtool is a replacement of mii-tool. It is to view, setting speed and duplex of your Network Interface Card (NIC). You can set duplex permanently in /etc/sysconfig/network-scripts/ifcfg-eth0 with ETHTOOL_OPTS variable.

`$# ethtool eth0`

Settings for eth0:
        Current message level: 0x00000007 (7)
        Link detected: yes

11. IWCONFIG Command
iwconfig command in Linux is use to configure a wireless network interface. You can see and set the basic Wi-Fi details like SSID channel and encryption. You can refer man page of iwconfig to know more.

`$# iwconfig [interface]`

12. HOSTNAME Command
hostname is to identify in a network. Execute hostname command to see the hostname of your box. You can set hostname permanently in /etc/sysconfig/network. Need to reboot box once set a proper hostname.

`$# hostname `

tecmint.com
13. GUI tool system-config-network
Type system-config-network in command prompt to configure network setting and you will get nice Graphical User Interface (GUI) which may also use to configure IP Address, Gateway, DNS etc. as shown below image.

$# system-config-network

## Bash


How to Install Bash-it in Linux
To install Bash-it, first you need to clone the following repository to a location of your choice, for example:

$ git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
Then run the following command to install Bash-it (it automatically backup your ~/.bash_profile or ~/.bashrc, depending on your OS). You will be asked “Would you like to keep your .bashrc and append bash-it templates at the end? [y/N]”, answer according to your preference.

$ ~/.bash_it/install.sh

After installation, you can use ls command to verify the bash-it installation files and directories as shown.

$ ls .bash_it/
Verify Bash-It Installation
Verify Bash-It Installation

To start using Bash-it, open a new tab or run:

$ source $HOME/.bashrc
How to Customize Bash-it in Linux
To customize Bash-it, you need to edit your modified ~/.bashrc shell startup file. To list all installed and available aliases, completions, and plugins run the following commands, which should also shows you how to enable or disable them:


$ bash-it show aliases
$ bash-it show completions
$ bash-it show plugins
Next, we will demonstrate how to enable aliases, but before that, first list the current aliases with the following command.

$ alias
View Current Aliases in Linux
View Current Aliases in Linux

All the aliases are located in the $HOME/.bash_it/aliases/ directory. Now let’s enable the apt aliases as shown.

$ bash-it enable alias apt
Enable Alias in Linux
Enable Alias in Linux

Then reload bash-it configs and check the current aliases once more.

$ bash-it reload
$ alias
From the output of the alias command, the apt aliases are now enabled.

Check Current Aliases in Linux
Check Current Aliases in Linux

You can disable newly enabled alias with the following commands.

$ bash-it disable alias apt
$ bash-it reload
Disable Aliases in Linux
Disable Aliases in Linux

In the next section, we will use similar steps to enable or disable completions ($HOME/.bash_it/completion/) and plugins ($HOME/..bash_it/plugins/). All enabled features are located in the $HOME/.bash_it/enabled directory.

How to Manage Bash-it Theme
The default theme for bash-it is bobby; you can check this using the BASH_IT_THEME env variable as shown.

echo $BASH_IT_THEME
Check Bash-it Theme
Check Bash-it Theme

You can find over 50+ Bash-it themes in the $BASH_IT/themes directory.

$ ls $BASH_IT/themes
View Bash-It Themes
View Bash-It Themes

To preview all the themes in your shell before using any, run the following command.

$ BASH_PREVIEW=true bash-it reload
Preview All Bash-It Themes
Preview All Bash-It Themes

Once you have identified a theme to use, open your .bashrc file and find the following line in it and change it value to the name of the theme you want, for example:

$ export BASH_IT_THEME='essential'
Change Bash-It Theme
Change Bash-It Theme

Save the file and close, and source it as shown before.

$ source $HOME/.bashrc
Note: In case you have built a your own custom themes outside of $BASH_IT/themes directory, point the BASH_IT_THEME variable directly to the theme file:

export BASH_IT_THEME='/path/to/your/custom/theme/'
And to disable theming, leave the above env variable empty.

export BASH_IT_THEME=''
How to Search Plugins, Aliases or Completions
You can easily check out which of the plugins, aliases or completions are available for a specific programming language, framework or an environment.

The trick is simple: just search for multiple terms related to some of the commands you use frequently, for example:



$ bash-it search python pip pip3 pipenv
$ bash-it search git
Search in Bash-It
Search in Bash-It

To view help messages for the aliases, completions and plugins, run:

$ bash-it help aliases
$ bash-it help completions
$ bash-it help plugins


You can create you own custom scripts, and aliases, in the following files in the respective directories:

aliases/custom.aliases.bash
completion/custom.completion.bash
lib/custom.bash
plugins/custom.plugins.bash
custom/themes//<custom theme name>.theme.bash
Updating and Uninstalling Bash-It
To update Bash-it to the latest version, simply run:

$ bash-it update
If you don’t like Bash-it anymore, you can uninstall it by running the following commands.

$ cd $BASH_IT
$ ./uninstall.sh
The uninstall.sh script will restore your previous Bash startup file. Once it has completed the operation, you need to remove the Bash-it directory from your machine by running.

$ rm -rf $BASH_IT
And remember to start a new shell for the recent changes to work or source it again as shown.

$ source $HOME/.bashrc
You can see all usage options by running:

$ bash-it help
Finally, Bash-it comes with a number of cool features related to Git.

For more information, see the Bash-it Github repository: https://github.com/Bash-it/bash-it.



Launch an Editor
Open a terminal and press Ctrl+X and Ctrl+E to open an editor (nano editor) with an empty buffer. Bash will try to launch the editor defined by the $EDITOR environment variable.

Nano Editor
Nano Editor

Controlling The Screen
These shortcuts are used to control terminal screen output:

Ctrl+L – clears the screen (same effect as the “clear” command).
Ctrl+S – pause all command output to the screen. If you have executed a command that produces verbose, long output, use this to pause the output scrolling down the screen.
Ctrl+Q – resume output to the screen after pausing it with Ctrl+S.
Move Cursor on The Command Line


The next shortcuts are used for moving the cursor within the command-line:

Ctrl+A or Home – moves the cursor to the start of a line.
Ctrl+E or End – moves the cursor to the end of the line.
Ctrl+B or Left Arrow – moves the cursor back one character at a time.
Ctrl+F or Right Arrow – moves the cursor forward one character at a time.
Ctrl + Left Arrow or Alt+B or Esc and then B – moves the cursor back one word at a time.
Ctrl + Right Arrow or Alt+C or Esc and then F – moves the cursor forward one word at a time.
Search Through Bash History
The following shortcuts are used for searching for commands in the bash history:

Up arrow key – retrieves the previous command. If you press it constantly, it takes you through multiple commands in history, so you can find the one you want. Use the Down arrow to move in the reverse direction through the history.
Ctrl+P and Ctrl+N – alternatives for the Up and Down arrow keys, respectively.
Ctrl+R – starts a reverse search, through the bash history, simply type characters that should be unique to the command you want to find in the history.
Ctrl+S – launches a forward search, through the bash history.
Ctrl+G – quits reverse or forward search, through the bash history.
Delete Text on the Command Line
The following shortcuts are used for deleting text on the command line:

Ctrl+D or Delete – remove or deletes the character under the cursor.
Ctrl+K – removes all text from the cursor to the end of the line.
Ctrl+X and then Backspace – removes all the text from the cursor to the beginning of the line.
Transpose Text or Change Case on the Command Line
These shortcuts will transpose or change the case of letters or words on the command line:

Ctrl+T – transposes the character before the cursor with the character under the cursor.
Esc and then T – transposes the two words immediately before (or under) the cursor.
Esc and then U – transforms the text from the cursor to the end of the word to uppercase.
Esc and then L – transforms the text from the cursor to the end of the word to lowercase.
Esc and then C – changes the letter under the cursor (or the first letter of the next word) to uppercase, leaving the rest of the word unchanged.
Working With Processes in Linux
The following shortcuts help you to control running Linux processes.

Ctrl+Z – suspend the current foreground process. This sends the SIGTSTP signal to the process. You can get the process back to the foreground later using the fg process_name (or %bgprocess_number like %1, %2 and so on) command.
Ctrl+C – interrupt the current foreground process, by sending the SIGINT signal to it. The default behavior is to terminate a process gracefully, but the process can either honor or ignore it.
Ctrl+D – exit the bash shell (same as running the exit command).
Learn more about: All You Need To Know About Processes in Linux [Comprehensive Guide]

Bash Bang (!) Commands
In the final part of this article, we will explain some useful ! (bang) operations:

!! – execute last command.
!top – execute the most recent command that starts with ‘top’ (e.g. !).
!top:p – displays the command that !top would run (also adds it as the latest command in the command history).
!$ – execute the last word of the previous command (same as Alt +., e.g. if last command is ‘cat tecmint.txt’, then !$ would try to run ‘tecmint.txt’).
!$:p – displays the word that !$ would execute.
!* – displays the last word of the previous command.
!*:p – displays the last word that !* would substitute.
For more information, see the bash man page:

$ man bash
That’s all for now! In this article, we shared some common and useful Bash command-line shortcuts and operations. Use the comment form below to make any additions or ask questions.


#tiling

1. i3
i3 is a free, open source, and completely configurable windows manager app targetted at advanced Linux and BSD users and developers. It features a tree data structure which allows for more flexible layouts than its alternatives and it does not require Haskell or LUA.



i3 is among the most loved manual window tiling manager apps because of its vast features which include settings in plain text, custom keyboard shortcuts, and configuration without the need to restart the underlying system.

i3 - Tiling Window Manager for Linux
i3 – Tiling Window Manager for Linux

The package i3 is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install i3    [On CentOS/RHEL]
$ sudo dnf install i3    [On Fedora]
$ sudo apt install i3    [On Debian/Ubuntu]


11 Best Tiling Window Managers for Linux
by Martins D. Okoi | Published: April 9, 2019 | Last Updated: April 16, 2019



 Download Your Free eBooks NOW - 10 Free Linux eBooks for Administrators | 4 Free Shell Scripting eBooks
As the name Linux Window manager suggests, the work of window managers is to coordinate how app windows function and they automatically run in the background of your OS to manage the appearance and placement of running applications.

Read Also: 20 Useful Terminal Emulators for Linux

There are several Window Manager apps that you can use on Linux but just as you would expect, here is an article lists the best 11 for you to choose from.

1. i3
i3 is a free, open source, and completely configurable windows manager app targetted at advanced Linux and BSD users and developers. It features a tree data structure which allows for more flexible layouts than its alternatives and it does not require Haskell or LUA.



i3 is among the most loved manual window tiling manager apps because of its vast features which include settings in plain text, custom keyboard shortcuts, and configuration without the need to restart the underlying system.

i3 - Tiling Window Manager for Linux
i3 – Tiling Window Manager for Linux

The package i3 is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install i3    [On CentOS/RHEL]
$ sudo dnf install i3    [On Fedora]
$ sudo apt install i3    [On Debian/Ubuntu]
2. bspwm
bspwm is a free, lightweight, and open source Linux tiling manager known for adhering to the Linux philosophy by concentrating on doing one thing and getting it done properly.

It is based on binary space partitioning which represents windows as the leaves of a complete binary tree and it handles key binding with a separate utility, sxhkd, which allows for smoother performance and support for other input devices.

bspwm’s features include support for multiple windows, partial support for EWMH, automatic mode for automatically setting the position of app tiles, and it is configured and controlled through messages, among others.

bspwm - Tiling Window Manager for Linux
bspwm – Tiling Window Manager for Linux

The package bspwm is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install bspwm    [On CentOS/RHEL]
$ sudo dnf install bspwm    [On Fedora]
$ sudo apt install bspwm    [On Debian/Ubuntu]
3. herbstluftwm
herbstluftwm is a free and open source configurable manual tiling window manager for x11 using Glib and Xlib. Basically, it works using a layout based on splitting frames into sub-frames which can be further split and filled with windows.

herbstluftwm’s main features include tags (i.e. workspaces or virtual desktops), a configuration script which runs at startup, exactly one tag per monitor, etc. Learn more from our article on herbstluftwm here.

herbstluftwm – Tiling Window Manager for Linux
herbstluftwm – Tiling Window Manager for Linux

The package herbstluftwm is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install herbstluftwm    [On CentOS/RHEL]
$ sudo dnf install herbstluftwm    [On Fedora]
$ sudo apt install herbstluftwm    [On Debian/Ubuntu]


Read Also: 10 Best File and Disk Encryption Tools for Linux

4. awesome
awesome is a free and open source next generation tiling manager for X built to be fast and extensible and it is primarily aimed at developers, power users, and anyone who would like to control their graphical environment.

Its features include well-documented source code and API, real multi-head support with per screen desktops, support for D-Bus, support for Lua extensions, no floating or tiled layers, etc.

awesome - Framework Window Manager for Linux
awesome – Framework Window Manager for Linux

The package awesome is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install awesome    [On CentOS/RHEL]
$ sudo dnf install awesome    [On Fedora]
$ sudo apt install awesome    [On Debian/Ubuntu]
5. Tilix
Tilix is an advanced GTK3 tiling terminal emulator and manager that uses the Gnome Human Interface Guidelines. It enables users to organize app windows horizontally and vertically using drag and drop.

Tilix offers its users a lot of features including working with custom titles and custom hyperlinks, support for transparent background images, notifications in the background, multiple panes, and persistent layouts.

Tilix - GTK3 Tiling Terminal Emulator for Linux
Tilix – GTK3 Tiling Terminal Emulator for Linux

The package Tilix is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install tilix    [On CentOS/RHEL]
$ sudo dnf install tilix    [On Fedora]
$ sudo apt install tilix    [On Debian/Ubuntu]
6. XMonad
XMonad is a free and open source dynamic tiling X11 window manager that exists to automate windows searching and alignment. It is extensible using its very own extension library which gives it options for status bars and window decorations. It is also minimal, stable, and easy to configure.

xmonad - Tiling Window Manager for Linux
xmonad – Tiling Window Manager for Linux

The package xmonad is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install xmonad    [On CentOS/RHEL]
$ sudo dnf install xmonad    [On Fedora]
$ sudo apt install xmonad    [On Debian/Ubuntu]
7. Sway
Sway is a free, open source, and lightweight tiling Wayland i3-compatible window manager that automatically arranges app windows to logically maximize desktop space. It arranges windows into a grid by default and supports almost all the commands included in i3.

Its features include support for keyboard shortcuts, its usage of Wayland instead of Xorg, and gaps. Read more about Sway in our article here.

Sway - Tiling Wayland Window Manager for Linux
Sway – Tiling Wayland Window Manager for Linux

Sway is available to install from the default repository of many distributions, if it’s not available check out this wiki page for installation instructions for your distributions.

8. tmux
tmux is an open source terminal multiplexer that enables users to create multiple terminal sessions that they can access and control from a single screen which makes it perfect for running several command line programs at the same time.

tmux makes use of all the space available to it and it is easily usable thanks to its support for keybindings which you can use to split windows and create more panes. You can also share individual shell instances between distinct sessions to be used for different purposes by different users.

Tmux Manage Multiple Linux Terminals Inside Single Console
Tmux Manage Multiple Linux Terminals Inside Single Console

The package tmux is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install tmux    [On CentOS/RHEL]
$ sudo dnf install tmux    [On Fedora]
$ sudo apt install tmux    [On Debian/Ubuntu]
Read Also: 8 Best Linux Console File Managers

9. spectrwm
spectrwm is a small, dynamic, xmonad and dwm-inspired reparenting and tiling window manager built for X11 to be fast, compact, and concise. It was created with the aim of solving the issues of xmonad and dwm face.

spectrwm uses a plain text configuration file, boasts defaults similar to those in xmonad and dwm, and features built-in keyboard shortcuts. Its other features include customizable colors and border width, drag-to-float, quick launch menu, customizable status bar, dynamic RandR support, etc.

spectrwm - Tiling Window Manager for Linux
spectrwm – Tiling Window Manager for Linux

The package spectrwm is provided by the distribution you are using, just use the package manager to install it as shown.

$ sudo yum install spectrwm    [On CentOS/RHEL]
$ sudo dnf install spectrwm    [On Fedora]
$ sudo apt install spectrwm    [On Debian/Ubuntu]
10. JWM
JWM (Joe’s Window Manager) is an open source C-based lightweight window manager for the X11 Window System optimized to work smoothly on older, less powerful computer systems. It requires only the Xlib library to run but is capable of working with a host of other libraries including libXext for shape extension, Cairo and libRSVG for icons and backgrounds, libjpeg and libpng for JPEG and PNG backgrounds and icons respectively, etc.

JWM - Window Manager for Linux
JWM – Window Manager for Linux

JWM is included in a couple of Linux distros e.g. Damn Small Linux and Puppy Linux and has found most of its use on portable PCs like the Raspberry Pi.

$ sudo yum install jwm    [On CentOS/RHEL]
$ sudo dnf install jwm    [On Fedora]
$ sudo apt install jwm    [On Debian/Ubuntu]
11. Qtile
Qtile is a small but full-featured and completely configurable open source tiling window manager developed in Python. It is designed with a focus on simplicity, extensibility using extensions, and customization.

Qtile features easy to write custom layouts, commands, and widgets. It can also be scripted remotely in order to set up work spaces, update status bar widgets, manipulate windows, etc. It has a comprehensive documentation in case you need clarification along the way.

Qtile - Hackable Tiling Window Manager
Qtile – Hackable Tiling Window Manager

There are more tiling managers in the community that you can choose from but not many of them offer nearly a complete feature list as the apps listed above.

Do you know any commendable apps that are worthy of mention? Or have you had experiences with any that influence your choice of one over the other? Feel free to share your thoughts with us in the comments section below.


4 Best Linux Boot Loaders
by Aaron Kili | Published: August 27, 2016 | Last Updated: August 29, 2016



 Download Your Free eBooks NOW - 10 Free Linux eBooks for Administrators | 4 Free Shell Scripting eBooks
When you turn on your machine, immediately after POST (Power On Self Test) is completed successfully, the BIOS locates the configured bootable media, and reads some instructions from the master boot record (MBR) or GUID partition table which is the first 512 bytes of the bootable media. The MBR contains two important sets of information, one is the boot loader and two, the partition table.

What is a Boot Loader?
A boot loader is a small program stored in the MBR or GUID partition table that helps to load an operating system into memory. Without a boot loader, your operating system can not be loaded into memory.

Suggested Read: A Basic Guide to Linux Boot Process

There are several boot loaders we can install together with Linux on our systems and in this article, we shall briefly talk about a handful of the best Linux boot loaders to work with.

1. GNU GRUB
GNU GRUB is a popular and probably the most used multiboot Linux boot loader available, based on the original GRUB (GRand Unified Bootlader) which was created by Eirch Stefan Broleyn. It comes with several improvements, new features and bug fixes as enhancements of the original GRUB program.



Importantly, GRUB 2 has now replaced the GRUB. And notably, the name GRUB was renamed to GRUB Legacy and is not actively developed, however, it can be used for booting older systems since bug fixes are still on going.

GRUB has the following prominent features:

Supports multiboot
Supports multiple hardware architectures and operating systems such as Linux and Windows
Offers a Bash-like interactive command line interface for users to run GRUB commands as well interact with configuration files
Enables access to GRUB editor
Supports setting of passwords with encryption for security
Supports booting from a network combined with several other minor features
Visit Homepage: https://www.gnu.org/software/grub/

2. LILO (Linux Loader)
LILO is a simple yet powerful and stable Linux boot loader. With the growing popularity and use of GRUB, which has come with numerous improvements and powerful features, LILO has become less popular among Linux users.

While it loads, the word “LILO” is displayed on the screen and each letter appears before or after a particular event has occurred. However, the development of LILO was stopped in December 2015, it has a number of features as listed below:

Does not offer an interactive command line interface
Supports several error codes
Offers no support for booting from a network
All its files are stored in the first 1024 cylinders of a drive
Faces limitation with BTFS, GPT and RAID plus many more.
Visit Homepage: http://lilo.alioth.debian.org/

Suggested Read: 5 Best Modern Linux ‘init’ Systems (1992-2015)

3. BURG – New Boot Loader
Based on GRUB, BURG is a relatively new Linux boot loader. Because it is derived from GRUB, it ships in with some of the primary GRUB features, nonetheless, it also offers remarkable features such as a new object format to support multiple platforms including Linux, Windows, Mac OS, FreeBSD and beyond.

Additionally, it supports a highly configurable text and graphical mode boot menu, stream plus planned future improvements for it to work with various input/output devices.

Visit Homepage: https://launchpad.net/burg

4. Syslinux
Syslinux is an assortment of light weight boot loaders that enable booting from CD-ROMs, from a network and so on. It supports filesystems such as FAT for MS-DOS, and ext2, ext3, ext4 for Linux. It as well supports uncompressed single-device Btrfs.

Note that Syslinux only accesses files in its own partition, therefore, it does not offer multi-filesystem boot capabilities.

Visit Homepage: http://www.syslinux.org/wiki/index.php?title=The_Syslinux_Project

Conclusion
A boot loader allows you to manage multiple operating systems on your machine and select which one to use at a particular time, without it, your machine can not load the kernel and the rest of the operating system files.

Have we missed any tip-top Linux boot loader here? If so, then let us know by using the comment form below by making suggestions of any commendable boot loaders that can support Linux operating system.
