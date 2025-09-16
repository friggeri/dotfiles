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

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -U compinit; compinit
setopt MENU_COMPLETE
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' complete true
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*:rm:*' ignore-line yes

export HOMEBREW_NO_ENV_HINTS=TRUE

export PATH="$PATH:/Users/adrien/Library/Python/3.9/bin:/Library/TeX/texbin/:/Users/adrien/Library/Caches/.wasm-pack/.wasm-bindgen-cargo-install-0.2.100/bin"

eval "$(starship init zsh)"
export DRONE_SERVER=https://drone.frg.dev
export DRONE_TOKEN=JhiPTCWLliqjAif8TNV2Jqmbe1vqEuJV

# pnpm
export PNPM_HOME="/Users/adrien/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
