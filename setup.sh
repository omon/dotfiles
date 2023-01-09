#!/bin/zsh

# create symbolic link
dotfiles=(.zshrc .clang-format)
for file in "${dotfiles[@]}"; do
        ln -svf $file ~/
done
cp .gitconfig ~/.gitconfig