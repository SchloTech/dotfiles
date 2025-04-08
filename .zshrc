
source $HOME/.zsh_profile
source $HOME/.api_keys

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

eval "$(ssh-agent -s)"
ssh-add .ssh/id_rsa

clear
