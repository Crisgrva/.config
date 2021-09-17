#!/bin/bash

if [ "$(id -u)" != "0" ]
then
	echo "Sorry, you are not root."
	exit 1
fi

echo ""
echo "   +-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+-+ +-+-+ +-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+
   |T|h|i|s| |s|c|r|i|p|t| |w|i|l|l| |d|o| |t|h|e| |f|o|l|l|o|w|i|n|g| |o|n|
   +-+-+-+-+ +-+-+-+-+-+-+ +-+-+-+-+ +-+-+ +-+-+-+ +-+-+-+-+-+-+-+-+-+ +-+-+
                           +-+-+-+-+ +-+-+-+-+-+-+-+
                           |y|o|u|r| |m|a|c|h|i|n|e|
                           +-+-+-+-+ +-+-+-+-+-+-+-+"

echo "✅1.  Unminimize Ubuntu"
echo "✅2.  Update apt-get"
echo "✅3.  Install cUrl"
echo "✅4.  Install Git"
echo "✅5.  Install Node 16.x"
echo "✅6.  Install NeoVim with custom settings"
echo "✅7.  Install Build Essential"
echo "✅8.  Install Betty Style Guide"
echo "✅9.  Install Valgrind"
echo "✅10. Install Python3"
echo "✅11. Install Python3-PIP"
echo "✅12. Install Pycodestyle"
echo "✅13. Install ZSH"
echo "✅14. Install OhMyZsh"
echo ""
echo "Made by @Crisgrva"
echo ""
read -p 'Do you wish to continue? [y/n]' YES

if [ $YES == 'y' ]
then
  continue
else
  exit
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
curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
apt-get install -y nodejs

echo -e "Installing NeoVim..."
#Install NeoVim
apt-get install neovim
git clone https://github.com/Crisgrva/.config.git
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo -e "Installing Build-Essential..."
#Install Build Essencial -> Tools for C
apt-get -y install build-essential

echo -e "Installing Betty..."
#Install Betty
git clone https://github.com/holbertonschool/Betty.git
cd Betty/
./install.sh
cd ..
rm -rf Betty/

echo -e "installing Valgrind"
#Install Valgrind
apt-get install valgrind

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


