#!/bin/bash

#alias file 

# updating


alias update='sudo apt-get update && sudo apt-get upgrade'
alias distup='sudo apt-get update && sudo apt-get dist-upgrade'
alias windows='sudo mount -t ntfs /dev/sda1 /media/windows'

# ask before override

alias cp='cp -i'
alias mv='mv -i'

# ping 5 times
alias ping='ping -c 5'

# shutdown
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'

# memory leaks and debugging c
alias valgrind='valgrind --track-origins=yes'

# start gothic 2 notr
alias gothic='wine ~/.wine/drive_c/Program\ Files/Jowood/Gothic\ II/System/GothicStarter.exe'

# search on the internet in firefox
alias gog='surfraw google'

# start iftop on wireless
alias iftop='sudo iftop -i wlan0'

#watch rar videos + password
alias vid='~/scripts/video.sh'

# use vim as a pager
alias vless='/usr/share/vim/vim73/macros/less.sh'
