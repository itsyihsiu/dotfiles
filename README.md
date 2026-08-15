# dotfiles

```bash
git clone https://github.com/itsyihsiu/dotfiles $HOME/.dotfiles
$HOME/.dotfiles/install.sh
```

## config files

- $HOME/.zshrc
- $HOME/.vimrc
- $HOME/.vim
- $HOME/.tmux.conf
- $HOME/.tmux

## zshrc

- oh-my-zsh

```
git clone https://github.com/ohmyzsh/ohmyzsh.git .oh-my-zsh
```

`.zshrc`

```
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
```

## vim

Run `:PlugInstall` to install plugins.

brew install universal-ctags
brew install the_silver_searcher

### Plugins

1. nerdcommenter
2. nerdtree
3. vim-gitgutter
4. iceberg (colorscheme)

## tmux

- nord-tmux

### Installation

```
git clone https://github.com/nordtheme/tmux.git
mkdir ~/.tmux
mv tmux/nord.tmux ~/.tmux
```

.tmux.config
```
run-shell "~/.tmux/nord.tmux"
```
