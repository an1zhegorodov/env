#!/bin/sh

sudo apt-get update
sudo apt-get install -y git vim zsh wget ncdu htop
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
mv zshrc ~/.zshrc
mv vimrc ~/.vimrc
./setup_web.sh
cd ../ && rm -rf env
