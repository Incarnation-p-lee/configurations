export EDITOR=vi
export ZSH="/home/pli/.oh-my-zsh"
export LANG=en_US.UTF-8

# ZSH_THEME="fino-time"
# ZSH_THEME="robbyrussell"
ZSH_THEME="jonathan"

plugins=(git-prompt zsh-vi-mode timer zsh-syntax-highlighting)
plugins+=(colored-man-pages colorize zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
