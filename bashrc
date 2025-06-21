#!/bin/bash
export BASH_SILENCE_DEPRECATION_WARNING=1
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GPG_TTY=$(tty)

[ -e ~/.rvm/scripts/rvm ] && . ~/.rvm/scripts/rvm
[ -e ~/.phpbrew/bashrc ]  && . ~/.phpbrew/bashrc
[ -e /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

export GOPATH=$HOME/go
PATH="$GOPATH/bin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="/usr/local/sbin:$PATH"
PATH="$HOME/.rvm/bin:$PATH"
PATH="/opt/homebrew/opt/libpq/bin:$PATH"
PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export JAVA_HOME=/opt/homebrew/Cellar/openjdk/23.0.2/libexec/openjdk.jdk/Contents/Home

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Ignore bash completion of hosts in /etc/hosts
export COMP_KNOWN_HOSTS_WITH_HOSTFILE=''

TERM='xterm-256color'
export EDITOR='nvim'
alias vim="nvim"
profile=`echo $ITERM_PROFILE | tr '[:upper:]' '[:lower:]'`
if [[ "$profile" == *"light"* ]]; then
    export COLORSCHEME='light'
else
    export COLORSCHEME='dark'
fi
export CLICOLOR=1
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
command -v brew &> /dev/null && [ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
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

eval "$(starship init bash)"
