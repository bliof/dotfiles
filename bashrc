#!/bin/bash
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GPG_TTY=$(tty)

[ -e ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm
[ -e ~/.phpbrew/bashrc ]  && . ~/.phpbrew/bashrc

export GOPATH=$HOME/go
PATH="$PATH:$GOPATH/bin"
PATH="/usr/local/bin:$PATH"
PATH="$PATH:/usr/local/sbin"
PATH="$PATH:$HOME/.rvm/bin"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Ignore bash completion of hosts in /etc/hosts
export COMP_KNOWN_HOSTS_WITH_HOSTFILE=''

TERM='xterm-256color'
export EDITOR='vim'
export COLORSCHEME='light'
export LANG='en'

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_tokens ] && . ~/.bash_tokens
[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && . /usr/share/git-core/contrib/completion/git-prompt.sh
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
[ -f ~/.bash_credentials ]  && . ~/.bash_credentials

_git_review ()
{
    __git_complete_refs
}

# add hook for further expansions
_git_known_expansions ()
{
    # list aliases
    echo $(git config --name-only --get-regexp alias | sed 's/alias\.//g')
}

# modify command list to include expansions
__git_commands () {
    if test -n "${GIT_TESTING_COMMAND_COMPLETION:-}"
    then
        printf "%s" "${GIT_TESTING_COMMAND_COMPLETION}"
    else
        echo "$(git help -a|egrep '^  [a-zA-Z0-9]') $(_git_known_expansions)"
    fi
}

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
