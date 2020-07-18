# Env
This package installs everything I typically need on a clean system

## Usage

Run `wget https://github.com/mintobit/env/archive/master.zip && unzip master.zip && cd env-master && ./setup.sh && cd .. && rm master.zip && rm -r env-master` 

Run dev version `wget https://github.com/mintobit/env/archive/develop.zip && unzip develop.zip && cd env-develop && ./setup.sh && cd .. && rm develop.zip && rm -r env-develop`

## Environment scripts/configs

* vimrc - vim configuration
* zshrc - zsh shell configuration
* gitconfig - git configuration
* setup.sh - installation script

## TODO

* Make it fully idempotent (do not override configs?)
* Install nginx and configure
* Install apache and configure
* Ask for input? (e.g. git email)
* Colors
