# suffix aliases (zsh only)

# for opening programs in background
back() {
    "$@" </dev/null &>/dev/null &
}

alias -s pdf='back zathura'

alias -s {txt, .c, conf, tex, rc}=vim
