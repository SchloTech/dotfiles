
source $HOME/.zsh_profile
source $HOME/.api_keys
source $HOME/.aws_profile

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

eval "$(ssh-agent -s)"
ssh-add .ssh/id_rsa
#ssh-add ~/.ssh/id_ed25519

# Ignore Case Sensitivity for tab auto completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# NVM configuration 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

clear
