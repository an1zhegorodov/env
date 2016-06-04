#!/usr/bin/env bash

MAIN_DIR="/var/vhosts"
SERVER_GROUP="www-data"

if [ -d "$MAIN_DIR" ]; then
    echo "Directory $MAIN_DIR already exists"
    exit
fi

if [ ! $(getent group $SERVER_GROUP) ]; then
    echo "Group $SERVER_GROUP not found"
    exit
fi

echo "Creating $MAIN_DIR"
sudo mkdir -p $MAIN_DIR
echo "Changing $MAIN_DIR ownershipt to $USER:$SERVER_GROUP"
sudo chown $USER:$SERVER_GROUP $MAIN_DIR
echo "Changing $MAIN_DIR permissions to 770 g+s"
sudo chmod 770 $MAIN_DIR
sudo chmod g+s $MAIN_DIR
echo "Setting up rwx ACL permissions for $USER:$SERVER_GROUP"
sudo setfacl -dm u::rwx $MAIN_DIR
sudo setfacl -dm g::rwx $MAIN_DIR
sudo setfacl -dm u:$USER:rwx $MAIN_DIR
sudo setfacl -dm g:$SERVER_GROUP:rwx $MAIN_DIR
sudo setfacl -m u:$USER:rwx $MAIN_DIR
sudo setfacl -m g:$SERVER_GROUP:rwx $MAIN_DIR
