#!/bin/bash

# installer script for moving dotfiles

dir=~/dotfiles
configdir=~/.config
files="bashrc vimrc vim zshrc conkyrc tmux.conf Xdefaults newsbeuter" # list of dotfiles/dotfolders

configfiles="zathura awesome luakit"

cd $dir
#symlink new

for file in $files; do
    echo "symlinking new dotfiles"
    ln -s $dir/$file ~/.$file
    echo "done"
done

for conf in $configfiles; do
    echo "symlinking new config files"
    ln -s $dir/$conf $configdir/$conf
    echo "done"
done
