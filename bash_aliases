alias open='xdg-open'
alias brake='bundle exec rake'
alias be='bundle exec'

px() {
    QUERY=$(pgrep -d, $@) || return;
    ps uwp $QUERY
}
