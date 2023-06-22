#!/bin/bash

git clone https://github.com/todd-miller/dotfiles
rm -rf $HOME/.config/lvim
stow -d $HOME/dotfiles/ lvim zsh z 
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
rm $HOME/.zshrc
stow -d $HOME/dotfiles/ zsh  

/bin/zsh

