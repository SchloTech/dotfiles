export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_profile
source $HOME/.api_keys
source $HOME/.aws_profile

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

eval "$(ssh-agent -s)"
#ssh-add .ssh/id_rsa
ssh-add ~/.ssh/id_ed25519

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

clear
