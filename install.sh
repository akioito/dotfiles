#!/bin/bash
# install.sh

cd ~
git clone https://github.com/akioito/dotfiles.git
mkdir .vim
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/gvimrc .gvimrc
cp -r dotfiles/mybundle .vim/mybundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh 
ln -s /Applications/MacVim.app/Contents/bin/mvim /usr/local/bin/mvim

