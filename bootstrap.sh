#!/usr/bin/env bash

# upgrade the system
export DEBIAN_FRONTEND=noninteractive
export HOME=/home/vagrant

sudo apt-get update
#sudo apt-get -q -y dist-upgrade
sudo apt-get install -y python-software-properties build-essential
sudo apt-get install -y git
sudo apt-get install -y curl
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint
npm install -g jshint

# Install rlwrap to provide libreadline features with node
sudo apt-get install -y rlwrap

# Install emacs24
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
git clone https://github.com/stef1927/dotfiles
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .

# install screen for terminal switching
sudo apt-get install screen

# install x11
# sudo apt-get install xinit
# sudo apt-get install x11-apps

# install Sublime text 2
# sudo apt-add-repository ppa:webupd8team/sublime-text-2 
# sudo apt-get update
# sudo apt-get install sublime-text