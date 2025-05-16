#!/bin/bash

SHELL := /bin/bash

echo "--[ Clonging repos"
git clone https://github.com/nalybuites-org/general.git ~/personal/general

echo "--[ Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

ln -s ~/personal/general/zsh/zshrc ~/.zshrc
ln -s ~/personal/general/zsh/p10k.zsh ~/.p10k.zsh

echo "--[ Installing vimrc"
ln -s ~/personal/general/vimrc ~/.vim
mkdir ~/.vim/autoload ~/.vim/backup ~/.vim/plugged

rm -f ~/.vimrc
ln -s ~/personal/general/vimrc/vimrc ~/.vimrc

echo "--[ Attempt setup of Vim plugins"
vim -c 'PlugInstall' \
    -c 'qa!'

# This has a bunch of depenedencies which may need to be resolved, specifically
# Vim compiled with Python3, python-dev, ruby-dev, golang, and Clang.
pushd ~/.vim/pluggd/YouCompleteMe
python3 install.py --all
popd

# This may require further compilation to get working.
pushd ~/.vim/pluggs/command-t
make
popd

echo "--[ Setting up Git dotfiles"
ln -s ~/personal/general/dotfiles/gitconfig ~/.gitconfig
ln -s ~/personal/general/dotfiles/gitignore ~/.gitignore_global

echo "--[ Done"
