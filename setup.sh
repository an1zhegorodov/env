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
cp gitconfig ~/.gitconfig
echo 'Overriding .zshrc...'
cp zshrc ~/.zshrc
echo 'Overriding .vimrc...'
cp vimrc ~/.vimrc
echo 'Setting up /var/vhosts folder...'
VHOSTS_DIR="/var/vhosts"
SERVER_GROUP="www-data"

if [ ! -d "$VHOSTS_DIR" ]; then
    echo "Creating $VHOSTS_DIR"
    sudo mkdir -p $VHOSTS_DIR
else
    echo "Directory $VHOSTS_DIR already exists"
fi

if [ $(getent group $SERVER_GROUP) ]; then
    echo "Changing $VHOSTS_DIR ownership to $USER:$SERVER_GROUP"
    sudo chown $USER:$SERVER_GROUP $VHOSTS_DIR
else
    echo "Group $SERVER_GROUP not found"
    $SERVER_GROUP=$USER
    echo "Changing $VHOSTS_DIR ownership to $USER:$SERVER_GROUP"
    sudo chown $USER:$SERVER_GROUP $VHOSTS_DIR
fi
echo "Changing $VHOSTS_DIR permissions to 770 g+s"
sudo chmod 770 $VHOSTS_DIR
sudo chmod g+s $VHOSTS_DIR
echo "Setting up rwx ACL permissions for $USER:$SERVER_GROUP"
sudo setfacl -dm u::rwx $VHOSTS_DIR
sudo setfacl -dm g::rwx $VHOSTS_DIR
sudo setfacl -dm u:$USER:rwx $VHOSTS_DIR
sudo setfacl -dm g:$SERVER_GROUP:rwx $VHOSTS_DIR
sudo setfacl -m u:$USER:rwx $VHOSTS_DIR
sudo setfacl -m g:$SERVER_GROUP:rwx $VHOSTS_DIR
