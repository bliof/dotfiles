#!/bin/bash -e
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

BASEDIR="$(cd $(dirname $0); pwd -P)"
args="$(getopt fy $*)"
force_delete=false
force_yes=false
if [[ "$args" =~ '-f' ]]; then
    force_delete=true
fi
if [[ "$args" =~ '-y' ]]; then
    force_yes=true
fi

function ask_for_confirmation() {
    if $force_yes; then
        echo "$1 [y/N]: y"
        return 0
    fi

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
            mv "$1" "$1.old.$(date +%F)"
        fi
        return
    fi

    if [[ -d $1 ]]; then
        if ! $force_delete; then
            cp -r "$1" "$1.old.$(date +%F)"
        fi
        rm -r "$1"
        return
    fi
}

function create_ln() {
    file="$1"
    link="$2"
    link_dir="$(dirname $link)"

    if ask_for_confirmation "Do you want to change $link?"; then
        if [ ! -d "$link_dir" ]; then
            mkdir "$link_dir"
        fi

        handle_existing "$link"
        ln -s "$BASEDIR/$file" "$link"
    fi
}

function change_git_global_ignore() {
    if ask_for_confirmation "Do you want to change git's core.excludesfile?"; then
        git config --global core.excludesfile "$BASEDIR/git-global-ignore"
    fi
}

create_ln "bashrc" ~/.bashrc
create_ln "bash_aliases" ~/.bash_aliases
create_ln "tmux" ~/.tmux
create_ln "tmux.conf" ~/.tmux.conf
create_ln "vimrc" ~/.vimrc
create_ln "vim" ~/.vim
create_ln "config/nvim" ~/.config/nvim
create_ln "config/starship.toml" ~/.config/starship.toml
create_ln "perltidyrc" ~/.perltidyrc
create_ln "githelpers" ~/.githelpers
create_ln "gitconfig" ~/.gitconfig

change_git_global_ignore
