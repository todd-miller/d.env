#!/bin/bash
# install zsh package manager
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# remove configs
rm -rf $HOME/.config/lvim
rm $HOME/.zshrc

# clone tmux package manager & dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/todd-miller/dotfiles

# symbolic link gen w/ stow
stow -d $HOME/dotfiles/ lvim zsh z tmux

# install pyenv
curl https://pyenv.run | bash

# set better tmux lang
export LANG=en_US.UTF-8

/bin/zsh

