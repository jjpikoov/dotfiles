#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dotfiles=~/dotfiles                    # dotfiles directory
olddotfiles=~/dotfiles_old             # old dotfiles backup directory
files="bashrc Xdefaults gitconfig tmux.conf xinitrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddotfiles for backup of any existing dotfiles in ~"
mkdir -p $olddotfiles
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dotfiles directory"
cd $dotfiles
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddotfiles"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dotfiles/$file ~/.$file
done

#stuff for openbox
echo "Creating copy of current openbox config"
mkdir -p $olddotfiles/config/openbox
mv ~/.config/openbox/* $olddotfiles/config/openbox 
echo "Creating symlinks"
obfiles="autostart menu.xml rc.xml"
for file in $obfiles; do
    ln -s $dotfiles/config/openbox/$file ~/.config/openbox/$file
done
