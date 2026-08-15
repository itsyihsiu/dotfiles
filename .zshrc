# setup oh-my-zsh
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

# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# setup openjdk
export PATH="/usr/local/opt/openjdk@21/bin:$PATH"

# setup aliases
alias la='ls -a'
alias ll='ls -lha'
alias lh='ls -lh'

# setup named directories

typeset -A dirs

dirs=(
    ws "$HOME/ws"
    work "$HOME/.local/notes/work"
    life "$HOME/.local/notes/life"
)

for name dir in ${(kv)dirs}; do
    hash -d $name="$dir"
done

cd() {
    if (( $# == 1 )) && [[ "$1" == @* ]]; then
        local name="${1#@}"
        local target="${dirs[$name]}"

        if [[ -n "$target" ]]; then
            builtin cd "$target"
        else
            builtin cd "$@"
        fi
    else
        builtin cd "$@"
    fi && ls
}

# cd() {
#     if [[ $# -eq 1 && "$1" == "@ws" ]]; then
#         builtin cd "$HOME/ws"
#     else
#         builtin cd "$@"
#     fi && ls
# }