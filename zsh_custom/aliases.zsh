
# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

# custom aliases

# updating

alias update='sudo apt-get update && sudo apt-get upgrade'
alias distup='sudo apt-get update && sudo apt-get dist-upgrade'
alias windows='sudo mount -t ntfs /dev/sda1 /media/windows'

# apt-get aliases
alias ai='sudo apt-get install'
alias as='apt-cache search'
alias ap='sudo apt-get purge'
alias ar='sudo apt-get remove'
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

# make a backup copy with .bak
ba() {
    cp $1{,.bak}
}
    
# source config files
alias zs='source ~/.zshrc'
alias ts='tmux source-file ~/.tmux.conf'

# change config files
alias vconky='vim ~/.conkyrc'
alias vurls='vim ~/.newsbeuter/urls'
alias vawe='vim ~/.config/awesome/rc.lua'
