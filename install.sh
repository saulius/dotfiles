#!/usr/bin/env bash

# Install Homebrew
if test ! $(which brew); then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew bundle install --file=homebrew/Brewfile

brew cleanup 

# Automate? https://snitcher.dannorth.net/

stow git
stow nvim
stow tmux
stow zsh

# emacs
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
stow doom
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom autoloads
