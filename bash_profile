SHELL=/bin/bash
EDITOR=/usr/bin/vi

set -o vi

set +o ignoreeof
set +o noclobber
set +o nounset
shopt -s cdable_vars
#shopt -s checkhash

HISTSIZE=40960
HISTTIMEFORMAT="%Y/%m/%d %T "
FCEDIT=vi

PS1="\
\[\033[0;32m\]<\#>\
\[\033[0;36m\]\u\
\[\033[0;35m\][\!]\
\[\033[0;34m\]@\
\[\033[0;33m\]\w\
\[\033[1;34m\]*\j*\
\[\033[1;36m\]#\d^\t#\
\[\033[00m\]\[\e[0;31m\]\n>> \
\[\e[m\]\[\e[0;00m\]\
"
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

PATH="/bin:/usr/bin:/sbin/:/usr/sbin:/usr/local/bin"
PATH=$PATH":/opt/bin/:/opt/intel/vtune_amplifier_xe/bin64/:/home/pli/intel/sep_3.16_linux_414852/bin64/"
PATH=$PATH":/home/pli/Archive/package/android-ndk-r10d/"
PATH=$PATH":/home/pli/Archive/package/gcc-linaro-aarch64-linux-gnu-4.8-2014.04_linux/bin"
#CDPATH=.:~:/etc:/var:~/workspace
LD_LIBRARY_PATH="/lib64/usr/:/usr/local/lib:/home/pli/intel/sep_3.16_linux_414852/bin64/"

#export CDPATH
#export LC_ALL=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LANG=
#export LC_ALL=
export LD_LIBRARY_PATH
export JAVA_HOME=/usr/bin/jdk1.6.0_32
export PATH
export SVN_EDITOR=vi
export HISTCONTROL=ignoredups
export HISTCONTROL=erasedups
#Enable some services
#sshd

#Release information
lsb_release -a
umask 022

cmatrix  -b -C cyan -u 6

#export LANG=en_GB.ISO-8859-1@euro
uname -a
date

#Enable core dump
#echo "----- ULIMIT -----"
ulimit -c unlimited
ulimit -a
