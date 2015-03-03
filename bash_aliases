alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'

alias ll='ls -l'
alias la='ls -a'

alias brake='bundle exec rake'
alias be='bundle exec'
alias xargs-vim='xargs bash -c '"'"'</dev/tty vim "$@"'"'"' ignoreme'
alias iphone='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

px() {
    QUERY=$(pgrep -d, $@) || return;
    ps uwp $QUERY
}
