#!/bin/bash

# Set the source directory (where your dotfiles are stored)
DOTFILES_DIR="$(pwd)"   # or replace with absolute path if you want

# List of files/folders to symlink
FILES=(
  .vimrc
  .zshrc
  .tmux.conf
  vim
  tmux
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
