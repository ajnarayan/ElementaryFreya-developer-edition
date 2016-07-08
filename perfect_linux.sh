#!/bin/sh
$os=$(lsb_release -i | awk -F"\t" '{print $2}')
#echo $os
#update the system first
sudo apt-get update && sudo apt-get upgrade

#remove unwanted applications
sudo apt-get purge midori-granite
sudo apt-get purge noise
sudo apt-get purge software-center
sudo apt-get purge scratch-text-editor

#Firefox
sudo apt-get install firefox

#Google Chrome 50
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt install google-chrome-stable

#python pip
sudo apt-get install python-pip

#install LAMP for local development
sudo apt-get install lamp-server^

#sublime-text-3
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

#terminator for multiple terminal in a single window
sudo apt-get install terminator

#Spotify !
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

#Ubuntu restricted extras for flashplayer etc.
sudo apt-get install ubuntu-restricted-extras

#VLC player
sudo apt-get install vlc

#libreoffice
sudo apt-get install libreoffice

#Skype
sudo apt-get install Skype

#java 1.8
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

#Latest Git
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install git

#elementary-tweaks
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily
sudo apt-get update
sudo apt-get install elementary-tweaks

#Install dropbox with indicator fix on elementary Freya
#Source: https://github.com/zant95/elementary-dropbox
git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
bash /tmp/elementary-dropbox/install.sh

#fluxgui for screen brightness
cd /tmp
git clone https://github.com/xflux-gui/xflux-gui.git
cd xflux-gui
sudo python ./setup.py install
cd
echo "fluxgui INSTALLED. PLEASE RUN fluxgui COMMAND TO SET IT UP! "



#Final Cleanup
sudo apt-get autoremove
sudo apt-get autoclean
