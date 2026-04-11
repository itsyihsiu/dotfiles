#!/usr/bin/env bash

# Set the source directory (where your dotfiles are stored)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$SCRIPT_DIR"

# Initialize and update git submodules
git submodule update --init --recursive

# List of files/folders to symlink
FILES=(
  .vimrc
  .zshrc
  .tmux.conf
  .vim
  .tmux
  .oh-my-zsh
)

for file in "${FILES[@]}"; do
  TARGET="$HOME/$file"
  SOURCE="$DOTFILES_DIR/$file"

  # Remove existing file/folder/link if it exists
  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    echo "Removing existing $TARGET"
    rm -rf "$TARGET"
  fi

  # Create the symlink
  echo "Linking $SOURCE → $TARGET"
  ln -s "$SOURCE" "$TARGET"
done

echo "All symlinks created successfully!"

# Exit if anything fails
set -e

# Check if zsh is installed
if ! command -v zsh >/dev/null 2>&1; then
  echo "zsh not found. Please install zsh and rerun this script."
  exit 1
fi

# Get the path to zsh
ZSH_PATH=$(command -v zsh)

# If current shell is not zsh, change it
if [ "$SHELL" != "$ZSH_PATH" ]; then
  echo "Changing default shell to zsh ($ZSH_PATH)..."
  chsh -s "$ZSH_PATH"
  echo "Default shell changed to zsh. Please log out and log back in."
else
  echo "Default shell is already zsh."
fi