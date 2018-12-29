#!/bin/bash
# install.sh

cd ~
mkdir .vim
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/gvimrc .gvimrc
cp -r dotfiles/mybundle .vim/mybundle
# curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh # Neobundle
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s /Applications/MacVim.app/Contents/bin/mvim /usr/local/bin/mvim

