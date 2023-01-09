#!/bin/zsh

# create symbolic link
dotfiles=(.zshrc .clang-format)
for file in "${dotfiles[@]}"; do
        ln -sf `pwd`/$file ~/
done
cp .gitconfig ~/.gitconfig