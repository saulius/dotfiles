# completion
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# automatically enter directories without cd
setopt auto_cd

# use vim as the visual editor
export TERM=xterm-256color
export PATH="/usr/local/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin:/bin:$HOME/bin/"
export VISUAL=vim
export EDITOR=vim
export PAGER=more
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
export HISTSIZE=10000                  # lines of history to maintain memory
export SAVEHIST=5000                  # lines of history to maintain in history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information

alias less=less -rS
alias more=more -r
alias vim=nvim
alias flushdns="sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache"
alias ag=rg

autoload -U promptinit && promptinit
prompt redhat

bindkey -e

bindkey '^[[A' up-line-or-search                                                
bindkey '^[[B' down-line-or-search

# use bash wordchars
autoload -U select-word-style
select-word-style bash

# expand functions in the prompt
#setopt prompt_subst

# automatically pushd
setopt auto_pushd
export dirstacksize=5

# awesome cd movements from zshkit
setopt AUTOCD
setopt AUTOPUSHD PUSHDMINUS PUSHDSILENT PUSHDTOHOME
setopt cdablevars

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Enable extended globbing
setopt EXTENDED_GLOB

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=2
setopt GLOB_COMPLETE

setopt HIST_IGNORE_SPACE

alias oras="curl http://wttr.in/Vilnius"

function gitstats {
    git log --shortstat --author="$1" | grep -E "fil(e|es) changed" | awk '{files+=$1; inserted+=$4; deleted+=$6; delta+=$4-$6; ratio=deleted/inserted} END {printf "Commit stats:\n- Files changed (total)..  %s\n- Lines added (total)....  %s\n- Lines deleted (total)..  %s\n- Total lines (delta)....  %s\n- Add./Del. ratio (1:n)..  1 : %s\n", files, inserted, deleted, delta, ratio }' -
}

# COPYFILE_DISABLE to prevent several of the system-supplied programs (including tar) from giving special meaning to ._* archive members.
# https://superuser.com/questions/259703/get-mac-tar-to-stop-putting-filenames-in-tar-archives
export COPYFILE_DISABLE=1
