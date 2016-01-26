#!/bin/bash

echo "--[ Clonging repos"
git clone https://github.com/nalybuites/general.git ~/personal/general

echo "--[ Installing vimrc"
sh -c "$(curl -fsSL https://raw.github.com/asweeney86/vimrc/master/install.sh)"
pushd ~/personal/general/vimrc/bundle/Command-T/ruby/command-t
ruby extconf.rb
make
popd
pushd ~/personal/general/vimrc/bundle/YouCompleteMe
./install.py --clang-completer
popd

echo "--[ Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "--[ Setting up symlinks"
ln -s ~/personal/general/dotfiles/gitconfig ~/.gitconfig
ln -s ~/personal/general/zsh/themes/topbar.zsh-theme ~/.oh-my-zsh/themes/topbar.zsh-theme
ln -s ~/personal/general/zsh/zshrc ~/.zshrc
rm -f ~/.vimrc
ln -s ~/personal/general/vimrc ~/.vimrc

echo "--[ Done"
