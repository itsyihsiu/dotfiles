#!/usr/bin/env bash
set -e

# Set the source directory (where your dotfiles are stored)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Initialize and update git submodules
git -C "$SCRIPT_DIR" submodule update --init --recursive

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
    SOURCE="$SCRIPT_DIR/$file"

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
