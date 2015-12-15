#!/bin/bash

# change dir temporarily
CURRENT_DIR=$(pwd)
DOTFILES_DIR=$(dirname $0)
cd $DOTFILES_DIR
DOTFILES_DIR=$(pwd)

for ITEM in .??*
do
   # ignore pattern
   [[ "$ITEM" == *'.git' ]] && continue
   [[ "$ITEM" == *'.gitmodules' ]] && continue
   [[ "$ITEM" == *'.DS_Store' ]] && continue
   ln -snfv "$DOTFILES_DIR/$ITEM" "$HOME/$ITEM"
done

# revert current dir
cd $CURRENT_DIR

# guide message
echo 'Please complete setup to execute commands below.'
echo '$ git submodule init'
echo '$ git submodule update'
echo '$ cd ./.vim/bundle/vimproc'
echo '$ make'

