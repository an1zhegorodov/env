#!/bin/sh

sudo apt-get update
sudo apt-get install -y git vim zsh wget ncdu htop
chsh -s $(grep /zsh$ /etc/shells | tail -1)
if [ ! -d ~/.oh-my-zsh ]; then
    echo 'Setting up oh-my-zsh...'
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
else
    echo 'oh-my-zsh is already installed'
fi
echo 'Overriding .gitconfig...'
mv gitconfig ~/.gitconfig
echo 'Overriding .zshrc...'
mv zshrc ~/.zshrc
echo 'Overriding .vimrc...'
mv vimrc ~/.vimrc
echo 'Setting up /var/vhosts folder...'
./setup_web.sh
