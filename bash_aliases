alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -C'

alias ll='ls -l'
alias la='ls -a'
alias ls='ls'

alias brake='bundle exec rake'
alias be='bundle exec'
alias xargs-vim='xargs bash -c '"'"'</dev/tty vim "$@"'"'"' ignoreme'
alias ipad='open -a simulator --args -CurrentDeviceUDID 9570937E-44E2-4134-AB46-332DC6642C43'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias ff='ag --color-line-number "15" --color-match "106" --color-path "1;15"'
alias ctop='ctop -i'
alias v="bat --theme GitHub -p $@"
alias vv="bat --theme GitHub -p $@"

alias docker-console='docker run --interactive --tty --entrypoint=/bin/bash $@'

alias tapply='terraform apply my_plan && rm my_plan'
alias tget='terraform get -update'
alias tinit='rm -rf .terraform && terraform init'
alias tplan='terraform plan -out=my_plan '
alias tfmt='terraform fmt'

alias reka='rake'

px() {
    QUERY=$(pgrep -d, $@) || return;
    ps uwp $QUERY
}

fd() {
    if [ "${1:0:1}" = "-" ]; then
        find . $@
    else
        search=$1
        shift

        find . -name "*$search*" $@
    fi
}
