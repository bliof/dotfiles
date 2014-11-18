#!/bin/bash
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

TERM='xterm-256color'
export EDITOR='vim'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

setup_color_prompt() {
    local red='\[\e[38;5;124m\]'
    local normal='\[\e[0m\]'
    local bold='\[\e[1m\]'

    PS1='${debian_chroot:+[$debian_chroot] }'"$bold\u$normal@$red$bold\h$normal:\w\$ "

    if [ $(command -v __git_ps1) ]; then
        PS1='$(__git_ps1 "(%s) ")'"$PS1"
    fi
}

setup_color_prompt

unset setup_color_prompt

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin
