#!/bin/sh

echo "[$0] Fetching the latest versions of git submodules vim plugins..."
git submodule init
git submodule update

echo "[$0] Setting up symbolic links for ~/.vim directory and ~/.vimrc file..."
VIMHOME="$HOME/.vim"
if [ -e "$VIMHOME" ]
then
  mv "$VIMHOME" "$VIMHOME.bak"
fi
ln -s "$PWD" "$VIMHOME"

VIMRC="$HOME/.vimrc"
if [ -e "$VIMRC" ]
then
  mv "$VIMRC" "$VIMRC.bak"
fi
ln -s "$PWD/vimrc" "$VIMRC"

# If the script runs more than once, a symlink could be created in the project root.
# We don't want this, so delete it.
EXTRA_SYMLINK='./.vim'
if [ -e "$EXTRA_SYMLINK" ]
then
  rm $EXTRA_SYMLINK
fi

echo "[$0] Setup completed succussfully."
