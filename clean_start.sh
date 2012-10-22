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


BASEDIR=$(dirname $0 | xargs readlink -f)
args=$(getopt f $*)
force_delete=false
if [[ $args =~ '-f' ]]; then
	force_delete=true
fi


function ask_for_confirmation() {
	read -p "$1 [y/n]: " -n 1 -r choice

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

function change_bashrc() {
	bash_file=~/.bashrc

	if ask_for_confirmation "Do you want to change $bash_file?"; then
		handle_existing "$bash_file"
		ln -s "$BASEDIR/bashrc" $bash_file
	fi
}

function change_tmux_conf() {
	tmux_file=~/.tmux.conf

	if ask_for_confirmation "Do you want to change $tmux_file?"; then
		handle_existing "$tmux_file"
		ln -s "$BASEDIR/tmux-conf" $tmux_file
	fi
}

function change_vimrc() {
	vimrc_file=~/.vimrc

	if ask_for_confirmation "Do you want to change $vimrc_file?"; then
		handle_existing "$vimrc_file"
		ln -s "$BASEDIR/vimrc" $vimrc_file
	fi
}

function change_vim() {
	vim_dir=~/.vim

	if ask_for_confirmation "Do you want to change $vim_dir?"; then
		handle_existing "$vim_dir"
		ln -s "$BASEDIR/vim" $vim_dir
	fi
}

function change_git_global_ignore() {
	if ask_for_confirmation "Do you want to change git's core.excludesfile?"; then
		git config --global core.excludesfile "$BASEDIR/git-global-ignore"
	fi
}

change_bashrc
change_tmux_conf
change_vimrc
change_vim
change_git_global_ignore

