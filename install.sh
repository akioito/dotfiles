#!/usr/bin/env bash
# install.sh

stow vim
curl -fLo ~/.vim/autoload/plug.vim          --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.config/nvim/autoload/plug.vim  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# End
