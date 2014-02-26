#!/bin/bash

passdir=~/.password-store

site=$(find $passdir -name "*.gpg" | sed "s#/home/arne/.password-store/##" | sed "s/.gpg//"| dmenu)
pass -c $site
~/dotfiles/autotype.sh
