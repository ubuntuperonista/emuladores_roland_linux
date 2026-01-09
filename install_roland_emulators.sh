#!/bin/sh
###Install Munt Roland MT32 emulator on Linux
## Por ~peron

##Install Ubuntu dependencies
sudo apt update ;
sudo apt install gcc libqt5multimedia5 git gcc g++ gcc-multilib g++-multilib cmake libsdl2-dev ;

##Download MT-32 ROMs
mkdir /home/$USER/.roms/ ;
mkdir /home/$USER/.roms/mt32/
cd /home/$USER/.roms/mt32/ ;
wget https://archive.org/download/mame-versioned-roland-mt-32-and-cm-32l-rom-files/MT32_v1.07_legacy_ROM_files.zip ;
unzip MT32_v1.07_legacy_ROM_files.zip ;

## Download MUNT MT32 emulator
cd /tmp ;
wget https://sourceforge.net/projects/munt/files/munt/2.5.0/Linux/deb/amd64/mt32emu-qt-1.9.0.deb ;
wget https://sourceforge.net/projects/munt/files/munt/2.5.0/Linux/deb/amd64/mt32emu-smf2wav-1.7.0.deb ;
wget https://sourceforge.net/projects/munt/files/munt/2.5.0/Linux/deb/amd64/libmt32emu-2.5.1.deb ;
wget https://sourceforge.net/projects/munt/files/munt/2.5.0/Linux/deb/amd64/libmt32emu-dev-2.5.1.deb ;

sudo dpkg -i libmt32emu-2.5.1.deb
sudo dpkg -i libmt32emu-dev-2.5.1.deb
sudo dpkg -i mt32emu-qt-1.9.0.deb ;
sudo dpkg -i mt32emu-smf2wav-1.7.0.deb ;

## Install Nuked SC-55 Roland SC55 emulator on Ubuntu:

## Obtain Roland SC-55 ROMs
mkdir /home/$USER/.roms/;
mkdir /home/$USER/.roms/sc55/;
cd  /home/$USER/.roms/sc55/
wget https://archive.org/download/roland-sc-55mkii-roms/Roland%20SC-155%20Rev1.zip;
wget https://archive.org/download/roland-sc-55mkii-roms/Roland%20SC-55%20v1.21%20ROMs.zip;
wget https://archive.org/download/roland-sc-55mkii-roms/SCMODE.zip ;
wget -O nuked-sc55.jpg https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/0f/75/60/0f756039-792e-f97a-4d53-ca766a8e5988/source/512x512bb.jpg
unzip 'Roland SC-55 v1.21 ROMs.zip' ;
unzip 'Roland SC-155 Rev1.zip' ;

## Compile Nuked SC-55
cd /tmp;
git clone --recurse-submodules https://github.com/nukeykt/Nuked-SC55.git ;
cd /tmp/Nuked-SC55/;
mkdir build ;
cd /tmp/Nuked-SC55/build ;
cmake -DCMAKE_BUILD_TYPE=Release .. ;
cmake --build . ;
sudo cmake --install . ;

##copy sc55 ROMs into its folder
sudo cp /home/$USER/.roms/sc55/nuked-sc55.jpg /usr/share/icons ;
sudo cp /home/$USER/.roms/sc55/*.bin /usr/local/share/nuked-sc55/
