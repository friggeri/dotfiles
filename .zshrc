# Aliases
alias ls='ls -h'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias ls='ls --color'

alias less='less --quiet'

alias df='df --human-readable'
alias du='du --human-readable'

export EDITOR=code
export GIT_EDITOR="code --wait"

export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export PATH=$HOME/.local/bin:$PATH

autoload -U compinit; compinit
setopt MENU_COMPLETE
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' complete true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*:rm:*' ignore-line yes


eval "$(starship init zsh)"