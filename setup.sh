#!/bin/bash
DOT_FILES=(.vimrc .vim .tmux.conf .gitconfig .zshrc)

for file in ${DOT_FILES[@]}
do
    rm -rf $HOME/$file
    ln -s $HOME/dotfiles/$file $HOME/$file
    git clone https://github.com/Shougo/dein.vim.git  $HOME/dotfiles/.vim/dein.vim
done
