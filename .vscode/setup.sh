#!/bin/bash
# ~/.vscode/setup.sh
# VSCode setup script

VSCODE_CONFIG_DIR=~/Library/Application\ Support/Code/User

# change dir temporarily
CURRENT_DIR=$(pwd)
DOTFILES_VSCODE_DIR=$(dirname $0)
cd $DOTFILES_VSCODE_DIR
DOTFILES_VSCODE_DIR=$(pwd)

if [ -d "$VSCODE_CONFIG_DIR" ]; then
  # Copy config files.
  for ITEM in settings.json keybindings.json snippets
  do
    if [ -e "$VSCODE_CONFIG_DIR/$ITEM" ]; then
      mv "$VSCODE_CONFIG_DIR/$ITEM" "$VSCODE_CONFIG_DIR/$ITEM.bak"
    fi
    ln -snfv "$DOTFILES_VSCODE_DIR/$ITEM" "$VSCODE_CONFIG_DIR/$ITEM"
  done

  # Install extensions.
  for EXTENSION in `cat $DOTFILES_VSCODE_DIR/extensions.txt`; do
    code --install-extension $EXTENSION --force
  done
fi

# revert current dir
cd $CURRENT_DIR

# guide message
echo
echo ' Setup succeeded.'
echo

