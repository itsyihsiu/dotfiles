export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# setup lang
export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# setup default editor
export EDITOR='vim'

# setup docker
export DOCKER_HOST=unix://${HOME}/.colima/default/docker.sock

# setup zsh hash
export WS_DIR="$HOME/ws"
hash -d ws="$WS_DIR"

cd() {
  if [[ $# -eq 1 && "$1" == "@ws" ]]; then
    builtin cd "$WS_DIR"
  else
    builtin cd "$@"
  fi
}

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# setup openjdk
export PATH="/usr/local/opt/openjdk@21/bin:$PATH"

alias la='ls -a'
alias ll='ls -lha'
