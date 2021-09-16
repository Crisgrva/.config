#!/bin/bash

if [ "$(id -u)" != "0" ]
then
	echo "Sorry, you are not root."
	exit 1
fi
echo -e "Updating apt-get..."
apt-get update
apt-get upgrade

echo -e "Installing cUrl..."
#Install curl
apt-get -y install curl

echo -e "Installing NeoVim..."
#Install NeoVim
apt-get install neovim

echo -e "Installing Git..."
#Install Git
apt-get install git

echo -e "Installing Build-Essencial..."
#Install Build Essencial -> Tools for C
apt-get -y install build-essential

echo -e "Installing Betty..."
#Install Betty
git clone https://github.com/holbertonschool/Betty.git
cd Betty/
./install.sh

echo -e "Installing Python3, PIP & Pycodestyle..."
#Install Python3
apt-get install python3
apt-get install python3-pip
pip install pycodestyle

echo -e "Installing ZSH..."
#Install ZSH
apt-get install zsh

echo -e "Installing OhMyZsh..."
#Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


