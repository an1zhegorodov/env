#!/bin/sh

sudo apt-get update
sudo apt-get install -y git vim zsh wget ncdu htop
chsh -s $(grep /zsh$ /etc/shells | tail -1)
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
mv gitconfig ~/.gitconfig
mv zshrc ~/.zshrc
mv vimrc ~/.vimrc
./setup_web.sh
cd ../ && rm -rf env-develop
