set -o vi
set +o ignoreeof
set +o noclobber
set +o nounset
shopt -s cdable_vars
shopt -s histappend
#shopt -s checkhash

HISTSIZE=40960
FCEDIT=vi

function last_cmd_line {
    last_cmd=$(history 1 | cut -d ' ' -f4- | sed "s/ *$//g" | sed "s/^ *//g")
}

function git_branch_name {
    git_branch=$(git branch 2>/dev/null | grep "*" | cut -d ' ' -f2-)

    if [[ "${git_branch}" == "" ]]; then
        git_branch="n/a"
    fi

    git_branch=${git_branch}
}

function timer_start {
    timer_start=${timer_start:-$SECONDS}
}

function timer_end {
    timer_layout=""
    timer_cost=$(($SECONDS - $timer_start))
    if [ $timer_cost -ge 3600 ]; then
        timer_layout="$(($timer_cost / 3600))h"
        timer_cost=$(($timer_cost % 3600))
    fi
    if [ $timer_cost -ge 60 ]; then
        timer_layout="$timer_layout$(($timer_cost / 60))m"
        timer_cost=$(($timer_cost % 60))
    fi
    timer_layout="${timer_layout}${timer_cost}s"
    unset timer_start
}

trap 'timer_start' DEBUG

PROMPT_COMMAND='last_cmd_line; timer_end; git_branch_name'

PS1='\
\[\033[0;32m\]<\#/\!>\
\[\033[3;36m\]<$git_branch>\
\[\033[1;31m\]\u\
\[\033[0;34m\]^\
\[\033[0;33m\]\w\
\[\033[0;34m\]@\
\[\033[0;36m\]<\t \d>\
\[\033[1;31m\][$?]\
\[\033[1;34m\]*\j*\
\[\033[1;32m\][$timer_layout]\
\[\033[3;35m\]"$last_cmd"\
\[\033[00m\]\[\e[0;31m\]\n>> \
\[\e[m\]\[\e[0;00m\]\
'

PS2="\
\[\033[1;32m\]cont. >> \
\[\e[m\]\[\e[0;00m\]\
"

alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rmd='rm -rfv'
alias rm='rm -v'
alias mv='mv -v'
alias cp='cp -v'
alias mkdir='mkdir -v'
alias s='sudo'
alias gdb='gdb -q'
alias py='python'
alias pl='perl'
export EDITOR=vi

