#!/bin/sh

echo "\n"
echo "Fetching the latest versions of git submodules vim plugins..."
echo "\n"
git submodule init
git submodule update

echo "\n"
echo "Setting up symbolic links for ~/.vim directory and ~/.vimrc file..."
echo "\n"
mv "$HOME/.vim" "$HOME/.vim.bak"
mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
ln -s "$PWD" "$HOME"/.vim
ln -s "$PWD/vimrc" "$HOME/.vimrc"
# If the script runs more than once, a symlink could be created in the project root.
# We don't want this, so delete it.
rm ./.vim
