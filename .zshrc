export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="daveverwer"
export DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh
export PATH=/usr/local/share/npm/bin:/opt/local/bin:/opt/local/sbin:/Users/sg/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/texbin:/usr/X11/bin:/usr/local/sbin:/usr/sbin:/sbin

if [ -f `brew --prefix`/etc/autojump ]; then
  . `brew --prefix`/etc/autojump
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

function slocate {
  mdfind "kMDItemDisplayName == '$@'wc";
}

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

alias vim='/Applications/MacVim.App/Contents/MacOS/Vim'
alias mc='mc -b'

export EDITOR="vim"
export PAGER="most"

plugins=(git osx ruby brew gem github git-flow node npm svn rails3 rvm cap)
