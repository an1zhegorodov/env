#!/bin/sh

sudo apt-get update
sudo apt-get install -y git vim zsh wget ncdu htop
wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O install_oh-my-zsh.sh
chmod +x install_oh-my-zsh.sh
./install_oh-my-zsh.sh
mv zshrc ~/.zshrc
mv vimrc ~/.vimrc
./setup_web.sh
cd ../ && rm -rf env
