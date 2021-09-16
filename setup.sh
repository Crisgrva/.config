#!/bin/bash

if [ "$(id -u)" != "0" ]
then
	echo "Sorry, you are not root."
	exit 1
fi
GREEN='\033[0;32m'
echo -e "${GREEN}Updating apt-get..."
apt-get update
apt-get upgrade

echo -e "${GREEN}Installing cUrl..."
#Install curl
apt-get -y install curl

echo -e "${GREEN}Installing NeoVim..."
#Install NeoVim
apt-get install neovim

echo -e "${GREEN}Installing Git..."
#Install Git
apt-get install git

echo -e "${GREEN}Installing Build-Essencial..."
#Install Build Essencial -> Tools for C
apt-get -y install build-essential

echo -e "${GREEN}Installing Betty..."
#Install Betty
git clone https://github.com/holbertonschool/Betty.git
cd Betty/
./install.sh

echo -e "${GREEN}Installing Python3, PIP & Pycodestyle..."
#Install Python3
apt-get install python3
apt-get install python3-pip
pip install pycodestyle

echo -e "${GREEN}Installing ZSH..."
#Install ZSH
apt-get install zsh

echo -e "${GREEN}Installing OhMyZsh..."
#Install OhMyZsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


