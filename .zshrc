export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile

export EDITOR='nvim'
export VISUAL='nvim'

export PATH="$HOME/.cargo/bin:$PATH"
