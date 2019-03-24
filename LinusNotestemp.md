#1. redo last command but as root
sudo !!

#2. open an editor to run a command
ctrl+x+e

#3. create a super fast ram disk
mkdir -p /mnt/ram
mount -t tmpfs tmpfs /mnt/ram -o size=8192M

##3.5 Test it by creating a blockfile
dd if=/dev/zero of=test.iso bs=1M count=8000
rm test.iso
mount -t tmpfs tmpfs /mnt/ram -o size=8192M
cd ram/

#4. don't add command to history (note the leading space)
 ls -l
##Show the history
history 
##clear the screen
clear

#5. fix a really long command that you messed up
fc

#6. tunnel with ssh (local port 3337 -> remote host's 127.0.0.1 on port 6379)
ssh -L 3337:127.0.0.1:6379 root@emkc.org -N
bg
redis-cli -p 3337


#7. quickly create folders
mkdir -p folder/{sub1,sub2}/{subA,subB,subC}
##/1/A,/1/B...3/C/
mkdir -p folder/{1..10}/{1..10}
##Create folders 1 through 10 each with 10 folders in it.

#8. intercept stdout and log to file
cat file | tee -a log | cat > /dev/null

#bonus: exit terminal but leave all processes running
disown -a && exit

#Use the last term of the last command- !$
!$
$ mkdir -p /path/to/new/dir
$ cd !$
