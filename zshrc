# The following lines were added by compinstall

autoload -U compinit
compinit

zstyle ':completion:*' menu select
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# browser
export BROWSER=firefox
# editor vim
export EDITOR=vim
# colors
autoload -U colors && colors
# vi mode
bindkey -v
# sourcing git from oh-my
source ~/dotfiles/completion.zsh
source ~/dotfiles/correction.zsh
# sourcing alias files
source ~/dotfiles/aliases.zsh
source ~/dotfiles/alias_suffix.zsh

# fasd initialization
eval "$(fasd --init auto)"

# vi-mode indicator

function zle-line-init zle-keymap-select {
    local vicmd="%{$fg[green]%}<<<<%{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/${vicmd}}/(main|viins)/}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# git prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats "%{$fg[green]%}%b%{$reset_color%}%u "
zstyle ':vcs_info:*' unstagedstr '%F{11}⚡'
precmd() {
    vcs_info
}
setopt prompt_subst
PROMPT='%{$fg[magenta]%}%n%{$reset_color%}%{$fg[red]%}:%{$reset_color%}%{$fg[cyan]%}%0~%{$reset_color%}%{$fg[red]%}|%{$reset_color%}${vcs_info_msg_0_}%{$fg[cyan]%}⇒%{$reset_color%}  '
