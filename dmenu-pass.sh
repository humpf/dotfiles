#!/bin/bash

passdir=~/.password-store

site=$(find $passdir -name "*.gpg" | awk -F \/ '{print $NF}' | sed "s/.gpg//"| dmenu)
pass -c $site
~/dotfiles/autotype.sh
