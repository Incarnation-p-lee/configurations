# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR=vi
export PAGER="less"
export LESS="-F -X -R"
export ZSH="/home/pli/.oh-my-zsh"
export LANG=en_US.UTF-8

# ZSH_THEME="fino-time"
# ZSH_THEME="robbyrussell"
# ZSH_THEME="jonathan"
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git-prompt zsh-vi-mode timer zsh-syntax-highlighting)
plugins+=(colored-man-pages colorize zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
export PATH="/home/pli/bin:$PATH"
