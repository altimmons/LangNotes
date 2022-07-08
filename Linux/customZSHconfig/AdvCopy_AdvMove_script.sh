#! /bin/bash

cd ${ZSH_CUSTOM: -~/}
mkdir advcpmv
cd advcpmv

wget http://ftp.gnu.org/gnu/coreutils/coreutils-8.32.tar.xz
tar xvJf coreutils-8.32.tar.xz
cd coreutils-8.32/
wget https://raw.githubusercontent.com/jarun/advcpmv/master/advcpmv-0.8-8.32.patch
patch -p1 -i advcpmv-0.8-8.32.patch
./configure
make

sudo mv ./src/cp /usr/local/bin/advcp
sudo mv ./src/cp /usr/local/bin/advcp
sudo mv ./src/mv /usr/local/bin/advmv
sudo mv ./src/mv /usr/local/bin/advmv
#echo alias cp '/usr/local/bin/advcp -g' >> ~/.bashrc
#echo alias mv '/usr/local/bin/advmv -g' >> ~/.bashrc
cd ..


cd $ZSH_CUSTOM

mkdir ccat
cd ccat
