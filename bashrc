#!/bin/bash
source $HOME/.rvm/scripts/rvm

export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin
PATH=$PATH:/usr/local/sbin

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#export PATH="$HOME/.cargo/bin:$PATH"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

TERM='xterm-256color'
export EDITOR='vim'
export COLORSCHEME='dark'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=2000000

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi


setup_color_prompt() {
    local blue='\[\e[38;5;33m\]'
    local normal='\[\e[0m\]'
    local bold='\[\e[1m\]'

    PS1='${debian_chroot:+[$debian_chroot] }'"$bold\u$normal@$blue$bold\h$normal:\w\$ "

    if [ $(command -v __git_ps1) ]; then
        PS1='$(__git_ps1 "(%s) ")'"$PS1"
    fi
}

setup_color_prompt

unset setup_color_prompt
