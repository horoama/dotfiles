#!/bin/bash
DOT_FILES=(.vimrc .vim)

for file in ${DOT_FILES[@]}
do
    rm -rf $HOME/$file
    ln -s $HOME/dotfiles/$file $HOME/$file
    git clone https://github.com/gmarik/vundle.git ~/.vim/vundle.git
done
