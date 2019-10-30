#!/bin/bash

# Get list of dotfiles (excluding .git, and nvm files)
files=$(find . -name '.*' ! -path ".git/" -maxdepth 1 -mindepth 1 -execdir echo {} ';' | grep -v '.git\|.nvim\|.nvimrc')


# create symlinks
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $(pwd)/$file ~/$file
done

# load profile to get access to XDG_CONFIG_HOME
source ~/.bash_profile

# install vim plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# setup nvim config
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
mkdir -p $XDG_CONFIG_HOME/nvim
ln -s $(pwd)/.nvimrc $XDG_CONFIG_HOME/nvim/init.vim
ln -s $(pwd)/.nvimrc ~/.nvimrc

# install plugins
nvim -c PlugInstall -c ":qall"
