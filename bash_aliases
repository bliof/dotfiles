alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ll='ls -l'
alias la='ls -a'

alias brake='bundle exec rake'
alias be='bundle exec'
alias xargs-vim='xargs bash -c '"'"'</dev/tty vim "$@"'"'"' ignoreme'

px() {
    QUERY=$(pgrep -d, $@) || return;
    ps uwp $QUERY
}
