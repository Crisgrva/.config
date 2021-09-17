#!/bin/bash

if [ "$(id -u)" != "0" ]
then
	echo "Sorry, you are not root."
	exit 1
fi

#Go to root
cd ~

#Restore content from Ubuntu
echo -e "Unminimizing Ubuntu..."
unminimize

echo -e "Updating apt-get..."
#Update && Upgrade
apt-get update
apt-get upgrade

echo -e "Installing cUrl..."
#Install curl
apt-get -y install curl

echo -e "Installing Git..."
#Install Git
apt-get install git

echo -e "Installing Node16.x"
#Install Node16.x
curl -fsSL https://deb.nodesource.com/setup_16.x | -E bash -
apt-get install -y nodejs

echo -e "Installing NeoVim..."
#Install NeoVim
apt-get install neovim
git clone https://github.com/Crisgrva/.config.git
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo -e "Installing Build-Essencial..."
#Install Build Essencial -> Tools for C
apt-get -y install build-essential

echo -e "Installing Betty..."
#Install Betty
git clone https://github.com/holbertonschool/Betty.git
cd Betty/
./install.sh
cd ..
rm -rf Betty/

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


