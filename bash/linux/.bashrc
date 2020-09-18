#!/bin/bash

#export PATH="~/bin:~/.cargo/bin:$PATH"
export PATH="~/bin:$PATH"

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

alias rm='~/bin/trashit'
#need to have something that splits up mac, linux...
alias l.='ls -d .*'
alias ll='ls -la'
alias ls='ls -G --color=always'
alias vi='vim'

alias ..='cd ..'
alias ...='cd ../..'

set -o vi

#alias ack='ack-grep'

alias emacs='emacs -nw'

alias vpn='/opt/cisco/anyconnect/bin/vpn'

alias vim='vimx'

#for i3 terminal
export TERMINAL=/usr/bin/gnome-terminal

