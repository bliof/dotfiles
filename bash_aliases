alias brake='bundle exec rake'
alias be='bundle exec'
alias xargs-vim='xargs bash -c '"'"'</dev/tty vim "$@"'"'"' ignoreme'

px() {
    QUERY=$(pgrep -d, $@) || return;
    ps uwp $QUERY
}
