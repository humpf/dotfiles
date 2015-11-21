# zsh aliases
# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'
alias ..='cd ..'

# Super user
alias _='sudo'

#alias g='grep -in'

# Show history
alias history='fc -l 1'

# List direcory contents
alias ls='ls --color=auto'
alias lsa='ls -lah'
alias la='ls -al'
alias ll='ls -l'
alias sl=ls # often screw this up

alias afind='ack-grep -il'

# custom aliases

# updating

alias update='sudo apt-get update && sudo apt-get upgrade'
alias distup='sudo apt-get update && sudo apt-get dist-upgrade'
alias windows='sudo mount -t ntfs /dev/sda1 /media/windows'

# apt-get aliases
#alias ai='sudo apt-get install'
#alias as='apt-cache search'
#alias ap='sudo apt-get purge'
#alias ar='sudo apt-get remove'
# ask before override

#alias cp='cp -i'
alias mv='mv -i'

# ping 5 times
alias ping='ping -c 5'

# shutdown
alias shutdown='sudo shutdown -h now'
alias reboot='sudo reboot'

# memory leaks and debugging c
#alias valgrind='valgrind --track-origins=yes'

# start gothic 2 notr
alias gothic='wine ~/.wine/drive_c/Program\ Files/Jowood/Gothic\ II/System/GothicStarter.exe'

# start mount and blade
alias mnb='wine ~/.wine/drive_c/Program\ Files/Mount\&Blade\ Warband/mb_warband.exe'

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

# cache home dir
alias homecache='~/dotfiles/caching.sh'
# change config files
alias vconky='vim ~/.conkyrc'
alias vurls='vim ~/.newsbeuter/urls'
alias vtmux='vim ~/.tmux.conf'
alias valiases='vim ~/dotfiles/aliases.zsh'
alias vvim='vim ~/.vim/vimrc'
alias vawesome='vim ~/.config/awesome/rc.lua'
alias vluakit='vim ~/.config/luakit/rc.lua'
alias vi3='vim ~/.i3/config'
alias viblocks='vim ~/.i3blocks.conf'

# emacs in terminal
alias enw='emacs -nw'
# fasd quick opening
alias v='f -e vim'
alias m='f -e mplayer'

# uni mail
alias muttuni='mutt -F ~/.mutt/muttrc-uni'

# mountie script
alias mountie='python3 ~/Compile/mountie/mountie.py'

# HDMI left of LVDS
alias hdleft='xrandr --output HDMI1 --auto --left-of LVDS1 && mv ~/.asoundhdmi ~/.asoundrc'
alias hdright='xrandr --output HDMI1 --auto --right-of LVDS1 && mv ~/.asoundhdmi ~/.asoundrc'
# HDMI turn off
alias hdoff='xrandr --output HDMI1 --off && mv ~/.asoundrc ~/.asoundhdmi'

alias jbstream='mpv --fs --cache=2048 rtmp://videocdn-us.geocdn.scaleengine.net/jblive/live/jblive.stream'
