#!/bin/bash
######################################################################
# creates symlinks for the files in the repository in the
# default location of the dotfiles
#
# usage:
#      ./clean_start # this will create a copy of the existing files
#                      on the default locations
#      ./clean_start -f # this will delete them
#
#      In both cases you will be asked if you want to make
#      certain change.
#
######################################################################

BASEDIR=$(cd $(dirname $0); pwd -P)
args=$(getopt f $*)
force_delete=false
if [[ $args =~ '-f' ]]; then
    force_delete=true
fi

function ask_for_confirmation() {
    read -p "$1 [y/N]: " -n 1 -r choice

    if [[ $choice == "" ]]; then
        return 1
    fi

    echo
    if [[ $choice =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

function handle_existing() {
    if [[ -f $1 ]]; then
        if $force_delete; then
            rm "$1"
        else
            mv --backup=numbered "$1" "$1.old"
        fi
        return
    fi

    if [[ -d $1 ]]; then
        if ! $force_delete; then
            cp -r --backup=numbered "$1" "$1.old"
        fi
        rm -r "$1"
        return
    fi
}

function create_ln() {
    file=$1
    link=$2

    if ask_for_confirmation "Do you want to change $link?"; then
        handle_existing "$link"
        ln -s "$BASEDIR/$file" $link
    fi
}

function change_git_global_ignore() {
    if ask_for_confirmation "Do you want to change git's core.excludesfile?"; then
        git config --global core.excludesfile "$BASEDIR/git-global-ignore"
    fi
}

create_ln "bashrc" ~/.bashrc
create_ln "bash_aliases" ~/.bash_aliases
create_ln "tmux.conf" ~/.tmux.conf
create_ln "vimrc" ~/.vimrc
create_ln "vim" ~/.vim
create_ln "perltidyrc" ~/.perltidyrc
create_ln "githelpers" ~/.githelpers
create_ln "gitconfig" ~/.gitconfig

change_git_global_ignore
