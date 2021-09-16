#!/bin/bash

if [ "$(id -u)" != "0" ]
then
	echo "Sorry, you are not root."
	exit 1
fi

echo "Updating apt-get..."
apt-get update
apt-get upgrade

#Install curl
apt-get -y install curl

#Install ZSH
apt-get install zsh

#Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Install Build Essencial -> Tools to C
apt-get -y install build-essential

#Install Betty
git clone https://github.com/holbertonschool/Betty.git
cd Betty/
./install.sh

