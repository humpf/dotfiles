#!/bin/bash

# installer script for moving dotfiles

dir=~/dotfiles
configdir=~/.config
olddir=~/old_dotfiles
files="bashrc bash_aliases vimrc vim zshrc conkyrc tmux.conf Xdefaults gitconfig vimperatorrc" # list of dotfiles/dotfolders

configfiles="zathura awesome luakit"

# create backup of old
echo "creating folder"
mkdir -p $olddir
echo "...done"


cd $dir

# move existings to olddir and symlink new

for file in $files; do
    echo "copy old dotfiles"
    mv ~/.$file ~/old_dotfiles/
    echo "..done"
    echo "symlinking new dotfiles"
    ln -s $dir/$file ~/.$file
    echo "done"
done

for conf in $configfiles; do
    echo "copy old config files"
    mv $configdir/$conf ~/old_dotfiles
    echo "...done"
    echo "symlinking new config files"
    ln -s $dir/$conf $configdir/$conf
    echo "done"
done
