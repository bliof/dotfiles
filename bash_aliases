alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'

alias ll='ls -l --color'
alias la='ls -a --color'
alias ls='ls --color'

alias brake='bundle exec rake'
alias be='bundle exec'
alias xargs-vim='xargs bash -c '"'"'</dev/tty vim "$@"'"'"' ignoreme'
alias ipad='xcrun instruments -w "iPad Air 2"'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias ff='ag --color-line-number "15" --color-match "106" --color-path "1;15"'

px() {
    QUERY=$(pgrep -d, $@) || return;
    ps uwp $QUERY
}
