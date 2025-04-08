export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile
source $HOME/.api_keys

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(ssh-agent -s)"
ssh-add .ssh/id_rsa

clear