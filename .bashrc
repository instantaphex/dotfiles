set -o vi

# Exports
export GOPATH=$HOME/go
export GO111MODULE=on
export CLICOLOR=1
export LSCOLORS=ExGxFxdxCxDxDxxbaDecac
export TERM="xterm-256color"
export PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/Cellar/opencv/4.1.1_2/lib/pkgconfig/
export XDG_CONFIG_HOME=$HOME/.config
export NVM_DIR="$HOME/.nvm"

# aliases
alias ll="ls -hal"
alias ls="ls -G"
alias vim="nvim"

# functions
mcd () {
  mkdir $1 && cd $1
}

cd () {
  builtin cd "$1" && ll 
}

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
