#!/usr/bin/env bash

# Install Homebrew
if test ! $(which brew); then
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "Installing system packages"
brew bundle install --file=homebrew/Brewfile

brew cleanup 

# Automate? https://snitcher.dannorth.net/

stow git
stow nvim
stow tmux
stow zsh

# emacs
echo "Emacs configuration"
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
stow doom
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom autoloads

echo "Turning zsh into acceptable shell"
if ! sudo cat /etc/shells | grep "$(brew --prefix zsh)"; then
    sudo sh -c "echo '$(brew --prefix zsh)/bin/zsh' >> /etc/shells"
fi
if ! dscl . -read ~/ UserShell | grep "zsh"; then
    chsh -s $(brew --prefix zsh)/bin/zsh
fi

# tmux
echo "configuring tmux"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# rust
if ! test cargo; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
