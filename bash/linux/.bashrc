
export PATH="$PATH":~/bin

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

alias rm='~/bin/trashit'
#need to have something that splits up mac, linux...
alias l.='ls -d .*'
alias ll='ls -la'
alias ls='ls -G'
alias vi='vim'

alias ..='cd ..'
alias ...='cd ../..'

set -o vi
